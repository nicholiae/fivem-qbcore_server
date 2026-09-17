# 🚀 Quick Reference Guide - Seasonal Weather System

## 📋 Installation (3 Steps)

1. **Backup** your current `config.lua` and `server/server.lua`
2. **Replace** with enhanced versions from the zip file
3. **Restart** the resource: `restart qb-weathersync`

---

## ⚙️ Essential Configuration

```lua
-- In config.lua

-- Enable seasonal weather
Config.EnableSeasons = true

-- Set your hemisphere
Config.Hemisphere = 'north'  -- or 'south'

-- Weather change interval (minutes)
Config.NewWeatherTimer = 15
```

---

## 🎮 Commands

| Command | Description | Permission |
|---------|-------------|------------|
| `/season` | Check current season | Admin |
| `/weather [type]` | Set weather manually | Admin |
| `/freezeweather` | Toggle dynamic weather | Admin |
| `/time [hour] [min]` | Set time | Admin |
| `/freezetime` | Toggle time freeze | Admin |
| `/blackout` | Toggle blackout | Admin |

---

## 🌍 Hemisphere Settings

**Northern Hemisphere** (USA, Europe, Asia)
```lua
Config.Hemisphere = 'north'
```
- Spring: March-June
- Summer: June-September
- Autumn: September-December
- Winter: December-March

**Southern Hemisphere** (Australia, South America, Africa)
```lua
Config.Hemisphere = 'south'
```
- Autumn: March-June
- Winter: June-September
- Spring: September-December
- Summer: December-March

---

## 🌦️ Weather Types

```
EXTRASUNNY  CLEAR      NEUTRAL    SMOG
FOGGY       OVERCAST   CLOUDS     CLEARING
RAIN        THUNDER    SNOW       BLIZZARD
SNOWLIGHT   XMAS       HALLOWEEN
```

---

## 📊 Adjusting Weather Probabilities

Higher weight = Higher chance

```lua
spring = {
    { weather = 'EXTRASUNNY', weight = 20 },  -- 20% chance
    { weather = 'CLEAR', weight = 25 },       -- 25% chance
    { weather = 'RAIN', weight = 15 },        -- 15% chance
}
```

---

## 🎃 Special Events

```lua
Config.SpecialEvents = {
    halloween = {
        enabled = true,
        start = {month = 10, day = 25},
        finish = {month = 11, day = 1},
        weather = 'HALLOWEEN'
    }
}
```

---

## 🔧 Quick Fixes

**Weather not changing?**
```lua
Config.DynamicWeather = true
Config.EnableSeasons = true
```

**Wrong season?**
- Check server date/time
- Verify hemisphere setting
- Use `/season` to check

**Disable seasonal system?**
```lua
Config.EnableSeasons = false
```

---

## 📖 Documentation Files

1. **README.md** - Overview
2. **SEASONAL_WEATHER_GUIDE.md** - Complete guide
3. **INSTALLATION.md** - Installation steps
4. **CONFIG_EXAMPLES.md** - Configuration examples
5. **ENHANCEMENT_SUMMARY.md** - What was changed

---

## 🎯 Quick Customization

### Make Summer Sunnier
```lua
summer = {
    { weather = 'EXTRASUNNY', weight = 60 },  -- Increased
    { weather = 'CLEAR', weight = 35 },
    { weather = 'CLOUDS', weight = 5 },
}
```

### Make Winter Snowier
```lua
winter = {
    { weather = 'SNOW', weight = 40 },        -- Increased
    { weather = 'BLIZZARD', weight = 25 },    -- Increased
    { weather = 'SNOWLIGHT', weight = 20 },
    { weather = 'OVERCAST', weight = 15 },
}
```

### Reduce Rain
```lua
spring = {
    { weather = 'CLEAR', weight = 35 },
    { weather = 'CLOUDS', weight = 30 },
    { weather = 'RAIN', weight = 10 },        -- Reduced
}
```

---

## 🔌 Useful Exports

```lua
-- Get current season
local season = exports['qb-weathersync']:getCurrentSeason()

-- Get current weather
local weather = exports['qb-weathersync']:getWeatherState()

-- Set weather
exports['qb-weathersync']:setWeather('RAIN')

-- Get time
local hour, minute = exports['qb-weathersync']:getTime()
```

---

## ✅ Verification Checklist

After installation:
- [ ] Server starts without errors
- [ ] Console shows: "Seasonal weather system initialized"
- [ ] `/season` command works
- [ ] Weather changes automatically (wait 15 min)
- [ ] Correct season displayed
- [ ] Hemisphere setting correct

---

## 💡 Pro Tips

1. Start with default configuration
2. Test for one full day before customizing
3. Balance weather weights (don't make one too dominant)
4. Use special events sparingly
5. Set correct hemisphere for your location
6. Backup config before changes

---

## 🆘 Need Help?

1. Check **SEASONAL_WEATHER_GUIDE.md** for detailed help
2. Review **CONFIG_EXAMPLES.md** for ready-to-use configs
3. Verify all settings in config.lua
4. Check server console for errors

---

**That's it! Your seasonal weather system is ready to go! 🌦️**