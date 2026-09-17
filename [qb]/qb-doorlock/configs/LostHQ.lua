

-- Front Gate created by ndsha
Config.DoorList['LostHQ-Front Gate'] = {
    doorRate = 1.0,
    doorType = 'sliding',
    objCoords = vec3(997.161865, -2480.563721, 27.364853),
    fixText = false,
    authorizedGangs = { ['lostmc'] = 0 },
    objYaw = 174.32550048828,
    distance = 15,
    locked = true,
    pickable = true,
    doorLabel = 'Gate',
    objName = 130000169,
}

-- Garage Door created by ndsha
Config.DoorList['LostHQ-Garage Door'] = {
    doorRate = 1.0,
    doorType = 'garage',
    objCoords = vec3(1008.781799, -2532.341064, 29.196447),
    fixText = false,
    authorizedGangs = { ['lostmc'] = 0 },
    objYaw = 175.0,
    distance = 3,
    locked = true,
    pickable = true,
    doorLabel = 'Garage Door',
    objName = 1959322729,
}

-- FrontDouble Door created by ndsha
Config.DoorList['LostHQ-FrontDouble Door'] = {
    doorRate = 1.0,
    authorizedGangs = { ['lostmc'] = 0 },
    doors = {
        {objName = 901699419, objYaw = 84.999984741211, objCoords = vec3(1019.603882, -2514.360107, 28.633499)},
        {objName = -1471267716, objYaw = 265.0, objCoords = vec3(1019.830139, -2511.774414, 28.633499)}
    },
    distance = 3,
    doorLabel = 'FrontDouble Door',
    doorType = 'double',
    pickable = true,
    locked = true,
}