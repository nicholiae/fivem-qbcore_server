QBCore = exports['qb-core']:GetCoreObject()
Inventories = {}
Drops = {}
RegisteredShops = {}
local bancount = 0 
local again = 0 

local function getPlayerAndCitizenId(playerId)
    local Player = QBCore.Functions.GetPlayer(playerId)
    if not Player then return nil, nil end
    return Player, Player.PlayerData.citizenid
end

CreateThread(function()
    MySQL.query('SELECT * FROM inventories', {}, function(result)
        if result and #result > 0 then
            for i = 1, #result do
                local inventory = result[i]
                local cacheKey = inventory.identifier
                Inventories[cacheKey] = {
                    items = json.decode(inventory.items) or {},
                    isOpen = false
                }
            end
            print(#result .. ' inventories successfully loaded')
        end
    end)
end)

CreateThread(function()
    while true do
        for k, v in pairs(Drops) do
            if v and (v.createdTime + (Config.CleanupDropTime * 60) < os.time()) and not Drops[k].isOpen then
                local entity = NetworkGetEntityFromNetworkId(v.entityId)
                if DoesEntityExist(entity) then DeleteEntity(entity) end
                Drops[k] = nil
            end
        end
        Wait(Config.CleanupDropInterval * 60000)
    end
end)

-- Handlers

AddEventHandler('playerDropped', function()
    local src = source
    for _, inv in pairs(Inventories) do
        if inv.isOpen == src then
            inv.isOpen = false
        end
    end
    -- Clean up player state
    local ped = GetPlayerPed(src)
    if ped and ped > 0 then
        Entity(ped).state:set('inv_busy', false, true)
    end
end)

AddEventHandler('txAdmin:events:serverShuttingDown', function()
    for inventory, data in pairs(Inventories) do
        if data.isOpen then
            MySQL.prepare('INSERT INTO inventories (identifier, items) VALUES (?, ?) ON DUPLICATE KEY UPDATE items = ?', { inventory, json.encode(data.items), json.encode(data.items) })
        end
    end
end)

RegisterNetEvent('QBCore:Server:UpdateObject', function()
    if source ~= '' then return end
    QBCore = exports['qb-core']:GetCoreObject()
end)

AddEventHandler('QBCore:Server:PlayerLoaded', function(Player)
    -- Initialize player state
    local src = Player.PlayerData.source
    local ped = GetPlayerPed(src)
    Entity(ped).state:set('inv_busy', false, true)
    
    QBCore.Functions.AddPlayerMethod(Player.PlayerData.source, 'AddItem', function(item, amount, slot, info, reason)
        return AddItem(Player.PlayerData.source, item, amount, slot, info, reason)
    end)

    QBCore.Functions.AddPlayerMethod(Player.PlayerData.source, 'RemoveItem', function(item, amount, slot, reason)
        return RemoveItem(Player.PlayerData.source, item, amount, slot, reason)
    end)

    QBCore.Functions.AddPlayerMethod(Player.PlayerData.source, 'GetItemBySlot', function(slot)
        return GetItemBySlot(Player.PlayerData.source, slot)
    end)

    QBCore.Functions.AddPlayerMethod(Player.PlayerData.source, 'GetItemByName', function(item)
        return GetItemByName(Player.PlayerData.source, item)
    end)

    QBCore.Functions.AddPlayerMethod(Player.PlayerData.source, 'GetItemsByName', function(item)
        return GetItemsByName(Player.PlayerData.source, item)
    end)

    QBCore.Functions.AddPlayerMethod(Player.PlayerData.source, 'ClearInventory', function(filterItems)
        ClearInventory(Player.PlayerData.source, filterItems)
    end)

    QBCore.Functions.AddPlayerMethod(Player.PlayerData.source, 'SetInventory', function(items)
        SetInventory(Player.PlayerData.source, items)
    end)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    local Players = QBCore.Functions.GetQBPlayers()
    for k in pairs(Players) do
        QBCore.Functions.AddPlayerMethod(k, 'AddItem', function(item, amount, slot, info)
            return AddItem(k, item, amount, slot, info)
        end)

        QBCore.Functions.AddPlayerMethod(k, 'RemoveItem', function(item, amount, slot)
            return RemoveItem(k, item, amount, slot)
        end)

        QBCore.Functions.AddPlayerMethod(k, 'GetItemBySlot', function(slot)
            return GetItemBySlot(k, slot)
        end)

        QBCore.Functions.AddPlayerMethod(k, 'GetItemByName', function(item)
            return GetItemByName(k, item)
        end)

        QBCore.Functions.AddPlayerMethod(k, 'GetItemsByName', function(item)
            return GetItemsByName(k, item)
        end)

        QBCore.Functions.AddPlayerMethod(k, 'ClearInventory', function(filterItems)
            ClearInventory(k, filterItems)
        end)

        QBCore.Functions.AddPlayerMethod(k, 'SetInventory', function(items)
            SetInventory(k, items)
        end)

        Player(k).state.inv_busy = false
    end
end)

-- Functions

local function checkWeapon(source, item)
    local currentWeapon = type(item) == 'table' and item.name or item
    local ped = GetPlayerPed(source)
    local weapon = GetSelectedPedWeapon(ped)
    local weaponInfo = QBCore.Shared.Weapons[weapon]
    if weaponInfo and weaponInfo.name == currentWeapon then
        RemoveWeaponFromPed(ped, weapon)
        TriggerClientEvent('qb-weapons:client:UseWeapon', source, { name = currentWeapon }, false)
    end
end

-- Events

RegisterNetEvent('qb-inventory:server:openVending', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    CreateShop({
        name = 'vending',
        label = 'Vending Machine',
        coords = data.coords,
        slots = #Config.VendingItems,
        items = Config.VendingItems
    })
    OpenShop(src, 'vending')
end)

RegisterNetEvent('qb-inventory:server:closeInventory', function(inventory)
    local src = source
    local QBPlayer = QBCore.Functions.GetPlayer(src)
    if not QBPlayer then return end
    Player(source).state.inv_busy = false
    if inventory:find('shop-') then return end
    if inventory:find('otherplayer-') then
        local targetId = tonumber(inventory:match('otherplayer%-(.+)'))
        Player(targetId).state.inv_busy = false
        return
    end
    if Drops[inventory] then
        Drops[inventory].isOpen = false
        if #Drops[inventory].items == 0 and not Drops[inventory].isOpen then -- if no listeed items in the drop on close
            TriggerClientEvent('qb-inventory:client:removeDropTarget', -1, Drops[inventory].entityId)
            Wait(500)
            local entity = NetworkGetEntityFromNetworkId(Drops[inventory].entityId)
            if DoesEntityExist(entity) then DeleteEntity(entity) end
            Drops[inventory] = nil
        end
        return
    end
    if not Inventories[inventory] then return end
    Inventories[inventory].isOpen = false
	
	-- local items = Inventories[inventory].items
	-- local ItemsJson = {}

	-- if items and next(items) then
		-- for slot, item in pairs(items) do
			-- if item then
				-- ItemsJson[#ItemsJson + 1] = {
                    -- name = item.name,
                    -- amount = item.amount,
                    -- info = item.info or '',
                    -- label = item.label,
                    -- description = item.description or '',
                    -- weight = item.weight,
                    -- type = item.type,
                    -- unique = item.unique,
                    -- useable = item.useable,
                    -- image = item.image,
                    -- shouldClose = item.shouldClose,
                    -- slot = item.slot,
                    -- combinable = item.combinable
				-- }
			-- end
		-- end
	-- end

	-- MySQL.prepare('INSERT INTO inventories (identifier, items) VALUES (?, ?) ON DUPLICATE KEY UPDATE items = ?', 
		-- { inventory, json.encode(ItemsJson), json.encode(ItemsJson) })

    MySQL.prepare('INSERT INTO inventories (identifier, items) VALUES (?, ?) ON DUPLICATE KEY UPDATE items = ?', { inventory, json.encode(Inventories[inventory].items), json.encode(Inventories[inventory].items) }) -- original
	local logMessage = string.format('**%s (citizenid: %s | id: %s)** InvName: %s items in: %s', GetPlayerName(source), QBPlayer.PlayerData.citizenid, source, inventory, json.encode(Inventories[inventory].items))
    TriggerEvent('qb-log:server:CreateLog', 'openinventory', 'Close Inventory', 'red', logMessage)
end)

RegisterNetEvent('qb-inventory:server:useItem', function(item)
    local src = source
    local itemData = GetItemBySlot(src, item.slot)
    if not itemData then return end
    local itemInfo = QBCore.Shared.Items[itemData.name]
    if itemData.type == 'weapon' then
        TriggerClientEvent('qb-weapons:client:UseWeapon', src, itemData, itemData.info.quality and itemData.info.quality > 0)
        TriggerClientEvent('qb-inventory:client:ItemBox', src, itemInfo, 'use')
    elseif itemData.name == 'xscript' or itemData.name == 'mscript' or itemData.name == 'oscript' or itemData.name == 'ascript' or itemData.name == 'iscript' then
	
        UseItem(itemData.name, src, itemData)
        TriggerClientEvent('qb-inventory:client:ItemBox', source, itemInfo, 'use')
        local playerPed = GetPlayerPed(src)
        local playerCoords = GetEntityCoords(playerPed)
        local players = QBCore.Functions.GetPlayers()
        local gender = item.info.gender == 0 and 'Male' or 'Female'
		TriggerClientEvent('qb-inventory:client:idcardanim', src)
        for _, v in pairs(players) do
            local targetPed = GetPlayerPed(v)
            local dist = #(playerCoords - GetEntityCoords(targetPed))
            if dist < 3.0 then
                TriggerClientEvent('chat:addMessage', v, {
                    template = '<div class="chat-message advert" style="background: linear-gradient(to right, rgba(5, 5, 5, 0.6), #74807c); display: flex;"><div style="margin-right: 10px;"><i class="far fa-id-card" style="height: 100%;"></i><strong> {0}</strong><br> <strong>Civ ID:</strong> {1} <br><strong>First Name:</strong> {2} <br><strong>Last Name:</strong> {3} <br><strong>Birthdate:</strong> {4} <br><strong>Gender:</strong> {5} <br><strong>Nationality:</strong> {6}</div></div>',
                    args = {
                        'Prescription - '..tostring(itemData.name),
                        item.info.citizenid,
                        item.info.firstname,
                        item.info.lastname,
                        item.info.birthdate,
                        item.info.gender,
                        item.info.nationality
                    }
                })
            end
        end
	elseif itemData.name == 'warrant' then
	
        UseItem(itemData.name, src, itemData)
        TriggerClientEvent('qb-inventory:client:ItemBox', source, itemInfo, 'use')
        local playerPed = GetPlayerPed(src)
        local playerCoords = GetEntityCoords(playerPed)
        local players = QBCore.Functions.GetPlayers()
        local gender = item.info.gender == 0 and 'Male' or 'Female'
		TriggerClientEvent('qb-inventory:client:idcardanim', src)
        for _, v in pairs(players) do
            local targetPed = GetPlayerPed(v)
            local dist = #(playerCoords - GetEntityCoords(targetPed))
            if dist < 10.0 then
                TriggerClientEvent('chat:addMessage', v, {
                    template = '<div class="chat-message advert" style="background: linear-gradient(to right, rgba(5, 5, 5, 0.6), #74807c); display: flex;"><div style="margin-right: 10px;"><i class="far fa-id-card" style="height: 100%;"></i><strong>Civ ID:</strong><strong>{0}</strong><br><strong>First Name:</strong>{1}<br><strong>Last Name:</strong> {2} <br><strong> {3}</strong><br><strong>Reason:</strong>{4}<br><strong>Signature:</strong>{5}</div></div>',
                    args = {
                        item.info.citizenid,
                        item.info.firstname,
                        item.info.lastname,
                        item.info.type..' Warrant',
                        item.info.reason,
                        'Mayor Nicholiae'
                    }
                })
            end
        end
	elseif itemData.name == 'id_card' then
	
        UseItem(itemData.name, src, itemData)
        TriggerClientEvent('qb-inventory:client:ItemBox', source, itemInfo, 'use')
        local playerPed = GetPlayerPed(src)
        local playerCoords = GetEntityCoords(playerPed)
        local players = QBCore.Functions.GetPlayers()
        local gender = item.info.gender == 0 and 'Male' or 'Female'
		TriggerClientEvent('qb-inventory:client:idcardanim', src)
        for _, v in pairs(players) do
            local targetPed = GetPlayerPed(v)
            local dist = #(playerCoords - GetEntityCoords(targetPed))
            if dist < 3.0 then
                TriggerClientEvent('chat:addMessage', v, {
                    template = '<div class="chat-message advert" style="background: linear-gradient(to right, rgba(5, 5, 5, 0.6), #74807c); display: flex;"><div style="margin-right: 10px;"><i class="far fa-id-card" style="height: 100%;"></i><strong> {0}</strong><br> <strong>Civ ID:</strong> {1} <br><strong>First Name:</strong> {2} <br><strong>Last Name:</strong> {3} <br><strong>Birthdate:</strong> {4} <br><strong>Gender:</strong> {5} <br><strong>Nationality:</strong> {6}</div></div>',
                    args = {
                        'ID Card',
                        item.info.citizenid,
                        item.info.firstname,
                        item.info.lastname,
                        item.info.birthdate,
                        gender,
                        item.info.nationality
                    }
                })
            end
        end
    elseif itemData.name == 'driver_license' then
        UseItem(itemData.name, src, itemData)
        TriggerClientEvent('qb-inventory:client:ItemBox', src, itemInfo, 'use')
        local playerPed = GetPlayerPed(src)
        local playerCoords = GetEntityCoords(playerPed)
        local players = QBCore.Functions.GetPlayers()
		TriggerClientEvent('qb-inventory:client:idcardanim', src)
        for _, v in pairs(players) do
            local targetPed = GetPlayerPed(v)
            local dist = #(playerCoords - GetEntityCoords(targetPed))
            if dist < 3.0 then
                TriggerClientEvent('chat:addMessage', v, {
                    template = '<div class="chat-message advert" style="background: linear-gradient(to right, rgba(5, 5, 5, 0.6), #657175); display: flex;"><div style="margin-right: 10px;"><i class="far fa-id-card" style="height: 100%;"></i><strong> {0}</strong><br> <strong>First Name:</strong> {1} <br><strong>Last Name:</strong> {2} <br><strong>Birth Date:</strong> {3} <br><strong>Licenses:</strong> {4}</div></div>',
                    args = {
                        'Drivers License',
                        item.info.firstname,
                        item.info.lastname,
                        item.info.birthdate,
                        item.info.type
                    }
                }
                )
            end
        end
    else
        UseItem(itemData.name, src, itemData)
        TriggerClientEvent('qb-inventory:client:ItemBox', src, itemInfo, 'use')
    end
end)

RegisterNetEvent('qb-inventory:server:openDrop', function(dropId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local playerPed = GetPlayerPed(src)
    local playerCoords = GetEntityCoords(playerPed)
    local drop = Drops[dropId]
    if not drop then return end
    if drop.isOpen then return end
    local distance = #(playerCoords - drop.coords)
    if distance > 2.5 then return end
    local formattedInventory = {
        name = dropId,
        label = dropId,
        maxweight = drop.maxweight,
        slots = drop.slots,
        inventory = drop.items
    }
    drop.isOpen = true
    TriggerClientEvent('qb-inventory:client:openInventory', source, Player.PlayerData.items, formattedInventory)
end)

RegisterNetEvent('qb-inventory:server:updateDrop', function(dropId, coords)
    Drops[dropId].coords = coords
end)

RegisterNetEvent('qb-inventory:server:snowball', function(action)
    if action == 'add' then
        AddItem(source, 'weapon_snowball', 1, false, false, 'qb-inventory:server:snowball')
    elseif action == 'remove' then
        RemoveItem(source, 'weapon_snowball', 1, false, 'qb-inventory:server:snowball')
    end
end)

-- Callbacks

QBCore.Functions.CreateCallback('qb-inventory:server:GetCurrentDrops', function(_, cb)
    cb(Drops)
end)

QBCore.Functions.CreateCallback('qb-inventory:server:createDrop', function(source, cb, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then
        cb(false)
        return
    end
	QBCore.Functions.TriggerCallback('NS-BattleRoyal:server:isGameActiveAndPlayerInvolved', function(isActive)
		if isActive then
			local logMessage = string.format('**%s (citizenid: %s | id: %s)** PlayerItems: %s', GetPlayerName(src), Player.PlayerData.citizenid, source, json.encode(Player.PlayerData.items))
			TriggerEvent('qb-log:server:CreateLog', 'lootcheats', 'Drop Bag', 'red', logMessage)
			return
		end
    end, src)
    local playerPed = GetPlayerPed(src)
    local playerCoords = GetEntityCoords(playerPed)
    if RemoveItem(src, item.name, item.amount, item.fromSlot, 'dropped item') then
        if item.type == 'weapon' then checkWeapon(src, item) end
        TaskPlayAnim(playerPed, 'pickup_object', 'pickup_low', 8.0, -8.0, 2000, 0, 0, false, false, false)
        local bag = CreateObjectNoOffset(Config.ItemDropObject, playerCoords.x + 0.5, playerCoords.y + 0.5, playerCoords.z, true, true, false)
        local dropId = NetworkGetNetworkIdFromEntity(bag)
        local newDropId = 'drop-' .. dropId
        local itemsTable = setmetatable({ item }, {
            __len = function(t)
                local length = 0
                for _ in pairs(t) do length += 1 end
                return length
            end
        })
        if not Drops[newDropId] then
            Drops[newDropId] = {
                name = newDropId,
                label = 'Drop',
                items = itemsTable,
                entityId = dropId,
                createdTime = os.time(),
                coords = playerCoords,
                maxweight = Config.DropSize.maxweight,
                slots = Config.DropSize.slots,
                isOpen = true
            }
            TriggerClientEvent('qb-inventory:client:setupDropTarget', -1, dropId)
        else
            table.insert(Drops[newDropId].items, item)
        end
        cb(dropId)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-inventory:server:attemptPurchase', function(source, cb, data)
    local itemInfo = data.item
    local amount = data.amount
	local src = source
    local shop = string.gsub(data.shop, 'shop%-', '')
	-- print(shop)
	-- print(itemInfo.price)
	
	if itemInfo.price then
		price = itemInfo.price * amount
		-- print("changed price")
	else
		bancount += 1
		TriggerClientEvent('QBCore:Notify', src, 'You are attempting an exploit and will be banned if you continue.', 'error')
		if bancount >= 2 then
			local reason = 'Shop Inventory Duplication'
			TriggerEvent('qb-log:server:CreateLog', 'bans', 'Player Kicked', 'red', string.format('%s was kicked by %s for %s', GetPlayerName(src), 'ACS', reason), true)
			DropPlayer(src, 'You have been kicked from the server\n' .. reason .. '\n\n 🔸 Check our Discord for more information: ' .. QBCore.Config.Server.Discord)
			bancount = 0
		end
		return false
	end
	
	-- print(price)
    local Player, citizenid = getPlayerAndCitizenId(src)
	if Config.Debug == true then
		print(Player)
		print(src)
		print(source)
		print("PLAYER")
		for k,v in pairs(Player) do
			print("key:"..tostring(k))
			print("value:"..tostring(v))
		end
		print("ITEMINFO")
		for k,v in pairs(itemInfo) do
			print("key:"..tostring(k))
			print("value:"..tostring(v))
		end
		print("DATA")
		for k,v in pairs(data) do
			print("key:"..tostring(k))
			print("value:"..tostring(v))
		end
	end
    if not Player or not citizenid then 
		cb(false)
		return 
	end

    if not Player then
        cb(false)
        return
    end
	if itemInfo.name == 'zipties' then
		if HasItem(src, 'zipties', 10) then
			TriggerClientEvent('QBCore:Notify', src, 'Cannot hold any more of this item', 'error')
			if again > 0 then
				bancount += 1
				TriggerClientEvent('QBCore:Notify', src, 'You are attempting an exploit and will be banned if you continue.', 'error')
				if bancount >= 2 then
					local reason = 'Attempted Exploit of Zipties carry amount'
					TriggerEvent('qb-log:server:CreateLog', 'bans', 'Player Kicked', 'red', string.format('%s was kicked by %s for %s', GetPlayerName(src), 'ACS', reason), true)
					DropPlayer(src, 'You have been kicked from the server\n' .. reason .. '\n\n 🔸 Check our Discord for more information: ' .. QBCore.Config.Server.Discord)
					bancount = 0
				end
				cb(false)
				return
			else
				again = again + 1
				cb(false)
				return
			end
		end
	end
    local shopInfo = RegisteredShops[shop]
    if not shopInfo then
        cb(false)
        return
    end

    local playerPed = GetPlayerPed(src)
    local playerCoords = GetEntityCoords(playerPed)
    if shopInfo.coords then
        local shopCoords = vector3(shopInfo.coords.x, shopInfo.coords.y, shopInfo.coords.z)
        if #(playerCoords - shopCoords) > 10 then
            cb(false)
            return
        end
    end

    if not CanAddItem(src, itemInfo.name, amount) then
        TriggerClientEvent('QBCore:Notify', src, 'Cannot hold item', 'error')
        cb(false)
        return
    end
	-- print("this is a society")
	-- print(shopInfo.society)
	-- print("this is a society")
	if price == nil then
		TriggerClientEvent('QBCore:Notify', src, 'This is a tracked error please report this immediately to staff!', 'error')
		TriggerClientEvent('QBCore:Notify', src, 'Ensure Staff get this error Code: ECI436', 'error')
        cb(false)
        return
	end
	if Player.PlayerData.money.cash == nil then
		TriggerClientEvent('QBCore:Notify', src, 'This is a tracked error please report this immediately to staff!', 'error')
		TriggerClientEvent('QBCore:Notify', src, 'Ensure Staff get this error Code: ECI442', 'error')
        cb(false)
        return
	end
	if itemInfo.name == 'xanax_bottle' or itemInfo.name == 'morphine_bottle' or itemInfo.name == 'oxycodone_bottle' or itemInfo.name == 'amoxixillin_bottle' or itemInfo.name == 'ibuprofen_bottle' then
		if itemInfo.name == 'xanax_bottle' then
			if HasItem(src, 'xscript') then
				local PrescribedPlayer = QBCore.Functions.GetPlayer(src)
				if not PrescribedPlayer then return end
				local licenseTable = PrescribedPlayer.PlayerData.metadata['licences']
				if not licenseTable['xscript'] then
					TriggerClientEvent('QBCore:Notify', src, 'You do not have this license', 'error')
					return
				end
				licenseTable['xscript'] = false
				PrescribedPlayer.Functions.SetMetaData('licences', licenseTable)
				TriggerClientEvent('QBCore:Notify', src, 'Prescription FulFilled', 'success')
			else
				TriggerClientEvent('QBCore:Notify', src, 'You do not have your xanax prescription in your inventory', 'error')
				cb(false)
			end
		elseif itemInfo.name == 'morphine_bottle' then
			if HasItem(src, 'mscript') then
				local PrescribedPlayer = QBCore.Functions.GetPlayer(src)
				if not PrescribedPlayer then return end
				local licenseTable = PrescribedPlayer.PlayerData.metadata['licences']
				if not licenseTable['mscript'] then
					TriggerClientEvent('QBCore:Notify', src, 'You do not have this license', 'error')
					return
				end
				licenseTable['mscript'] = false
				PrescribedPlayer.Functions.SetMetaData('licences', licenseTable)
				TriggerClientEvent('QBCore:Notify', src, 'Prescription FulFilled', 'success')
			else
				TriggerClientEvent('QBCore:Notify', src, 'You do not have your morphine prescription in your inventory', 'error')
				cb(false)
			end
		elseif itemInfo.name == 'oxycodone_bottle' then
			if HasItem(src, 'oscript') then
				local PrescribedPlayer = QBCore.Functions.GetPlayer(src)
				if not PrescribedPlayer then return end
				local licenseTable = PrescribedPlayer.PlayerData.metadata['licences']
				if not licenseTable['oscript'] then
					TriggerClientEvent('QBCore:Notify', src, 'You do not have this license', 'error')
					return
				end
				licenseTable['oscript'] = false
				PrescribedPlayer.Functions.SetMetaData('licences', licenseTable)
				TriggerClientEvent('QBCore:Notify', src, 'Prescription FulFilled', 'success')
			else
				TriggerClientEvent('QBCore:Notify', src, 'You do not have your oxycodone prescription in your inventory', 'error')
				cb(false)
			end
		elseif itemInfo.name == 'amoxixillin_bottle' then
			if HasItem(src, 'ascript') then
				local PrescribedPlayer = QBCore.Functions.GetPlayer(src)
				if not PrescribedPlayer then return end
				local licenseTable = PrescribedPlayer.PlayerData.metadata['licences']
				if not licenseTable['ascript'] then
					TriggerClientEvent('QBCore:Notify', src, 'You do not have this license', 'error')
					return
				end
				licenseTable['ascript'] = false
				PrescribedPlayer.Functions.SetMetaData('licences', licenseTable)
				TriggerClientEvent('QBCore:Notify', src, 'Prescription FulFilled', 'success')
			else
				TriggerClientEvent('QBCore:Notify', src, 'You do not have your amoxixillin prescription in your inventory', 'error')
				cb(false)
			end
		elseif itemInfo.name == 'ibuprofen_bottle' then
			if HasItem(src, 'iscript') then
				local PrescribedPlayer = QBCore.Functions.GetPlayer(src)
				if not PrescribedPlayer then return end
				local licenseTable = PrescribedPlayer.PlayerData.metadata['licences']
				if not licenseTable['iscript'] then
					TriggerClientEvent('QBCore:Notify', src, 'You do not have this license', 'error')
					return
				end
				licenseTable['iscript'] = false
				PrescribedPlayer.Functions.SetMetaData('licences', licenseTable)
				TriggerClientEvent('QBCore:Notify', src, 'Prescription FulFilled', 'success')
			else
				TriggerClientEvent('QBCore:Notify', src, 'You do not have your ibuprofen prescription in your inventory', 'error')
				cb(false)
			end
		end
	end
    if Player.PlayerData.money.cash >= price then
        Player.Functions.RemoveMoney('cash', price, tostring(shop)..' shop-purchase: '..tostring(itemInfo.name)..'x'..tostring(amount))
		if shopInfo.society ~= nil then
			exports['qb-banking']:AddMoney(shopInfo.society, math.floor(price/5), 'shop-purchase')
		end
        AddItem(src, itemInfo.name, amount, nil, itemInfo.info, 'shop-purchase')
        TriggerEvent('qb-shops:server:UpdateShopItems', shop, itemInfo, amount)
        cb(true)
    elseif Player.PlayerData.money.bank >= price then
        Player.Functions.RemoveMoney('bank', price,  tostring(shop)..' shop-purchase: '..tostring(itemInfo.name)..'x'..tostring(amount))
		if shopInfo.society ~= nil then
			exports['qb-banking']:AddMoney(shopInfo.society, math.floor(price/5), 'shop-purchase')
		end
        AddItem(src, itemInfo.name, amount, nil, itemInfo.info, 'shop-purchase')
        TriggerEvent('qb-shops:server:UpdateShopItems', shop, itemInfo, amount)
        cb(true)
	
	else
        TriggerClientEvent('QBCore:Notify', src, 'You do not have enough money', 'error')
        cb(false)
    end
	
end)

QBCore.Functions.CreateCallback('qb-inventory:server:giveItem', function(source, cb, target, item, amount, slot, info)
    local player = QBCore.Functions.GetPlayer(source)
    if not player or player.PlayerData.metadata['isdead'] or player.PlayerData.metadata['inlaststand'] or player.PlayerData.metadata['ishandcuffed'] then
        cb(false)
        return
    end
    local playerPed = GetPlayerPed(source)

    local Target = QBCore.Functions.GetPlayer(target)
    if not Target or Target.PlayerData.metadata['isdead'] or Target.PlayerData.metadata['inlaststand'] or Target.PlayerData.metadata['ishandcuffed'] then
        cb(false)
        return
    end
    local targetPed = GetPlayerPed(target)

    local pCoords = GetEntityCoords(playerPed)
    local tCoords = GetEntityCoords(targetPed)
    if #(pCoords - tCoords) > 5 then
        cb(false)
        return
    end

    local itemInfo = QBCore.Shared.Items[item:lower()]
    if not itemInfo then
        cb(false)
        return
    end

    local hasItem = HasItem(source, item)
    if not hasItem then
        cb(false)
        return
    end

    local itemAmount = GetItemByName(source, item).amount
    if itemAmount <= 0 then
        cb(false)
        return
    end

    local giveAmount = tonumber(amount)
    if giveAmount > itemAmount then
        cb(false)
        return
    end

    local removeItem = RemoveItem(source, item, giveAmount, slot, 'Item given to ID #' .. target)
    if not removeItem then
        cb(false)
        return
    end

    local giveItem = AddItem(target, item, giveAmount, false, info, 'Item given from ID #' .. source)
    if not giveItem then
        cb(false)
        return
    end

    if itemInfo.type == 'weapon' then checkWeapon(source, item) end
    TriggerClientEvent('qb-inventory:client:giveAnim', source)
    TriggerClientEvent('qb-inventory:client:ItemBox', source, itemInfo, 'remove', giveAmount)
    TriggerClientEvent('qb-inventory:client:giveAnim', target)
    TriggerClientEvent('qb-inventory:client:ItemBox', target, itemInfo, 'add', giveAmount)
    if Player(target).state.inv_busy then TriggerClientEvent('qb-inventory:client:updateInventory', target) end
    cb(true)
end)

-- Item move logic

local function getItem(inventoryId, src, slot)
    local item
    if inventoryId == 'player' then
        local Player = QBCore.Functions.GetPlayer(src)
        item = Player.PlayerData.items[slot]
    elseif inventoryId:find('otherplayer-') then
        local targetId = tonumber(inventoryId:match('otherplayer%-(.+)'))
        local targetPlayer = QBCore.Functions.GetPlayer(targetId)
        if targetPlayer then
            item = targetPlayer.PlayerData.items[slot]
        end
    elseif inventoryId:find('drop-') == 1 then
        item = Drops[inventoryId]['items'][slot]
    else
        item = Inventories[inventoryId]['items'][slot]
    end
    return item
end

local function getIdentifier(inventoryId, src)
    if inventoryId == 'player' then
        return src
    elseif inventoryId:find('otherplayer-') then
        return tonumber(inventoryId:match('otherplayer%-(.+)'))
    else
        return inventoryId
    end
end
-- ============================================================================
-- PROTECTED VERSION OF SetInventoryData
-- Replace your existing RegisterNetEvent('qb-inventory:server:SetInventoryData'...)
-- with this entire block
-- ============================================================================

RegisterNetEvent('qb-inventory:server:SetInventoryData', function(fromInventory, toInventory, fromSlot, toSlot, fromAmount, toAmount)
    local src = source
    local ped = GetPlayerPed(src)
    
    -- PROTECTION 1: Check if player is already processing
    if Entity(ped).state.inv_busy then 
        TriggerClientEvent('QBCore:Notify', src, 'Processing, please wait...', 'error')
        return
    end
    
    -- PROTECTION 2: Block shop transfers (original check)
    if toInventory:find('shop-') then return end
    
    -- PROTECTION 3: Validate inputs (original check)
    if not fromInventory or not toInventory or not fromSlot or not toSlot or not fromAmount or not toAmount then return end
    
    -- PROTECTION 4: Get player (original check)
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
    -- PROTECTION 5: Lock player state
    Entity(ped).state:set('inv_busy', true, true)

    -- Convert to numbers (original code)
    fromSlot, toSlot, fromAmount, toAmount = tonumber(fromSlot), tonumber(toSlot), tonumber(fromAmount), tonumber(toAmount)

    -- Get items (original code)
    local fromItem = getItem(fromInventory, src, fromSlot)
    local toItem = getItem(toInventory, src, toSlot)

    -- Perform transfer (original code wrapped in pcall for error handling)
    local success = pcall(function()
        if fromItem then
            if not toItem and toAmount > fromItem.amount then return end
            if fromInventory == 'player' and toInventory ~= 'player' then checkWeapon(src, fromItem) end

            local fromId = getIdentifier(fromInventory, src)
            local toId = getIdentifier(toInventory, src)

            if toItem and fromItem.name == toItem.name then
                if RemoveItem(fromId, fromItem.name, toAmount, fromSlot, 'stacked item') then
                    AddItem(toId, toItem.name, toAmount, toSlot, toItem.info, 'stacked item')
					TriggerClientEvent('qb-inventory:client:updateInventory', src)
                end
            elseif not toItem and toAmount < fromAmount then
                if RemoveItem(fromId, fromItem.name, toAmount, fromSlot, 'split item') then
                    AddItem(toId, fromItem.name, toAmount, toSlot, fromItem.info, 'split item')
					TriggerClientEvent('qb-inventory:client:updateInventory', src)
                end
            else
                if toItem then
                    local fromItemAmount = fromItem.amount
                    local toItemAmount = toItem.amount

                    if RemoveItem(fromId, fromItem.name, fromItemAmount, fromSlot, 'swapped item') and RemoveItem(toId, toItem.name, toItemAmount, toSlot, 'swapped item') then
                        AddItem(toId, fromItem.name, fromItemAmount, toSlot, fromItem.info, 'swapped item')
                        AddItem(fromId, toItem.name, toItemAmount, fromSlot, toItem.info, 'swapped item')
						TriggerClientEvent('qb-inventory:client:updateInventory', src)
                    end
                else
                    if RemoveItem(fromId, fromItem.name, toAmount, fromSlot, 'moved item') then
                        AddItem(toId, fromItem.name, toAmount, toSlot, fromItem.info, 'moved item')
						TriggerClientEvent('qb-inventory:client:updateInventory', src)
                    end
                end
            end
        end
    end)
    
    -- PROTECTION 6: Always unlock player state (even if error occurred)
    Entity(ped).state:set('inv_busy', false, true)
    
    -- PROTECTION 7: Log errors if any
    if not success then
        print('[QB-Inventory] Transfer error for player ' .. GetPlayerName(src))
    end
end)

-- Admin command to check/fix stuck inventories
RegisterCommand('checkinv', function(source, args)
    local Players = QBCore.Functions.GetQBPlayers()
    local stuckPlayers = {}
    
    for id, player in pairs(Players) do
        local ped = GetPlayerPed(id)
        if ped and ped > 0 and Entity(ped).state.inv_busy then
            stuckPlayers[#stuckPlayers + 1] = {
                id = id,
                name = GetPlayerName(id)
            }
        end
    end
    
    if #stuckPlayers > 0 then
        print('Players stuck in busy state:')
        for _, player in ipairs(stuckPlayers) do
            print(string.format('  - %s (%s)', player.name, player.id))
            local ped = GetPlayerPed(player.id)
            if ped and ped > 0 then
                Entity(ped).state:set('inv_busy', false, true)
            end
            TriggerClientEvent('QBCore:Notify', player.id, 'Your inventory has been unlocked', 'success')
        end
        if source > 0 then
            TriggerClientEvent('QBCore:Notify', source, 'Unlocked ' .. #stuckPlayers .. ' stuck inventories', 'success')
        end
    else
        print('No players stuck in busy state')
        if source > 0 then
            TriggerClientEvent('QBCore:Notify', source, 'No stuck inventories found', 'success')
        end
    end
end, 'admin')
