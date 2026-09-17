# NS-TaxiServices (Fixed Version)

## Overview
This is a fixed version of the NS-TaxiServices FiveM module with improved functionality, performance, and reliability.

## Issues Fixed
1. **Payment Logic Error**: Corrected the inverted payment logic that was removing money from the wrong account
2. **Resource Cleanup**: Implemented complete resource cleanup when canceling or resetting the taxi service
3. **Error Handling**: Added model loading timeouts and validation checks
4. **Performance Optimization**: Improved threading efficiency with better wait times
5. **Configuration**: Updated default configuration values to be more realistic
6. **Variable Management**: Fixed variable scoping issues and inconsistent naming
7. **Reset Functionality**: Added proper reset command and event handler

## Installation
1. Backup your existing NS-TaxiServices folder
2. Replace the files in your NS-TaxiServices resource with the fixed versions:
   - `config.lua`
   - `client/main.lua`
   - `server/main.lua`
   - `__resource.lua`
3. Update the configuration file to match your server settings:
   - Set the correct fuel script name
   - Adjust prices and other settings as needed
4. Restart your server

## Commands
- `/callTaxi` - Call an NPC taxi to your location
- `/cancelTaxi` - Cancel an active taxi call
- `/resetTaxi` - Reset the taxi service completely

## Events
- `CxC:NpcTaxi:call` - Call taxi event
- `CxC:Taxi:cancelTaxi` - Cancel taxi event
- `CxC:Taxi:reset` - Reset taxi event
- `CxC:Taxi:killTaxiBlip` - Remove taxi blip
- `CxC:setBlip` - Set taxi blip

## Configuration Options
- `Config.FuelScript` - Set your fuel script name
- `Config.EndLocation` - Configurable end location for taxis
- `Config.Debug` - Enable/disable debug logging

## Performance Improvements
- Optimized thread wait times to reduce server load
- Added timeouts for model loading to prevent hanging
- Improved resource cleanup to prevent memory leaks
- Consolidated similar functionality where possible

## Compatibility
This fixed version maintains compatibility with existing QB-Core frameworks and should work with most QB-based servers.