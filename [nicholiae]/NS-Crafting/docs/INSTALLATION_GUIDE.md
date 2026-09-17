# Installation Guide - NS-Crafting with Bonus Zones

## Quick Start

1. **Backup Your Current System**
   - Make a backup of your current NS-Crafting folder
   - Save your current config.lua settings

2. **Replace Files**
   - Replace your NS-Crafting folder with this updated version
   - Or manually replace only the `client/crafting.lua` file

3. **Update Config**
   - Ensure your config.lua includes the bonus zone settings (see below)
   - Adjust zone coordinates to match your server's drug lab locations

4. **Restart Resource**
   ```
   restart ns-crafting
   ```

## Required Config Settings

Add these to your `config.lua` if they don't exist:

```lua
-- Bonus Zone Configuration
Config.BonusZones = {
    ['DrugLab1'] = {
        Center = vector3(1087.84, -3194.33, -38.99),  -- Replace with your coordinates
        Length = 10.0,
        Width = 10.0
    },
    ['DrugLab2'] = {
        Center = vector3(1000.0, -2000.0, -30.0),     -- Replace with your coordinates
        Length = 10.0,
        Width = 10.0
    },
    ['DrugLab3'] = {
        Center = vector3(900.0, -1800.0, -25.0),      -- Replace with your coordinates
        Length = 10.0,
        Width = 10.0
    }
}

-- Bonus Settings
Config.YieldBonus = true        -- Enable yield bonuses in zones
Config.BonusYield = 2           -- Multiplier for yields (2 = double)
Config.TimeBonus = true         -- Enable time bonuses in zones
Config.BonusTime = 0.5          -- Multiplier for time (0.5 = 50% faster)
Config.TTC = 5                  -- Base time to craft in seconds

-- Blacklist (items that don't get yield bonuses)
Config.BlacklistItems = {
    'weapon_pistol',
    'weapon_smg',
    'weapon_assaultrifle',
    -- Add more weapons or items as needed
}

-- Debug mode
Config.debug = false            -- Set to true for testing
```

## Finding Your Zone Coordinates

1. Go to your drug lab location in-game
2. Use a coordinate script or command (e.g., `/coords`)
3. Note the X, Y, Z coordinates
4. Update the `Center` values in Config.BonusZones
5. Adjust `Length` and `Width` to cover your desired area

## Dependencies

Ensure you have these resources installed and started:
- `qb-core` - QBCore framework
- `PolyZone` or `qb-target` - For BoxZone functionality

## Verification

After installation:

1. **Test Zone Detection**
   - Set `Config.debug = true`
   - Go to a bonus zone location
   - Check F8 console for zone detection messages

2. **Test Crafting Bonuses**
   - Enter a bonus zone
   - Open crafting menu (should say "BONUS ZONE ACTIVE!")
   - Craft a non-weapon item
   - Verify you receive bonus yields

3. **Test Blacklist**
   - Craft a blacklisted item in a bonus zone
   - Verify it only gives base yield (no bonus)

## Troubleshooting

### Zones Not Detecting
- Check PolyZone is installed and started
- Verify coordinates are correct
- Enable debug mode and check console
- Ensure zones are created on player load

### No Bonuses Applied
- Check Config.YieldBonus and Config.TimeBonus are true
- Verify Config.BonusYield and Config.BonusTime values
- Check if item is blacklisted
- Ensure you're actually in the zone when crafting

### Alien Effects Not Showing
- Effects only trigger while inside zones
- Check if you have the screen effect enabled in game settings
- Try different zones to see if one works

### Crafting Menu Issues
- Clear cache and restart resource
- Check for JavaScript console errors (F12)
- Verify all files were copied correctly

## Support

If you encounter issues:
1. Check the console for error messages
2. Enable debug mode for detailed logging
3. Verify all dependencies are installed
4. Ensure config.lua is properly formatted

## File Structure

```
NS-Crafting-Updated/
├── client/
│   ├── crafting.lua          (Updated with bonus zones)
│   ├── crafting_original.lua (Backup of GUI version)
│   └── crafting_backup.lua   (Original backup)
├── server/
│   └── crafting.lua
├── html/
│   ├── index.html
│   ├── css/
│   └── js/
├── config.lua
├── fxmanifest.lua
├── BONUS_ZONES_INTEGRATION.md
└── INSTALLATION_GUIDE.md
```