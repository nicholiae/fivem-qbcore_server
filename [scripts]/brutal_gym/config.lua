


----------------------------------------------------------------------------------------------
-----------------------------------| BRUTAL GYM SYSTEM :) |-----------------------------------
----------------------------------------------------------------------------------------------

--[[

Hi, thank you for buying our script, We are very grateful!

For help join our Discord server:     https://discord.gg/85u2u5c8q9
More informations about the script:   https://docs.brutalscripts.com

--]]

-- You can add your own notify here >> [gym-cl_utils.lua]

Config = {
    DeveloperMode = false, -- Developer mode (for support)
	lucky = 16,
    Core = 'QBCORE',  -- ESX / QBCORE  | Other core setting on the 'core' folder
	TextUI = 'false', -- 'false' / 'brutal_3dtextui' / 'brutal_textui' / 'ox_lib' / 'okokTextUI' / 'ESXTextUI' / 'QBDrawText' / 'DrawText3D' // Custom can be add in the gym-cl_utils.lua!!!
    Target = 'qb-target', -- 'oxtarget' / 'qb-target' // if the TextUI is set to false target will step its place. 
    ProgressBar = 'progressbar', -- 'progressBars' / 'pogressBar' / 'mythic_progbar' // Custom can be add in the gym-cl_utils.lua!!!
    BrutalNotify = false, -- Buy here: (4€+VAT) https://store.brutalscripts.com | Or set up your own notify >> cl_utils.lua
    MINIGAME = true,  -- Download here: https://github.com/firestix77/taskbarskill   (You can edit in the [gym-cl_utils.lua])
    GYMDistance = 60,  -- This is the distance from which membership is broken
    PressKey = 38,  -- If you want to change: https://docs.fivem.net/docs/game-references/controls/
	ShakeTime = 30,
    DisableControls = {}, -- These controls will blocked during the exercises
    ShootWeponsBlackList = {},
	
	GYMResting = {
        Use = false, -- Enable resting between workouts.
        RestDuration = 60, -- Rest duration in seconds. 
    },

    Skills = {
        SkillMenu = {Label = 'Brutal Skill Menu', Command = 'skillmenu', Control = 'DELETE'},  -- SETTINGS > KEYBINDINGS
        SkillNotifyTime = 5000, -- in milisec | 1000 = 1 sec
        SaveFrequency = 5, -- in minutes | Save in the SQL after that time
        RemoveTime = 60,  -- in munites | Remove one skill from player after that time
		
        SprintSpeedIncrease = 'MEDIUM', -- ('FAST', 'MEDIUM', 'SLOWLY') At what rate should you increase the run speed?
        SwimSpeedIncrease = 'MEDIUM', -- ('FAST', 'MEDIUM', 'SLOWLY') At what rate should you increase the swimming speed?
		StrengthIncrease = 'MEDIUM', -- ('HIGH', 'MEDIUM', 'LOW') At what rate should you increase strength?

        AllowOutsideTraining = false, -- If true, players can earn Stamina and Running points even when not in the gym.


        SkillTypes = {
            -- ⬇️ DO not edit this FIRST element! [You can edit the Skill Name with the Label]
            ['Stamina']  = {Use = true, Label = 'Stamina', Color = 'rgb(24, 191, 238)', Description = 'Affects ability to sprint, cycle and swim, Max stamina is unlimited stamina.'},
            ['Running']  = {Use = true, Label = 'Running', Color = 'rgb(24, 237, 148)', Description = 'Increases running speed. This brings a number of benefits.'},
            ['Driving']  = {Use = true, Label = 'Driving', Color = 'rgb(198, 237, 24)', Description = 'Increase vehicle handling, control wheelies better, increases control of veicle while in the air.'},
            ['Strength'] = {Use = true, Label = 'Strength', Color = 'rgb(237, 24, 24)', Description = 'Increases melee ability, increases speed on ladders/climbing, increases proficiency in sports, reduces demage taken.'},
            ['Swimming'] = {Use = true, Label = 'Swimming', Color = 'rgb(52, 24, 237)', Description = 'Increases the lung capacity, you can stay underwater longer.'},
            ['Shooting'] = {Use = true, Label = 'Shooting', Color = 'rgb(212, 24, 237)', Description = 'Increases accuracy, reduces recoil of guns, increases ammo capacity.'},
        }
    },
	
    Exersices = {
        -- Only use these [Stamina / Running / Driving / Strength / Swimming / Shooting] to the skill value.
        ['running'] = {label = "Running", anim = "running", time = 10, skill = 'Running'},
        ['pushups'] = {label = "Pushups", anim = "pushups", time = 10, skill = 'Strength'},
        ['situps'] = {label = "Situps", anim = "situps", time = 10, skill = 'Stamina'},
        ['weightlifting'] = {label = "Weightlifting", anim = "world_human_muscle_free_weights", time = 10, skill = 'Strength'},
        ['yoga'] = {label = "Yoga", anim = "world_human_yoga", time = 10, skill = 'Stamina'},
        ['pullup'] = {label = "Pullup", anim = "prop_human_muscle_chin_ups", time = 10, skill = 'Strength'},
        -- You can add more...
    },
    
    Gyms = {
		['Prison GYM'] = {
			ItemRequired = {Use = false, Item = 'gym_pass', Time = 15, RemoveItem = true},
			Distances = {Marker = 10, Text = 1.0},
			GYMCoords = { x = 1643.7150, y = 2528.1133, z = 45.56},
			Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 260, g = 40, b = 40, sizes = {x = 0.25, y = 0.3, z = 0.3}},
			Blip = { Use = false, colour = 1, size = 1.1, sprite = 311 },
			Exersices = {
				-- Weightlifting stations
				[1] = { type = 'weightlifting', x = 1649.93, y = 2533.92, z = 45.56, heading = 109.25},
				[2] = { type = 'weightlifting', x = 1647.75, y = 2531.47, z = 45.56, heading = 16.75},
				-- Yoga stations
				[3] = { type = 'yoga',          x = 1638.89, y = 2531.88, z = 45.56, heading = 44.85},
				[4] = { type = 'yoga',          x = 1637.85, y = 2524.43, z = 45.56, heading = 304.24},
				-- Running stations
				[5] = { type = 'running',       x = 1641.32, y = 2519.61, z = 45.56, heading = 230.74},
				[6] = { type = 'running',       x = 1646.55, y = 2527.37, z = 45.56, heading = 198.71},
			}
		},
        ['galelao2'] = {
            ItemRequired = {Use = false, Item = 'gym_pass', Time = 30, RemoveItem = true},
            Distances = {Marker = 10, Text = 1.0},
            GYMCoords = { x = -159.77, y = 1243.95, z = 306.61},
            Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 240, g = 221, b = 12, sizes = {x = 0.25, y = 0.3, z = 0.3}},  -- More sprites: https://docs.fivem.net/docs/game-references/markers/
            Blip = { Use = false, colour = 33, size = 1.1, sprite = 311 },
            Exersices = {
                [1]  = { type = 'running', x = -146.73, y = 1271.4, z = 320.83, heading = 314.34},
                [2]  = { type = 'yoga', x = -156.2, y = 1275.4, z = 320.72, heading = 217.16},
                [3] = { type = 'weightlifting', x = -149.93, y = 1271.31, z = 320.7, heading =  45.56},
                -- You can add more...
            }
        },
        ['galelao'] = {
            ItemRequired = {Use = false, Item = 'gym_pass', Time = 30, RemoveItem = true},
            Distances = {Marker = 10, Text = 1.0},
            GYMCoords = { x = -159.77, y = 1243.95, z = 306.61},
            Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 240, g = 221, b = 12, sizes = {x = 0.25, y = 0.3, z = 0.3}},  -- More sprites: https://docs.fivem.net/docs/game-references/markers/
            Blip = { Use = false, colour = 33, size = 1.1, sprite = 311 },
            Exersices = {
                [1]  = { type = 'running', x = -159.77, y = 1243.95, z = 306.61, heading = 223.8},
                [2]  = { type = 'running', x = -158.41, y = 1245.07, z = 306.62, heading = 226.57},
                [3]  = { type = 'yoga', x = -166.02, y = 1244.28, z = 306.52, heading = 40.95},
                [4] = { type = 'weightlifting', x = -163.4, y = 1240.69, z = 306.52, heading = 223.85},
                -- You can add more...
            }
        },
        ['acejones2'] = {
            ItemRequired = {Use = false, Item = 'gym_pass', Time = 30, RemoveItem = true},
            Distances = {Marker = 10, Text = 1.0},
            GYMCoords = { x = 207.8, y = 1707.14, z = 226.93},
            Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 240, g = 221, b = 12, sizes = {x = 0.25, y = 0.3, z = 0.3}},  -- More sprites: https://docs.fivem.net/docs/game-references/markers/
            Blip = { Use = false, colour = 33, size = 1.1, sprite = 311 },
            Exersices = {
                [1]  = { type = 'running', x = 1241.25, y = -844.02, z = 71.15, heading = 80.09},
                [2]  = { type = 'running', x = 1240.4, y = -846.52, z = 71.15, heading = 80.09},
                [3]  = { type = 'yoga', x = 1243.53, y = -851.58, z = 71.04, heading = 174.78},
                [4] = { type = 'weightlifting', x = 1246.55, y = -841.24, z = 71.02, heading = 167.74},
                -- You can add more...
            }
        },
        ['acejones1'] = {
            ItemRequired = {Use = false, Item = 'gym_pass', Time = 30, RemoveItem = true},
            Distances = {Marker = 10, Text = 1.0},
            GYMCoords = { x = 207.8, y = 1707.14, z = 226.93},
            Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 240, g = 221, b = 12, sizes = {x = 0.25, y = 0.3, z = 0.3}},  -- More sprites: https://docs.fivem.net/docs/game-references/markers/
            Blip = { Use = false, colour = 33, size = 1.1, sprite = 311 },
            Exersices = {
                [1]  = { type = 'running', x = -1790.18, y = 428.66, z = 132.47, heading = 88.39},
                [2]  = { type = 'yoga', x = -1790.18, y = 435.38, z = 132.34, heading = 91.62},
                [3] = { type = 'weightlifting', x = -1795.39, y = 426.91, z = 132.32, heading = 268.16},
                -- You can add more...
            }
        },
        ['mthaan1'] = {
            ItemRequired = {Use = false, Item = 'gym_pass', Time = 30, RemoveItem = true},
            Distances = {Marker = 10, Text = 1.0},
            GYMCoords = { x = 207.8, y = 1707.14, z = 226.93},
            Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 240, g = 221, b = 12, sizes = {x = 0.25, y = 0.3, z = 0.3}},  -- More sprites: https://docs.fivem.net/docs/game-references/markers/
            Blip = { Use = false, colour = 33, size = 1.1, sprite = 311 },
            Exersices = {
                [1]  = { type = 'running', x = 207.8, y = 1707.14, z = 226.93, heading = 181.36},
                [2]  = { type = 'yoga', x = 206.98, y = 1712.37, z = 226.95, heading = 23.68},
                [3] = { type = 'weightlifting', x = 207.87, y = 1710.56, z = 226.95, heading = 82.94},
                -- You can add more...
            }
        },
        ['starkMansion'] = {
            ItemRequired = {Use = false, Item = 'gym_pass', Time = 30, RemoveItem = true},
            Distances = {Marker = 10, Text = 1.0},
            GYMCoords = { x = -61.39, y = 821.61, z = 227.75},
            Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 240, g = 221, b = 12, sizes = {x = 0.25, y = 0.3, z = 0.3}},  -- More sprites: https://docs.fivem.net/docs/game-references/markers/
            Blip = { Use = false, colour = 33, size = 1.1, sprite = 311 },
            Exersices = {
                [1]  = { type = 'running', x = -3339.88, y = 1808.51, z = 33.89, heading = 49.39},
                [2]  = { type = 'yoga', x = -3340.01, y = 1798.63, z = 33.96, heading = 29.76},
                [3] = { type = 'weightlifting', x = -3337.43, y = 1799.85, z = 33.95, heading = 212.73},
                -- You can add more...
            }
        },
        ['6067'] = {
            ItemRequired = {Use = false, Item = 'gym_pass', Time = 30, RemoveItem = true},
            Distances = {Marker = 10, Text = 1.0},
            GYMCoords = { x = -61.39, y = 821.61, z = 227.75},
            Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 240, g = 221, b = 12, sizes = {x = 0.25, y = 0.3, z = 0.3}},  -- More sprites: https://docs.fivem.net/docs/game-references/markers/
            Blip = { Use = false, colour = 33, size = 1.1, sprite = 311 },
            Exersices = {
                [1]  = { type = 'running', x = -61.39, y = 821.61, z = 227.75, heading = 97.29},
                [2]  = { type = 'yoga', x = -65.78, y = 820.76, z = 227.77, heading = 97.97},
                [3] = { type = 'weightlifting', x = -57.28, y = 820.14, z = 227.75, heading = 96.83},
                -- You can add more...
            }
        },
        ['marlowdr2'] = {
            ItemRequired = {Use = false, Item = 'gym_pass', Time = 30, RemoveItem = true},
            Distances = {Marker = 10, Text = 1.0},
            GYMCoords = { x = -2623.88, y = 1900.7, z = 163.46},
            Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 240, g = 221, b = 12, sizes = {x = 0.25, y = 0.3, z = 0.3}},  -- More sprites: https://docs.fivem.net/docs/game-references/markers/
            Blip = { Use = false, colour = 33, size = 1.1, sprite = 311 },
            Exersices = {
                [1]  = { type = 'running', x = 659.56, y = 909.94, z = 252.74, heading = 168.52},
                [2]  = { type = 'yoga', x = 660.95, y = 913.4, z = 252.6, heading = 84.56},
                [3] = { type = 'weightlifting', x = 663.43, y = 918.25, z = 252.58, heading = 260.46},
                -- You can add more...
            }
        },
        ['buenvino1'] = {
            ItemRequired = {Use = false, Item = 'gym_pass', Time = 30, RemoveItem = true},
            Distances = {Marker = 10, Text = 1.0},
            GYMCoords = { x = -2623.88, y = 1900.7, z = 163.46},
            Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 240, g = 221, b = 12, sizes = {x = 0.25, y = 0.3, z = 0.3}},  -- More sprites: https://docs.fivem.net/docs/game-references/markers/
            Blip = { Use = false, colour = 33, size = 1.1, sprite = 311 },
            Exersices = {
                [1]  = { type = 'weightlifting', x = -2623.88, y = 1900.7, z = 163.46, heading = 132.6},
                [2]  = { type = 'yoga', x = -2621.09, y = 1902.88, z = 163.46, heading = 310.82},
                [3] = { type = 'running', x = -2617.73, y = 1905.97, z = 163.46, heading = 312.61},
                -- You can add more...
            }
        },
        ['greatocn6'] = {
            ItemRequired = {Use = false, Item = 'gym_pass', Time = 30, RemoveItem = true},
            Distances = {Marker = 10, Text = 1.0},
            GYMCoords = { x = -3141.17, y = 1389.3, z = 27.84},
            Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 240, g = 221, b = 12, sizes = {x = 0.25, y = 0.3, z = 0.3}},  -- More sprites: https://docs.fivem.net/docs/game-references/markers/
            Blip = { Use = false, colour = 33, size = 1.1, sprite = 311 },
            Exersices = {
                [1]  = { type = 'weightlifting', x = -3141.29, y = 1389.2, z = 27.96, heading = 154.81},
                [2]  = { type = 'yoga', x = -3138.38, y = 1385.71, z = 27.96, heading = 156.19},
                [3] = { type = 'running', x = -3140.14, y = 1387.24, z = 27.96, heading = 59.48},
                -- You can add more...
            }
        },
        ['Route1'] = {
            ItemRequired = {Use = false, Item = 'gym_pass', Time = 30, RemoveItem = true},
            Distances = {Marker = 10, Text = 1.0},
            GYMCoords = { x = -2527.17, y = 747.3, z = 307.84},
            Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 240, g = 221, b = 12, sizes = {x = 0.25, y = 0.3, z = 0.3}},  -- More sprites: https://docs.fivem.net/docs/game-references/markers/
            Blip = { Use = false, colour = 33, size = 1.1, sprite = 311 },
            Exersices = {
                [1]  = { type = 'weightlifting', x = -3220.17, y = 787.92, z = 14.09, heading = 212.2},
                [2]  = { type = 'yoga', x = -3225.39, y = 797.92, z = 14.1, heading = 87.87},
                [3] = { type = 'running', x = -3225.56, y = 794.53, z = 14.23, heading = 124.77},
                -- You can add more...
            }
        },
        ['ace jones dr2'] = {
            ItemRequired = {Use = false, Item = 'gym_pass', Time = 30, RemoveItem = true},
            Distances = {Marker = 10, Text = 1.0},
            GYMCoords = { x = -1672.85, y = 460.32, z = 136.26},
            Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 240, g = 221, b = 12, sizes = {x = 0.25, y = 0.3, z = 0.3}},  -- More sprites: https://docs.fivem.net/docs/game-references/markers/
            Blip = { Use = false, colour = 33, size = 1.1, sprite = 311 },
            Exersices = {
                [1]  = { type = 'weightlifting', x = -1655.17, y = 464.07, z = 126.13, heading = 288.64},
                [2]  = { type = 'yoga', x = -1655.15, y = 457.33, z = 126.13, heading = 113.0},
                [3] = { type = 'running', x = -1657.41, y = 461.51, z = 126.27, heading = 114.26},
                -- You can add more...
            }
        },
        ['canyon dr'] = {
            ItemRequired = {Use = false, Item = 'gym_pass', Time = 30, RemoveItem = true},
            Distances = {Marker = 10, Text = 1.0},
            GYMCoords = { x = -2527.17, y = 747.3, z = 307.84},
            Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 240, g = 221, b = 12, sizes = {x = 0.25, y = 0.3, z = 0.3}},  -- More sprites: https://docs.fivem.net/docs/game-references/markers/
            Blip = { Use = false, colour = 33, size = 1.1, sprite = 311 },
            Exersices = {
                [1]  = { type = 'weightlifting', x = -2527.17, y = 747.3, z = 307.84, heading = 241.19},
                [2]  = { type = 'yoga', x = -2529.15, y = 750.49, z = 307.87, heading = 61.53},
                [3] = { type = 'running', x = -2522.83, y = 747.9, z = 308.0, heading = 239.2},
                -- You can add more...
            }
        },
        ['B GYM'] = {
            ItemRequired = {Use = false, Item = 'gym_pass', Time = 30, RemoveItem = true},
            Distances = {Marker = 10, Text = 1.0},
            GYMCoords = { x = -2307.08, y = 4338.69, z = 37.08},
            Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 240, g = 221, b = 12, sizes = {x = 0.25, y = 0.3, z = 0.3}},  -- More sprites: https://docs.fivem.net/docs/game-references/markers/
            Blip = { Use = false, colour = 33, size = 1.1, sprite = 311 },
            Exersices = {
                [1]  = { type = 'weightlifting', x = -2980.56, y = -363.17, z = 15.23, heading = 359.85},
                [2]  = { type = 'yoga', x = -2985.03, y = -360.0, z = 15.23, heading = 164.24},
                [3] = { type = 'running', x = -2987.83, y = -366.71, z = 15.24, heading = 336.42},
                -- You can add more...
            }
        },
        ['Smoke GYM'] = {
            ItemRequired = {Use = false, Item = 'gym_pass', Time = 30, RemoveItem = true},
            Distances = {Marker = 10, Text = 1.0},
            GYMCoords = { x = 748.45, y = 1290.44, z = 368.37},
            Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 240, g = 221, b = 12, sizes = {x = 0.25, y = 0.3, z = 0.3}},  -- More sprites: https://docs.fivem.net/docs/game-references/markers/
            Blip = { Use = false, colour = 33, size = 1.1, sprite = 311 },
            Exersices = {
                [1]  = { type = 'weightlifting', x = 748.45, y = 1290.44, z = 368.37, heading = 359.43},
                [2]  = { type = 'yoga', x = 748.82, y = 1285.87, z = 368.37, heading = 358.38},
                [3] = { type = 'running', x = 745.91, y = 1284.09, z = 368.53, heading = 259.52},
                -- You can add more...
            }
        },
        ['MtHaan1'] = {
            ItemRequired = {Use = false, Item = 'gym_pass', Time = 30, RemoveItem = true},
            Distances = {Marker = 10, Text = 1.0},
            GYMCoords = { x = -2307.08, y = 4338.69, z = 37.08},
            Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 240, g = 221, b = 12, sizes = {x = 0.25, y = 0.3, z = 0.3}},  -- More sprites: https://docs.fivem.net/docs/game-references/markers/
            Blip = { Use = false, colour = 33, size = 1.1, sprite = 311 },
            Exersices = {
                [1]  = { type = 'weightlifting', x = -2307.08, y = 4338.69, z = 37.08, heading = 141.52},
                [2]  = { type = 'yoga', x = -2302.21, y = 4339.22, z = 37.1, heading = 317.43},
                [3] = { type = 'running', x = -2303.41, y = 4342.25, z = 37.23, heading = 52.64},
                -- You can add more...
            }
        },
        ['Beach GYM'] = {
            ItemRequired = {Use = true, Item = 'gym_pass', Time = 30, RemoveItem = true},
            Distances = {Marker = 10, Text = 1.0},
            GYMCoords = { x = -1200.3149, y = -1568.4581, z = 4.6123},
            Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 240, g = 221, b = 12, sizes = {x = 0.25, y = 0.3, z = 0.3}},  -- More sprites: https://docs.fivem.net/docs/game-references/markers/
            Blip = { Use = true, colour = 33, size = 1.1, sprite = 311 },
            Exersices = {
                [1]  = { type = 'weightlifting', x = -1197.0083, y = -1573.0277, z = 4.6125, heading = 29.5812},
                [2]  = { type = 'weightlifting', x = -1210.0604, y = -1561.3734, z = 4.6080, heading = 76.0602},
                [3]  = { type = 'pullup', x = -1204.6512, y = -1564.4742, z = 4.6096, heading = 36.2476},
                [4]  = { type = 'pullup', x = -1200.1077, y = -1570.9010, z = 4.6097, heading = 216.9520},
                [5]  = { type = 'yoga', x = -1204.6547, y = -1560.7797, z = 4.6143, heading = 35.4453},
                [6]  = { type = 'pushups', x = -1207.3629, y = -1565.8481, z = 4.6080, heading = 125.5502},
                [7]  = { type = 'situps', x = -1202.0811, y = -1567.2975, z = 4.6106,heading =  209.7822},
                [8] = { type = 'running', x = -1200.42, y = -1577.03, z = 4.61, heading = 19.98},
                -- You can add more...
            }
        },
		['Marlow dr1 GYM'] = {
            ItemRequired = {Use = false, Item = 'gym_pass', Time = 30, RemoveItem = true},
            Distances = {Marker = 10, Text = 1.0},
            GYMCoords = { x = -1200.3149, y = -1568.4581, z = 4.6123},
            Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 240, g = 221, b = 12, sizes = {x = 0.25, y = 0.3, z = 0.3}},  -- More sprites: https://docs.fivem.net/docs/game-references/markers/
            Blip = { Use = false, colour = 33, size = 1.1, sprite = 311 },
            Exersices = {
                -- [1]  = { type = 'weightlifting', x = 358.64, y = 1811.76, z = 233.06, heading = 61.47},
                -- [2]  = { type = 'pullup', x = 354.51, y = 1817.07, z = 233.06, heading = 242.93},
                [1]  = { type = 'yoga', x = -1234.5, y = 786.63, z = 197.22, heading = 21.44},
                [2]  = { type = 'pushups', x = -1234.12, y = 775.56, z = 197.21, heading = 103.19},
                -- [5]  = { type = 'situps', x = 363.51, y = 1814.54, z = 233.06,heading =  325.74},
                [3] = { type = 'running', x = -1233.88, y = 780.72, z = 197.36, heading = 198.62},
                [4] = { type = 'running', x = -1261.43, y = 765.96, z = 197.37, heading = 192.26},
                [5]  = { type = 'pushups', x = -1251.91, y = 770.25, z = 197.21, heading = 26.22},
                [6]  = { type = 'yoga', x = -1262.4, y = 771.67, z = 197.22, heading = 14.75},
                -- You can add more...
            }
        },
        ['Mayor GYM'] = {
            ItemRequired = {Use = false, Item = 'gym_pass', Time = 15, RemoveItem = true},
            Distances = {Marker = 10, Text = 1.0},
            GYMCoords = { x = 754.95, y = 3428.88, z = 57.9},
            Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 260, g = 40, b = 40, sizes = {x = 0.25, y = 0.3, z = 0.3}},  -- More sprites: https://docs.fivem.net/docs/game-references/markers/
            Blip = { Use = false, colour = 1, size = 1.1, sprite = 311 },
            Exersices = {
                [1]  = { type = 'weightlifting', x = 754.95, y = 3428.88, z = 57.9, heading = 1.56},
                [2]  = { type = 'yoga', x = 748.3, y = 3427.03, z = 57.92, heading = 91.03},
                [3]  = { type = 'pushups', x = 751.19, y = 3431.38, z = 57.9, heading = 22.88},
                [4] = { type = 'running', x = 747.0, y = 3429.99, z = 58.03, heading = 12.29},
                [5] = { type = 'running', x = 749.47, y = 3430.42, z = 58.02, heading = 5.64},
                [6] = { type = 'running', x = 743.89, y = 743.89, z = 58.03, heading = 33.92},
                -- You can add more...
            }
        },
        ['Prison GYM'] = {
            ItemRequired = {Use = false, Item = 'gym_pass', Time = 15, RemoveItem = true},
            Distances = {Marker = 10, Text = 1.0},
            GYMCoords = { x = 1747.8870, y = 2544.0845, z = 43.5854},
            Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 260, g = 40, b = 40, sizes = {x = 0.25, y = 0.3, z = 0.3}},  -- More sprites: https://docs.fivem.net/docs/game-references/markers/
            Blip = { Use = false, colour = 1, size = 1.1, sprite = 311 },
            Exersices = {
                [1]  = { type = 'weightlifting', x = 1746.9486, y = 2543.9863, z = 43.5855, heading = 100.8497},
                [2]  = { type = 'weightlifting', x = 1748.1990, y = 2541.6675, z = 43.5855, heading = 111.0449},
                [3]  = { type = 'pushups', x = 1739.7616, y = 2541.2312, z = 43.5855, heading = 206.0246},
                [4]  = { type = 'pushups', x = 1742.0660, y = 2537.2927, z = 43.5855, heading = 32.1690},
                [5]  = { type = 'situps', x = 1751.0808, y = 2536.8789, z = 43.5855, heading = 24.3098},
                [6]  = { type = 'situps', x = 1752.6005, y = 2537.6794, z = 43.5855, heading = 24.3307},
                -- You can add more...
            }
        },

        -- You can add more GYM's...
    },
    

    -----------------------------------------------------------
    -----------------------| TRANSLATE |-----------------------
    -----------------------------------------------------------

    Text3D = {'To~r~', '~w~press ~w~[~g~E~w~]'}, 

    Notify = {
        [1] = {'Brutal GYM', "You don't have GYM card!", 5000, 'error'},
        [2] = {'Brutal GYM', "The time is up!", 5000, 'warning'},
        [3] = {'Brutal GYM', "You left the GYM!", 5000, 'warning'},
        [4] = {'Brutal GYM', "You can not do this in a vehicle!", 5000, 'error'},
    }
}