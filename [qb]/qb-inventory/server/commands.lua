
local function InitializeInventory(inventoryId, data)
    Inventories[inventoryId] = {
        items = {},
        isOpen = false,
        label = data and data.label or inventoryId,
        maxweight = data and data.maxweight or Config.StashSize.maxweight,
        slots = data and data.slots or Config.StashSize.slots
    }
    return Inventories[inventoryId]
end


-- Commands

QBCore.Commands.Add('giveitem', 'Give An Item (Admin Only)', { { name = 'id', help = 'Player ID' }, { name = 'item', help = 'Name of the item (not a label)' }, { name = 'amount', help = 'Amount of items' } }, false, function(source, args)
    local id = tonumber(args[1])
    local player = QBCore.Functions.GetPlayer(id)
    local amount = tonumber(args[3]) or 1
    local itemData = QBCore.Shared.Items[tostring(args[2]):lower()]
    if player then
        if itemData then
            -- check iteminfo
            local info = {}
            if itemData['name'] == 'id_card' then
                info.citizenid = player.PlayerData.citizenid
                info.firstname = player.PlayerData.charinfo.firstname
                info.lastname = player.PlayerData.charinfo.lastname
                info.birthdate = player.PlayerData.charinfo.birthdate
                info.gender = player.PlayerData.charinfo.gender
                info.nationality = player.PlayerData.charinfo.nationality
            elseif itemData['name'] == 'driver_license' then
                info.firstname = player.PlayerData.charinfo.firstname
                info.lastname = player.PlayerData.charinfo.lastname
                info.birthdate = player.PlayerData.charinfo.birthdate
                info.type = 'Class C Driver License'
            elseif itemData['type'] == 'weapon' then
                amount = 1
                info.serie = tostring(QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(4))
                info.quality = 100
            elseif itemData['name'] == 'harness' then
                info.uses = 20
            elseif itemData['name'] == 'markedbills' then
                info.worth = math.random(5000, 10000)
            elseif itemData['name'] == 'printerdocument' then
                info.url = 'https://cdn.discordapp.com/attachments/870094209783308299/870104331142189126/Logo_-_Display_Picture_-_Stylized_-_Red.png'
            end

            if AddItem(id, itemData['name'], amount, false, info, 'give item command') then
                QBCore.Functions.Notify(source, Lang:t('notify.yhg') .. GetPlayerName(id) .. ' ' .. amount .. ' ' .. itemData['name'] .. '', 'success')
                TriggerClientEvent('qb-inventory:client:ItemBox', id, itemData, 'add', amount)
                if Player(id).state.inv_busy then TriggerClientEvent('qb-inventory:client:updateInventory', id) end
            else
                QBCore.Functions.Notify(source, Lang:t('notify.cgitem'), 'error')
            end
        else
            QBCore.Functions.Notify(source, Lang:t('notify.idne'), 'error')
        end
    else
        QBCore.Functions.Notify(source, Lang:t('notify.pdne'), 'error')
    end
end, 'admin')

QBCore.Commands.Add('randomitems', 'Receive random items', {}, false, function(source)
    local player = QBCore.Functions.GetPlayer(source)
    local playerInventory = player.PlayerData.items
    local filteredItems = {}
    for k, v in pairs(QBCore.Shared.Items) do
        if QBCore.Shared.Items[k]['type'] ~= 'weapon' then
            filteredItems[#filteredItems + 1] = v
        end
    end
    for _ = 1, 10, 1 do
        local randitem = filteredItems[math.random(1, #filteredItems)]
        local amount = math.random(1, 10)
        if randitem['unique'] then
            amount = 1
        end
        local emptySlot = nil
        for i = 1, Config.MaxSlots do
            if not playerInventory[i] then
                emptySlot = i
                break
            end
        end
        if emptySlot then
            if AddItem(source, randitem.name, amount, emptySlot, false, 'random items command') then
                TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items[randitem.name], 'add')
                player = QBCore.Functions.GetPlayer(source)
                playerInventory = player.PlayerData.items
                if Player(source).state.inv_busy then TriggerClientEvent('qb-inventory:client:updateInventory', source) end
            end
            Wait(1000)
        end
    end
end, 'god')

QBCore.Commands.Add('fixinvbyid', 'Fix an Inventory (Admin Only)', { { name = 'id', help = 'Exact spelling of stash/trunk ID' } }, false, function(source, args)
    local stashid = args[1]
    if not stashid and not Inventories[stashid].items then
	
		QBCore.Functions.Notify(source, 'Could not fix the inventory, likely a name mismatch.', 'error')
        return
    end
	local brokenInventory = Inventories[stashid].items
	local inventoryItemsList = {}
	for _,item in pairs(brokenInventory) do -- iterate through the list of items in broken inventory
		-- for x,y in pairs(item) do
		inventoryItemsList[#inventoryItemsList+1] = item -- store item in a list for addition to fresh inventory later
		-- end
	end
	
	
    ClearStash(stashid) -- this is where we would clear the inventory to start fresh
	Wait(3000) -- give some time for the inventory to process as cleared
	InitializeInventory(stashid)
	Wait(3000)
	
	for _,newitem in pairs(inventoryItemsList) do -- iterate through the list of items in the storeditemslist
		
		-- print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		-- print(stashid)
		-- print("name:"..newitem.name)
		-- print("amount:"..tostring(newitem.amount))
		-- print("slotNumber:"..tostring(newitem.slot))
		-- print(newitem.info)
		-- print("Fixing Inventory")
		-- print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		AddItem(stashid, newitem.name, newitem.amount, newitem.slot, newitem.info, "Fixing Inventory") -- add items back one by one
		
	end
	
	QBCore.Functions.Notify(source, 'cleared and reset', 'success')
	
end, 'admin')

QBCore.Commands.Add('clearinv', 'Clear Inventory (Admin Only)', { { name = 'id', help = 'Player ID' } }, false, function(source, args)
    local id = tonumber(args[1])
    if not id then
        ClearInventory(source)
        return
    end
    ClearInventory(id)
end, 'admin')


QBCore.Commands.Add('adminOpenInventory', 'Open Any Inventory (Admin Only)', { { name = 'id', help = 'Inventory ID' } }, false, function(source, args)
    local id = tostring(args[1])
    OpenInventory(source, id)
end, 'admin')


QBCore.Commands.Add('adminOpenInventoryByID', 'Open Any Inventory (Admin Only)', { { name = 'id', help = 'Player ID' } }, false, function(source, args)
    local id = tostring(args[1])
    OpenInventoryById(source, id)
end, 'admin')

-- Keybindings

RegisterCommand('closeInv', function(source)
    CloseInventory(source)
end, false)

RegisterCommand('hotbar', function(source)
    if Player(source).state.inv_busy then return end
    local QBPlayer = QBCore.Functions.GetPlayer(source)
    if not QBPlayer then return end
    if not QBPlayer or QBPlayer.PlayerData.metadata['isdead'] or QBPlayer.PlayerData.metadata['inlaststand'] or QBPlayer.PlayerData.metadata['ishandcuffed'] then return end
    local hotbarItems = {
        QBPlayer.PlayerData.items[1],
        QBPlayer.PlayerData.items[2],
        QBPlayer.PlayerData.items[3],
        QBPlayer.PlayerData.items[4],
        QBPlayer.PlayerData.items[5],
    }
    TriggerClientEvent('qb-inventory:client:hotbar', source, hotbarItems)
end, false)

RegisterCommand('inventory', function(source)
    if Player(source).state.inv_busy then return end
    local QBPlayer = QBCore.Functions.GetPlayer(source)
    if not QBPlayer then return end
    if not QBPlayer or QBPlayer.PlayerData.metadata['isdead'] or QBPlayer.PlayerData.metadata['inlaststand'] or QBPlayer.PlayerData.metadata['ishandcuffed'] then return end
    QBCore.Functions.TriggerClientCallback('qb-inventory:client:vehicleCheck', source, function(inventory, class)
        if not inventory then return OpenInventory(source) end
        if inventory:find('trunk-') then
            OpenInventory(source, inventory, {
                slots = VehicleStorage[class] and VehicleStorage[class].trunkSlots or VehicleStorage.default.slots,
                maxweight = VehicleStorage[class] and VehicleStorage[class].trunkWeight or VehicleStorage.default.maxWeight
            })
            return
        elseif inventory:find('glovebox-') then
            OpenInventory(source, inventory, {
                slots = VehicleStorage[class] and VehicleStorage[class].gloveboxSlots or VehicleStorage.default.slots,
                maxweight = VehicleStorage[class] and VehicleStorage[class].gloveboxWeight or VehicleStorage.default.maxWeight
            })
            return
        end
    end)
end, false)
-- ============================================================================
-- FORCE SAVE CONTAINER FROM PLAYER CACHE (IMPROVED VERSION)
-- ============================================================================
-- This version saves the CURRENT state of the player's inventory to the database
-- instead of reloading from the database (which may have broken data)

-- Add this to: qb-inventory/server/commands.lua
-- ============================================================================


QBCore.Commands.Add('fixbag', 'Force save your bag inventory from current state', {}, false, function(source)
     -- Check if player is busy with inventory
	if Player(source).state.inv_busy then
		QBCore.Functions.Notify(src, 'Please close your inventory first', 'error')
		return
	end
	
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end


	-- Find backpack in player inventory
	local backpackFound = false
	local backpackItem = nil
	local backpackSlot = nil

	for slot, item in pairs(Player.PlayerData.items) do
		if item and (item.name == 'backpack_small' or item.name == 'backpack_medium' or item.name == 'backpack_large') then
			backpackFound = true
			backpackItem = item
			backpackSlot = slot
			break
		end
	end

	if not backpackFound then
		QBCore.Functions.Notify(src, "You don't have a backpack in your inventory", 'error')
		return
	end

	-- Check if backpack has container ID
	if not backpackItem.info or not backpackItem.info.containerId then
		QBCore.Functions.Notify(src, "Your backpack doesn't have a container ID. Please contact an admin.", 'error')
		return
	end

	local containerId = backpackItem.info.containerId

	-- Get the CURRENT state from server cache (what player sees)
	local currentInventory = Inventories[containerId]

	if not currentInventory then
		QBCore.Functions.Notify(src, 'Backpack not currently loaded. Please open it first, then try this command.', 'error')
		return
	end

	-- Get backpack config for proper structure
	local backpackConfig = Config.Backpacks and Config.Backpacks[backpackItem.name]
	if not backpackConfig then
		-- Fallback to default values
		backpackConfig = {
			slots = 30,
			maxWeight = 60000
		}
	end

	-- Build the data structure to save
	local dataToSave = {
		items = currentInventory.items or {},
		maxweight = backpackConfig.maxWeight,
		slots = backpackConfig.slots
	}
	
	-- Force save the CURRENT cache state to database
	local success = MySQL.prepare.await(  
		'INSERT INTO container_inventories (container_id, citizenid, item_name, container_type, data) VALUES (?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE data = ?, updated_at = NOW()',
		{
			containerId,
			Player.PlayerData.citizenid,
			backpackItem.name,
			'backpack',
			json.encode(dataToSave),
			json.encode(dataToSave)
		}
	)
	
	if success then
		QBCore.Functions.Notify(src, 'Backpack inventory saved from current state! Database updated.', 'success')
		
		-- Log the action with item count
		local itemCount = 0
		for _ in pairs(currentInventory.items) do
			itemCount = itemCount + 1
		end
		
		local logMessage = string.format('**%s (citizenid: %s | id: %s)** force saved container from cache: %s (%d items)', 
			GetPlayerName(src), 
			Player.PlayerData.citizenid, 
			src, 
			containerId,
			itemCount
		)
		TriggerEvent('qb-log:server:CreateLog', 'playerinventory', 'Force Save From Cache', 'blue', logMessage)
	else
		QBCore.Functions.Notify(src, 'Failed to save to database. Please try again or contact an admin.', 'error')
	end

end, false)


QBCore.Commands.Add('fixwallet', 'Force save your wallet inventory from current state', {}, false, function(source)
    -- Check if player is busy with inventory
	if Player(source).state.inv_busy then
		QBCore.Functions.Notify(src, 'Please close your inventory first', 'error')
		return
	end
	
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

	-- Find wallet in player inventory
	local walletFound = false
	local walletItem = nil
	local walletSlot = nil

	for slot, item in pairs(Player.PlayerData.items) do
		if item and (item.name == 'wallet' or item.name == 'wallet_premium') then
			walletFound = true
			walletItem = item
			walletSlot = slot
			break
		end
	end

	if not walletFound then
		QBCore.Functions.Notify(src, "You don't have a wallet in your inventory", 'error')
		return
	end

	-- Check if wallet has container ID
	if not walletItem.info or not walletItem.info.containerId then
		QBCore.Functions.Notify(src, "Your wallet doesn't have a container ID. Please contact an admin.", 'error')
		return
	end

	local containerId = walletItem.info.containerId

	-- Get the CURRENT state from server cache (what player sees)
	local currentInventory = Inventories[containerId]

	if not currentInventory then
		QBCore.Functions.Notify(src, 'Wallet not currently loaded. Please open it first, then try this command.', 'error')
		return
	end

	-- Get wallet config for proper structure
	local walletConfig = Config.Wallets and Config.Wallets[walletItem.name]
	if not walletConfig then
		-- Fallback to default values
		walletConfig = {
			slots = 5,
			maxWeight = 5000
		}
	end

	-- Build the data structure to save
	local dataToSave = {
		items = currentInventory.items or {},
		maxweight = walletConfig.maxWeight,
		slots = walletConfig.slots
	}

	-- Force save the CURRENT cache state to database
	local success = MySQL.prepare.await(
		'INSERT INTO container_inventories (container_id, citizenid, item_name, container_type, data) VALUES (?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE data = ?, updated_at = NOW()',
		{
			containerId,
			Player.PlayerData.citizenid,
			walletItem.name,
			'wallet',
			json.encode(dataToSave),
			json.encode(dataToSave)
		}
	)

	if success then
		QBCore.Functions.Notify(src, 'Wallet inventory saved from current state! Database updated.', 'success')
		
		-- Log the action with item count
		local itemCount = 0
		for _ in pairs(currentInventory.items) do
			itemCount = itemCount + 1
		end
		
		local logMessage = string.format('**%s (citizenid: %s | id: %s)** force saved container from cache: %s (%d items)', 
			GetPlayerName(src), 
			Player.PlayerData.citizenid, 
			src, 
			containerId,
			itemCount
		)
		TriggerEvent('qb-log:server:CreateLog', 'playerinventory', 'Force Save From Cache', 'blue', logMessage)
	else
		QBCore.Functions.Notify(src, 'Failed to save to database. Please try again or contact an admin.', 'error')
	end

end, false)


-- ============================================================================
-- ALTERNATIVE: Request client-side inventory data (if server cache is also broken)
-- ============================================================================


QBCore.Commands.Add('syncbag', 'Sync your bag inventory from your client to server', {}, false, function(source)
     -- Check if player is busy with inventory
	if Player(source).state.inv_busy then
		QBCore.Functions.Notify(src, 'Please close your inventory first', 'error')
		return
	end
	
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end


	-- Find backpack in player inventory
	local backpackFound = false
	local backpackItem = nil

	for slot, item in pairs(Player.PlayerData.items) do
		if item and (item.name == 'backpack_small' or item.name == 'backpack_medium' or item.name == 'backpack_large') then
			backpackFound = true
			backpackItem = item
			break
		end
	end

	if not backpackFound then
		QBCore.Functions.Notify(src, "You don't have a backpack in your inventory", 'error')
		return
	end

	if not backpackItem.info or not backpackItem.info.containerId then
		QBCore.Functions.Notify(src, "Your backpack doesn't have a container ID. Please contact an admin.", 'error')
		return
	end

	local containerId = backpackItem.info.containerId

	-- Request inventory data from client
	QBCore.Functions.TriggerClientCallback('qb-inventory:client:GetOpenInventory', src, function(clientInventoryData)
		if not clientInventoryData or not clientInventoryData.inventory then
			QBCore.Functions.Notify(src, 'Could not get inventory data from client. Please open your bag first.', 'error')
			return
		end
		
		-- Check if this is the correct container
		if clientInventoryData.name ~= containerId then
			QBCore.Functions.Notify(src, 'Please open your backpack first, then use this command.', 'error')
			return
		end
		
		-- Get backpack config
		local backpackConfig = Config.Backpacks and Config.Backpacks[backpackItem.name]
		if not backpackConfig then
			backpackConfig = {
				slots = 30,
				maxWeight = 60000
			}
		end
		
		-- Build data structure from client data
		local dataToSave = {
			items = clientInventoryData.inventory or {},
			maxweight = backpackConfig.maxWeight,
			slots = backpackConfig.slots
		}
		
		-- Update server cache
		Inventories[containerId] = {
			items = clientInventoryData.inventory or {},
			isOpen = false,
			label = backpackItem.label or 'Backpack',
			maxweight = backpackConfig.maxWeight,
			slots = backpackConfig.slots
		}
		
		-- Save to database
		local success = MySQL.prepare.await(
			'INSERT INTO container_inventories (container_id, citizenid, item_name, container_type, data) VALUES (?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE data = ?, updated_at = NOW()',
			{
				containerId,
				Player.PlayerData.citizenid,
				backpackItem.name,
				'backpack',
				json.encode(dataToSave),
				json.encode(dataToSave)
			}
		)
		
		if success then
			QBCore.Functions.Notify(src, 'Backpack synced from client! Server and database updated.', 'success')
			
			local itemCount = 0
			for _ in pairs(clientInventoryData.inventory) do
				itemCount = itemCount + 1
			end
			
			local logMessage = string.format('**%s (citizenid: %s | id: %s)** synced container from client: %s (%d items)', 
				GetPlayerName(src), 
				Player.PlayerData.citizenid, 
				src, 
				containerId,
				itemCount
			)
			TriggerEvent('qb-log:server:CreateLog', 'playerinventory', 'Sync From Client', 'green', logMessage)
		else
			QBCore.Functions.Notify(src, 'Failed to save to database. Please try again.', 'error')
		end
	end)

end, false)


-- ============================================================================
-- ADMIN COMMAND: Force save from player's current cache
-- ============================================================================


QBCore.Commands.Add('adminSyncContainer', "Force sync a player's container from their cache (Admin Only)", {
    {name = 'id', help = 'Player ID'},
    {name = 'type', help = 'Container type (wallet/backpack)'}
	}, true, function(source, args)
		local targetId = tonumber(args[1])
		local containerType = args[2] and args[2]:lower() or 'backpack'


	if not targetId then
		QBCore.Functions.Notify(source, 'Invalid player ID', 'error')
		return
	end

	local TargetPlayer = QBCore.Functions.GetPlayer(targetId)
	if not TargetPlayer then
		QBCore.Functions.Notify(source, 'Player not found', 'error')
		return
	end

	-- Find the container
	local containerItem = nil
	local searchNames = {}

	if containerType == 'wallet' then
		searchNames = {'wallet', 'wallet_premium'}
	else
		searchNames = {'backpack_small', 'backpack_medium', 'backpack_large'}
	end

	for slot, item in pairs(TargetPlayer.PlayerData.items) do
		if item then
			for _, name in ipairs(searchNames) do
				if item.name == name then
					containerItem = item
					break
				end
			end
			if containerItem then break end
		end
	end

	if not containerItem then
		QBCore.Functions.Notify(source, "Player doesn't have a " .. containerType, 'error')
		return
	end

	if not containerItem.info or not containerItem.info.containerId then
		QBCore.Functions.Notify(source, 'Container has no ID. Cannot sync.', 'error')
		return
	end

	local containerId = containerItem.info.containerId

	-- Get current cache state
	local currentInventory = Inventories[containerId]

	if not currentInventory then
		QBCore.Functions.Notify(source, 'Container not in cache. Player needs to open it first.', 'error')
		return
	end

	-- Get config
	local config
	if containerType == 'wallet' then
		config = Config.Wallets and Config.Wallets[containerItem.name] or {slots = 5, maxWeight = 5000}
	else
		config = Config.Backpacks and Config.Backpacks[containerItem.name] or {slots = 30, maxWeight = 60000}
	end

	-- Build data structure
	local dataToSave = {
		items = currentInventory.items or {},
		maxweight = config.maxWeight,
		slots = config.slots
	}

	-- Save to database
	local success = MySQL.prepare.await(
		'INSERT INTO container_inventories (container_id, citizenid, item_name, container_type, data) VALUES (?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE data = ?, updated_at = NOW()',
		{
			containerId,
			TargetPlayer.PlayerData.citizenid,
			containerItem.name,
			containerType,
			json.encode(dataToSave),
			json.encode(dataToSave)
		}
	)

	if success then
		local itemCount = 0
		for _ in pairs(currentInventory.items) do
			itemCount = itemCount + 1
		end
		
		QBCore.Functions.Notify(source, "Synced " .. GetPlayerName(targetId) .. "'s " .. containerType .. " (" .. itemCount .. " items)", 'success')
		QBCore.Functions.Notify(targetId, 'An admin has synced your ' .. containerType .. ' to the database.', 'success')
		
		local logMessage = string.format('**%s (id: %s)** synced container for **%s (citizenid: %s | id: %s)**: %s (%d items)', 
			GetPlayerName(source),
			source,
			GetPlayerName(targetId), 
			TargetPlayer.PlayerData.citizenid, 
			targetId, 
			containerId,
			itemCount
		)
		TriggerEvent('qb-log:server:CreateLog', 'playerinventory', 'Admin Sync Container', 'orange', logMessage)
	else
		QBCore.Functions.Notify(source, 'Failed to save to database', 'error')
	end

end, 'admin')