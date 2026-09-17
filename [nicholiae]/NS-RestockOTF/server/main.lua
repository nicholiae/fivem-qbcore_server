local QBCore = exports['qb-core']:GetCoreObject()

-- Events

RegisterNetEvent('NS-RestockOTF:server:getItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for _ = 1, math.random(1, Config_OTF.MaxItemsReceived), 1 do
        local randItem = Config_OTF.ItemTable[math.random(1, #Config_OTF.ItemTable)]
        local amount = math.random(Config_OTF.MinItemReceivedQty, Config_OTF.MaxItemReceivedQty)
        exports['qb-inventory']:AddItem(src, randItem, amount, false, false, 'NS-RestockOTF:server:getItem')
        TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add')
        Wait(500)
    end

    local chance = math.random(1, 100)
    if chance < 7 then
        exports['qb-inventory']:AddItem(src, Config_OTF.ChanceItem, 1, false, false, 'NS-RestockOTF:server:getItem')
        TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[Config_OTF.ChanceItem], 'add')
    end

    local luck = math.random(1, 10)
    local odd = math.random(1, 10)
    if luck == odd then
        local random = math.random(1, 3)
        exports['qb-inventory']:AddItem(src, Config_OTF.LuckyItem, random, false, false, 'NS-RestockOTF:server:getItem')
        TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[Config_OTF.LuckyItem], 'add')
    end
end)
