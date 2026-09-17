Config = {
    UseTarget = GetConvar('UseTarget', 'false') == 'true',
    
    -- Selling Config
    SuccessChance = 75,
    ScamChance = 25,
    RobberyChance = 18,
    MinimumSalePrice = 10000,
    MaximumSalePrice = 50000,
    MinRisk = 5000,
    MaxRisk = 25000,
    
    -- Multiplier Config
    MaxMultiplier = 2.0, -- Max base multiplier from mini-games
    MaxTotalMultiplier = 4.0, -- Max total including relationship bonuses
    Debug = false,
    
    -- Locations
    Locations = {
        vector3(175.98, 388.95, 108.87),
        vector3(151.73, 163.48, 104.54),
        vector3(-59.02, 221.8, 106.26),
        vector3(452.63, 246.12, 102.91),
        vector3(626.71, 164.24, 96.04),
        vector3(323.96, 97.12, 99.44),
        vector3(243.73, -93.02, 69.81),
        vector3(-204.97, 173.68, 70.03)
    },
    
    -- Service Jobs (Police, EMS, etc.)
    ServiceJobs = {
        'police',
        'ambulance',
        'firefighter',
        'mayor',
        'lawyer',
    },
    
    -- Relationship System
    Relationships = {
        enabled = true,
        decay_enabled = true,
        show_notifications = true,
        leaderboard_enabled = true,
        max_relationships = 4,
    },
    
    -- Prostitute Profiles
    Prostitutes = {
        [42647445] = {
            model = 42647445,
            name = "Juliet",
            nickname = "The Beach Girl",
            personality = "Flirty",
            base_price_modifier = 1.0,
            description = "A carefree spirit who loves the beach life",
        },
        [3413004] = {
            model = 3413004,
            name = "Candy",
            nickname = "The Hills Princess",
            personality = "Demanding",
            base_price_modifier = 1.2,
            description = "High maintenance but worth every penny",
        },
        [348382215] = {
            model = 348382215,
            name = "Diamond",
            nickname = "The Socialite",
            personality = "Sophisticated",
            base_price_modifier = 1.5,
            description = "Elegant and refined, she knows her worth",
        },
        [51789996] = {
            model = 51789996,
            name = "Sapphire",
            nickname = "The Business Woman",
            personality = "Professional",
            base_price_modifier = 1.3,
            description = "All business, no games",
        }
    },
    
    -- Reputation Tiers
    ReputationTiers = {
        [1] = { min = 0,   max = 20,  status = "Stranger",     bonus = 0.0,  color = "#95a5a6" },
        [2] = { min = 21,  max = 40,  status = "Acquaintance", bonus = 0.10, color = "#3498db" },
        [3] = { min = 41,  max = 60,  status = "Friend",       bonus = 0.20, color = "#9b59b6" },
        [4] = { min = 61,  max = 80,  status = "Partner",      bonus = 0.35, color = "#e91e63" },
        [5] = { min = 81,  max = 100, status = "Exclusive",    bonus = 0.50, color = "#f39c12" }
    },
    
    -- Reputation Gain/Loss
    ReputationGain = {
        successful_interaction = 5,
        perfect_match = 10,
        quick_completion = 3,
        expensive_service = 2
    },
    
    ReputationLoss = {
        failed_interaction = -2,
        got_robbed = -5,
        declined_offer = -1,
    },
    
    -- Decay Settings
    DecaySettings = {
        enabled = true,
        decay_start_hours = 24,
        decay_rate_per_hour = 0.5,
        max_decay_per_session = 10,
        min_reputation = 0,
        base_multiplier_decay_rate = 0.01, -- Base multiplier decays slower
        base_multiplier_decay_start_hours = 48,
    }
}