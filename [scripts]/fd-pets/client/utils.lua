local General = require 'config.general'

Utils = {}

Utils.OnTryingToSpawnPet = function(pet, config)
    -- Triggered whenever trying to trigger pet spawn
    return true
end

Utils.OnFinishingPetSetup = function(netId, config, pet)
    -- Pet spawned, finished set up job
    return true
end

Utils.OnOpeningMenu = function(config, selected)
    -- Trying to open pet actions menu
    return true
end

Utils.OnStartingAction = function(action, netId, config)
    -- Pet is starting action, wanna do something with your ped or whatever?
end

Utils.Notification = function(text, type)
    if General.debug then
        print(text, type)
    end
end
