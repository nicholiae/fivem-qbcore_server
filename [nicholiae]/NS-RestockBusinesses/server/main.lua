local QBCore = exports['qb-core']:GetCoreObject()

-- Events

RegisterNetEvent('NS-RestockBusiness:server:getItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for _ = 1, math.random(1, Config_Business.MaxItemsReceived), 1 do
        local randItem = Config_Business.ItemTable[math.random(1, #Config_Business.ItemTable)]
        local amount = math.random(Config_Business.MinItemReceivedQty, Config_Business.MaxItemReceivedQty)
        exports['qb-inventory']:AddItem(src, randItem, amount, false, false, 'NS-RestockBusiness:server:getItem')
        TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add')
        Wait(500)
    end

    local chance = math.random(1, 100)
    if chance < 7 then
        exports['qb-inventory']:AddItem(src, Config_Business.ChanceItem, 1, false, false, 'NS-RestockBusiness:server:getItem')
        TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[Config_Business.ChanceItem], 'add')
    end

    local luck = math.random(1, 10)
    local odd = math.random(1, 10)
    if luck == odd then
        local random = math.random(1, 3)
        exports['qb-inventory']:AddItem(src, Config_Business.LuckyItem, random, false, false, 'NS-RestockBusiness:server:getItem')
        TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[Config_Business.LuckyItem], 'add')
    end
end)
