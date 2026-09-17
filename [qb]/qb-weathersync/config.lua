Config                  = {}
Config.DynamicWeather   = true -- Set this to false if you don't want the weather to change automatically every 10 minutes.

-- On server start
Config.StartWeather     = 'EXTRASUNNY' -- Default weather                       default: 'EXTRASUNNY'
Config.BaseTime         = 8 -- Time                                             default: 8
Config.TimeOffset       = 0 -- Time offset                                      default: 0
Config.FreezeTime       = false -- freeze time                                  default: false
Config.Blackout         = false -- Set blackout                                 default: false
Config.BlackoutVehicle  = true -- Set blackout affects vehicles                default: false
Config.NewWeatherTimer  = 30 -- Time (in minutes) between each weather change   default: 10
Config.Disabled         = false -- Set weather disabled                         default: false
Config.RealTimeSync     = false -- Activate realtime synchronization            default: false

-- ============================================
-- SEASONAL WEATHER SYSTEM CONFIGURATION
-- ============================================
Config.EnableSeasons    = true -- Enable automatic seasonal weather changes based on real-time date
Config.Hemisphere       = 'north' -- 'north' or 'south' - Determines which hemisphere seasons to use

-- Season Date Ranges (Northern Hemisphere)
-- These are automatically reversed for Southern Hemisphere
Config.SeasonDates = {
    spring = { start = {month = 3, day = 20}, finish = {month = 6, day = 20} },  -- March 20 - June 20
    summer = { start = {month = 6, day = 21}, finish = {month = 9, day = 22} },  -- June 21 - September 22
    autumn = { start = {month = 9, day = 23}, finish = {month = 12, day = 20} }, -- September 23 - December 20
    winter = { start = {month = 12, day = 21}, finish = {month = 3, day = 19} }  -- December 21 - March 19
}

-- Seasonal Weather Pools with Probability Weights
-- Higher weight = more likely to occur
-- Weights are relative (e.g., 30 is 3x more likely than 10)
Config.SeasonalWeather = {
    spring = {
        -- Spring: Mix of clear, rainy, and cloudy weather
        { weather = 'EXTRASUNNY', weight = 20 },
        { weather = 'CLEAR', weight = 25 },
        { weather = 'CLOUDS', weight = 20 },
        { weather = 'OVERCAST', weight = 15 },
        { weather = 'RAIN', weight = 15 },
        { weather = 'THUNDER', weight = 5 },
        { weather = 'FOGGY', weight = 10 },
    },
    summer = {
        -- Summer: Mostly sunny with occasional storms
        { weather = 'EXTRASUNNY', weight = 40 },
        { weather = 'CLEAR', weight = 35 },
        { weather = 'CLOUDS', weight = 10 },
        { weather = 'OVERCAST', weight = 5 },
        { weather = 'THUNDER', weight = 5 },
        { weather = 'SMOG', weight = 5 },
    },
    autumn = {
        -- Autumn: Cooler, more overcast and rainy
        { weather = 'CLEAR', weight = 15 },
        { weather = 'CLOUDS', weight = 20 },
        { weather = 'OVERCAST', weight = 25 },
        { weather = 'FOGGY', weight = 15 },
        { weather = 'RAIN', weight = 20 },
        { weather = 'THUNDER', weight = 5 },
    },
    winter = {
        -- Winter: Snow, overcast, and cold weather
        { weather = 'SNOW', weight = 25 },
        { weather = 'SNOWLIGHT', weight = 20 },
        { weather = 'BLIZZARD', weight = 10 },
        { weather = 'OVERCAST', weight = 20 },
        { weather = 'CLOUDS', weight = 15 },
        { weather = 'FOGGY', weight = 10 },
        { weather = 'XMAS', weight = 5 }, -- Optional: Christmas weather
    }
}

-- Special Event Weather (overrides seasonal weather when enabled)
-- Set the date range and weather type for special events
Config.SpecialEvents = {
    halloween = {
        enabled = true,
        start = {month = 10, day = 25},
        finish = {month = 11, day = 1},
        weather = 'HALLOWEEN'
    },
    christmas = {
        enabled = true,
        start = {month = 12, day = 20},
        finish = {month = 12, day = 26},
        weather = 'XMAS'
    }
}

Config.AvailableWeatherTypes = { -- DON'T TOUCH EXCEPT IF YOU KNOW WHAT YOU ARE DOING
    'EXTRASUNNY',
    'CLEAR',
    'NEUTRAL',
    'SMOG',
    'FOGGY',
    'OVERCAST',
    'CLOUDS',
    'CLEARING',
    'RAIN',
    'THUNDER',
    'SNOW',
    'BLIZZARD',
    'SNOWLIGHT',
    'XMAS',
    'HALLOWEEN',
}