Config = {}
Config.UsingTarget = GetConvar('UseTarget', 'false') == 'true'
Config.Commission = 0.10                              -- Percent that goes to sales person from a full car sale 10%
Config.FinanceCommission = 0.05                       -- Percent that goes to sales person from a finance sale 5%
Config.PaymentWarning = 10                            -- time in minutes that player has to make payment before repo
Config.PaymentInterval = 24                           -- time in hours between payment being due
Config.MinimumDown = 10                               -- minimum percentage allowed down
Config.MaximumPayments = 24                           -- maximum payments allowed
Config.PreventFinanceSelling = true                  -- allow/prevent players from using /transfervehicle if financed
Config.FilterByMake = false                           -- adds a make list before selecting category in shops
Config.SortAlphabetically = true                      -- will sort make, category, and vehicle selection menus alphabetically
Config.HideCategorySelectForOne = true                -- will hide the category selection menu if a shop only sells one category of vehicle or a make has only one category
Config.Shops = {
    ['tuners'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = {      --polygon that surrounds the shop
                vector2(197.36, -3064.72),
                vector2(199.67, -2985.29),
                vector2(112.76, -2984.56),
                vector2(111.16, -3082.9)
            },
            ['minZ'] = 0.0,                                         -- min height of the shop zone 
            ['maxZ'] = 10.0,                                         -- max height of the shop zone
            ['size'] = 4.0                                          -- size of the vehicles zones
        },
        ['Job'] = 'none',                                            -- Name of job or none
        ['ShopLabel'] = "Tuner's",                			 -- Blip name
        ['showBlip'] = false,                                         -- true or false
        ['blipSprite'] = 326,                                        -- Blip sprite
        ['blipColor'] = 3,                                           -- Blip color
        ['TestDriveTimeLimit'] = 0.5,                                -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(140.49, -3026.79, 7.04),             -- Blip Location
        ['ReturnLocation'] = vector3(188.3, -3026.81, 5.81),       -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(161.78, -3034.49, 6.7, 266.93),   -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(188.3, -3026.81, 5.81, 8.73), -- Spawn location for test drive
        ['FinanceZone'] = vector3(148.06, -3014.8, 7.04),          -- Where the finance menu is located
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(145.04, -3030.83, 7.04, 1.72), -- where the vehicle will spawn on display
                defaultVehicle = 'sjbbox',                       -- Default display vehicle
                chosenVehicle = 'sjbbox',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(135.97, -3030.07, 7.04, 175.31),
                defaultVehicle = 'srtday20',
                chosenVehicle = 'srtday20'
            }
        },
    },
    ['rbikes'] = {
        ['Type'] = 'managed', -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = {      --polygon that surrounds the shop
                vector2(-262.35, 6207.86),
                vector2(-229.93, 6175.79),
                vector2(-197.89, 6208.26),
                vector2(-233.31, 6243.1)
            },
            ['minZ'] = 30.0,                                         -- min height of the shop zone 
            ['maxZ'] = 33.0,                                         -- max height of the shop zone
            ['size'] = 1.75                                          -- size of the vehicles zones
        },
        ['Job'] = 'bikes',                                            -- Name of job or none
        -- ['Job'] = 'none',                                            -- Name of job or none
        ['ShopLabel'] = 'Ridiculous Rides',                			 -- Blip name
        ['showBlip'] = false,                                         -- true or false
        ['blipSprite'] = 326,                                        -- Blip sprite
        ['blipColor'] = 3,                                           -- Blip color
        ['TestDriveTimeLimit'] = 0.5,                                -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-239.65, 6216.23, 31.94),             -- Blip Location
        ['ReturnLocation'] = vector3(-214.18, 6214.57, 31.49),       -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-229.66, 6198.89, 31.49, 135.62),   -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-254.26, 6205.41, 31.49, 46.25), -- Spawn location for test drive
        ['FinanceZone'] = vector3(-241.7, 6214.24, 31.94),          -- Where the finance menu is located
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-236.0, 6213.22, 31.99, 72.91), -- where the vehicle will spawn on display
                defaultVehicle = 'esrmzo',                       -- Default display vehicle
                chosenVehicle = 'esrmzo',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-243.01, 6211.66, 31.99, 343.88),
                defaultVehicle = 'vrodwidowape',
                chosenVehicle = 'vrodwidowape'
            },
            [3] = {
                coords = vector4(-245.49, 6218.05, 31.98, 195.73),
                defaultVehicle = 'rr01',
                chosenVehicle = 'rr01'
            },
            [4] = {
                coords = vector4(-243.28, 6220.48, 31.99, 190.45),
                defaultVehicle = 'km1000rr',
                chosenVehicle = 'km1000rr'
            }
        },
    },
    -- ['trailersrus'] = {
        -- ['Type'] = 'free-use', -- no player interaction is required to purchase a car
        -- ['Zone'] = {
            -- ['Shape'] = {      --polygon that surrounds the shop
                -- vector2(-564.61, -1082.92),
                -- vector2(-627.59, -1081.27),
                -- vector2(-623.99, -1164.89),
                -- vector2(-555.82, -1167.45)
			-- },
			
            -- ['minZ'] = 22.0,                                         -- min height of the shop zone
            -- ['maxZ'] = 28.0,                                         -- max height of the shop zone
            -- ['size'] = 3.75                                          -- size of the vehicles zones
			
		-- },
        -- ['Job'] = 'none',                                            -- Name of job or none
        -- ['ShopLabel'] = 'Tred On These Trailers',                 -- Blip name
        -- ['showBlip'] = true,                                         -- true or false
        -- ['blipSprite'] = 326,                                        -- Blip sprite
        -- ['blipColor'] = 3,                                           -- Blip color
        -- ['TestDriveTimeLimit'] = 0.5,                                -- Time in minutes until the vehicle gets deleted
        -- ['Location'] = vector3(-586.86, -1125.11, 27.58),             -- Blip Location
        -- ['ReturnLocation'] = vector3(-587.47, -1127.67, 22.18),       -- Location to return vehicle, only enables if the vehicleshop has a job owned
        -- ['VehicleSpawn'] = vector4(-599.8, -1088.56, 22.18, 230.5),   -- Spawn location when vehicle is bought
        -- ['TestDriveSpawn'] = vector4(-566.4, -1095.33, 22.18, 175.69), -- Spawn location for test drive
        -- ['FinanceZone'] = vector3(-613.91, -1118.18, 22.33),          -- Where the finance menu is located
        -- ['ShowroomVehicles'] = {
            -- [1] = {
                -- coords = vector4(-614.59, -1107.66, 22.33, 182.14), -- where the vehicle will spawn on display
                -- defaultVehicle = 'tr2',                       -- Default display vehicle
                -- chosenVehicle = 'tr2',                        -- Same as default but is dynamically changed when swapping vehicles
            -- },
            -- [2] = {
                -- coords = vector4(-614.07, -1136.39, 22.33, 359.74),
                -- defaultVehicle = 'boattrailer',
                -- chosenVehicle = 'boattrailer'
            -- },
            -- [3] = {
                -- coords = vector4(-604.95, -1131.38, 22.33, 176.06),
                -- defaultVehicle = 'trailersmall',
                -- chosenVehicle = 'trailersmall'
            -- }
        -- },	
    -- },
    ['pdm'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = {      --polygon that surrounds the shop
                vector2(-56.727394104004, -1086.2325439453),
                vector2(-60.612808227539, -1096.7795410156),
                vector2(-58.26834487915, -1100.572265625),
                vector2(-35.927803039551, -1109.0034179688),
                vector2(-34.427627563477, -1108.5111083984),
                vector2(-33.9, -1108.96),
                vector2(-35.95, -1114.32),
                vector2(-31.58, -1115.21),
                vector2(-27.48, -1103.42),
                vector2(-33.342102050781, -1101.0377197266),
                vector2(-31.292987823486, -1095.3717041016)
            },
            ['minZ'] = 25.0,                                         -- min height of the shop zone
            ['maxZ'] = 28.0,                                         -- max height of the shop zone
            ['size'] = 2.75                                          -- size of the vehicles zones
        },
        ['Job'] = 'none',                                            -- Name of job or none
        ['ShopLabel'] = 'Premium Deluxe Motorsport',                 -- Blip name
        ['showBlip'] = true,                                         -- true or false
        ['blipSprite'] = 326,                                        -- Blip sprite
        ['blipColor'] = 3,                                           -- Blip color
        ['TestDriveTimeLimit'] = 0.5,                                -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-45.67, -1098.34, 26.42),             -- Blip Location
        ['ReturnLocation'] = vector3(-44.74, -1082.58, 26.68),       -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-56.79, -1109.85, 26.43, 71.5),   -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-56.79, -1109.85, 26.43, 71.5), -- Spawn location for test drive
        ['FinanceZone'] = vector3(-29.53, -1103.67, 26.42),          -- Where the finance menu is located
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-45.65, -1093.66, 25.44, 69.5), -- where the vehicle will spawn on display
                defaultVehicle = 'ardent',                       -- Default display vehicle
                chosenVehicle = 'ardent',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-48.27, -1101.86, 25.44, 294.5),
                defaultVehicle = 'schafter2',
                chosenVehicle = 'schafter2'
            },
            [3] = {
                coords = vector4(-39.6, -1096.01, 25.44, 66.5),
                defaultVehicle = 'coquette',
                chosenVehicle = 'coquette'
            },
            [4] = {
                coords = vector4(-51.21, -1096.77, 25.44, 254.5),
                defaultVehicle = 'vigero',
                chosenVehicle = 'vigero'
            },
            [5] = {
                coords = vector4(-40.18, -1104.13, 25.44, 338.5),
                defaultVehicle = 'rhapsody',
                chosenVehicle = 'rhapsody'
            },
            [6] = {
                coords = vector4(-43.31, -1099.02, 25.44, 52.5),
                defaultVehicle = 'bati',
                chosenVehicle = 'bati'
            },
            [7] = {
                coords = vector4(-50.66, -1093.05, 25.44, 222.5),
                defaultVehicle = 'bati',
                chosenVehicle = 'bati'
            },
            [8] = {
                coords = vector4(-44.28, -1102.47, 25.44, 298.5),
                defaultVehicle = 'bati',
                chosenVehicle = 'bati'
            }
        },
    },
    ['luxury'] = {
        ['Type'] = 'free-use', -- meaning a real player has to sell the car
        ['Zone'] = {
            ['Shape'] = {
                vector2(-1260.6973876953, -349.21334838867),
                vector2(-1268.6248779297, -352.87365722656),
                vector2(-1274.1533203125, -358.29794311523),
                vector2(-1273.8425292969, -362.73715209961),
                vector2(-1270.5701904297, -368.6716003418),
                vector2(-1266.0561523438, -375.14080810547),
                vector2(-1244.3684082031, -362.70278930664),
                vector2(-1249.8704833984, -352.03326416016),
                vector2(-1252.9503173828, -345.85726928711)
            },
            ['minZ'] = 36.646457672119,
            ['maxZ'] = 37.516143798828,
            ['size'] = 3.75    -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Self Serve Luxery Rides',
        ['showBlip'] = false,   -- true or false
        ['blipSprite'] = 326,  -- Blip sprite
        ['blipColor'] = 3,     -- Blip color
        ['TestDriveTimeLimit'] = 0.5,
        ['Location'] = vector3(-1255.6, -361.16, 36.91),
        ['ReturnLocation'] = vector3(-1231.46, -349.86, 37.33),
        ['VehicleSpawn'] = vector4(-1231.46, -349.86, 37.33, 26.61),
        ['TestDriveSpawn'] = vector4(-1232.81, -347.99, 37.33, 23.28), -- Spawn location for test drive
        ['FinanceZone'] = vector3(-1256.18, -368.23, 36.91),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-1265.31, -354.44, 35.91, 205.08),
                defaultVehicle = 'italirsx',
                chosenVehicle = 'italirsx'
            },
            [2] = {
                coords = vector4(-1270.06, -358.55, 35.91, 247.08),
                defaultVehicle = 'italigtb',
                chosenVehicle = 'italigtb'
            },
            [3] = {
                coords = vector4(-1269.21, -365.03, 35.91, 297.12),
                defaultVehicle = 'nero',
                chosenVehicle = 'nero'
            },
            [4] = {
                coords = vector4(-1252.07, -364.2, 35.91, 56.44),
                defaultVehicle = 'bati',
                chosenVehicle = 'bati'
            },
            [5] = {
                coords = vector4(-1255.49, -365.91, 35.91, 55.63),
                defaultVehicle = 'carbonrs',
                chosenVehicle = 'carbonrs'
            },
            [6] = {
                coords = vector4(-1249.21, -362.97, 35.91, 53.24),
                defaultVehicle = 'hexer',
                chosenVehicle = 'hexer'
            },
        }
    },
    ['customs'] = {
        ['Type'] = 'managed', -- meaning a real player has to sell the car
        ['Zone'] = {
            ['Shape'] = {
                vector2(-402.23, -107.54),
                vector2(-371.59, -70.34),
                vector2(-298.72, -96.44),
                vector2(-324.58, -176.14),
                vector2(-362.51, -188.34),
                vector2(-389.83, -133.34)
            },
            ['minZ'] = 35.646457672119,
            ['maxZ'] = 64.516143798828,
            ['size'] = 3.25    -- size of the vehicles zones
        },
        ['Job'] = 'customs', -- Name of job or none
        ['ShopLabel'] = 'Smoke N Motors',
        ['showBlip'] = false,   -- true or false
        ['blipSprite'] = 326,  -- Blip sprite
        ['blipColor'] = 3,     -- Blip color
        ['TestDriveTimeLimit'] = 1.5,
        ['Location'] = vector3(-337.84, -121.23, 39.01),
        ['ReturnLocation'] = vector3(-357.08, -118.51, 38.72),
        ['VehicleSpawn'] = vector4(-350.99, -79.06, 45.67, 67.21),
        ['TestDriveSpawn'] = vector4(-333.42, -106.27, 45.8, 65.37), -- Spawn location for test drive
        ['FinanceZone'] = vector3(-339.52, -155.53, 44.59),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-342.07, -128.79, 46.05, 99.38),
                defaultVehicle = 'italirsx',
                chosenVehicle = 'italirsx'
            },
            [2] = {
                coords = vector4(-336.2, -113.16, 46.05, 82.18),
                defaultVehicle = 'italigtb',
                chosenVehicle = 'italigtb'
            },
            [3] = {
                coords = vector4(-326.02, -116.99, 46.5, 335.24),
                defaultVehicle = 'nero',
                chosenVehicle = 'nero'
            },
            [4] = {
                coords = vector4(-332.08, -133.1, 46.5, 160.69),
                defaultVehicle = 'bati',
                chosenVehicle = 'bati'
            },
            -- [5] = {
                -- coords = vector4(-321.3, -128.95, 39.02, 69.67),
                -- defaultVehicle = 'carbonrs',
                -- chosenVehicle = 'carbonrs'
            -- },
            -- [6] = {
                -- coords = vector4(-352.71, -89.69, 39.02, 71.75),
                -- defaultVehicle = 'hexer',
                -- chosenVehicle = 'hexer'
            -- },
        }
    },                         -- Add your next table under this comma
    ['boats'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a vehicle
        ['Zone'] = {
            ['Shape'] = {      --polygon that surrounds the shop
                vector2(-729.39, -1315.84),
                vector2(-766.81, -1360.11),
                vector2(-754.21, -1371.49),
                vector2(-716.94, -1326.88)
            },
            ['minZ'] = 0.0,                                            -- min height of the shop zone
            ['maxZ'] = 5.0,                                            -- max height of the shop zone
            ['size'] = 6.2                                             -- size of the vehicles zones
        },
        ['Job'] = 'none',                                              -- Name of job or none
        ['ShopLabel'] = 'Marina Shop',                                 -- Blip name
        ['showBlip'] = true,                                           -- true or false
        ['blipSprite'] = 410,                                          -- Blip sprite
        ['blipColor'] = 3,                                             -- Blip color
        ['TestDriveTimeLimit'] = 0.5,                                  -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-738.25, -1334.38, 1.6),                -- Blip Location
        ['ReturnLocation'] = vector3(-714.34, -1343.31, 0.0),          -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-727.87, -1353.1, -0.17, 137.09),   -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-722.23, -1351.98, 0.14, 135.33), -- Spawn location for test drive
        ['FinanceZone'] = vector3(-729.86, -1319.13, 1.6),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-727.05, -1326.59, 0.00, 229.5), -- where the vehicle will spawn on display
                defaultVehicle = 'seashark',                      -- Default display vehicle
                chosenVehicle = 'seashark'                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-732.84, -1333.5, -0.50, 229.5),
                defaultVehicle = 'dinghy',
                chosenVehicle = 'dinghy'
            },
            [3] = {
                coords = vector4(-737.84, -1340.83, -0.50, 229.5),
                defaultVehicle = 'speeder',
                chosenVehicle = 'speeder'
            },
            [4] = {
                coords = vector4(-741.53, -1349.7, -2.00, 229.5),
                defaultVehicle = 'marquis',
                chosenVehicle = 'marquis'
            },
        },
    },
    ['air'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a vehicle
        ['Zone'] = {
            ['Shape'] = {      --polygon that surrounds the shop
                vector2(-1607.58, -3141.7),
                vector2(-1672.54, -3103.87),
                vector2(-1703.49, -3158.02),
                vector2(-1646.03, -3190.84)
            },
            ['minZ'] = 12.99,                                            -- min height of the shop zone
            ['maxZ'] = 16.99,                                            -- max height of the shop zone
            ['size'] = 7.0,                                              -- size of the vehicles zones
        },
        ['Job'] = 'none',                                                -- Name of job or none
        ['ShopLabel'] = 'Air Shop',                                      -- Blip name
        ['showBlip'] = true,                                             -- true or false
        ['blipSprite'] = 251,                                            -- Blip sprite
        ['blipColor'] = 3,                                               -- Blip color
        ['TestDriveTimeLimit'] = 0.5,                                    -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-1652.76, -3143.4, 13.99),                -- Blip Location
        ['ReturnLocation'] = vector3(-1628.44, -3104.7, 13.94),          -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-1452.13, -3166.93, 13.94, 330.66),    -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-1625.19, -3103.47, 13.94, 330.28), -- Spawn location for test drive
        ['FinanceZone'] = vector3(-1619.52, -3152.64, 14.0),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-1651.36, -3162.66, 12.99, 346.89), -- where the vehicle will spawn on display
                defaultVehicle = 'volatus',                          -- Default display vehicle
                chosenVehicle = 'volatus'                            -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-1668.53, -3152.56, 12.99, 303.22),
                defaultVehicle = 'luxor2',
                chosenVehicle = 'luxor2'
            },
            [3] = {
                coords = vector4(-1632.02, -3144.48, 12.99, 31.08),
                defaultVehicle = 'nimbus',
                chosenVehicle = 'nimbus'
            },
            [4] = {
                coords = vector4(-1663.74, -3126.32, 12.99, 275.03),
                defaultVehicle = 'frogger',
                chosenVehicle = 'frogger'
            },
        },
    },
    ['truck'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = {      --polygon that surrounds the shop
                vector2(856.91046142578, -1181.4660644532),
                vector2(922.666015625, -1178.8934326172),
                vector2(921.7074584961, -1153.4362792968),
                vector2(894.02233886718, -1153.185180664),
                vector2(894.08135986328, -1154.2734375),
                vector2(887.91284179688, -1154.3431396484),
                vector2(887.76403808594, -1155.2556152344),
                vector2(872.04608154296, -1155.3488769532),
                vector2(872.05163574218, -1139.1412353516),
                vector2(857.6060180664, -1139.501953125)
            },
            ['minZ'] = 22.0,                                         -- min height of the shop zone
            ['maxZ'] = 28.0,                                         -- max height of the shop zone
            ['size'] = 5.75                                          -- size of the vehicles zones
        },
        ['Job'] = 'none',                                            -- Name of job or none
        ['ShopLabel'] = 'Truck Motor Shop',                          -- Blip name
        ['showBlip'] = true,                                         -- true or false
        ['blipSprite'] = 477,                                        -- Blip sprite
        ['blipColor'] = 2,                                           -- Blip color
        ['TestDriveTimeLimit'] = 0.5,                                -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(900.47, -1155.74, 25.16),             -- Blip Location
        ['ReturnLocation'] = vector3(900.47, -1155.74, 25.16),       -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(909.35, -1181.58, 25.55, 177.57), -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(867.65, -1192.4, 25.37, 95.72), -- Spawn location for test drive
        ['FinanceZone'] = vector3(900.46, -1154.86, 25.16),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(890.84, -1170.92, 25.08, 269.58), -- where the vehicle will spawn on display
                defaultVehicle = 'hauler',                         -- Default display vehicle
                chosenVehicle = 'hauler',                          -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(878.45, -1171.04, 25.05, 273.08),
                defaultVehicle = 'phantom',
                chosenVehicle = 'phantom'
            },
            [3] = {
                coords = vector4(880.44, -1163.59, 24.87, 273.08),
                defaultVehicle = 'mule',
                chosenVehicle = 'mule'
            },
            [4] = {
                coords = vector4(896.95, -1162.62, 24.98, 273.08),
                defaultVehicle = 'mixer',
                chosenVehicle = 'mixer'
            },
        },
    },
}
