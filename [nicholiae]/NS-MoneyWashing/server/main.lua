local QBCore = exports['qb-core']:GetCoreObject()
local markedworth = 0

local function exploitBan(id, reason)
    MySQL.insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)',
        {
            GetPlayerName(id),
            QBCore.Functions.GetIdentifier(id, 'license'),
            QBCore.Functions.GetIdentifier(id, 'discord'),
            QBCore.Functions.GetIdentifier(id, 'ip'),
            reason,
            2147483647,
            'NS-MoneyWashing'
        })
    TriggerEvent('qb-log:server:CreateLog', 'MoneyWashing', 'Player Banned', 'red',
        string.format('%s was banned by %s for %s', GetPlayerName(id), 'NS-MoneyWashing', reason), true)
    DropPlayer(id, 'You were permanently banned by the server for: Exploiting')
end

RegisterNetEvent('NS-MoneyWashing:server:sellPawnItems', function(itemName, itemAmount, itemPrice)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local totalPrice = (tonumber(itemAmount) * itemPrice)
	local taxes = totalPrice*(Config.tax*0.01)
	local totalPaid = totalPrice - taxes
    local playerCoords = GetEntityCoords(GetPlayerPed(src))
    local dist
    for _, value in pairs(Config.WashLocation) do
        dist = #(playerCoords - value.coords)
        if #(playerCoords - value.coords) < 2 then
            dist = #(playerCoords - value.coords)
            break
        end
    end
    if dist > 5 then
        exploitBan(src, 'MoneyWashing Exploiting')
        return
    end
    if exports['qb-inventory']:RemoveItem(src, itemName, tonumber(itemAmount), false, 'NS-MoneyWashing:server:sellPawnItems') then
        if Config.BankMoney then
            Player.Functions.AddMoney('bank', totalPaid, 'NS-MoneyWashing:server:sellPawnItems')
        else
            Player.Functions.AddMoney('cash', totalPaid, 'NS-MoneyWashing:server:sellPawnItems')
        end
		exports['qb-banking']:AddMoney('police', taxes, 'washing money')
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.sold', { value = tonumber(itemAmount), value2 = QBCore.Shared.Items[itemName].label, value3 = totalPaid }), 'success')
        TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], 'remove')
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.no_items'), 'error')
    end
    TriggerClientEvent('NS-MoneyWashing:client:openMenu', src)
end)

RegisterNetEvent('NS-MoneyWashing:server:WashItemRemove', function(itemName, itemAmount, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local itemData = QBCore.Shared.Items[itemName]
	markedworth = tonumber(item.worth)
	
    if exports['qb-inventory']:RemoveItem(src, itemName, itemAmount, item.slot, 'NS-MoneyWashing:server:WashItemRemove') then
        TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], 'remove')
        local WashTime = (tonumber(itemAmount) * item.time)
        TriggerClientEvent('NS-MoneyWashing:client:startWashing', src, item, tonumber(itemAmount), (WashTime * 60))
        TriggerClientEvent('QBCore:Notify', src, Lang:t('info.melt_wait', { value = WashTime }), 'primary')
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.no_items'), 'error')
    end
end)

RegisterNetEvent('NS-MoneyWashing:server:pickupWashed', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local playerCoords = GetEntityCoords(GetPlayerPed(src))
    local dist
    for _, value in pairs(Config.WashLocation) do
        dist = #(playerCoords - value.coords)
        if #(playerCoords - value.coords) < 2 then
            dist = #(playerCoords - value.coords)
            break
        end
    end
    if dist > 5 then
        exploitBan(src, 'pickupWashed Exploiting')
        return
    end
    for _, v in pairs(item.items) do
        local WashedAmount = v.amount
        for _, m in pairs(v.item.reward) do
            local rewardAmount = m.amount
			local payout = (WashedAmount * markedworth)*((100-Config.tax)/100)
			-- print ("end"..markedworth)
			local taxesPaid = (WashedAmount * markedworth) - payout 
			Player.Functions.AddMoney('cash', payout, 'washing money')
			exports['qb-banking']:AddMoney('police', taxesPaid, 'washing money')
			TriggerClientEvent('QBCore:Notify', src, Lang:t('success.items_received', { value = payout, value2 = WashedAmount, value3 = markedworth, value4 = taxesPaid }), 'success')
			TriggerClientEvent('NS-MoneyWashing:client:resetPickup', src)
        end
    end
    TriggerClientEvent('NS-MoneyWashing:client:openMenu', src)
end)

QBCore.Functions.CreateCallback('NS-MoneyWashing:server:getInv', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local inventory = Player.PlayerData.items
    return cb(inventory)
end)
