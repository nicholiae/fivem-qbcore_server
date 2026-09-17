Config = {
    Debug = false,            -- true / false - Currently prints the vector3 and label of locations when requesting a delivery
    NearbyDeliveries = false, -- true / false - Do you want deliveries to be within a certain amount of units?
    DeliveryWithin = 2000,    -- int (Default 2000) - How many units do you want the delivery location to be within from the player when making a delivery request?
    Dealers = {
        -- Example:
        --['Sandy Dealer'] = {
        --    time = {min = 5, max = 23},
        --    name = "LiL Shady",
        --    coords = {x = 1894.4, y = 3895.88, z = 33.19},
        --    products = {
        --        [1] = {
        --            name = "weed_whitewidow",
        --            price = 15,
        --            amount = 150,
        --            info = {},
        --            type = "item",
        --            slot = 1,
        --            minrep = 0,
        --        },
        --        [2] = {
        --            name = "weed_skunk",
        --            price = 15,
        --            amount = 150,
        --            info = {},
        --            type = "item",
        --            slot = 2,
        --            minrep = 0,
        --        },
        --    },
        --},
    },
	BlacklistItems = {
		'pixiedust_small_brick',
		'crack_small_brick',
		'coke_small_brick',
		'fentanyl_small_brick',
		'lean_small_bottle',
		'amnesia_weed_brick',
		'ak47_weed_brick',
		'skunk_weed_brick',
		'ogkush_weed_brick',
		'purplehaze_weed_brick',
		'whitewidow_weed_brick'
		
	},
    UseTarget = GetConvar('UseTarget', 'false') == 'true', -- Use qb-target interactions (don't change this, go to your server.cfg and add setr UseTarget true)
    PoliceCallChance = 11,                                 --in percentage (if 99, theres the 99% to call the police)

    -- Shop Config
    Products = {
        -- [1] = { --- example
            -- name = 'weed_whitewidow',
            -- price = 15,
            -- amount = 150,
            -- info = {},
            -- type = 'item',
            -- slot = 1,
            -- minrep = 0,
        -- }
    },

    -- Selling Config
    SuccessChance = 80,
    ScamChance = 21,
    RobberyChance = 9,
    MinimumDrugSalePolice = 0,
	BagCap = 15,
	BagLow = 1,
    DrugsPrice = {
		
		--Alcohol 
        ['tequila'] = { 
			min = 90,
			max = 110,
        },
        ['wine'] = { 
			min = 90,
			max = 110,
        },
        ['vodka'] = { 
			min = 90,
			max = 110,
        },
        ['whiskey'] = { 
			min = 90,
			max = 110,
        },
        ['apple_juice'] = { 
			min = 5,
			max = 15,
        },
        ['cranberryjuice'] = { 
			min = 5,
			max = 15,
        },
		-- joints
		
        ['blueberry_cruffinjoint'] = { --t12
			min = 617,
			max = 642,
        }, 
        ['cake_mixjoint'] = { --t11
			min = 592,
			max = 595,
        }, 
        ['cereal_milkjoint'] = { --t10
			min = 536,
			max = 556,
        }, 
        ['cheetah_pissjoint'] = { --t9
			min = 482,
			max = 547,
        }, 
        ['gary_paytonjoint'] = { --t8
			min = 415,
			max = 504,
        }, 
        ['gelattijoint'] = { --t7
			min = 383,
			max = 435,
        }, 
        ['georgia_piejoint'] = { --t6
			min = 330,
			max = 370,
        }, 
        ['grabba_leafjoint'] = { --t5
			min = 322,
			max = 350,
        },
        ['whitecherry_gelatojoint'] = { --t4
			min = 313,
			max = 361,
        }, 
        ['white_runtzjoint'] = { --t3
			min = 259,
			max = 279,
        }, 
        ['snow_manjoint'] = { --t2
			min = 204,
			max = 224,
        }, 
        ['jefejoint'] = { --t1
			min = 153,
			max = 169,
        }, 
		
        ['weed_whitewidow_joint'] = { --t6
			min = 227,
			max = 280,
        },
        ['weed_purplehaze_joint'] = { --t5
			min = 250,
			max = 270,
        },
        ['weed_ogkush_joint'] = { --t4
			min = 203,
			max = 217,
        },
        ['weed_skunk_joint'] = { --t3
			min = 177,
			max = 189,
        },
        ['weed_ak47_joint'] = { --t2
			min = 152,
			max = 162,
        },
        ['weed_amnesia_joint'] = { --t1
			min = 126,
			max = 134,
        },
		
		--blunts
		
        ['blueberry_cruffinblunt'] = { --t12
			min = 667,
			max = 692,
        }, 
        ['cake_mixblunt'] = { --t11
			min = 642,
			max = 665,
        }, 
        ['cereal_milkblunt'] = { --t10
			min = 586,
			max = 606,
        }, 
        ['cheetah_pissblunt'] = { --t9
			min = 532,
			max = 597,
        }, 
        ['gary_paytonblunt'] = { --t8
			min = 465,
			max = 554,
        }, 
        ['gelattiblunt'] = { --t7
			min = 485,
			max = 533,
        }, 
        ['georgia_pieblunt'] = { --t6
			min = 380,
			max = 420,
        }, 
        ['grabba_leafblunt'] = { --t5
			min = 372,
			max = 400,
        },
        ['whitecherry_gelatoblunt'] = { --t4
			min = 363,
			max = 411,
        }, 
        ['white_runtzblunt'] = { --t3
			min = 309,
			max = 329,
        }, 
        ['snow_manblunt'] = { --t2
			min = 254,
			max = 274,
        }, 
        ['jefeblunt'] = { --t1
			min = 203,
			max = 219,
        }, 
		
        ['weed_whitewidow_blunt'] = { --t6
			min = 277,
			max = 330,
        },
        ['weed_purplehaze_blunt'] = { --t5
			min = 300,
			max = 320,
        },
        ['weed_ogkush_blunt'] = { --t4
			min = 253,
			max = 267,
        },
        ['weed_skunk_blunt'] = { --t3
			min = 227,
			max = 239,
        },
        ['weed_ak47_blunt'] = { --t2
			min = 202,
			max = 212,
        },
        ['weed_amnesia_blunt'] = { --t1
			min = 176,
			max = 184,
        },
		--blunts _honey
		
        ['blueberry_cruffinblunt_honey'] = { --t12
			min = 667,
			max = 692,
        }, 
        ['cake_mixblunt_honey'] = { --t11
			min = 642,
			max = 665,
        }, 
        ['cereal_milkblunt_honey'] = { --t10
			min = 586,
			max = 606,
        }, 
        ['cheetah_pissblunt_honey'] = { --t9
			min = 532,
			max = 597,
        }, 
        ['gary_paytonblunt_honey'] = { --t8
			min = 465,
			max = 554,
        }, 
        ['gelattiblunt_honey'] = { --t7
			min = 485,
			max = 533,
        }, 
        ['georgia_pieblunt_honey'] = { --t6
			min = 380,
			max = 420,
        }, 
        ['grabba_leafblunt_honey'] = { --t5
			min = 372,
			max = 400,
        },
        ['whitecherry_gelatoblunt_honey'] = { --t4
			min = 363,
			max = 411,
        }, 
        ['white_runtzblunt_honey'] = { --t3
			min = 309,
			max = 329,
        }, 
        ['snow_manblunt_honey'] = { --t2
			min = 254,
			max = 274,
        }, 
        ['jefeblunt_honey'] = { --t1
			min = 203,
			max = 219,
        }, 
		
        ['weed_whitewidow_blunt_honey'] = { --t6
			min = 277,
			max = 330,
        },
        ['weed_purplehaze_blunt_honey'] = { --t5
			min = 300,
			max = 320,
        },
        ['weed_ogkush_blunt_honey'] = { --t4
			min = 253,
			max = 267,
        },
        ['weed_skunk_blunt_honey'] = { --t3
			min = 227,
			max = 239,
        },
        ['weed_ak47_blunt_honey'] = { --t2
			min = 202,
			max = 212,
        },
        ['weed_amnesia_blunt_honey'] = { --t1
			min = 176,
			max = 184,
        },
		
		--blunts _cream
		
        ['blueberry_cruffinblunt_cream'] = { --t12
			min = 667,
			max = 692,
        }, 
        ['cake_mixblunt_cream'] = { --t11
			min = 642,
			max = 665,
        }, 
        ['cereal_milkblunt_cream'] = { --t10
			min = 586,
			max = 606,
        }, 
        ['cheetah_pissblunt_cream'] = { --t9
			min = 532,
			max = 597,
        }, 
        ['gary_paytonblunt_cream'] = { --t8
			min = 465,
			max = 554,
        }, 
        ['gelattiblunt_cream'] = { --t7
			min = 485,
			max = 533,
        }, 
        ['georgia_pieblunt_cream'] = { --t6
			min = 380,
			max = 420,
        }, 
        ['grabba_leafblunt_cream'] = { --t5
			min = 372,
			max = 400,
        },
        ['whitecherry_gelatoblunt_cream'] = { --t4
			min = 363,
			max = 411,
        }, 
        ['white_runtzblunt_cream'] = { --t3
			min = 309,
			max = 329,
        }, 
        ['snow_manblunt_cream'] = { --t2
			min = 254,
			max = 274,
        }, 
        ['jefeblunt_cream'] = { --t1
			min = 203,
			max = 219,
        }, 
		
        ['weed_whitewidow_blunt_cream'] = { --t6
			min = 277,
			max = 330,
        },
        ['weed_purplehaze_blunt_cream'] = { --t5
			min = 300,
			max = 320,
        },
        ['weed_ogkush_blunt_cream'] = { --t4
			min = 253,
			max = 267,
        },
        ['weed_skunk_blunt_cream'] = { --t3
			min = 227,
			max = 239,
        },
        ['weed_ak47_blunt_cream'] = { --t2
			min = 202,
			max = 212,
        },
        ['weed_amnesia_blunt_cream'] = { --t1
			min = 176,
			max = 184,
        },
		
		--blunts _grape
		
        ['blueberry_cruffinblunt_grape'] = { --t12
			min = 667,
			max = 692,
        }, 
        ['cake_mixblunt_grape'] = { --t11
			min = 642,
			max = 665,
        }, 
        ['cereal_milkblunt_grape'] = { --t10
			min = 586,
			max = 606,
        }, 
        ['cheetah_pissblunt_grape'] = { --t9
			min = 532,
			max = 597,
        }, 
        ['gary_paytonblunt_grape'] = { --t8
			min = 465,
			max = 554,
        }, 
        ['gelattiblunt_grape'] = { --t7
			min = 485,
			max = 533,
        }, 
        ['georgia_pieblunt_grape'] = { --t6
			min = 380,
			max = 420,
        }, 
        ['grabba_leafblunt_grape'] = { --t5
			min = 372,
			max = 400,
        },
        ['whitecherry_gelatoblunt_grape'] = { --t4
			min = 363,
			max = 411,
        }, 
        ['white_runtzblunt_grape'] = { --t3
			min = 309,
			max = 329,
        }, 
        ['snow_manblunt_grape'] = { --t2
			min = 254,
			max = 274,
        }, 
        ['jefeblunt_grape'] = { --t1
			min = 203,
			max = 219,
        }, 
		
        ['weed_whitewidow_blunt_grape'] = { --t6
			min = 277,
			max = 330,
        },
        ['weed_purplehaze_blunt_grape'] = { --t5
			min = 300,
			max = 320,
        },
        ['weed_ogkush_blunt_grape'] = { --t4
			min = 253,
			max = 267,
        },
        ['weed_skunk_blunt_grape'] = { --t3
			min = 227,
			max = 239,
        },
        ['weed_ak47_blunt_grape'] = { --t2
			min = 202,
			max = 212,
        },
        ['weed_amnesia_blunt_grape'] = { --t1
			min = 176,
			max = 184,
        },
		
		--Cookies 
        ['blueberry_cruffin'] = { --t12
			min = 517,
			max = 542,
        }, 
        ['cake_mix'] = { --t11
			min = 492,
			max = 495,
        }, 
        ['cereal_milk'] = { --t10
			min = 436,
			max = 456,
        }, 
        ['cheetah_piss'] = { --t9
			min = 382,
			max = 447,
        }, 
        ['gary_payton'] = { --t8
			min = 315,
			max = 404,
        }, 
        ['gelatti'] = { --t7
			min = 283,
			max = 335,
        }, 
        ['georgia_pie'] = { --t6
			min = 230,
			max = 270,
        }, 
        ['grabba_leaf'] = { --t5
			min = 222,
			max = 250,
        },
        ['whitecherry_gelato'] = { --t4
			min = 213,
			max = 261,
        }, 
        ['white_runtz'] = { --t3
			min = 159,
			max = 179,
        }, 
        ['snow_man'] = { --t2
			min = 104,
			max = 124,
        }, 
        ['jefe'] = { --t1
			min = 53,
			max = 69,
        }, 
		--Vanilla below
        -- ['weed_whitewidow'] = { --t6
			-- min = 127,
			-- max = 180,
        -- },
        -- ['weed_purplehaze'] = { --t5
			-- min = 150,
			-- max = 170,
        -- },
        -- ['weed_ogkush'] = { --t4
			-- min = 103,
			-- max = 117,
        -- },
        -- ['weed_skunk'] = { --t3
			-- min = 77,
			-- max = 89,
        -- },
        -- ['weed_ak47'] = { --t2
			-- min = 52,
			-- max = 62,
        -- },
        -- ['weed_amnesia'] = { --t1
			-- min = 26,
			-- max = 34,
        -- },
        ['whitewidow_weed_bag'] = { --t6
			min = 630,
			max = 720,
        },
        ['purplehaze_weed_bag'] = { --t5
			min = 540,
			max = 675,
        },
        ['ogkush_weed_bag'] = { --t4
			min = 450,
			max = 585,
        },
        ['skunk_weed_bag'] = { --t3
			min = 360,
			max = 495,
        },
        ['ak47_weed_bag'] = { --t2
			min = 180,
			max = 315,
        },
        ['amnesia_weed_bag'] = { --t1
			min = 90,
			max = 157,
        },
        ['whitewidow_weed_brick'] = { --t6
			min = 11700,
			max = 17000,
        },
        ['purplehaze_weed_brick'] = { --t5
			min = 14000,
			max = 16000,
        },
        ['ogkush_weed_brick'] = { --t4
			min = 9300,
			max = 10700,
        },
        ['skunk_weed_brick'] = { --t3
			min = 7000,
			max = 8100,
        },
        ['ak47_weed_brick'] = { --t2
			min = 4700,
			max = 5600,
        },
        ['amnesia_weed_brick'] = { --t1
			min = 2400,
			max = 3100,
        },
        ['crack_baggy'] = {
			min = 270,
			max = 455,
        },
        ['cokebaggy'] = {
			min = 270,
			max = 455,
        },
        ['pixiedust'] = {
			min = 270,
			max = 455,
        },
        ['lean'] = {
			min = 270,
			max = 455,
        },
        ['meth'] = {
			min = 270,
			max = 455,
        },
        ['fentanyl'] = {
			min = 270,
			max = 455,
        },
        ['lean_small_bottle'] = {
			min = 9900,
			max = 20250,
        },
        ['crack_small_brick'] = {
			min = 9900,
			max = 20250,
        },
        ['coke_small_brick'] = {
			min = 9900,
			max = 20250,
        },
        ['pixiedust_small_brick'] = {
			min = 9900,
			max = 20250,
        },
        ['fentanyl_small_brick'] = {
			min = 9900,
			max = 20250,
        },
    },
    -- Delivery Config
    UseMarkedBills = false,     -- true for marked bills, false for cash
    DeliveryRepGain = 1,        -- amount of rep gained per delivery
    DeliveryRepLoss = 1,        -- amount of rep lost if delivery wrong or late
    PoliceDeliveryModifier = 2, -- amount to multiply active cop count by
    WrongAmountFee = 2,         -- divide the payout by this value for wrong delivery amount
    OverdueDeliveryFee = 4,     -- divide the payout by this value for overdue delivery

    DeliveryItems = {
        [1] = {
            ['item'] = 'weed_brick',
            ['minrep'] = 0,
            ['payout'] = 1000
        },
        [2] = {
            ['item'] = 'coke_brick',
            ['minrep'] = 0,
            ['payout'] = 1000
        },
    },

    DeliveryLocations = {
        [1] = {
            ['label'] = 'Stripclub',
            ['coords'] = vector3(106.24, -1280.32, 29.24),
        },
        [2] = {
            ['label'] = 'Vinewood Video',
            ['coords'] = vector3(223.98, 121.53, 102.76),
        },
        [3] = {
            ['label'] = 'Taxi',
            ['coords'] = vector3(882.67, -160.26, 77.11),
        },
        [4] = {
            ['label'] = 'Resort',
            ['coords'] = vector3(-1245.63, 376.21, 75.34),
        },
        [5] = {
            ['label'] = 'Bahama Mamas',
            ['coords'] = vector3(-1383.1, -639.99, 28.67),
        },
    },
}
