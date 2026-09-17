local resourceName = 'es_extended'
if not GetResourceState(resourceName):find('start') then return end

local animals = require 'config.animals'

SetTimeout(0, function()
    local ESX = exports.es_extended:getSharedObject()

    RegisterServerEvent("fd-pets:server:recallPet", function()
        local src = source
        TriggerClientEvent("fd-pets:client:endThread", src)
    end)

    RegisterServerEvent("fd-pets:server:entityDead", function()
        local src = source
        TriggerClientEvent("fd-pets:client:endThread", src)
    end)

    for name, _ in pairs(animals) do
        ESX.RegisterUsableItem(name, function(source, item)
            TriggerClientEvent("fd-pets:actions:spawnpet", source, item)
        end)
    end
end)
