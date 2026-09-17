Config = {}

Config.VehicleClaim = {

	['XVL69643'] = {
		[1] = 'amels200',
		[2] = 'nsandstormmk',
		[3] = 'levante',
		[4] = 'mlnovitec'
	},
	['SMX12685'] = 'polar06seirra',
	['AKB31590'] = {
		[1] = '2018transam',
		[2] = 'vanzcamaro',
		[3] = 'pbr8suki',
		[4] = 'rmodmi8lb'
	},
	['ZTL40382'] = {
		[1] = 'pnprgrix', 
		[2] = 'DBgonzo_sq8',
		[3] = 'mc45',
		[4] = 'DBgonzo_altima24'
	},
	['FTU02026'] = 'senna',
	['OAD58538'] = '2022jeep'
	
	
}

Config.Garages = {
	
    closet1 = {
        label = 'Vehicle Closet',
        takeVehicle = vector3(547.65, -204.92, 53.85),
        showBlip = true,
        blipName = 'Vehicle Closet',
        blipNumber = 357,
        blipColor = 9
    },
    closet2 = {
        label = 'Vehicle Closet',
        takeVehicle = vector3(-879.79, -2972.84, 13.37),
        showBlip = true,
        blipName = 'Vehicle Closet',
        blipNumber = 357,
        blipColor = 9
    }
	
}

Config.WatchZones = {
    -- [1] = { -- Example of a BoxZone (box = true)
        -- coords = vector3(713.31, 4113.7, 35.78),
        -- heading = 179,
        -- length = 44.4,
        -- width = 5.0,
        -- minZ = 33.78,
        -- maxZ = 36.98,
        -- box = true,
    -- },
    [1] = { -- Example of a PolyZone (box = false)
        points = {
            vector2(-1817.42, 2745.53),
            vector2(-2472.37, 2886.67),
            vector2(-2921.6, 3297.61),
            vector2(-2838.24, 3443.21),
            vector2(-2420.09, 3435.01),
            vector2(-2202.9, 3523.35),
            vector2(-1652.1, 3256.41),
            vector2(-1542.83, 2943.88),
            vector2(-1566.24, 2767.31)
        },
        minZ = 16.43,
        maxZ = 77.6,
        box = false
    }
}
Config.ItemList = {
	{
	item = "weapon_snub", amount = 1
	},
	{
	item = "pizza_burger", amount = 199
	},
	{
	item = "advancedlockpick", amount = 7
	},
	{
	item = "goldbar", amount = 19
	},
	{
	item = "diamond", amount = 3
	},
	{
	item = "diamond", amount = 3
	}
}
Config.ItemsToRemoveOnDeath = {
	-- ammo
		'pistol_ammo',
		'rifle_ammo',
		'smg_ammo',
		'shotgun_ammo',
		'mg_ammo',
		'snp_ammo',
		'emp_ammo',
		'paintball_ammo',
		-- 'rpg_ammo',
		'mini_ammo',
		'grenade_ammo',
		'sniper_ammo',
	-- top shelf items
		'long_island',
		'side_car',
		'sex_on_the_beach',
		'walk_me_down',
		'old_fashioned',
		'pizza_burger',
		'meat_lovers_pizza',
		'bbq_ribs',
		'buffalo_wings',
		'the_birdy_burger',
		'west_coast_deluxe',
		'little_creek_burger',
	-- black market 
		'security_card_01',
		'security_card_02',
		'electronickit',
		'gatecrack',
		'thermite',
		'trojan_usb',
		'clip_attachment',
		'drum_attachment',
		'advscope_attachment',
		'grip_attachment',
		'holoscope_attachment',
		'suppressor_attachment',
	-- consumable heals
		'bandage',
		'morphine',
		'oxycodone',
		'xanax',
		'amoxixillin',
		'ibuprofen',
	-- misc items
		'parachute',
		'casino_goldchip',
		'casinochips',
		'stickynote',
		'drill',
	-- jewelry
		'emerald',
		'ruby',
		'diamond',
		'sapphire',
		'gold_ring',
		'diamond_ring',
		'ruby_ring',
		'sapphire_ring',
		'emerald_ring',
		'silver_ring',
		'diamond_ring_silver',
		'ruby_ring_silver',
		'sapphire_ring_silver',
		'emerald_ring_silver',
		'goldchain',
		'diamond_necklace',
		'sapphire_necklace',
		'ruby_necklace',
		'emerald_necklace',
		'silverchain',
		'diamond_necklace_silver',
		'ruby_necklace_silver',
		'sapphire_necklace_silver',
		'emerald_necklace_silver',
		'goldearring',
		'diamond_earring',
		'ruby_earring',
		'sapphire_earring',
		'emerald_earring',
		'silverearring',
		'diamond_earring_silver',
		'ruby_earring_silver',
		'sapphire_earring_silver',
		'emerald_earring_silver',
		'ironore',
		'copperore',
		'goldore',
		'silverore',
		'goldingot',
		'silveringot',
		'miningdrill',
		'mininglaser',
		'drillbit',
		'goldbar',
		'tenkgoldchain',
		'goldchain',
		'diamond',
		'diamond_ring',
		'rolex',
		'cryptostick',
		'advancedlockpick',
		'cuffpick',
		'lockpick',
		'zipties',
		'screwdriverset',
	-- drugs
		'joint',
		'cokebaggy',
		'crack_baggy',
		'xtcbaggy',
		'coke_brick',
		'weed_brick',
		'coke_small_brick',
		'oxy',
		'meth',
		'rolling_paper',
		'crack_brick',
		'crack_small_brick',
		'pixiedust',
		'pixiedust_brick',
		'pixiedust_small_brick',
		'rawcoca',
		'weed_fertilizer',
	-- recycle items
		'plastic',
		'metalscrap',
		'copper',
		'aluminum',
		'aluminumoxide',
		'iron',
		'ironoxide',
		'rubber',
		'glass',
	-- marked money
		'printedcash',
		'markedbills',
		'moneybag'
}
