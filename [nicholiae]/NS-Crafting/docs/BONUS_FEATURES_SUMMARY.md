# Bonus Zone Features - Quick Reference

## What Was Restored

### 1. **Zone Detection System** ✅
- Three bonus zones (DrugLab1, DrugLab2, DrugLab3)
- Automatic player position tracking
- Real-time zone status updates

### 2. **Visual Effects** ✅
- Alien screen effects when in zones
- Immersive drug lab atmosphere
- Automatic effect cycling

### 3. **Yield Bonuses** ✅
- **2x items** by default (configurable)
- Only applies to non-weapon items
- Respects blacklist configuration
- Shows in recipe display

### 4. **Time Bonuses** ✅
- **50% faster crafting** by default (configurable)
- Applies to all items in zones
- Independent from yield bonuses

### 5. **Smart Restrictions** ✅
- Weapons don't get yield bonuses
- Blacklisted items excluded
- Configurable per-item control

## How It Works

```
Player enters zone → Zone detected → Visual effects start
                                   ↓
                          Opens crafting menu
                                   ↓
                    "BONUS ZONE ACTIVE!" notification
                                   ↓
                    Recipe shows bonus amounts
                                   ↓
                    Player crafts item
                                   ↓
                    Receives bonus yields (if applicable)
```

## Configuration Example

```lua
-- In config.lua
Config.BonusZones = {
    ['DrugLab1'] = {
        Center = vector3(1087.84, -3194.33, -38.99),
        Length = 10.0,
        Width = 10.0
    }
}

Config.YieldBonus = true      -- Enable 2x yields
Config.BonusYield = 2         -- Multiplier
Config.TimeBonus = true       -- Enable faster crafting
Config.BonusTime = 0.5        -- 50% faster

Config.BlacklistItems = {
    'weapon_pistol',          -- No yield bonus
    'weapon_smg',             -- No yield bonus
}
```

## Example Scenarios

### Scenario 1: Crafting Drugs in Bonus Zone
- **Item**: Cocaine (10 units base yield)
- **Location**: Inside DrugLab1
- **Result**: 20 units (2x bonus applied)
- **Time**: 2.5 seconds (50% faster)

### Scenario 2: Crafting Weapon in Bonus Zone
- **Item**: Pistol (1 unit base yield)
- **Location**: Inside DrugLab1
- **Result**: 1 unit (no yield bonus for weapons)
- **Time**: 2.5 seconds (time bonus still applies)

### Scenario 3: Crafting Outside Bonus Zone
- **Item**: Cocaine (10 units base yield)
- **Location**: Regular crafting bench
- **Result**: 10 units (no bonus)
- **Time**: 5 seconds (normal time)

## Key Features

| Feature | Status | Configurable |
|---------|--------|--------------|
| Zone Detection | ✅ | Yes (coordinates, size) |
| Visual Effects | ✅ | No (hardcoded) |
| Yield Bonus | ✅ | Yes (multiplier) |
| Time Bonus | ✅ | Yes (multiplier) |
| Weapon Exclusion | ✅ | No (automatic) |
| Item Blacklist | ✅ | Yes (list) |
| Debug Mode | ✅ | Yes (on/off) |

## Benefits

1. **Encourages Zone Usage** - Players seek out bonus zones
2. **Risk vs Reward** - Zones may be in dangerous areas
3. **Economic Balance** - More efficient crafting in specific locations
4. **Immersive Experience** - Visual effects enhance atmosphere
5. **Flexible Configuration** - Adjust bonuses to your server's needs

## Testing Checklist

- [ ] Zone detection works (debug mode)
- [ ] Visual effects trigger in zones
- [ ] Yield bonus applies to drugs/items
- [ ] Yield bonus doesn't apply to weapons
- [ ] Time bonus reduces crafting time
- [ ] Blacklist items are excluded
- [ ] Normal crafting works outside zones
- [ ] UI shows "BONUS ZONE ACTIVE!" message
- [ ] Recipe displays show bonus amounts

## Performance Impact

- **Minimal** - Zone checks run every 500ms
- **Optimized** - Only active when player loaded
- **Efficient** - Uses native FiveM functions
- **Scalable** - Can add more zones if needed