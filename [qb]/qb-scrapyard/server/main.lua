local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    while true do
        Wait(1000)
        GenerateVehicleList()
        Wait((1000 * 60) * 60)
    end
end)

RegisterNetEvent('qb-scrapyard:server:LoadVehicleList', function()
    local src = source
    TriggerClientEvent('qb-scapyard:client:setNewVehicles', src, Config.CurrentVehicles)
end)


QBCore.Functions.CreateCallback('qb-scrapyard:checkOwnerVehicle', function(_, cb, plate)
    local result = MySQL.scalar.await('SELECT `plate` FROM `player_vehicles` WHERE `plate` = ?', { plate })
    if result then
        cb(false)
    else
        cb(true)
    end
end)


RegisterNetEvent('qb-scrapyard:server:ScrapVehicle', function(listKey)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    -- if Config.CurrentVehicles[listKey] ~= nil then
        for _ = 1, math.random(3, 5), 1 do
            local item = Config.Items[math.random(1, #Config.Items)]
            exports['qb-inventory']:AddItem(src, item, math.random(25, 45), false, false, 'qb-scrapyard:server:ScrapVehicle')
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
            Wait(500)
        end
        local Luck = math.random(1, 20)
        local Odd = math.random(1, 10)
        if Luck == Odd then
            local trandom = math.random(1, 3)
            exports['qb-inventory']:AddItem(src, 'cryptostick', trandom, false, false, 'qb-scrapyard:server:ScrapVehicle')
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['cryptostick'], 'add')
        end
        Config.CurrentVehicles[listKey] = nil
        TriggerClientEvent('qb-scapyard:client:setNewVehicles', -1, Config.CurrentVehicles)
    -- end
end)

function GenerateVehicleList()
    Config.CurrentVehicles = {}
    for i = 1, Config.VehicleCount, 1 do
        local randVehicle = Config.Vehicles[math.random(1, #Config.Vehicles)]
        if not IsInList(randVehicle) then
            Config.CurrentVehicles[i] = randVehicle
        end
    end
    TriggerClientEvent('qb-scapyard:client:setNewVehicles', -1, Config.CurrentVehicles)
end

function IsInList(name)
    local retval = false
    if Config.CurrentVehicles ~= nil and next(Config.CurrentVehicles) ~= nil then
        for k in pairs(Config.CurrentVehicles) do
            if Config.CurrentVehicles[k] == name then
                retval = true
            end
        end
    end
    return retval
end
