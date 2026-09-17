# Bonus Zones Integration - Changes Summary

## Overview
This document outlines the bonus zone functionality that was integrated back into the NS-Crafting system from the original crafting.lua file.

## Integrated Features

### 1. Bonus Zone Variables (Lines 10-12)
```lua
local insideCraftBoxZonee1 = false
local insideCraftBoxZonee2 = false
local insideCraftBoxZonee3 = false
```
These track whether the player is currently inside any of the three bonus zones.

### 2. Alien Effect Function (Lines 14-24)
```lua
local function alienEffect()
    StartScreenEffect('DrugsMichaelAliensFightIn', 3.0, 0)
    Wait(math.random(5000, 8000))
    StartScreenEffect('DrugsMichaelAliensFight', 3.0, 0)
    Wait(math.random(5000, 8000))
    StartScreenEffect('DrugsMichaelAliensFightOut', 3.0, 0)
    StopScreenEffect('DrugsMichaelAliensFightIn')
    StopScreenEffect('DrugsMichaelAliensFight')
    StopScreenEffect('DrugsMichaelAliensFightOut')
end
```
Triggers visual screen effects when players are inside bonus zones, creating an immersive drug lab atmosphere.

### 3. Bonus Zone Helper Function (Lines 26-29)
```lua
local function isInBonusZone()
    return insideCraftBoxZonee1 or insideCraftBoxZonee2 or insideCraftBoxZonee3
end
```
Convenient helper to check if player is in any bonus zone.

### 4. BoxZone Creation (Lines 52-113)
Three BoxZones are created using Config.BonusZones data:
- DrugLab1
- DrugLab2
- DrugLab3

Each zone has its own detection thread that:
- Checks player position every 500ms
- Updates the corresponding zone variable
- Triggers alien effects when inside
- Supports debug mode for testing

### 5. Yield Bonus System
When crafting inside a bonus zone:
- **Yield Multiplier**: Items crafted are multiplied by `Config.BonusYield` (default: 2x)
- **Blacklist Protection**: Weapons and blacklisted items don't receive yield bonuses
- **Visual Feedback**: Recipe display shows increased yields when in bonus zones

### 6. Time Bonus System
When crafting inside a bonus zone:
- **Time Reduction**: Crafting time is multiplied by `Config.BonusTime` (default: 0.5x = 50% faster)
- **Applies to All Items**: Time bonus applies even to blacklisted items (yield bonus doesn't)

### 7. Recipe Display Integration (Lines 280-310)
The recipe generation now:
- Calculates bonus amounts dynamically
- Shows modified yields in the UI
- Indicates when bonuses are active
- Respects blacklist and weapon restrictions

### 8. Crafting Integration (Lines 380-410)
The actual crafting process:
- Checks bonus zone status at craft time
- Applies yield bonuses to final output
- Respects blacklist items
- Maintains original functionality for non-bonus crafting

## Configuration Requirements

Your config.lua must include:

```lua
Config.BonusZones = {
    ['DrugLab1'] = {
        Center = vector3(x, y, z),
        Length = number,
        Width = number
    },
    ['DrugLab2'] = {
        Center = vector3(x, y, z),
        Length = number,
        Width = number
    },
    ['DrugLab3'] = {
        Center = vector3(x, y, z),
        Length = number,
        Width = number
    }
}

Config.YieldBonus = true  -- Enable/disable yield bonuses
Config.BonusYield = 2     -- Yield multiplier (2 = double output)
Config.TimeBonus = true   -- Enable/disable time bonuses
Config.BonusTime = 0.5    -- Time multiplier (0.5 = 50% faster)
Config.BlacklistItems = { -- Items that don't get yield bonuses
    'weapon_pistol',
    'weapon_smg',
    -- Add more items as needed
}
Config.debug = false      -- Enable debug prints
Config.TTC = 5            -- Time to craft (seconds)
```

## Dependencies

This integration requires:
- **qb-core**: For QBCore framework functions
- **PolyZone**: For BoxZone creation and detection (qb-target or standalone)

## How It Works

1. **On Player Load**: Three BoxZones are created at configured locations
2. **Continuous Monitoring**: Three separate threads check player position every 500ms
3. **Zone Detection**: When player enters a zone, the corresponding variable is set to true
4. **Visual Effects**: Alien screen effects trigger while in zones
5. **Crafting Bonuses**: When opening crafting menu or crafting items, bonus calculations apply
6. **Dynamic Updates**: Bonuses are calculated in real-time based on current zone status

## Benefits

- **Increased Yields**: Players get more items per craft in bonus zones
- **Faster Crafting**: Reduced crafting time in bonus zones
- **Balanced System**: Weapons and blacklisted items don't get yield bonuses
- **Immersive Experience**: Visual effects enhance the drug lab atmosphere
- **Flexible Configuration**: Easy to adjust multipliers and zone locations

## Testing

To test the bonus zones:
1. Set `Config.debug = true` in config.lua
2. Navigate to a bonus zone location
3. Check console for zone detection prints
4. Open crafting menu - should see "BONUS ZONE ACTIVE!" notification
5. Craft an item - should receive bonus yields
6. Verify blacklisted items don't get yield bonuses

## Notes

- Bonus zones are checked at the time of crafting, not when opening the menu
- The alien effect runs continuously while in a zone (every 5-8 seconds)
- Zone detection uses 500ms intervals for performance optimization
- All three zones provide the same bonuses (configurable per zone if needed)