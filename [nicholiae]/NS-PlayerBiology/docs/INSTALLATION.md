# Installation Guide - Dynamic Locations System

## Prerequisites

- QBCore Framework
- NS-PlayerBiology resource (base version)
- Server with file write permissions
- Admin permissions configured in QBCore

## Installation Steps

### 1. Backup Your Current Setup

```bash
# Backup your current NS-PlayerBiology folder
cp -r resources/NS-PlayerBiology resources/NS-PlayerBiology_backup
```

### 2. Update Files

Replace or add the following files in your NS-PlayerBiology resource:

**New Files:**
- `server/locations.lua` - Server-side location management
- `client/locations.lua` - Client-side location handling
- `locations/` directory with JSON files

**Updated Files:**
- `fxmanifest.lua` - Updated to include new scripts

**Documentation:**
- `DYNAMIC_LOCATIONS_GUIDE.md` - Complete user guide
- `QUICK_REFERENCE.md` - Quick reference card
- `INSTALLATION.md` - This file

### 3. Create Locations Directory

If not already present, create the locations directory:

```bash
cd resources/NS-PlayerBiology
mkdir locations
```

### 4. Create JSON Files

Create empty JSON files for each location type:

```bash
cd locations
echo "[]" > toiletChair.json
echo "[]" > urinalStand.json
echo "[]" > showerStall.json
echo "[]" > bathTub.json
echo "[]" > handSink.json
echo "[]" > public.json
```

### 5. Set File Permissions

Ensure the server has read/write permissions:

```bash
chmod 755 locations/
chmod 644 locations/*.json
```

### 6. Update fxmanifest.lua

Your `fxmanifest.lua` should include:

```lua
client_scripts {
    'client/client.lua',
    'client/locations.lua'  -- NEW
}

server_scripts {
    'server/server.lua',
    'server/locations.lua'  -- NEW
}

files {
    'html/index.html',
    'html/index.js',
    'locations/*.json'      -- NEW
}
```

### 7. Restart Resource

```
# In server console or in-game
restart NS-PlayerBiology

# Or restart server
```

## Verification

### Check Server Console

After restart, you should see:

```
[NS-PlayerBiology] Loading dynamic locations...
[NS-PlayerBiology] Loaded 0 dynamic toiletChair locations
[NS-PlayerBiology] Loaded 0 dynamic urinalStand locations
[NS-PlayerBiology] Loaded 0 dynamic showerStall locations
[NS-PlayerBiology] Loaded 0 dynamic bathTub locations
[NS-PlayerBiology] Loaded 0 dynamic handSink locations
[NS-PlayerBiology] Loaded 0 dynamic public locations
[NS-PlayerBiology] Dynamic locations loaded successfully
[NS-PlayerBiology] Location management system loaded
[NS-PlayerBiology] Client location management loaded
```

### Test Commands

1. Join the server as admin
2. Type `/setupbiology` - Should open the helper
3. Type `/listbiology` - Should show location counts
4. Type `/reloadbiology` - Should reload locations

## Migrating Existing Locations (Optional)

If you want to convert existing config.lua locations to the dynamic system:

### Option 1: Keep Both (Recommended)

- Leave existing config.lua locations as-is
- Use dynamic system for new locations only
- Both systems work together seamlessly

### Option 2: Convert to Dynamic

1. Open your config.lua
2. Find a location entry, for example:

```lua
[1] = { 
    targetCoords = vector3(-799.94, 330.1, 210.3),
    playerCoords = vector3(-799.94, 330.1, 210.3),
    heading = 357.77,
    animDict = "timetable@michael@on_sofabase",
    animName = "sit_sofa_base",
    returnCoords = vector3(-799.94, 330.1, 210.3)
}
```

3. Convert to JSON format in appropriate file:

```json
{
  "id": 1,
  "targetCoords": {"x": -799.94, "y": 330.1, "z": 210.3},
  "playerCoords": {"x": -799.94, "y": 330.1, "z": 210.3},
  "heading": 357.77,
  "animDict": "timetable@michael@on_sofabase",
  "animName": "sit_sofa_base",
  "returnCoords": {"x": -799.94, "y": 330.1, "z": 210.3},
  "createdBy": "Migration",
  "createdAt": "2024-01-01 00:00:00"
}
```

4. Run `/reloadbiology` in-game
5. Remove from config.lua (optional)

## Troubleshooting Installation

### Resource Won't Start

**Check:**
- fxmanifest.lua syntax is correct
- All required files are present
- File paths are correct

**Solution:**
```
# Check server console for specific error
# Verify file structure matches documentation
```

### Locations Directory Not Found

**Error:** `Error: Could not open file for writing`

**Solution:**
```bash
# Create directory manually
mkdir resources/NS-PlayerBiology/locations

# Set permissions
chmod 755 resources/NS-PlayerBiology/locations
```

### JSON Files Not Loading

**Error:** `Error decoding JSON`

**Solution:**
```bash
# Ensure files contain valid JSON (at minimum: [])
echo "[]" > locations/toiletChair.json
echo "[]" > locations/urinalStand.json
# ... repeat for all types
```

### Commands Not Working

**Check:**
- You have admin permissions in QBCore
- Resource is started (`ensure NS-PlayerBiology`)
- No conflicting resources

**Solution:**
```lua
-- Verify in QBCore permissions config
['admin'] = {
    'command.setupbiology',
    'command.deletebiology',
    'command.listbiology',
    'command.reloadbiology'
}
```

## File Structure After Installation

```
NS-PlayerBiology/
├── client/
│   ├── client.lua
│   └── locations.lua          ← NEW
├── server/
│   ├── server.lua
│   └── locations.lua          ← NEW
├── locations/                 ← NEW
│   ├── README.md
│   ├── toiletChair.json
│   ├── urinalStand.json
│   ├── showerStall.json
│   ├── bathTub.json
│   ├── handSink.json
│   └── public.json
├── html/
│   ├── index.html
│   └── index.js
├── config.lua
├── fxmanifest.lua            ← UPDATED
├── DYNAMIC_LOCATIONS_GUIDE.md ← NEW
├── QUICK_REFERENCE.md         ← NEW
└── INSTALLATION.md            ← NEW
```

## Post-Installation

### 1. Test Location Creation

1. Join server as admin
2. Go to any location
3. Type `/setupbiology`
4. Press H, then select type (1-6)
5. Verify location is saved
6. Check JSON file has new entry

### 2. Test Synchronization

1. Create a location as admin
2. Have another player join
3. Verify they can see/use the new location
4. No restart should be needed

### 3. Test Persistence

1. Create a location
2. Restart the server
3. Verify location still exists
4. Check JSON file persists

### 4. Backup Setup

Set up automatic backups:

```bash
# Add to cron or backup script
cp -r resources/NS-PlayerBiology/locations/ backups/biology_locations_$(date +%Y%m%d)/
```

## Rollback Procedure

If you need to rollback to the old system:

1. Stop the server
2. Restore from backup:
   ```bash
   rm -rf resources/NS-PlayerBiology
   cp -r resources/NS-PlayerBiology_backup resources/NS-PlayerBiology
   ```
3. Start the server

## Support

If you encounter issues:

1. Check server console for errors
2. Check client F8 console for errors
3. Verify file permissions
4. Review this installation guide
5. Check the troubleshooting section in DYNAMIC_LOCATIONS_GUIDE.md

## Next Steps

After successful installation:

1. Read `DYNAMIC_LOCATIONS_GUIDE.md` for detailed usage
2. Keep `QUICK_REFERENCE.md` handy for commands
3. Set up regular backups of the `locations/` directory
4. Train your admin team on the new system

---

**Installation Complete!** You can now create and manage bathroom locations dynamically.