

-- BedroomDoor created by Nicholiae
Config.DoorList['BanhamCanyonDr1-BedroomDoor'] = {
    doorType = 'door',
    objName = -2037125726,
    locked = true,
    doorRate = 1.0,
    authorizedCitizenIDs = { ['CIV15891'] = true },
    fixText = false,
    pickable = true,
    doorLabel = 'Bedroom Door',
    objYaw = 330.37652587891,
    objCoords = vec3(-2507.709961, 763.789001, 312.429993),
    distance = 2,
}

-- FrontDoor created by Nicholiae
Config.DoorList['BanhamCanyonDr1-FrontDoor'] = {
    doorRate = 1.0,
    authorizedCitizenIDs = { ['CIV15891'] = true },
    doors = {
        {objName = 110411286, objYaw = 61.078285217285, objCoords = vec3(-2502.939941, 753.619995, 303.519989)},
        {objName = 110411286, objYaw = 241.63624572754, objCoords = vec3(-2501.689941, 755.900024, 303.519989)}
    },
    distance = 2,
    locked = true,
    doorLabel = 'Front Door',
    doorType = 'double',
    pickable = true,
}

-- BunkerDoor created by Nicholiae
Config.DoorList['BanhamCanyonDr1-BunkerDoor'] = {
    doorType = 'door',
    objName = -1687047623,
    locked = true,
    doorRate = 1.0,
    authorizedCitizenIDs = { ['CIV15891'] = true },
    fixText = false,
    pickable = true,
    doorLabel = 'Bunker Door',
    objYaw = 61.14030456543,
    objCoords = vec3(-2508.520020, 766.340027, 312.429993),
    distance = 2,
}

-- BunkerDoor2 created by Nicholiae
Config.DoorList['BanhamCanyonDr1-BunkerDoor2'] = {
    doorType = 'door',
    objName = -264728216,
    locked = true,
    doorRate = 1.0,
    authorizedCitizenIDs = { ['CIV15891'] = true },
    fixText = false,
    pickable = true,
    doorLabel = 'Bunker Door',
    objYaw = 151.0528717041,
    objCoords = vec3(-2518.570068, 773.824158, 303.549988),
    distance = 2,
}