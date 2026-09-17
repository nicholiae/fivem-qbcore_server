Config = {}

-- Fuel script
Config.FuelScript = "myFuel" -- Change this to your actual fuel script name (myFuel, LegacyFuel, etc.)

Config.BusSpawnRadius = 75.0

-- Vehicle settings
Config.vehicleHash = -713569950 -- name of bus as it is in QB-Core/shared/vehicles.lua (Bus)
Config.driver = -573920724 -- name of ped driver (default civilian ped)

-- Payment settings
Config.Price = 0 -- Price per kilometer default 0 free service
Config.PaymentType = "cash" -- Cash or bank (not currently used but available for future expansion)

-- Driving settings
Config.Speed = 50.0 -- speed
Config.DriveMode = 786597 -- dont change unless you know what you are doing.

-- Multi-player settings
Config.MultiPlayerEnabled = true -- Enable multi-player bus trips
Config.ProximityRadius = 15.0 -- Distance to detect nearby players (in meters)
Config.MaxPassengers = 4 -- Maximum passengers per bus (excluding driver)
Config.RequireInvitation = false -- False = auto-invite nearby players, True = require host approval

-- Call locations
Config.Locations = {
	['City Hall'] = {
		callSpot = vector4(-527.4, -265.13, 35.43, 199.6),
		parkSpot = vector4(-526.39, -268.23, 35.27, 113.12),
		spawnSpot = vector4(-337.87, -184.22, 38.72, 105.42)
	},
	['Alta Street'] = {
		callSpot = vector4(-175.52, -817.6, 31.16, 255.97),
		parkSpot = vector4(-172.3, -820.7, 31.08, 159.59),
		spawnSpot = vector4(-197.57, -696.67, 34.03, 246.72)
	},
	['Down Town Mart'] = {
		callSpot = vector4(-35.73, -1723.32, 29.29, 33.37),
		parkSpot = vector4(-37.94, -1720.66, 29.23, 288.67),
		spawnSpot = vector4(-215.15, -1817.23, 29.91, 298.37)
	},
	['Air Port'] = {
		callSpot = vector4(-1037.91, -2737.93, 20.17, 325.2),
		parkSpot = vector4(-1028.54, -2731.52, 19.5, 240.04),
		spawnSpot = vector4(-1050.79, -2549.76, 20.17, 151.49)
	},
	['Stadium'] = {
		callSpot = vector4(-246.99, -2059.96, 27.1, 201.57),
		parkSpot = vector4(-231.15, -2062.85, 26.97, 140.39),
		spawnSpot = vector4(-171.82, -2005.37, 24.61, 81.69)
	},
	['Vesp Beach'] = {
		callSpot = vector4(-1169.78, -1475.1, 3.73, 124.17),
		parkSpot = vector4(-1165.94, -1472.56, 3.71, 216.22),
		spawnSpot = vector4(-1197.27, -1357.09, 4.76, 115.63)
	},
	['Casino'] = {
		callSpot = vector4(906.48, 63.72, 78.42, 56.61),
		parkSpot = vector4(902.41, 65.46, 78.29, 320.0),
		spawnSpot = vector4(884.2, 19.25, 78.87, 54.19)
	},
	['Penitentiary'] = {
		callSpot = vector4(1940.91, 2620.4, 45.33, 303.52),
		parkSpot = vector4(1942.86, 2615.32, 45.5, 119.92),
		spawnSpot = vector4(1921.67, 2602.22, 46.25, 276.68)
	},
	['Sandy Shores'] = {
		callSpot = vector4(1958.9, 3732.98, 31.56, 207.42),
		parkSpot = vector4(1967.73, 3732.25, 31.69, 118.44),
		spawnSpot = vector4(1880.44, 3675.78, 33.54, 299.47)
	},
	['Paleto'] = {
		callSpot = vector4(-148.93, 6209.98, 30.66, 235.23),
		parkSpot = vector4(-154.09, 6210.44, 30.55, 309.51),
		spawnSpot = vector4(-248.31, 6119.4, 31.23, 309.95)
	},
	
}

-- Debug settings
Config.Debug = false -- Set to true to enable debug printing to console