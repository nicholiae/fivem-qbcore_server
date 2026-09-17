Config = {}

Config.MissionMarker =  vector3(304.88, -598.71, 43.29)  -- place where is the marker with the mission
Config.DealerCoords = vector4(304.88, -598.71, 43.29, 69.73) -- place where the NPC dealer stands
Config.EvidenceCoords = vector4(314.09, -590.41, 43.29, 155.54) -- place where the NPC for evidence stands
Config.VehicleSpawn = { -- below the coordinates for random encounter locations
    vector3(327.34, -206.93, 54.09),
    vector3(-492.19, -54.1, 39.99),
    vector3(-449.51, 296.62, 83.24),
    vector3(946.64, 157.03, 80.83),
    vector3(-1592.04, -1013.69, 13.02)
}
Config.DriverWeap = `WEAPON_MICROSMG` -- Weapon for truck driver to spawn with
Config.NavWeap = `WEAPON_HEAVYPISTOL` -- Weapon for navigator to spawn with
Config.TimeToBlow = 6 -- bomb detonation time after planting, in seconds
Config.ActiveEMS = 0 -- needed EMSmen to activate the mission
Config.Payout = {
    Min = 250, -- Min reward payout
    Max = 1000 -- Max reward payout
}
Config.weaponChance = 11
Config.LowBag = 2
Config.HighBag = 5
Config.ActivationCost = 0 -- how much is the activation of the mission (clean from the bank)
Config.Currency = "$"
Config.ResetTimer = 600 -- cooldown for mission in seconds
Config.VehicleHash = `baller3`
Config.DispatchPed = "s_m_m_doctor_01"
Config.FemalePed = 'a_f_y_tourist_02'
Config.MalePed = 'a_m_m_acult_01'
Config.EvidencePed = 's_m_m_fibsec_01'
