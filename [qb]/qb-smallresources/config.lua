Config = {}
-- local QBCore = exports['qb-core']:GetCoreObject()

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)
Config.PauseMapText = 'StarValley'                                     -- Text shown above the map when ESC is pressed. If left empty 'FiveM' will appear
Config.HarnessUses = 20
Config.DamageNeeded = 100.0                                  -- amount of damage till you can push your vehicle. 0-1000
Config.Logging = 'discord'                                   -- fivemanage

Config.weedDrugDurations = 20
Config.TopShelfDurations = 40
Config.DrugDurations = 60
Config.fentanylStress = math.random(40,80)
Config.RelieveWeedStress = math.random(25, 50) -- stress relief amount (100 max)
Config.topShelfStress = math.random(30, 60) -- stress relief amount (100 max)
Config.edibleStress = math.random(15,45)
Config.eatStress = math.random(2,5)
Config.drinkStress = math.random(3,7)
Config.alcoholStress = math.random(12,22)
Config.cokeStress = math.random(40,80)
Config.crackStress = math.random(80,100)
Config.ecstasyStress = math.random(20,60)
Config.oxyStress = math.random(20,60)
Config.methStress = math.random(50,90)


Config.AFK = {
    ignoredGroups = {
        ['mod'] = true,
        ['admin'] = true,
        ['god'] = true
    },
    secondsUntilKick = 3600, -- AFK Kick Time Limit (in seconds)
    kickInCharMenu = false      -- Set to true if you want to kick players for being AFK even when they are in the character menu.
}

Config.lighterItems = {
	'cheap_lighter',
	'lighter',
	'beklighter'
}

Config.HandsUp = {
    command = 'hu',
    keybind = 'X',
    controls = { 24, 25, 47, 58, 59, 63, 64, 71, 72, 75, 140, 141, 142, 143, 257, 263, 264 }
}

Config.Binoculars = {
    zoomSpeed = 10.0,        -- camera zoom speed
    storeBinocularsKey = 177 -- backspace by default
}

Config.PoliceCount = 5
Config.AIResponse = {
	
    wantedLevels = true, -- if true, you will recieve wanted levels
    dispatchServices = {  -- AI dispatch services
        [1] = true,      -- Police Vehicles
        [2] = true,      -- Police Helicopters
        [3] = false,      -- Fire Department Vehicles
        [4] = true,      -- Swat Vehicles
        [5] = false,      -- Ambulance Vehicles
        [6] = true,      -- Police Motorcycles
        [7] = true,      -- Police Backup
        [8] = true,      -- Police Roadblocks
        [9] = true,      -- PoliceAutomobileWaitPulledOver
        [10] = true,     -- PoliceAutomobileWaitCruising
        [11] = true,     -- Gang Members
        [12] = true,     -- Swat Helicopters
        [13] = true,     -- Police Boats
        [14] = true,     -- Army Vehicles
        [15] = true      -- Biker Backup
    }
}

-- To Set This Up visit https://forum.cfx.re/t/how-to-updated-discord-rich-presence-custom-image/157686
Config.Discord = {
    isEnabled = true,                                     -- If set to true, then discord rich presence will be enabled
    applicationId = '1265432848593326181',                   -- The discord application id
    iconLarge = 'logo_name',                               -- The name of the large icon
    iconLargeHoverText = 'StarValley RP', -- The hover text of the large icon
    iconSmall = 'small_logo_name',                         -- The name of the small icon
    iconSmallHoverText = 'SVRP', -- The hover text of the small icon
    updateRate = 60000,                                    -- How often the player count should be updated
    showPlayerCount = true,                                -- If set to true the player count will be displayed in the rich presence
    maxPlayers = 128,                                       -- Maximum amount of players
    buttons = {
        {
            text = 'Join me on StarValley RP',
            url = 'https://cfx.re/join/reldmj'
        },
        {
            text = 'Join StarValley RP Discord',
            url = 'https://discord.gg/VTBxU2X5du'
        }
    }
}

Config.Density = {
    parked = 0.2,
    vehicle = 1.0,
    multiplier = 2.0,
    peds = 6.8,
    scenario = 0.5
}

Config.Disable = {
    hudComponents = { 2, 4, 7, 9, 13, 14, 19, 20, 21, 22 }, -- Hud Components: https://docs.fivem.net/natives/?_0x6806C51AD12B83B8
    controls = { 37 },                                            -- Controls: https://docs.fivem.net/docs/game-references/controls/
    displayAmmo = true,                                           -- false disables ammo display
    ambience = false,                                             -- disables distance sirens, distance car alarms, flight music, etc
    idleCamera = true,                                            -- disables the idle cinematic camera
    vestDrawable = false,                                         -- disables the vest equipped when using heavy armor
    pistolWhipping = true,                                        -- disables pistol whipping
    driveby = false,                                              -- disables driveby
}


Config.Consumables = {
    eat = { 
     -- default food items
        ['sandwich'] = math.random(35, 54),
        ['tosti'] = math.random(40, 50),
        ['candy'] = math.random(30, 45),
        ['twerks_candy'] = math.random(35, 54),
        ['snikkel_candy'] = math.random(40, 50),
		["jollyranchers"] = math.random(5, 10),
		--farming items    
		["apple"] = math.random(10, 20),
		["cheese"] = math.random(10, 20),
		["beef"] = math.random(35, 50),
		["slicedpie"] = math.random(10, 20),
		["corncob"] = math.random(25, 40),
		["canofcorn"] = math.random(35, 50),
		["grapes"] = math.random(10, 20),
		["pepperoni"] = math.random(10, 20),
		["greenpepper"] = math.random(10, 20),
		["chillypepper"] = math.random(10, 20),
		["tomato"] = math.random(10, 20),
		["tomatopaste"] = math.random(25, 40),
		["cooked_bacon"] = math.random(35, 50),
		["cooked_sausage"] = math.random(35, 50),
		["cooked_pork"] = math.random(35, 50),
		["cooked_ham"] = math.random(35, 50),
		--weed items WEAK 
        ['weed_whitewidow'] = math.random(5, 10),
        ['weed_skunk'] = math.random(5, 10),
        ['weed_purplehaze'] = math.random(5, 10),
        ['weed_ogkush'] = math.random(5, 10),
        ['weed_amnesia'] = math.random(5, 10),
        ['weed_ak47'] = math.random(5, 10),
		
		--RustyBrowns
        ['donut'] = math.random(10, 25),
        ['breakfast_sandwich'] = math.random(10, 25),
        ['bagel'] = math.random(10, 25),
        ['bacon_egg_roll'] = math.random(10, 25),
        ['hotdog'] = math.random(10, 25),
		--burgershot
        ['burger'] = math.random(10, 25),
        ['chickennuggets'] = math.random(10, 25),
        ['chickensandwich'] = math.random(10, 25),
        ['chickentenders'] = math.random(10, 25),
        ['fries'] = math.random(10, 25),
        ['grilledchickentenders'] = math.random(10, 25),
		--tequilala
        ['sonoran_hot_dog'] = math.random(25, 45),
        ['quesabirria_tacos'] = math.random(25, 45),
        ['tenderloin_horseshoe'] = math.random(25, 45),
        ['ground_beef_pastel'] = math.random(25, 45),
		--pulse
        ['hot_wings'] = math.random(25, 45),
        ['boneless_wings'] = math.random(25, 40),
        ['nachos'] = math.random(25, 35),
        ['sliders'] = math.random(25, 30),
        ['loaded_fries'] = math.random(20, 25),
		--Big Johns
        ['jalapeno_poppers'] = math.random(35, 54),
        ['garlic_bread'] = math.random(35, 54),
        ['cheesy_steak_pizza'] = math.random(35, 54),
        ['supreme_pizza'] = math.random(35, 54)

	},
	edibles = {
	--Cookies
        ['jefe'] = math.random(5, 10),
        ['snow_man'] = math.random(5, 10),
        ['white_runtz'] = math.random(10, 15),
        ['whitecherry_gelato'] = math.random(10, 15),
        ['grabba_leaf'] = math.random(15, 20),
        ['georgia_pie'] = math.random(15, 20),
        ['gelatti'] = math.random(20, 25),
        ['gary_payton'] = math.random(25, 30),
        ['cheetah_piss'] = math.random(30, 35),
        ['cereal_milk'] = math.random(35, 40),
        ['cake_mix'] = math.random(40, 45),
        ['blueberry_cruffin'] = math.random(45, 50)
	},
    drink = { -- default drink items
        ['water_bottle'] = math.random(35, 54),
        ['kurkakola'] = math.random(35, 54),
		--farming
		["apple_juice"] = math.random(25, 45),
		["grapejuice"] = math.random(25, 45),
		["milk"] = math.random(25, 45),
		["hotsauce"] = math.random(10, 15),
		--rustybrowns
        ['coffee'] = math.random(40, 50),
        ['iced_coffee'] = math.random(25, 50),
        ['hot_coffee'] = math.random(25, 50),
        ['frozen_coffee'] = math.random(25, 50),
		--burgershot
        ['softdrink'] = math.random(25, 50),
		--Big Johns
        ['grape_soda'] = math.random(25, 50),
        ['mango_soda'] = math.random(25, 50),
        ['mango_orange_soda'] = math.random(25, 50),
        ['orange_soda'] = math.random(25, 50),
		['cranberryjuice'] = math.random(25, 45),
        ['lemonade'] = math.random(25, 50)
		
    },
    drinkshakes = { -- default drink items
        ['gym_shake'] = math.random(40, 60),
    },
	lean = { -- default drink items
        ['lean'] = math.random(40, 60),
    },
    topShelfEat = { -- default alcohol items
        ['pizza_burger'] = math.random(70, 80),
        ['buffalo_wings'] = math.random(70, 80),
        ['bbq_ribs'] = math.random(80, 90),
        ['meat_lovers_pizza'] = math.random(90, 100),
        ['little_creek_burger'] = math.random(70, 80),
        ['west_coast_deluxe'] = math.random(80, 90),
        ['the_birdy_burger'] = math.random(90, 100)
    },
    topShelfDrink = { -- default alcohol items
        ['walk_me_down'] = math.random(90, 100),
        ['long_island'] = math.random(90, 100),
        ['old_fashioned'] = math.random(80, 90),
        ['mai_tai'] = math.random(80, 90),
        ['side_car'] = math.random(80, 90),
        ['sex_on_the_beach'] = math.random(70, 80)
    },
    alcohol = { -- default alcohol items
        ['whiskey'] = math.random(20, 30),
        ['tequila'] = math.random(20, 30),
        ['beer'] = math.random(30, 40),
        ['vodka'] = math.random(20, 40),
        ['wine'] = math.random(20, 40),
		--tequilala
        ['sour_apple_highball'] = math.random(25, 45),
        ['take_9'] = math.random(25, 45),
        ['fish_bowl'] = math.random(25, 45),
        ['last_word'] = math.random(25, 45),
		
        ['aperol_spritz'] = math.random(25, 45),
        ['black_russian'] = math.random(25, 45),
        ['irish_coffee'] = math.random(25, 45),
        ['panty_dropper'] = math.random(25, 45),
        ['cremedementhe'] = math.random(25, 45),
        ['blueberryschnapps'] = math.random(25, 45),
        ['peachschnapps'] = math.random(25, 45),
        ['triplesec']  = math.random(25, 45),
        ['cognac']  = math.random(25, 45),
        ['kahlua'] 	 = math.random(25, 45),
        ['prosecco'] 	 = math.random(25, 45),
        ['maraschinoliqueur']  = math.random(25, 45),
        ['greenchartreuseliqueur'] = math.random(25, 45),
        ['dryvermouth'] 	 = math.random(25, 45),
        ['bluecuracao'] 	 = math.random(25, 45),
        ['greenchartreuseliqueur'] 	 = math.random(25, 45),
        ['aperol'] 			 = math.random(25, 45),
        ['bitters'] 		 = math.random(25, 45),
        ['simplesyrup'] 	 = math.random(25, 45),
        ['sourappleschnapps'] 		 = math.random(25, 45),
        ['bourbon'] 			 = math.random(25, 45),
        ['coconutrum'] 			 = math.random(25, 45),
        ['spicedrum'] 		 = math.random(25, 45),
        ['sprunk'] 			 = math.random(25, 45),
        ['gin'] 			 = math.random(25, 45)
    },
	--weed bricks
	
	
	cracksmallbricks = {
		['crack_small_brick'] = 50
	},
	largeWeedBricks = {
		['whitewidow_weed_brick'] = 100,
		['ogkush_weed_brick'] = 100,
		['skunk_weed_brick'] = 100,
		['amnesia_weed_brick'] = 100,
		['ak47_weed_brick'] = 100,
		['purplehaze_weed_brick'] = 100
	},
	ibuprofenbottle = {
		['ibuprofen_bottle'] = 1
	},
	amoxixillinbottle = {
		['amoxixillin_bottle'] = 1
	},
	oxycodonebottle = {
		['oxycodone_bottle'] = 1
	},
	morphinebottle = {
		['morphine_bottle'] = 1
	},
	xanaxbottle = {
		['xanax_bottle'] = 1
	},
	cokesmallbricks = {
		['coke_small_brick'] = 50
	},
	cokelargebricks = {
		['coke_brick'] = 100
	},
	leansmall = {
		['lean_small_bottle'] = 50
	},
	leanlarge = {
		['lean_large_bottle'] = 100
	},
	pixiesmallbricks = {
		['pixiedust_small_brick'] = 50
	},
	pixielargebricks = {
		['pixiedust_brick'] = 100
	},
	cracksmallbricks = {
		['crack_small_brick'] = 50
	},
	cracklargebricks = {
		['crack_brick'] = 100
	},
	fentanylsmallbricks = {
		['fentanyl_small_brick'] = 50
	},
	fentanyllargebricks = {
		['fentanyl_brick'] = 100
	},
	packofsmokes = {
		['cigarette_pack'] = 0
	},
	cigs = {
		['cigarette'] = 100
	},
    presents = { -- 
        ['present'] = 0
    },
    weed = { -- default alcohol items
        ['joint'] = math.random(10, 15),
        ['backwoods_grape'] = math.random(12, 20),
        ['backwoods_honey'] = math.random(12, 20),
        ['backwoods_russian_cream'] = math.random(12, 20)
    },
    joint = { -- 
        ['weed_whitewidow_joint'] = math.random(40, 50),
        ['weed_skunk_joint'] = math.random(35, 45),
        ['weed_purplehaze_joint'] = math.random(30, 40),
        ['weed_ogkush_joint'] = math.random(25, 35),
        ['weed_amnesia_joint'] = math.random(20, 30),
        ['weed_ak47_joint'] = math.random(15, 25),
		
        ['blueberry_cruffinjoint'] = math.random(65, 75),
        ['cake_mixjoint'] = math.random(60, 70),
        ['cereal_milkjoint'] = math.random(55, 65),
        ['cheetah_pissjoint'] = math.random(50, 60),
        ['gary_paytonjoint'] = math.random(45, 55),
        ['gelattijoint'] = math.random(40, 50),
        ['georgia_piejoint'] = math.random(35, 45),
        ['grabba_leafjoint'] = math.random(30, 40),
        ['whitecherry_gelatojoint'] = math.random(25, 35),
        ['white_runtzjoint'] = math.random(20, 30),
        ['snow_manjoint'] = math.random(15, 25),
        ['jefejoint'] = math.random(10, 20)
    },
    blunt = { -- 
        ['weed_purplehaze_blunt'] = math.random(60, 70),
        ['weed_skunk_blunt'] = math.random(55, 65),
        ['weed_whitewidow_blunt'] = math.random(50, 60),
        ['weed_ogkush_blunt'] = math.random(45, 55),
        ['weed_amnesia_blunt'] = math.random(40, 50),
        ['weed_ak47_blunt'] = math.random(35, 45),
		
        ['blueberry_cruffinblunt'] = math.random(80, 90),
        ['cake_mixblunt'] = math.random(75, 85),
        ['cereal_milkblunt'] = math.random(70, 80),
        ['cheetah_pissblunt'] = math.random(65, 75),
        ['gary_paytonblunt'] = math.random(60, 70),
        ['gelattiblunt'] = math.random(55, 65),
        ['georgia_pieblunt'] = math.random(50, 60),
        ['grabba_leafblunt'] = math.random(45, 55),
        ['whitecherry_gelatoblunt'] = math.random(40, 50),
        ['white_runtzblunt'] = math.random(35, 45),
        ['snow_manblunt'] = math.random(30, 40),
        ['jefeblunt'] = math.random(25, 35),
		
		-- _cream 
		
        ['weed_purplehaze_blunt_cream'] = math.random(60, 70),
        ['weed_skunk_blunt_cream'] = math.random(55, 65),
        ['weed_whitewidow_blunt_cream'] = math.random(50, 60),
        ['weed_ogkush_blunt_cream'] = math.random(45, 55),
        ['weed_amnesia_blunt_cream'] = math.random(40, 50),
        ['weed_ak47_blunt_cream'] = math.random(35, 45),
		
        ['blueberry_cruffinblunt_cream'] = math.random(80, 90),
        ['cake_mixblunt_cream'] = math.random(75, 85),
        ['cereal_milkblunt_cream'] = math.random(70, 80),
        ['cheetah_pissblunt_cream'] = math.random(65, 75),
        ['gary_paytonblunt_cream'] = math.random(60, 70),
        ['gelattiblunt_cream'] = math.random(55, 65),
        ['georgia_pieblunt_cream'] = math.random(50, 60),
        ['grabba_leafblunt_cream'] = math.random(45, 55),
        ['whitecherry_gelatoblunt_cream'] = math.random(40, 50),
        ['white_runtzblunt_cream'] = math.random(35, 45),
        ['snow_manblunt_cream'] = math.random(30, 40),
        ['jefeblunt_cream'] = math.random(25, 35),
		
		-- _grape 
		
        ['weed_purplehaze_blunt_grape'] = math.random(60, 70),
        ['weed_skunk_blunt_grape'] = math.random(55, 65),
        ['weed_whitewidow_blunt_grape'] = math.random(50, 60),
        ['weed_ogkush_blunt_grape'] = math.random(45, 55),
        ['weed_amnesia_blunt_grape'] = math.random(40, 50),
        ['weed_ak47_blunt_grape'] = math.random(35, 45),
		
        ['blueberry_cruffinblunt_grape'] = math.random(80, 90),
        ['cake_mixblunt_grape'] = math.random(75, 85),
        ['cereal_milkblunt_grape'] = math.random(70, 80),
        ['cheetah_pissblunt_grape'] = math.random(65, 75),
        ['gary_paytonblunt_grape'] = math.random(60, 70),
        ['gelattiblunt_grape'] = math.random(55, 65),
        ['georgia_pieblunt_grape'] = math.random(50, 60),
        ['grabba_leafblunt_grape'] = math.random(45, 55),
        ['whitecherry_gelatoblunt_grape'] = math.random(40, 50),
        ['white_runtzblunt_grape'] = math.random(35, 45),
        ['snow_manblunt_grape'] = math.random(30, 40),
        ['jefeblunt_grape'] = math.random(25, 35),
		
		-- _honey
		
        ['weed_purplehaze_blunt_honey'] = math.random(60, 70),
        ['weed_skunk_blunt_honey'] = math.random(55, 65),
        ['weed_whitewidow_blunt_honey'] = math.random(50, 60),
        ['weed_ogkush_blunt_honey'] = math.random(45, 55),
        ['weed_amnesia_blunt_honey'] = math.random(40, 50),
        ['weed_ak47_blunt_honey'] = math.random(35, 45),
		
        ['blueberry_cruffinblunt_honey'] = math.random(80, 90),
        ['cake_mixblunt_honey'] = math.random(75, 85),
        ['cereal_milkblunt_honey'] = math.random(70, 80),
        ['cheetah_pissblunt_honey'] = math.random(65, 75),
        ['gary_paytonblunt_honey'] = math.random(60, 70),
        ['gelattiblunt_honey'] = math.random(55, 65),
        ['georgia_pieblunt_honey'] = math.random(50, 60),
        ['grabba_leafblunt_honey'] = math.random(45, 55),
        ['whitecherry_gelatoblunt_honey'] = math.random(40, 50),
        ['white_runtzblunt_honey'] = math.random(35, 45),
        ['snow_manblunt_honey'] = math.random(30, 40),
        ['jefeblunt_honey'] = math.random(25, 35)
    },
    custom = { -- put any custom items here
        -- ['newitem'] = {
        --     progress = {
        --         label = 'Using Item...',
        --         time = 5000
        --     },
        --     animation = {
        --         animDict = 'amb@prop_human_bbq@male@base',
        --         anim = 'base',
        --         flags = 8,
        --     },
        --     prop = {
        --         model = false,
        --         bone = false,
        --         coords = false, -- vector 3 format
        --         rotation = false, -- vector 3 format
        --     },
        --     replenish = {'''
        --         type = 'Hunger', -- replenish type 'Hunger'/'Thirst' / false
        --         replenish = math.random(20, 40),
        --         isAlcohol = false, -- if you want it to add alcohol count
        --         event = false, -- 'eventname' if you want it to trigger an outside event on use useful for drugs
        --         server = false -- if the event above is a server event
        --     }
        -- }
    }
}
Config.PresentItems = {
	'cryptostick',
	'goldbar',
	'long_island',
	'weed_nutrition',
	'twerks_candy',
	'hotsauce',
	'snow_man',
	'snow_manblunt',
	'snow_manjoint',
}
Config.Fireworks = {
    delay = 5, -- time in s till it goes off
    items = {  -- firework items
        'firework1',
        'firework2',
        'firework3',
        'firework4'
    }
}

Config.BlacklistedScenarios = {
    types = {
        'WORLD_VEHICLE_MILITARY_PLANES_SMALL',
        'WORLD_VEHICLE_MILITARY_PLANES_BIG'
    },
    groups = {
    }
}

Config.BlacklistedVehs = {
    [`shamal`] = false,
    [`luxor`] = false,
    [`luxor2`] = false,
    [`jet`] = false,
    [`lazer`] = false,
    [`buzzard`] = false,
    [`buzzard2`] = false,
    [`annihilator`] = false,
    [`savage`] = false,
    [`titan`] = false,
    [`rhino`] = false,
    [`firetruck`] = false,
    [`mule`] = false,
    [`maverick`] = false,
    [`blimp`] = false,
    [`airtug`] = false,
    [`camper`] = false,
    [`hydra`] = false,
    [`oppressor`] = false,
    [`technical3`] = false,
    [`insurgent3`] = false,
    [`apc`] = false,
    [`tampa3`] = false,
    [`trailersmall2`] = false,
    [`halftrack`] = false,
    [`hunter`] = false,
    [`vigilante`] = false,
    [`akula`] = false,
    [`barrage`] = false,
    [`khanjali`] = false,
    [`caracara`] = false,
    [`blimp3`] = false,
    [`menacer`] = false,
    [`oppressor2`] = false,
    [`scramjet`] = false,
    [`strikeforce`] = false,
    [`cerberus`] = false,
    [`cerberus2`] = false,
    [`cerberus3`] = false,
    [`scarab`] = false,
    [`scarab2`] = false,
    [`scarab3`] = false,
    [`rrocket`] = false,
    [`ruiner2`] = false,
    [`deluxo`] = false,
    [`cargoplane2`] = false,
    [`voltic2`] = false
}

Config.BlacklistedWeapons = {
    [`WEAPON_RAILGUN`] = true,
}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = false,
    [`s_m_y_sheriff_01`] = false,
    [`s_m_y_cop_01`] = false,
    [`s_f_y_sheriff_01`] = false,
    [`s_f_y_cop_01`] = false,
    [`s_m_y_hwaycop_01`] = false
}

Config.Objects = { -- for object removal
    { coords = vector3(266.09, -349.35, 44.74), heading = 0, length = 200, width = 200, model = 'prop_sec_barier_02b' },
    { coords = vector3(285.28, -355.78, 45.13), heading = 0, length = 200, width = 200, model = 'prop_sec_barier_02a' },
}

-- You may add more than 2 selections and it will bring up a menu for the player to select which floor be sure to label each section though
Config.Teleports = {
    [1] = {                   -- Elevator @ labs
        [1] = {               -- up
            poly = { coords = vector3(3540.74, 3675.59, 20.99), heading = 167.5, length = 2, width = 2 },
            allowVeh = false, -- whether or not to allow use in vehicle
            label = false     -- set this to a string for a custom label or leave it false to keep the default. if more than 2 options, label all options

        },
        [2] = { -- down
            poly = { coords = vector3(3540.74, 3675.59, 28.11), heading = 172.5, length = 2, width = 2 },
            allowVeh = false,
            label = false
        }
    },
    [2] = { --Coke Processing Enter/Exit
        [1] = {
            poly = { coords = vector3(909.49, -1589.22, 30.51), heading = 92.24, length = 2, width = 2 },
            allowVeh = false,
            label = 'Leave'
        },
        [2] = {
            poly = { coords = vector3(1088.81, -3187.57, -38.99), heading = 181.7, length = 2, width = 2 },
            allowVeh = false,
            label = 'Enter Coke Processing'
        }
    },
    [3] = { --Money Washing
        [1] = {
            poly = { coords = vector3(1138.21, -3198.77, -39.67), heading = 170.75, length = 2, width = 2 },
            allowVeh = false,
            label = 'Enter Money Wash'
        },
        [2] = {
            poly = { coords = vector3(1129.94, -989.31, 45.97), heading = 277.63, length = 2, width = 2 },
            allowVeh = false,
            label = 'Leave Money Wash'
        }
    },
    [4] = { --SkyDiving 
        [1] = {
            poly = { coords = vector3(1716.48, 3294.49, 41.19), heading = 14.8, length = 2, width = 2 },
            allowVeh = false,
            label = 'Dont forget your Parachute!'
        },
        [2] = {
            poly = { coords = vector3(-44.66, -745.78, 2698.37), heading = 277.63, length = 2, width = 2 },
            allowVeh = false,
            label = 'Hope you got a chute!'
        }
    },
    [5] = { --WhiteWidow Parking 
        [1] = {
            poly = { coords = vector3(198.04, -268.84, 49.37), heading = 72.0, length = 2, width = 2 },
            allowVeh = true,
            label = 'White Widow Public Parking Exit'
        },
        [2] = {
            poly = { coords = vector3(184.38, -263.65, 61.3), heading = 72.0, length = 2, width = 2 },
            allowVeh = true,
            label = 'White Widow Public Parking Entrance'
        }
    },
    [6] = { --WhiteWidow Upper  
        [1] = {
            poly = { coords = vector3(158.75, -240.77, 64.5), heading = 333.53, length = 2, width = 2 },
            allowVeh = false,
            label = 'White Widow Public Parking Exit'
        },
        [2] = {
            poly = { coords = vector3(161.08, -254.33, 51.4), heading = 339.66, length = 2, width = 2 },
            allowVeh = false,
            label = 'White Widow Public Parking Entrance'
        }
    },
    [7] = { --Madams house
        [1] = {
            poly = { coords = vector3(345.16, 439.9, 148.09), heading = 333.53, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = 'Leave the Madams House'
        },
        [2] = {
            poly = { coords = vector3(342.3, 437.77, 149.38), heading = 339.66, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = 'Enter the Madams House'
        }
    },
    [8] = { --BlackMarket house
        [1] = {
            poly = { coords = vector3(-174.41, 497.85, 137.65), heading = 7.17, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = 'Enter the House'
        },
        [2] = {
            poly = { coords = vector3(-173.57, 502.74, 137.42), heading = 286.35, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = 'Leave the House'
        }
    },
    [9] = { --News Roof
        [1] = {
            poly = { coords = vector3(-75.48, -827.15, 243.39), heading = 246.15, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = 'Enter'
        },
        [2] = {
            poly = { coords = vector3(-568.83, -927.89, 36.83), heading = 273.56, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = 'Leave'
        }
    },
    [10] = { -- Police Elevator Bottom Floor
        [1] = {
            poly = { coords = vector3(450.16, -973.77, 31.03), heading = 179.94, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = 'Ground Floor'
        },
        [2] = {
            poly = { coords = vector3(440.37, -980.29, 21.56), heading = 183.33, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = 'Basement Floor'
        },
        [3] = {
            poly = { coords = vector3(450.24, -973.54, 35.8), heading = 183.33, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = '2nd Floor'
        },
        [4] = {
            poly = { coords = vector3(462.6, -995.01, 44.95), heading = 85.13, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = 'Roof'
        }
    },
    [11] = { -- Brandons customs heli tele
        [1] = {
            poly = { coords = vector3(-342.82, -160.47, 44.59), heading = 179.94, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = 'Enter'
        },
        [2] = {
            poly = { coords = vector3(-325.61, -143.37, 60.47), heading = 273.56, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = 'Enter'
        }
    },
    [12] = { -- Hotel
        [1] = {
            poly = { coords = vector3(-2018.57, -351.31, 25.98), heading = 228.13, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = 'Ground Floor'
        },
        [2] = {
            poly = { coords = vector3(-2014.65, -359.75, 29.04), heading = 51.95, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = '2nd Floor'
        },
        [3] = {
            poly = { coords = vector3(-2014.65, -359.75, 35.07), heading = 51.95, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = '3rd Floor'
        },
        [4] = {
            poly = { coords = vector3(-2014.65, -359.75, 41.07), heading = 51.95, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = '4th Floor'
        },
        [5] = {
            poly = { coords = vector3(-2011.18, -322.22, 44.11), heading = 230.92, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = 'Parking'
        }
    },
    -- [13] = { -- music studio
        -- [1] = {
            -- poly = { coords = vector3(-0.0, -0.0, -0.0), heading = 3.6, length = 0.75, width = 0.75 },
            -- allowVeh = false,
            -- label = 'Enter'
        -- },
        -- [2] = {
            -- poly = { coords = vector3(-0.0, -0.0, 0.0), heading = 210.04, length = 0.75, width = 0.75 },
            -- allowVeh = false,
            -- label = 'Exit'
        -- }
    -- },
    [13] = { -- Underground racing
        [1] = {
            poly = { coords = vector3(-2220.08, 1158.62, 29.43), heading = 201.55, length = 1.25, width = 1.25 },
            allowVeh = true,
            label = 'Enter'
        },
        [2] = {
            poly = { coords = vector3(767.3, -1866.27, 29.29), heading = 260.34, length = 1.25, width = 1.25 },
            allowVeh = true,
            label = 'Exit'
        }
    },
    [14] = { -- Underground racing personel
        [1] = {
            poly = { coords = vector3(-2204.54, 1094.75, 29.97), heading = 179.88, length = 1.25, width = 1.25 },
            allowVeh = false,
            label = 'Enter'
        },
        [2] = {
            poly = { coords = vector3(744.05, -1797.29, 29.29), heading = 87.12, length = 1.25, width = 1.25 },
            allowVeh = false,
            label = 'Exit'
        }
    },
    [15] = { -- Underground racing internal
        [1] = {
            poly = { coords = vector3(-2153.06, 1106.07, 28.32), heading = 90.12, length = 2.25, width = 2.25 },
            allowVeh = true,
            label = 'Exit Raceway'
        },
        [2] = {
            poly = { coords = vector3(-2140.19, 1106.08, 26.79), heading = 270.42, length = 2.25, width = 2.25 },
            allowVeh = true,
            label = 'Enter Raceway'
        }
    },
    [16] = { -- Police Elevator Bottom Floor
        [1] = {
            poly = { coords = vector3(453.39, -973.93, 31.03), heading = 183.33, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = 'Ground Floor'
        },
        [2] = {
            poly = { coords = vector3(453.39, -973.93, 35.8), heading = 183.33, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = '2nd Floor'
        }
    },
    [17] = { -- Pharmacy Elevator
        [1] = {
            poly = { coords = vector3(-664.36, 326.34, 83.09), heading = 352.68, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = 'Ground Floor'
        },
        [2] = {
            poly = { coords = vector3(-664.26, 326.07, 78.12), heading = 350.04, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = 'Basement Floor'
        },
        [3] = {
            poly = { coords = vector3(-664.41, 325.9, 88.02), heading = 0.28, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = '2nd Floor'
        },
        [4] = {
            poly = { coords = vector3(-664.21, 326.16, 92.74), heading = 354.23, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = '3rd Floor'
        },
        [5] = {
            poly = { coords = vector3(-664.38, 326.39, 140.12), heading = 353.53, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = 'Roof'
        }
    },
    [18] = { -- South Mo Milton Drive Elevator
        [1] = {
            poly = { coords = vector3(-777.01, 319.65, 85.66), heading = 175.31, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = 'Ground Floor'
        },
        [2] = {
            poly = { coords = vector3(-781.94, 326.26, 223.26), heading = 180.22, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = 'Penthouse'
        },
		[3] = {
            poly = { coords = vector3(-785.22, 323.65, 212.0), heading = 272.05, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = '2nd House Floor'
        },
        [4] = {
            poly = { coords =vector3(-781.89, 326.2, 176.8), heading = 179.58, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = '1st House Floor'
        }
    },
    [19] = { -- 8068 penthouse elevator
        [1] = {
            poly = { coords = vector3(-272.73, -703.89, 38.28), heading = 280.98, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = 'Ground Floor'
        },
        [2] = {
            poly = { coords = vector3(-288.7, -722.37, 125.47), heading = 246.53, length = 0.75, width = 0.75 },
            allowVeh = false,
            label = 'Penthouse'
        }
    }
}




Config.CarWash = {
    dirtLevel = 0.1,                                                                                   -- threshold for the dirt level to be counted as dirty
    defaultPrice = 20,                                                                                 -- default price for the carwash
    locations = {
        [1] = { coords = vector3(174.81, -1736.77, 28.87), length = 7.0, width = 8.8, heading = 359 }, -- South Los Santos Carson Avenue
        [2] = { coords = vector3(25.2, -1391.98, 28.91), length = 6.6, width = 8.2, heading = 0 },     -- South Los Santos Innocence Boulevard
        [3] = { coords = vector3(-74.27, 6427.72, 31.02), length = 9.4, width = 8, heading = 315 },    -- Paleto Bay Boulevard
        [4] = { coords = vector3(1362.69, 3591.81, 34.5), length = 6.4, width = 8, heading = 21 },     -- Sandy Shores
        [5] = { coords = vector3(-699.84, -932.68, 18.59), length = 11.8, width = 5.2, heading = 0 }   -- Little Seoul Gas Station
    }
}
