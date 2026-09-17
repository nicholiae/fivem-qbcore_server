Config = {}
Config.FireCallCooldown = 0.25 -- in minutes
Config.UnluckyChance = 15
Config.PayAmount = 15000
Config.Debug = false 
Config.DistToTriggerFire = 50
Config.StartLuck = 50
Config.Frequency = 1
Config.Locations = {
    ["duty"] = {
        [1] = vector3(210.91, -1656.99, 29.8), -- DAVIS
        [2] = vector3(1208.37, -1474.58, 34.86), -- 9332
        [3] = vector3(-660.35, -76.99, 38.8), -- CityHall
    },
    ["vehicle"] = {
        [1] = vector4(224.08, -1633.0, 29.26, 47.83), -- DAVIS
        [2] = vector4(1200.13, -1452.4, 34.56, 2.7), -- 9332
        [3] = vector4(-633.63, -72.17, 40.43, 359.59), -- CityHall
    },
    ["helicopter"] = {
        [1] = vector4(190.57, -1669.85, 30.19, 145.64), -- DAVIS
        [2] = vector4(-700.83, -1447.37, 4.76, 49.43), -- DAVIS
        [3] = vector4(1218.48, -1517.92, 34.7, 84.43), -- 9332
        [4] = vector4(-659.58, -78.71, 48.34, 20.55), -- CityHall
    },
    ["boat"] = {
        [1] = vector4(-785.34, -1512.0, -0.04, 290.99), -- DAVIS
        -- [2] = vector4(183.34, -1661.44, 29.8, 239.46), -- 9332
        -- [3] = vector4(1198.45, -1548.8, 39.4, 12.04), -- FS7
    },
    ["armory"] = {
        -- [1] = vector3(203.81, -1642.33, 29.8), -- DAVIS
        -- [2] = vector3(198.71, -1649.07, 29.8), -- DAVIS
        -- [3] = vector3(1193.86, -1476.25, 34.86), -- FS7
    },
    ["stash"] = {
        [1] = vector3(197.81, -1651.35, 29.8), -- DAVIS
        [2] = vector3(1194.69, -1478.84, 34.86), -- 9332
        [3] = vector3(-619.38, -82.91, 41.2), -- CityHall
    },
    ["stations"] = {
        -- [1] = {label = "Fire Department HQ", coords = vector4(-660.42, -77.13, 38.8, 15.25)},
        [1] = {label = "Davis Fire Department", coords = vector4(205.51, -1652.66, 29.8, 44.95)},
        [2] = {label = "ElRancho Fire Department", coords = vector4(1200.13, -1452.4, 34.56, 2.7)},
        [3] = {label = "CityHall Fire Department", coords = vector4(-660.35, -76.99, 38.8, 207.58)}
    }
}

Config.AuthorizedVehicles = {
	-- Grade 0
	[0] = {
		["firetruk"] = "Fire Truck",
		["arrowladder"] = "Ladder Truck",
		["fpiupov"] = "Fire Rescue",
		["tahoepov"] = "Fire Tahoe",
		["fwild"] = "Type 3",
	},
	-- Grade 1
	[1] = {
		["firetruk"] = "Fire Truck",
		["arrowladder"] = "Ladder Truck",
		["fpiupov"] = "Fire Rescue",
		["tahoepov"] = "Fire Tahoe",
		["fwild"] = "Type 3",
	},
	-- Grade 2
	[2] = {
		["firetruk"] = "Fire Truck",
		["arrowladder"] = "Ladder Truck",
		["fpiupov"] = "Fire Rescue",
		["tahoepov"] = "Fire Tahoe",
		["fwild"] = "Type 3",
	},
	-- Grade 3
	[3] = {
		["firetruk"] = "Fire Truck",
		["arrowladder"] = "Ladder Truck",
		["fpiupov"] = "Fire Rescue",
		["fordambo"] = "Fire Rescue Box",
		["tahoepov"] = "Fire Tahoe",
		["fwild"] = "Type 3",
	},
	-- Grade 4
	[4] = {
		["firetruk"] = "Fire Truck",
		["arrowladder"] = "Ladder Truck",
		["enforcerta"] = "Enforcer Truck",
		["fordambo"] = "Fire Rescue Box",
		["tahoepov"] = "Fire Tahoe",
		["fwild"] = "Type 3",
	},
    -- Grade 5
	[5] = {
		["firetruk"] = "Fire Truck",
		["arrowladder"] = "Ladder Truck",
		["f250pov"] = "F250 Truck",
		["fordambo"] = "Fire Rescue Box",
		["tahoepov"] = "Fire Tahoe",
		["enforcerta"] = "Enforcer Truck",
		["fpispov"] = "Command Responce",
		["fwild"] = "Type 3",
	},
    -- Grade 6
	[6] = {
		["firetruk"] = "Fire Truck",
		["arrowladder"] = "Ladder Truck",
		["enforcerta"] = "Enforcer Truck",
		["tahoepov"] = "Fire Tahoe",
		["fordambo"] = "Fire Rescue Box",
		["f250pov"] = "F250 Truck",
		["fpispov"] = "Command Responce",
		["brushram"] = "Type 4 #3",
		["fwild"] = "Type 3",
	}
}

Config.Helicopter = "safr412"
Config.Boat = "LARGEBOAT"

Config.RandomFireLocations = {
	
	[1] = {
		['name'] = "Oilfields",
		['location'] = vector3(1562.84, -1683.77, 88.23), -- oil fields
	},
	[2] = {
		['name'] = "Church",
		['location'] = vector3(-1710.91, -268.49, 51.72), -- church
	},
	[3] = {
		['name'] = "Observatory",
		['location'] = vector3(-384.7, 1159.7, 325.28), -- observatory
	},
	[4] = {
		['name'] = "Pawn Shop",
		['location'] = vector3(419.81, 317.83, 103.08), -- Pawn Shop
	},
	[5] = {
		['name'] = "Mirror Park",
		['location'] = vector3(1143.17, -534.63, 64.23), -- Mirror Park
	},
	[6] = {
		['name'] = "Industrial Yard",
		['location'] = vector3(837.88, -2190.78, 31.04), -- Industrial Yard
	},
	[7] = {
		['name'] = "Opium Hotel",
		['location'] = vector3(-723.63, -2336.19, 14.94), -- Opium Hotel
	},
	[8] = {
		['name'] = "Pier",
		['location'] = vector3(-1741.29, -1103.47, 13.02), -- Pier
	},
	[9] = {
		['name'] = "1130 VineWood Apartments",
		['location'] = vector3(246.18, -91.99, 74.54), -- 1130 VineWood Apartments
	},
	[10] = {
		['name'] = "Global Oil",
		['location'] = vector3(620.4, 264.36, 103.28), -- Global Oil
	}
	
}


Config.Items = {
    
}

Config.VehicleSettings = {
    ["car1"] = { -- Model name
        ["extras"] = {
            ["1"] = false, -- on/off
            ["2"] = true,
            ["3"] = true,
            ["4"] = true,
            ["5"] = true,
            ["6"] = true,
            ["7"] = true,
            ["8"] = true,
            ["9"] = true,
            ["10"] = true,
            ["11"] = true,
            ["12"] = true,
        }
    },
    ["car2"] = {
        ["extras"] = {
            ["1"] = false,
            ["2"] = true,
            ["3"] = true,
            ["4"] = true,
            ["5"] = true,
            ["6"] = true,
            ["7"] = true,
            ["8"] = true,
            ["9"] = true,
            ["10"] = true,
            ["11"] = true,
            ["12"] = true,
        }
    }
}
