local QBCore = exports['qb-core']:GetCoreObject()

-- Functions


local function ResetPlayerXP(source, xpGain, xpType)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        local currentXP = Player.Functions.GetRep(xpType)
        local newXP = 0
        Player.Functions.SetRep(xpType, newXP)
		Player.PlayerData.metadata['pimpmultiplier'] = 1
		Player.Functions.SetMetaData('pimpmultiplier', 1)
        -- TriggerClientEvent('QBCore:Notify', source, 'You have gained '..xpGain..' of '..xpType, 'success')
    end
end


local function IncreasePlayerXP(source, xpGain, xpType)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        local currentXP = Player.Functions.GetRep(xpType)
        local newXP = currentXP + xpGain
        Player.Functions.SetRep(xpType, newXP)
        TriggerClientEvent('QBCore:Notify', source, 'You have gained '..xpGain..' of '..xpType, 'success')
    end
end


-- Callbacks

QBCore.Functions.CreateCallback('crafting:getPlayerXP', function(source, cb)
    local player = QBCore.Functions.GetPlayer(source)
    if player then
        cb(Player.Functions.GetRep('craftingrep'))
    else
        cb({})
    end
end)

QBCore.Functions.CreateCallback('crafting:getPlayerInventory', function(source, cb)
    local player = QBCore.Functions.GetPlayer(source)
    if player then
        cb(player.PlayerData.items)
    else
        cb({})
    end
end)

QBCore.Functions.CreateCallback('crafting:getPlayerJob', function(source, cb)
    local player = QBCore.Functions.GetPlayer(source)
    if player then
        cb(player.PlayerData.job.name)
    else
        cb({})
    end
end)

-- Events
RegisterServerEvent('ns-crafting:server:resetPlayerXp', function(xpType)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
		local check = MySQL.prepare.await('SELECT `reset` FROM `players` where `citizenid` = ?', { Player.PlayerData.citizenid })
		if check == 0 then				
			MySQL.prepare('UPDATE `players` SET `reset` = ? WHERE `citizenid` = ?',{1, Player.PlayerData.citizenid})
			ResetPlayerXP(src, 0, xpType)
		end
    end
end)

RegisterServerEvent('ns-crafting:server:removeMaterials', function(itemName, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        exports['qb-inventory']:RemoveItem(src, itemName, amount, false, 'ns-crafting:server:removeMaterials')
        TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], 'remove')
    end
end)

RegisterNetEvent('ns-crafting:server:removeCraftingTable', function(benchType)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    exports['qb-inventory']:RemoveItem(src, benchType, 1, false, 'ns-crafting:server:removeCraftingTable')
    TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[benchType], 'remove')
    TriggerClientEvent('QBCore:Notify', src, 'Placed the Table', 'success')
end)

RegisterNetEvent('ns-crafting:server:addCraftingTable', function(benchType)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if not exports['qb-inventory']:AddItem(src, benchType, 1, false, false, 'ns-crafting:server:addCraftingTable') then return end
    TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[benchType], 'add')
end)

RegisterNetEvent('ns-crafting:server:receiveItem', function(craftedItem, requiredItems, amountToCraft, xpGain, xpType, yield)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local canGive = true
	-- print(yield)
    for _, requiredItem in ipairs(requiredItems) do
        if not exports['qb-inventory']:RemoveItem(src, requiredItem.item, requiredItem.amount, false, 'ns-crafting:server:receiveItem') then
            -- canGive = false
            return
        end
        TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[requiredItem.item], 'remove')
    end
    if canGive then
		xpGain = amountToCraft * xpGain
		amountToCraft = amountToCraft * yield
        if not exports['qb-inventory']:AddItem(src, craftedItem, amountToCraft, false, false, 'ns-crafting:server:receiveItem') then return end
        TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[craftedItem], 'add')
        TriggerClientEvent('QBCore:Notify', src, 'Successfully crafted '..tostring(craftedItem), 'success')
        IncreasePlayerXP(src, xpGain, xpType)
    end
end)
