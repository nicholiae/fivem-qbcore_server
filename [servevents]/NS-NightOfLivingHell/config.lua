Config = {}


Config.CountTime = 60 -- in seconds
Config.PayPerKill = 500 -- default 250
Config.PayPerDeath = 300 -- default 250
Config.StartingMultiplier = 1.0 -- default 1.0 
Config.MultiplierChangePerCount = 0.3 -- default 0.3 
Config.MultiplierChangePerKill = 0.1 -- default 0.1 
Config.KillDistance = 100 -- default 80
Config.ArmorPerKill = 5 -- armor rewarded per kill
Config.ArmorOnDeath = 30 -- default 100 given everytime a player dies
Config.KillStreak = 10 -- how many kills to reward player for a killstreak
Config.KillRoundsReward = 25 -- bullets rewarded per KillStreak
Config.KillArmorReward = 25 -- armor rewarded per KillStreak
Config.PedArmor = 100 -- default 100 given to every ped
-- Config.PedWeapon = 'weapon_pistol'
Config.PedWeapon = {
	'weapon_pistol',
	'weapon_hatchet',
	'weapon_flaregun',
	'weapon_machinepistol',
	'weapon_dbshotgun',
	'weapon_grenadelauncher',
	-- 'weapon_molotov',
	'weapon_flare',
	-- 'weapon_pipebomb',
	'weapon_barrett',
	-- 'weapon_musket',
	-- 'weapon_pistol_mk2'
}
Config.PlayerWeapon = {
	'weapon_bullpuprifle_mk2',
	'weapon_nsr',
	'weapon_draco',
	'weapon_fnx',
	'weapon_carbinerifle',
	'weapon_specialcarbine_mk2'
}