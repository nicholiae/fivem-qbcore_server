# Specialty Package Feature Documentation

## Overview
This update adds a specialty package option to the NS-ForkLiftRecycle module, allowing players to pay $500 to select a specific resource type for their delivery and receive increased bonus item chances.

## New Features

### 1. Package Type Selection Menu
When players interact with a package pickup location, they now see a menu with two options:
- **Regular Package**: Standard recycling package (free)
- **Specialty Package**: Choose specific resource ($500)

### 2. Specialty Package Benefits
- **Resource Selection**: Choose from 8 available resources (metalscrap, plastic, copper, iron, aluminum, steel, glass, rubber)
- **Guaranteed Resource**: Entire delivery contains only the selected resource
- **Increased Bonus Chances**:
  - ChanceItem (cryptostick): 7% → 27% (+20%)
  - LuckyItem (electronickit): 10% → 30% (+20%)

### 3. Payment System
- **Cost**: $500 per specialty package
- **Payment Priority**: Cash first, then bank
- **Payment Timing**: Charged when package is picked up (after resource selection)
- **Insufficient Funds**: Specialty option shown but disabled if player cannot afford it

### 4. User Experience
- **Cancel Option**: Players can cancel menu without breaking the game loop
- **Re-access**: Players can reopen menu by returning to pickup location
- **Visual Feedback**: Notifications for successful purchase and insufficient funds

## Configuration Options

New settings in `config.lua`:

```lua
-- Specialty Package Settings
SpecialtyPackageCost    = 500,     -- Cost in dollars
SpecialtyChanceBonus    = 20,      -- Adds 20% to ChanceItem probability
SpecialtyLuckyBonus     = 20,      -- Adds 20% to LuckyItem probability
```

## Technical Implementation

### Client-Side Changes (client/main.lua)
- Added specialty package state variables
- Implemented two-tier menu system (package type → resource selection)
- Added payment check function
- Modified pickup event to show menu instead of immediate pickup
- Added new events for menu navigation and specialty selection

### Server-Side Changes (server/main.lua)
- Added payment verification and deduction logic
- Modified reward distribution to handle specialty packages
- Implemented increased bonus chances for specialty packages
- Added cash-first payment priority system

### New Events

**Client Events:**
- `NS-ForkLiftRecycling:client:showPackageTypeMenu` - Shows package type selection
- `NS-ForkLiftRecycling:client:showSpecialtyItemMenu` - Shows resource selection
- `NS-ForkLiftRecycling:client:confirmRegularPackage` - Confirms regular package pickup
- `NS-ForkLiftRecycling:client:selectSpecialtyItem` - Confirms specialty item selection
- `NS-ForkLiftRecycling:client:specialtyPickupApproved` - Server approved specialty purchase
- `NS-ForkLiftRecycling:client:specialtyPickupDenied` - Server denied specialty purchase
- `NS-ForkLiftRecycling:client:cancelPackageSelection` - Cancel menu

**Server Events:**
- `NS-ForkLiftRecycling:server:attemptSpecialtyPickup` - Verify payment and approve/deny
- `NS-ForkLiftRecycling:server:getItem` - Modified to accept specialty parameters

## Workflow

### Regular Package Flow
1. Player approaches pickup location
2. Menu appears with package type options
3. Player selects "Regular Package"
4. Package pickup animation begins
5. Player delivers package
6. Receives random items from ItemTable with standard bonus chances

### Specialty Package Flow
1. Player approaches pickup location
2. Menu appears with package type options
3. Player selects "Specialty Package" (if they have $500)
4. Resource selection menu appears
5. Player selects desired resource
6. Server verifies funds and deducts $500
7. Package pickup animation begins
8. Player delivers package
9. Receives only selected resource with increased bonus chances

## Compatibility

- **Framework**: qb-core
- **Menu System**: qb-menu
- **Inventory**: qb-inventory
- **Target System**: qb-target (optional, based on Config.UseTarget)
- **Zone System**: PolyZone (for non-target mode)

## Testing Checklist

- [ ] Regular package pickup works normally
- [ ] Specialty menu appears and displays correctly
- [ ] Resource selection menu shows all 8 items
- [ ] Payment deducted correctly (cash priority)
- [ ] Insufficient funds prevents specialty selection
- [ ] Selected resource delivered correctly (all same item)
- [ ] Bonus chances increased for specialty packages
- [ ] Cancel button works without breaking loop
- [ ] Menu can be reopened after canceling
- [ ] Works in both target and non-target modes

## Known Dependencies

- qb-core framework
- qb-menu for menu system
- qb-inventory for item management
- QBCore.Shared.Items table must contain all items in Config.ItemTable

## Future Enhancement Ideas

- Add visual indicator for specialty packages (different colored markers)
- Add specialty package statistics tracking
- Add bulk purchase discounts
- Add VIP/membership discounts
- Add daily specialty package limits
- Add specialty package cooldown timer