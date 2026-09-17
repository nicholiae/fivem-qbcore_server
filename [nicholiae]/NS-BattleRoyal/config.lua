cfg = {}

cfg.debug = false
cfg.debugKills = true
cfg.debugRewards = false
cfg.debugZoneDamage = false
cfg.debugPlayCircle = false
cfg.debugchute = false
cfg.debugCrates = false
cfg.debugcallback = false
cfg.debugHillCircle = false
cfg.debugZoneCircle = false
cfg.debugtensecondcountdown = true
cfg.debugKDCounterList = false

cfg.minPlayers = 5
cfg.maxPlayers = 20
cfg.costToPlay = 20000

cfg.goldbar = 'goldbar'

cfg.maxMedicalItems = 5
cfg.maxAmmoItems = 8
cfg.maxWeaponItems = 3

cfg.maxAmountMedical = 6
cfg.maxAmountAmmo = 6
cfg.maxAmountGold = 9

cfg.chanceForWeapons = 55
cfg.chanceForMedical = 60
cfg.chanceForAmmo = 65
cfg.chanceForGold = 30

cfg.islandLoc = vector3(4808.26, -4999.09, 600.0)

cfg.ticketMaster = {
    ped = `a_m_m_fatlatin_01`,
    location = vector3(-1732.19, -2771.72, 12.94),
    markerLocation = vector3(-1732.19, -2771.72, 13.94)
}

cfg.planespeed = 500.0 -- it seems 358 is the fastest an entity can go. 

cfg.transport = {
    vehicleModel = `titan`,
    locations = { 
        vector3(-1717.01, -2870.25, 2000.94),
		vector3(-1761.32, -2783.4, 2001.94),
		vector3(-1659.85, -2982.53, 2001.948)
    }
}

cfg.gameSettings = {
    queueTimer = 30, -- SECONDS  
    timeToPlayGame = 1080, -- SECONDS
    -- timeToPlayGame = 300, -- SECONDS
	default = 1,
	chuteAutoHeight = 200,
	circleZoneDPS = 3,
	playZoneCenterStart = vector3(4908.24, -4582.13, 20.44),
	playZoneCenters = {
	
		vector3(4822.91, -5033.64, 31.6),
		vector3(4862.78, -4662.84, 12.83),
		vector3(4717.01, -4520.9, 27.07),
		vector3(4798.82, -4375.48, 21.51),
		vector3(4925.84, -4557.07, 20.78),
		vector3(5074.57, -4782.44, 11.61),
		vector3(5158.44, -4611.5, 2.86),
		vector3(4503.46, -4670.83, 12.36),
		vector3(4338.33, -4517.66, 4.77),
		vector3(4462.55, -4421.06, 6.09),
		vector3(4641.85, -4505.6, 8.94),
		
		
	},
	playZoneDiameterStart = 1200,
	playZoneDiameterMinimum = 100,
	spawnOnDeathWithNoRevive = vector3(4819.41, -5019.27, 31.58),
	playZoneShrink = 50,
	playZoneSession = 1, -- in minutes
    spawnLocAfterGame = vector3(-1734.02, -2772.0, 13.94),
    spawnOnDeath = {
		vector3(4624.83, -4518.72, 11.59),
		vector3(4961.2, -4606.28, 13.87),
		vector3(5050.79, -4785.91, 16.26),
		vector3(5057.66, -4932.72, 16.49),
		vector3(5203.64, -5063.06, 12.87),
		vector3(5375.05, -5306.68, 36.73),
		vector3(5078.25, -5388.78, 15.01),
		vector3(4677.35, -4595.89, 13.91),
		vector3(5131.62, -5121.6, 2.11),
		vector3(4881.84, -5282.14, 8.42),
		vector3(4957.1, -4897.76, 7.99),
		vector3(5175.48, -4603.91, 3.58),
		vector3(4813.15, -4505.33, 12.24),
		vector3(5107.42, -4578.24, 4.26),
		vector3(4876.48, -4964.69, 4.55),
		vector3(5338.19, -5521.34, 56.3),
		vector3(4902.81, -5079.18, 4.11),
		vector3(4585.33, -4570.27, 9.76),
		vector3(4958.74, -4605.96, 14.14),
		vector3(5449.23, -5111.03, 12.27),
	}
}
cfg.hillSettings = {
    lifeTime = 120, -- SECONDS  
    totalTimeAllowedIn = 45, -- SECONDS
    zoneLocations = {
		vector3(4441.15, -4464.09, 4.33), -- warehouse
		vector3(3909.46, -4705.36, 4.3), -- end of strip
		vector3(4873.13, -4624.8, 14.85), -- rundown shack
		vector3(4893.16, -4927.33, 3.36), -- beach lua
		vector3(5266.28, -5428.39, 65.61) -- cell tower
	}
}
cfg.possibleGunRewards = {
	[1] = { 
		 wepName = 'weapon_heraarms'
	},
	[2] = { 
		 wepName = 'weapon_sa80'
	},
	[3] = { 
		 wepName = 'weapon_honeybadger'
	},
	[4] = { 
		 wepName = 'weapon_m45a1'
	},
	[5] = { 
		 wepName = 'weapon_ace'
	},
	[6] = { 
		 wepName = 'weapon_ak47'
	},
	[7] = { 
		 wepName = 'weapon_m14'
	},
	[8] = { 
		 wepName = 'weapon_rpk16'
	},
	[9] = { 
		 wepName = 'weapon_m249'
	},
	[10] = { 
		 wepName = 'weapon_m1918a2'
	},
	[11] = { 
		 wepName = 'weapon_lvoca'
	},
	[12] = { 
		 wepName = 'weapon_g36k'
	},
	[13] = { 
		 wepName = 'weapon_xm4'
	},
	[14] = { 
		 wepName = 'weapon_gardone'
	},
	[15] = { 
		 wepName = 'weapon_beretta'
	},
	[16] = { 
		 wepName = 'weapon_python'
	},
	[17] = { 
		 wepName = 'weapon_maxim9'
	},
	[18] = { 
		 wepName = 'weapon_cj'
	},
	[19] = { 
		 wepName = 'weapon_snub'
	},
	[20] = { 
		 wepName = 'weapon_laugoarms'
	},
	[21] = { 
		 wepName = 'weapon_b93r'
	},
	[22] = { 
		 wepName = 'weapon_makarov'
	},
	[23] = { 
		 wepName = 'weapon_fn502'
	},
	[24] = { 
		 wepName = 'weapon_1911'
	},
	[25] = { 
		 wepName = 'weapon_659'
	},
	[26] = { 
		 wepName = 'weapon_m906'
	},
	[27] = { 
		 wepName = 'weapon_magpulpdr'
	},
	[28] = { 
		 wepName = 'weapon_mp9'
	},
	[29] = { 
		 wepName = 'weapon_m32'
	},
	[30] = { 
		 wepName = 'weapon_bryson'
	},
	[31] = { 
		 wepName = 'weapon_aa12'
	}
}
cfg.rewards = {
	mostDeathsReward = cfg.costToPlay,
	lifeReward = 75, -- cash * time alive
	kingReward = 3, -- crypto * time in hill
	mostKillsReward = 10, -- gold bars per kill
	lastManAliveReward = 1
}
cfg.possibleGuns = {
	[1] = { 
		 wepName = 'weapon_heraarms',
		 wepChance = 14
	},
	[2] = { 
		 wepName = 'weapon_sa80',
		 wepChance = 14
	},
	[3] = { 
		 wepName = 'weapon_honeybadger',
		 wepChance = 19
	},
	[4] = { 
		 wepName = 'weapon_m45a1',
		 wepChance = 17
	},
	[5] = { 
		 wepName = 'weapon_ace',
		 wepChance = 12
	},
	[6] = { 
		 wepName = 'weapon_ak47',
		 wepChance = 10
	},
	[7] = { 
		 wepName = 'weapon_m14',
		 wepChance = 11
	},
	[8] = { 
		 wepName = 'weapon_rpk16',
		 wepChance = 10
	},
	[9] = { 
		 wepName = 'weapon_m249',
		 wepChance = 13
	},
	[10] = { 
		 wepName = 'weapon_m1918a2',
		 wepChance = 11
	},
	[11] = { 
		 wepName = 'weapon_lvoca',
		 wepChance = 14
	},
	[12] = { 
		 wepName = 'weapon_g36k',
		 wepChance = 19
	},
	[13] = { 
		 wepName = 'weapon_xm4',
		 wepChance = 16
	},
	[14] = { 
		 wepName = 'weapon_gardone',
		 wepChance = 45
	},
	[15] = { 
		 wepName = 'weapon_beretta',
		 wepChance = 47
	},
	[16] = { 
		 wepName = 'weapon_python',
		 wepChance = 42
	},
	[17] = { 
		 wepName = 'weapon_maxim9',
		 wepChance = 43
	},
	[18] = { 
		 wepName = 'weapon_cj',
		 wepChance = 49
	},
	[19] = { 
		 wepName = 'weapon_snub',
		 wepChance = 43
	},
	[20] = { 
		 wepName = 'weapon_laugoarms',
		 wepChance = 50
	},
	[21] = { 
		 wepName = 'weapon_b93r',
		 wepChance = 47
	},
	[22] = { 
		 wepName = 'weapon_makarov',
		 wepChance = 49
	},
	[23] = { 
		 wepName = 'weapon_fn502',
		 wepChance = 46
	},
	[24] = { 
		 wepName = 'weapon_1911',
		 wepChance = 50
	},
	[25] = { 
		 wepName = 'weapon_659',
		 wepChance = 49
	},
	[26] = { 
		 wepName = 'weapon_m906',
		 wepChance = 45
	},
	[27] = { 
		 wepName = 'weapon_magpulpdr',
		 wepChance = 25
	},
	[28] = { 
		 wepName = 'weapon_mp9',
		 wepChance = 22
	},
	[29] = { 
		 wepName = 'weapon_m32',
		 wepChance = 2
	},
	[30] = { 
		 wepName = 'weapon_bryson',
		 wepChance = 33
	},
	[31] = { 
		 wepName = 'weapon_aa12',
		 wepChance = 30
	},
	[32] = { 
		 wepName = 'weapon_draco',
		 wepChance = 15
	},
	[33] = { 
		 wepName = 'weapon_sig516',
		 wepChance = 12
	},
	[34] = { 
		 wepName = 'weapon_nsr',
		 wepChance = 13
	},
	[35] = { 
		 wepName = 'weapon_gardone',
		 wepChance = 45
	},
	[36] = { 
		 wepName = 'weapon_fnx',
		 wepChance = 41
	},
	[37] = { 
		 wepName = 'weapon_g30',
		 wepChance = 44
	},
	[38] = { 
		 wepName = 'weapon_tec9',
		 wepChance = 49
	},
	[39] = { 
		 wepName = 'weapon_p226',
		 wepChance = 49
	},
	[40] = { 
		 wepName = 'weapon_g18c',
		 wepChance = 42
	},
	[41] = { 
		 wepName = 'weapon_g17',
		 wepChance = 46
	},
	[42] = { 
		 wepName = 'weapon_barrett',
		 wepChance = 7
	},
	[43] = { 
		 wepName = 'weapon_mp5',
		 wepChance = 20
	},
	[44] = { 
		 wepName = 'weapon_mac',
		 wepChance = 20
	},
	[45] = { 
		 wepName = 'weapon_m870',
		 wepChance = 36
	},
	-- [46] = { 
		 -- wepName = 'weapon_unarmed',
		 -- wepChance = 55
	-- },
	[47] = { 
		 wepName = 'weapon_dagger',
		 wepChance = 53
	},
	[48] = { 
		 wepName = 'weapon_bat',
		 wepChance = 51
	},
	[49] = { 
		 wepName = 'weapon_bottle',
		 wepChance = 53
	},
	[50] = { 
		 wepName = 'weapon_crowbar',
		 wepChance = 63
	},
	-- [51] = { 
		 -- wepName = 'weapon_flashlight',
		 -- wepChance = 54
	-- },
	[52] = { 
		 wepName = 'weapon_golfclub',
		 wepChance = 52
	},
	-- [53] = { 
		 -- wepName = 'weapon_hammer',
		 -- wepChance = 54
	-- },
	[54] = { 
		 wepName = 'weapon_hatchet',
		 wepChance = 56
	},
	[55] = { 
		 wepName = 'weapon_knuckle',
		 wepChance = 56
	},
	[56] = { 
		 wepName = 'weapon_knife',
		 wepChance = 69
	},
	[57] = { 
		 wepName = 'weapon_machete',
		 wepChance = 68
	},
	[58] = { 
		 wepName = 'weapon_switchblade',
		 wepChance = 68
	},
	[59] = { 
		 wepName = 'weapon_nightstick',
		 wepChance = 61
	},
	[60] = { 
		 wepName = 'weapon_wrench',
		 wepChance = 53
	},
	[61] = { 
		 wepName = 'weapon_battleaxe',
		 wepChance = 73
	},
	[62] = { 
		 wepName = 'weapon_poolcue',
		 wepChance = 69
	},
	-- [63] = { 
		 -- wepName = 'weapon_briefcase',
		 -- wepChance = 61
	-- },
	-- [64] = { 
		 -- wepName = 'weapon_briefcase_02',
		 -- wepChance = 64
	-- },
	-- [65] = { 
		 -- wepName = 'weapon_garbagebag',
		 -- wepChance = 61
	-- },
	-- [66] = { 
		 -- wepName = 'weapon_handcuffs',
		 -- wepChance = 59
	-- },
	-- [67] = { 
		 -- wepName = 'weapon_bread',
		 -- wepChance = 56
	-- },
	[68] = { 
		 wepName = 'weapon_stone_hatchet',
		 wepChance = 67
	},
	[69] = { 
		 wepName = 'weapon_candycane',
		 wepChance = 65
	},
	[70] = { 
		 wepName = 'weapon_pistol',
		 wepChance = 43
	},
	[71] = { 
		 wepName = 'weapon_pistol_mk2',
		 wepChance = 50
	},
	[72] = { 
		 wepName = 'weapon_combatpistol',
		 wepChance = 44
	},
	[73] = { 
		 wepName = 'weapon_appistol',
		 wepChance = 41
	},
	[74] = { 
		 wepName = 'weapon_stungun',
		 wepChance = 58
	},
	[75] = { 
		 wepName = 'weapon_pistol50',
		 wepChance = 48
	},
	[76] = { 
		 wepName = 'weapon_snspistol',
		 wepChance = 44
	},
	[77] = { 
		 wepName = 'weapon_heavypistol',
		 wepChance = 46
	},
	[78] = { 
		 wepName = 'weapon_vintagepistol',
		 wepChance = 40
	},
	-- [79] = { 
		 -- wepName = 'weapon_flaregun',
		 -- wepChance = 51
	-- },
	[80] = { 
		 wepName = 'weapon_marksmanpistol',
		 wepChance = 41
	},
	[81] = { 
		 wepName = 'weapon_revolver',
		 wepChance = 48
	},
	[82] = { 
		 wepName = 'weapon_revolver_mk2',
		 wepChance = 44
	},
	[83] = { 
		 wepName = 'weapon_doubleaction',
		 wepChance = 44
	},
	[84] = { 
		 wepName = 'weapon_ceramicpistol',
		 wepChance = 43
	},
	[85] = { 
		 wepName = 'weapon_navyrevolver',
		 wepChance = 49
	},
	[86] = { 
		 wepName = 'weapon_gadgetpistol',
		 wepChance = 43
	},
	[87] = { 
		 wepName = 'weapon_pistolxm3',
		 wepChance = 50
	},
	[88] = { 
		 wepName = 'weapon_microsmg',
		 wepChance = 26
	},
	[89] = { 
		 wepName = 'weapon_smg',
		 wepChance = 22
	},
	[90] = { 
		 wepName = 'weapon_smg_mk2',
		 wepChance = 24
	},
	[91] = { 
		 wepName = 'weapon_assaultsmg',
		 wepChance = 27
	},
	-- [92] = { 
		 -- wepName = 'weapon_combatpdw',
		 -- wepChance = 28
	-- },
	[93] = { 
		 wepName = 'weapon_machinepistol',
		 wepChance = 47
	},
	[94] = { 
		 wepName = 'weapon_minismg',
		 wepChance = 22
	},
	[95] = { 
		 wepName = 'weapon_pumpshotgun',
		 wepChance = 37
	},
	[96] = { 
		 wepName = 'weapon_sawnoffshotgun',
		 wepChance = 30
	},
	[97] = { 
		 wepName = 'weapon_assaultshotgun',
		 wepChance = 36
	},
	[98] = { 
		 wepName = 'weapon_bullpupshotgun',
		 wepChance = 30
	},
	[99] = { 
		 wepName = 'weapon_musket',
		 wepChance = 36
	},
	[100] = { 
		 wepName = 'weapon_heavyshotgun',
		 wepChance = 32
	},
	[101] = { 
		 wepName = 'weapon_dbshotgun',
		 wepChance = 39
	},
	[102] = { 
		 wepName = 'weapon_autoshotgun',
		 wepChance = 37
	},
	[103] = { 
		 wepName = 'weapon_pumpshotgun_mk2',
		 wepChance = 35
	},
	[104] = { 
		 wepName = 'weapon_combatshotgun',
		 wepChance = 32
	},
	[105] = { 
		 wepName = 'weapon_assaultrifle',
		 wepChance = 19
	},
	[106] = { 
		 wepName = 'weapon_assaultrifle_mk2',
		 wepChance = 18
	},
	[107] = { 
		 wepName = 'weapon_carbinerifle',
		 wepChance = 14
	},
	[108] = { 
		 wepName = 'weapon_carbinerifle_mk2',
		 wepChance = 18
	},
	[109] = { 
		 wepName = 'weapon_advancedrifle',
		 wepChance = 15
	},
	[110] = { 
		 wepName = 'weapon_specialcarbine',
		 wepChance = 20
	},
	[111] = { 
		 wepName = 'weapon_bullpuprifle',
		 wepChance = 10
	},
	[112] = { 
		 wepName = 'weapon_compactrifle',
		 wepChance = 15
	},
	[113] = { 
		 wepName = 'weapon_specialcarbine_mk2',
		 wepChance = 20
	},
	[114] = { 
		 wepName = 'weapon_bullpuprifle_mk2',
		 wepChance = 15
	},
	[115] = { 
		 wepName = 'weapon_militaryrifle',
		 wepChance = 14
	},
	[116] = { 
		 wepName = 'weapon_mg',
		 wepChance = 63
	},
	[117] = { 
		 wepName = 'weapon_combatmg',
		 wepChance = 68
	},
	[118] = { 
		 wepName = 'weapon_gusenberg',
		 wepChance = 52
	},
	[119] = { 
		 wepName = 'weapon_combatmg_mk2',
		 wepChance = 74
	},
	[120] = { 
		 wepName = 'weapon_sniperrifle',
		 wepChance = 8
	},
	[121] = { 
		 wepName = 'weapon_heavysniper',
		 wepChance = 6
	},
	[122] = { 
		 wepName = 'weapon_marksmanrifle',
		 wepChance = 5
	},
	[123] = { 
		 wepName = 'weapon_heavysniper_mk2',
		 wepChance = 6
	},
	[124] = { 
		 wepName = 'weapon_marksmanrifle_mk2',
		 wepChance = 9
	},

}

cfg.possibleMedical = {
	[1] = { 
		 wepName = 'water_bottle',
		 wepChance = 50
	},
	[2] = { 
		 wepName = 'sandwich',
		 wepChance = 50
	},
	[3] = { 
		 wepName = 'weed_whitewidow_blunt',
		 wepChance = 30
	},
	[4] = { 
		 wepName = 'whitecherry_gelatoblunt',
		 wepChance = 40
	},
	[5] = { 
		 wepName = 'armor',
		 wepChance = 20
	},
	[6] = { 
		 wepName = 'heavyarmor',
		 wepChance = 10
	},
	[7] = { 
		 wepName = 'xanax',
		 wepChance = 25
	},
	[8] = { 
		 wepName = 'morphine',
		 wepChance = 5
	},
	[9] = { 
		 wepName = 'oxycodone',
		 wepChance = 20
	},
	[10] = { 
		 wepName = 'amoxixillin',
		 wepChance = 15
	},
	[11] = { 
		 wepName = 'ibuprofen',
		 wepChance = 10
	},
	[12] = { 
		 wepName = 'beklighter',
		 wepChance = 50
	},
}

cfg.possibleAmmo = {
	[1] = { 
		 wepName = 'mg_ammo',
		 wepChance = 15
	},
	[2] = { 
		 wepName = 'mini_ammo',
		 wepChance = 10
	},
	[3] = { 
		 wepName = 'sniper_ammo',
		 wepChance = 5
	},
	[4] = { 
		 wepName = 'handcuffs',
		 wepChance = 1
	},
	[5] = { 
		 wepName = 'shotgun_ammo',
		 wepChance = 30
	},
	[6] = { 
		 wepName = 'smg_ammo',
		 wepChance = 35
	},
	[7] = { 
		 wepName = 'rifle_ammo',
		 wepChance = 25
	},
	[8] = { 
		 wepName = 'pistol_ammo',
		 wepChance = 40
	},
	[9] = { 
		 wepName = 'weapon_proxmine',
		 wepChance = 5
	},
	[10] = { 
		 wepName = 'weapon_pipebomb',
		 wepChance = 10
	},
	[11] = { 
		 wepName = 'weapon_grenade',
		 wepChance = 20
	},
	[12] = { 
		 wepName = 'weapon_molotov',
		 wepChance = 30
	},
}


cfg.lootChests = {

	-- [1] = { -- example
		-- location = vector4(),
		-- Looted = false
	-- },
	[1] = {
		location = vector4(3899.59, -4701.83, 4.42, 260.23),
		Looted = false
	},
	[2] = {
		location = vector4(3906.5, -4800.44, 3.26, 4.49),
		Looted = false
	},
	[3] = {
		location = vector4(3896.34, -4802.63, 1.4, 347.99),
		Looted = false
	},
	[4] = {
		location = vector4(3912.89, -4797.77, 1.93, 49.47),
		Looted = false
	},
	[5] = {
		location = vector4(3893.18, -4759.21, 2.37, 53.35),
		Looted = false
	},
	[6] = {
		location = vector4(3932.86, -4751.42, 2.37, 21.98),
		Looted = false
	},
	[7] = {
		location = vector4(3971.09, -4729.24, 2.71, 332.52),
		Looted = false
	},
	[8] = {
		location = vector4(4006.73, -4630.83, 3.21, 296.53),
		Looted = false
	},
	[9] = {
		location = vector4(4050.02, -4596.21, 2.16, 142.25),
		Looted = false
	},
	[10] = {
		location = vector4(4079.81, -4588.01, 2.31, 196.16),
		Looted = false
	},
	[11] = {
		location = vector4(4087.09, -4570.22, 2.26, 191.08),
		Looted = false
	},
	[12] = {
		location = vector4(4101.44, -4521.7, 2.18, 88.13),
		Looted = false
	},
	[13] = {
		location = vector4(4117.33, -4526.98, 2.51, 245.4),
		Looted = false
	},
	[14] = {
		location = vector4(4115.5, -4521.1, 2.19, 324.34),
		Looted = false
	},
	[15] = {
		location = vector4(4133.65, -4501.07, 2.35, 34.79),
		Looted = false
	},
	[16] = {
		location = vector4(4137.18, -4495.87, 2.33, 331.73),
		Looted = false
	},
	[17] = {
		location = vector4(4127.05, -4476.73, 4.39, 74.12),
		Looted = false
	},
	[18] = {
		location = vector4(4130.54, -4481.75, 2.98, 231.57),
		Looted = false
	},
	[19] = {
		location = vector4(4137.32, -4494.8, 2.29, 210.24),
		Looted = false
	},
	[20] = {
		location = vector4(4157.98, -4500.97, 2.2, 172.07),
		Looted = false
	},
	[21] = {
		location = vector4(4148.19, -4497.35, 2.22, 52.88),
		Looted = false
	},
	[22] = {
		location =  vector4(4157.758, -4500.5, 2.199663, 175.5617),
		Looted = false
	},
	[23] = {
		location =  vector4(4173.17, -4525.556, 2.20467, 36.16515),
		Looted = false
	},
	[24] = {
		location =  vector4(4166.308, -4531.22, 2.162392, 42.66656),
		Looted = false
	},
	[25] = {
		location =  vector4(4158.77, -4531.802, 2.164141, 250.0912),
		Looted = false
	},
	[26] = {
		location =  vector4(4167.589, -4534.207, 2.161371, 273.9776),
		Looted = false
	},
	[27] = {
		location =  vector4(4261.146, -4529.247, 5.310301, 167.5222),
		Looted = false
	},
	[28] = {
		location =  vector4(4257.033, -4526.638, 5.164708, 324.819),
		Looted = false
	},
	[29] = {
		location =  vector4(4288.999, -4494.66, 3.934456, 191.1712),
		Looted = false
	},
	[30] = {
		location =  vector4(4304.584, -4475.424, 3.526628, 9.333334),
		Looted = false
	},
	[31] = {
		location =  vector4(4275.16, -4366.969, 22.39797, 211.6501),
		Looted = false
	},
	[32] = {
		location =  vector4(4275.589, -4363.014, 22.42976, 296.1319),
		Looted = false
	},
	[33] = {
		location =  vector4(4272.597, -4363.111, 22.46547, 30.72058),
		Looted = false
	},
	[34] = {
		location =  vector4(4271.896, -4365.909, 22.59804, 109.1936),
		Looted = false
	},
	[35] = {
		location =  vector4(4222.717, -4333.291, 10.63728, 52.10357),
		Looted = false
	},
	[36] = {
		location =  vector4(4213.446, -4337.439, 8.870326, 186.9465),
		Looted = false
	},
	[37] = {
		location =  vector4(4208.265, -4334.937, 8.023206, 253.9185),
		Looted = false
	},
	[38] = {
		location =  vector4(4204.34, -4329.139, 7.272482, 20.29913),
		Looted = false
	},
	[39] = {
		location =  vector4(4204.885, -4321.484, 6.974895, 337.4631),
		Looted = false
	},
	[40] = {
		location =  vector4(4232.972, -4298.209, 6.41011, 294.7014),
		Looted = false
	},
	[41] = {
		location =  vector4(4239.697, -4299.686, 6.82229, 249.7385),
		Looted = false
	},
	[42] = {
		location =  vector4(4254.819, -4304.156, 8.004211, 265.7171),
		Looted = false
	},
	[43] = {
		location =  vector4(4262.36, -4304.356, 7.581417, 279.7131),
		Looted = false
	},
	[44] = {
		location =  vector4(4286.82, -4330.715, 13.03947, 313.9459),
		Looted = false
	},
	[45] = {
		location =  vector4(4344.136, -4332.669, 2.808483, 54.39616),
		Looted = false
	},
	[46] = {
		location =  vector4(4353.208, -4340.403, 2.660694, 317.4311),
		Looted = false
	},
	[47] = {
		location =  vector4(4361.253, -4346.454, 2.496365, 230.8169),
		Looted = false
	},
	[48] = {
		location =  vector4(4364.855, -4352.068, 2.59735, 207.7856),
		Looted = false
	},
	[49] = {
		location =  vector4(4394.634, -4358.659, 3.063451, 249.5127),
		Looted = false
	},
	[50] = {
		location =  vector4(4406.414, -4389.063, 8.564407, 198.8027),
		Looted = false
	},
	[51] = {
		location =  vector4(4441.823, -4441.591, 6.646331, 21.86018),
		Looted = false
	},
	[52] = {
		location =  vector4(4423.318, -4448.011, 5.885516, 22.5152),
		Looted = false
	},
	[53] = {
		location =  vector4(4425.315, -4468.612, 4.328276, 114.0534),
		Looted = false
	},
	[54] = {
		location =  vector4(4453.084, -4474.37, 4.328359, 110.8164),
		Looted = false
	},
	[55] = {
		location =  vector4(4432.359, -4477.153, 4.328463, 288.1158),
		Looted = false
	},
	[56] = {
		location =  vector4(4456.086, -4465.859, 4.328361, 113.1311),
		Looted = false
	},
	[57] = {
		location =  vector4(4449.039, -4452.189, 4.328403, 115.6505),
		Looted = false
	},
	[58] = {
		location =  vector4(4436.813, -4445.539, 4.328434, 205.7201),
		Looted = false
	},
	[59] = {
		location =  vector4(4424.515, -4458.323, 4.328413, 267.9277),
		Looted = false
	},
	[60] = {
		location =  vector4(4423.396, -4452.545, 7.236705, 285.5018),
		Looted = false
	},
	[61] = {
		location =  vector4(4425.309, -4454.14, 7.236679, 18.48097),
		Looted = false
	},
	[62] = {
		location =  vector4(4426.018, -4449.542, 7.236789, 205.0452),
		Looted = false
	},
	[63] = {
		location =  vector4(4434.278, -4447.836, 7.23681, 112.1122),
		Looted = false
	},
	[64] = {
		location =  vector4(4431.691, -4447.664, 7.23681, 188.8486),
		Looted = false
	},
	[65] = {
		location =  vector4(4447.099, -4442.026, 7.236792, 105.7525),
		Looted = false
	},
	[66] = {
		location =  vector4(4448.168, -4444.835, 7.236795, 104.2558),
		Looted = false
	},
	[67] = {
		location =  vector4(4430.227, -4467.459, 6.006128, 19.8578),
		Looted = false
	},
	[68] = {
		location =  vector4(4460.41, -4468.63, 4.244515, 306.7639),
		Looted = false
	},
	[69] = {
		location =  vector4(4494.83, -4441.461, 3.998801, 143.6679),
		Looted = false
	},
	[70] = {
		location =  vector4(4519.229, -4421.032, 5.05171, 352.9942),
		Looted = false
	},
	[71] = {
		location =  vector4(4538.692, -4443.373, 6.215588, 169.7259),
		Looted = false
	},
	[72] = {
		location =  vector4(4536.3, -4469.664, 5.169501, 173.3848),
		Looted = false
	},
	[73] = {
		location =  vector4(4550.281, -4462.297, 3.470098, 308.8003),
		Looted = false
	},
	[74] = {
		location =  vector4(4566.466, -4484.993, 3.845741, 17.60513),
		Looted = false
	},
	[75] = {
		location =  vector4(4563.851, -4476.081, 3.284031, 195.0882),
		Looted = false
	},
	[76] = {
		location =  vector4(4598.371, -4461.458, 2.949449, 153.1482),
		Looted = false
	},
	[77] = {
		location =  vector4(4554.874, -4541.814, 5.838143, 91.35188),
		Looted = false
	},
	[78] = {
		location =  vector4(4610.951, -4667.206, 4.756487, 12.61865),
		Looted = false
	},
	[79] = {
		location =  vector4(4617.614, -4670.305, 3.78106, 237.7268),
		Looted = false
	},
	[80] = {
		location =  vector4(4613.505, -4675.557, 3.777207, 71.6703),
		Looted = false
	},
	[81] = {
		location =  vector4(4533.677, -4702.567, 2.794927, 13.30729),
		Looted = false
	},
	[82] = {
		location =  vector4(4536.824, -4705.304, 1.69955, 77.95094),
		Looted = false
	},
	[83] = {
		location =  vector4(4624.13, -4853.084, 11.45924, 224.7535),
		Looted = false
	},
	[84] = {
		location =  vector4(4626.699, -4850.566, 11.14499, 315.5977),
		Looted = false
	},
	[85] = {
		location =  vector4(4630.608, -4863.307, 13.69342, 186.233),
		Looted = false
	},
	[86] = {
		location =  vector4(4637.904, -4867.366, 14.45153, 265.1575),
		Looted = false
	},
	[87] = {
		location =  vector4(4634.059, -4870.988, 14.51066, 101.8161),
		Looted = false
	},
	[88] = {
		location =  vector4(4635.153, -4895.19, 12.13999, 198.2271),
		Looted = false
	},
	[89] = {
		location =  vector4(4629.365, -4902.33, 11.61246, 119.737),
		Looted = false
	},
	[90] = {
		location =  vector4(4618.868, -4905.816, 12.26602, 236.4306),
		Looted = false
	},
	[91] = {
		location =  vector4(4595.781, -4892.319, 16.74477, 307.46),
		Looted = false
	},
	[92] = {
		location =  vector4(4593.646, -4874.113, 17.9609, 165.4325),
		Looted = false
	},
	[93] = {
		location =  vector4(4595.222, -4873.073, 17.96583, 262.2098),
		Looted = false
	},
	[94] = {
		location =  vector4(4593.88, -4872.038, 17.80449, 2.752701),
		Looted = false
	},
	[95] = {
		location =  vector4(4592.598, -4872.971, 17.83702, 83.02477),
		Looted = false
	},
	[96] = {
		location =  vector4(4586.341, -4880.037, 18.01815, 325.4958),
		Looted = false
	},
	[97] = {
		location =  vector4(4599.621, -4878.623, 18.10503, 49.27216),
		Looted = false
	},
	[98] = {
		location =  vector4(4596.816, -4791.816, 11.20343, 344.0045),
		Looted = false
	},
	[99] = {
		location =  vector4(4617.739, -4765.533, 11.81258, 298.6425),
		Looted = false
	},
	[100] = {
		location =  vector4(4626.241, -4772.259, 11.72838, 220.337),
		Looted = false
	},
	[101] = {
		location =  vector4(4633.24, -4781.898, 11.30668, 212.9676),
		Looted = false
	},
	[102] = {
		location =  vector4(4635.841, -4793.993, 11.02229, 179.7769),
		Looted = false
	},
	[103] = {
		location =  vector4(4640.02, -4812.855, 0.6789072, 337.4821),
		Looted = false
	},
	[104] = {
		location =  vector4(4640.265, -4815.045, 0.7071295, 185.554),
		Looted = false
	},
	[105] = {
		location =  vector4(4633.343, -4827.907, 2.295865, 36.28145),
		Looted = false
	},
	[106] = {
		location =  vector4(4627.203, -4850.105, 11.01067, 356.304),
		Looted = false
	},
	[107] = {
		location =  vector4(4627.299, -4865.724, 14.04398, 214.2367),
		Looted = false
	},
	[108] = {
		location =  vector4(4666.142, -4863.951, 14.1984, 294.3049),
		Looted = false
	},
	[109] = {
		location =  vector4(4658.886, -4879.439, 13.95897, 178.7305),
		Looted = false
	},
	[110] = {
		location =  vector4(4649.994, -4891.855, 11.96836, 134.4473),
		Looted = false
	},
	[111] = {
		location =  vector4(4634.468, -4900.771, 11.32874, 120.7044),
		Looted = false
	},
	[112] = {
		location =  vector4(4496.011, -4525.446, 4.412368, 23.45232),
		Looted = false
	},
	[113] = {
		location =  vector4(4492.768, -4521.419, 4.412366, 275.2696),
		Looted = false
	},
	[114] = {
		location =  vector4(4518.533, -4519.137, 4.392425, 118.2081),
		Looted = false
	},
	[115] = {
		location =  vector4(4519.649, -4514.83, 4.502352, 19.5288),
		Looted = false
	},
	[116] = {
		location =  vector4(4516.334, -4543.727, 4.226175, 117.1988),
		Looted = false
	},
	[117] = {
		location =  vector4(4518.312, -4548.225, 4.131802, 105.4678),
		Looted = false
	},
	[118] = {
		location =  vector4(4526.305, -4549.928, 4.738541, 113.8049),
		Looted = false
	},
	[119] = {
		location =  vector4(4511.09, -4548.893, 4.426312, 271.08),
		Looted = false
	},
	[120] = {
		location =  vector4(4506.642, -4541.423, 5.34701, 302.7393),
		Looted = false
	},
	[121] = {
		location =  vector4(4506.784, -4546.107, 6.875858, 291.892),
		Looted = false
	},
	[122] = {
		location =  vector4(4508.599, -4551.018, 6.875833, 279.6414),
		Looted = false
	},
	[123] = {
		location =  vector4(4503.098, -4558.785, 4.171901, 288.3062),
		Looted = false
	},
	[124] = {
		location =  vector4(4527.8, -4522.293, 4.547345, 110.0559),
		Looted = false
	},
	[125] = {
		location =  vector4(4540.102, -4528.05, 5.58395, 108.4732),
		Looted = false
	},
	[126] = {
		location =  vector4(4535.253, -4521.859, 5.182237, 114.9664),
		Looted = false
	},
	[127] = {
		location =  vector4(5136.893, -5128.989, 2.119149, 289.0102),
		Looted = false
	},
	[128] = {
		location =  vector4(5193.169, -5131.468, 3.363696, 353.82),
		Looted = false
	},
	[129] = {
		location =  vector4(5180.982, -5145.692, 3.443605, 83.33548),
		Looted = false
	},
	[130] = {
		location =  vector4(5141.83, -5190.424, 2.480747, 6.228467),
		Looted = false
	},
	[131] = {
		location =  vector4(5106.995, -5166.113, 2.051192, 6.361728),
		Looted = false
	},
	[132] = {
		location =  vector4(5140.365, -5244.308, 26.29192, 284.575),
		Looted = false
	},
	[133] = {
		location =  vector4(5156.548, -5124.032, 2.319749, 4.54557),
		Looted = false
	},
	[134] = {
		location =  vector4(5138.52, -5082.52, 2.370002, 348.3759),
		Looted = false
	},
	[135] = {
		location =  vector4(5043.459, -5114.852, 22.94463, 272.7101),
		Looted = false
	},
	[136] = {
		location =  vector4(4989.39, -5082.045, 4.660328, 121.5575),
		Looted = false
	},
	[137] = {
		location =  vector4(4917.624, -5066.285, 2.384808, 318.9863),
		Looted = false
	},
	[138] = {
		location =  vector4(4961.732, -5107.688, 2.982064, 155.8168),
		Looted = false
	},
	[139] = {
		location =  vector4(5004.24, -5123.466, 2.89643, 339.0421),
		Looted = false
	},
	[140] = {
		location =  vector4(4947.332, -5187.538, 5.285202, 109.5307),
		Looted = false
	},
	[141] = {
		location =  vector4(4925.195, -5205.607, 2.543655, 105.097),
		Looted = false
	},
	[142] = {
		location =  vector4(4968.245, -5302.519, 6.297236, 345.971),
		Looted = false
	},
	[143] = {
		location =  vector4(4901.757, -5332.135, 29.14107, 14.0352),
		Looted = false
	},
	[144] = {
		location =  vector4(4903.389, -5336.443, 35.73854, 79.118),
		Looted = false
	},
	[145] = {
		location =  vector4(4881.617, -5399.817, 21.18616, 120.3456),
		Looted = false
	},
	[146] = {
		location =  vector4(4887.533, -5457.784, 47.52377, 5.963022),
		Looted = false
	},
	[147] = {
		location =  vector4(4935.492, -5514.984, 37.13062, 244.5746),
		Looted = false
	},
	[148] = {
		location =  vector4(5104.994, -5723.865, 15.77673, 318.278),
		Looted = false
	},
	[149] = {
		location =  vector4(4965.816, -5600.636, 23.73745, 76.39108),
		Looted = false
	},
	[150] = {
		location =  vector4(5167.762, -5589.954, 43.19781, 289.7199),
		Looted = false
	},
	[151] = {
		location =  vector4(5244.215, -5499.083, 49.86488, 284.2097),
		Looted = false
	},
	[152] = {
		location =  vector4(5345.529, -5512.072, 65.51458, 228.8241),
		Looted = false
	},
	[153] = {
		location =  vector4(5360.322, -5436.996, 66.17649, 57.47502),
		Looted = false
	},
	[154] = {
		location =  vector4(5380.483, -5393.078, 43.56858, 273.6238),
		Looted = false
	},
	[155] = {
		location =  vector4(5351.064, -5334.151, 38.1125, 254.471),
		Looted = false
	},
	[156] = {
		location =  vector4(5330.011, -5271.065, 33.18625, 337.6847),
		Looted = false
	},
	[157] = {
		location =  vector4(5402.181, -5169.253, 31.38547, 343.8254),
		Looted = false
	},
	[158] = {
		location =  vector4(5310.564, -5167.753, 28.34037, 231.0161),
		Looted = false
	},
	[159] = {
		location =  vector4(5318.688, -5080.566, 12.83656, 83.7164),
		Looted = false
	},
	[160] = {
		location =  vector4(5191.403, -5011.926, 13.9107, 125.2496),
		Looted = false
	},
	[161] = {
		location =  vector4(5153.787, -4932.825, 30.87342, 318.4331),
		Looted = false
	},
	[162] = {
		location =  vector4(5141.042, -4957.321, 14.38736, 313.8348),
		Looted = false
	},
	[163] = {
		location =  vector4(5148.551, -5053.048, 20.39156, 244.9116),
		Looted = false
	},
	[164] = {
		location =  vector4(5007.792, -5033.997, 2.385368, 39.08383),
		Looted = false
	},
	[165] = {
		location =  vector4(5042.812, -4896.169, 15.5678, 231.5741),
		Looted = false
	},
	[166] = {
		location =  vector4(4891.314, -4923.311, 3.368197, 283.4124),
		Looted = false
	},
	[167] = {
		location =  vector4(4905.001, -4943.544, 3.372236, 35.19888),
		Looted = false
	},
	[168] = {
		location =  vector4(4975.225, -4776.665, 12.43341, 164.0228),
		Looted = false
	},
	[169] = {
		location =  vector4(4882.443, -4640.94, 13.31771, 350.7142),
		Looted = false
	},
	[170] = {
		location =  vector4(4810.747, -4657.16, 16.52486, 293.8982),
		Looted = false
	},
	[171] = {
		location =  vector4(4877.686, -4488.3, 26.93382, 180.1958),
		Looted = false
	},
	[172] = {
		location = vector4(4766.854, -4564.183, 25.22337, 341.8872) ,
		Looted = false
	},
	[173] = {
		location = vector4(4757.144, -4550.587, 25.88219, 265.6852) ,
		Looted = false
	},
	[174] = {
		location = vector4(4826.732, -4541.567, 19.79961, 202.4629) ,
		Looted = false
	},
	[175] = {
		location = vector4(4863.036, -4623.581, 15.13218, 358.816) ,
		Looted = false
	},
	[176] = {
		location = vector4(4863.357, -4629.817, 14.53989, 8.629704) ,
		Looted = false
	},
	[177] = {
		location = vector4(4879.685, -4634.942, 13.84744, 98.71926) ,
		Looted = false
	},
	[178] = {
		location = vector4(4884.203, -4644.142, 13.0223, 78.94885) ,
		Looted = false
	},
	[179] = {
		location = vector4(4864.655, -4668.904, 12.26516, 326.9741) ,
		Looted = false
	},
	[180] = {
		location = vector4(4858.448, -4680.05, 10.0282, 53.22012) ,
		Looted = false
	},
	[181] = {
		location = vector4(4859.02, -4697.106, 8.508227, 352.1896) ,
		Looted = false
	},
	[182] = {
		location = vector4(4847.238, -4700.603, 8.869469, 79.68195) ,
		Looted = false
	},
	[183] = {
		location = vector4(4839.611, -4749.83, 16.29376, 314.6728) ,
		Looted = false
	},
	[184] = {
		location = vector4(4801.033, -4727.054, 5.125857, 239.9368) ,
		Looted = false
	},
	[185] = {
		location = vector4(4763.297, -4781.28, 3.801519, 328.2706) ,
		Looted = false
	},
	[186] = {
		location = vector4(4768.793, -4722.231, 2.434533, 354.0006) ,
		Looted = false
	},
	[187] = {
		location = vector4(4796.555, -4728.886, 4.149103, 151.2871) ,
		Looted = false
	},
	[188] = {
		location = vector4(4877.303, -4724.105, 14.33898, 287.3073) ,
		Looted = false
	},
	[189] = {
		location = vector4(4946.981, -4677.843, 12.86436, 252.4895) ,
		Looted = false
	},
	[190] = {
		location = vector4(5036.419, -4643.787, 3.642409, 110.7739) ,
		Looted = false
	},
	[191] = {
		location = vector4(5033.752, -4631.442, 21.68461, 82.55374) ,
		Looted = false
	},
	[192] = {
		location = vector4(5032.591, -4627.995, 4.904295, 4.892286) ,
		Looted = false
	},
	[193] = {
		location = vector4(5060.015, -4600.986, 2.855101, 162.0533) ,
		Looted = false
	},
	[194] = {
		location = vector4(5056.841, -4591.03, 2.898218, 157.866) ,
		Looted = false
	},
	[195] = {
		location = vector4(5067.97, -4591.834, 2.860847, 180.9769) ,
		Looted = false
	},
	[196] = {
		location = vector4(5076.699, -4602.992, 2.886467, 66.71243) ,
		Looted = false
	},
	[197] = {
		location = vector4(5068.839, -4635.184, 2.412262, 109.0545) ,
		Looted = false
	},
	[198] = {
		location = vector4(5090.743, -4622.264, 2.543196, 268.6924) ,
		Looted = false
	},
	[199] = {
		location = vector4(5123.464, -4630.179, 1.4429, 162.56) ,
		Looted = false
	},
	[200] = {
		location = vector4(5132.111, -4643.809, 1.407542, 168.1155) ,
		Looted = false
	},
	[201] = {
		location = vector4(5146.01, -4637.819, 1.442705, 162.8193) ,
		Looted = false
	},
	[202] = {
		location = vector4(5171.472, -4657.622, 2.527878, 103.7856) ,
		Looted = false
	},
	[203] = {
		location = vector4(5160.15, -4676.016, 1.444246, 7.513147) ,
		Looted = false
	},
	[204] = {
		location = vector4(5152.309, -4679.558, 2.286732, 77.88656) ,
		Looted = false
	},
	[205] = {
		location = vector4(5160.271, -4700.26, 2.151747, 294.2982) ,
		Looted = false
	},
	[206] = {
		location = vector4(5177.792, -4675.928, 2.447556, 343.1744) ,
		Looted = false
	},
	[207] = {
		location = vector4(5179.544, -4665.91, 2.506061, 340.1443) ,
		Looted = false
	},
	[208] = {
		location = vector4(5178.843, -4650.171, 2.531538, 352.0733) ,
		Looted = false
	},
	[209] = {
		location = vector4(5144.56, -4608.179, 2.704291, 78.91552) ,
		Looted = false
	},
	[210] = {
		location = vector4(5172.568, -4613.972, 2.863841, 261.8564) ,
		Looted = false
	},
	[211] = {
		location = vector4(5172.6, -4585.456, 3.750595, 343.9237) ,
		Looted = false
	},
	[212] = {
		location = vector4(5110.492, -4580.131, 29.7178, 89.49045) ,
		Looted = false
	},
	[213] = {
		location = vector4(5104.044, -4582.118, 29.71779, 311.81) ,
		Looted = false
	},
	[214] = {
		location = vector4(5094.685, -4578.958, 4.05067, 144.8252) ,
		Looted = false
	},
	[215] = {
		location = vector4(5048.24, -4590.76, 2.958224, 88.63052) ,
		Looted = false
	},
	[216] = {
		location = vector4(5012.252, -4519.87, 7.437962, 355.593) ,
		Looted = false
	},
	[217] = {
		location = vector4(4960.204, -4476.562, 10.57005, 329.4385) ,
		Looted = false
	},
	[218] = {
		location = vector4(4958.683, -4469.878, 10.61867, 239.0269) ,
		Looted = false
	},
	[219] = {
		location = vector4(4836.344, -4451.121, 8.698675, 76.35995) ,
		Looted = false
	},
	[220] = {
		location = vector4(4799.374, -4375.356, 21.54441, 53.85963) ,
		Looted = false
	},
	[221] = {
		location = vector4(4802.633, -4317.419, 7.829304, 262.0934) ,
		Looted = false
	},
	[222] = {
		location = vector4(4816.938, -4313.868, 9.913684, 147.6711) ,
		Looted = false
	},
	[223] = {
		location = vector4(4797.483, -4266.114, 1.764933, 156.9807) ,
		Looted = false
	},
	[224] = {
		location = vector4(4769.057, -4302.101, 6.142069, 152.8763) ,
		Looted = false
	},
	[225] = {
		location = vector4(4731.151, -4383.041, 6.007947, 159.0308) ,
		Looted = false
	},
	[226] = {
		location = vector4(4791.128, -4400.304, 20.35125, 288.097) ,
		Looted = false
	},
	[227] = {
		location = vector4(4666.939, -4556.39, 22.75722, 96.33045) ,
		Looted = false
	},
	[228] = {
		location = vector4(4659.316, -4558.9, 21.64879, 145.5967) ,
		Looted = false
	},
	[229] = {
		location = vector4(4989.464, -4719.417, 11.14492, 139.4328) ,
		Looted = false
	},
	[230] = {
		location = vector4(4979.848, -4769.673, 13.19061, 162.7739) ,
		Looted = false
	},
	[231] = {
		location = vector4(4980.414, -4800.602, 13.53448, 187.9069) ,
		Looted = false
	},
	[232] = {
		location = vector4(4956.967, -4824.426, 5.990408, 292.714) ,
		Looted = false
	},
	[233] = {
		location = vector4(4946.956, -4857.084, 4.297906, 186.1607) ,
		Looted = false
	},
	[234] = {
		location = vector4(4929.132, -4877.562, 3.874159, 139.5829) ,
		Looted = false
	},
	[235] = {
		location = vector4(4909.815, -4891.413, 3.428599, 115.4404) ,
		Looted = false
	},
	[236] = {
		location = vector4(4892.076, -4924.674, 3.366156, 96.70518) ,
		Looted = false
	},
	[237] = {
		location = vector4(4905.71, -4942.875, 3.376066, 1.706251) ,
		Looted = false
	},
	[238] = {
		location = vector4(4881.509, -4957.854, 3.873615, 21.14968) ,
		Looted = false
	},
	[239] = {
		location = vector4(4836.628, -4949.693, 2.253387, 281.6374) ,
		Looted = false
	},
	[240] = {
		location = vector4(4847.616, -4906.496, 2.459188, 79.94688) ,
		Looted = false
	},
	[241] = {
		location = vector4(4993.197, -4893.856, 25.06894, 325.9859) ,
		Looted = false
	},
	[242] = {
		location = vector4(5084.51, -4882.276, 17.01767, 237.3844) ,
		Looted = false
	},
	[243] = {
		location = vector4(5096.881, -4885.296, 16.3266, 152.472) ,
		Looted = false
	},
	[244] = {
		location = vector4(5141.432, -4931.097, 15.00472, 50.89748) ,
		Looted = false
	},
	[245] = {
		location = vector4(5129.627, -4955.289, 15.72381, 152.286) ,
		Looted = false
	},
	[246] = {
		location = vector4(5149.197, -4960.45, 14.01721, 29.5999) ,
		Looted = false
	},
	[247] = {
		location = vector4(5162.745, -4942.98, 13.80619, 123.3607) ,
		Looted = false
	},
	[248] = {
		location = vector4(5153.92, -4932.858, 30.87343, 123.7846) ,
		Looted = false
	},
	[249] = {
		location = vector4(5143.509, -4954.573, 14.36116, 319.6407) ,
		Looted = false
	},
	[250] = {
		location = vector4(5162.085, -4994.015, 12.69476, 110.4849) ,
		Looted = false
	},
	[251] = {
		location = vector4(5186.818, -5000.103, 14.07302, 122.6201) ,
		Looted = false
	},
	[252] = {
		location = vector4(5191.106, -5010.829, 13.90104, 134.0847) ,
		Looted = false
	},
	[253] = {
		location = vector4(5207.339, -5060.151, 13.09455, 147.478) ,
		Looted = false
	},
	[254] = {
		location = vector4(5249.489, -5119.171, 13.8287, 173.6719) ,
		Looted = false
	},
	[255] = {
		location = vector4(5214.851, -5127.285, 6.246726, 98.37386) ,
		Looted = false
	},
	[256] = {
		location = vector4(5203.896, -5119.994, 6.146749, 298.5732) ,
		Looted = false
	},
	[257] = {
		location = vector4(5155.303, -5128.986, 2.306046, 89.92068) ,
		Looted = false
	},
	[258] = {
		location = vector4(5136.865, -5128.032, 2.117657, 83.37889) ,
		Looted = false
	},
	[259] = {
		location = vector4(5123.822, -5141.883, 2.206724, 3.295262) ,
		Looted = false
	},
	[260] = {
		location = vector4(5117.794, -5116.221, 2.138765, 269.7493) ,
		Looted = false
	},
	[261] = {
		location = vector4(5117.199, -5171.212, 2.272738, 82.41213) ,
		Looted = false
	},
	[262] = {
		location = vector4(5108.328, -5199.44, 2.047295, 116.3045) ,
		Looted = false
	},
	[263] = {
		location = vector4(5125.24, -5203.072, 2.804384, 187.4904) ,
		Looted = false
	},
	[264] = {
		location = vector4(5141.291, -5190.895, 2.481334, 179.3274) ,
		Looted = false
	},
	[265] = {
		location = vector4(5160.101, -5172.865, 1.968629, 285.727) ,
		Looted = false
	},
	[266] = {
		location = vector4(5183.083, -5146.843, 3.555337, 1.700297) ,
		Looted = false
	},
	[267] = {
		location = vector4(5187.802, -5143.328, 3.591862, 202.6558) ,
		Looted = false
	},
	[268] = {
		location = vector4(5140.778, -5244.212, 26.29192, 87.72564) ,
		Looted = false
	},
	[269] = {
		location = vector4(5327.233, -5264.073, 32.99901, 162.2611) ,
		Looted = false
	},
	[270] = {
		location = vector4(5380.791, -5252.08, 33.92894, 208.8901) ,
		Looted = false
	},
	[271] = {
		location = vector4(5422.938, -5240.877, 35.47293, 104.3418) ,
		Looted = false
	},
	[272] = {
		location = vector4(5465.942, -5237.273, 43.96178, 351.4168) ,
		Looted = false
	},
	[273] = {
		location = vector4(5472.871, -5239.067, 25.30939, 74.76386) ,
		Looted = false
	},
	[274] = {
		location = vector4(5588.894, -5223.547, 14.35063, 73.93979) ,
		Looted = false
	},
	[275] = {
		location = vector4(5576.175, -5301.479, 16.80787, 161.6972) ,
		Looted = false
	},
	[276] = {
		location = vector4(5521.019, -5406.66, 26.00185, 143.5608) ,
		Looted = false
	},
	[277] = {
		location = vector4(5501.906, -5431.9, 27.04688, 122.1895) ,
		Looted = false
	},
	[278] = {
		location = vector4(5519.866, -5536.401, 26.11678, 130.6362) ,
		Looted = false
	},
	[279] = {
		location = vector4(5493.201, -5584.254, 14.07501, 86.08718) ,
		Looted = false
	},
	[280] = {
		location = vector4(5498.948, -5597.807, 14.07501, 191.8144) ,
		Looted = false
	},
	[281] = {
		location = vector4(5603.344, -5664.327, 11.17276, 223.7235) ,
		Looted = false
	},
	[282] = {
		location = vector4(5617.819, -5652.292, 10.07749, 239.02) ,
		Looted = false
	},
	[283] = {
		location = vector4(5544.121, -5717.522, 10.12496, 230.619) ,
		Looted = false
	},
	[284] = {
		location = vector4(5537.768, -5769.366, 11.08702, 318.1221) ,
		Looted = false
	},
	[285] = {
		location = vector4(5540.515, -5816.533, 17.2277, 36.19609) ,
		Looted = false
	},
	[286] = {
		location = vector4(5616.435, -5884.604, 14.21241, 80.25938) ,
		Looted = false
	},
	[287] = {
		location = vector4(5613.07, -5894.377, 14.31622, 158.9698) ,
		Looted = false
	},
	[288] = {
		location = vector4(5377.548, -5722.92, 41.20292, 343.1186) ,
		Looted = false
	},
	[289] = {
		location = vector4(5322.798, -5609.855, 65.09708, 49.6988) ,
		Looted = false
	},
	[290] = {
		location = vector4(5227.475, -5540.6, 46.95957, 67.0685) ,
		Looted = false
	},
	[291] = {
		location = vector4(5106.614, -5523.11, 54.22988, 107.7536) ,
		Looted = false
	},
	[292] = {
		location = vector4(5003.686, -5398.8, 31.89904, 42.34485) ,
		Looted = false
	},
	[293] = {
		location = vector4(4920.823, -5342.321, 9.369658, 246.8061),
		Looted = false
	},

	
}