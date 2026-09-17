# Items Reference Guide

This document provides a complete reference for all items that need to be added to your QBCore items configuration.

## Copy-Paste Ready Items

Copy the entire section below and paste it into your `qb-core/shared/items.lua` file:

```lua
-- ============================================
-- QBCORE CONTAINER INVENTORY SYSTEM - ITEMS
-- ============================================

-- WALLETS
['wallet'] = {
    ['name'] = 'wallet',
    ['label'] = 'Leather Wallet',
    ['weight'] = 100,
    ['type'] = 'item',
    ['image'] = 'wallet.png',
    ['unique'] = true,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'A simple leather wallet for carrying small items'
},

['wallet_premium'] = {
    ['name'] = 'wallet_premium',
    ['label'] = 'Premium Wallet',
    ['weight'] = 150,
    ['type'] = 'item',
    ['image'] = 'wallet_premium.png',
    ['unique'] = true,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'A premium leather wallet with extra space'
},

-- BACKPACKS
['backpack_small'] = {
    ['name'] = 'backpack_small',
    ['label'] = 'Small Backpack',
    ['weight'] = 500,
    ['type'] = 'item',
    ['image'] = 'backpack_small.png',
    ['unique'] = true,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'A small backpack for carrying extra items'
},

['backpack_medium'] = {
    ['name'] = 'backpack_medium',
    ['label'] = 'Medium Backpack',
    ['weight'] = 750,
    ['type'] = 'item',
    ['image'] = 'backpack_medium.png',
    ['unique'] = true,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'A medium-sized backpack with decent storage'
},

['backpack_large'] = {
    ['name'] = 'backpack_large',
    ['label'] = 'Large Backpack',
    ['weight'] = 1000,
    ['type'] = 'item',
    ['image'] = 'backpack_large.png',
    ['unique'] = true,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'A large backpack with plenty of storage space'
},

-- FURNITURE STORAGE
['storage_crate'] = {
    ['name'] = 'storage_crate',
    ['label'] = 'Storage Crate',
    ['weight'] = 5000,
    ['type'] = 'item',
    ['image'] = 'storage_crate.png',
    ['unique'] = false,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'A wooden storage crate that can be placed in your house'
},

['storage_safe'] = {
    ['name'] = 'storage_safe',
    ['label'] = 'Personal Safe',
    ['weight'] = 10000,
    ['type'] = 'item',
    ['image'] = 'storage_safe.png',
    ['unique'] = false,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'A secure safe for valuable items'
},

['storage_cabinet'] = {
    ['name'] = 'storage_cabinet',
    ['label'] = 'Storage Cabinet',
    ['weight'] = 8000,
    ['type'] = 'item',
    ['image'] = 'storage_cabinet.png',
    ['unique'] = false,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'A large storage cabinet for your home'
},

-- LOCKPICKS (Add these if not already present in your items.lua)
['lockpick'] = {
    ['name'] = 'lockpick',
    ['label'] = 'Lockpick',
    ['weight'] = 100,
    ['type'] = 'item',
    ['image'] = 'lockpick.png',
    ['unique'] = false,
    ['useable'] = false,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'A basic lockpick for breaking into things'
},

['advancedlockpick'] = {
    ['name'] = 'advancedlockpick',
    ['label'] = 'Advanced Lockpick',
    ['weight'] = 150,
    ['type'] = 'item',
    ['image'] = 'advancedlockpick.png',
    ['unique'] = false,
    ['useable'] = false,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'An advanced lockpick with better success rates'
},

-- ============================================
-- END CONTAINER INVENTORY ITEMS
-- ============================================
```

## Item Details

### Wallets

| Item Name | Label | Weight | Slots | Max Weight | Price |
|-----------|-------|--------|-------|------------|-------|
| wallet | Leather Wallet | 100 | 5 | 5000 | $50 |
| wallet_premium | Premium Wallet | 150 | 8 | 8000 | $150 |

**Properties:**
- Unique: Yes (only one per player)
- Useable: Yes
- Should Close: Yes

### Backpacks

| Item Name | Label | Weight | Slots | Max Weight | Price |
|-----------|-------|--------|-------|------------|-------|
| backpack_small | Small Backpack | 500 | 10 | 20000 | $200 |
| backpack_medium | Medium Backpack | 750 | 20 | 40000 | $500 |
| backpack_large | Large Backpack | 1000 | 30 | 60000 | $1000 |

**Properties:**
- Unique: Yes (only one per player)
- Useable: Yes
- Should Close: Yes
- Tradeable: Yes

### Furniture

| Item Name | Label | Weight | Slots | Max Weight | Price | Model |
|-----------|-------|--------|-------|------------|-------|-------|
| storage_crate | Storage Crate | 5000 | 25 | 100000 | $500 | prop_boxpile_07d |
| storage_safe | Personal Safe | 10000 | 15 | 50000 | $2000 | p_v_43_safe_s |
| storage_cabinet | Storage Cabinet | 8000 | 35 | 150000 | $1500 | prop_ld_int_safe_01 |

**Properties:**
- Unique: No (can have multiple)
- Useable: Yes
- Should Close: Yes
- Consumable: Yes (consumed on placement)
- Breakable: Yes (can be broken into)

### Lockpicks

| Item Name | Label | Weight | Success Rate | Damage on Fail |
|-----------|-------|--------|--------------|----------------|
| lockpick | Lockpick | 100 | 70% | 10 HP |
| advancedlockpick | Advanced Lockpick | 150 | 90% | 5 HP |

**Properties:**
- Unique: No
- Useable: No (used automatically)
- Should Close: Yes
- Consumable: Yes (consumed on use)

## Admin Commands

Use these commands to give items to players for testing:

```lua
-- Wallets
/giveitem [player_id] wallet 1
/giveitem [player_id] wallet_premium 1

-- Backpacks
/giveitem [player_id] backpack_small 1
/giveitem [player_id] backpack_medium 1
/giveitem [player_id] backpack_large 1

-- Furniture
/giveitem [player_id] storage_crate 1
/giveitem [player_id] storage_safe 1
/giveitem [player_id] storage_cabinet 1

-- Lockpicks
/giveitem [player_id] lockpick 5
/giveitem [player_id] advancedlockpick 3
```

## Image Requirements

All items require corresponding image files in `qb-inventory/html/images/`:

**Required Images:**
- wallet.png (256x256 recommended)
- wallet_premium.png
- backpack_small.png
- backpack_medium.png
- backpack_large.png
- storage_crate.png
- storage_safe.png
- storage_cabinet.png
- lockpick.png
- advancedlockpick.png

**Image Guidelines:**
- Format: PNG with transparency
- Size: 256x256 pixels (recommended)
- Style: Match your existing inventory icons
- Background: Transparent

## Customization

### Adding Custom Wallet Types

1. Add to `qb-core/shared/items.lua`:
```lua
['wallet_gold'] = {
    ['name'] = 'wallet_gold',
    ['label'] = 'Gold Wallet',
    ['weight'] = 200,
    ['type'] = 'item',
    ['image'] = 'wallet_gold.png',
    ['unique'] = true,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'A luxurious gold wallet'
},
```

2. Add to `config/config.lua`:
```lua
Config.Wallets['wallet_gold'] = {
    label = 'Gold Wallet',
    weight = 200,
    slots = 12,
    maxWeight = 12000,
    price = 500,
    description = 'A luxurious gold wallet'
}
```

### Adding Custom Backpack Types

1. Add to `qb-core/shared/items.lua`:
```lua
['backpack_tactical'] = {
    ['name'] = 'backpack_tactical',
    ['label'] = 'Tactical Backpack',
    ['weight'] = 1200,
    ['type'] = 'item',
    ['image'] = 'backpack_tactical.png',
    ['unique'] = true,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'A military-grade tactical backpack'
},
```

2. Add to `config/config.lua`:
```lua
Config.Backpacks['backpack_tactical'] = {
    label = 'Tactical Backpack',
    weight = 1200,
    slots = 40,
    maxWeight = 80000,
    price = 2000,
    description = 'A military-grade tactical backpack'
}
```

### Adding Custom Furniture Types

1. Add to `qb-core/shared/items.lua`:
```lua
['storage_locker'] = {
    ['name'] = 'storage_locker',
    ['label'] = 'Storage Locker',
    ['weight'] = 15000,
    ['type'] = 'item',
    ['image'] = 'storage_locker.png',
    ['unique'] = false,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'A large metal storage locker'
},
```

2. Add to `config/config.lua`:
```lua
Config.Furniture['storage_locker'] = {
    label = 'Storage Locker',
    weight = 15000,
    slots = 50,
    maxWeight = 200000,
    price = 3000,
    model = 'prop_locker_01', -- Find valid prop models
    description = 'A large metal storage locker',
    breakable = true
}
```

## Finding Prop Models

To find valid prop models for furniture:

1. Use a prop spawner resource
2. Search GTA V prop lists online
3. Common storage props:
   - prop_boxpile_07d (wooden crates)
   - p_v_43_safe_s (safe)
   - prop_ld_int_safe_01 (cabinet)
   - prop_locker_01 (locker)
   - prop_box_wood02a_pu (wooden box)
   - prop_tool_box_01 (toolbox)

## Testing Items

After adding items, test them:

1. **Give yourself the item:**
   ```
   /giveitem [your_id] wallet 1
   ```

2. **Check inventory:**
   - Open inventory (default: TAB)
   - Verify item appears
   - Check item image displays

3. **Use the item:**
   - Click on the item
   - Verify it opens correctly
   - Test functionality

4. **Verify persistence:**
   - Disconnect and reconnect
   - Check if items persist
   - Test container contents persist

## Troubleshooting

### Item not appearing in inventory
- Verify item is in qb-core/shared/items.lua
- Restart qb-core: `/restart qb-core`
- Clear cache and reconnect

### Item image not showing
- Check image file exists in qb-inventory/html/images/
- Verify image filename matches item image property
- Clear browser cache (F5 in inventory)

### Item not useable
- Verify 'useable' = true in item definition
- Check resource registered the useable item
- Review server console for errors

### Container not opening
- Enable debug mode: Config.Debug = true
- Check server console for errors
- Verify database tables exist
- Test with fresh item (remove and re-give)

---

**Note:** Always backup your `qb-core/shared/items.lua` file before making changes!