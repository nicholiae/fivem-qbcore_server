# NS-Crafting Enhanced Edition

## 🚀 Overview

This is the **Enhanced Edition** of NS-Crafting, featuring a modern GUI with advanced filtering, reactive quantity calculations, visual inventory comparison, and bonus zone integration.

## ✨ Key Features

### Core Features
- ✅ Modern, responsive crafting interface
- ✅ Real-time inventory checking
- ✅ XP-based recipe unlocking
- ✅ Multiple crafting bench types
- ✅ Job and gang-specific benches
- ✅ Skill check integration

### Enhanced Features (NEW!)
- 🆕 **Available Filter Toggle** - Show only craftable recipes
- 🆕 **Visual Inventory Comparison** - See exactly what you have vs. need
- 🆕 **Bench-Based Access Control** - Restrict benches by job/gang
- 🆕 **Reactive Quantity System** - Real-time updates as you change quantity
- 🆕 **Smart Max Button** - Automatically calculate maximum craftable
- 🆕 **Bonus Zone Integration** - 2x yields and faster crafting in special zones
- 🆕 **Enhanced UI/UX** - Animations, color coding, and visual feedback

## 📦 Installation

1. **Extract the resource:**
   ```
   Extract NS-Crafting-Enhanced to your resources folder
   ```

2. **Add to server.cfg:**
   ```
   ensure NS-Crafting-Enhanced
   ```

3. **Configure bonus zones:**
   Edit `config.lua` and set your bonus zone coordinates:
   ```lua
   Config.BonusZones = {
       ['DrugLab1'] = {
           Center = vector3(x, y, z),
           Length = 10.0,
           Width = 10.0
       }
   }
   ```

4. **Restart your server:**
   ```
   restart NS-Crafting-Enhanced
   ```

## 🎮 Usage

### Opening Crafting Menu
Use the same events as before:
```lua
TriggerEvent('NS-Crafting:client:craftingTableCall')
TriggerEvent('NS-Crafting:client:craftingRegTableCall')
TriggerEvent('NS-Crafting:client:craftingGangTableCall')
-- etc.
```

### Using the Interface

1. **Filtering:**
   - Click "All Recipes" to show everything
   - Click "☐ Available Only" to show only craftable recipes
   - Click any bench type to filter by that bench
   - Use search bar to find specific recipes

2. **Crafting:**
   - Select a recipe
   - Adjust quantity using +/- buttons or type directly
   - Click "Max" to set to maximum craftable
   - Watch ingredients update in real-time
   - Click "Craft" when ready

3. **Bonus Zones:**
   - Enter a bonus zone (alien effects will start)
   - Open crafting menu
   - See "⚡ BONUS ZONE ACTIVE" indicator
   - Craft items to receive bonus yields

## 🔧 Configuration

### Universal Benches
Edit `client/crafting.lua` to add benches accessible to everyone:
```lua
local universalBenches = {
    'unemployed_bench',
    'joint_bench',
    'blunt_bench',
}
```

### Bonus Settings
Edit `config.lua`:
```lua
Config.YieldBonus = true      -- Enable yield bonuses
Config.BonusYield = 2         -- 2x multiplier
Config.TimeBonus = true       -- Enable time bonuses
Config.BonusTime = 0.5        -- 50% faster
Config.BlacklistItems = {     -- Items excluded from yield bonus
    'weapon_pistol',
    'weapon_smg',
}
```

### Access Control
Benches are automatically restricted based on their name:
- `unemployed_bench` - Everyone
- `lux_bench` - Job: lux
- `ballas_bench` - Gang: ballas
- `gang_bench` - Any gang member

## 📚 Documentation

- **ENHANCEMENTS_GUIDE.md** - Complete feature guide
- **BONUS_ZONES_INTEGRATION.md** - Bonus zone technical details
- **INSTALLATION_GUIDE.md** - Detailed installation steps
- **CHANGELOG.md** - Version history

## 🎯 Features Breakdown

### 1. Available Filter Toggle
- Independent toggle button
- Works with all other filters
- Shows only recipes you can craft
- Visual checkbox indicator

### 2. Visual Inventory Comparison
- Color-coded ingredients (green/red)
- Shows available/required counts
- Displays missing amounts
- Status icons (✓/⚠️)

### 3. Bench-Based Access Control
- Job-specific benches
- Gang-specific benches
- Universal benches
- Access denied messages

### 4. Reactive Quantity System
- Real-time ingredient updates
- Smart max calculation
- Preset buttons (1, 5, 10, Max)
- Dynamic status messages

### 5. Bonus Zone Integration
- Yield bonuses (2x items)
- Time bonuses (50% faster)
- Visual effects
- Weapon/blacklist exclusions

## 🔍 Example Scenarios

### Scenario 1: Crafting Multiple Items
```
1. Open crafting menu
2. Find "Lockpick" recipe
3. Change quantity to 30
4. See ingredients update: 60 metal, 30 plastic
5. Status shows: "⚠️ You can only craft 25 items"
6. Click "Max" button
7. Quantity sets to 25
8. Click "Craft"
```

### Scenario 2: Using Filters
```
1. Click "☐ Available Only"
2. Only craftable recipes shown
3. Click "Lux" bench filter
4. Only Lux recipes you can craft shown
5. Type "watch" in search
6. Find specific watch recipe
```

### Scenario 3: Bonus Zone
```
1. Enter drug lab (bonus zone)
2. Alien effects start
3. Open crafting menu
4. See "⚡ BONUS ZONE ACTIVE"
5. Craft cocaine
6. Receive 20 instead of 10
```

## 🐛 Troubleshooting

### Bonus zones not working
- Check PolyZone is installed
- Verify coordinates in config
- Enable debug: `Config.debug = true`

### Access control issues
- Verify job/gang names match bench names
- Check player data is loading correctly

### UI not updating
- Check browser console (F12)
- Verify all files are present
- Clear cache and restart

## 📊 Performance

- Optimized zone detection (500ms intervals)
- Efficient DOM updates
- Client-side filtering (no server calls)
- Minimal resource usage

## 🎨 Customization

### Changing Colors
Edit `html/css/style.css`:
```css
.filter-toggle.active {
    background: #4CAF50;  /* Change this */
}
```

### Adding Bench Icons
Edit `html/js/crafting.js`:
```javascript
const benchIcons = {
    unemployed: '📝',
    your_bench: '🎯',  // Add here
}
```

## 📝 Credits

- Original NS-Crafting system
- Enhanced by NinjaTech AI
- Bonus zones integration
- Modern UI/UX improvements

## 📄 License

See LICENSE file for details.

## 🆘 Support

For issues or questions:
1. Check ENHANCEMENTS_GUIDE.md
2. Review troubleshooting section
3. Enable debug mode
4. Check console for errors

---

**Version:** 2.0 Enhanced Edition  
**Last Updated:** 2024  
**Status:** Production Ready ✅