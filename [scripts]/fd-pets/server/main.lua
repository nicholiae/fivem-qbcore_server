local General = require 'config.general'
local Animals = require 'config.animals'
local QBCore = exports['qb-core']:GetCoreObject()

Data = {
    pets = {},
    timeouts = {}
}

retreivePetConfig = function(pet)
    return Animals[pet] or nil
end

RegisterServerEvent("fd-pets:server:spawnPet", function(coords, pet)
    local _src = source
    local config = retreivePetConfig(pet)

    if not config then
        if General.debug then
            print("Cannot retreive pet config! Please check your configuration!", pet)
        end

        return
    end

    if not Utils.CanPlayerSpawnPet(_src, pet, config) then
        if General.debug then
            print("Player tried to spawn an animal, but wasn't allowed to.")
        end

        return
    end

    local entity = Data.pets["src_" .. _src]

    if entity then
        local timeout = nil

        if Data.timeouts["src_" .. _src] then
            timeout = Utils.SecondsToClock(Data.timeouts["src_" .. _src] - os.time())
        end

        Utils.OnPetAlreadyExists(_src, pet, config, entity, timeout or nil)
        return
    end

    local animation = config.animations.calling or nil

    if animation and animation.dict and animation.anim then
        TriggerClientEvent("fd-pets:client:playCallingAnimation", _src, animation)
    end

    local info = coords

    local pedId = CreatePed(2, GetHashKey(config.model), info.x, info.y, info.z, info.heading, true, true)

    if config.skin then
        for _, values in pairs(config.skin) do
            SetPedComponentVariation(pedId, values[1] or 0, values[2] or 0, values[3] or 0, values[4] or 0)
        end
    end

    Data.pets["src_" .. _src] = pedId

    TriggerClientEvent("fd-pets:client:updateNetworkId", _src, NetworkGetNetworkIdFromEntity(pedId), pet)
end)

RegisterServerEvent("fd-pets:server:getitem", function(itemToGive)
    local src = source
    local petItemName = itemToGive 
	-- print(petItemName)
	exports['qb-inventory']:AddItem(src, petItemName, 1, false, false, 'Captured Pet')
    exports['qb-inventory']:RemoveItem(src, 'petnet', 1, false, 'Captured Pet')
	
end)

RegisterServerEvent("fd-pets:server:deleteTheDead", function(pet)
    local src = source
    local petItemName = pet 
	exports['qb-inventory']:RemoveItem(src, petItemName, 1, false, 'dead pet')
    TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[petItemName], 'remove')
    TriggerClientEvent('QBCore:Notify', src, 'Your pet '..tostring(petItemName)..' has died', 'warning')
	
end)

RegisterServerEvent("fd-pets:server:entityDead", function()
    local _src = source
    local entity = Data.pets["src_" .. _src]

    if not entity then return end

    Utils.OnEntityDiedOrDoesntExist(_src, entity)

    Data.timeouts["src_" .. _src] = os.time() + (General.timeouts.beforeAllowingToSpawnNewPet / 1000)

    Citizen.SetTimeout(General.timeouts.beforeAllowingToSpawnNewPet, function()
        if General.debug then
            print('Reseting entity')
        end

        Data.pets["src_" .. _src] = nil
        Data.timeouts["src_" .. _src] = nil
    end)

    if not DoesEntityExist(entity) then return end

    Citizen.SetTimeout(General.timeouts.beforeRemovingPet, function()
        if General.debug then
            print('Deleting entity')
        end

        DeleteEntity(entity)
    end)
end)

RegisterServerEvent("fd-pets:server:recallPet", function()
    local _src = source
    local entity = Data.pets["src_" .. _src]

    if not entity then return end

    Utils.OnEntityRecalled(_src, entity)
    DeleteEntity(entity)

    if not General.timeouts.respawnTimeoutEnabledOnRecall then
        Data.pets["src_" .. _src] = nil
        return
    end

    Data.timeouts["src_" .. _src] = os.time() + (General.timeouts.beforeAllowingToSpawnNewPet / 1000)

    Citizen.SetTimeout(General.timeouts.beforeAllowingToSpawnNewPet, function()
        if General.debug then
            print('Reseting entity')
        end

        Data.pets["src_" .. _src] = nil
        Data.timeouts["src_" .. _src] = nil
    end)
end)

AddEventHandler('playerDropped', function()
    local _src = source
    local entity = Data.pets["src_" .. _src]

    DeleteEntity(entity)
    Data.pets["src_" .. _src] = nil
end)
