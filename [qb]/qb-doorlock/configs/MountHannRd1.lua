

-- gate created by ndsha
Config.DoorList['MountHannRd1-gate'] = {
    doorLabel = 'Gate',
    objName = 1286535678,
    pickable = true,
    fixText = false,
    objCoords = vec3(175.577332, 1676.798340, 229.047928),
    objYaw = 200.65000915527,
    distance = 5,
    locked = true,
    doorType = 'sliding',
    authorizedCitizenIDs = { ['RUQ41298'] = true },
    doorRate = 1.0,
}

-- FrontDoor created by ndsha
Config.DoorList['MountHannRd1-FrontDoor'] = {
    doorLabel = 'Door',
    objName = 1901183774,
    pickable = true,
    fixText = false,
    objCoords = vec3(176.985001, 1701.160034, 227.500000),
    objYaw = 180.00001525879,
    distance = 3,
    locked = true,
    doorType = 'door',
    authorizedCitizenIDs = { ['RUQ41298'] = true },
    doorRate = 1.0,
}

-- GarageDoor created by ndsha
Config.DoorList['MountHannRd1-GarageDoor'] = {
    doorLabel = 'Door',
    objName = -264728216,
    pickable = true,
    fixText = false,
    objCoords = vec3(173.380005, 1703.750000, 227.490005),
    objYaw = 270.00006103516,
    distance = 3,
    locked = true,
    doorType = 'door',
    authorizedCitizenIDs = { ['RUQ41298'] = true },
    doorRate = 1.0,
}

-- BedroomDoor created by ndsha
Config.DoorList['MountHannRd1-BedroomDoor'] = {
    doorLabel = 'Door',
    objName = -1687047623,
    pickable = true,
    fixText = false,
    objCoords = vec3(183.139999, 1711.562012, 231.179993),
    objYaw = 270.00534057617,
    distance = 1.5,
    locked = true,
    doorType = 'door',
    authorizedCitizenIDs = { ['RUQ41298'] = true },
    doorRate = 1.0,
}

-- DDoor created by ndsha
Config.DoorList['MountHannRd1-DDoor'] = {
    doors = {
        {objName = -264728216, objYaw = 179.99998474121, objCoords = vec3(179.220001, 1710.807983, 231.179993)},
        {objName = -264728216, objYaw = 360.0, objCoords = vec3(181.820007, 1710.800049, 231.179993)}
    },
    doorLabel = 'Door',
    doorRate = 1.0,
    distance = 1.5,
    doorType = 'double',
    authorizedCitizenIDs = { ['RUQ41298'] = true },
    locked = true,
    pickable = true,
}