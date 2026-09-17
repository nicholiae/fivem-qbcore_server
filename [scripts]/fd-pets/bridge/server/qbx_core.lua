local resourceName = 'qbx_core'
if not GetResourceState(resourceName):find('start') then return end

local animals = require 'config.animals'

SetTimeout(0, function()
    RegisterServerEvent("fd-pets:server:recallPet", function()
        local src = source
        TriggerClientEvent("fdqb-pets:client:endThread", src)
    end)

    RegisterServerEvent("fd-pets:server:entityDead", function()
        local src = source
        TriggerClientEvent("fdqb-pets:client:endThread", src)
    end)

    for name, _ in pairs(animals) do
        exports.qbx_core:CreateUseableItem(name, function(source, item)
            TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
        end)
    end
end)
