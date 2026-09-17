Config = {}

-- General Settings
Config.Debug = false -- Enable debug prints
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target for interactions

Config.AutoCleanup = {
    enabled = false, -- Enable automatic cleanup of orphaned containers
    orphanedAge = 604800, -- Age in seconds before a container is considered for cleanup (default: 7 days)
    deleteEmpty = false, -- Set to true to automatically delete empty orphaned containers (BE CAREFUL!)
    checkInterval = 3600000, -- How often to run cleanup check in milliseconds (default: 1 hour)
}

-- Wallet Settings
Config.Wallets = {
    ['wallet'] = {
        label = 'Leather Wallet',
        weight = 100,
        slots = 5,
        maxWeight = 5000,
        price = 500,
        description = 'A simple leather wallet for carrying small items'
    },
    ['wallet_premium'] = {
        label = 'Premium Wallet',
        weight = 150,
        slots = 8,
        maxWeight = 8000,
        price = 2150,
        description = 'A premium leather wallet with extra space'
    }
}

-- Backpack Settings
Config.Backpacks = {
    ['backpack_small'] = {
        label = 'Small Backpack',
        weight = 500,
        slots = 10,
        maxWeight = 200000,
        price = 2000,
        description = 'A small backpack for carrying extra items'
    },
    ['backpack_medium'] = {
        label = 'Medium Backpack',
        weight = 750,
        slots = 20,
        maxWeight = 400000,
        price = 5000,
        description = 'A medium-sized backpack with decent storage'
    },
    ['backpack_large'] = {
        label = 'Large Backpack',
        weight = 1000,
        slots = 30,
        maxWeight = 600000,
        price = 10000,
        description = 'A large backpack with plenty of storage space'
    }
}

-- Furniture Settings
Config.Furniture = {
    ['storage_crate'] = {
        label = 'Storage Crate',
        weight = 5000,
        slots = 25,
        maxWeight = 1000000,
        price = 50000,
        model = 'prop_boxpile_07d',
        description = 'A wooden storage crate that can be placed in your house',
        breakable = true
    },
    ['storage_safe'] = {
        label = 'Personal Safe',
        weight = 10000,
        slots = 15,
        maxWeight = 500000,
        price = 20000,
        model = 'p_v_43_safe_s',
        description = 'A secure safe for valuable items',
        breakable = true
    },
    ['storage_cabinet'] = {
        label = 'Storage Cabinet',
        weight = 8000,
        slots = 35,
        maxWeight = 1500000,
        price = 150000,
        model = 'prop_ld_int_safe_01',
        description = 'A large storage cabinet for your home',
        breakable = true
    }
}

-- Break-in Settings
Config.BreakIn = {
    enabled = true,
    requiredItems = {
        ['lockpick'] = {
            difficulty = 'medium',
            successChance = 35,
            damageOnFail = 10
        },
        ['advancedlockpick'] = {
            difficulty = 'easy',
            successChance = 70,
            damageOnFail = 5
        }
    },
    minigameType = 'qb-skillcheck', -- Options: 'qb-skillcheck', 'ps-ui', 'custom'
    skillCheckSettings = {
        easy = {
            {difficulty = 'easy', inputs = {'w', 'a', 's', 'd'}},
            {difficulty = 'easy', inputs = {'w', 's'}}
        },
        medium = {
            {difficulty = 'medium', inputs = {'w', 'a', 's', 'd'}},
            {difficulty = 'medium', inputs = {'w', 's'}},
            {difficulty = 'easy', inputs = {'w', 'a'}}
        },
        hard = {
            {difficulty = 'hard', inputs = {'w', 'a', 's', 'd'}},
            {difficulty = 'hard', inputs = {'w', 's'}},
            {difficulty = 'medium', inputs = {'w', 'a'}}
        }
    },
    cooldownTime = 300000, -- 5 minutes in milliseconds
    alertPolice = true,
    policeAlertChance = 50 -- 50% chance to alert police
}

-- House Deployment Settings
Config.HouseDeployment = {
    enabled = true,
    maxDistance = 100.0, -- Maximum distance from house center
    requireOwnership = false,
    maxFurniturePerHouse = 10,
    showZoneMarker = true,
    markerType = 1,
    markerColor = {r = 0, g = 255, b = 0, a = 100}
}

-- Interaction Settings
Config.Interactions = {
    openDistance = 2.0,
    breakInDistance = 2.0,
    deployDistance = 5.0,
    useThirdEye = false, -- Set to true if using qb-target
    drawText = '[E] Open Container',
    breakInText = '[E] Break In',
    deployText = '[E] Deploy Furniture'
}

-- Store Locations (where players can buy containers)
Config.Stores = {
    {
        name = 'General Store',
        coords = vector3(43.31, -1774.84, 29.62),
        blip = {
            enabled = true,
            sprite = 52,
            color = 2,
            scale = 0.6,
            label = 'Container Store'
        },
        ped = {
            enabled = true,
            model = 'a_m_m_business_01',
            coords = vector4(43.31, -1774.84, 29.62, 266.0)
        },
        items = {
            wallets = true,
            backpacks = true,
            furniture = true
        }
    },
	{
        name = 'General Store',
        coords = vector3(2699.84, 3381.47, 57.12),
        blip = {
            enabled = true,
            sprite = 52,
            color = 2,
            scale = 0.6,
            label = 'Container Store'
        },
        ped = {
            enabled = true,
            model = 'a_m_m_business_01',
            coords = vector4(2699.84, 3381.47, 57.12, 266.0)
        },
        items = {
            wallets = true,
            backpacks = true,
            furniture = true
        }
    },
	
}

-- ============================================
-- NOTIFICATION SETTINGS
-- ============================================

Config.Notifications = {
    type = 'qb', -- Options: 'qb', 'ox', 'custom'
    position = 'bottom'
}

-- ============================================
-- ADVANCED SETTINGS
-- ============================================

-- Customize these if you know what you're doing

-- Database table names (change if your housing system uses different names)
Config.Database = {
    playerHousesTable = 'player_houses',
    houseLocationsTable = 'houselocations'
}

-- Performance settings
Config.Performance = {
    furnitureSyncInterval = 60000, -- Sync furniture every 60 seconds
    maxRenderDistance = 50.0, -- Maximum distance to render furniture
    useEntityCulling = true -- Enable entity culling for performance
}

-- ============================================
-- END OF CONFIGURATION
-- ============================================