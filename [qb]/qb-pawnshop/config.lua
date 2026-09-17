Config = {}

Config.PawnLocation = {
    [1] = {
            coords = vector3(412.34, 314.81, 103.13),
            length = 1.5,
            width = 1.8,
            heading = 207.0,
            debugPoly = false,
            minZ = 100.97,
            maxZ = 105.42,
            distance = 3.0
        },
    [2] = {
            coords = vector3(-227.75, 6333.8, 32.42),
            length = 1.5,
            width = 1.8,
            heading = 314.89,
            debugPoly = false,
            minZ = 31.97,
            maxZ = 33.42,
            distance = 3.0
        },
    }

Config.BankMoney = false -- Set to true if you want the money to go into the players bank
Config.UseTimes = false -- Set to false if you want the pawnshop open 24/7
Config.TimeOpen = 7 -- Opening Time
Config.TimeClosed = 17 -- Closing Time
Config.SendMeltingEmail = true

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'

Config.PawnItems = {
    [1] = {
        item = 'goldchain',
        price = math.random(600,1000)
    },
    [2] = {
        item = 'diamond_ring',
        price = math.random(1000,2500)
    },
    [3] = {
        item = 'rolex',
        price = math.random(600,1000)
    },
    [4] = {
        item = 'tenkgoldchain',
        price = math.random(750,1250)
    },
    [5] = {
        item = 'tablet',
        price = math.random(600,1000)
    },
    [6] = {
        item = 'iphone',
        price = math.random(600,900)
    },
    [7] = {
        item = 'samsungphone',
        price = math.random(500,800)
    },
    [8] = {
        item = 'laptop',
        price = math.random(900,1300)
    },
    [9] = {
        item = 'goldbar',
        price = math.random(1000,2000)
    },
    [10] = {
        item = 'mininglaser',
        price = math.random(400,600)
    },
    [11] = {
        item = 'drillbit',
        price = math.random(250,350)
    },
    [12] = {
        item = 'miningdrill',
        price = math.random(300,400)
    },
    [13] = {
        item = 'meatcrow',
        price = math.random(5,15)
    },
    [14] = {
        item = 'meatchickenhawk',
        price = math.random(7,22)
    },
    [15] = {
        item = 'meatcormorant',
        price = math.random(12,25)
    },
    [16] = {
        item = 'meatseagull',
        price = math.random(12,37)
    },
    [17] = {
        item = 'meatbird',
        price = math.random(12,50)
    },
    [18] = {
        item = 'meatrabbit',
        price = math.random(25,100)
    },
    [19] = {
        item = 'meatcoyote',
        price = math.random(50,150)
    },
    [20] = {
        item = 'meatdeer',
        price = math.random(100,200)
    },
    [21] = {
        item = 'meatpig',
        price = math.random(150,250)
    },
    [22] = {
        item = 'meatcow',
        price = math.random(200,300)
    },
    [23] = {
        item = 'meatboar',
        price = math.random(250,350)
    },
    [24] = {
        item = 'meatlion',
        price = math.random(300,400)
    },
	
	--weapons
	
	--pistols
    [25] = {
        item = 'weapon_gardone',
        price = math.random(3000,4000)
    },
    [26] = {
        item = 'weapon_fnx',
        price = math.random(3000,4000)
    },
    [27] = {
        item = 'weapon_g30',
        price = math.random(3000,4000)
    },
    [28] = {
        item = 'weapon_tec9',
        price = math.random(3000,4000)
    },
    [29] = {
        item = 'weapon_p226',
        price = math.random(3000,4000)
    },
    [30] = {
        item = 'weapon_g18c',
        price = math.random(3000,4000)
    },
    [31] = {
        item = 'weapon_g17',
        price = math.random(3000,4000)
    },
    [32] = {
        item = 'weapon_pistol',
        price = math.random(3000,4000)
    },
    [33] = {
        item = 'weapon_pistol_mk2',
        price = math.random(3000,4000)
    },
    [34] = {
        item = 'weapon_combatpistol',
        price = math.random(3000,4000)
    },
    [35] = {
        item = 'weapon_appistol',
        price = math.random(3000,4000)
    },
    [36] = {
        item = 'weapon_pistol50',
        price = math.random(3000,4000)
    },
    [37] = {
        item = 'weapon_snspistol',
        price = math.random(3000,4000)
    },
    [38] = {
        item = 'weapon_heavypistol',
        price = math.random(3000,4000)
    },
    [39] = {
        item = 'weapon_vintagepistol',
        price = math.random(3000,4000)
    },
    [40] = {
        item = 'weapon_marksmanpistol',
        price = math.random(3000,4000)
    },
    [41] = {
        item = 'weapon_doubleaction',
        price = math.random(3000,4000)
    },
    [42] = {
        item = 'weapon_snspistol_mk2',
        price = math.random(3000,4000)
    },
	--smgs
	
    [43] = {
        item = 'weapon_mp5',
        price = math.random(4000,6000)
    },
    [44] = {
        item = 'weapon_mac',        
		price = math.random(4000,6000)

    },
    [45] = {
        item = 'weapon_microsmg',        
		price = math.random(4000,6000)
    },
    [46] = {
        item = 'weapon_smg',        
		price = math.random(4000,6000)
    },
    [47] = {
        item = 'weapon_smg_mk2',        
		price = math.random(4000,6000)
    },
    [48] = {
        item = 'weapon_assaultsmg',        
		price = math.random(4000,6000)
    },
    [49] = {
        item = 'weapon_combatpdw',        
		price = math.random(4000,6000)
    },
    [50] = {
        item = 'weapon_machinepistol',        
		price = math.random(4000,6000)
    },
    [51] = {
        item = 'weapon_minismg',        
		price = math.random(4000,6000)
    },
	--shotguns
    [52] = {
        item = 'weapon_m870',
        price = math.random(5000,10000)
    },
    [53] = {
        item = 'weapon_pumpshotgun',
        price = math.random(5000,10000)
    },
    [54] = {
        item = 'weapon_sawnoffshotgun',
        price = math.random(5000,10000)
    },
    [55] = {
        item = 'weapon_assaultshotgun',
        price = math.random(5000,10000)
    },
    [56] = {
        item = 'weapon_bullpupshotgun',
        price = math.random(5000,10000)
    },
    [57] = {
        item = 'weapon_musket',
        price = math.random(5000,10000)
    },
    [58] = {
        item = 'weapon_heavyshotgun',
        price = math.random(5000,10000)
    },
    [59] = {
        item = 'weapon_dbshotgun',
        price = math.random(5000,10000)
    },
    [60] = {
        item = 'weapon_autoshotgun',
        price = math.random(5000,10000)
    },
    [61] = {
        item = 'weapon_pumpshotgun_mk2',
        price = math.random(5000,10000)
    },
    [62] = {
        item = 'weapon_combatshotgun',
        price = math.random(5000,10000)
    },
	--rifles
    [63] = {
        item = 'weapon_draco',
        price = math.random(8000,9000)
    },
    [64] = {
        item = 'weapon_sig516',
        price = math.random(8000,9000)
    },
    [65] = {
        item = 'weapon_nsr',
        price = math.random(8000,9000)
    },
    [66] = {
        item = 'weapon_assaultrifle',
        price = math.random(8000,9000)
    },
    [67] = {
        item = 'weapon_assaultrifle_mk2',
        price = math.random(8000,9000)
    },
    [68] = {
        item = 'weapon_carbinerifle',
        price = math.random(8000,9000)
    },
    [69] = {
        item = 'weapon_carbinerifle_mk2',
        price = math.random(8000,9000)
    },
    [70] = {
        item = 'weapon_advancedrifle',
        price = math.random(8000,9000)
    },
    [71] = {
        item = 'weapon_specialcarbine',
        price = math.random(8000,9000)
    },
    [72] = {
        item = 'weapon_bullpuprifle',
        price = math.random(8000,9000)
    },
    [73] = {
        item = 'weapon_compactrifle',
        price = math.random(8000,9000)
    },
    [74] = {
        item = 'weapon_specialcarbine_mk2',
        price = math.random(8000,9000)
    },
    [75] = {
        item = 'weapon_bullpuprifle_mk2',
        price = math.random(8000,9000)
    },
    [76] = {
        item = 'weapon_militaryrifle',
        price = math.random(8000,9000)
    },
	--LMG
    [77] = {
        item = 'weapon_mg',
        price = math.random(8000,12500)
    },
    [78] = {
        item = 'weapon_combatmg',
        price = math.random(8000,12500)
    },
    [79] = {
        item = 'weapon_gusenberg',
        price = math.random(8000,12500)
    },
    [80] = {
        item = 'weapon_combatmg_mk2',
        price = math.random(8000,12500)
    },
	--snipers
    [81] = {
        item = 'weapon_barrett',
        price = math.random(15000,20000)
    },
    [82] = {
        item = 'weapon_sniperrifle',
        price = math.random(15000,20000)
    },
    [83] = {
        item = 'weapon_heavysniper',
        price = math.random(15000,20000)
    },
    [84] = {
        item = 'weapon_remotesniper',
        price = math.random(15000,20000)
    },
    [85] = {
        item = 'weapon_marksmanrifle',
        price = math.random(15000,20000)
    },
    [86] = {
        item = 'weapon_heavysniper_mk2',
        price = math.random(15000,20000)
    },
    [87] = {
        item = 'weapon_marksmanrifle_mk2',
        price = math.random(15000,20000)
    },
	--pets
    [88] = {
        item = 'rottweiler1',
        price = math.random(1250,1875)
    },
    [89] = {
        item = 'rottweiler2',
        price = math.random(1250,1875)
    },
    [90] = {
        item = 'rottweiler3',
        price = math.random(1250,1875)
    },
    [91] = {
        item = 'cat1',
        price = math.random(150,250)
    },
    [92] = {
        item = 'cat2',
        price = math.random(150,250)
    },
    [93] = {
        item = 'cat3',
        price = math.random(150,250)
    },
    [94] = {
        item = 'chicken',
        price = math.random(50,100)
    },
    [95] = {
        item = 'husky1',
        price = math.random(1250,1875)
    },
    [96] = {
        item = 'husky2',
        price = math.random(1250,1875)
    },
    [97] = {
        item = 'husky3',
        price = math.random(1250,1875)
    },
    [98] = {
        item = 'mtlion1',
        price = math.random(8500,12500)
    },
    [99] = {
        item = 'panther',
        price = math.random(8500,12500)
    },
    [100] = {
        item = 'poodle',
        price = math.random(400,600)
    },
    [101] = {
        item = 'pug1',
        price = math.random(400,600)
    },
    [102] = {
        item = 'pug2',
        price = math.random(400,600)
    },
    [103] = {
        item = 'pug3',
        price = math.random(400,600)
    },
    [104] = {
        item = 'pug4',
        price = math.random(400,600)
    },
    [105] = {
        item = 'retriever1',
        price = math.random(1100,2500)
    },
    [106] = {
        item = 'retriever2',
        price = math.random(1100,2500)
    },
    [107] = {
        item = 'retriever3',
        price = math.random(1100,2500)
    },
    [108] = {
        item = 'retriever4',
        price = math.random(1100,2500)
    },
    [109] = {
        item = 'shepherd1',
        price = math.random(1100,2500)
    },
    [110] = {
        item = 'westy1',
        price = math.random(300,350)
    },
    [111] = {
        item = 'westy2',
        price = math.random(300,350)
    },
    [112] = {
        item = 'westy3',
        price = math.random(300,350)
    },
    [113] = {
        item = 'rabbit',
        price = math.random(300,350)
    },
}

Config.MeltingItems = { -- meltTime is amount of time in minutes per item
    [1] = {
        item = 'goldchain',
        rewards = {
            [1] = {
                item = 'goldbar',
                amount = 2
            }
        },
        meltTime = 0.15
    },
    [2] = {
        item = 'diamond_ring',
        rewards = {
            [1] = {
                item = 'diamond',
                amount = 1
            },
            [2] = {
                item = 'goldbar',
                amount = 1
            }
        },
        meltTime = 0.15
    },
    [3] = {
        item = 'rolex',
        rewards = {
            [1] = {
                item = 'diamond',
                amount = 1
            },
            [2] = {
                item = 'goldbar',
                amount = 1
            },
            [3] = {
                item = 'electronickit',
                amount = 1
            }
        },
        meltTime = 0.15
    },
    [4] = {
        item = 'tenkgoldchain',
        rewards = {
            [1] = {
                item = 'diamond',
                amount = 5
            },
            [2] = {
                item = 'goldbar',
                amount = 1
            }
        },
        meltTime = 0.15
    },
	[5] = {
		item = 'weapon_draco',
		rewards = {
			[1] = {
				item = 'plastic',
				amount = 2
			},
			[2] = {
				item = 'metalscrap',
				amount = 1
			},
			[3] = {
				item = 'aluminum',
				amount = 2
			},
			[4] = {
				item = 'iron',
				amount = 1
			},
			[5] = {
				item = 'steel',
				amount = 45
			},
			[6] = {
				item = 'rubber',
				amount = 1
			},
			[7] = {
				item = 'glass',
				amount = 1
			},
			[8] = {
				item = 'electronickit',
				amount = 1
			},
		},
		meltTime = 1.5
	},
	[6] = {
		item = 'weapon_nsr',
		rewards = {
			[1] = {
				item = 'plastic',
				amount = 2
			},
			[2] = {
				item = 'metalscrap',
				amount = 1
			},
			[3] = {
				item = 'aluminum',
				amount = 2
			},
			[4] = {
				item = 'iron',
				amount = 1
			},
			[5] = {
				item = 'steel',
				amount = 45
			},
			[6] = {
				item = 'rubber',
				amount = 1
			},
			[7] = {
				item = 'glass',
				amount = 1
			},
			[8] = {
				item = 'electronickit',
				amount = 2
			},
		},
		meltTime = 1.5
	},
	[7] = {
		item = 'weapon_fnx',
		rewards = {
			[1] = {
				item = 'plastic',
				amount = 4
			},
			[2] = {
				item = 'metalscrap',
				amount = 1
			},
			[3] = {
				item = 'aluminum',
				amount = 4
			},
			[4] = {
				item = 'iron',
				amount = 1
			},
			[5] = {
				item = 'steel',
				amount = 45
			},
			[6] = {
				item = 'rubber',
				amount = 1
			},
			[7] = {
				item = 'glass',
				amount = 1
			},
			[8] = {
				item = 'electronickit',
				amount = 2
			},
		},
		meltTime = 1.5
	},
	[8] = {
		item = 'weapon_tec9',
		rewards = {
			[1] = {
				item = 'plastic',
				amount = 2
			},
			[2] = {
				item = 'metalscrap',
				amount = 1
			},
			[3] = {
				item = 'aluminum',
				amount = 2
			},
			[4] = {
				item = 'iron',
				amount = 1
			},
			[5] = {
				item = 'steel',
				amount = 45
			},
			[6] = {
				item = 'rubber',
				amount = 1
			},
			[7] = {
				item = 'glass',
				amount = 1
			},
			[8] = {
				item = 'electronickit',
				amount = 1
			},
		},
		meltTime = 1.5
	},
	[9] = {
		item = 'weapon_g18c',
		rewards = {
			[1] = {
				item = 'plastic',
				amount = 2
			},
			[2] = {
				item = 'metalscrap',
				amount = 1
			},
			[3] = {
				item = 'aluminum',
				amount = 2
			},
			[4] = {
				item = 'iron',
				amount = 1
			},
			[5] = {
				item = 'steel',
				amount = 45
			},
			[6] = {
				item = 'rubber',
				amount = 1
			},
			[7] = {
				item = 'glass',
				amount = 1
			},
			[8] = {
				item = 'electronickit',
				amount = 1
			},
		},
		meltTime = 1.5
	},
	[10] = {
		item = 'weapon_barrett',
		rewards = {
			[1] = {
				item = 'plastic',
				amount = 15
			},
			[2] = {
				item = 'metalscrap',
				amount = 4
			},
			[3] = {
				item = 'aluminum',
				amount = 15
			},
			[4] = {
				item = 'iron',
				amount = 1
			},
			[5] = {
				item = 'steel',
				amount = 45
			},
			[6] = {
				item = 'rubber',
				amount = 4
			},
			[7] = {
				item = 'glass',
				amount = 2
			},
			[8] = {
				item = 'electronickit',
				amount = 5
			},
		},
		meltTime = 1.5
	},
	[11] = {
		item = 'weapon_mac',
		rewards = {
			[1] = {
				item = 'plastic',
				amount = 6
			},
			[2] = {
				item = 'metalscrap',
				amount = 1
			},
			[3] = {
				item = 'aluminum',
				amount = 5
			},
			[4] = {
				item = 'iron',
				amount = 1
			},
			[5] = {
				item = 'steel',
				amount = 45
			},
			[6] = {
				item = 'rubber',
				amount = 1
			},
			[7] = {
				item = 'glass',
				amount = 1
			},
			[8] = {
				item = 'electronickit',
				amount = 3
			},
		},
		meltTime = 1.5
	},
	[12] = {
		item = 'weapon_pistol',
		rewards = {
			[1] = {
				item = 'plastic',
				amount = 2
			},
			[2] = {
				item = 'metalscrap',
				amount = 1
			},
			[3] = {
				item = 'aluminum',
				amount = 2
			},
			[4] = {
				item = 'iron',
				amount = 1
			},
			[5] = {
				item = 'steel',
				amount = 45
			},
			[6] = {
				item = 'rubber',
				amount = 1
			},
			[7] = {
				item = 'glass',
				amount = 1
			},
			[8] = {
				item = 'electronickit',
				amount = 1
			},
		},
		meltTime = 1.5
	},
	[13] = {
		item = 'weapon_assaultsmg',
		rewards = {
			[1] = {
				item = 'plastic',
				amount = 4
			},
			[2] = {
				item = 'metalscrap',
				amount = 1
			},
			[3] = {
				item = 'aluminum',
				amount = 4
			},
			[4] = {
				item = 'iron',
				amount = 1
			},
			[5] = {
				item = 'steel',
				amount = 45
			},
			[6] = {
				item = 'rubber',
				amount = 2
			},
			[7] = {
				item = 'glass',
				amount = 1
			},
			[8] = {
				item = 'electronickit',
				amount = 1
			},
		},
		meltTime = 1.5
	},
	[14] = {
		item = 'weapon_machinepistol',
		rewards = {
			[1] = {
				item = 'plastic',
				amount = 4
			},
			[2] = {
				item = 'metalscrap',
				amount = 1
			},
			[3] = {
				item = 'aluminum',
				amount = 4
			},
			[4] = {
				item = 'iron',
				amount = 1
			},
			[5] = {
				item = 'steel',
				amount = 45
			},
			[6] = {
				item = 'rubber',
				amount = 2
			},
			[7] = {
				item = 'glass',
				amount = 1
			},
			[8] = {
				item = 'electronickit',
				amount = 1
			},
		},
		meltTime = 1.5
	},
	[15] = {
		item = 'weapon_bullpupshotgun',
		rewards = {
			[1] = {
				item = 'plastic',
				amount = 6
			},
			[2] = {
				item = 'metalscrap',
				amount = 1
			},
			[3] = {
				item = 'aluminum',
				amount = 6
			},
			[4] = {
				item = 'iron',
				amount = 1
			},
			[5] = {
				item = 'steel',
				amount = 45
			},
			[6] = {
				item = 'rubber',
				amount = 4
			},
			[7] = {
				item = 'glass',
				amount = 2
			},
			[8] = {
				item = 'electronickit',
				amount = 1
			},
		},
		meltTime = 1.5
	},
	[16] = {
		item = 'weapon_assaultrifle',
		rewards = {
			[1] = {
				item = 'plastic',
				amount = 9
			},
			[2] = {
				item = 'metalscrap',
				amount = 1
			},
			[3] = {
				item = 'aluminum',
				amount = 9
			},
			[4] = {
				item = 'iron',
				amount = 1
			},
			[5] = {
				item = 'steel',
				amount = 45
			},
			[6] = {
				item = 'rubber',
				amount = 5
			},
			[7] = {
				item = 'glass',
				amount = 3
			},
			[8] = {
				item = 'electronickit',
				amount = 2
			},
		},
		meltTime = 1.5
	},
	[17] = {
		item = 'weapon_specialcarbine_mk2',
		rewards = {
			[1] = {
				item = 'plastic',
				amount = 9
			},
			[2] = {
				item = 'metalscrap',
				amount = 1
			},
			[3] = {
				item = 'aluminum',
				amount = 9
			},
			[4] = {
				item = 'iron',
				amount = 1
			},
			[5] = {
				item = 'steel',
				amount = 45
			},
			[6] = {
				item = 'rubber',
				amount = 5
			},
			[7] = {
				item = 'glass',
				amount = 3
			},
			[8] = {
				item = 'electronickit',
				amount = 2
			},
		},
		meltTime = 1.5
	},
	[18] = {
		item = 'weapon_heavysniper',
		rewards = {
			[1] = {
				item = 'plastic',
				amount = 13
			},
			[2] = {
				item = 'metalscrap',
				amount = 2
			},
			[3] = {
				item = 'aluminum',
				amount = 13
			},
			[4] = {
				item = 'iron',
				amount = 2
			},
			[5] = {
				item = 'steel',
				amount = 45
			},
			[6] = {
				item = 'rubber',
				amount = 8
			},
			[7] = {
				item = 'glass',
				amount = 5
			},
			[8] = {
				item = 'electronickit',
				amount = 4
			},
		},
		meltTime = 1.5
	},
	[19] = {
		item = 'rifle_ammo',
		rewards = {
			[1] = {
				item = 'plastic',
				amount = 4
			},
			[2] = {
				item = 'copper',
				amount = 2
			},
			[3] = {
				item = 'aluminum',
				amount = 1
			},
			[4] = {
				item = 'rubber',
				amount = 1
			},
		},
		meltTime = 1.5
	},
	[20] = {
		item = 'shotgun_ammo',
		rewards = {
			[1] = {
				item = 'plastic',
				amount = 4
			},
			[2] = {
				item = 'copper',
				amount = 2
			},
			[3] = {
				item = 'aluminum',
				amount = 1
			},
			[4] = {
				item = 'rubber',
				amount = 1
			},
		},
		meltTime = 1.5
	},
	[21] = {
		item = 'snp_ammo',
		rewards = {
			[1] = {
				item = 'plastic',
				amount = 4
			},
			[2] = {
				item = 'copper',
				amount = 2
			},
			[3] = {
				item = 'aluminum',
				amount = 2
			},
			[4] = {
				item = 'rubber',
				amount = 1
			},
		},
		meltTime = 1.5
	}


}
