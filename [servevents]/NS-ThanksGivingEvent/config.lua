--[[ Default Config Settings ]]--
Config = {}
Config.Debug = false						-- Set to true for debuging.
Config.MinDistance = 10 						-- Minimum distance ped spawn from player.
Config.MaxDistance = 50 						-- Max distance ped spawn from player.
Config.DespawnDistance = 90 						-- How far away the ped despawn.

Config.RandomChance = math.random(1, 100)  				-- Random number for giveaway chance.
Config.ItemAmount = math.random(1,2) 				-- Random number for the ammout of item given.
Config.ProbabilityMoneyLoot = 30 						-- 33 = 30%
Config.ProbabilityItemLoot = 90 						-- 53-33 = 20%

--[[ ped Loot Items Config Settings ]]--
Config.Items = {
	[1] = "mininglaser",
	[2] = "diamond",
	[3] = "emerald",
	[4] = "ruby",
	[5] = "sapphire",
	[6] = "meatbird",
	[7] = "scratch_ticket",
	[8] = "walk_me_down",
	[9] = "long_island",
	[10] = "the_birdy_burger",
	[11] = "goldbar",
}
Config.PresentItems = {
	[1] = "present",
}

Config.theMessage = 'Merry Christmas!'