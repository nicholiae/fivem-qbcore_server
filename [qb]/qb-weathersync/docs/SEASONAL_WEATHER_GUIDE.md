# 🌦️ Seasonal Weather System - Complete Guide

## Overview

This enhanced weather system automatically adjusts weather patterns based on real-time seasons, providing an immersive and realistic weather experience for your FiveM server. The system detects the current season based on the server's date and applies appropriate weather patterns with configurable probabilities.

---

## 🌟 Key Features

### ✅ Automatic Season Detection
- Detects current season based on real-time date
- Supports both Northern and Southern hemispheres
- Automatically adjusts season dates for hemisphere

### ✅ Seasonal Weather Pools
- Each season has its own weather pool with probability weights
- **Spring**: Mix of sunny, rainy, and cloudy weather
- **Summer**: Predominantly sunny with occasional storms
- **Autumn**: Cooler, more overcast and rainy conditions
- **Winter**: Snow, blizzards, and cold weather

### ✅ Special Event Support
- Halloween weather (October 25 - November 1)
- Christmas weather (December 20 - December 26)
- Easily add custom events with date ranges

### ✅ Hemisphere Support
- Northern Hemisphere (default)
- Southern Hemisphere (reversed seasons)

### ✅ Fully Configurable
- Adjust weather probabilities per season
- Enable/disable seasonal system
- Customize special events
- Fine-tune weather change intervals

---

## 📋 Installation

1. **Backup Your Current Config**
   ```bash
   # Make a backup of your existing config.lua
   cp config.lua config.lua.backup
   ```

2. **Replace Files**
   - Replace `config.lua` with the new enhanced version
   - Replace `server/server.lua` with the new enhanced version
   - Keep your existing `client/client.lua` (no changes needed)

3. **Configure Settings**
   - Open `config.lua`
   - Set your hemisphere: `Config.Hemisphere = 'north'` or `'south'`
   - Adjust seasonal weather pools if desired
   - Enable/disable special events

4. **Restart Resource**
   ```
   restart qb-weathersync
   ```

---

## ⚙️ Configuration Guide

### Basic Settings

```lua
-- Enable/Disable Seasonal Weather
Config.EnableSeasons = true  -- Set to false to use original weather system

-- Set Your Hemisphere
Config.Hemisphere = 'north'  -- Options: 'north' or 'south'
```

### Seasonal Weather Pools

Each season has a weather pool with weighted probabilities. Higher weights mean higher chances of occurrence.

**Example: Spring Configuration**
```lua
spring = {
    { weather = 'EXTRASUNNY', weight = 20 },  -- 20% relative chance
    { weather = 'CLEAR', weight = 25 },       -- 25% relative chance
    { weather = 'CLOUDS', weight = 20 },      -- 20% relative chance
    { weather = 'OVERCAST', weight = 15 },    -- 15% relative chance
    { weather = 'RAIN', weight = 15 },        -- 15% relative chance
    { weather = 'THUNDER', weight = 5 },      -- 5% relative chance
}
```

**How Weights Work:**
- Total weight = 20 + 25 + 20 + 15 + 15 + 5 = 100
- EXTRASUNNY has 20/100 = 20% chance
- CLEAR has 25/100 = 25% chance
- And so on...

### Special Events

Configure special events that override seasonal weather:

```lua
Config.SpecialEvents = {
    halloween = {
        enabled = true,                      -- Enable/disable this event
        start = {month = 10, day = 25},     -- October 25
        finish = {month = 11, day = 1},     -- November 1
        weather = 'HALLOWEEN'                -- Weather type during event
    },
    christmas = {
        enabled = true,
        start = {month = 12, day = 20},     -- December 20
        finish = {month = 12, day = 26},    -- December 26
        weather = 'XMAS'
    }
}
```

**Adding Custom Events:**
```lua
newyear = {
    enabled = true,
    start = {month = 12, day = 31},
    finish = {month = 1, day = 2},
    weather = 'EXTRASUNNY'
}
```

---

## 🎮 Commands

### New Seasonal Commands

**Check Current Season**
```
/season
```
Displays the current season and hemisphere setting.

### Existing Commands (Still Work)

```
/weather [type]      - Set weather manually
/freezeweather       - Toggle dynamic weather on/off
/time [hour] [min]   - Set time
/freezetime          - Toggle time freeze
/blackout            - Toggle blackout
/morning             - Set time to 9:00 AM
/noon                - Set time to 12:00 PM
/evening             - Set time to 6:00 PM
/night               - Set time to 11:00 PM
```

---

## 🔧 Advanced Customization

### Adjusting Season Dates

If you want to customize when seasons start/end:

```lua
Config.SeasonDates = {
    spring = { start = {month = 3, day = 20}, finish = {month = 6, day = 20} },
    summer = { start = {month = 6, day = 21}, finish = {month = 9, day = 22} },
    autumn = { start = {month = 9, day = 23}, finish = {month = 12, day = 20} },
    winter = { start = {month = 12, day = 21}, finish = {month = 3, day = 19} }
}
```

### Creating Custom Weather Pools

You can create entirely custom weather distributions:

```lua
-- Example: Very rainy spring
spring = {
    { weather = 'RAIN', weight = 40 },
    { weather = 'THUNDER', weight = 30 },
    { weather = 'OVERCAST', weight = 20 },
    { weather = 'CLEAR', weight = 10 },
}

-- Example: Perpetual summer sunshine
summer = {
    { weather = 'EXTRASUNNY', weight = 90 },
    { weather = 'CLEAR', weight = 10 },
}
```

### Disabling Specific Weather Types

Simply remove or set weight to 0:

```lua
winter = {
    { weather = 'SNOW', weight = 30 },
    { weather = 'OVERCAST', weight = 40 },
    { weather = 'CLOUDS', weight = 30 },
    -- BLIZZARD removed - won't occur
}
```

---

## 📊 Available Weather Types

```
EXTRASUNNY  - Extra sunny, clear skies
CLEAR       - Clear weather
NEUTRAL     - Neutral weather
SMOG        - Smoggy conditions
FOGGY       - Foggy weather
OVERCAST    - Overcast skies
CLOUDS      - Cloudy weather
CLEARING    - Clearing up
RAIN        - Rainy weather
THUNDER     - Thunderstorms
SNOW        - Snowy weather
BLIZZARD    - Blizzard conditions
SNOWLIGHT   - Light snow
XMAS        - Christmas weather (snow with trails)
HALLOWEEN   - Halloween weather (foggy/spooky)
```

---

## 🌍 Hemisphere Examples

### Northern Hemisphere (Default)
- **Spring**: March 20 - June 20
- **Summer**: June 21 - September 22
- **Autumn**: September 23 - December 20
- **Winter**: December 21 - March 19

### Southern Hemisphere
- **Autumn**: March 20 - June 20
- **Winter**: June 21 - September 22
- **Spring**: September 23 - December 20
- **Summer**: December 21 - March 19

---

## 🐛 Troubleshooting

### Weather Not Changing
1. Check if `Config.DynamicWeather = true`
2. Check if `Config.EnableSeasons = true`
3. Verify weather timer: `Config.NewWeatherTimer = 15` (minutes)
4. Check server console for errors

### Wrong Season Detected
1. Verify server date/time is correct: `date` command in server console
2. Check hemisphere setting: `Config.Hemisphere = 'north'` or `'south'`
3. Use `/season` command to check current season

### Special Events Not Working
1. Check if event is enabled: `enabled = true`
2. Verify date ranges are correct
3. Ensure dates don't overlap with other events

### Weather Stuck on One Type
1. Check if weather is frozen: `/freezeweather`
2. Verify weather pool has multiple types with weights > 0
3. Try manually changing weather: `/weather clear`

---

## 🔌 Exports

### Get Current Season
```lua
local season = exports['qb-weathersync']:getCurrentSeason()
-- Returns: 'spring', 'summer', 'autumn', or 'winter'
```

### Get Seasonal Weather
```lua
local weather = exports['qb-weathersync']:getSeasonalWeather('winter')
-- Returns a random weather type from winter pool
```

### Get Current Weather
```lua
local weather = exports['qb-weathersync']:getWeatherState()
-- Returns current weather type
```

### Set Weather Manually
```lua
exports['qb-weathersync']:setWeather('RAIN')
```

---

## 💡 Tips & Best Practices

1. **Test Your Configuration**: Use `/season` and `/weather` commands to test
2. **Balance Weights**: Make sure total weights per season are reasonable
3. **Consider Gameplay**: Don't make weather too extreme (e.g., constant blizzards)
4. **Special Events**: Use sparingly for maximum impact
5. **Server Performance**: Default timer (15 min) is optimal for most servers
6. **Hemisphere**: Set correctly for your server's target audience location

---

## 📝 Example Configurations

### Tropical Server (Mostly Sunny)
```lua
Config.SeasonalWeather = {
    spring = {
        { weather = 'EXTRASUNNY', weight = 50 },
        { weather = 'CLEAR', weight = 40 },
        { weather = 'RAIN', weight = 10 },
    },
    summer = {
        { weather = 'EXTRASUNNY', weight = 70 },
        { weather = 'CLEAR', weight = 25 },
        { weather = 'THUNDER', weight = 5 },
    },
    -- Similar for autumn/winter
}
```

### Harsh Climate Server (Extreme Weather)
```lua
Config.SeasonalWeather = {
    winter = {
        { weather = 'BLIZZARD', weight = 40 },
        { weather = 'SNOW', weight = 30 },
        { weather = 'SNOWLIGHT', weight = 20 },
        { weather = 'OVERCAST', weight = 10 },
    },
    summer = {
        { weather = 'THUNDER', weight = 30 },
        { weather = 'RAIN', weight = 30 },
        { weather = 'EXTRASUNNY', weight = 40 },
    },
}
```

### Balanced Realistic Server
```lua
-- Use the default configuration provided
-- It offers realistic weather patterns for each season
```

---

## 🆘 Support

If you encounter issues:
1. Check server console for error messages
2. Verify all configuration syntax is correct
3. Test with default configuration first
4. Check FiveM forums for similar issues
5. Review this guide thoroughly

---

## 📜 Changelog

### Version 2.0 - Seasonal Weather System
- ✅ Added automatic season detection
- ✅ Added seasonal weather pools with probability weights
- ✅ Added hemisphere support (North/South)
- ✅ Added special event system (Halloween, Christmas)
- ✅ Added `/season` command
- ✅ Added new exports for season information
- ✅ Maintained backward compatibility with original system
- ✅ Enhanced server console logging

---

## 🎉 Enjoy Your Enhanced Weather System!

Your server now has a fully automated, realistic seasonal weather system that adapts to real-time dates and provides an immersive experience for your players.

**Happy Gaming! 🎮**