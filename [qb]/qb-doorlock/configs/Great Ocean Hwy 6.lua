

-- Main Gate created by Manish
Config.DoorList['Great Ocean Hwy 6-Main Gate'] = {
    locked = true,
    doorRate = 1.0,
    authorizedCitizenIDs = { ['YIJ71028'] = true },
    doorLabel = 'Gate',
    doors = {
        {objName = 1738619932, objYaw = 239.47058105469, objCoords = vec3(-3117.528076, 1387.171143, 22.915178)},
        {objName = 1738619932, objYaw = 239.50915527344, objCoords = vec3(-3117.520264, 1387.184570, 24.073977)}
    },
    distance = 8,
    doorType = 'doublesliding',
    pickable = true,
}

-- Front Door created by Manish
Config.DoorList['Great Ocean Hwy 6-Front Door'] = {
    authorizedCitizenIDs = { ['YIJ71028'] = true },
    doorRate = 1.0,
    pickable = true,
    doorLabel = 'Door',
    doors = {
        {objName = -1454760130, objYaw = 237.0, objCoords = vec3(-3141.552002, 1391.924683, 24.756975)},
        {objName = 1245831483, objYaw = 237.0, objCoords = vec3(-3142.757080, 1390.069092, 24.756975)}
    },
    distance = 3,
    doorType = 'double',
    locked = true,
}

-- Side Door created by Manish
Config.DoorList['Great Ocean Hwy 6-Side Door'] = {
    authorizedCitizenIDs = { ['YIJ71028'] = true },
    doorRate = 1.0,
    pickable = true,
    doorLabel = 'Door',
    doors = {
        {objName = -1454760130, objYaw = 234.66564941406, objCoords = vec3(-3132.960938, 1375.361328, 24.793886)},
        {objName = 1245831483, objYaw = 234.66564941406, objCoords = vec3(-3134.239258, 1373.556885, 24.793886)}
    },
    distance = 3,
    doorType = 'double',
    locked = true,
}

-- Side Door 2 created by Manish
Config.DoorList['Great Ocean Hwy 6-Side Door 2'] = {
    authorizedCitizenIDs = { ['YIJ71028'] = true },
    doorRate = 1.0,
    pickable = true,
    doorLabel = 'Door',
    doors = {
        {objName = 1245831483, objYaw = 147.00019836426, objCoords = vec3(-3151.852295, 1397.237549, 24.716875)},
        {objName = -1454760130, objYaw = 146.99998474121, objCoords = vec3(-3150.005127, 1396.032593, 24.716875)}
    },
    distance = 3,
    doorType = 'double',
    locked = true,
}

-- Room 1 Door 1 created by Manish
Config.DoorList['Great Ocean Hwy 6-Room 1 Door 1'] = {
    doorType = 'door',
    doorLabel = 'Door',
    distance = 3,
    objCoords = vec3(-3149.099854, 1402.561890, 28.106876),
    authorizedCitizenIDs = { ['YIJ71028'] = true },
    pickable = true,
    objName = -264728216,
    fixText = false,
    doorRate = 1.0,
    objYaw = 236.54638671875,
    locked = true,
}