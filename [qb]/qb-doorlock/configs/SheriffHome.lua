

-- SheriffHouse created by Nicholiae
Config.DoorList['SheriffHome-SheriffHouse'] = {
    locked = true,
    doorRate = 1.0,
    fixText = false,
    objYaw = 149.13145446777,
    objName = 2052512905,
    distance = 3,
    pickable = true,
    authorizedCitizenIDs = { ['GUX51858'] = true },
    objCoords = vec3(-1253.990967, 4460.416992, 30.515800),
    doorLabel = 'Garage',
    doorType = 'garage',
}

-- BackDoubleDoor created by Nicholiae
Config.DoorList['SheriffHome-BackDoubleDoor'] = {
    locked = true,
    doors = {
        {objName = -368655288, objYaw = 237.15562438965, objCoords = vec3(-1244.660034, 4442.189941, 26.677670)},
        {objName = -368655288, objYaw = 58.852924346924, objCoords = vec3(-1245.989990, 4440.069824, 26.670000)}
    },
    distance = 3,
    pickable = true,
    authorizedCitizenIDs = { ['GUX51858'] = true },
    doorLabel = 'BackDoubleDoor',
    doorRate = 1.0,
    doorType = 'double',
}

-- FrontDoor created by Nicholiae
Config.DoorList['SheriffHome-FrontDoor'] = {
    locked = true,
    doorRate = 1.0,
    fixText = false,
    objYaw = 148.63409423828,
    objName = -658026477,
    distance = 3,
    pickable = true,
    authorizedCitizenIDs = { ['GUX51858'] = true },
    objCoords = vec3(-1249.862061, 4453.776855, 31.108950),
    doorLabel = 'Front Door',
    doorType = 'door',
}
