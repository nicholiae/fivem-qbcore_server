# Dynamic Locations - Quick Reference Card

## 🎮 Admin Commands

| Command | Description | Example |
|---------|-------------|---------|
| `/setupbiology` | Start location creation helper | `/setupbiology` |
| `/deletebiology <type> <id>` | Delete a location | `/deletebiology toiletChair 5` |
| `/listbiology [type]` | List locations | `/listbiology toiletChair` |
| `/reloadbiology` | Reload all locations | `/reloadbiology` |

## 🔑 Setup Helper Controls

| Key | Action |
|-----|--------|
| **H** | Capture current location |
| **1** | Select Toilet |
| **2** | Select Urinal |
| **3** | Select Shower |
| **4** | Select Tub |
| **5** | Select Sink |
| **6** | Select Public |
| **E** | Exit helper |
| **ESC** | Cancel capture |

## 📁 Location Types

- `toiletChair` - Toilet seats
- `urinalStand` - Standing urinals
- `showerStall` - Shower stalls
- `bathTub` - Bathtubs
- `handSink` - Hand washing sinks
- `public` - Public bathroom stations

## 🚀 Quick Start

1. Stand at desired location
2. Face the correct direction
3. Type `/setupbiology`
4. Press **H** to capture
5. Press **1-6** to select type
6. Done! Location saved and synced

## 📂 File Locations

```
NS-PlayerBiology/locations/
├── toiletChair.json
├── urinalStand.json
├── showerStall.json
├── bathTub.json
├── handSink.json
└── public.json
```

## ⚠️ Important Notes

- ✅ Locations sync instantly to all players
- ✅ No server restart needed
- ✅ Automatically saved to JSON files
- ✅ Works with existing config.lua locations
- ⚠️ Requires admin permissions
- ⚠️ Backup JSON files regularly

## 🔧 Troubleshooting

| Problem | Solution |
|---------|----------|
| Locations not syncing | Run `/reloadbiology` |
| Wrong position | Delete and recreate |
| Can't create | Check admin permissions |
| Lost after restart | Check JSON files exist |

## 💾 Backup Command

```bash
# Backup locations directory
cp -r NS-PlayerBiology/locations/ NS-PlayerBiology/locations_backup_$(date +%Y%m%d)/
```

---

**Need more help?** See `DYNAMIC_LOCATIONS_GUIDE.md` for detailed documentation.