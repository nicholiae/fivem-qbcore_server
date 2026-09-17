Config = {}

Config.MissionMarker =  vector3(445.68, -983.87, 21.56)  -- place where is the marker with the mission
Config.DealerCoords = vector4(445.68, -983.87, 21.56, 85.58) -- place where the NPC dealer stands
Config.EvidenceCoords = vector4(427.06, -980.86, 21.56, 175.94) -- place where the NPC for evidence stands
Config.VehicleSpawn = { -- below the coordinates for random encounter locations
    vector3(-1289.94, -1398.19, 4.47),
    vector3(-1658.84, -1006.72, 12.94),
    vector3(-1981.44, -297.86, 48.03),
    vector3(76.99, -201.43, 54.42),
    vector3(1156.78, -332.21, 68.74)
	-- vector3(397.42, -1156.18, 29.29),
	-- vector3(397.42, -1156.18, 29.29)
}
Config.DriverWeap = `WEAPON_MICROSMG` -- Weapon for truck driver to spawn with
Config.NavWeap = `WEAPON_HEAVYPISTOL` -- Weapon for navigator to spawn with
Config.TimeToBlow = 6 -- bomb detonation time after planting, in seconds
Config.ActivePolice = 0 -- needed policemen to activate the mission
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
Config.DispatchPed = "s_f_y_cop_01"
Config.FemalePed = 'a_f_y_tourist_02'
Config.MalePed = 'a_m_m_acult_01'