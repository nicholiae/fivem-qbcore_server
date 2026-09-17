-- ============================================
-- NS-CallGirl Enhanced Configuration
-- Custom Prostitute Models with Full Appearance Customization
-- Version 2.1 - Enhanced with QB-Core Facial Features
-- ============================================

Config = {}

Config.Debug = false
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Set to true if using qb-target

Config.EnterLocation = vector3(345.16, 439.9, 148.09)
Config.ChangeLoc = vector3(334.58, 428.68, 145.57)
Config.InsideLocation = vector3(342.3, 437.77, 149.38)
Config.HoeSpawn = vector3(332.6, 424.1, 145.6)
Config.Currency = "$"
Config.blipOn = true

-- Custom Prostitute Configurations using Freemode Model with Full Appearance Data
Config.Prostitutes = {
    [1] = { -- Juliet - "The Beach Girl"
        model = `mp_f_freemode_01`,
		modelNumber = 42647445,
        name = "Juliet",
        nickname = "The Beach Girl",
        personality = "Flirty",
        base_price_modifier = 1.0,
        description = "A carefree spirit who loves the beach life",
        
        -- Complete Appearance Data
        appearance = {
            -- Heritage/Face Blend
            face = {item = 40, texture = 0},           -- Attractive mother face
            face2 = {item = 29, texture = 0},           -- Father face
            facemix = {shapeMix = 0.3, skinMix = 0.0}, -- More mother's features
            
            -- Hair
            hair = {item = 123, texture = 8},            -- Long beach waves, blonde
            
            -- Facial Structure (values 0-10, will be divided by 10 for -1.0 to 1.0 range)
            nose_0 = {item = 3},                       -- Nose width (narrower)
            nose_1 = {item = 2},                       -- Nose peak height
            nose_2 = {item = 4},                       -- Nose peak length
            nose_3 = {item = 5},                       -- Nose bone height
            nose_4 = {item = 5},                       -- Nose peak lowering
            nose_5 = {item = 5},                       -- Nose bone twist
            cheek_1 = {item = 6},                      -- Cheek bone height (higher)
            cheek_2 = {item = 5},                      -- Cheek bone width (wider)
            cheek_3 = {item = 5},                      -- Cheeks width
            eyebrown_high = {item = 5},                -- Eyebrow height
            eyebrown_forward = {item = 5},             -- Eyebrow forward
            eye_opening = {item = 6},                  -- Eye opening (larger)
            lips_thickness = {item = 7},               -- Lips thickness (fuller)
            jaw_bone_width = {item = 3},               -- Jaw bone width (narrower)
            jaw_bone_back_lenght = {item = 5},         -- Jaw bone back length
            chimp_bone_lowering = {item = 4},          -- Chin bone lowering
            chimp_bone_lenght = {item = 3},            -- Chin bone length (shorter)
            chimp_bone_width = {item = 5},             -- Chin bone width
            chimp_hole = {item = 5},                   -- Chin hole
            neck_thikness = {item = 5},                -- Neck thickness
            
            -- Overlays & Makeup
            eyebrows = {item = 6, texture = 8},        -- Thin eyebrows, blonde
            beard = {item = -1, texture = 1},          -- No beard (female)
            blush = {item = 1, texture = 15},           -- Subtle blush, light pink
            lipstick = {item = 3, texture = 32},        -- Full lipstick, pink
            makeup = {item = 10, texture = 15},          -- Light eye makeup
            ageing = {item = -1, texture = 0},         -- No ageing
            eye_color = {item = 3, texture = 0},       -- Blue eyes
            moles = {item = 0, texture = 0},           -- No moles
        },
        
        -- Lingerie State (Initial appearance)
        lingerie = {
            arms = {drawable = 15, texture = 0},          -- Bare arms
            ["t-shirt"] = {drawable = -1, texture = 0},   -- No undershirt
            torso2 = {drawable = 18, texture = 0},         -- White bikini top
            pants = {drawable = 219, texture = 1},         -- White bikini bottom
            shoes = {drawable = 15, texture = 0},         -- Barefoot
            vest = {drawable = 0, texture = 0},           -- No vest
            bag = {drawable = 0, texture = 0},            -- No bag
            accessory = {drawable = 0, texture = 0},      -- No accessory
            decals = {drawable = 0, texture = 0},         -- No decals
            mask = {drawable = 0, texture = 0},           -- No mask
            hat = {drawable = -1, texture = 0},           -- No hat
            glass = {drawable = 0, texture = 0},          -- No glasses
            ear = {drawable = -1, texture = 0},           -- No earrings
            watch = {drawable = -1, texture = 0},         -- No watch
            bracelet = {drawable = -1, texture = 0},      -- No bracelet
        },
        
        -- Naked State (Phase 2+)
        naked = {
            arms = {drawable = 252, texture = 0},          -- Bare arms
            ["t-shirt"] = {drawable = -1, texture = 0},   -- No undershirt
            torso2 = {drawable = -1, texture = 0},        -- Topless
            pants = {drawable = 193, texture = 0},         -- Bottomless
            shoes = {drawable = 15, texture = 0},         -- Barefoot
            vest = {drawable = 0, texture = 0},
            bag = {drawable = 0, texture = 0},
            accessory = {drawable = 0, texture = 0},
            decals = {drawable = 0, texture = 0},
            mask = {drawable = 0, texture = 0},
            hat = {drawable = -1, texture = 0},
            glass = {drawable = 0, texture = 0},
            ear = {drawable = -1, texture = 0},
            watch = {drawable = -1, texture = 0},
            bracelet = {drawable = -1, texture = 0},
        }
    },
    
    [2] = { -- Candy - "The Hills Princess"
        model = `mp_f_freemode_01`,
		modelNumber = 3413004,
        name = "Candy",
        nickname = "The Hills Princess",
        personality = "Demanding",
        base_price_modifier = 1.2,
        description = "High maintenance but worth every penny",
        
        -- Complete Appearance Data
        appearance = {
            -- Heritage/Face Blend
            face = {item = 4, texture = 0},            -- Glamorous face
            face2 = {item = 40, texture = 0},
            facemix = {shapeMix = 0.9, skinMix = 0.0}, -- Very feminine
            
            -- Hair
            hair = {item = 248, texture = 34},          -- Long straight, pink/platinum
            
            -- Facial Structure (Very Feminine)
            nose_0 = {item = 2},                       -- Very narrow nose
            nose_1 = {item = 3},                       -- Higher nose peak
            nose_2 = {item = 3},                       -- Shorter nose
            nose_3 = {item = 5},
            nose_4 = {item = 5},
            nose_5 = {item = 5},
            cheek_1 = {item = 7},                      -- Very high cheekbones
            cheek_2 = {item = 6},                      -- Very wide cheekbones
            cheek_3 = {item = 5},
            eyebrown_high = {item = 6},
            eyebrown_forward = {item = 5},
            eye_opening = {item = 7},                  -- Very large eyes
            lips_thickness = {item = 8},               -- Very full lips
            jaw_bone_width = {item = 2},               -- Very narrow jaw
            jaw_bone_back_lenght = {item = 5},
            chimp_bone_lowering = {item = 4},
            chimp_bone_lenght = {item = 3},
            chimp_bone_width = {item = 5},
            chimp_hole = {item = 5},
            neck_thikness = {item = 5},
            
            -- Overlays & Makeup (Glamorous)
            eyebrows = {item = 2, texture = 24},       -- Shaped eyebrows, pink
            beard = {item = -1, texture = 1},
            blush = {item = 3, texture = 5},           -- Strong blush, pink
            lipstick = {item = 8, texture = 8},        -- Bold lipstick, hot pink
            makeup = {item = 5, texture = 3},          -- Heavy eye makeup
            ageing = {item = -1, texture = 0},
            eye_color = {item = 8, texture = 0},       -- Light blue eyes
            moles = {item = 0, texture = 0},
        },
        
        -- Lingerie State
        lingerie = {
            arms = {drawable = 245, texture = 0},
            ["t-shirt"] = {drawable = 23, texture = 12},
            torso2 = {drawable = -1, texture = 0},         -- Pink satin bra
            pants = {drawable = 63, texture = 5},         -- Pink satin panties
            shoes = {drawable = 152, texture = 0},          -- Pink high heels
            vest = {drawable = 0, texture = 0},
            bag = {drawable = 0, texture = 0},
            accessory = {drawable = 0, texture = 0},
            decals = {drawable = 0, texture = 0},
            mask = {drawable = 0, texture = 0},
            hat = {drawable = -1, texture = 0},
            glass = {drawable = 0, texture = 0},
            ear = {drawable = -1, texture = 0},
            watch = {drawable = -1, texture = 0},
            bracelet = {drawable = -1, texture = 0},
        },
        
        -- Naked State
        naked = {
            arms = {drawable = 15, texture = 0},
            ["t-shirt"] = {drawable = -1, texture = 0},
            torso2 = {drawable = -1, texture = 0},        -- Topless
            pants = {drawable = 193, texture = 0},         -- Bottomless
            shoes = {drawable = 152, texture = 0},          -- Keep pink heels
            vest = {drawable = 0, texture = 0},
            bag = {drawable = 0, texture = 0},
            accessory = {drawable = 0, texture = 0},
            decals = {drawable = 0, texture = 0},
            mask = {drawable = 0, texture = 0},
            hat = {drawable = -1, texture = 0},
            glass = {drawable = 0, texture = 0},
            ear = {drawable = -1, texture = 0},
            watch = {drawable = -1, texture = 0},
            bracelet = {drawable = -1, texture = 0},
        }
    },
    
    [3] = { -- Diamond - "The Socialite"
        model = `mp_f_freemode_01`,
		modelNumber = 348382215,
        name = "Diamond",
        nickname = "The Socialite",
        personality = "Sophisticated",
        base_price_modifier = 1.5,
        description = "Elegant and refined, she knows her worth",
        
        -- Complete Appearance Data
        appearance = {
            -- Heritage/Face Blend
            face = {item = 4, texture = 0},           -- Elegant face
            face2 = {item = 40, texture = 0},
            facemix = {shapeMix = 0.7, skinMix = 0.01},
            
            -- Hair
            hair = {item = 165, texture = 1},            -- Elegant updo, dark brunette
            
            -- Facial Structure (Sophisticated)
            nose_0 = {item = 0},                       -- Refined nose
            nose_1 = {item = 0},                       -- Elegant nose peak
            nose_2 = {item = 0},
            nose_3 = {item = 0},
            nose_4 = {item = 0},
            nose_5 = {item = 0},
            cheek_1 = {item = 0},                      -- High cheekbones
            cheek_2 = {item = 0},                      -- Defined cheekbones
            cheek_3 = {item = 0},
            eyebrown_high = {item = 0},
            eyebrown_forward = {item = 0},
            eye_opening = {item = 0},                  -- Elegant eyes
            lips_thickness = {item = 0},               -- Full lips
            jaw_bone_width = {item = 0},               -- Refined jaw
            jaw_bone_back_lenght = {item = 0},
            chimp_bone_lowering = {item = 0},
            chimp_bone_lenght = {item = 0},
            chimp_bone_width = {item = 0},
            chimp_hole = {item = 0},
            neck_thikness = {item = 0},
            
            -- Overlays & Makeup (Sophisticated)
            eyebrows = {item = 7, texture = 1},        -- Elegant eyebrows, dark
            beard = {item = -1, texture = 1},
            blush = {item = 3, texture = 1},           -- Subtle blush
            lipstick = {item = 5, texture = 1},        -- Classic red lipstick
            makeup = {item = 4, texture = 2},          -- Sophisticated eye makeup
            ageing = {item = -1, texture = 0},
            eye_color = {item = 1, texture = 0},       -- Dark eyes
            moles = {item = 0, texture = 0},
        },
        
        -- Lingerie State
        lingerie = {
            arms = {drawable = 15, texture = 0},
            ["t-shirt"] = {drawable = -1, texture = 0},
            torso2 = {drawable = 13, texture = 0},         -- Black lace bra
            pants = {drawable = 222, texture = 0},         -- Black lace panties
            shoes = {drawable = 7, texture = 2},          -- Black stiletto heels
            vest = {drawable = 0, texture = 0},
            bag = {drawable = 0, texture = 0},
            accessory = {drawable = 0, texture = 0},
            decals = {drawable = 0, texture = 0},
            mask = {drawable = 0, texture = 0},
            hat = {drawable = -1, texture = 0},
            glass = {drawable = 0, texture = 0},
            ear = {drawable = -1, texture = 0},
            watch = {drawable = -1, texture = 0},
            bracelet = {drawable = -1, texture = 0},
        },
        
        -- Naked State
        naked = {
            arms = {drawable = 15, texture = 0},
            ["t-shirt"] = {drawable = -1, texture = 0},
            torso2 = {drawable = -1, texture = 0},        -- Topless
            pants = {drawable = 193, texture = 0},         -- Bottomless
            shoes = {drawable = 7, texture = 2},          -- Keep pink heels
            vest = {drawable = 0, texture = 0},
            bag = {drawable = 0, texture = 0},
            accessory = {drawable = 0, texture = 0},
            decals = {drawable = 0, texture = 0},
            mask = {drawable = 0, texture = 0},
            hat = {drawable = -1, texture = 0},
            glass = {drawable = 0, texture = 0},
            ear = {drawable = -1, texture = 0},
            watch = {drawable = -1, texture = 0},
            bracelet = {drawable = -1, texture = 0},
        }
    },
    
    [4] = { -- Sapphire - "The Business Woman"
        model = `mp_f_freemode_01`,
		modelNumber = 51789996,
        name = "Sapphire",
        nickname = "The Business Woman",
        personality = "Professional",
        base_price_modifier = 1.3,
        description = "All business, no games",
        
        -- Complete Appearance Data
        appearance = {
            -- Heritage/Face Blend
            face = {item = 21, texture = 0},           -- Professional face
            face2 = {item = 0, texture = 0},
            facemix = {shapeMix = 0.2, skinMix = 0.8},
            
            -- Hair
            hair = {item = 53, texture = 38},          -- Short bob, dark with blue tint
            
            -- Facial Structure (Professional)
            nose_0 = {item = 4},                       -- Balanced nose
            nose_1 = {item = 3},                       -- Professional nose peak
            nose_2 = {item = 4},
            nose_3 = {item = 5},
            nose_4 = {item = 5},
            nose_5 = {item = 5},
            cheek_1 = {item = 5},                      -- Defined cheekbones
            cheek_2 = {item = 5},                      -- Balanced cheekbones
            cheek_3 = {item = 5},
            eyebrown_high = {item = 5},
            eyebrown_forward = {item = 5},
            eye_opening = {item = 5},                  -- Professional eyes
            lips_thickness = {item = 6},               -- Professional lips
            jaw_bone_width = {item = 4},               -- Balanced jaw
            jaw_bone_back_lenght = {item = 5},
            chimp_bone_lowering = {item = 5},
            chimp_bone_lenght = {item = 4},
            chimp_bone_width = {item = 5},
            chimp_hole = {item = 5},
            neck_thikness = {item = 5},
            
            -- Overlays & Makeup (Professional)
            eyebrows = {item = 2, texture = 26},       -- Professional eyebrows
            beard = {item = -1, texture = 1},
            blush = {item = 1, texture = 3},           -- Subtle blush
            lipstick = {item = 4, texture = 3},        -- Professional lipstick, blue tone
            makeup = {item = 3, texture = 2},          -- Professional eye makeup
            ageing = {item = -1, texture = 0},
            eye_color = {item = 19, texture = 0},       -- Blue eyes
            moles = {item = 0, texture = 0},
        },
        
        -- Lingerie State
        lingerie = {
            arms = {drawable = 6, texture = 0},
            ["t-shirt"] = {drawable = -1, texture = 0},
            torso2 = {drawable = 7, texture = 0},         -- Blue satin bra
            pants = {drawable = 191, texture = 2},         -- Blue satin panties
            shoes = {drawable = 7, texture = 0},          -- Blue high heels
            vest = {drawable = 0, texture = 0},
            bag = {drawable = 0, texture = 0},
            accessory = {drawable = 0, texture = 0},
            decals = {drawable = 0, texture = 0},
            mask = {drawable = 0, texture = 0},
            hat = {drawable = -1, texture = 0},
            glass = {drawable = 0, texture = 0},
            ear = {drawable = -1, texture = 0},
            watch = {drawable = -1, texture = 0},
            bracelet = {drawable = -1, texture = 0},
        },
        
        -- Naked State
        naked = {
            arms = {drawable = 15, texture = 0},
            ["t-shirt"] = {drawable = -1, texture = 0},
            torso2 = {drawable = -1, texture = 0},        -- Topless
            pants = {drawable = 193, texture = 0},         -- Bottomless
            shoes = {drawable = 7, texture = 0},          -- Keep pink heels
            vest = {drawable = 0, texture = 0},
            bag = {drawable = 0, texture = 0},
            accessory = {drawable = 0, texture = 0},
            decals = {drawable = 0, texture = 0},
            mask = {drawable = 0, texture = 0},
            hat = {drawable = -1, texture = 0},
            glass = {drawable = 0, texture = 0},
            ear = {drawable = -1, texture = 0},
            watch = {drawable = -1, texture = 0},
            bracelet = {drawable = -1, texture = 0},
        }
    }
}

-- Reputation Tiers (from PickUpAHoe)
Config.ReputationTiers = {
    [1] = { min = 0,   max = 20,  status = "Stranger",     bonus = 0.0,  color = "#95a5a6" },
    [2] = { min = 21,  max = 40,  status = "Acquaintance", bonus = 0.10, color = "#3498db" },
    [3] = { min = 41,  max = 60,  status = "Friend",       bonus = 0.20, color = "#9b59b6" },
    [4] = { min = 61,  max = 80,  status = "Partner",      bonus = 0.35, color = "#e91e63" },
    [5] = { min = 81,  max = 100, status = "Exclusive",    bonus = 1.00, color = "#f39c12" }
}

-- Reputation Gain/Loss (matching NS-PickUpAHoe)
Config.ReputationGain = {
    phase_completion = 1.0,      -- Gain per phase completed
    perfect_service = 2.0,       -- Bonus for completing all phases
    quick_completion = 0.5,       -- Bonus for completing all phases
    bonus_completion = 2.5       -- Bonus for Bonus service
}

Config.ReputationLoss = {
    early_exit = -2.0,           -- Penalty for leaving early
    timeout = -1.0               -- Penalty for taking too long
}

-- Decay Settings (matching NS-PickUpAHoe)
Config.DecaySettings = {
    enabled = true,
    decay_start_hours = 12,
    decay_rate_per_hour = 0.25,
    max_decay_per_session = 10,
    min_reputation = 0,
    base_multiplier_decay_rate = 0.15,
    base_multiplier_decay_start_hours = 24,
}

if Config.Debug == false then
    Config.MadamCoords = vector3(332.1, 424.49, 149.05)
    Config.ResetTimer = 6
    Config.EndTime = 30
    Config.MissionaryTime = 30
    Config.BlowTime = 20
    Config.BaseActivationCost = 8000
    Config.ExitLocation = vector3(316.99, 440.53, 141.67)
end

if Config.Debug == true then
    Config.MadamCoords = vector3(328.88, 430.2, 145.57)
    Config.ResetTimer = 5
    Config.EndTime = 5
    Config.MissionaryTime = 5
    Config.BlowTime = 5
    Config.BaseActivationCost = 1
    Config.ExitLocation = vector3(332.6, 424.1, 145.6)
end