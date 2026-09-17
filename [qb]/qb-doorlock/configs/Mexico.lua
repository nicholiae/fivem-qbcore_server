

-- Manish Door created by Nicholiae
Config.DoorList['Mexico-Manish Door'] = {
    objYaw = 337.99435424805,
    fixText = false,
    authorizedCitizenIDs = { ['AKB31590'] = true },
    objCoords = vec3(5543.853027, -5896.197266, 21.950167),
    locked = true,
    distance = 2,
    doorLabel = 'Door',
    objName = -543490328,
    pickable = true,
    doorType = 'door',
    doorRate = 1.0,
}

-- CompoundDoor created by Nicholiae
Config.DoorList['Mexico-CompoundDoor'] = {
    doors = {
        {objName = 1215477734, objYaw = 68.616767883301, objCoords = vec3(5513.990234, -5865.670410, 21.075411)},
        {objName = -1574151574, objYaw = 68.616767883301, objCoords = vec3(5515.693359, -5861.316895, 21.075411)}
    },
    doorLabel = 'Door',
    authorizedGangs = { ['syndicate'] = 0 },
    locked = true,
    doorRate = 1.0,
    distance = 5,
    doorType = 'double',
    pickable = true,
}