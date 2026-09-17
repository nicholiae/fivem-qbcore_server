

-- REfrontdoor created by Nicholiae
Config.DoorList['RealestateHQ-REfrontdoor'] = {
    locked = true,
    doorLabel = 'frontdoor',
    doorType = 'double',
    doorRate = 1.0,
    doors = {
        {objName = -1922281023, objYaw = 295.49960327148, objCoords = vec3(-698.747864, 269.975983, 83.414627)},
        {objName = -1922281023, objYaw = 115.49955749512, objCoords = vec3(-699.655945, 271.888641, 83.414963)}
    },
    distance = 3,
    authorizedJobs = { ['realestate'] = 0 },
}

-- REsidedoor created by Nicholiae
Config.DoorList['RealestateHQ-REsidedoor'] = {
    fixText = false,
    doorRate = 1.0,
    objCoords = vec3(-716.373047, 270.603546, 84.815918),
    objName = 1901183774,
    authorizedJobs = { ['realestate'] = 0 },
    objYaw = 295.099609375,
    distance = 3,
    locked = true,
    doorLabel = 'sideDoor',
    doorType = 'door',
}