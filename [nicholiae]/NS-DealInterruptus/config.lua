Config = {}

Config.MissionMarker =  vector3(1543.4, 3587.3, 38.77)  -- place where is the marker with the mission
Config.DealerCoords = vector3(1543.4, 3587.3, 38.77) -- place where the NPC dealer stands
Config.VehicleSpawn = { -- below the coordinates for random vehicle responses
    -- vector3(-1327.479736328, -86.045326232910, 49.31),
    vector3(2357.36, 2176.57, 103.06)
    -- vector3(-972.1781616210, -1530.9045410150, 4.890),
    -- vector3(798.18426513672, -1799.8173828125, 29.33),
    -- vector3(1247.0718994141, -344.65634155273, 69.08)
}
Config.LastSpot = vector3(-1925.28, -2989.56, 13.45)
Config.tax = 0.91 -- this is actually how much the player will get out of 100% default player is taxed 25% with a setting of 0.75
Config.DriverWeap = `weapon_combatshotgun` -- Weapon for truck driver to spawn with
Config.NavWeap = `weapon_carbinerifle` -- Weapon for navigator to spawn with
Config.TimeToBlow = 12 -- bomb detonation time after planting, in seconds
Config.ActivePolice = 0 -- needed policemen to activate the mission
Config.Payout = {
    Min = 20000, -- Min reward payout
    Max = 20000 -- Max reward payout
}
Config.LowBag = 5
Config.HighBag = 5
Config.ActivationCost = 10000 -- how much is the activation of the mission (clean from the bank)
Config.Currency = "$"
Config.ResetTimer = 2400 -- cooldown for mission in seconds