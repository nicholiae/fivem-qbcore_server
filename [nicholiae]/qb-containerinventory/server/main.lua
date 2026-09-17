local QBCore = exports['qb-core']:GetCoreObject()

-- Container data storage
local ContainerData = {}
local PlayerContainers = {} -- Track active containers per player

-- Helper Functions
local function DebugPrint(message)
    if Config.Debug then
        print('[QBContainerInventory] ' .. message)
    end
end

-- Register wallet items
for itemName, _ in pairs(Config.Wallets) do
	QBCore.Functions.CreateUseableItem(itemName, function(source, item)
		TriggerClientEvent('qb-containerinventory:client:UseWallet', source, itemName)
	end)
end

-- Register backpack items
for itemName, _ in pairs(Config.Backpacks) do
	QBCore.Functions.CreateUseableItem(itemName, function(source, item)
		TriggerClientEvent('qb-containerinventory:client:UseBackpack', source, itemName)
	end)
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

-- Initialize container data from database
CreateThread(function()
    MySQL.ready(function()
        local result = MySQL.query.await('SELECT * FROM container_inventories')
        if result then
            for _, container in ipairs(result) do
                ContainerData[container.container_id] = {
                    id = container.container_id,
                    citizenid = container.citizenid,
                    itemName = container.item_name,
                    type = container.container_type,
                    data = json.decode(container.data or '{}')
                }
            end
            DebugPrint('Loaded ' .. #result .. ' containers from database')
        end
    end)
end)

-- FIX #5: Automatic cleanup system for orphaned containers
CreateThread(function()
    while true do
        Wait(3600000) -- Run every hour
        
        if Config.AutoCleanup and Config.AutoCleanup.enabled then
            DebugPrint('Starting automatic cleanup of orphaned containers...')
            
            local allContainers = MySQL.query.await(
                'SELECT container_id, citizenid, item_name, created_at FROM container_inventories WHERE container_type != ?',
                {'furniture'}
            )
            
            if allContainers then
                local orphanedCount = 0
                local cleanupAge = Config.AutoCleanup.orphanedAge or 604800
                local currentTime = os.time()
                
                for _, container in ipairs(allContainers) do
                    local createdTime = container.created_at
                    local age = currentTime - createdTime
                    
                    if age > cleanupAge then
                        local isReferenced = false
                        local Players = QBCore.Functions.GetQBPlayers()
                        
                        for _, Player in pairs(Players) do
                            if Player then
                                for _, item in pairs(Player.PlayerData.items) do
                                    if item and item.info and item.info.containerId == container.container_id then
                                        isReferenced = true
                                        break
                                    end
                                end
                                if isReferenced then break end
                            end
                        end
                        
                        if not isReferenced and Config.AutoCleanup.deleteEmpty then
                            MySQL.execute('DELETE FROM container_inventories WHERE container_id = ?', {container.container_id})
                            ContainerData[container.container_id] = nil
                            orphanedCount = orphanedCount + 1
                            DebugPrint('Cleaned orphaned container: ' .. container.container_id)
                        end
                    end
                end
                
                if orphanedCount > 0 then
                    DebugPrint('Cleanup complete: Removed ' .. orphanedCount .. ' orphaned containers')
                end
            end
        end
    end
end)

-- Wallet Functions
local function HasWallet(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return false end
    
    for itemName, _ in pairs(Config.Wallets) do
        if Player.Functions.GetItemByName(itemName) then
            return true, itemName
        end
    end
    return false, nil
end

-- SIMPLIFIED: Just load the container, no creation needed
local function LoadWalletInventory(source, itemName, itemData)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return false end
    
    local walletConfig = Config.Wallets[itemName]
    if not walletConfig then return false end
    
    -- Container ID should already be in item.info from purchase
    local containerId = itemData.info and itemData.info.containerId
    
    if not containerId then
        DebugPrint('ERROR: Item has no container ID! This should have been assigned at purchase.')
        SendNotification(source, 'This wallet is corrupted. Please contact an administrator.', 'error')
        return false
    end
    
    DebugPrint('Loading container: ' .. containerId)
    
    -- Load from database if not in memory
    if not ContainerData[containerId] then
        local existingContainer = MySQL.query.await(
            'SELECT * FROM container_inventories WHERE container_id = ?',
            {containerId}
        )
        
        if existingContainer and #existingContainer > 0 then
            ContainerData[containerId] = {
                id = containerId,
                citizenid = existingContainer[1].citizenid,
                itemName = existingContainer[1].item_name,
                type = existingContainer[1].container_type,
                data = json.decode(existingContainer[1].data or '{}')
            }
        else
            DebugPrint('ERROR: Container not found in database: ' .. containerId)
            SendNotification(source, 'Container data not found. Please contact an administrator.', 'error')
            return false
        end
    end
    
    return containerId
end

RegisterNetEvent('qb-containerinventory:server:UseWallet', function(itemName, itemData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
    -- Simply load the container
    local containerId = LoadWalletInventory(src, itemName, itemData)
    print(containerId)
    print(itemData.info.containerId)
    if not containerId then
        SendNotification(src, 'Failed to open wallet', 'error')
        return
    end
    
    -- Track active container
    PlayerContainers[src] = {
        type = 'wallet',
        id = containerId,
        itemName = itemName
    }
    
    -- Open inventory using qb-inventory export
    local walletConfig = Config.Wallets[itemName]
    exports['qb-inventory']:OpenInventory(src, containerId, {
        maxweight = walletConfig.maxWeight,
        slots = walletConfig.slots,
        label = walletConfig.label
    })
    
    -- Trigger client event for tracking
    TriggerClientEvent('qb-containerinventory:client:OpenContainer', src, containerId, 'wallet', walletConfig)
    
    DebugPrint('Player ' .. src .. ' opened wallet: ' .. containerId)
end)

-- Backpack Functions
local function HasBackpack(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return false end
    
    for itemName, _ in pairs(Config.Backpacks) do
        if Player.Functions.GetItemByName(itemName) then
            return true, itemName
        end
    end
    return false, nil
end

-- SIMPLIFIED: Just load the container, no creation needed
local function LoadBackpackInventory(source, itemName, itemData)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return false end
    
    local backpackConfig = Config.Backpacks[itemName]
    if not backpackConfig then return false end
    
    -- Container ID should already be in item.info from purchase
    local containerId = itemData.info and itemData.info.containerId
    
    if not containerId then
        DebugPrint('ERROR: Item has no container ID! This should have been assigned at purchase.')
        SendNotification(source, 'This backpack is corrupted. Please contact an administrator.', 'error')
        return false
    end
    
    DebugPrint('Loading container: ' .. containerId)
    
    -- Load from database if not in memory
    if not ContainerData[containerId] then
        local existingContainer = MySQL.query.await(
            'SELECT * FROM container_inventories WHERE container_id = ?',
            {containerId}
        )
        
        if existingContainer and #existingContainer > 0 then
            ContainerData[containerId] = {
                id = containerId,
                citizenid = existingContainer[1].citizenid,
                itemName = existingContainer[1].item_name,
                type = existingContainer[1].container_type,
                data = json.decode(existingContainer[1].data or '{}')
            }
        else
            DebugPrint('ERROR: Container not found in database: ' .. containerId)
            SendNotification(source, 'Container data not found. Please contact an administrator.', 'error')
            return false
        end
    end
    
    return containerId
end

RegisterNetEvent('qb-containerinventory:server:UseBackpack', function(itemName, itemData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
    -- Simply load the container
    local containerId = LoadBackpackInventory(src, itemName, itemData)
    
    if not containerId then
        SendNotification(src, 'Failed to open backpack', 'error')
        return
    end
    
    -- Track active container
    PlayerContainers[src] = {
        type = 'backpack',
        id = containerId,
        itemName = itemName
    }
    
    -- Open inventory using qb-inventory export
    local backpackConfig = Config.Backpacks[itemName]
    exports['qb-inventory']:OpenInventory(src, containerId, {
        maxweight = backpackConfig.maxWeight,
        slots = backpackConfig.slots,
        label = backpackConfig.label
    })
    
    -- Trigger client event for tracking
    TriggerClientEvent('qb-containerinventory:client:OpenContainer', src, containerId, 'backpack', backpackConfig)
    
    DebugPrint('Player ' .. src .. ' opened backpack: ' .. containerId)
end)

-- Container closing
RegisterNetEvent('qb-containerinventory:server:CloseContainer', function()
    local src = source
    if PlayerContainers[src] then
        DebugPrint('Player ' .. src .. ' closed container: ' .. PlayerContainers[src].id)
        PlayerContainers[src] = nil
    end
end)

-- Listen for QB-Inventory close events to clear container tracking
RegisterNetEvent('qb-inventory:server:closeInventory', function(inventoryId)
    local src = source
    if PlayerContainers[src] and PlayerContainers[src].id == inventoryId then
        DebugPrint('Player ' .. src .. ' closed container via inventory: ' .. inventoryId)
        PlayerContainers[src] = nil
    end
end)

-- Check if player can carry container
QBCore.Functions.CreateCallback('qb-containerinventory:server:CanCarryContainer', function(source, cb, containerType)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then cb(false) return end
    
    if containerType == 'wallet' then
        local hasWallet, _ = HasWallet(src)
        cb(not hasWallet)
    elseif containerType == 'backpack' then
        local hasBackpack, _ = HasBackpack(src)
        cb(not hasBackpack)
    else
        cb(true)
    end
end)

-- THE FIX: Assign container ID at purchase time (like printedcash!)
RegisterNetEvent('qb-containerinventory:server:PurchaseItem', function(itemName, itemType)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
    local itemConfig
    if itemType == 'wallet' then
        itemConfig = Config.Wallets[itemName]
    elseif itemType == 'backpack' then
        itemConfig = Config.Backpacks[itemName]
    elseif itemType == 'furniture' then
        itemConfig = Config.Furniture[itemName]
    end
    
    if not itemConfig then
        SendNotification(src, 'Item not found', 'error')
        return
    end
    
    -- Check if player can carry this type (for wallets and backpacks only)
    if itemType == 'wallet' or itemType == 'backpack' then
        local canCarry = true
        
        if itemType == 'wallet' then
            local hasWallet, _ = HasWallet(src)
            canCarry = not hasWallet
        elseif itemType == 'backpack' then
            local hasBackpack, _ = HasBackpack(src)
            canCarry = not hasBackpack
        end
        
        if not canCarry then
            SendNotification(src, 'You already have a ' .. itemType .. '!', 'error')
            return
        end
    end
    
    -- Check if player has enough money
    if Player.PlayerData.money.cash >= itemConfig.price then
        Player.Functions.RemoveMoney('cash', itemConfig.price, 'container-purchase')
    elseif Player.PlayerData.money.bank >= itemConfig.price then
        Player.Functions.RemoveMoney('bank', itemConfig.price, 'container-purchase')
    else
        SendNotification(src, 'You don\'t have enough money!', 'error')
        return
    end
    
    -- THE FIX: Create container and assign ID at purchase time!
    local containerId = nil
    local citizenid = Player.PlayerData.citizenid
    
    if itemType == 'wallet' or itemType == 'backpack' then
        -- Generate unique container ID with race condition protection
        local maxAttempts = 10
        local containerNumber = 1
        local success = false
        
        while not success and containerNumber <= maxAttempts do
            containerId = itemName .. '_' .. citizenid .. '_' .. containerNumber
            
            DebugPrint('Attempting to create container at purchase: ' .. containerId)
            
            -- Create container inventory data
            local inventory = {
                maxweight = itemConfig.maxWeight,
                slots = itemConfig.slots
            }
			
            -- Try to find the containerID in the database first otherwise we crash out with an error due to duplicate entry
            local queryResult = MySQL.query.await(
				'SELECT * FROM container_inventories WHERE container_id = ?',
				{containerId}
			)
			-- if ContainerID not found, use it and insert it to the database.
			if not queryResult or #queryResult == 0 then
				-- Try to insert into database
				local insertResult = MySQL.insert.await(
					'INSERT INTO container_inventories (container_id, citizenid, item_name, container_type, data) VALUES (?, ?, ?, ?, ?)',
					{containerId, citizenid, itemName, itemType, json.encode(inventory)}
				)
				-- successful insert then complete
				if insertResult then
					success = true
					DebugPrint('Container created at purchase: ' .. containerId)
					
					-- Store in memory
					ContainerData[containerId] = {
						id = containerId,
						citizenid = citizenid,
						itemName = itemName,
						type = itemType,
						data = inventory
					}
				-- unsuccessful insert print error.
				else
					DebugPrint('ERROR: your sql insertion could not be completed!')
				end
            else
                containerNumber = containerNumber + 1
            end
        end
        
        if not success then
            DebugPrint('ERROR: Failed to create container after ' .. maxAttempts .. ' attempts')
            -- Refund money
            Player.Functions.AddMoney('cash', itemConfig.price, 'container-purchase-refund')
            SendNotification(src, 'Failed to create container. Please try again.', 'error')
            return
        end
    end
    
    -- Give item WITH container ID already assigned (like printedcash!)
    local info = {
        description = itemConfig.description,
        quality = 100,
        containerId = containerId  -- ← ASSIGNED AT PURCHASE!
    }
    
    if exports['qb-inventory']:AddItem(src, itemName, 1, false, info, 'container-purchase') then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], 'add')
        SendNotification(src, 'You purchased a ' .. itemConfig.label .. ' for $' .. itemConfig.price, 'success')
        DebugPrint('Player ' .. src .. ' purchased ' .. itemName .. ' with container ID: ' .. tostring(containerId))
    else
        -- Refund if couldn't add item
        Player.Functions.AddMoney('cash', itemConfig.price, 'container-purchase-refund')
        
        -- Rollback: Delete the container from database
        if containerId then
            MySQL.execute('DELETE FROM container_inventories WHERE container_id = ?', {containerId})
            ContainerData[containerId] = nil
        end
        
        SendNotification(src, 'Not enough inventory space!', 'error')
    end
end)

-- Get container data
QBCore.Functions.CreateCallback('qb-containerinventory:server:GetContainerData', function(source, cb, containerId)
    cb(ContainerData[containerId])
end)

-- Backpack trading - Container ID travels with the item
RegisterNetEvent('qb-containerinventory:server:TradeBackpack', function(targetId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Target = QBCore.Functions.GetPlayer(targetId)
    
    if not Player or not Target then
        SendNotification(src, 'Invalid target player', 'error')
        return
    end
    
    -- Check if source has backpack
    local hasBackpack, backpackName = HasBackpack(src)
    if not hasBackpack then
        SendNotification(src, 'You don\'t have a backpack to trade!', 'error')
        return
    end
    
    -- Check if target can receive backpack
    local targetHasBackpack, _ = HasBackpack(targetId)
    if targetHasBackpack then
        SendNotification(src, 'Target player already has a backpack!', 'error')
        return
    end
    
    -- Get backpack item
    local backpackItem = Player.Functions.GetItemByName(backpackName)
    if not backpackItem then return end
    
    -- Simple trade - item carries its container ID with it
    if exports['qb-inventory']:RemoveItem(src, backpackName, 1, backpackItem.slot, 'backpack trade') then
        if exports['qb-inventory']:AddItem(targetId, backpackName, 1, false, backpackItem.info, 'backpack trade') then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[backpackName], 'remove')
            TriggerClientEvent('inventory:client:ItemBox', targetId, QBCore.Shared.Items[backpackName], 'add')
            SendNotification(src, 'You traded your backpack', 'success')
            SendNotification(targetId, 'You received a backpack with items inside!', 'success')
            DebugPrint('Player ' .. src .. ' traded backpack to player ' .. targetId)
            
            -- Log the container ID being traded
            if backpackItem.info and backpackItem.info.containerId then
                DebugPrint('Traded container ID: ' .. backpackItem.info.containerId)
            end
        else
            -- Refund if target couldn't receive
            exports['qb-inventory']:AddItem(src, backpackName, 1, backpackItem.slot, backpackItem.info, 'trade refund')
            SendNotification(src, 'Target player has no space!', 'error')
        end
    end
end)

-- FIX #5: Manual cleanup command for administrators
RegisterCommand('cleancontainers', function(source, args)
    if source ~= 0 then
        print('[QBContainerInventory] This command can only be run from the server console')
        return
    end
    
    print('[QBContainerInventory] Starting manual container cleanup...')
    
    local allContainers = MySQL.query.await(
        'SELECT container_id, citizenid, item_name, container_type, created_at FROM container_inventories WHERE container_type != ?',
        {'furniture'}
    )
    
    if not allContainers then
        print('[QBContainerInventory] No containers found')
        return
    end
    
    local orphanedCount = 0
    local checkedCount = 0
    
    for _, container in ipairs(allContainers) do
        checkedCount = checkedCount + 1
        
        local isReferenced = false
        local Players = QBCore.Functions.GetQBPlayers()
        
        for _, Player in pairs(Players) do
            if Player then
                for _, item in pairs(Player.PlayerData.items) do
                    if item and item.info and item.info.containerId == container.container_id then
                        isReferenced = true
                        break
                    end
                end
                if isReferenced then break end
            end
        end
        
        if not isReferenced then
            print('[QBContainerInventory] Orphaned container found: ' .. container.container_id)
            orphanedCount = orphanedCount + 1
        end
    end
    
    print('[QBContainerInventory] Cleanup complete:')
    print('  - Checked: ' .. checkedCount .. ' containers')
    print('  - Orphaned: ' .. orphanedCount .. ' containers')
    print('  - Note: Enable Config.AutoCleanup.deleteEmpty to automatically delete orphaned containers')
end, 'god')

-- Cleanup on player disconnect
AddEventHandler('playerDropped', function()
    local src = source
    if PlayerContainers[src] then
        PlayerContainers[src] = nil
    end
end)

DebugPrint('Server main script loaded successfully')