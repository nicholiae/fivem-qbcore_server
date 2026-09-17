# qb-weathersync - Enhanced with Seasonal Weather System

A comprehensive weather synchronization system for FiveM QBCore servers with **automatic real-time seasonal weather changes**.

## 🌟 What's New - Seasonal Weather System

This enhanced version includes a fully automated seasonal weather system that:

- ✅ **Automatically detects the current season** based on real-time date
- ✅ **Adjusts weather patterns** to match the season (Spring, Summer, Autumn, Winter)
- ✅ **Supports both hemispheres** (Northern and Southern)
- ✅ **Special event weather** (Halloween, Christmas, and custom events)
- ✅ **Fully configurable** weather probabilities per season
- ✅ **Backward compatible** with the original weather system

---

## 📦 Quick Start

### Installation

1. Place the `qb-weathersync` folder in your `resources` directory
2. Add `ensure qb-weathersync` to your `server.cfg`
3. Configure your settings in `config.lua`
4. Restart your server

### Basic Configuration

Open `config.lua` and set:

```lua
-- Enable seasonal weather system
Config.EnableSeasons = true

-- Set your hemisphere
Config.Hemisphere = 'north'  -- or 'south'

-- Weather change interval (minutes)
Config.NewWeatherTimer = 15
```

---

## 🌦️ Seasonal Weather Behavior

### Spring (March 20 - June 20)
- Mix of sunny, rainy, and cloudy weather
- Occasional thunderstorms
- Moderate fog

### Summer (June 21 - September 22)
- Predominantly sunny and clear
- Occasional storms
- Light smog possible

### Autumn (September 23 - December 20)
- Cooler, more overcast conditions
- Increased rain probability
- Foggy mornings

### Winter (December 21 - March 19)
- Snow and blizzards
- Overcast skies
- Cold, foggy conditions
- Christmas weather during holidays

---

## 🎮 Commands

### Seasonal Commands
- `/season` - Check current season and hemisphere

### Weather Commands
- `/weather [type]` - Set weather manually (admin)
- `/freezeweather` - Toggle dynamic weather (admin)

### Time Commands
- `/time [hour] [minute]` - Set specific time (admin)
- `/freezetime` - Toggle time freeze (admin)
- `/morning` - Set time to 9:00 AM (admin)
- `/noon` - Set time to 12:00 PM (admin)
- `/evening` - Set time to 6:00 PM (admin)
- `/night` - Set time to 11:00 PM (admin)

### Other Commands
- `/blackout` - Toggle blackout mode (admin)

---

## ⚙️ Configuration Options

### Core Settings
```lua
Config.DynamicWeather = true    -- Enable automatic weather changes
Config.EnableSeasons = true     -- Enable seasonal weather system
Config.Hemisphere = 'north'     -- 'north' or 'south'
Config.NewWeatherTimer = 15     -- Minutes between weather changes
Config.RealTimeSync = false     -- Sync with real-world time
```

### Seasonal Weather Pools

Each season has customizable weather types with probability weights:

```lua
Config.SeasonalWeather = {
    spring = {
        { weather = 'EXTRASUNNY', weight = 20 },
        { weather = 'CLEAR', weight = 25 },
        { weather = 'RAIN', weight = 15 },
        -- ... more weather types
    },
    -- ... other seasons
}
```

**Higher weight = Higher probability**

### Special Events

Configure special event weather:

```lua
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
```

---

## 🌍 Hemisphere Support

### Northern Hemisphere (Default)
Standard seasons:
- Spring: March - June
- Summer: June - September
- Autumn: September - December
- Winter: December - March

### Southern Hemisphere
Reversed seasons:
- Autumn: March - June
- Winter: June - September
- Spring: September - December
- Summer: December - March

Simply set `Config.Hemisphere = 'south'` to use Southern Hemisphere seasons.

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
XMAS        - Christmas weather (with snow trails)
HALLOWEEN   - Halloween weather (spooky fog)
```

---

## 🔌 Exports

### Season Information
```lua
-- Get current season
local season = exports['qb-weathersync']:getCurrentSeason()
-- Returns: 'spring', 'summer', 'autumn', or 'winter'

-- Get random weather from season pool
local weather = exports['qb-weathersync']:getSeasonalWeather('winter')
```

### Weather Control
```lua
-- Get current weather
local weather = exports['qb-weathersync']:getWeatherState()

-- Set weather
exports['qb-weathersync']:setWeather('RAIN')

-- Get/Set dynamic weather state
local isDynamic = exports['qb-weathersync']:getDynamicWeather()
exports['qb-weathersync']:setDynamicWeather(true)
```

### Time Control
```lua
-- Get current time
local hour, minute = exports['qb-weathersync']:getTime()

-- Set time
exports['qb-weathersync']:setTime(12, 0)

-- Freeze/unfreeze time
exports['qb-weathersync']:setTimeFreeze(true)
```

### Other
```lua
-- Blackout control
exports['qb-weathersync']:setBlackout(true)
local isBlackout = exports['qb-weathersync']:getBlackoutState()

-- Trigger next weather stage
exports['qb-weathersync']:nextWeatherStage()
```

---

## 📖 Documentation

For detailed configuration, customization, and troubleshooting, see:
- **[SEASONAL_WEATHER_GUIDE.md](SEASONAL_WEATHER_GUIDE.md)** - Complete guide to the seasonal weather system

---

## 🎯 Features

### Original Features
- ✅ Synchronized weather across all players
- ✅ Synchronized time across all players
- ✅ Dynamic weather changes
- ✅ Blackout mode
- ✅ Time freeze
- ✅ Admin commands
- ✅ Real-time sync option

### New Seasonal Features
- ✅ Automatic season detection
- ✅ Seasonal weather pools
- ✅ Hemisphere support
- ✅ Special event system
- ✅ Weighted probability system
- ✅ Fully configurable
- ✅ Backward compatible

---

## 🐛 Troubleshooting

### Weather Not Changing
1. Ensure `Config.DynamicWeather = true`
2. Ensure `Config.EnableSeasons = true`
3. Check weather timer setting
4. Use `/freezeweather` to toggle if frozen

### Wrong Season
1. Check server date/time
2. Verify hemisphere setting
3. Use `/season` command to check

### Special Events Not Working
1. Verify event is enabled
2. Check date ranges
3. Ensure no date conflicts

For more troubleshooting, see [SEASONAL_WEATHER_GUIDE.md](SEASONAL_WEATHER_GUIDE.md)

---

## 💡 Tips

1. **Balance is Key**: Don't make weather too extreme
2. **Test Configuration**: Use commands to test before going live
3. **Hemisphere Matters**: Set correctly for your target audience
4. **Special Events**: Use sparingly for maximum impact
5. **Weather Timer**: 15 minutes is optimal for most servers

---

## 📝 Example Use Cases

### Roleplay Server
- Enable seasons for immersive experience
- Use special events for holidays
- Adjust weather pools for your location

### Racing Server
- Disable seasons for consistent weather
- Use manual weather control
- Set specific weather for events

### Survival Server
- Enable harsh weather in winter
- Increase storm probability
- Use realistic seasonal patterns

---

## 🔄 Backward Compatibility

The seasonal system is **fully backward compatible**. To use the original weather system:

```lua
Config.EnableSeasons = false
```

All original commands and exports continue to work as before.

---

## 📜 License

This resource is based on qb-weathersync and enhanced with seasonal weather capabilities.

---

## 🙏 Credits

- Original qb-weathersync by QBCore Framework
- Seasonal weather system enhancement

---

## 🆘 Support

For issues, questions, or suggestions:
1. Check the [SEASONAL_WEATHER_GUIDE.md](SEASONAL_WEATHER_GUIDE.md)
2. Review configuration examples
3. Check server console for errors
4. Visit QBCore Discord/Forums

---

**Enjoy realistic, immersive seasonal weather on your server! 🌦️**