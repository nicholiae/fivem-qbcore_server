Config = {}

Config.Locale = 'en' -- en, fr
Config.Target = 'ox-target' -- 'q-target', 'qb-target', 'ox-target'

Config.UseKeys = { -- KEY FOR SHOWER AND WASHHAD
    Active = true, -- Set false for desactivate Key
    Key = 38, -- If you want to use a keybind, use the following format: https://docs.fivem.net/docs/game-references/controls/
}

Config.framework = 'QB' -- ESX or QB or custom or standalone

Config.job = 'ambulance' -- attorised job

Config.Debug = false -- Enables debugging

Config.Perfusions = true

Config.LieBed = true
Config.LieBedKey = true -- Enable Key for lie on bed 
Config.LieBedHelpText = true -- Enable Help Text for lie on bed 
Config.LieKey = 38
Config.PushBedKey = 23
Config.DropBedKey = 23

-- If Config.BedInHospitalOnly is set to false, the script will apply to all beds and take 0.01 resmon from the entire map
Config.BedInHospitalOnly = true  -- Set to false if you want it to apply globally
Config.BedInHospitalOnlyAutoDeleteBed = true -- If is set to true, beds that are outside the hospital zone will be automatically deleted.
Config.DebugDist = false -- Set Config.DebugDist to true to properly configure the distance for new zones. The FID will serve as the zone name.


Config.BedInHospitalOnlyCoords = {
    { id = 1, coords = vector3(326.60, -586.40, 53.15), fid = "hospital_bed_1", distance = 4000.0 },
    --{ id = 2, coords = vector3(333.60, -588.40, 53.15), fid = "hospital_bed_2", distance = 3000.0 },
    --{ id = 3, coords = vector3(350.60, -590.40, 53.15), fid = "hospital_bed_3", distance = 5000.0 },
    -- Add more beds as needed with their specific distance
}

Config.Showers = true
Config.CommandShowers = "showers"
Config.TimesShowers = 18 -- Default 18 , Time in seconds

Config.WashHands = true
Config.CommandWashHands = "washHands"
Config.TimesWashHands = 15 -- Time in seconds

Config.ProgressBars = 'ox_lib' -- 'false', 'quasar', 'ox_lib'