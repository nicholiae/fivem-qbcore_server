

-- Front Door created by ndsha
Config.DoorList['StarkMansion-Front Door'] = {
    doorType = 'double',
    locked = true,
    pickable = true,
    doors = {
        {objName = -1015772241, objYaw = 69.748573303223, objCoords = vec3(-3349.177002, 1765.678955, 34.670399)},
        {objName = -903707975, objYaw = 72.989852905273, objCoords = vec3(-3347.217041, 1767.542969, 34.656860)}
    },
    authorizedCitizenIDs = { ['HQR12147'] = true },
    doorLabel = 'Front Door',
    doorRate = 1.0,
    distance = 3,
}

-- Garage Door created by ndsha
Config.DoorList['StarkMansion-Garage Door'] = {
    pickable = true,
    objName = -823065337,
    authorizedCitizenIDs = { ['HQR12147'] = true },
    doorType = 'door',
    locked = true,
    distance = 3,
    objCoords = vec3(-3363.331055, 1784.806152, 26.314600),
    objYaw = 93.79613494873,
    doorRate = 1.0,
    doorLabel = 'Garage Door',
    fixText = false,
}

-- Rear Door created by ndsha
Config.DoorList['StarkMansion-Rear Door'] = {
    pickable = true,
    objName = -823065337,
    authorizedCitizenIDs = { ['HQR12147'] = true },
    doorType = 'door',
    locked = true,
    distance = 3,
    objCoords = vec3(-3350.383545, 1803.003906, 34.067951),
    objYaw = 1.411794424057,
    doorRate = 1.0,
    doorLabel = 'Rear Door',
    fixText = false,
}

-- BedRoom Door created by ndsha
Config.DoorList['StarkMansion-BedRoom Door'] = {
    pickable = true,
    objName = -850899785,
    authorizedCitizenIDs = { ['HQR12147'] = true },
    doorType = 'door',
    locked = true,
    distance = 3,
    objCoords = vec3(-3331.509033, 1800.670898, 38.654499),
    objYaw = 210.28955078125,
    doorRate = 1.0,
    doorLabel = 'BedRoom Door',
    fixText = false,
}

-- BedRoom Rear Door created by ndsha
Config.DoorList['StarkMansion-BedRoom Rear Door'] = {
    doorType = 'double',
    locked = true,
    pickable = true,
    doors = {
        {objName = 557651325, objYaw = 107.62153625488, objCoords = vec3(-3327.529541, 1800.519165, 38.653133)},
        {objName = 557651325, objYaw = 286.78045654297, objCoords = vec3(-3326.800537, 1798.143066, 38.653366)}
    },
    authorizedCitizenIDs = { ['HQR12147'] = true },
    doorLabel = 'BedRoom Rear Door',
    doorRate = 1.0,
    distance = 3,
}


-- VaultDoor created by Nicholiae
Config.DoorList['StarkMansion-VaultDoor'] = {
    doorLabel = 'Vault',
    locked = true,
    distance = 3,
    pickable = true,
    doorRate = 1.0,
    authorizedCitizenIDs = { ['HQR12147'] = true },
    doors = {
        {objName = -1871119057, objYaw = 71.310546875, objCoords = vec3(-3345.684082, 1793.727051, 21.198101)},
        {objName = -440064066, objYaw = 71.310546875, objCoords = vec3(-3346.812500, 1790.434570, 21.193291)}
    },
    doorType = 'doublesliding',
}