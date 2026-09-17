Config                              = Config or {}

-- Framework
Config.Framework					= 'QBCore'	-- Choose which framework your server is using so kc-unicorn can work with it [ESX, QBCore, Standalone]
-- Since there is too many esx version, only this one is supported (https://github.com/esx-framework/es_extended/tree/v1-final). Maybe I will test other version, but not a priority

-- Lap dance 
Config.LapDanceCost					= 600 	-- Cost of the lap dance
Config.ThrowCost					= 100 	-- Cost of the lap dance
Config.BonusItemThrowCost			= 2500 	-- How Much money a player must throw to get the bonus item
Config.LegMoney                     = 9999999     -- Little easter egg for your player, will add an accessory "Leg money" to the stripper if the player has more than 'Config.LegMoney' in cash. Set to a huge value if you don't want this
Config.Nudity                       = true      -- Set to true if you want the stripper to be topless (Only for player above 'Config.NudityAge')
Config.NudityAge                    = 0        -- (QBCore only!!) Player age restriction. If underage and 'Config.Nudity' is set to true, the stripper won't be topless. Set to 0 if you don't want age restriction

-- Text/Blip/Marker
Config.Text 						= 'Better3D'   -- 2D, 3D, Better3D, None (Set the one you like to suit your server, the performance difference is mostly non-existant)
Config.Blip                         = true         -- Set to false if you don't want the blip on the map
Config.BlipName                     = "Strip-Club" -- Blip name
Config.BlipStripclub = {
	Sprite = 121,  -- Sprite list can be found here: https://docs.fivem.net/docs/game-references/blips/
	Colour = 50,   -- Color list in the same URL as above
	Display = 27,   -- Explanation here: https://docs.fivem.net/natives/?_0x9029B2F3DA924928
	Scale = 0.7    -- Self explanatory, let you set the scale of the blip
}
Config.BlipCoord					= { x=128.87, y=-1298.93, z=4.0 } -- If you want to move the blip on the map, change this.
Config.LapMarker					= true	-- Set to true if you want the marker for the lapdance to be "drawn"

-- Enhanced Strippers (Integrated from CallGirl Module)
Config.SelectStrippers				= true	-- Set to true if you want to let your player choose which stripper they want for their lapdance
Config.Strippers = {
	[1] = {
		-- Juliet - "The Beach Girl"
		Name = "Juliet",
		Nickname = "The Beach Girl",
		Model = `mp_f_freemode_01`,
		ModelNumber = 42647445,
		Personality = "Flirty",
		BasePriceModifier = 1.0,
		Description = "A carefree spirit who loves the beach life",
		
		-- Complete Appearance Data
		Appearance = {
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
		Lingerie = {
			arms = {drawable = 15, texture = 0},          -- Bare arms
			tshirt = {drawable = -1, texture = 0},   -- No undershirt
			torso2 = {drawable = 18, texture = 0},         -- White bikini top
			pants = {drawable = 219, texture = 1},         -- White bikini bottom
			shoes = {drawable = 15, texture = 0},         -- Barefoot
			vest = {drawable = -1, texture = 0},           -- No vest
			bag = {drawable = 0, texture = 0},            -- No bag
			accessory = {drawable = 0, texture = 0},      -- No accessory
			decals = {drawable = 0, texture = 0},         -- No decals
			mask = {drawable = 0, texture = 0},           -- No mask
			hat = {drawable = -1, texture = 0},           -- No hat
			glass = {drawable = -1, texture = 0},          -- No glasses
			ear = {drawable = -1, texture = 0},           -- No earrings
			watch = {drawable = -1, texture = 0},         -- No watch
			bracelet = {drawable = -1, texture = 0},      -- No bracelet
		},
		-- Naked State (Phase)
        naked = {
            arms = {drawable = 252, texture = 0},          -- Bare arms
            tshirt = {drawable = -1, texture = 0},   -- No undershirt
            torso2 = {drawable = -1, texture = 0},        -- Topless
            pants = {drawable = 193, texture = 0},         -- Bottomless
            shoes = {drawable = 15, texture = 0},         -- Barefoot
            vest = {drawable = 0, texture = 0},
            bag = {drawable = 0, texture = 0},
            accessory = {drawable = 0, texture = 0},
            decals = {drawable = 0, texture = 0},
            mask = {drawable = 0, texture = 0},
            hat = {drawable = -1, texture = 0},
            glass = {drawable = -1, texture = 0},
            ear = {drawable = -1, texture = 0},
            watch = {drawable = -1, texture = 0},
            bracelet = {drawable = -1, texture = 0},
        },
		-- Topless State (Phase)
        topless = {
            arms = {drawable = 252, texture = 0},          -- Bare arms
            tshirt = {drawable = -1, texture = 0},   -- No undershirt
            torso2 = {drawable = -1, texture = 0},        -- Topless
            pants = {drawable = 219, texture = 1},         -- 
            shoes = {drawable = 15, texture = 0},         -- 
            vest = {drawable = 0, texture = 0},
            bag = {drawable = 0, texture = 0},
            accessory = {drawable = 0, texture = 0},
            decals = {drawable = 0, texture = 0},
            mask = {drawable = 0, texture = 0},
            hat = {drawable = -1, texture = 0},
            glass = {drawable = -1, texture = 0},
            ear = {drawable = -1, texture = 0},
            watch = {drawable = -1, texture = 0},
            bracelet = {drawable = -1, texture = 0},
        }
	},
	
	[2] = {
		-- Candy - "The Hills Princess"
		Name = "Candy",
		Nickname = "The Hills Princess",
		Model = `mp_f_freemode_01`,
		ModelNumber = 3413004,
		Personality = "Demanding",
		BasePriceModifier = 1.2,
		Description = "High maintenance but worth every penny",
		
		-- Complete Appearance Data
		Appearance = {
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
		Lingerie = {
			arms = {drawable = 245, texture = 0},
			tshirt = {drawable = 23, texture = 12},
			torso2 = {drawable = -1, texture = 0},         -- Pink satin bra
			pants = {drawable = 63, texture = 5},         -- Pink satin panties
			shoes = {drawable = 152, texture = 0},          -- Pink high heels
			vest = {drawable = -1, texture = 0},
			bag = {drawable = 0, texture = 0},
			accessory = {drawable = 0, texture = 0},
			decals = {drawable = 0, texture = 0},
			mask = {drawable = 0, texture = 0},
			hat = {drawable = -1, texture = 0},
			glass = {drawable = -1, texture = 0},
			ear = {drawable = -1, texture = 0},
			watch = {drawable = -1, texture = 0},
			bracelet = {drawable = -1, texture = 0},
		},
        
        -- Naked State
        naked = {
            arms = {drawable = 15, texture = 0},
            tshirt = {drawable = -1, texture = 0},
            torso2 = {drawable = -1, texture = 0},        -- Topless
            pants = {drawable = 193, texture = 0},         -- Bottomless
            shoes = {drawable = 152, texture = 0},          -- Keep pink heels
            vest = {drawable = 0, texture = 0},
            bag = {drawable = 0, texture = 0},
            accessory = {drawable = 0, texture = 0},
            decals = {drawable = 0, texture = 0},
            mask = {drawable = 0, texture = 0},
            hat = {drawable = -1, texture = 0},
            glass = {drawable = -1, texture = 0},
            ear = {drawable = -1, texture = 0},
            watch = {drawable = -1, texture = 0},
            bracelet = {drawable = -1, texture = 0},
        },
		-- Topless State (Phase)
        topless = {
            arms = {drawable = 245, texture = 0},          -- Bare arms
            tshirt = {drawable = -1, texture = 0},   -- No undershirt
            torso2 = {drawable = -1, texture = 0},        -- Topless
            pants = {drawable = 63, texture = 5},         -- 
            shoes = {drawable = 152, texture = 0},         -- 
            vest = {drawable = 0, texture = 0},
            bag = {drawable = 0, texture = 0},
            accessory = {drawable = 0, texture = 0},
            decals = {drawable = 0, texture = 0},
            mask = {drawable = 0, texture = 0},
            hat = {drawable = -1, texture = 0},
            glass = {drawable = -1, texture = 0},
            ear = {drawable = -1, texture = 0},
            watch = {drawable = -1, texture = 0},
            bracelet = {drawable = -1, texture = 0},
        }
	},
	
	[3] = {
		-- Diamond - "The Socialite"
		Name = "Diamond",
		Nickname = "The Socialite",
		Model = `mp_f_freemode_01`,
		ModelNumber = 348382215,
		Personality = "Sophisticated",
		BasePriceModifier = 1.5,
		Description = "Elegant and refined, she knows her worth",
		
		-- Complete Appearance Data
		Appearance = {
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
		Lingerie = {
			arms = {drawable = 15, texture = 0},
			tshirt = {drawable = -1, texture = 0},
			torso2 = {drawable = 13, texture = 0},         -- Black lace bra
			pants = {drawable = 222, texture = 0},         -- Black lace panties
			shoes = {drawable = 7, texture = 2},          -- Black stiletto heels
			vest = {drawable = -1, texture = 0},
			bag = {drawable = 0, texture = 0},
			accessory = {drawable = 0, texture = 0},
			decals = {drawable = 0, texture = 0},
			mask = {drawable = 0, texture = 0},
			hat = {drawable = -1, texture = 0},
			glass = {drawable = -1, texture = 0},
			ear = {drawable = -1, texture = 0},
			watch = {drawable = -1, texture = 0},
			bracelet = {drawable = -1, texture = 0},
		},
        
        -- Naked State
        naked = {
            arms = {drawable = 15, texture = 0},
            tshirt = {drawable = -1, texture = 0},
            torso2 = {drawable = -1, texture = 0},        -- Topless
            pants = {drawable = 193, texture = 0},         -- Bottomless
            shoes = {drawable = 7, texture = 2},          -- Keep pink heels
            vest = {drawable = 0, texture = 0},
            bag = {drawable = 0, texture = 0},
            accessory = {drawable = 0, texture = 0},
            decals = {drawable = 0, texture = 0},
            mask = {drawable = 0, texture = 0},
            hat = {drawable = -1, texture = 0},
            glass = {drawable = -1, texture = 0},
            ear = {drawable = -1, texture = 0},
            watch = {drawable = -1, texture = 0},
            bracelet = {drawable = -1, texture = 0},
        },
		-- Topless State (Phase)
        topless = {
            arms = {drawable = 15, texture = 0},          -- Bare arms
            tshirt = {drawable = -1, texture = 0},   -- No undershirt
            torso2 = {drawable = -1, texture = 0},        -- Topless
            pants = {drawable = 222, texture = 0},         -- 
            shoes = {drawable = 7, texture = 2},         -- 
            vest = {drawable = 0, texture = 0},
            bag = {drawable = 0, texture = 0},
            accessory = {drawable = 0, texture = 0},
            decals = {drawable = 0, texture = 0},
            mask = {drawable = 0, texture = 0},
            hat = {drawable = -1, texture = 0},
            glass = {drawable = -1, texture = 0},
            ear = {drawable = -1, texture = 0},
            watch = {drawable = -1, texture = 0},
            bracelet = {drawable = -1, texture = 0},
        }
	},
	
	[4] = {
		-- Sapphire - "The Business Woman"
		Name = "Sapphire",
		Nickname = "The Business Woman",
		Model = `mp_f_freemode_01`,
		ModelNumber = 51789996,
		Personality = "Professional",
		BasePriceModifier = 1.3,
		Description = "All business, no games",
		
		-- Complete Appearance Data
		Appearance = {
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
		Lingerie = {
			arms = {drawable = 6, texture = 0},
			tshirt = {drawable = -1, texture = 0},
			torso2 = {drawable = 7, texture = 0},         -- Blue satin bra
			pants = {drawable = 191, texture = 2},         -- Blue satin panties
			shoes = {drawable = 7, texture = 0},          -- Blue high heels
			vest = {drawable = -1, texture = 0},
			bag = {drawable = 0, texture = 0},
			accessory = {drawable = 0, texture = 0},
			decals = {drawable = 0, texture = 0},
			mask = {drawable = 0, texture = 0},
			hat = {drawable = -1, texture = 0},
			glass = {drawable = -1, texture = 0},
			ear = {drawable = -1, texture = 0},
			watch = {drawable = -1, texture = 0},
			bracelet = {drawable = -1, texture = 0},
		},
        
        -- Naked State
        naked = {
            arms = {drawable = 15, texture = 0},
            tshirt = {drawable = -1, texture = 0},
            torso2 = {drawable = -1, texture = 0},        -- Topless
            pants = {drawable = 193, texture = 0},         -- Bottomless
            shoes = {drawable = 7, texture = 0},          -- Keep pink heels
            vest = {drawable = 0, texture = 0},
            bag = {drawable = 0, texture = 0},
            accessory = {drawable = 0, texture = 0},
            decals = {drawable = 0, texture = 0},
            mask = {drawable = 0, texture = 0},
            hat = {drawable = -1, texture = 0},
            glass = {drawable = -1, texture = 0},
            ear = {drawable = -1, texture = 0},
            watch = {drawable = -1, texture = 0},
            bracelet = {drawable = -1, texture = 0},
        },
		-- Topless State (Phase)
        topless = {
            arms = {drawable = 15, texture = 0},          -- Bare arms
            tshirt = {drawable = -1, texture = 0},   -- No undershirt
            torso2 = {drawable = -1, texture = 0},        -- Topless
            pants = {drawable = 191, texture = 2},         -- 
            shoes = {drawable = 7, texture = 0},         -- 
            vest = {drawable = 0, texture = 0},
            bag = {drawable = 0, texture = 0},
            accessory = {drawable = 0, texture = 0},
            decals = {drawable = 0, texture = 0},
            mask = {drawable = 0, texture = 0},
            hat = {drawable = -1, texture = 0},
            glass = {drawable = -1, texture = 0},
            ear = {drawable = -1, texture = 0},
            watch = {drawable = -1, texture = 0},
            bracelet = {drawable = -1, texture = 0},
        }
	}
}

-- Multi-Dancer Pole Configuration
Config.MultiDancerPoles = {
	enabled = true,
	maxDancers = 3, -- Maximum number of dancers at poles simultaneously
	poleLocations = {
		[1] = {
			coords = vector3(112.58, -1287.04, 28.49),
			heading = 303.19,
			name = "Main Pole"
		},
		[2] = {
			coords = vector3(102.26, -1290.89, 29.29),
			heading = 303.19,
			name = "Secondary Pole"
		},
		[3] = {
			coords = vector3(104.19, -1294.25, 29.29),
			heading = 224.66,
			name = "Third Pole"
		}
	},
	-- Pole dancer assignments (which stripper uses which pole)
	dancerAssignments = {
		[1] = 1, -- Pole 1: Use Stripper 1 (Juliet)
		[2] = 2, -- Pole 2: Use Stripper 2 (Candy)
		[3] = 3, -- Pole 3: Use Stripper 3 (Diamond)
	}
}

-- Locale
Config.Language						= 'en'	-- Currently Available: fr, en
-- Locales can be easily created or modified in `kc-unicorn/locales`

-- Misc
Config.Debug       					= false  	-- If you think something is not working, you can set 'Config.Debug' to true. It will then print a lot of debug information in your console
Config.DebugPolyzones					= false	-- Set to true if you want to display the Polyzones
Config.MoreDebug						= false	-- If set to true, this will print more debug about server and client lapdance seat status
Config.MoreDebugRefreshTime			= 5	-- Refresh time of "Config.MoreDebug" in seconds
Config.UpdateChecker                = false      -- Set to false if you don't want to check for resource update on start
Config.ChangeLog					= false	-- Set to false if you don't want to display the changelog if new version is find



----- DO NOT TOUCH! /!\ LOCALE SYSTEM /!\
Language = {}

function Loc(text,replacement)
    Language = (load)("return Locale." .. Config.Language)()

    if (load)("return Locale." .. Config.Language)() == nil then
        return 'Locale [' .. Config.Language .. '] (Does not exist/Is mispelled)'
    end
    if (load)("return ".."Language."..text)() == nil then
        return 'Error with [' .. Config.Language .. '.' .. text .. '] translation (Does not exist/Is mispelled)'
    end

	if replacement then
		text = (string.gsub((load)("return ".."Language."..text)(), "%%", replacement))
	else
		text = (load)("return ".."Language."..text)()
	end
	return text
end
-----------------------------------------