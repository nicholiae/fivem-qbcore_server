local General = require 'config.general'

RegisterNetEvent("fd-pets:client:updateNetworkId", function(id, pet)
    return setUpPet(id, pet)
end)

RegisterNetEvent("fd-pets:actions:perform", function(action)
    if type(Actions[action]) == 'function' then
        if General.debug then
            print('Calling predefined action', action)
        end
        local hasControl = requestControl()

        Actions[action]()

        return
    end

    if type(customActions[action]) == 'function' then
        if not Data.pet or not Data.config then return end

        resetActions(action)

        Utils.OnStartingAction(action, Data.pet, Data.config, Data.selected)

        if General.debug then
            print('Calling custom action', action)
        end

        local hasControl = requestControl()

        local res = customActions[action](Data.pet, Data.config, Data.selected, Data.actions[action])

        resetSelectedObject()

        return
    end

    if General.debug then
        print('Calling animation method', action)
    end

    local hasControl = requestControl()

    animAction(action)
end)

RegisterNetEvent("fd-pets:client:playCallingAnimation", function(animation)
    playCallingAnimation(animation)
end)

RegisterNetEvent("fd-pets:client:deleteDeadPet", function(pet)

    TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[pet], 'remove')
	
end)

RegisterNetEvent("fd-pets:actions:spawnpet", function(pet)
    if not pet then return end

    spawnPet(pet)
end)
