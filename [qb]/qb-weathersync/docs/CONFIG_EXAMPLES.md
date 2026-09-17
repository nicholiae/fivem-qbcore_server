# 📝 Configuration Examples

This document provides ready-to-use configuration examples for different server types and scenarios.

---

## 🌍 Location-Based Configurations

### 1. Tropical Climate (Florida, Caribbean, Southeast Asia)
```lua
Config.EnableSeasons = true
Config.Hemisphere = 'north'  -- or 'south' depending on location

Config.SeasonalWeather = {
    spring = {
        { weather = 'EXTRASUNNY', weight = 45 },
        { weather = 'CLEAR', weight = 35 },
        { weather = 'CLOUDS', weight = 10 },
        { weather = 'RAIN', weight = 8 },
        { weather = 'THUNDER', weight = 2 },
    },
    summer = {
        { weather = 'EXTRASUNNY', weight = 50 },
        { weather = 'CLEAR', weight = 30 },
        { weather = 'THUNDER', weight = 10 },
        { weather = 'RAIN', weight = 10 },
    },
    autumn = {
        { weather = 'EXTRASUNNY', weight = 40 },
        { weather = 'CLEAR', weight = 35 },
        { weather = 'CLOUDS', weight = 15 },
        { weather = 'RAIN', weight = 10 },
    },
    winter = {
        { weather = 'CLEAR', weight = 40 },
        { weather = 'EXTRASUNNY', weight = 35 },
        { weather = 'CLOUDS', weight = 15 },
        { weather = 'RAIN', weight = 10 },
    }
}
```

### 2. Desert Climate (Arizona, Nevada, Middle East)
```lua
Config.EnableSeasons = true
Config.Hemisphere = 'north'

Config.SeasonalWeather = {
    spring = {
        { weather = 'EXTRASUNNY', weight = 60 },
        { weather = 'CLEAR', weight = 30 },
        { weather = 'CLOUDS', weight = 8 },
        { weather = 'SMOG', weight = 2 },
    },
    summer = {
        { weather = 'EXTRASUNNY', weight = 70 },
        { weather = 'CLEAR', weight = 25 },
        { weather = 'SMOG', weight = 5 },
    },
    autumn = {
        { weather = 'EXTRASUNNY', weight = 55 },
        { weather = 'CLEAR', weight = 35 },
        { weather = 'CLOUDS', weight = 10 },
    },
    winter = {
        { weather = 'CLEAR', weight = 50 },
        { weather = 'EXTRASUNNY', weight = 30 },
        { weather = 'CLOUDS', weight = 15 },
        { weather = 'RAIN', weight = 5 },
    }
}
```

### 3. Temperate Climate (UK, Pacific Northwest, Northern Europe)
```lua
Config.EnableSeasons = true
Config.Hemisphere = 'north'

Config.SeasonalWeather = {
    spring = {
        { weather = 'CLOUDS', weight = 25 },
        { weather = 'OVERCAST', weight = 20 },
        { weather = 'RAIN', weight = 20 },
        { weather = 'CLEAR', weight = 20 },
        { weather = 'FOGGY', weight = 10 },
        { weather = 'THUNDER', weight = 5 },
    },
    summer = {
        { weather = 'CLEAR', weight = 35 },
        { weather = 'CLOUDS', weight = 30 },
        { weather = 'EXTRASUNNY', weight = 20 },
        { weather = 'OVERCAST', weight = 10 },
        { weather = 'RAIN', weight = 5 },
    },
    autumn = {
        { weather = 'OVERCAST', weight = 30 },
        { weather = 'RAIN', weight = 25 },
        { weather = 'CLOUDS', weight = 20 },
        { weather = 'FOGGY', weight = 15 },
        { weather = 'CLEAR', weight = 10 },
    },
    winter = {
        { weather = 'OVERCAST', weight = 30 },
        { weather = 'RAIN', weight = 20 },
        { weather = 'FOGGY', weight = 15 },
        { weather = 'SNOW', weight = 15 },
        { weather = 'CLOUDS', weight = 15 },
        { weather = 'SNOWLIGHT', weight = 5 },
    }
}
```

### 4. Continental Climate (Canada, Russia, Northern USA)
```lua
Config.EnableSeasons = true
Config.Hemisphere = 'north'

Config.SeasonalWeather = {
    spring = {
        { weather = 'CLEAR', weight = 25 },
        { weather = 'CLOUDS', weight = 25 },
        { weather = 'RAIN', weight = 20 },
        { weather = 'OVERCAST', weight = 15 },
        { weather = 'SNOWLIGHT', weight = 10 },
        { weather = 'FOGGY', weight = 5 },
    },
    summer = {
        { weather = 'EXTRASUNNY', weight = 40 },
        { weather = 'CLEAR', weight = 35 },
        { weather = 'CLOUDS', weight = 15 },
        { weather = 'THUNDER', weight = 10 },
    },
    autumn = {
        { weather = 'OVERCAST', weight = 30 },
        { weather = 'CLOUDS', weight = 25 },
        { weather = 'RAIN', weight = 20 },
        { weather = 'FOGGY', weight = 15 },
        { weather = 'CLEAR', weight = 10 },
    },
    winter = {
        { weather = 'SNOW', weight = 35 },
        { weather = 'BLIZZARD', weight = 20 },
        { weather = 'OVERCAST', weight = 20 },
        { weather = 'SNOWLIGHT', weight = 15 },
        { weather = 'FOGGY', weight = 10 },
    }
}
```

### 5. Mediterranean Climate (Southern California, Southern Europe)
```lua
Config.EnableSeasons = true
Config.Hemisphere = 'north'

Config.SeasonalWeather = {
    spring = {
        { weather = 'CLEAR', weight = 40 },
        { weather = 'EXTRASUNNY', weight = 30 },
        { weather = 'CLOUDS', weight = 20 },
        { weather = 'RAIN', weight = 10 },
    },
    summer = {
        { weather = 'EXTRASUNNY', weight = 60 },
        { weather = 'CLEAR', weight = 35 },
        { weather = 'CLOUDS', weight = 5 },
    },
    autumn = {
        { weather = 'CLEAR', weight = 35 },
        { weather = 'CLOUDS', weight = 25 },
        { weather = 'RAIN', weight = 20 },
        { weather = 'OVERCAST', weight = 15 },
        { weather = 'EXTRASUNNY', weight = 5 },
    },
    winter = {
        { weather = 'CLOUDS', weight = 30 },
        { weather = 'RAIN', weight = 25 },
        { weather = 'OVERCAST', weight = 20 },
        { weather = 'CLEAR', weight = 20 },
        { weather = 'FOGGY', weight = 5 },
    }
}
```

---

## 🎮 Server Type Configurations

### 1. Roleplay Server (Realistic Weather)
```lua
Config.EnableSeasons = true
Config.DynamicWeather = true
Config.NewWeatherTimer = 15  -- Change every 15 minutes
Config.Hemisphere = 'north'  -- Set based on your RP location

-- Use location-based configuration from above
-- Enable special events for immersion
Config.SpecialEvents = {
    halloween = { enabled = true, start = {month = 10, day = 25}, finish = {month = 11, day = 1}, weather = 'HALLOWEEN' },
    christmas = { enabled = true, start = {month = 12, day = 20}, finish = {month = 12, day = 26}, weather = 'XMAS' },
}
```

### 2. Racing Server (Consistent Weather)
```lua
Config.EnableSeasons = false  -- Disable for consistency
Config.DynamicWeather = false  -- Manual control only
Config.StartWeather = 'CLEAR'  -- Always start clear

-- Admins can manually set weather for events
-- Use /weather command for race-specific conditions
```

### 3. Survival Server (Harsh Weather)
```lua
Config.EnableSeasons = true
Config.DynamicWeather = true
Config.NewWeatherTimer = 10  -- More frequent changes
Config.Hemisphere = 'north'

Config.SeasonalWeather = {
    spring = {
        { weather = 'RAIN', weight = 30 },
        { weather = 'THUNDER', weight = 20 },
        { weather = 'OVERCAST', weight = 25 },
        { weather = 'CLOUDS', weight = 15 },
        { weather = 'CLEAR', weight = 10 },
    },
    summer = {
        { weather = 'THUNDER', weight = 30 },
        { weather = 'RAIN', weight = 25 },
        { weather = 'EXTRASUNNY', weight = 25 },
        { weather = 'CLOUDS', weight = 20 },
    },
    autumn = {
        { weather = 'RAIN', weight = 35 },
        { weather = 'THUNDER', weight = 20 },
        { weather = 'OVERCAST', weight = 25 },
        { weather = 'FOGGY', weight = 20 },
    },
    winter = {
        { weather = 'BLIZZARD', weight = 35 },
        { weather = 'SNOW', weight = 30 },
        { weather = 'SNOWLIGHT', weight = 20 },
        { weather = 'OVERCAST', weight = 15 },
    }
}
```

### 4. Casual/Fun Server (Varied Weather)
```lua
Config.EnableSeasons = true
Config.DynamicWeather = true
Config.NewWeatherTimer = 20  -- Slower changes
Config.Hemisphere = 'north'

Config.SeasonalWeather = {
    spring = {
        { weather = 'EXTRASUNNY', weight = 30 },
        { weather = 'CLEAR', weight = 30 },
        { weather = 'CLOUDS', weight = 20 },
        { weather = 'RAIN', weight = 15 },
        { weather = 'FOGGY', weight = 5 },
    },
    summer = {
        { weather = 'EXTRASUNNY', weight = 50 },
        { weather = 'CLEAR', weight = 40 },
        { weather = 'CLOUDS', weight = 10 },
    },
    autumn = {
        { weather = 'CLEAR', weight = 30 },
        { weather = 'CLOUDS', weight = 30 },
        { weather = 'RAIN', weight = 20 },
        { weather = 'OVERCAST', weight = 20 },
    },
    winter = {
        { weather = 'SNOW', weight = 30 },
        { weather = 'XMAS', weight = 20 },
        { weather = 'SNOWLIGHT', weight = 20 },
        { weather = 'CLOUDS', weight = 20 },
        { weather = 'CLEAR', weight = 10 },
    }
}
```

---

## 🎃 Special Event Configurations

### Halloween Theme (October)
```lua
Config.SpecialEvents = {
    halloween = {
        enabled = true,
        start = {month = 10, day = 1},      -- Entire October
        finish = {month = 10, day = 31},
        weather = 'HALLOWEEN'
    }
}
```

### Extended Christmas Season
```lua
Config.SpecialEvents = {
    christmas = {
        enabled = true,
        start = {month = 12, day = 1},      -- All December
        finish = {month = 12, day = 31},
        weather = 'XMAS'
    }
}
```

### Multiple Special Events
```lua
Config.SpecialEvents = {
    halloween = {
        enabled = true,
        start = {month = 10, day = 25},
        finish = {month = 11, day = 1},
        weather = 'HALLOWEEN'
    },
    thanksgiving = {
        enabled = true,
        start = {month = 11, day = 20},
        finish = {month = 11, day = 28},
        weather = 'OVERCAST'
    },
    christmas = {
        enabled = true,
        start = {month = 12, day = 20},
        finish = {month = 12, day = 26},
        weather = 'XMAS'
    },
    newyear = {
        enabled = true,
        start = {month = 12, day = 31},
        finish = {month = 1, day = 2},
        weather = 'CLEAR'
    }
}
```

---

## 🌐 Hemisphere-Specific Configurations

### Southern Hemisphere (Australia, New Zealand, South Africa)
```lua
Config.Hemisphere = 'south'  -- IMPORTANT: Reverses seasons

-- Summer is December-March
-- Winter is June-September

Config.SeasonalWeather = {
    spring = {  -- September-December
        { weather = 'CLEAR', weight = 30 },
        { weather = 'CLOUDS', weight = 25 },
        { weather = 'RAIN', weight = 20 },
        { weather = 'EXTRASUNNY', weight = 15 },
        { weather = 'OVERCAST', weight = 10 },
    },
    summer = {  -- December-March
        { weather = 'EXTRASUNNY', weight = 50 },
        { weather = 'CLEAR', weight = 35 },
        { weather = 'CLOUDS', weight = 10 },
        { weather = 'THUNDER', weight = 5 },
    },
    autumn = {  -- March-June
        { weather = 'CLEAR', weight = 30 },
        { weather = 'CLOUDS', weight = 25 },
        { weather = 'OVERCAST', weight = 20 },
        { weather = 'RAIN', weight = 15 },
        { weather = 'FOGGY', weight = 10 },
    },
    winter = {  -- June-September
        { weather = 'OVERCAST', weight = 30 },
        { weather = 'RAIN', weight = 25 },
        { weather = 'CLOUDS', weight = 20 },
        { weather = 'FOGGY', weight = 15 },
        { weather = 'CLEAR', weight = 10 },
    }
}
```

---

## ⚡ Performance Configurations

### High Performance (Less Frequent Changes)
```lua
Config.NewWeatherTimer = 30  -- Change every 30 minutes
Config.DynamicWeather = true
Config.EnableSeasons = true
```

### Balanced Performance
```lua
Config.NewWeatherTimer = 15  -- Change every 15 minutes (default)
Config.DynamicWeather = true
Config.EnableSeasons = true
```

### Dynamic Experience (More Frequent Changes)
```lua
Config.NewWeatherTimer = 10  -- Change every 10 minutes
Config.DynamicWeather = true
Config.EnableSeasons = true
```

---

## 🎯 Testing Configuration

### For Testing/Development
```lua
Config.EnableSeasons = true
Config.DynamicWeather = true
Config.NewWeatherTimer = 5   -- Change every 5 minutes for testing
Config.Hemisphere = 'north'

-- Use balanced weather for testing
Config.SeasonalWeather = {
    spring = {
        { weather = 'CLEAR', weight = 25 },
        { weather = 'RAIN', weight = 25 },
        { weather = 'CLOUDS', weight = 25 },
        { weather = 'OVERCAST', weight = 25 },
    },
    -- Similar for other seasons
}
```

---

## 💡 Tips for Custom Configurations

1. **Total Weights**: Don't need to equal 100, they're relative
2. **Balance**: Ensure variety - don't make one weather too dominant
3. **Testing**: Test your configuration for a full day before going live
4. **Seasonal Logic**: Consider what makes sense for each season
5. **Player Experience**: Think about gameplay impact of weather choices

---

## 📋 Configuration Checklist

Before finalizing your configuration:
- [ ] Hemisphere set correctly
- [ ] Weather weights balanced
- [ ] Special events configured (if desired)
- [ ] Timer set appropriately
- [ ] Tested for at least one full weather cycle
- [ ] Player feedback considered
- [ ] Backup of original config saved

---

**Need more help? Check [SEASONAL_WEATHER_GUIDE.md](SEASONAL_WEATHER_GUIDE.md) for detailed explanations!**