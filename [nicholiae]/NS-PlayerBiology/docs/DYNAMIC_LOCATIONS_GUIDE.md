# Dynamic Bathroom Locations System - User Guide

## Overview

The NS-PlayerBiology resource now includes a dynamic location management system that allows administrators to create, manage, and sync bathroom locations in real-time without server restarts. This system is inspired by the qb-doorlock door creation mechanism.

## Features

- ✅ **Real-time Location Creation**: Add new bathroom locations in-game
- ✅ **Automatic Synchronization**: New locations sync to all connected clients instantly
- ✅ **Persistent Storage**: Locations saved to JSON files survive server restarts
- ✅ **Multiple Location Types**: Support for toilets, urinals, showers, tubs, sinks, and public bathrooms
- ✅ **Easy Management**: Simple commands for adding, removing, and listing locations
- ✅ **Backward Compatible**: Works alongside existing config.lua locations

## Location Types

The system supports six types of bathroom locations:

1. **toiletChair** - Toilet seats
2. **urinalStand** - Standing urinals
3. **showerStall** - Shower stalls
4. **bathTub** - Bathtubs
5. **handSink** - Hand washing sinks
6. **public** - Public bathroom stations

## Admin Commands

### Creating New Locations

```
/setupbiology
```

**How to use:**
1. Stand at the exact position where you want the bathroom location
2. Face the direction the player should face when using it
3. Type `/setupbiology` in chat
4. Press **[H]** to capture your current location
5. Select the location type:
   - Press **[1]** for Toilet
   - Press **[2]** for Urinal
   - Press **[3]** for Shower
   - Press **[4]** for Tub
   - Press **[5]** for Sink
   - Press **[6]** for Public
6. The location is automatically saved and synced to all players
7. Press **[E]** to exit the helper at any time

### Deleting Locations

```
/deletebiology <type> <id>
```

**Parameters:**
- `type`: Location type (toiletChair, urinalStand, showerStall, bathTub, handSink, public)
- `id`: The ID number of the location to delete

**Example:**
```
/deletebiology toiletChair 5
```

### Listing Locations

```
/listbiology [type]
```

**Parameters:**
- `type` (optional): Specific location type to list

**Examples:**
```
/listbiology                    # Lists all location types with counts
/listbiology toiletChair        # Lists all toilet locations with details
```

### Reloading Locations

```
/reloadbiology
```

Reloads all locations from JSON files and syncs to all clients. Useful after manually editing JSON files or after a backup restore.

## File Structure

Dynamic locations are stored in JSON files:

```
NS-PlayerBiology/
├── locations/
│   ├── toiletChair.json
│   ├── urinalStand.json
│   ├── showerStall.json
│   ├── bathTub.json
│   ├── handSink.json
│   └── public.json
```

## JSON Format

Each location is stored with the following structure:

```json
{
  "id": 1,
  "targetCoords": {"x": 100.0, "y": 200.0, "z": 30.0},
  "playerCoords": {"x": 100.0, "y": 200.0, "z": 30.0},
  "heading": 90.0,
  "animDict": "animation_dict",
  "animName": "animation_name",
  "returnCoords": {"x": 100.0, "y": 200.0, "z": 30.0},
  "createdBy": "Admin Name",
  "createdAt": "2024-01-01 12:00:00"
}
```

## How It Works

### Server-Side
1. **Storage**: Locations are stored in JSON files in the `locations/` directory
2. **Loading**: On resource start, all JSON files are loaded into memory
3. **Saving**: When a new location is created, it's added to memory and saved to the JSON file
4. **Syncing**: New locations are broadcast to all connected clients via events

### Client-Side
1. **Receiving**: Clients receive dynamic locations from the server
2. **Merging**: Dynamic locations are merged with static config.lua locations
3. **Usage**: The merged location list is used for all bathroom interactions
4. **Updates**: Clients automatically receive updates when locations are added or removed

## Workflow Comparison

### Old Method (Config.lua)
1. Admin positions themselves at location
2. Run `/setupbiology` command
3. Copy the generated config text
4. Manually paste into config.lua
5. Restart server for changes to take effect
6. All players must reconnect

### New Method (Dynamic System)
1. Admin positions themselves at location
2. Run `/setupbiology` command
3. Press [H] to capture location
4. Select location type (1-6)
5. ✅ **Done!** Location is saved and synced instantly
6. All players can use it immediately

## Best Practices

### For Administrators

1. **Test Locations**: After creating a location, test it immediately to ensure proper positioning
2. **Backup Regularly**: Backup the `locations/` directory regularly
3. **Use Descriptive Names**: When creating locations, note the building/area in server logs
4. **Clean Up**: Delete unused or incorrectly placed locations promptly

### For Server Owners

1. **Backup Before Updates**: Always backup `locations/` before updating the resource
2. **Monitor File Size**: Keep an eye on JSON file sizes if you have many locations
3. **Regular Maintenance**: Periodically review and clean up duplicate or unused locations
4. **Version Control**: Consider keeping location files in version control

## Troubleshooting

### Locations Not Syncing

**Problem**: New locations don't appear for other players

**Solutions:**
1. Check server console for errors
2. Verify admin permissions are set correctly
3. Try `/reloadbiology` command
4. Ensure `locations/` directory has write permissions

### Locations Lost After Restart

**Problem**: Dynamic locations disappear after server restart

**Solutions:**
1. Check if JSON files exist in `locations/` directory
2. Verify file permissions (server needs read/write access)
3. Check server console for file loading errors
4. Restore from backup if necessary

### Cannot Create Locations

**Problem**: `/setupbiology` command doesn't work

**Solutions:**
1. Verify you have admin permissions
2. Check if resource is started properly
3. Look for errors in F8 console (client-side)
4. Ensure you're pressing the correct keys (H to capture, 1-6 to select type)

### Wrong Position/Heading

**Problem**: Location is created at wrong position or facing wrong direction

**Solutions:**
1. Delete the incorrect location using `/deletebiology`
2. Position yourself correctly (stand exactly where player should be)
3. Face the correct direction before pressing [H]
4. Create the location again

## Migration Guide

### From Old Config.lua System

If you have existing locations in config.lua that you want to keep:

1. **Keep Static Locations**: Leave existing config.lua locations as-is
2. **Add New Dynamically**: Use the new system for all new locations
3. **Both Work Together**: Static and dynamic locations work side-by-side
4. **Optional Migration**: You can manually convert config.lua entries to JSON if desired

### Converting Config.lua to JSON (Optional)

If you want to convert existing config.lua locations to JSON format:

1. Open the appropriate JSON file in `locations/`
2. Copy the location data from config.lua
3. Convert to JSON format (see JSON Format section above)
4. Save the file
5. Run `/reloadbiology` command
6. Remove the entries from config.lua (optional)

## Technical Details

### Events

**Server Events:**
- `PlayerBiology:server:saveLocation` - Save new location
- `PlayerBiology:server:deleteLocation` - Delete location
- `PlayerBiology:server:requestLocations` - Request all locations
- `PlayerBiology:server:reloadLocations` - Reload from files

**Client Events:**
- `PlayerBiology:client:receiveAllLocations` - Receive all locations
- `PlayerBiology:client:syncLocation` - Receive new location
- `PlayerBiology:client:removeLocation` - Remove location
- `PlayerBiology:client:setupbiology` - Start location helper

### Exports

**Server Exports:**
```lua
-- Get dynamic locations only
local locations = exports['NS-PlayerBiology']:GetDynamicLocations('toiletChair')

-- Get all locations (static + dynamic)
local allLocations = exports['NS-PlayerBiology']:GetAllLocations('toiletChair')
```

**Client Exports:**
```lua
-- Get merged locations
local locations = exports['NS-PlayerBiology']:GetMergedLocations('toiletChair')
```

## Support

For issues, questions, or feature requests:
1. Check this guide first
2. Review server console logs
3. Check client F8 console for errors
4. Contact the resource developer

## Changelog

### Version 2.0 - Dynamic Locations System
- Added real-time location creation
- Added JSON-based storage
- Added automatic client synchronization
- Added location management commands
- Maintained backward compatibility with config.lua
- Improved setup helper UI

---

**Note**: This system requires admin permissions for all management commands. Ensure your QBCore permissions are configured correctly.