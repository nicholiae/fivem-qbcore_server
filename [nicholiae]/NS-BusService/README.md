# NS-BusService Multi-Player Version v2.0.1 (Fixed)

## Overview
Enhanced city bus service module for QB-Core with multi-player support. Players can now share bus trips with nearby friends, creating a more social transportation experience.

## Features
- ✅ **Multi-Player Bus Trips**: Share rides with up to 4 passengers
- ✅ **Proximity Detection**: Automatically detects nearby players (15m radius)
- ✅ **Trip Invitations**: Players receive invitations to join existing trips
- ✅ **Shared Boarding**: All passengers can board the same bus
- ✅ **Individual Payment**: Each passenger pays their own fare (configurable)
- ✅ **Backward Compatible**: All original single-player functionality preserved
- ✅ **Admin Commands**: Reset service and toggle multi-player features

## Installation
1. Copy `NS-BusService-Multiplayer` folder to your `resources` directory
2. Add `ensure NS-BusService-Multiplayer` to your `server.cfg`
3. Restart your server

## Configuration (config.lua)
```lua
-- Multi-player settings
Config.MultiPlayerEnabled = true -- Enable multi-player bus trips
Config.ProximityRadius = 15.0 -- Distance to detect nearby players (in meters)
Config.MaxPassengers = 4 -- Maximum passengers per bus (excluding driver)
Config.RequireInvitation = false -- False = auto-invite nearby players, True = require host approval
```

## Usage
### Single Player (Original)
1. Go to any bus stop
2. Press [E] to call bus service
3. Select your destination
4. Wait for bus and board when it arrives

### Multi-Player (New)
1. **Host Player**: Follow single player steps above
2. **Nearby Players**: Receive invitation popup automatically
3. **Joining Players**: Accept invitation to sync to host's bus
4. **All Passengers**: Board the same bus when prompted with [E]
5. **Trip Completion**: All passengers pay individually upon exit

## Admin Commands
- `/nsbusreset` - Reset the bus service for all players
- `/nsbusmulti` - Toggle multi-player functionality

## Key Features Explained

### Proximity Detection
When a player calls a bus, the system automatically detects all players within 15 meters and sends them trip invitations.

### Shared Bus State
Only the host player spawns and controls the bus. Passengers synchronize to the host's bus instance, ensuring everyone sees and interacts with the same vehicle.

### Trip Management
- Server tracks all active trips with passenger lists
- Automatic cleanup when trips end or players disconnect
- Host controls trip lifecycle, passengers follow along

### Boarding System
- All passengers see boarding prompts when near the bus
- Automatic seat assignment for each passenger
- Individual boarding and exit handling

## File Structure
```
NS-BusService-Multiplayer/
├── client/
│   ├── main.lua      # Main client logic with multi-player support
│   ├── blips.lua     # Bus stop blips
│   └── target.lua    # Target system (placeholder)
├── server/
│   ├── main.lua      # Server logic with trip management
│   ├── commands.lua  # Admin commands
│   └── version.lua   # Version information
├── config.lua        # Configuration with multi-player settings
├── fxmanifest.lua    # Resource manifest
└── README.md         # This file
```

## Testing Checklist
- [ ] Single player can call bus (existing functionality preserved)
- [ ] Multiple players detected at bus stop
- [ ] Nearby players receive trip invitation
- [ ] Players can join existing trip
- [ ] All passengers see same bus/driver
- [ ] Boarding prompts work for all passengers
- [ ] Trip completion works for all passengers
- [ ] Individual payment functions correctly
- [ ] Bus cleanup works when all passengers exit
- [ ] Error handling for disconnected players

## Troubleshooting
- **Players not detected**: Check `Config.ProximityRadius` setting
- **Invitations not showing**: Ensure `Config.MultiPlayerEnabled = true`
- **Bus not spawning**: Check vehicle and ped hashes in config
- **Payment issues**: Verify `Config.Price` setting and player funds

## Changelog
### v2.0.1 (Fixed)
- Fixed NetworkGetNetworkIdOfEntity error
- Implemented coordinate-based synchronization instead of network IDs
- Enhanced error handling for entity detection
- Improved passenger bus finding mechanism
- Maintained all multi-player functionality without network dependency

### v2.0.0
- Added multi-player bus trip support
- Implemented proximity detection system
- Added trip invitation system
- Created shared bus state management
- Enhanced boarding system for multiple passengers
- Added admin commands for multi-player features

### v1.0.0
- Original single-player bus service
- Basic transportation functionality
- Payment system integration

## Support
For issues or questions, please contact the development team or check the debug logs by setting `Config.Debug = true` in config.lua.