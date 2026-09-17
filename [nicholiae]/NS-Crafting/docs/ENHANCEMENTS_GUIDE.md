# NS-Crafting Enhanced - Complete Feature Guide

## 🎯 Overview
This enhanced version of NS-Crafting includes all original features plus three major enhancements:
1. **Available Filter Toggle** - Filter recipes by craftability
2. **Visual Inventory Comparison** - See exactly what you have vs. what you need
3. **Bench-Based Access Control** - Restrict crafting benches by job/gang
4. **Reactive Quantity System** - Real-time updates as you change craft quantity
5. **Bonus Zone Integration** - Yield and time bonuses in special zones

---

## 🆕 New Features

### 1. Available Filter Toggle

**Location:** Filter section at the top of the crafting menu

**How it works:**
- Click the "☐ Available Only" button to toggle the filter
- When active (☑), only shows recipes you can currently craft
- Works independently from bench filters
- Can combine with bench filters (e.g., "Lux + Available Only")

**Visual Feedback:**
- Unchecked (☐) = Shows all recipes
- Checked (☑) = Shows only craftable recipes
- Green highlight when active

---

### 2. Visual Inventory Comparison

**Location:** Inside each recipe card

**Features:**
- **Real-time comparison** of your inventory vs. requirements
- **Color-coded indicators:**
  - 🟢 Green border = You have enough
  - 🔴 Red border = You don't have enough
- **Exact counts:** Shows "50/60" (you have 50, need 60)
- **Missing amounts:** Displays "Missing: 10" for insufficient items
- **Status icons:** ✓ for sufficient, ⚠️ for insufficient

**Example Display:**
```
Ingredient Item:
  🟢 Plastic: 100/30 ✓
  🔴 Rubber: 50/60 ⚠️ Missing: 10
  🟢 Glass: 200/150 ✓
```

---

### 3. Bench-Based Access Control

**How it works:**
- Each crafting bench is restricted by job or gang
- Universal benches (unemployed, joint, blunt) are accessible to everyone
- Job-specific benches require matching job (e.g., "lux_bench" requires job "lux")
- Gang-specific benches require matching gang (e.g., "ballas_bench" requires gang "ballas")
- Special bench "gang_bench" is accessible to any gang member

**Access Denied:**
- If you try to open a bench you don't have access to
- You'll see: "You do not have access to this crafting bench"
- The menu won't open

**Configuration:**
Universal benches are defined in the Lua client:
```lua
local universalBenches = {
    'unemployed_bench',
    'joint_bench',
    'blunt_bench',
}
```

To add more universal benches, add them to this list.

---

### 4. Reactive Quantity System

**Location:** Quantity section in each recipe card

**Features:**

#### Quantity Controls:
- **- Button:** Decrease quantity by 1
- **+ Button:** Increase quantity by 1
- **Number Input:** Type any quantity (1-999)
- **Preset Buttons:**
  - **1** - Set to 1
  - **5** - Set to 5
  - **10** - Set to 10
  - **Max** - Calculate and set maximum craftable

#### Real-Time Updates:
When you change the quantity, the card instantly updates:
- ✅ Ingredient requirements multiply (e.g., 1→30 means 2→60 rubber)
- ✅ Available vs. required comparison updates
- ✅ Missing amounts recalculate
- ✅ Craft status updates
- ✅ Output amount updates
- ✅ Craft button enables/disables

#### Smart Max Button:
- Calculates the maximum you can craft based on your inventory
- Considers ALL ingredients
- Sets quantity to the limiting ingredient
- Example: If you have 100 plastic, 50 rubber, 200 glass
  - Recipe needs: 1 plastic, 2 rubber, 5 glass
  - Max = 25 (limited by rubber: 50/2 = 25)

#### Craft Status Messages:
- 🟢 **"✓ You can craft 30 item(s)"** - All resources available
- 🟠 **"⚠️ You can only craft 25 item(s). Missing resources for 30."** - Partial resources
- 🔴 **"✗ Cannot craft. Missing: Rubber, Glass"** - Insufficient resources

---

### 5. Bonus Zone Integration

**Features:**
- **Yield Bonus:** 2x items when crafting in bonus zones (configurable)
- **Time Bonus:** 50% faster crafting in zones (configurable)
- **Visual Effects:** Alien screen effects while in zones
- **Smart Restrictions:** Weapons and blacklisted items excluded from yield bonuses
- **UI Indicator:** "⚡ BONUS ZONE ACTIVE" shown in header

**Configuration:**
```lua
Config.BonusZones = {
    ['DrugLab1'] = {
        Center = vector3(x, y, z),
        Length = 10.0,
        Width = 10.0
    }
}

Config.YieldBonus = true
Config.BonusYield = 2
Config.TimeBonus = true
Config.BonusTime = 0.5
Config.BlacklistItems = { 'weapon_pistol', 'weapon_smg' }
```

---

## 🎨 UI/UX Improvements

### Enhanced Recipe Cards:
- **Top Border:** Green for craftable, Red for not craftable
- **Bonus Badge:** Gold "BONUS" badge when in bonus zone
- **Quantity Section:** Prominent controls with presets
- **Ingredients:** Color-coded with icons and counts
- **Status Bar:** Clear message about craftability
- **Output Display:** Shows total items you'll receive
- **Craft Button:** Green when enabled, Red when disabled

### Filter System:
- **All Recipes Button:** Shows everything
- **Available Toggle:** Independent filter for craftable items
- **Bench Filters:** Click any bench type to filter
- **Search Bar:** Type to search by recipe name
- **Multiple Filters:** Combine bench + available + search

### Animations:
- **Pulse:** Bonus zone indicator
- **Update:** Ingredients when quantity changes
- **Shake:** Insufficient resources warning
- **Blink:** Missing amount indicators
- **Hover:** All interactive elements

---

## 📋 Usage Examples

### Example 1: Crafting with Quantity
1. Open crafting menu at any bench
2. Find the recipe you want
3. Click the quantity input or use +/- buttons
4. Enter "30" to craft 30 items
5. Watch ingredients update in real-time
6. See status: "⚠️ You can only craft 25 item(s)"
7. Click "Max" button to set to 25
8. Status changes to: "✓ You can craft 25 item(s)"
9. Click "Craft" button

### Example 2: Using Filters
1. Open crafting menu
2. Click "☐ Available Only" to show only craftable recipes
3. Click a bench filter (e.g., "Lux") to show only Lux recipes
4. Now seeing: Lux recipes that you can craft
5. Type "watch" in search to find watch recipes
6. Click "All Recipes" to reset bench filter
7. Click "☑ Available Only" again to show all recipes

### Example 3: Bonus Zone Crafting
1. Enter a bonus zone (alien effects start)
2. Open crafting menu
3. See "⚡ BONUS ZONE ACTIVE" in header
4. Find a drug recipe (e.g., cocaine)
5. Notice "BONUS" badge on recipe card
6. Recipe shows: "Will Craft: 20" instead of 10
7. Craft the item
8. Receive 20 items instead of 10

### Example 4: Access Control
1. Player with job "police" tries to open "lux_bench"
2. System checks: job "police" ≠ bench "lux"
3. Access denied message appears
4. Menu doesn't open
5. Player goes to "police_bench"
6. System checks: job "police" = bench "police"
7. Access granted, menu opens

---

## 🔧 Configuration

### Adding Universal Benches
Edit `client/crafting.lua`:
```lua
local universalBenches = {
    'unemployed_bench',
    'joint_bench',
    'blunt_bench',
    'your_new_bench',  -- Add here
}
```

### Customizing Bench Display Names
Edit `client/crafting.lua`:
```lua
local displayNames = {
    unemployed_bench = "Universal Crafting",
    your_bench = "Your Custom Name",  -- Add here
}
```

### Adjusting Bonus Multipliers
Edit `config.lua`:
```lua
Config.BonusYield = 3  -- 3x items instead of 2x
Config.BonusTime = 0.3  -- 70% faster instead of 50%
```

### Adding Blacklisted Items
Edit `config.lua`:
```lua
Config.BlacklistItems = {
    'weapon_pistol',
    'weapon_smg',
    'your_item',  -- Add here
}
```

---

## 🐛 Troubleshooting

### Issue: Quantity not updating
**Solution:** Check browser console (F12) for JavaScript errors

### Issue: Access control not working
**Solution:** Verify player job/gang matches bench name exactly

### Issue: Bonus zones not detecting
**Solution:** 
1. Check PolyZone is installed
2. Verify coordinates in config
3. Enable debug mode: `Config.debug = true`

### Issue: Ingredients not showing correctly
**Solution:** Verify `Config.ImageBasePath` is set correctly

### Issue: Max button not working
**Solution:** Ensure all ingredients have valid `available` amounts

---

## 📊 Performance Notes

- **Quantity Updates:** Instant, no server calls
- **Filter Changes:** Client-side only, very fast
- **Access Control:** Single check on menu open
- **Bonus Zones:** Checked every 500ms (optimized)
- **Recipe Rendering:** Efficient DOM updates

---

## 🎓 Developer Notes

### JavaScript Functions:
- `toggleAvailableFilter()` - Toggle available-only filter
- `toggleBenchFilter(benchType)` - Toggle bench filter
- `updateRecipeQuantity(recipeId, quantity)` - Update recipe with new quantity
- `calculateMaxCraftable(recipeId)` - Calculate max possible crafts
- `setMaxQuantity(recipeId)` - Set quantity to max

### Lua Functions:
- `hasAccessToBench(benchType)` - Check if player can access bench
- `getBenchDisplayName(benchType)` - Get friendly bench name
- `isInBonusZone()` - Check if player is in any bonus zone
- `generateRecipeData(inventory, benchType)` - Generate recipes for specific bench

### CSS Classes:
- `.filter-toggle.active` - Active available filter
- `.proficiency-item.filter-active` - Active bench filter
- `.ingredient-item[data-sufficient="false"]` - Insufficient ingredient
- `.craft-status.can-craft` - Can craft status
- `.bonus-badge` - Bonus zone indicator

---

## 📝 Changelog

### Version 2.0 - Enhanced Edition
- ✅ Added available filter toggle
- ✅ Added visual inventory comparison
- ✅ Added bench-based access control
- ✅ Added reactive quantity system
- ✅ Integrated bonus zone functionality
- ✅ Enhanced UI with animations
- ✅ Improved recipe cards
- ✅ Added smart max calculation
- ✅ Added real-time status updates

---

## 🎯 Future Enhancements

Potential additions for future versions:
- Per-zone bonus configuration
- Crafting queue system
- Favorite recipes
- Crafting history
- Recipe sharing
- Bulk crafting
- Crafting notifications
- Mobile-responsive design

---

## 📞 Support

For issues or questions:
1. Check this guide first
2. Review the troubleshooting section
3. Enable debug mode for detailed logs
4. Check browser console for errors
5. Verify all dependencies are installed

---

**Enjoy your enhanced crafting experience! 🎉**