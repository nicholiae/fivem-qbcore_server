local QBCore = exports['qb-core']:GetCoreObject()

-- Furniture storage
local DeployedFurniture = {}
local BreakInCooldowns = {}

-- Helper Functions
local function DebugPrint(message)
    if Config.Debug then
        print('[QBContainerInventory-Furniture] ' .. message)
    end
end

local function SendNotification(source, message, type)
    if Config.Notifications.type == 'qb' then
        TriggerClientEvent('QBCore:Notify', source, message, type)
    elseif Config.Notifications.type == 'ox' then
        TriggerClientEvent('ox_lib:notify', source, {
            description = message,
            type = type
        })
    end
end

-- Load deployed furniture from database
CreateThread(function()
    MySQL.ready(function()
        local result = MySQL.query.await('SELECT * FROM deployed_furniture')
        if result then
            for _, furniture in ipairs(result) do
                DeployedFurniture[furniture.furniture_id] = {
                    id = furniture.furniture_id,
                    type = furniture.furniture_type,
                    owner = furniture.owner,
                    coords = json.decode(furniture.coords),
                    data = json.decode(furniture.data or '{}'),
                    created = furniture.created_at
                }
            end
            DebugPrint('Loaded ' .. #result .. ' deployed furniture from database')
            
            -- Sync to all clients
            TriggerClientEvent('qb-containerinventory:client:SyncFurniture', -1, DeployedFurniture)
        end
    end)
end)

-- Register backpack items
for itemName, _ in pairs(Config.Furniture) do
	QBCore.Functions.CreateUseableItem(itemName, function(source, item)
		TriggerClientEvent('qb-containerinventory:client:UseFurniture', source, itemName)
	end)
end

-- Check if player owns house
local function PlayerOwnsHouse(citizenid, houseId)
    local result = MySQL.query.await('SELECT * FROM player_houses WHERE citizenid = ? AND house = ?', {citizenid, houseId})
    return result and #result > 0
end

-- Get house location
local function GetHouseLocation(houseId)
    local result = MySQL.query.await('SELECT * FROM houselocations WHERE name = ?', {houseId})
    if result and #result > 0 then
        local coords = json.decode(result[1].coords)
        return vector3(coords.enter.x, coords.enter.y, coords.enter.z)
    end
    return nil
end

-- Check if location is within house range
local function IsWithinHouseRange(coords, houseCoords)
    if not houseCoords then return false end
    local distance = #(coords - houseCoords)
    return distance <= Config.HouseDeployment.maxDistance
end

-- Count furniture in house
local function CountHouseFurniture(houseId)
    local count = 0
    for _, furniture in pairs(DeployedFurniture) do
        if furniture.house == houseId then
            count = count + 1
        end
    end
    return count
end

-- FIX #4: Generate furniture ID using same format as wallets/backpacks
-- Format: itemName_citizenid_number
local function GenerateFurnitureId(citizenid, itemName)
    DebugPrint('Generating furniture ID for ' .. itemName .. ' owned by ' .. citizenid)
    
    -- Use a loop to handle race conditions by trying sequential numbers
    local maxAttempts = 10
    local containerNumber = 1
    local furnitureId = nil
    local success = false
    
    while not success and containerNumber <= maxAttempts do
        -- Generate furniture ID with current number
        furnitureId = itemName .. '_' .. citizenid .. '_' .. containerNumber
        
        DebugPrint('Attempting furniture ID: ' .. furnitureId)
        
        -- Check if this ID already exists in deployed_furniture
        local existing = MySQL.query.await(
            'SELECT furniture_id FROM deployed_furniture WHERE furniture_id = ?',
            {furnitureId}
        )
        
        if not existing or #existing == 0 then
            -- ID is available
            success = true
            DebugPrint('Furniture ID available: ' .. furnitureId)
        else
            -- ID already exists, try next number
            DebugPrint('Furniture ID collision, trying next number: ' .. (containerNumber + 1))
            containerNumber = containerNumber + 1
        end
    end
    
    if not success then
        DebugPrint('ERROR: Failed to generate furniture ID after ' .. maxAttempts .. ' attempts')
        return nil
    end
    
    return furnitureId
end

-- Deploy furniture
RegisterNetEvent('qb-containerinventory:server:DeployFurniture', function(itemName, coords, heading, houseId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
    local furnitureConfig = Config.Furniture[itemName]
    if not furnitureConfig then
        SendNotification(src, 'Invalid furniture item', 'error')
        return
    end
    
    -- Check if player has the item
    local item = Player.Functions.GetItemByName(itemName)
    if not item then
        SendNotification(src, 'You don\'t have this furniture item', 'error')
        return
    end
    
    -- Validate house ownership if required
    if Config.HouseDeployment.requireOwnership then
        if not houseId then
            SendNotification(src, 'You must be in a house to deploy furniture', 'error')
            return
        end
        
        if not PlayerOwnsHouse(Player.PlayerData.citizenid, houseId) then
            SendNotification(src, 'You don\'t own this house!', 'error')
            return
        end
        
        -- Check house location and distance
        local houseCoords = GetHouseLocation(houseId)
        if not IsWithinHouseRange(coords, houseCoords) then
            SendNotification(src, 'You must deploy furniture within your house area!', 'error')
            return
        end
        
        -- Check furniture limit
        local furnitureCount = CountHouseFurniture(houseId)
        if furnitureCount >= Config.HouseDeployment.maxFurniturePerHouse then
            SendNotification(src, 'Maximum furniture limit reached for this house!', 'error')
            return
        end
    end
    
    -- FIX #4: Generate unique furniture ID using new format
    local furnitureId = GenerateFurnitureId(Player.PlayerData.citizenid, itemName)
    
    if not furnitureId then
        SendNotification(src, 'Failed to generate furniture ID. Please try again.', 'error')
        return
    end
    
    -- Remove item from inventory
    if not Player.Functions.RemoveItem(itemName, 1) then
        SendNotification(src, 'Failed to remove furniture item', 'error')
        return
    end
	
    local cid = Player.PlayerData.citizenid
	print(cid)
	
    -- Create furniture data
    local furnitureData = {
        id = furnitureId,
        type = itemName,
        owner = Player.PlayerData.citizenid,
        coords = {x = coords.x, y = coords.y, z = coords.z, h = heading},
        house = houseId,
        data = {
            maxweight = furnitureConfig.maxWeight,
            slots = furnitureConfig.slots,
            model = furnitureConfig.model
        },
        created = os.time()
    }
    
    DeployedFurniture[furnitureId] = furnitureData
    
    -- FIX #2: Use transaction-safe insert for deployed_furniture
    local deployResult = MySQL.insert.await(
        'INSERT INTO deployed_furniture (furniture_id, furniture_type, owner, coords, data, created_at) VALUES (?, ?, ?, ?, ?, ?)',
        {furnitureId, itemName, cid, json.encode(furnitureData.coords), json.encode(furnitureData.data), furnitureData.created}
    )
    
    if not deployResult then
        DebugPrint('ERROR: Failed to insert into deployed_furniture table')
        -- Rollback: Give item back
        Player.Functions.AddItem(itemName, 1)
        DeployedFurniture[furnitureId] = nil
        SendNotification(src, 'Failed to deploy furniture. Please try again.', 'error')
        return
    end
    
    -- Create container inventory with new schema
    -- Use furniture_id as container_id (now in same format as wallets/backpacks)
    local containerData = {
        maxweight = furnitureConfig.maxWeight,
        slots = furnitureConfig.slots
    }
    
    local containerResult = MySQL.insert.await(
        'INSERT INTO container_inventories (container_id, citizenid, item_name, container_type, data) VALUES (?, ?, ?, ?, ?)',
        {furnitureId, Player.PlayerData.citizenid, itemName, 'furniture', json.encode(containerData)}
    )
    
    if not containerResult then
        DebugPrint('ERROR: Failed to insert into container_inventories table')
        -- Rollback: Delete from deployed_furniture and give item back
        MySQL.execute('DELETE FROM deployed_furniture WHERE furniture_id = ?', {furnitureId})
        Player.Functions.AddItem(itemName, 1)
        DeployedFurniture[furnitureId] = nil
        SendNotification(src, 'Failed to create furniture container. Please try again.', 'error')
        return
    end
    
    -- FIX #3: Verify furniture was created successfully
    local verifyFurniture = MySQL.query.await(
        'SELECT * FROM deployed_furniture WHERE furniture_id = ?',
        {furnitureId}
    )
    
    local verifyContainer = MySQL.query.await(
        'SELECT * FROM container_inventories WHERE container_id = ?',
        {furnitureId}
    )
    
    if verifyFurniture and #verifyFurniture > 0 and verifyContainer and #verifyContainer > 0 then
        DebugPrint('✓ VERIFICATION SUCCESS: Furniture and container created successfully')
    else
        DebugPrint('✗ VERIFICATION FAILED: Furniture or container not found in database!')
        -- Rollback everything
        MySQL.execute('DELETE FROM deployed_furniture WHERE furniture_id = ?', {furnitureId})
        MySQL.execute('DELETE FROM container_inventories WHERE container_id = ?', {furnitureId})
        Player.Functions.AddItem(itemName, 1)
        DeployedFurniture[furnitureId] = nil
        SendNotification(src, 'Failed to verify furniture deployment. Please try again.', 'error')
        return
    end
    
    -- Sync to all clients
    TriggerClientEvent('qb-containerinventory:client:SyncFurniture', -1, DeployedFurniture)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], 'remove')
    
    SendNotification(src, 'Furniture deployed successfully!', 'success')
    DebugPrint('Player ' .. src .. ' deployed furniture: ' .. furnitureId)
end)

-- Open furniture storage
RegisterNetEvent('qb-containerinventory:server:OpenFurniture', function(furnitureId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
    local furniture = DeployedFurniture[furnitureId]
    if not furniture then
        SendNotification(src, 'Furniture not found', 'error')
        return
    end
    
    -- Get furniture config
    local furnitureConfig = Config.Furniture[furniture.type]
    if not furnitureConfig then
        SendNotification(src, 'Invalid furniture type', 'error')
        return
    end
    
    -- Open inventory using qb-inventory export
    -- Use furniture_id as container_id
    exports['qb-inventory']:OpenInventory(src, furnitureId, {
        maxweight = furnitureConfig.maxWeight,
        slots = furnitureConfig.slots,
        label = furnitureConfig.label
    })
    
    DebugPrint('Player ' .. src .. ' opened furniture: ' .. furnitureId)
end)

-- Pick up furniture
RegisterNetEvent('qb-containerinventory:server:PickupFurniture', function(furnitureId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
    local furniture = DeployedFurniture[furnitureId]
    if not furniture then
        SendNotification(src, 'Furniture not found', 'error')
        return
    end
    
    -- Check ownership
    if furniture.owner ~= Player.PlayerData.citizenid then
        SendNotification(src, 'You don\'t own this furniture!', 'error')
        return
    end
    
    -- Check if furniture has items
    local result = MySQL.query.await('SELECT * FROM container_inventories WHERE container_id = ?', {furnitureId})
    if result and #result > 0 then
        local containerData = json.decode(result[1].data or '{}')
        -- Check if container has items (this would need QB-Inventory integration)
        -- For now, we'll allow pickup regardless
    end
    
    -- Give item back to player
    local furnitureConfig = Config.Furniture[furniture.type]
    if Player.Functions.AddItem(furniture.type, 1) then
        -- Remove from database
        MySQL.execute('DELETE FROM deployed_furniture WHERE furniture_id = ?', {furnitureId})
        MySQL.execute('DELETE FROM container_inventories WHERE container_id = ?', {furnitureId})
        
        -- Remove from memory
        DeployedFurniture[furnitureId] = nil
        
        -- Sync to all clients
        TriggerClientEvent('qb-containerinventory:client:SyncFurniture', -1, DeployedFurniture)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[furniture.type], 'add')
        
        SendNotification(src, 'Furniture picked up!', 'success')
        DebugPrint('Player ' .. src .. ' picked up furniture: ' .. furnitureId)
    else
        SendNotification(src, 'Not enough inventory space!', 'error')
    end
end)

-- Break-in system
RegisterNetEvent('qb-containerinventory:server:AttemptBreakIn', function(furnitureId, itemName)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
    if not Config.BreakIn.enabled then
        SendNotification(src, 'Break-ins are disabled', 'error')
        return
    end
    
    local furniture = DeployedFurniture[furnitureId]
    if not furniture then
        SendNotification(src, 'Furniture not found', 'error')
        return
    end
    
    -- Check if player owns the furniture
    if furniture.owner == Player.PlayerData.citizenid then
        SendNotification(src, 'You can\'t break into your own furniture!', 'error')
        return
    end
    
    -- Check cooldown
    if BreakInCooldowns[src] and (os.time() - BreakInCooldowns[src]) < (Config.BreakIn.cooldownTime / 1000) then
        local remaining = math.ceil((Config.BreakIn.cooldownTime / 1000) - (os.time() - BreakInCooldowns[src]))
        SendNotification(src, 'You must wait ' .. remaining .. ' seconds before trying again', 'error')
        return
    end
    
    -- Check if player has required item
    local item = Player.Functions.GetItemByName(itemName)
    if not item then
        SendNotification(src, 'You don\'t have the required item', 'error')
        return
    end
    
    local itemConfig = Config.BreakIn.requiredItems[itemName]
    if not itemConfig then
        SendNotification(src, 'Invalid break-in item', 'error')
        return
    end
    
    -- Set cooldown
    BreakInCooldowns[src] = os.time()
    
    -- Trigger client-side minigame
    TriggerClientEvent('qb-containerinventory:client:StartBreakIn', src, furnitureId, itemName, itemConfig)
end)

-- Break-in result
RegisterNetEvent('qb-containerinventory:server:BreakInResult', function(furnitureId, itemName, success)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
    local furniture = DeployedFurniture[furnitureId]
    if not furniture then return end
    
    local itemConfig = Config.BreakIn.requiredItems[itemName]
    if not itemConfig then return end
    
    if success then
        -- Success - open furniture
        SendNotification(src, 'Break-in successful!', 'success')
        
        -- Alert police if enabled
        if Config.BreakIn.alertPolice and math.random(100) <= Config.BreakIn.policeAlertChance then
            -- Trigger police alert (you'll need to integrate with your police system)
            TriggerEvent('police:server:policeAlert', 'Furniture break-in in progress')
        end
        
        -- Open furniture
        TriggerEvent('qb-containerinventory:server:OpenFurniture', furnitureId)
    else
        -- Failed - damage item
        SendNotification(src, 'Break-in failed!', 'error')
        
        -- Damage or remove item based on config
        local item = Player.Functions.GetItemByName(itemName)
        if item then
            if item.info and item.info.quality then
                local newQuality = item.info.quality - itemConfig.damageOnFail
                if newQuality <= 0 then
                    Player.Functions.RemoveItem(itemName, 1)
                    SendNotification(src, 'Your ' .. itemName .. ' broke!', 'error')
                else
                    item.info.quality = newQuality
                    Player.Functions.SetInventory(Player.PlayerData.items, true)
                    SendNotification(src, 'Your ' .. itemName .. ' was damaged', 'error')
                end
            end
        end
    end
end)

-- synch
RegisterNetEvent('qb-containerinventory:server:requestSynchFurniture', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
	TriggerClientEvent('qb-containerinventory:client:SyncFurniture', src, DeployedFurniture)
end)

-- Get furniture data
QBCore.Functions.CreateCallback('qb-containerinventory:server:GetFurnitureData', function(source, cb, furnitureId)
    cb(DeployedFurniture[furnitureId])
end)

-- Get all furniture
QBCore.Functions.CreateCallback('qb-containerinventory:server:GetAllFurniture', function(source, cb)
    cb(DeployedFurniture)
end)

DebugPrint('Furniture script loaded successfully')