# Installation Guide - QBCore Container Inventory System

This guide will walk you through the complete installation process step-by-step.

## Prerequisites

Before installing, ensure you have:
- ✅ QBCore Framework installed and running
- ✅ qb-inventory installed
- ✅ qb-menu installed
- ✅ qb-skillcheck installed (for break-in minigame)
- ✅ oxmysql installed and configured
- ✅ A housing system (qb-houses, ps-housing, etc.)
- ✅ Database access (MySQL/MariaDB)

## Step 1: Database Setup

### Option A: Using MySQL Command Line

1. Open your MySQL command line or phpMyAdmin
2. Select your FiveM database
3. Execute the SQL file:

```bash
mysql -u your_username -p your_database < sql/install.sql
```

### Option B: Manual Execution

Copy and paste the following SQL into your database:

```sql
-- Container Inventories Table
CREATE TABLE IF NOT EXISTS `container_inventories` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `container_id` VARCHAR(100) NOT NULL,
    `container_type` VARCHAR(50) NOT NULL,
    `owner` VARCHAR(50) NOT NULL,
    `data` LONGTEXT DEFAULT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `container_id` (`container_id`),
    KEY `owner` (`owner`),
    KEY `container_type` (`container_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Deployed Furniture Table
CREATE TABLE IF NOT EXISTS `deployed_furniture` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `furniture_id` VARCHAR(100) NOT NULL,
    `furniture_type` VARCHAR(50) NOT NULL,
    `owner` VARCHAR(50) NOT NULL,
    `coords` TEXT NOT NULL,
    `house_id` VARCHAR(50) DEFAULT NULL,
    `data` LONGTEXT DEFAULT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `furniture_id` (`furniture_id`),
    KEY `owner` (`owner`),
    KEY `house_id` (`house_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Add indexes for better performance
CREATE INDEX idx_container_owner ON container_inventories(owner);
CREATE INDEX idx_furniture_owner ON deployed_furniture(owner);
CREATE INDEX idx_furniture_house ON deployed_furniture(house_id);
```

### Verify Database Setup

Run this query to verify tables were created:

```sql
SHOW TABLES LIKE 'container%';
SHOW TABLES LIKE 'deployed%';
```

You should see:
- container_inventories
- deployed_furniture

## Step 2: Resource Installation

1. Extract the `qb-containerinventory` folder
2. Place it in your server's `resources/[qb]` directory
3. Your folder structure should look like:

```
resources/
└── [qb]/
    └── qb-containerinventory/
        ├── client/
        │   ├── main.lua
        │   └── furniture.lua
        ├── server/
        │   ├── main.lua
        │   └── furniture.lua
        ├── config/
        │   └── config.lua
        ├── sql/
        │   └── install.sql
        ├── fxmanifest.lua
        ├── README.md
        └── INSTALLATION.md
```

## Step 3: Server Configuration

Add the resource to your `server.cfg`:

```cfg
# QBCore Container Inventory System
ensure qb-containerinventory
```

**Important:** Make sure it's loaded AFTER these resources:
```cfg
ensure qb-core
ensure qb-inventory
ensure qb-menu
ensure oxmysql
ensure qb-containerinventory  # Add this line
```

## Step 4: Item Configuration

### Add Items to QBCore

Open `qb-core/shared/items.lua` and add the following items:

```lua
-- ============================================
-- CONTAINER INVENTORY ITEMS
-- ============================================

-- Wallets
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

-- Backpacks
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

-- Furniture
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

-- Lockpicks (add these if not already present)
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
```

## Step 5: Image Assets

You need to add item images to your inventory. Place the following images in `qb-inventory/html/images/`:

**Required Images:**
- wallet.png
- wallet_premium.png
- backpack_small.png
- backpack_medium.png
- backpack_large.png
- storage_crate.png
- storage_safe.png
- storage_cabinet.png
- lockpick.png (if not present)
- advancedlockpick.png (if not present)

**Note:** You can create placeholder images or use existing ones from your inventory system. Recommended size: 256x256 pixels.

## Step 6: Configuration

Edit `qb-containerinventory/config/config.lua` to customize:

### Basic Configuration

```lua
Config.Debug = false -- Set to true for debugging
Config.UseTarget = false -- Set to true if using qb-target
```

### Store Locations

Update store coordinates to match your server:

```lua
Config.Stores = {
    {
        name = 'General Store',
        coords = vector3(25.74, -1347.32, 29.5), -- Change these coordinates
        -- ... rest of config
    }
}
```

### Housing Integration

If your housing system uses different table names, update `server/furniture.lua`:

```lua
-- Line ~45 - Update table name if needed
local result = MySQL.query.await('SELECT * FROM player_houses WHERE citizenid = ? AND house = ?', {citizenid, houseId})

-- Line ~52 - Update table name if needed
local result = MySQL.query.await('SELECT * FROM houselocations WHERE name = ?', {houseId})
```

## Step 7: Testing

### Test Checklist

1. **Start Server**
   ```bash
   # Start your server and check console for errors
   # Look for: "[QBContainerInventory] Server main script loaded successfully"
   ```

2. **Test Database**
   ```sql
   -- Verify tables exist
   SELECT * FROM container_inventories LIMIT 1;
   SELECT * FROM deployed_furniture LIMIT 1;
   ```

3. **Test Items**
   - Give yourself a wallet: `/giveitem [your_id] wallet 1`
   - Use the wallet from inventory
   - Verify inventory opens

4. **Test Store**
   - Go to store location
   - Interact with store NPC
   - Purchase an item

5. **Test Furniture**
   - Give yourself furniture: `/giveitem [your_id] storage_crate 1`
   - Go to your house
   - Use the furniture item
   - Place it and verify it spawns

6. **Test Break-in**
   - Give yourself a lockpick: `/giveitem [your_id] lockpick 1`
   - Try to break into furniture you don't own
   - Complete the minigame

## Step 8: Restart Server

After completing all steps:

1. Stop your server
2. Clear cache (if applicable)
3. Start your server
4. Monitor console for any errors
5. Test all features in-game

## Common Issues and Solutions

### Issue: Items not showing in inventory
**Solution:** 
- Verify items are added to `qb-core/shared/items.lua`
- Restart qb-core resource: `/restart qb-core`
- Clear inventory cache

### Issue: Furniture not spawning
**Solution:**
- Check SQL tables were created
- Verify house locations exist in database
- Enable debug mode: `Config.Debug = true`

### Issue: Break-in minigame not working
**Solution:**
- Ensure qb-skillcheck is installed
- Verify Config.BreakIn.minigameType matches your minigame resource
- Check lockpick items exist

### Issue: Database connection errors
**Solution:**
- Verify oxmysql is running
- Check database credentials in server.cfg
- Test database connection manually

### Issue: Store NPC not spawning
**Solution:**
- Check store coordinates in config
- Verify ped model exists
- Try different ped model

## Advanced Configuration

### Adding Custom Wallets

```lua
Config.Wallets['wallet_custom'] = {
    label = 'Custom Wallet',
    weight = 200,
    slots = 10,
    maxWeight = 10000,
    price = 300,
    description = 'A custom wallet'
}
```

### Adding Custom Furniture

```lua
Config.Furniture['storage_custom'] = {
    label = 'Custom Storage',
    weight = 5000,
    slots = 30,
    maxWeight = 120000,
    price = 800,
    model = 'prop_box_wood02a_pu', -- Change to any valid prop
    description = 'Custom storage container',
    breakable = true
}
```

### Changing Break-in Difficulty

```lua
Config.BreakIn.requiredItems = {
    ['lockpick'] = {
        difficulty = 'easy',
        successChance = 70, -- Increase for easier
        damageOnFail = 10
    }
}
```

## Support

If you encounter issues:

1. Enable debug mode: `Config.Debug = true`
2. Check server console for errors
3. Verify all prerequisites are installed
4. Review this installation guide
5. Check the README.md for additional information

## Post-Installation

After successful installation:

1. ✅ Test all features thoroughly
2. ✅ Configure prices and capacities to your liking
3. ✅ Add custom store locations
4. ✅ Customize break-in difficulty
5. ✅ Set up admin commands if needed
6. ✅ Train staff on new features
7. ✅ Announce new features to players

## Maintenance

Regular maintenance tasks:

- **Weekly:** Check database for orphaned containers
- **Monthly:** Review and optimize furniture placement limits
- **As Needed:** Update prices based on server economy
- **As Needed:** Adjust break-in difficulty based on feedback

## Backup

Before making changes:

```sql
-- Backup container data
CREATE TABLE container_inventories_backup AS SELECT * FROM container_inventories;
CREATE TABLE deployed_furniture_backup AS SELECT * FROM deployed_furniture;
```

## Uninstallation

If you need to remove the resource:

1. Stop the server
2. Remove from server.cfg
3. Delete the resource folder
4. (Optional) Remove database tables:
   ```sql
   DROP TABLE IF EXISTS container_inventories;
   DROP TABLE IF EXISTS deployed_furniture;
   ```
5. Remove items from qb-core/shared/items.lua
6. Remove item images from qb-inventory

---

**Installation Complete!** Your QBCore Container Inventory System is now ready to use.