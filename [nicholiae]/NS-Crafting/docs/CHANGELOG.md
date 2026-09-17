# Changelog - Bonus Zones Integration

## Version 2.0 - Bonus Zones Restored

### Added
- ✅ **Bonus Zone Detection System**
  - Three configurable BoxZones (DrugLab1, DrugLab2, DrugLab3)
  - Real-time player position tracking
  - Zone status variables for each lab

- ✅ **Alien Visual Effects**
  - Screen effects trigger when inside bonus zones
  - Random timing for immersive experience
  - Automatic cleanup of effects

- ✅ **Yield Bonus System**
  - Configurable yield multiplier (default: 2x)
  - Automatic application when crafting in zones
  - Blacklist support for weapons and specific items
  - Visual indication in crafting menu

- ✅ **Time Bonus System**
  - Configurable time reduction (default: 50% faster)
  - Applies to all crafting in bonus zones
  - Independent from yield bonuses

- ✅ **Smart Bonus Application**
  - Weapons automatically excluded from yield bonuses
  - Blacklisted items respect restrictions
  - Real-time calculation based on zone status
  - Bonus indicators in recipe display

- ✅ **Enhanced UI Feedback**
  - "BONUS ZONE ACTIVE!" notification when opening menu
  - Recipe cards show bonus amounts
  - Clear indication of active bonuses

### Modified
- 🔄 **openCraftingMenu()** - Now checks bonus zone status and notifies player
- 🔄 **generateRecipeData()** - Calculates bonus yields and times dynamically
- 🔄 **craftItem callback** - Applies actual bonuses when crafting
- 🔄 **Player load event** - Initializes bonus zones on player spawn

### Technical Details

#### New Functions
```lua
alienEffect()           -- Triggers visual screen effects
isInBonusZone()        -- Helper to check if in any zone
```

#### New Variables
```lua
insideCraftBoxZonee1   -- Zone 1 detection status
insideCraftBoxZonee2   -- Zone 2 detection status
insideCraftBoxZonee3   -- Zone 3 detection status
```

#### New Threads
- Zone 1 detection thread (500ms interval)
- Zone 2 detection thread (500ms interval)
- Zone 3 detection thread (500ms interval)

### Configuration Changes Required

Add to your config.lua:
```lua
Config.BonusZones = {...}
Config.YieldBonus = true
Config.BonusYield = 2
Config.TimeBonus = true
Config.BonusTime = 0.5
Config.BlacklistItems = {...}
Config.TTC = 5
```

### Compatibility
- ✅ Fully compatible with existing GUI system
- ✅ Maintains all original crafting functionality
- ✅ Works with QBCore framework
- ✅ Requires PolyZone for BoxZone functionality

### Performance
- Optimized zone detection (500ms intervals)
- Efficient bonus calculations
- No impact on crafting speed outside zones
- Minimal resource usage

### Bug Fixes
- Fixed bonus calculations not applying in GUI version
- Fixed weapon detection for blacklist
- Fixed recipe display showing incorrect amounts
- Fixed zone detection initialization timing

### Known Issues
- None reported

### Migration Notes
If upgrading from the GUI-only version:
1. Backup your current config.lua
2. Replace client/crafting.lua with updated version
3. Add bonus zone configuration to config.lua
4. Set zone coordinates for your server
5. Restart the resource

### Credits
- Original bonus zone system from NS-Crafting v1.0
- GUI integration maintained from NS-Crafting v1.5
- Combined and enhanced for v2.0

### Future Enhancements
- Per-zone bonus configuration
- Additional visual effects options
- Zone-specific blacklists
- Bonus multiplier progression system
- Admin commands for zone management