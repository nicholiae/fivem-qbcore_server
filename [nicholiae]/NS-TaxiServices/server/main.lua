local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('CxC:NPCTaxi:pay')
AddEventHandler('CxC:NPCTaxi:pay', function(price)
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    
    -- Validate price parameter
    if type(price) ~= "number" or price <= 0 then
        TriggerClientEvent('QBCore:Notify', source, 'Invalid taxi fare!', "error")
        if Config.Debug then 
            print("^0[^5Debug^7][^1Error^0]: ^1Invalid price parameter received from Player-ID: ".._source)
        end
        return
    end
    
    -- Round price to 2 decimal places
    price = math.floor(price * 100 + 0.5) / 100
    
    local playerCash = xPlayer.PlayerData.money.cash
    local playerBank = xPlayer.PlayerData.money.bank
    
    -- Corrected logic: remove from cash first, then bank if needed
    if playerCash >= price then
        xPlayer.Functions.RemoveMoney('cash', price)
        if Config.Debug then 
            print("^0[^5Debug^7][^3Information^0]: ^2Successfully removed $"..price.." from cash for taxi ride from Player-ID: ".._source)
        end
    elseif playerBank >= price then
        xPlayer.Functions.RemoveMoney('bank', price)
        if Config.Debug then 
            print("^0[^5Debug^7][^3Information^0]: ^2Successfully removed $"..price.." from bank for taxi ride from Player-ID: ".._source)
        end
    else
        -- Player doesn't have enough money
        TriggerClientEvent('QBCore:Notify', source, 'You do not have enough money for the taxi ride! Fare: $'..price, "error")
        if Config.Debug then 
            print("^0[^5Debug^7][^1Error^0]: ^1Player-ID: ".._source.." does not have enough money for taxi fare $"..price)
        end
        return
    end
    
    TriggerClientEvent('QBCore:Notify', source, 'You paid total of $'..price..' for the taxi journey!', "success")
end)

QBCore.Commands.Add('callTaxi', 'Call an NPC taxi to get you around', {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('CxC:NpcTaxi:call', src)
end)

QBCore.Commands.Add('cancelTaxi', 'Cancel an NPC Taxi Call', {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local cancel = true
    TriggerClientEvent('CxC:Taxi:cancelTaxi', src, cancel)
end)

QBCore.Commands.Add('resetTaxi', 'Reset the taxi service', {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('CxC:Taxi:reset', src)
end)