# QB-ContainerInventory Enhanced

A comprehensive container inventory system for QBCore Framework that allows players to carry wallets, backpacks, and deploy furniture with persistent storage.

## 🎯 Enhanced Features

### ✨ What's New in Enhanced Edition

#### 1. **Fixed Container Reopening Issue**
- Players can now freely close and reopen wallets and backpacks
- No more "already have inventory open" errors
- Seamless integration with QB-Inventory's native controls

#### 2. **Persistent Container Storage**
- Containers now use player's CIV ID (citizenid) for identification
- Items persist reliably across server restarts
- Each player has unique containers tied to their character
- Automatic container loading on first use

#### 3. **Smart Container Management**
- Containers are automatically created on first use
- Existing containers are loaded from database
- Ownership tracking for traded items
- Prevents container duplication

## 📋 Features

### Wallets
- Multiple wallet tiers (Basic, Premium)
- Configurable slots and weight limits
- Perfect for carrying cash, cards, and small items
- Persistent storage tied to player's CIV ID

### Backpacks
- Three size variants (Small, Medium, Large)
- Increased carrying capacity
- Tradeable between players with ownership transfer
- Items persist across server restarts

### Furniture
- Deployable storage containers
- Place in your house or property
- Large storage capacity
- Break-in system for added gameplay

### Store System
- Purchase containers from NPC vendors
- Multiple store locations
- Configurable prices and inventory
- QB-Target integration support

## 🔧 Installation

### Prerequisites
- QBCore Framework (latest version)
- QB-Inventory (latest version)
- MySQL/MariaDB database
- oxmysql resource

### Step-by-Step Installation

1. **Backup Your Data**
   ```bash
   # Backup existing qb-containerinventory if you have it
   cp -r resources/qb-containerinventory resources/qb-containerinventory-backup
   ```

2. **Install the Resource**
   ```bash
   # Copy the enhanced version to your resources folder
   cp -r qb-containerinventory-enhanced resources/[qb]/qb-containerinventory
   ```

3. **Run Database Migration**
   ```sql
   -- Execute the SQL file in your database
   source resources/[qb]/qb-containerinventory/sql/migration.sql
   ```

4. **Add Items to QB-Core**
   Add these items to `qb-core/shared/items.lua`:
   ```lua
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
   ```

5. **Configure the Resource**
   Edit `config/config.lua` to customize:
   - Store locations
   - Item prices
   - Slot counts and weight limits
   - Notification system

6. **Start the Resource**
   Add to your `server.cfg`:
   ```
   ensure qb-containerinventory
   ```

## 📖 Usage

### For Players

#### Using Wallets
1. Purchase a wallet from a container store
2. Use the wallet from your inventory
3. Add items to the wallet (cash, cards, small items)
4. Close the wallet when done
5. Reopen anytime - your items will be there!

#### Using Backpacks
1. Purchase a backpack from a container store
2. Use the backpack from your inventory
3. Store items in the backpack
4. Close and reopen as needed
5. Trade backpacks with other players

#### Trading Backpacks
1. Stand near another player (within 3 meters)
2. Use the trade command or menu option
3. Your backpack and its contents transfer to them
4. They become the new owner

### For Server Administrators

#### Configuration
Edit `config/config.lua`:

```lua
-- Enable debug logging
Config.Debug = true

-- Wallet configuration
Config.Wallets = {
    ['wallet'] = {
        label = 'Leather Wallet',
        slots = 5,
        maxWeight = 5000,
        price = 500
    }
}

-- Backpack configuration
Config.Backpacks = {
    ['backpack_small'] = {
        label = 'Small Backpack',
        slots = 10,
        maxWeight = 20000,
        price = 2000
    }
}
```

#### Adding Store Locations
```lua
Config.Stores = {
    {
        name = 'General Store',
        coords = vector3(43.31, -1774.84, 29.62),
        blip = {
            enabled = true,
            sprite = 52,
            color = 2
        },
        items = {
            wallets = true,
            backpacks = true,
            furniture = true
        }
    }
}
```

## 🔍 Technical Details

### Container Identification System

**Old System (v1.0):**
- Random IDs: `container_123456_1234567890`
- No player association
- Lost on server restart

**New System (v2.0):**
- Format: `{citizenid}_{item_name}`
- Example: `ABC12345_wallet`
- Persistent across restarts
- Unique per player per item type

### Database Structure
```sql
container_inventories
├── id (Primary Key)
├── citizenid (Player's CIV ID)
├── item_name (Item type)
├── container_type (wallet/backpack/furniture)
├── data (JSON inventory data)
├── created_at
└── updated_at

UNIQUE KEY: (citizenid, item_name)
```

### How It Works

1. **First Use**: Player uses wallet/backpack
2. **Check Database**: System checks if container exists for this player + item
3. **Load or Create**: 
   - If exists: Load items from database
   - If new: Create empty container
4. **Store Data**: All changes saved to database
5. **Persistence**: Items remain after server restart

## 🐛 Troubleshooting

### Common Issues

**Issue**: Can't reopen container
- **Solution**: This is fixed in the enhanced version. Update to v2.0.

**Issue**: Items disappear after restart
- **Solution**: Verify database migration ran successfully. Check `container_inventories` table exists.

**Issue**: "Failed to open wallet/backpack"
- **Solution**: 
  1. Check player has valid citizenid
  2. Verify database connection
  3. Enable debug mode to see detailed errors

**Issue**: Backpack trading doesn't work
- **Solution**: Ensure both players are within 3 meters and target doesn't have a backpack.

### Debug Mode
Enable detailed logging:
```lua
Config.Debug = true
```

Check server console for:
- Container creation logs
- Database operations
- Player actions
- Error messages

## 📊 Performance

- **Optimized Queries**: Uses indexed database lookups
- **Lazy Loading**: Containers loaded only when needed
- **Efficient Storage**: JSON format for inventory data
- **Minimal Overhead**: No performance impact on server

## 🔐 Security

- **SQL Injection Prevention**: All queries use prepared statements
- **Ownership Validation**: Players can only access their own containers
- **Unique Constraints**: Prevents container duplication
- **Audit Trail**: Timestamps track all changes

## 🤝 Compatibility

- ✅ QBCore Framework
- ✅ QB-Inventory
- ✅ QB-Target (optional)
- ✅ QB-Menu
- ✅ ox_lib notifications (optional)
- ✅ MySQL/MariaDB with oxmysql

## 📝 License

This enhanced version maintains the original license terms.

## 👥 Credits

- **Enhanced by**: NinjaTech AI Team
- **Original Module**: QB-ContainerInventory
- **Framework**: QBCore Framework

## 📞 Support

For detailed implementation instructions, see [IMPLEMENTATION_GUIDE.md](IMPLEMENTATION_GUIDE.md)

For changelog and version history, see [CHANGELOG.md](CHANGELOG.md)

---

**Version**: 2.0.0 Enhanced Edition  
**Last Updated**: 2025-10-13  
**Status**: Production Ready ✅