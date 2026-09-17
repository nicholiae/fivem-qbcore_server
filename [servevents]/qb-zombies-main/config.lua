--[[ Default Config Settings ]]--
Config = {}
Config.Debug = false						-- Set to true for debuging.
Config.NoPeds = true						-- Set to true for no peds.
Config.MuteAmbience = false						-- Set to true to mute ambience.
Config.NotHealthRecharge = true						-- Set true to not all health auto recharge.

--[[ Zombie Spawn Config Settings ]]--
Config.SpawnZombie = 200 						-- Number of zombies to spawn per player.
Config.MinSpawnDistance = 25 						-- Minimum distance zombies spawn from player.
Config.MaxSpawnDistance = 50 						-- Max distance zombies spawn from player.
Config.DespawnDistance = 100 						-- How far away the zombies spawn.

--[[ Zombie Loot Config Settings ]]--
Config.ZombieDropLoot = true -- For zombies to drop loot, set to true.
Config.RandomChance = math.random(1, 100)  				-- Random number for giveaway chance.
Config.ItemAmount = math.random(1,5) 				-- Random number for the ammout of item given.
Config.AddtionalItem = false 					-- Set to true to give extra item on loot.
Config.AddItem = 'morphine' 					-- Extra item to give player.
Config.AddItemAmount = math.random(1,5) 				-- Random number for the ammout of extra item given.
Config.ProbabilityMoneyLoot = 55 						-- 33 = 30%
Config.ProbabilityItemLoot = 33 						-- 53-33 = 20%

--[[ Zombie Loot Items Config Settings ]]--
Config.Items = {
	[1] = "rifle_ammo",
	[2] = "oxycodone",
	[3] = "morphine",
	[4] = "rifle_ammo",
	[5] = "xanax",
	[6] = "amoxixillin",
	[7] = "ibuprofen",
	[8] = "walk_me_down",
	[9] = "long_island",
	[10] = "goldbar",
	[11] = "rifle_ammo",
	[12] = "cryptostick",
}

--[[ Zombie Safezone Config Settings ]]--
Config.SafeZone = false						-- Set to true to activate for safezones.
Config.SafeZoneRadioBlip = false						-- Set to true to activate safezone blips.

--[[ Zombie Safezone Location Settings ]]--
Config.SafeZoneCoords = {
	{x = 446.04, y = -993.56, z = 27.0, radio = 40},
	{x = 2708.15, y = 3492.44, z = 61.53, radio = 40},
	{x = 1465.3, y = 6348.7, z = 23.86, radio = 40},
	{x = -2133.19, y = 3263.99, z = 32.81, radio = 40}
}
