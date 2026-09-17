-- Businesses
ConfigBusiness = {}

ConfigBusiness.DefaultMargin = 20 -- price margin in percent (percentage of price business will receive on tattoo purchase)
ConfigBusiness.MinMargin = 0 -- minimal price margin that business owner can set in percents
ConfigBusiness.MaxMargin = 50 -- maximal price margin that business owner can set in percents

-- Tattooing Minigame
ConfigBusiness.MinigameDifficulty = 1.0 -- Multiplier of tattooing minigame difficulty, default = 1.0
ConfigBusiness.MinigameConfirmTimeout = 10000 -- Time in ms for employee to confirm start of tattooing, default = 10000 (10sec)
ConfigBusiness.TutorialReadTimeFirst = 4000 -- Time in ms for employee to read minigame tutorial before it starts for first time since logging in to server, default = 4000 (4s)
ConfigBusiness.TutorialReadTime = 500 -- Same as `TutorialReadTimeFirst`, but for all but first minigame plays, default = 500 (0.5s)

-- If true, grades defined for the specific business here in config will be added to ESX `job_grades` table.
-- For settings of the grades, check the documentation.
ConfigBusiness.AutoInsertJobGrades = false

-- Settings for ESX bossmenu
ConfigBusiness.DefaultESXMenuOptions = {
    withdraw = true,
    deposit = true,
    wash = false,
    employees = true,
    grades = true,
}

ConfigBusiness.Businesses = {
    tattoos = {
        enabled = true,
        businessName = "tattoos",
        owner = "license:1f0adae45727ca9ff309606a27e9f32212bf61e5",
        bossMenu = {
            pos   = vector3(321.8, 185.55, 103.59),
            size  = vector3(1, 1, 1),
            color = {r=255, g=255, b=255, a=255},
            markerLabel = '💼'
        },
        job = {
            enabled = true,
            label= "Ink Jet",
            employeeMarkerLabel = "🖌",
            customerAnim = {
                sitting = {
                    pos = vector4(324.19, 181.24, 104.44, 0),
                    animName = 'ig_5_p3_base',
                    animDict = 'timetable@ron@ig_5_p3',
                },
            },
            employeeAnim = {
                idle = {
                    pos = vector3(323.61, 181.79, 103.59),
                    animName = '_idle_a',
                    animDict = 'random@shop_tattoo',
                },
                tattoo = {
                    animName = 'machinic_loop_mechandplayer',
                    animDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
                },
            },
            grades = {
                {
                    name = 'novice',
                },
                {
                    name = 'apprentice',
                },
                {
                    name = 'artist',
                },
                {
                    name = 'boss',
                    isBoss = true,
                },
            },
        },
    }
}
