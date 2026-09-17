Config = {}
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'
Config.MaxSpikes = 5
Config.HandCuffItem = 'handcuffs'
Config.BreakCuffItem = 'cuffpick'
Config.LicenseRank = 3
Config.ArmoryWhitelist = {}
Config.WhitelistedVehicles = {}
Config.PoliceHelicopter = 'swatec135'
Config.PoliceHelicopterArmed = 'buzzard'
Config.FuelResource = 'myFuel' -- supports any that has a GetFuel() and SetFuel() export
Config.Boat = 'policeboat'
Config.AmmoLabels = {
    AMMO_PISTOL = '9x19mm parabellum bullet',
    AMMO_SMG = '9x19mm parabellum bullet',
    AMMO_RIFLE = '7.62x39mm bullet',
    AMMO_MG = '7.92x57mm mauser bullet',
    AMMO_SHOTGUN = '12-gauge bullet',
    AMMO_SNIPER = 'Large caliber bullet',
}


Config.CarItems = {
}

Config.Objects = {
    cone = { model = `prop_roadcone02a`, freeze = false },
    barrier = { model = `prop_barrier_work06a`, freeze = true },
    roadsign = { model = `prop_snow_sign_road_06g`, freeze = true },
    tent = { model = `prop_gazebo_03`, freeze = true },
    light = { model = `prop_worklight_03b`, freeze = true },
}

Config.Locations = {
    duty = {
        vector3(440.69, -979.32, 31.03),
        -- vector3(-449.811, 6012.909, 31.815),
        vector3(-449.92, 6002.61, 31.39), -- new paleto
		vector3(1851.71, 3691.34, 34.27),
    },
    vehicle = {
        vector4(445.36, -1022.61, 28.86, 98.88),
        vector4(443.77, -996.01, 21.34, 89.7),
        -- vector4(-455.39, 6002.02, 31.34, 87.93),
		vector4(-445.69, 5979.91, 31.39, 140.5), -- new paleto
        vector4(1811.38, 3684.67, 34.22, 119.53),
    },
    stash = {
        vector3(424.95, -978.38, 21.56),
		vector3(-464.88, 6008.76, 31.39), -- new paleto
    },
    impound = {
        vector3(433.69, -1014.6, 28.96),
        -- vector3(-436.14, 5982.63, 31.34),
        vector3(-471.13, 5970.37, 31.31), -- new paleto
        vector3(1850.86, 3673.89, 33.77),
    },
    helicopter = {
		vector4(439.75, -989.65, 44.95, 263.6),
        -- vector4(-475.43, 5988.353, 31.716, 31.34),
        vector4(-455.51, 6000.03, 39.35, 215.72), -- new paleto
    },
    helicopter2 = {
        vector4(480.11, -986.65, 44.95, 173.3),
    },
    boat = {
        vector4(-785.34, -1512.0, -0.04, 290.99), -- DAVIS
        -- [2] = vector4(183.34, -1661.44, 29.8, 239.46), -- DAVIS
        -- [3] = vector4(1198.45, -1548.8, 39.4, 12.04), -- FS7
    },
    trash = {
        vector3(414.29, -975.51, 21.56),
        vector3(1852.87, 3692.01, 34.27),
        vector3(-462.8, 6016.81, 31.39), -- new paleto
    },
    fingerprint = {
        vector3(482.56, -985.45, 21.56),
		vector3(1855.05, 3688.81, 34.27),
		vector3(-450.53, 5983.25, 31.39), -- new paleto
    },
    evidence = {
		vector3(-444.15, 5997.12, 31.39), -- new paleto
        vector3(433.1, -974.63, 21.56),
        vector3(435.91, -980.1, 31.03),
        vector3(433.13, -976.34, 31.03),
		vector3(1848.94, 3688.02, 34.27),
    },
    stations = {
        { label = 'Police Station',        	coords = vector4(436.76, -989.78, 31.03, 83.52) },
        { label = 'Police Station',         coords = vector4(1845.903, 2585.873, 45.672, 272.249) },
        { label = 'Police Station', 		coords = vector4(-451.55, 6014.25, 31.716, 223.81) },
        { label = 'Police Station', 		coords = vector4(1852.69, 3688.85, 34.27, 234.07) },
        { label = 'Police Station', 		coords = vector4(-455.51, 6000.03, 39.35, 215.72) },
    },
}

Config.SecurityCameras = {
    hideradar = false,
    cameras = {
        [1] = { label = 'Pacific Bank CAM#1', coords = vector3(257.45, 210.07, 109.08), r = { x = -25.0, y = 0.0, z = 28.05 }, canRotate = false, isOnline = true },
        [2] = { label = 'Pacific Bank CAM#2', coords = vector3(232.86, 221.46, 107.83), r = { x = -25.0, y = 0.0, z = -140.91 }, canRotate = false, isOnline = true },
        [3] = { label = 'Pacific Bank CAM#3', coords = vector3(252.27, 225.52, 103.99), r = { x = -35.0, y = 0.0, z = -74.87 }, canRotate = false, isOnline = true },
        [4] = { label = 'Limited Ltd Grove St. CAM#1', coords = vector3(-53.1433, -1746.714, 31.546), r = { x = -35.0, y = 0.0, z = -168.9182 }, canRotate = false, isOnline = true },
        [5] = { label = "Rob's Liqour Prosperity St. CAM#1", coords = vector3(-1482.9, -380.463, 42.363), r = { x = -35.0, y = 0.0, z = 79.53281 }, canRotate = false, isOnline = true },
        [6] = { label = "Rob's Liqour San Andreas Ave. CAM#1", coords = vector3(-1224.874, -911.094, 14.401), r = { x = -35.0, y = 0.0, z = -6.778894 }, canRotate = false, isOnline = true },
        [7] = { label = 'Limited Ltd Ginger St. CAM#1', coords = vector3(-718.153, -909.211, 21.49), r = { x = -35.0, y = 0.0, z = -137.1431 }, canRotate = false, isOnline = true },
        [8] = { label = '24/7 Supermarkt Innocence Blvd. CAM#1', coords = vector3(23.885, -1342.441, 31.672), r = { x = -35.0, y = 0.0, z = -142.9191 }, canRotate = false, isOnline = true },
        [9] = { label = "Rob's Liqour El Rancho Blvd. CAM#1", coords = vector3(1133.024, -978.712, 48.515), r = { x = -35.0, y = 0.0, z = -137.302 }, canRotate = false, isOnline = true },
        [10] = { label = 'Limited Ltd West Mirror Drive CAM#1', coords = vector3(1151.93, -320.389, 71.33), r = { x = -35.0, y = 0.0, z = -119.4468 }, canRotate = false, isOnline = true },
        [11] = { label = '24/7 Supermarkt Clinton Ave CAM#1', coords = vector3(383.402, 328.915, 105.541), r = { x = -35.0, y = 0.0, z = 118.585 }, canRotate = false, isOnline = true },
        [12] = { label = 'Limited Ltd Banham Canyon Dr CAM#1', coords = vector3(-1832.057, 789.389, 140.436), r = { x = -35.0, y = 0.0, z = -91.481 }, canRotate = false, isOnline = true },
        [13] = { label = "Rob's Liqour Great Ocean Hwy CAM#1", coords = vector3(-2966.15, 387.067, 17.393), r = { x = -35.0, y = 0.0, z = 32.92229 }, canRotate = false, isOnline = true },
        [14] = { label = '24/7 Supermarkt Ineseno Road CAM#1', coords = vector3(-3046.749, 592.491, 9.808), r = { x = -35.0, y = 0.0, z = -116.673 }, canRotate = false, isOnline = true },
        [15] = { label = '24/7 Supermarkt Barbareno Rd. CAM#1', coords = vector3(-3246.489, 1010.408, 14.705), r = { x = -35.0, y = 0.0, z = -135.2151 }, canRotate = false, isOnline = true },
        [16] = { label = '24/7 Supermarkt Route 68 CAM#1', coords = vector3(539.773, 2664.904, 44.056), r = { x = -35.0, y = 0.0, z = -42.947 }, canRotate = false, isOnline = true },
        [17] = { label = "Rob's Liqour Route 68 CAM#1", coords = vector3(1169.855, 2711.493, 40.432), r = { x = -35.0, y = 0.0, z = 127.17 }, canRotate = false, isOnline = true },
        [18] = { label = '24/7 Supermarkt Senora Fwy CAM#1', coords = vector3(2673.579, 3281.265, 57.541), r = { x = -35.0, y = 0.0, z = -80.242 }, canRotate = false, isOnline = true },
        [19] = { label = '24/7 Supermarkt Alhambra Dr. CAM#1', coords = vector3(1966.24, 3749.545, 34.143), r = { x = -35.0, y = 0.0, z = 163.065 }, canRotate = false, isOnline = true },
        [20] = { label = '24/7 Supermarkt Senora Fwy CAM#2', coords = vector3(1729.522, 6419.87, 37.262), r = { x = -35.0, y = 0.0, z = -160.089 }, canRotate = false, isOnline = true },
        [21] = { label = 'Fleeca Bank Hawick Ave CAM#1', coords = vector3(309.341, -281.439, 55.88), r = { x = -35.0, y = 0.0, z = -146.1595 }, canRotate = false, isOnline = true },
        [22] = { label = 'Fleeca Bank Legion Square CAM#1', coords = vector3(144.871, -1043.044, 31.017), r = { x = -35.0, y = 0.0, z = -143.9796 }, canRotate = false, isOnline = true },
        [23] = { label = 'Fleeca Bank Hawick Ave CAM#2', coords = vector3(-355.7643, -52.506, 50.746), r = { x = -35.0, y = 0.0, z = -143.8711 }, canRotate = false, isOnline = true },
        [24] = { label = 'Fleeca Bank Del Perro Blvd CAM#1', coords = vector3(-1214.226, -335.86, 39.515), r = { x = -35.0, y = 0.0, z = -97.862 }, canRotate = false, isOnline = true },
        [25] = { label = 'Fleeca Bank Great Ocean Hwy CAM#1', coords = vector3(-2958.885, 478.983, 17.406), r = { x = -35.0, y = 0.0, z = -34.69595 }, canRotate = false, isOnline = true },
        [26] = { label = 'Paleto Bank CAM#1', coords = vector3(-102.939, 6467.668, 33.424), r = { x = -35.0, y = 0.0, z = 24.66 }, canRotate = false, isOnline = true },
        [27] = { label = 'Del Vecchio Liquor Paleto Bay', coords = vector3(-163.75, 6323.45, 33.424), r = { x = -35.0, y = 0.0, z = 260.00 }, canRotate = false, isOnline = true },
        [28] = { label = "Don's Country Store Paleto Bay CAM#1", coords = vector3(166.42, 6634.4, 33.69), r = { x = -35.0, y = 0.0, z = 32.00 }, canRotate = false, isOnline = true },
        [29] = { label = "Don's Country Store Paleto Bay CAM#2", coords = vector3(163.74, 6644.34, 33.69), r = { x = -35.0, y = 0.0, z = 168.00 }, canRotate = false, isOnline = true },
        [30] = { label = "Don's Country Store Paleto Bay CAM#3", coords = vector3(169.54, 6640.89, 33.69), r = { x = -35.0, y = 0.0, z = 5.78 }, canRotate = false, isOnline = true },
        [31] = { label = 'Vangelico Jewelery CAM#1', coords = vector3(-627.54, -239.74, 40.33), r = { x = -35.0, y = 0.0, z = 5.78 }, canRotate = true, isOnline = true },
        [32] = { label = 'Vangelico Jewelery CAM#2', coords = vector3(-627.51, -229.51, 40.24), r = { x = -35.0, y = 0.0, z = -95.78 }, canRotate = true, isOnline = true },
        [33] = { label = 'Vangelico Jewelery CAM#3', coords = vector3(-620.3, -224.31, 40.23), r = { x = -35.0, y = 0.0, z = 165.78 }, canRotate = true, isOnline = true },
        [34] = { label = 'Vangelico Jewelery CAM#4', coords = vector3(-622.57, -236.3, 40.31), r = { x = -35.0, y = 0.0, z = 5.78 }, canRotate = true, isOnline = true },
        [35] = { label = 'LTD Gas Carson Ave CAM#1', coords = vector3(408.77, -2067.94, 23.71), r = { x = 0.0, y = 0.0, z = 94.99 }, canRotate = true, isOnline = true },
        [36] = { label = 'LTD Gas Carson Ave CAM#2', coords = vector3(405.02, -2072.17, 23.23), r = { x = 0.0, y = 0.0, z = 119.99 }, canRotate = true, isOnline = true },
        [37] = { label = 'LTD Gas Carson Ave CAM#3', coords = vector3(409.74, -2075.4, 23.23), r = { x = 0.0, y = 0.0, z = -175.01 }, canRotate = true, isOnline = true },
        [38] = { label = "Rob's Liquor Carson Ave CAM#1", coords = vector3(399.83, -2197.32, 18.52), r = { x = 0.0, y = 0.0, z = 165.84 }, canRotate = true, isOnline = true },
        [39] = { label = "GrapeSeed Gas CAM#1", coords = vector3(1701.13, 4919.44, 44.59), r = { x = 0.0, y = 0.0, z = -170.00 }, canRotate = true, isOnline = true },
        [40] = { label = "GrapeSeed Gas CAM#2", coords = vector3(1708.47, 4921.07, 44.11), r = { x = 0.0, y = 0.0, z = -80.00 }, canRotate = true, isOnline = true },
    },
}

Config.Radars = {
    vector4(-623.44421386719, -823.08361816406, 25.25704574585, 145.0), -- vespucci and palamino 
    vector4(-652.44421386719, -854.08361816406, 24.55704574585, 325.0), -- vespucci and palamino 
    vector4(1623.0114746094, 1068.9924316406, 80.903594970703, 84.0), -- east route 13 // ls freeway
    vector4(-2604.8994140625, 2996.3391113281, 27.528566360474, 175.0), -- west route 13 // freeway
    vector4(2136.65234375, -591.81469726563, 94.272926330566, 318.0), -- route 15 // palamino freeway
    vector4(2117.5764160156, -558.51013183594, 95.683128356934, 158.0), -- route 15 // palamino freeway
    vector4(406.89505004883, -969.06286621094, 29.436267852783, 33.0), -- atlee and sinner 
    vector4(657.315, -218.819, 44.06, 320.0), -- route 13 into city
    vector4(2118.287, 6040.027, 50.928, 172.0), -- route 1
    vector4(-106.304, -1127.5530, 30.778, 230.0), -- adam's apple and power street
    vector4(-823.3688, -1146.980, 8.0, 300.0), -- south rockford and palomino ave
	vector4(-612.45, -349.82, 34.84, 117.56), -- portola and dorset
	vector4(-99.18, -122.14, 57.72, 299.18), -- Hawick and Las Lagunas
	vector4(220.1, 207.05, 105.46, 115.72), -- alta and vinewood blvd
	vector4(405.15, 292.44, 102.96, 290.38), -- clinton and power
	vector4(433.59, 301.43, 102.96, 111.07), -- clinton and power
	vector4(-236.74, -35.86, 49.42, 116.63), -- hawick and sanvitus Blvd
	vector4(-275.11, -57.55, 49.42, 307.6), -- hawick and sanvitus Blvd
	vector4(-1098.86, 250.33, 63.73, 310.1), -- west eclipse and madwayne thunder 
	vector4(-1073.34, 281.78, 63.81, 141.18), -- west eclipse and madwayne thunder 
	vector4(-162.82, -880.5, 29.21, 112.64), -- alta nad vespucci 
	vector4(-208.44, -902.7, 29.22, 295.47),
	
}

Config.AuthorizedVehicles = {
    -- Grade 0 and higher
    [0] = {
		sheriff2 = 'Cruiser',
		police3 = 'Interceptor',
		police = 'Police Cruiser',
		valor15rb = 'Police Valor',
	},
	[2] = {
		dlmclaren = "Police McLaren",
		dloffroadchar = "Police Char Offroad",
		dlporsche = "Police Porsche",
		dlroadster = "Police Roadster",
		dlspeedc8 = "Police speedc8",
		dlspeedgtr = "Police speedgtr",
		dlspeedmustang = "Police Mustang",
		dlspeedtesla = "Police Tesla",
		dlferrari = "Police Ferrari",
	},
	[3] = {
		--customcars
		-- '22g63' = '4WD Jeep',
		-- '22M5SAL' = 'Police Beamer',
		ACTRPavant = 'Police ACTR',
		ACTRPavantum = 'Police ACTR Unmarked',
		DL_a45 = 'Police A45 Incog',
		DL_rs6 = 'Police RS6 Incog',
		DL_RS7 = 'Police RS7 Incog',
		nm_z71 = 'Police Z71 Incog',
        SHEL = 'Suped Up Unmarked',
        polcharger18 = 'Police Charger',
        valor10rb = 'Police SUV',
        sw_subrb = 'Unmarked Black SUV',
        DL_RS7 = 'Unmarked Sedan',
        rmodgt63police = 'Undercover 1',
        trhawk = 'Unmarked SUV',
        polsilverado19 = 'Police Truck',
        DL_rs6 = 'Unmarked Hatchback',
        speeddemonrb = 'Sheriff Car 3',
        zm_s500 = 'Unmarked Car 1',
        Prisonvan2rb = 'Prisoner Van',
        polmustang = 'Unmarked Mustang',
        riot = 'Riot Truck',
        zm_rocket900 = 'Unmarked Car 2',
	},
	[4] = {
        valor9rb = 'Police 9RB',
        gurkharb = 'Police GURK',
		rhino = 'National Guard Tank',
		riot2 = 'National Guard Riot Truck',
	},
}

Config.VehicleSettings = {
    ['car1'] = {          --- Model name
        ['extras'] = {
            ['1'] = true, -- on/off
            ['2'] = true,
            ['3'] = true,
            ['4'] = true,
            ['5'] = true,
            ['6'] = true,
            ['7'] = true,
            ['8'] = true,
            ['9'] = true,
            ['10'] = true,
            ['11'] = true,
            ['12'] = true,
            ['13'] = true,
        },
        ['livery'] = 1,
    },
    ['car2'] = {
        ['extras'] = {
            ['1'] = true,
            ['2'] = true,
            ['3'] = true,
            ['4'] = true,
            ['5'] = true,
            ['6'] = true,
            ['7'] = true,
            ['8'] = true,
            ['9'] = true,
            ['10'] = true,
            ['11'] = true,
            ['12'] = true,
            ['13'] = true,
        },
        ['livery'] = 1,
    }
}
