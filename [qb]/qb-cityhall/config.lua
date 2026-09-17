Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.AvailableJobs = {                                     -- Only used when not using qb-jobs.
    ['trucker'] = { ['label'] = 'Trucker', ['isManaged'] = false },
    ['taxi'] = { ['label'] = 'Taxi', ['isManaged'] = false },
    ['tow'] = { ['label'] = 'Tow Truck', ['isManaged'] = true },
    -- ['reporter'] = { ['label'] = 'News Reporter', ['isManaged'] = false },
    ['garbage'] = { ['label'] = 'Garbage Collector', ['isManaged'] = false },
    ['bus'] = { ['label'] = 'Bus Driver', ['isManaged'] = false },
    ['hotdog'] = { ['label'] = 'Hot Dog Stand', ['isManaged'] = false }
}

Config.Cityhalls = {
    { -- Cityhall 1
        coords = vec3(-550.89, -193.82, 38.22),
        showBlip = true,
        blipData = {
            sprite = 487,
            display = 4,
            scale = 0.65,
            colour = 0,
            title = 'City Hall'
        },
        licenses = {
            ['id_card'] = {
                label = 'ID Card',
                cost = 75,
            },
            ['driver_license'] = {
                label = 'Driver License',
                cost = 100,
                metadata = 'driver'
            },
            ['weaponlicense'] = {
                label = 'Weapon License',
                cost = 500,
                metadata = 'weapon'
            },
            ['xscript'] = {
                label = 'Xanax Script',
                cost = 1000,
                metadata = 'xscript'
            },
            ['mscript'] = {
                label = 'Morphine Script',
                cost = 1000,
                metadata = 'mscript'
            },
            ['oscript'] = {
                label = 'Oxycodone Script',
                cost = 1000,
                metadata = 'oscript'
            },
            ['ascript'] = {
                label = 'Amoxixillin Script',
                cost = 1000,
                metadata = 'ascript'
            },
            ['iscript'] = {
                label = 'Ibuprofen Script',
                cost = 1000,
                metadata = 'iscript'
            },
        }
    },
}

Config.DrivingSchools = {
    { -- Driving School 1
        coords = vec3(-560.02, -204.26, 38.22),
        showBlip = true,
        blipData = {
            sprite = 225,
            display = 4,
            scale = 0.65,
            colour = 3,
            title = 'Driving School'
        },
        instructors = {
            'GUX51858',
            'HQR12147',
            'UBE55858',
        }
    },
}

Config.Peds = {
    -- Cityhall Ped
    {
        model = 'a_m_m_hasjew_01',
        coords = vec4(-551.17, -193.82, 37.22, 206.16),
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        cityhall = true,
        zoneOptions = { -- Used for when UseTarget is false
            length = 3.0,
            width = 3.0,
            debugPoly = false
        }
    },
    -- Driving School Ped
    {
        model = 'a_m_m_eastsa_02',
        coords = vec4(-560.02, -204.26, 37.22, 128.04),
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        drivingschool = true,
        zoneOptions = { -- Used for when UseTarget is false
            length = 3.0,
            width = 3.0
        }
    }
}
