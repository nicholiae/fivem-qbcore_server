

-- Front Door created by Manish
Config.DoorList['El Rancho Blvd-Front Door'] = {
    doorType = 'double',
    doorRate = 1.0,
    doors = {
        {objName = 1523529669, objYaw = 79.999984741211, objCoords = vec3(1255.569946, -867.179993, 75.510002)},
        {objName = 1596276849, objYaw = 79.999984741211, objCoords = vec3(1256.060059, -864.400024, 75.510002)}
    },
    authorizedCitizenIDs = { ['DYS98830'] = true },
    -- authorizedCitizenIDs = { ['XVL69643'] = true },
    doorLabel = 'D1',
    distance = 3,
    pickable = true,
    locked = true,
}

-- Bedroom created by Manish
Config.DoorList['El Rancho Blvd-Bedroom'] = {
    doorType = 'door',
    doorRate = 1.0,
    objCoords = vec3(1241.744995, -871.609985, 79.245003),
    fixText = false,
    objName = -1687047623,
    objYaw = 169.48153686523,
    authorizedCitizenIDs = { ['DYS98830'] = true },
    -- authorizedCitizenIDs = { ['XVL69643'] = true },
    pickable = true,
    distance = 3,
    locked = true,
    doorLabel = 'Door',
}