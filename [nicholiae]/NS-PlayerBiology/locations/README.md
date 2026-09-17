# Dynamic Bathroom Locations

This directory stores dynamically created bathroom locations in JSON format.

## File Structure

Each bathroom type has its own JSON file:
- `toiletChair.json` - Toilet locations
- `urinalStand.json` - Urinal locations
- `showerStall.json` - Shower locations
- `bathTub.json` - Bathtub locations
- `handSink.json` - Hand sink locations
- `public.json` - Public bathroom locations

## Format

Each JSON file contains an array of location objects:

```json
[
  {
    "id": 1,
    "targetCoords": {"x": 100.0, "y": 200.0, "z": 30.0},
    "playerCoords": {"x": 100.0, "y": 200.0, "z": 30.0},
    "heading": 90.0,
    "animDict": "animation_dict",
    "animName": "animation_name",
    "returnCoords": {"x": 100.0, "y": 200.0, "z": 30.0},
    "createdBy": "Player Name",
    "createdAt": "2024-01-01 12:00:00"
  }
]
```

## Notes

- These files are automatically created when admins add new locations
- Locations are synced to all clients when added
- Backup these files regularly
- Do not manually edit while server is running