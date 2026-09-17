Config = {}
Config.AutoRespawn = true          -- true == stores cars in garage on restart | false == doesnt modify car states
Config.VisuallyDamageCars = true   -- true == damage car on spawn | false == no damage on spawn
Config.SharedGarages = true       -- true == take any car from any garage | false == only take car from garage stored in
Config.ClassSystem = true         -- true == restrict vehicles by class | false == any vehicle class in any garage
Config.FuelResource = 'myFuel' -- supports any that has a GetFuel() and SetFuel() export
Config.Warp = true                 -- true == warp player into vehicle | false == vehicle spawns without warping
Config.MarkerDist = 100

-- https://docs.fivem.net/natives/?_0x29439776AAA00A62
Config.VehicleClass = {
    all = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26 },
    car = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 13, 18, 22, 23, 24, 26 },
    air = { 15, 16, 25 },
    sea = { 14 },
    rig = { 10, 11, 17, 19, 20, 26 }
}
Config.Garages = {

    -- test = {
        -- label = 'test',
        -- takeVehicle = vector3(1314.68, -734.72, 67.26),
        -- spawnPoint = {
            -- vector4(1314.68, -734.72, 67.26, 131.5)
        -- },
        -- showBlip = false,
        -- blipName = 'Public Parking',
        -- blipNumber = 357,
        -- blipColor = 3,
        -- type = 'public',
        -- category = Config.VehicleClass['car'] --car, air, sea, rig
        
    -- },
    manishhelipad = {
        label = 'Parking',
        takeVehicle = vector3(-169.31, 1185.06, 300.63),
        spawnPoint = {
            vector4(-169.31, 1185.06, 300.63, 316.1)
        },
        showBlip = false,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['air'] --car, air, sea, rig
    },
    strangewaysgarage = {
        label = 'Parking',
        takeVehicle = vector3(-620.97, 59.85, 43.74),
        spawnPoint = {
            vector4(-620.97, 59.85, 43.74, 96.04)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car'] --car, air, sea, rig
    },
    grapeseedgarageair = {
        label = 'Heli Port',
        takeVehicle = vector3(2125.32, 4797.98, 40.43),
        spawnPoint = {
            vector4(2125.32, 4797.98, 40.43, 49.6)
        },
        showBlip = true,
        blipName = 'Hangar',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['air'] --car, air, sea, rig
        
    },
    peacefulstreetair1 = {
        label = 'Heli Port',
        takeVehicle = vector3(-278.93, -726.15, 131.15),
        spawnPoint = {
            vector4(-278.93, -726.15, 133.15, 68.3)
        },
        showBlip = false,
        blipName = 'Hangar',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['air'] --car, air, sea, rig
        
    },
    buenvinord1air = {
        label = 'Heli Port',
        takeVehicle = vector3(-2576.24, 1870.71, 167.32),
        spawnPoint = {
            vector4(-2576.24, 1870.71, 167.32, 131.36)
        },
        showBlip = false,
        blipName = 'Hangar',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['air'] --car, air, sea, rig
        
    },
    lkvinewoodest1air = {
        label = 'Heli Port',
        takeVehicle = vector3(-71.18, 808.71, 227.25),
        spawnPoint = {
            vector4(-71.18, 808.71, 227.25, 105.31)
        },
        showBlip = false,
        blipName = 'Hangar',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['air'] --car, air, sea, rig
        
    },
    greatoceanhwy4sea = {
        label = 'Dock',
        takeVehicle = vector3(-3231.94, 735.86, 2.85),
        spawnPoint = {
            vector4(-3243.91, 728.59, 2.85, 121.26)
        },
        showBlip = false,
        blipName = '0',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['sea'] --car, air, sea, rig
        
    },
    beautycargarage = {
        label = 'Beauty Parking',
        takeVehicle = vector3(240.69, -1505.39, 29.15),
        spawnPoint = {
            vector4(240.69, -1505.39, 29.15, 224.81)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car'] --car, air, sea, rig
    },
    firefighter = {
        label = 'FireFighter',
        takeVehicle = vector3(213.68, -1635.41, 29.49),
        spawnPoint = {
            vector4(213.68, -1635.41, 29.49, 319.77)
        },
        showBlip = false,
        blipName = '0',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car'] --car, air, sea, rig
    },
    mthaanrd1air = {
        label = 'Mt Haan Rd',
        takeVehicle = vector3(802.34, 1294.34, 363.0),
        spawnPoint = {
            vector4(802.66, 1295.13, 364.9, 141.83)
        },
        showBlip = false,
        blipName = 'Syndicate',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['air'] --car, air, sea, rig
    },
    syndicate1 = {
        label = 'Syndicate',
        takeVehicle = vector3(1320.92, -736.53, 67.26),
        spawnPoint = {
            vector4(1320.92, -736.53, 67.26, 247.46)
        },
        showBlip = false,
        blipName = 'Syndicate',
        blipNumber = 357,
        blipColor = 3,
        type = 'gang',
        category = Config.VehicleClass['car'], --car, air, sea, rig
        job = 'syndicate',
        jobType = 'syndicate'
    },
    syndicate2 = {
        label = 'Syndicate',
        takeVehicle = vector3(5531.82, -5875.65, 20.17),
        spawnPoint = {
            vector4(5531.82, -5875.65, 20.17, 247.27)
        },
        showBlip = false,
        blipName = 'Syndicate',
        blipNumber = 357,
        blipColor = 3,
        type = 'gang',
        category = Config.VehicleClass['car'], --car, air, sea, rig
        job = 'syndicate',
        jobType = 'syndicate'
    },
    syndicate1heli = {
        label = 'Syndicate',
        takeVehicle = vector3(5478.22, -5847.71, 22.37),
        spawnPoint = {
            vector4(5478.22, -5847.71, 22.37, 6.18)
        },
        showBlip = false,
        blipName = 'Syndicate',
        blipNumber = 357,
        blipColor = 3,
        type = 'gang',
        category = Config.VehicleClass['air'], --car, air, sea, rig
        job = 'syndicate',
        jobType = 'syndicate'
    },
    abk = {
        label = 'ABK',
        takeVehicle = vector3(526.75, -2090.88, 26.25),
        spawnPoint = {
            vector4(526.75, -2090.88, 26.25, 160.78)
        },
        showBlip = false,
        blipName = 'ABK',
        blipNumber = 357,
        blipColor = 3,
        type = 'gang',
        category = Config.VehicleClass['car'], --car, air, sea, rig
        job = 'abk',
        jobType = 'abk'
    },
    mallgarage2 = {
        label = 'Parking',
        takeVehicle = vector3(2758.57, 3447.0, 55.95),
        spawnPoint = {
            vector4(2758.57, 3447.0, 55.95, 63.83)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    mallgarage = {
        label = 'Parking',
        takeVehicle = vector3(23.31, -1750.41, 29.3),
        spawnPoint = {
            vector4(23.31, -1750.41, 29.3, 43.77)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    pdmgarage = {
        label = 'Parking',
        takeVehicle = vector3(-59.19, -1116.64, 26.43),
        spawnPoint = {
            vector4(-59.19, -1116.64, 26.43, 7.99)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    airportracinggarage = {
        label = 'Parking',
        takeVehicle = vector3(-1806.86, -2809.98, 13.94),
        spawnPoint = {
            vector4(-1825.45, -2817.01, 13.94, 149.3)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    undergroundgarage = {
        label = 'Parking',
        takeVehicle = vector3(-2203.36, 1115.09, 29.77),
        spawnPoint = {
            vector4(-2203.36, 1115.09, 29.77, 270.47)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    birdiesburgersgarage = {
        label = 'Parking',
        takeVehicle = vector3(-1173.08, -888.31, 13.94),
        spawnPoint = {
            vector4(-1173.08, -888.31, 13.94, 28.29)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    manishclubgarage = {
        label = 'Club Parking',
        takeVehicle = vector3(365.05, -781.2, 29.27),
        spawnPoint = {
            vector4(365.05, -781.2, 29.27, 177.76)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    trailergarage = {
        label = 'Parking',
        takeVehicle = vector3(-581.49, -1126.35, 22.18),
        spawnPoint = {
            vector4(-581.49, -1126.35, 22.18, 269.97)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    xcivgarage = {
        label = 'Parking',
        takeVehicle = vector3(-309.02, -1379.06, 31.48),
        spawnPoint = {
            vector4(-309.02, -1379.06, 31.48, 183.41)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    mcsecretgarage = {
        label = 'MC Parking',
        takeVehicle = vector3(993.21, -2596.04, 10.12),
        spawnPoint = {
            vector4(993.21, -2596.04, 10.12, 84.07)
        },
        showBlip = false,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    hotelgarage = {
        label = 'Hotel Parking',
        takeVehicle = vector3(-1995.59, -317.87, 44.11),
        spawnPoint = {
            vector4(-1995.59, -317.87, 44.11, 143.04)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    townhallgarage = {
        label = 'Townhall Parking',
        takeVehicle = vector3(765.84, 3402.26, 62.68),
        spawnPoint = {
            vector4(765.84, 3402.26, 62.68, 264.09)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    southmogarage = {
        label = 'South Mo Tower Parking',
        takeVehicle = vector3(-799.99, 333.04, 85.28),
        spawnPoint = {
            vector4(-799.99, 333.04, 85.28, 179.8)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    tequilalagarage = {
        label = 'Tequilala Parking',
        takeVehicle = vector3(-562.03, 302.58, 83.18),
        spawnPoint = {
            vector4(-562.03, 302.58, 83.18, 265.38)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    brandonscustomsgarage = {
        label = 'Customs Parking',
        takeVehicle = vector3(-370.28, -108.19, 38.11),
        spawnPoint = {
            vector4(-370.28, -108.19, 38.11, 72.82)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    southislandrig = {
        label = 'Southern Garages',
        takeVehicle = vector3(5135.57, -5145.31, 2.16),
        spawnPoint = {
            vector4(5135.57, -5145.31, 2.16, 269.11)
        },
        showBlip = true,
        blipName = 'Big Rig Parking',
        blipNumber = 357,
        blipColor = 2,
        type = 'gang',
        category = Config.VehicleClass['rig'],
        job = 'syndicate',
        jobType = 'syndicate'
	},
    southislandhelis = {
        label = 'Southern Garages',
        takeVehicle = vector3(4889.95, -5736.36, 26.35),
        spawnPoint = {
            vector4(4889.95, -5736.36, 26.35, 158.64)
        },
        showBlip = true,
        blipName = 'Hangar',
        blipNumber = 360,
        blipColor = 3,
        type = 'gang', -- public, gang, job, depot
        category = Config.VehicleClass['air'],
        job = 'syndicate',
        jobType = 'syndicate'
    },
    southislandairplanes = {
        label = 'Southern Garages',
        takeVehicle = vector3(4485.26, -4465.37, 4.23),
        spawnPoint = {
            vector4(4485.26, -4465.37, 4.23, 223.72)
        },
        showBlip = true,
        blipName = 'Hangar',
        blipNumber = 360,
        blipColor = 3,
        type = 'gang', -- public, gang, job, depot
        category = Config.VehicleClass['air'],
        job = 'syndicate',
        jobType = 'syndicate'
    },
    southislandground = {
        label = 'Southern Garages',
        takeVehicle = vector3(4511.35, -4518.94, 4.13),
        spawnPoint = {
            vector4(4511.35, -4518.94, 4.13, 20.27)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'gang', -- public, gang, job, depot
        category = Config.VehicleClass['car'],
        job = 'syndicate',
        jobType = 'syndicate'
    },
    southislandsea = {
        label = 'Southern Garages',
        takeVehicle = vector3(4930.72, -5146.14, 2.48),
        spawnPoint = {
            vector4(4930.14, -5154.36, -0.45, 66.2)
        },
        showBlip = true,
        blipName = 'Boathouse',
        blipNumber = 356,
        blipColor = 3,
        type = 'gang', -- public, gang, job, depot
        category = Config.VehicleClass['sea'],
        job = 'syndicate',
        jobType = 'syndicate'
    },
    brandonscustomsheligarage = {
        label = 'Customs Helis',
        takeVehicle = vector3(-325.89, -151.85, 62.33),
        spawnPoint = {
            vector4(-325.89, -151.85, 63.33, 296.77)
        },
        showBlip = false,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['air']
    },
    sheriffgarage = {
        label = 'Sheriff Helis',
        takeVehicle = vector3(-1261.85, 4475.64, 32.02),
        spawnPoint = {
            vector4(-1261.85, 4475.64, 32.02, 61.79)
        },
        showBlip = false,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['air']
    },
    townhallheligarage = {
        label = 'TownHall Helis',
        takeVehicle = vector3(686.7, 3436.79, 57.75),
        spawnPoint = {
            vector4(686.7, 3436.79, 57.75, 352.55)
        },
        showBlip = false,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['air']
    },
    cookiesgarage = {
        label = 'Cookies',
        takeVehicle = vector3(-913.79, -1164.47, 4.84),
        spawnPoint = {
            vector4(-913.79, -1164.47, 4.84, 208.68)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    greatoceansixgarage = {
        label = 'Heli Port',
        takeVehicle = vector3(-3135.1, 1428.71, 24.38),
        spawnPoint = {
            vector4(-3135.1, 1428.71, 24.38, 132.71)
        },
        showBlip = false,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['air']
    },
    manishmansiongarage = {
        label = 'manishmansion',
        takeVehicle = vector3(-3118.74, 1785.57, 34.35),
        spawnPoint = {
            vector4(-3118.74, 1785.57, 34.35, 261.68)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    reckrocgarage = {
        label = 'Rec Garage',
        takeVehicle = vector3(-960.36, -308.61, 38.3),
        spawnPoint = {
            vector4(-960.36, -308.61, 38.3, 207.64)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    luxgarage = {
        label = 'LUXNightClub',
        takeVehicle = vector3(-332.4, 225.81, 86.04),
        spawnPoint = {
            vector4(-332.4, 225.81, 86.04, 9.65)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    jutsugarage = {
        label = 'Jutsu Helis',
        takeVehicle = vector3(621.51, 894.08, 248.42),
        spawnPoint = {
            vector4(621.51, 894.08, 248.42, 252.01)
        },
        showBlip = false,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['air']
    },
    manishgarage = {
        label = 'Manish Helis',
        takeVehicle = vector3(298.79, 1857.18, 220.27),
        spawnPoint = {
            vector4(298.79, 1857.18, 220.27, 25.12)
        },
        showBlip = false,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['air']
    },
    manish2garage = {
        label = 'Manish Helis',
        takeVehicle = vector3(-2489.98, 721.72, 292.81),
        spawnPoint = {
            vector4(-2489.98, 721.72, 292.81, 239.64)
        },
        showBlip = false,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['air']
    },
    marlowdr1garage = {
        label = 'Helis',
        takeVehicle = vector3(-1288.62, 756.96, 190.83),
        spawnPoint = {
            vector4(-1288.62, 756.96, 192.83, 198.63)
        },
        showBlip = false,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['air']
    },
    brandonsgarage = {
        label = 'Bs Helis',
        takeVehicle = vector3(-3002.35, -358.97, 14.73),
        spawnPoint = {
            vector4(-3002.35, -358.97, 14.73, 291.8)
        },
        showBlip = false,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['air']
    },
    greatoceanhwy4air = {
        label = 'Helis',
        takeVehicle = vector3(-3174.22, 767.05, 11.06),
        spawnPoint = {
            vector4(-3174.22, 767.05, 12.06, 346.87)
        },
        showBlip = false,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['air']
    },
    arenagarage = {
	
        label = 'Arena Parking',
        takeVehicle = vector3(-230.32, -2044.83, 27.76),
        spawnPoint = {
            vector4(-228.45, -2049.22, 27.62, 134.3)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    newsgarage = {
        label = 'News Station Garage',
        takeVehicle = vector3(-541.11, -912.85, 23.86),
        spawnPoint = {
            vector4(-541.11, -912.85, 23.86, 58.91)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
		type = 'public',
        category = Config.VehicleClass['car'], --car, air, sea, rig
    },
    cityhallgarage = {
        label = 'City Hall',
        takeVehicle = vector3(-521.34, -266.25, 35.32),
        spawnPoint = {
            vector4(-521.34, -266.25, 35.32, 109.57)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    cityhallriggarage = {
        label = 'City Hal Rig',
        takeVehicle = vector3(-493.93, -254.78, 35.63),
        spawnPoint = {
            vector4(-493.93, -254.78, 35.63, 112.89)
        },
        showBlip = true,
        blipName = 'Big Rig Parking',
        blipNumber = 357,
        blipColor = 2,
        type = 'public',
        category = Config.VehicleClass['rig']
    },
    motelgarage = {
        label = 'Motel Parking',
        takeVehicle = vector3(274.29, -334.15, 44.92),
        spawnPoint = {
            vector4(265.96, -332.3, 44.51, 250.68)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    casinogarage = {
        label = 'Casino Parking',
        takeVehicle = vector3(883.96, -4.71, 78.76),
        spawnPoint = {
            vector4(895.39, -4.75, 78.35, 146.85)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    sapcounsel = {
        label = 'San Andreas Parking',
        takeVehicle = vector3(-330.01, -780.33, 33.96),
        spawnPoint = {
            vector4(-341.57, -767.45, 33.56, 92.61)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    spanishave = {
        label = 'Spanish Ave Parking',
        takeVehicle = vector3(-1160.86, -741.41, 19.63),
        spawnPoint = {
            vector4(-1145.2, -745.42, 19.26, 108.22)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    caears24 = {
        label = 'Caears 24 Parking',
        takeVehicle = vector3(69.84, 12.6, 68.96),
        spawnPoint = {
            vector4(60.8, 17.54, 68.82, 339.7)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    caears242 = {
        label = 'Caears 24 Parking',
        takeVehicle = vector3(-453.7, -786.78, 30.56),
        spawnPoint = {
            vector4(-472.39, -787.71, 30.14, 180.52)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    lagunapi = {
        label = 'Laguna Parking',
        takeVehicle = vector3(364.37, 297.83, 103.49),
        spawnPoint = {
            vector4(375.09, 294.66, 102.86, 164.04)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    airportp = {
        label = 'Airport Parking',
        takeVehicle = vector3(-773.12, -2033.04, 8.88),
        spawnPoint = {
            vector4(-779.77, -2040.18, 8.47, 315.34)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    beachp = {
        label = 'Beach Parking',
        takeVehicle = vector3(-1185.32, -1500.64, 4.38),
        spawnPoint = {
            vector4(-1188.14, -1487.95, 3.97, 124.06)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    themotorhotel = {
        label = 'The Motor Hotel Parking',
        takeVehicle = vector3(1137.77, 2663.54, 37.9),
        spawnPoint = {
            vector4(1127.7, 2647.84, 37.58, 1.41)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    liqourparking = {
        label = 'Liqour Parking',
        takeVehicle = vector3(883.99, 3649.67, 32.87),
        spawnPoint = {
            vector4(898.38, 3649.41, 32.36, 90.75)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    shoreparking = {
        label = 'Shore Parking',
        takeVehicle = vector3(1737.03, 3718.88, 34.05),
        spawnPoint = {
            vector4(1725.4, 3716.78, 34.15, 20.54)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    haanparking = {
        label = 'Bell Farms Parking',
        takeVehicle = vector3(76.88, 6397.3, 31.23),
        spawnPoint = {
            vector4(72.84, 6384.14, 30.77, 218.4)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    dumbogarage = {
        label = 'Dumbo Private Parking',
        takeVehicle = vector3(166.52, -3056.36, 5.88),
        spawnPoint = {
            vector4(166.52, -3056.36, 5.88, 261.52)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    pillboxgarage = {
        label = 'Pillbox Garage Parking',
        takeVehicle = vector3(213.2, -796.05, 30.86),
        spawnPoint = {
            vector4(222.02, -804.19, 30.26, 248.19),
            vector4(223.93, -799.11, 30.25, 248.53),
            vector4(226.46, -794.33, 30.24, 248.29),
            vector4(232.33, -807.97, 30.02, 69.17),
            vector4(234.42, -802.76, 30.04, 67.2)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    grapeseedgarage = {
        label = 'Grapeseed Parking',
        takeVehicle = vector3(2552.68, 4671.8, 33.95),
        spawnPoint = {
            vector4(2550.17, 4681.96, 33.81, 17.05)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    depotLot = {
        label = 'Depot Lot',
        takeVehicle = vector3(401.76, -1632.57, 29.29),
        spawnPoint = {
            vector4(396.55, -1643.93, 28.88, 321.91)
        },
        showBlip = true,
        blipName = 'Depot Lot',
        blipNumber = 68,
        blipColor = 3,
        type = 'depot',
        category = Config.VehicleClass['car']
    },
    otf = {
        label = 'OTF',
        takeVehicle = vector3(87.51, -1969.1, 20.75),
        spawnPoint = {
            vector4(93.78, -1961.73, 20.34, 319.11)
        },
        showBlip = false,
        blipName = 'OTF',
        blipNumber = 357,
        blipColor = 3,
        type = 'gang',
        category = Config.VehicleClass['car'], --car, air, sea, rig
        job = 'otf',
        jobType = 'otf'
    },
    ballas = {
        label = 'Ballas',
        takeVehicle = vector3(259.99, -1715.01, 29.3),
        spawnPoint = {
            vector4(259.99, -1715.01, 29.3, 45.15)
        },
        showBlip = false,
        blipName = 'Ballas',
        blipNumber = 357,
        blipColor = 3,
        type = 'gang',
        category = Config.VehicleClass['car'], --car, air, sea, rig
        job = 'ballas',
        jobType = 'ballas'
    },
    families = {
        label = 'Families',
        takeVehicle = vector3(-23.89, -1436.03, 30.65),
        spawnPoint = {
            vector4(-25.47, -1445.76, 30.24, 178.5)
        },
        showBlip = false,
        blipName = 'Families',
        blipNumber = 357,
        blipColor = 3,
        type = 'gang',
        category = Config.VehicleClass['car'], --car, air, sea, rig
        job = 'families',
        jobType = 'families'
    },
    lostmc = {
        label = 'Lost MC',
        takeVehicle = vector3(987.95, -2538.75, 28.3),
        spawnPoint = {
            vector4(987.95, -2538.75, 28.3, 169.39)
        },
        showBlip = false,
        blipName = 'Lost MC',
        blipNumber = 357,
        blipColor = 3,
        type = 'gang',
        category = Config.VehicleClass['car'], --car, air, sea, rig
        job = 'lostmc',
        jobType = 'lostmc'
    },
    cartel = {
        label = 'Cartel',
        takeVehicle = vector3(1411.67, 1117.8, 114.84),
        spawnPoint = {
            vector4(1403.01, 1118.25, 114.84, 88.69)
        },
        showBlip = false,
        blipName = 'Cartel',
        blipNumber = 357,
        blipColor = 3,
        type = 'gang',
        category = Config.VehicleClass['car'],
        job = 'cartel',
        jobType = 'cartel'
    },
    police = {
        label = 'Police',
        takeVehicle = vector3(415.15, -1012.39, 21.34),
        spawnPoint = {
            vector4(415.15, -1012.39, 21.34, 8.11)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'job',
        category = Config.VehicleClass['car'], --car, air, sea, rig
        job = 'police',
        jobType = 'leo'
    },
    ambulance = {
        label = 'Ambulance',
        takeVehicle = vector3(316.12, -545.1, 28.16),
        spawnPoint = {
            vector4(316.12, -545.1, 28.16, 269.93)
        },
        showBlip = false,
        blipName = 'Ambulance',
        blipNumber = 357,
        blipColor = 3,
        type = 'job',
        category = Config.VehicleClass['car'], --car, air, sea, rig
        job = 'ambulance',
        jobType = 'EMS'
    },
    intairport = {
        label = 'Airport Hangar',
        takeVehicle = vector3(-979.06, -2995.48, 13.95),
        spawnPoint = {
            vector4(-1053.23, -2955.29, 13.96, 143.92)
        },
        showBlip = true,
        blipName = 'Hangar',
        blipNumber = 360,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['air']
    },
    higginsheli = {
        label = 'Higgins Helitours',
        takeVehicle = vector3(-722.15, -1472.79, 5.0),
        spawnPoint = {
            vector4(-745.22, -1468.72, 5.39, 319.84),
            vector4(-724.36, -1443.61, 5.39, 135.78)
        },
        showBlip = true,
        blipName = 'Hangar',
        blipNumber = 360,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['air']
    },
    airsshores = {
        label = 'Sandy Shores Hangar',
        takeVehicle = vector3(1737.89, 3288.13, 41.14),
        spawnPoint = {
            vector4(1742.83, 3266.83, 42.24, 102.64)
        },
        showBlip = true,
        blipName = 'Hangar',
        blipNumber = 360,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['air']
    },
    airzancudo = {
        label = 'Fort Zancudo Hangar',
        takeVehicle = vector3(-1828.25, 2975.44, 32.81),
        spawnPoint = {
            vector4(-1828.25, 2975.44, 32.81, 57.24)
        },
        showBlip = true,
        blipName = 'Hangar',
        blipNumber = 360,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['air']
    },
    airdepot = {
        label = 'Air Depot',
        takeVehicle = vector3(-1270.01, -3377.53, 14.33),
        spawnPoint = {
            vector4(-1270.01, -3377.53, 14.33, 329.25)
        },
        showBlip = true,
        blipName = 'Air Depot',
        blipNumber = 359,
        blipColor = 3,
        type = 'depot',
        category = Config.VehicleClass['air']
    },
    lsymc = {
        label = 'LSYMC Boathouse',
        takeVehicle = vector3(-785.95, -1497.84, -0.09),
        spawnPoint = {
            vector4(-796.64, -1502.6, -0.09, 111.49)
        },
        showBlip = true,
        blipName = 'Boathouse',
        blipNumber = 356,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['sea']
    },
    paleto = {
        label = 'Paleto Boathouse',
        takeVehicle = vector3(-280.76, 6651.46, 0.27),
        spawnPoint = {
            vector4(-280.76, 6651.46, 0.27, 111.47)
        },
        showBlip = true,
        blipName = 'Boathouse',
        blipNumber = 356,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['sea']
    },
    millars = {
        label = 'Millars Boathouse',
        takeVehicle = vector3(1298.56, 4212.42, 33.25),
        spawnPoint = {
            vector4(1297.82, 4209.61, 30.12, 253.5)
        },
        showBlip = true,
        blipName = 'Boathouse',
        blipNumber = 356,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['sea']
    },
    seadepot = {
        label = 'LSYMC Depot',
        takeVehicle = vector3(-742.95, -1407.58, 5.5),
        spawnPoint = {
            vector4(-729.77, -1355.49, 1.19, 142.5)
        },
        showBlip = true,
        blipName = 'LSYMC Depot',
        blipNumber = 356,
        blipColor = 3,
        type = 'depot',
        category = Config.VehicleClass['sea']
    },
    rigdepot = {
        label = 'Big Rig Depot',
        takeVehicle = vector3(2334.42, 3118.62, 48.2),
        spawnPoint = {
            vector4(2324.57, 3117.79, 48.21, 4.05)
        },
        showBlip = true,
        blipName = 'Big Rig Depot',
        blipNumber = 68,
        blipColor = 2,
        type = 'depot',
        category = Config.VehicleClass['rig']
    },
    dumborigparking = {
        label = 'Dumbo Big Rig Parking',
        takeVehicle = vector3(180.13, -3179.67, 5.61),
        spawnPoint = {
            vector4(180.13, -3179.67, 5.61, 357.2)
        },
        showBlip = true,
        blipName = 'Big Rig Parking',
        blipNumber = 357,
        blipColor = 2,
        type = 'public',
        category = Config.VehicleClass['rig']
    },
    popsrigparking = {
        label = 'Pop\'s Big Rig Parking',
        takeVehicle = vector3(137.67, 6632.99, 31.67),
        spawnPoint = {
            vector4(127.69, 6605.84, 31.93, 223.67)
        },
        showBlip = true,
        blipName = 'Big Rig Parking',
        blipNumber = 357,
        blipColor = 2,
        type = 'public',
        category = Config.VehicleClass['rig']
    },
    ronsrigparking = {
        label = 'Ron\'s Big Rig Parking',
        takeVehicle = vector3(-2529.37, 2342.67, 33.06),
        spawnPoint = {
            vector4(-2521.61, 2326.45, 33.13, 88.7)
        },
        showBlip = true,
        blipName = 'Big Rig Parking',
        blipNumber = 357,
        blipColor = 2,
        type = 'public',
        category = Config.VehicleClass['rig']
    },
    ronsrigparking2 = {
        label = 'Ron\'s Big Rig Parking',
        takeVehicle = vector3(2561.67, 476.68, 108.49),
        spawnPoint = {
            vector4(2561.67, 476.68, 108.49, 177.86)
        },
        showBlip = true,
        blipName = 'Big Rig Parking',
        blipNumber = 357,
        blipColor = 2,
        type = 'public',
        category = Config.VehicleClass['rig']
    },
    ronsrigparking3 = {
        label = 'Ron\'s Big Rig Parking',
        takeVehicle = vector3(-41.24, -2550.63, 6.01),
        spawnPoint = {
            vector4(-39.39, -2527.81, 6.08, 326.18)
        },
        showBlip = true,
        blipName = 'Big Rig Parking',
        blipNumber = 357,
        blipColor = 2,
        type = 'public',
        category = Config.VehicleClass['rig']
    },
    genghisrigparking3 = {
        label = 'Big Rig Parking',
        takeVehicle = vector3(1058.29, 2673.47, 39.53),
        spawnPoint = {
            vector4(1058.29, 2673.47, 39.53, 2.49)
        },
        showBlip = true,
        blipName = 'Big Rig Parking',
        blipNumber = 357,
        blipColor = 2,
        type = 'public',
        category = Config.VehicleClass['rig']
    },
}
