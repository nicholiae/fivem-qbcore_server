# 🚀 Quick Installation Guide

## Step-by-Step Installation

### 1️⃣ Backup Your Current Files
Before installing, backup your existing weather system:
```bash
# Navigate to your resources folder
cd resources/[qb]/qb-weathersync

# Create backup
cp config.lua config.lua.backup
cp server/server.lua server/server.lua.backup
```

### 2️⃣ Replace Files
Replace the following files with the enhanced versions:
- ✅ `config.lua` - Enhanced with seasonal configuration
- ✅ `server/server.lua` - Enhanced with seasonal logic
- ⚠️ `client/client.lua` - **NO CHANGES NEEDED** (keep your existing file)

### 3️⃣ Configure Your Settings

Open `config.lua` and configure these key settings:

```lua
-- Enable the seasonal weather system
Config.EnableSeasons = true

-- Set your server's hemisphere
Config.Hemisphere = 'north'  -- Options: 'north' or 'south'

-- Weather change interval (in minutes)
Config.NewWeatherTimer = 15

-- Enable dynamic weather changes
Config.DynamicWeather = true
```

### 4️⃣ Restart the Resource
In your server console:
```
restart qb-weathersync
```

Or restart your entire server:
```
restart
```

### 5️⃣ Verify Installation

1. **Check Server Console**
   Look for these messages:
   ```
   [qb-weathersync] Seasonal weather system initialized
   [qb-weathersync] Current Season: spring (Northern Hemisphere)
   [qb-weathersync] Initial weather set to: CLEAR
   ```

2. **Test In-Game**
   Use the `/season` command to check current season:
   ```
   /season
   ```
   
   You should see: `Current Season: spring (Northern Hemisphere)`

3. **Test Weather Changes**
   Wait for the weather timer (default 15 minutes) or manually change weather:
   ```
   /weather rain
   ```

---

## 🎯 Quick Configuration Examples

### For Northern Hemisphere Servers (USA, Europe, Asia)
```lua
Config.EnableSeasons = true
Config.Hemisphere = 'north'
```

### For Southern Hemisphere Servers (Australia, South America, South Africa)
```lua
Config.EnableSeasons = true
Config.Hemisphere = 'south'
```

### To Disable Seasonal System (Use Original Weather)
```lua
Config.EnableSeasons = false
```

---

## ⚙️ Customizing Weather Patterns

### Make Summer More Sunny
```lua
summer = {
    { weather = 'EXTRASUNNY', weight = 60 },  -- Increased from 40
    { weather = 'CLEAR', weight = 35 },
    { weather = 'CLOUDS', weight = 5 },
}
```

### Make Winter More Snowy
```lua
winter = {
    { weather = 'SNOW', weight = 40 },        -- Increased from 25
    { weather = 'BLIZZARD', weight = 20 },    -- Increased from 10
    { weather = 'SNOWLIGHT', weight = 25 },
    { weather = 'OVERCAST', weight = 15 },
}
```

### Reduce Rain in Spring
```lua
spring = {
    { weather = 'EXTRASUNNY', weight = 30 },
    { weather = 'CLEAR', weight = 30 },
    { weather = 'CLOUDS', weight = 20 },
    { weather = 'RAIN', weight = 10 },        -- Reduced from 15
    { weather = 'OVERCAST', weight = 10 },
}
```

---

## 🎃 Configuring Special Events

### Enable Halloween Weather
```lua
halloween = {
    enabled = true,                      -- Set to true
    start = {month = 10, day = 25},     -- October 25
    finish = {month = 11, day = 1},     -- November 1
    weather = 'HALLOWEEN'
}
```

### Enable Christmas Weather
```lua
christmas = {
    enabled = true,                      -- Set to true
    start = {month = 12, day = 20},     -- December 20
    finish = {month = 12, day = 26},    -- December 26
    weather = 'XMAS'
}
```

### Add New Year's Event
```lua
newyear = {
    enabled = true,
    start = {month = 12, day = 31},     -- December 31
    finish = {month = 1, day = 2},      -- January 2
    weather = 'EXTRASUNNY'              -- Clear skies for celebrations
}
```

---

## 🔧 Troubleshooting

### Issue: Weather Not Changing
**Solution:**
1. Check if dynamic weather is enabled:
   ```lua
   Config.DynamicWeather = true
   ```
2. Check if weather is frozen (use `/freezeweather` to toggle)
3. Verify timer setting: `Config.NewWeatherTimer = 15`

### Issue: Wrong Season Detected
**Solution:**
1. Check your server's date/time (use `date` command in console)
2. Verify hemisphere setting matches your location
3. Use `/season` command to check current season

### Issue: Server Console Shows Errors
**Solution:**
1. Verify all Lua syntax is correct in config.lua
2. Check for missing commas or brackets
3. Restore from backup and try again

### Issue: Special Events Not Working
**Solution:**
1. Ensure event is enabled: `enabled = true`
2. Check date ranges are correct
3. Verify current date falls within event range

---

## 📋 Checklist

Before going live, verify:
- [ ] Files backed up
- [ ] Config.lua updated with your settings
- [ ] Hemisphere set correctly
- [ ] Server restarted
- [ ] Console shows initialization messages
- [ ] `/season` command works in-game
- [ ] Weather changes automatically (wait 15 minutes)
- [ ] Special events configured (if desired)

---

## 🆘 Need Help?

1. **Read the full guide**: [SEASONAL_WEATHER_GUIDE.md](SEASONAL_WEATHER_GUIDE.md)
2. **Check README**: [README.md](README.md)
3. **Review configuration**: Double-check all settings
4. **Test with defaults**: Try default configuration first

---

## ✅ Installation Complete!

Your server now has an enhanced weather system with automatic seasonal changes!

**Test it out:**
- Use `/season` to check current season
- Wait for automatic weather changes
- Enjoy realistic seasonal weather patterns

**Happy Gaming! 🎮**