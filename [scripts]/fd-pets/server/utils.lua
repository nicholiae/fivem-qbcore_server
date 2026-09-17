Utils = {}

Utils.CanPlayerSpawnPet = function(source, pet, config)
    return true
end

Utils.OnEntityDiedOrDoesntExist = function(source, entity)
    -- Triggered whenever entity is reported dead, doesn't exist or is out of client scope
end

Utils.OnPetAlreadyExists = function(source, pet, config, entity)
    -- Tried to spawn a pet, but it already exists
end

Utils.OnEntityRecalled = function(source, entity)
    -- Triggered whenever entity is being recalled
end

Utils.SecondsToClock = function(seconds)
    local days = math.floor(seconds / 86400)
    seconds = seconds - days * 86400
    local hours = math.floor(seconds / 3600 )
    seconds = seconds - hours * 3600
    local minutes = math.floor(seconds / 60) 
    seconds = seconds - minutes * 60
    
    return {
        days = days, 
        hours = hours,
        minutes = minutes,
        seconds = seconds
    }
  end
