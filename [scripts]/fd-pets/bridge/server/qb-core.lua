local resourceName = 'qb-core'
if not GetResourceState(resourceName):find('start') then return end
if GetResourceState('qb_core'):find('start') then return end

local animals = require 'config.animals'

SetTimeout(0, function()
    local QBCore = exports[resourceName]:GetCoreObject()

    RegisterServerEvent("fd-pets:server:recallPet", function()
        local src = source
        TriggerClientEvent("fdqb-pets:client:endThread", src)
    end)

    RegisterServerEvent("fd-pets:server:entityDead", function()
        local src = source
        TriggerClientEvent("fdqb-pets:client:endThread", src)
    end)

    for name, _ in pairs(animals) do
        QBCore.Functions.CreateUseableItem(name, function(source, item)
            TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
        end)
    end
end)
