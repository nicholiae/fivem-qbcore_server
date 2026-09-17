

-- PFrontDoor created by Nicholiae
Config.DoorList['PoliceStation-PFrontDoor'] = {
    doorType = 'double',
    pickable = true,
    locked = false,
    doorRate = 1.0,
    doors = {
        {objName = -455606889, objYaw = 0.0, objCoords = vec3(431.060272, -991.165955, 31.391621)},
        {objName = -1080675648, objYaw = 0.0, objCoords = vec3(431.059784, -988.367615, 31.391621)}
    },
    doorLabel = 'Front Door',
    distance = 3,
    authorizedJobs = { ['police'] = 0 },
}

-- PFrontDoor2 created by Nicholiae
Config.DoorList['PoliceStation-PFrontDoor2'] = {
    doorType = 'double',
    pickable = true,
    locked = true,
    doorRate = 1.0,
    doors = {
        {objName = -955193725, objYaw = 0.0, objCoords = vec3(442.364838, -988.733093, 31.290430)},
        {objName = -955193725, objYaw = 179.99998474121, objCoords = vec3(442.364838, -990.805847, 31.290430)}
    },
    doorLabel = 'Front Door2',
    distance = 3,
    authorizedJobs = { ['police'] = 0 },
}

-- PLobbyService created by Nicholiae
Config.DoorList['PoliceStation-PLobbyService'] = {
    doorType = 'door',
    pickable = true,
    doorRate = 1.0,
    objCoords = vec3(442.317780, -982.778564, 31.144932),
    doorLabel = 'Lobby Service Door',
    locked = true,
    fixText = false,
    objYaw = 89.999977111816,
    objName = 670041543,
    distance = 3,
    authorizedJobs = { ['police'] = 0 },
}


-- PSecondFloorMain created by Nicholiae
Config.DoorList['PoliceStation-PSecondFloorMain'] = {
    doorType = 'double',
    doors = {
        {objName = -1710985036, objYaw = 0.0, objCoords = vec3(464.890808, -980.219177, 35.912640)},
        {objName = -1710985036, objYaw = 179.99998474121, objCoords = vec3(462.410889, -980.219177, 35.912640)}
    },
    locked = true,
    doorLabel = 'Officer Doors',
    doorRate = 1.0,
    pickable = true,
    authorizedJobs = { ['police'] = 0 },
    distance = 3,
}

-- PBasementFloorArmory created by Nicholiae
Config.DoorList['PoliceStation-PBasementFloorArmory'] = {
    doorType = 'door',
    fixText = false,
    pickable = true,
    doorLabel = 'Armory Door',
    objCoords = vec3(430.037933, -982.036438, 21.711424),
    doorRate = 1.0,
    objName = 2147170473,
    locked = true,
    objYaw = 0.0,
    authorizedJobs = { ['police'] = 0 },
    distance = 3,
}

-- PBasementFloorEvidence created by Nicholiae
Config.DoorList['PoliceStation-PBasementFloorEvidence'] = {
    doorType = 'door',
    fixText = false,
    pickable = true,
    doorLabel = 'Evidence Door',
    objCoords = vec3(435.333313, -982.033997, 21.710968),
    doorRate = 1.0,
    objName = 2147170473,
    locked = true,
    objYaw = 0.0,
    authorizedJobs = { ['police'] = 0 },
    distance = 3,
}

-- PBasementFloorJailMain created by Nicholiae
Config.DoorList['PoliceStation-PBasementFloorJailMain'] = {
    doorType = 'double',
    doors = {
        {objName = 687225737, objYaw = 0.0, objCoords = vec3(449.795074, -990.852051, 21.709694)},
        {objName = 687225737, objYaw = 180.00001525879, objCoords = vec3(449.795074, -988.251160, 21.709694)}
    },
    locked = true,
    doorLabel = 'Jail Hall',
    doorRate = 1.0,
    pickable = true,
    authorizedJobs = { ['police'] = 0 },
    distance = 3,
}

-- PBasementFloorInteregationMain created by Nicholiae
Config.DoorList['PoliceStation-PBasementFloorInteregationMain'] = {
    doorType = 'double',
    doors = {
        {objName = 687225737, objYaw = 89.999977111816, objCoords = vec3(458.800079, -987.424927, 21.712408)},
        {objName = 687225737, objYaw = 270.00003051758, objCoords = vec3(456.198792, -987.424927, 21.712408)}
    },
    locked = true,
    doorLabel = 'Interegation Hall',
    doorRate = 1.0,
    pickable = true,
    authorizedJobs = { ['police'] = 0 },
    distance = 3,
}

-- PBasementFloorJailMainA created by Nicholiae
Config.DoorList['PoliceStation-PBasementFloorJailMainA'] = {
    doorType = 'door',
    fixText = false,
    pickable = true,
    doorLabel = 'Jail Hall A',
    objCoords = vec3(465.728455, -988.899231, 21.709818),
    doorRate = 1.0,
    objName = -562300705,
    locked = true,
    objYaw = 0.0,
    authorizedJobs = { ['police'] = 0 },
    distance = 3,
}

-- PBasementFloorJailMainB created by Nicholiae
Config.DoorList['PoliceStation-PBasementFloorJailMainB'] = {
    doorType = 'door',
    fixText = false,
    pickable = true,
    doorLabel = 'Jail Hall B',
    objCoords = vec3(470.962311, -987.526550, 21.708969),
    doorRate = 1.0,
    objName = -562300705,
    locked = true,
    objYaw = 89.999992370605,
    authorizedJobs = { ['police'] = 0 },
    distance = 3,
}

-- PBasementFloorJailCell01 created by Nicholiae
Config.DoorList['PoliceStation-PBasementFloorJailCell01'] = {
    doorType = 'door',
    fixText = false,
    pickable = true,
    doorLabel = 'Jail Cell 01',
    objCoords = vec3(469.533295, -984.439087, 21.717112),
    doorRate = 1.0,
    objName = -562300705,
    locked = true,
    objYaw = 1.0017911336035e-05,
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
}

-- PBasementFloorJailCell02 created by Nicholiae
Config.DoorList['PoliceStation-PBasementFloorJailCell02'] = {
    doorType = 'door',
    fixText = false,
    pickable = true,
    doorLabel = 'Jail Cell 02',
    objCoords = vec3(469.533295, -980.384949, 21.717112),
    doorRate = 1.0,
    objName = -562300705,
    locked = true,
    objYaw = 1.0017911336035e-05,
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
}

-- PBasementFloorJailCell03 created by Nicholiae
Config.DoorList['PoliceStation-PBasementFloorJailCell03'] = {
    doorType = 'door',
    fixText = false,
    pickable = true,
    doorLabel = 'Jail Cell 03',
    objCoords = vec3(469.533295, -976.330139, 21.717112),
    doorRate = 1.0,
    objName = -562300705,
    locked = true,
    objYaw = 1.0017911336035e-05,
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
}

-- PBasementFloorJailCell04 created by Nicholiae
Config.DoorList['PoliceStation-PBasementFloorJailCell04'] = {
    doorType = 'door',
    fixText = false,
    pickable = true,
    doorLabel = 'Jail Cell 04',
    objCoords = vec3(469.530518, -972.276184, 21.708540),
    doorRate = 1.0,
    objName = -562300705,
    locked = true,
    objYaw = 1.0017911336035e-05,
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
}

-- PBasementFloorJailCell05 created by Nicholiae
Config.DoorList['PoliceStation-PBasementFloorJailCell05'] = {
    doorType = 'door',
    fixText = false,
    pickable = true,
    doorLabel = 'Jail Cell 05',
    objCoords = vec3(473.682434, -973.576904, 21.715239),
    doorRate = 1.0,
    objName = -562300705,
    locked = true,
    objYaw = 180.00001525879,
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
}

-- PBasementFloorJailCell06 created by Nicholiae
Config.DoorList['PoliceStation-PBasementFloorJailCell06'] = {
    doorType = 'door',
    fixText = false,
    pickable = true,
    doorLabel = 'Jail Cell 06',
    objCoords = vec3(473.682434, -977.631226, 21.715239),
    doorRate = 1.0,
    objName = -562300705,
    locked = true,
    objYaw = 180.00001525879,
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
}

-- PBasementFloorJailCell07 created by Nicholiae
Config.DoorList['PoliceStation-PBasementFloorJailCell07'] = {
    doorType = 'door',
    fixText = false,
    pickable = true,
    doorLabel = 'Jail Cell 07',
    objCoords = vec3(473.682434, -981.685608, 21.715239),
    doorRate = 1.0,
    objName = -562300705,
    locked = true,
    objYaw = 180.00001525879,
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
}

-- PBasementFloorJailCell08 created by Nicholiae
Config.DoorList['PoliceStation-PBasementFloorJailCell08'] = {
    doorType = 'door',
    fixText = false,
    pickable = true,
    doorLabel = 'Jail Cell 08',
    objCoords = vec3(473.682434, -985.740356, 21.715239),
    doorRate = 1.0,
    objName = -562300705,
    locked = true,
    objYaw = 180.00001525879,
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
}

-- PBasementFloorGarage created by Nicholiae
Config.DoorList['PoliceStation-PBasementFloorGarage'] = {
    doorType = 'door',
    fixText = false,
    pickable = true,
    doorLabel = 'Garage Door',
    objCoords = vec3(447.834045, -992.424011, 21.707541),
    doorRate = 1.0,
    objName = 2147170473,
    locked = true,
    objYaw = 0.0,
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
}

-- PBasementFloorArmoryHall created by Nicholiae
Config.DoorList['PoliceStation-PBasementFloorArmoryHall'] = {
    doorType = 'double',
    doors = {
        {objName = 687225737, objYaw = 179.99998474121, objCoords = vec3(438.507904, -982.852356, 21.716755)},
        {objName = 687225737, objYaw = 0.0, objCoords = vec3(438.507904, -985.453613, 21.716755)}
    },
    locked = true,
    doorLabel = 'Armory Hall Door',
    doorRate = 1.0,
    pickable = true,
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
}

-- PBasementFloorStairs created by Nicholiae
Config.DoorList['PoliceStation-PBasementFloorStairs'] = {
    doorType = 'door',
    fixText = false,
    pickable = true,
    doorLabel = 'Basement Floor Stairs',
    objCoords = vec3(444.214447, -981.055481, 21.703850),
    doorRate = 1.0,
    objName = 687225737,
    locked = true,
    objYaw = 89.999977111816,
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
}

-- PGroundFloorStairs created by Nicholiae
Config.DoorList['PoliceStation-PGroundFloorStairs'] = {
    doorType = 'door',
    fixText = false,
    pickable = true,
    doorLabel = 'Ground Floor Stairs',
    objCoords = vec3(447.366730, -980.634888, 31.149248),
    doorRate = 1.0,
    objName = 541222087,
    locked = true,
    objYaw = 0.0,
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
}

-- PSecondFloorStairs created by Nicholiae
Config.DoorList['PoliceStation-PSecondFloorStairs'] = {
    doorType = 'door',
    fixText = false,
    pickable = true,
    doorLabel = 'Second Floor Stairs',
    objCoords = vec3(447.369049, -980.622314, 35.918812),
    doorRate = 1.0,
    objName = 541222087,
    locked = true,
    objYaw = 0.0,
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
}

-- PRoofAccessStairs created by Nicholiae
Config.DoorList['PoliceStation-PRoofAccessStairs'] = {
    doorType = 'door',
    fixText = false,
    pickable = true,
    doorLabel = 'Roof Access',
    objCoords = vec3(451.113495, -981.132568, 45.119274),
    doorRate = 1.0,
    objName = -340230128,
    locked = true,
    objYaw = 179.99998474121,
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
}

-- PChiefOffice created by Nicholiae
Config.DoorList['PoliceStation-PChiefOffice'] = {
    doorType = 'door',
    fixText = false,
    pickable = true,
    doorLabel = 'Chiefs Office',
    objCoords = vec3(435.179077, -981.994995, 35.920650),
    doorRate = 1.0,
    objName = -884650166,
    locked = true,
    objYaw = 89.999977111816,
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
}

-- PChiefOfficeLobby created by Nicholiae
Config.DoorList['PoliceStation-PChiefOfficeLobby'] = {
    doorType = 'double',
    doors = {
        {objName = -1710985036, objYaw = 90.000022888184, objCoords = vec3(438.741333, -981.733948, 35.919502)},
        {objName = -1710985036, objYaw = 270.00003051758, objCoords = vec3(438.741333, -984.214539, 35.919502)}
    },
    locked = true,
    doorLabel = 'Chiefs Office Lobby',
    doorRate = 1.0,
    pickable = true,
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
}

-- PInteregationRoomsA created by Nicholiae
Config.DoorList['PoliceStation-PInteregationRoomsA'] = {
    doorLabel = 'Interegation Room A',
    pickable = true,
    doorRate = 1.0,
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
    fixText = false,
    objCoords = vec3(455.488831, -985.440491, 21.719433),
    locked = true,
    objYaw = 180.00001525879,
    doorType = 'door',
    objName = -217337579,
}

-- PInteregationRoomsB created by Nicholiae
Config.DoorList['PoliceStation-PInteregationRoomsB'] = {
    doorLabel = 'Interegation Room B',
    pickable = true,
    doorRate = 1.0,
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
    fixText = false,
    objCoords = vec3(459.507690, -985.447083, 21.719433),
    locked = true,
    objYaw = 179.99996948242,
    doorType = 'door',
    objName = -217337579,
}

-- GarageDoor1 created by ndsha
Config.DoorList['PoliceStation-GarageDoor1'] = {
    authorizedJobs = { ['police'] = 0 },
    objName = -1095264088,
    pickable = true,
    fixText = false,
    doorRate = 1.0,
    objYaw = 89.999961853027,
    locked = true,
    doorType = 'garage',
    objCoords = vec3(461.288757, -998.191528, 22.781460),
    distance = 6,
    doorLabel = 'Door',
}