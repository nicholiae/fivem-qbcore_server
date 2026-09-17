# NC Drug Addiction System - Integration Guide

## Overview

This drug addiction system integrates with QBCore-based FiveM servers. It tracks player drug usage, manages addiction levels, enforces health caps, and provides withdrawal effects.

## Installation

1. Place the `nc-drugaddiction` folder in your server's `resources` directory
2. Add `ensure nc-drugaddiction` to your `server.cfg` (after `qb-core`)
3. Restart your server

## Configuration

All settings are in `config.lua`. Key settings include:

### Decay Rates
- `OnlineDecayRate`: 2.0 points per hour (when player is online and not using)
- `OfflineDecayRate`: 0.1 points per hour (when player is offline)

### Health Cap
- `BaseMaxHealth`: 200 (default GTA V max health)
- `MinimumHealthCap`: 150 (minimum health cap regardless of addiction)
- `HealthCapPerAddictionLevel`: 0.5 (health reduction per addiction point)

### Narcan
- `NarcanResetsAllAddictions`: `true` (narcan resets ALL drug addictions to 0)

### Tolerance (Doubled values as requested)
- See `Config.ToleranceGain` in config.lua for specific values

## Integration with qb-smallresources

To integrate with the drug items in qb-smallresources, you need to add the addiction tracking to each drug use event.

### Method 1: Usable Items (Recommended)

Add this to your `qb-smallresources/server/consumables.lua` or create a new file:

```lua
-- Example: Adding addiction tracking to cocaine use
QBCore.Functions.CreateUseableItem('cokebaggy', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    
    -- Trigger addiction system
    TriggerEvent('nc-drugaddiction:server:UseDrug', 'cokebaggy')
    
    -- Your existing drug effects code here
    -- ...
end)

-- Example: Adding addiction tracking to weed use
QBCore.Functions.CreateUseableItem('joint', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    
    -- Trigger addiction system
    TriggerEvent('nc-drugaddiction:server:UseDrug', 'joint')
    
    -- Your existing weed effects code here
    -- ...
end)

-- Example: Adding addiction tracking to alcohol
QBCore.Functions.CreateUseableItem('beer', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    
    -- Trigger addiction system
    TriggerEvent('nc-drugaddiction:server:UseDrug', 'beer')
    
    -- Your existing alcohol effects code here
    -- ...
end)
```

### Method 2: Export Function

You can also use the export function directly:

```lua
-- In your drug use handler
exports['nc-drugaddiction']:RegisterDrugUse(source, itemName)
```

## Supported Drug Items

The following items are mapped in `Config.ItemToDrug`:

### Alcohol
- beer, whiskey, vodka, wine

### Marijuana
- joint, weed_brick, weed

### Cocaine
- cokebaggy, coke, cocaine, coke_brick, coke_small_brick

### Crack
- crack_baggy, crack, crack_brick, crack_small_brick

### Meth
- meth, meth_brick

### Ecstasy
- xtcbaggy, ecstasy, xtc

### Fentanyl
- fentanyl

### Lean
- lean

### Oxycontin
- oxy, oxycontin, oxycodone

## Adding New Drugs

To add support for new drugs:

1. Add the drug type to `Config.AddictionGain`
2. Add the drug type to `Config.ToleranceGain`
3. Add the drug type to `Config.OverdoseThresholds`
4. Add the drug type to `Config.DrugNames`
5. Map the item name to drug type in `Config.ItemToDrug`
6. Optionally add effect profile in `shared/drugs.lua`

## Narcan Item

Add narcan as a usable item in your server:

```lua
-- In your usable items file
QBCore.Functions.CreateUseableItem('narcan', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    
    -- Remove item from inventory
    Player.Functions.RemoveItem('narcan', 1, item.slot)
    
    -- Trigger narcan effect
    TriggerEvent('nc-drugaddiction:server:UseNarcan')
end)
```

## Rehab Treatment

Add a rehab location/interaction:

```lua
-- Example rehab command
RegisterCommand('rehab', function(source)
    TriggerEvent('nc-drugaddiction:server:RehabTreatment')
end)
```

## Exports Available

### Server-side
- `GetPlayerDrugData(citizenid)` - Get all addiction data for a player
- `GetDrugAddictionLevel(citizenid, drugType)` - Get specific drug addiction level
- `GetDrugToleranceLevel(citizenid, drugType)` - Get tolerance level
- `GetPlayerHealthCap(citizenid)` - Get calculated health cap
- `AddAddiction(citizenid, drugType, amount)` - Manually add addiction
- `RemoveAddiction(citizenid, drugType, amount)` - Manually remove addiction
- `ResetAllAddictions(citizenid)` - Reset all addictions (narcan effect)
- `CheckWithdrawal(citizenid, drugType)` - Check if in withdrawal
- `GetPlayerAddictionsList(citizenid, threshold)` - Get list of addictions above threshold
- `GetDrugEffectMultiplier(citizenid, drugType)` - Get effect multiplier based on tolerance

### Client-side
- `GetAddictionLevel(drugType)` - Get local addiction level
- `GetToleranceLevel(drugType)` - Get local tolerance level
- `GetAllAddictionData()` - Get all local addiction data
- `GetCurrentHealthCap()` - Get current health cap
- `GetHealthCapPercentage()` - Get health cap as percentage
- `IsHealthCapped()` - Check if health is currently capped
- `GetHealthDeficit()` - Get amount of health lost to addiction

## Health Cap System

The health cap system works as follows:

1. Each addiction level point reduces max health by 0.5 (configurable)
2. Withdrawal stages can further reduce health cap
3. Minimum health cap is 150 (configurable)
4. Health cap is enforced client-side every second
5. Health is gradually reduced to cap (not instant)

## Withdrawal System

Withdrawal stages trigger based on time since last use:

- Stage 1: 1 hour after last use
- Stage 2: 3 hours after last use
- Stage 3: 6 hours after last use
- Stage 4: 12 hours after last use

Effects include:
- Screen shake
- Stress increase
- Health cap reduction
- Speed/stamina reduction
- Potential blackouts (Stage 4)

## Overdose System

Overdoses occur when:
- Player uses too many doses within 10 minutes
- Threshold varies by drug (fentanyl is easiest to OD)
- Overdose causes player to enter "last stand" state
- Requires narcan or EMS intervention

## Data Persistence

Player addiction data is stored in player metadata:
- `metadata.drugaddictions.addictions` - Addiction levels
- `metadata.drugaddictions.tolerance` - Tolerance levels
- `metadata.drugaddictions.lastUse` - Last use timestamps
- `metadata.drugaddictions.totalUseCount` - Total use counts
- `metadata.drugaddictions.lastOnline` - Last online timestamp

## Debug Mode

Enable `Config.Debug = true` for console logging of:
- Player data loading/saving
- Drug use events
- Decay application
- Health cap calculations