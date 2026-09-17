# Installation Instructions

## Prerequisites
- qb-core framework installed
- qb-menu resource installed
- qb-inventory resource installed
- qb-target resource (if using target mode)
- PolyZone resource (if not using target mode)

## Installation Steps

1. **Backup Your Current Version**
   - Make a backup of your current NS-ForkLiftRecycle folder
   - Store it in a safe location in case you need to revert

2. **Stop the Server**
   - Stop your FiveM server before making changes

3. **Replace Files**
   - Delete the old NS-ForkLiftRecycle folder from your resources directory
   - Extract the new NS-ForkLiftRecycle folder to your resources directory

4. **Verify Configuration**
   - Open `config.lua` and verify all settings match your server setup
   - Adjust `SpecialtyPackageCost` if you want a different price (default: $500)
   - Adjust bonus percentages if desired (default: +20% for both)

5. **Check Dependencies**
   - Ensure qb-menu is started before NS-ForkLiftRecycle in your server.cfg
   - Ensure qb-inventory is started before NS-ForkLiftRecycle
   - Ensure qb-core is started before NS-ForkLiftRecycle

6. **Start the Server**
   - Start your FiveM server
   - Monitor console for any errors

7. **Test the Feature**
   - Join the server
   - Go to the recycling job location
   - Clock in
   - Drive to a package pickup location
   - Verify the menu appears with both options
   - Test both regular and specialty packages

## Troubleshooting

### Menu Doesn't Appear
- Check that qb-menu is installed and started
- Check console for errors
- Verify player has required permissions

### Payment Not Working
- Check that player has money in cash or bank
- Verify qb-core money functions are working
- Check server console for errors

### Items Not Received
- Verify all items in Config.ItemTable exist in QBCore.Shared.Items
- Check qb-inventory is functioning correctly
- Check server console for errors

### Specialty Option Disabled
- Verify player has at least $500 in cash or bank combined
- Check that Config.SpecialtyPackageCost is set correctly

## Configuration Options

```lua
-- In config.lua

-- Cost of specialty package
SpecialtyPackageCost = 500

-- Bonus percentage added to ChanceItem probability
SpecialtyChanceBonus = 20  -- 7% becomes 27%

-- Bonus percentage added to LuckyItem probability  
SpecialtyLuckyBonus = 20   -- 10% becomes 30%
```

## Support

If you encounter issues:
1. Check server console for error messages
2. Verify all dependencies are installed and up to date
3. Ensure configuration matches your server setup
4. Check that all items in ItemTable exist in your items database

## Rollback Instructions

If you need to revert to the previous version:
1. Stop the server
2. Delete the new NS-ForkLiftRecycle folder
3. Restore your backup folder
4. Start the server