# qb-policenpc — QB-Core Police NPC Control System

A fully custom FiveM resource for **QB-Core** that intercepts police NPCs spawned by GTA V's native wanted star system and modifies their behavior:

1. **Taser Only** — All police NPCs are forced to use a stun gun (non-lethal) instead of lethal firearms.
2. **Proximity Arrest** — When a police NPC gets close enough to the player (side-by-side), the player is automatically arrested, animated, jailed, and fined based on their wanted level.
3. **Surrender System** — Players can put their hands up near a police NPC to voluntarily surrender and be arrested.
4. **Admin Commands** — Force-arrest players, set wanted levels, and more via server commands.
5. **Fully Configurable** — All behavior is controlled through `config.lua` with detailed comments.

---

## Requirements

| Dependency | Notes |
|---|---|
| `qb-core` | Required framework |
| `qb-smallresources` | Must have wanted system enabled (see below) |
| `qb-jail` or `qb-prison` | For jail integration (configurable) |
| `oxmysql` | Only needed if using QB-Core database features |

---

## Installation

### Step 1 — Enable the Native Wanted System

By default, QB-Core **disables** the GTA wanted system. You must enable it in `qb-smallresources/config.lua`:

```lua
Config.AIResponse = {
    wantedLevels = true,        -- CHANGE false → true
    dispatchServices = {
        [1] = true,             -- Police Vehicles
        [2] = false,            -- Police Helicopters (optional)
        [3] = false,            -- Fire Department
        [4] = false,            -- Swat Vehicles (optional - enable for star 5)
        [5] = false,            -- Ambulance
        [6] = true,             -- Police Motorcycles
        [7] = true,             -- Police Backup
        [8] = true,             -- Police Roadblocks
        [9] = true,             -- PoliceAutomobileWaitPulledOver
        [10] = true,            -- PoliceAutomobileWaitCruising
        [11] = false,           -- Gang Members
        [12] = false,           -- Swat Helicopters
        [13] = false,           -- Police Boats
        [14] = false,           -- Army Vehicles
        [15] = false            -- Biker Backup
    }
}
```

Also make sure the blacklisted ped models are NOT being deleted. In `qb-smallresources/config.lua`, check `Config.BlacklistedPeds` and either clear it or comment out the police models:

```lua
Config.BlacklistedPeds = {
    -- Comment these out so police peds are allowed to spawn:
    -- ['s_m_y_ranger_01']   = true,
    -- ['s_m_y_sheriff_01']  = true,
    -- ['s_m_y_cop_01']      = true,
    -- ['s_f_y_sheriff_01']  = true,
    -- ['s_f_y_cop_01']      = true,
    -- ['s_m_y_hwaycop_01']  = true,
}
```

### Step 2 — Install the Resource

1. Copy the `qb-policenpc` folder into your server's resource directory (e.g., `resources/[qb]/qb-policenpc`).
2. Add the following to your `server.cfg` or `resources.cfg`:

```cfg
ensure qb-core
ensure qb-smallresources
ensure qb-policenpc
```

> **Important:** Make sure `qb-policenpc` starts **after** `qb-core` and `qb-smallresources`.

### Step 3 — Configure Jail Integration

Open `config.lua` and set the jail event to match your jail script:

| Jail Script | Event Name |
|---|---|
| `qb-jail` | `qb-jail:server:SendToJail` |
| `qb-prison` | `qb-prison:server:SendToJail` |
| Custom | Set to your custom event name |

```lua
Config.JailEvent = 'qb-jail:server:SendToJail'
```

### Step 4 — Configure to Your Server

Review `config.lua` and adjust all settings to match your server's preferences. Every setting has a comment explaining what it does.

---

## File Structure

```
qb-policenpc/
├── fxmanifest.lua          -- Resource manifest
├── config.lua              -- All configuration options
├── client/
│   ├── main.lua            -- Taser override + weapon monitoring
│   └── arrest.lua          -- Proximity arrest + surrender system
└── server/
    └── main.lua            -- Arrest processing, jail, fines, admin commands
```

---

## How It Works

### Taser Override

The resource scans the ped pool every `Config.WeaponCheckInterval` milliseconds. When a police NPC is found:

1. All weapons are removed from the ped.
2. A stun gun (`WEAPON_STUNGUN`) is given with `Config.TaserAmmo` rounds.
3. The stun gun is set as the active weapon.
4. A per-ped coroutine is spawned that continuously monitors the ped's equipped weapon and re-applies the taser if GTA's AI tries to switch it back.

The `populationPedCreating` event hook catches police peds the moment they spawn, providing near-instant weapon override without waiting for the next pool scan.

### Proximity Arrest

Every `Config.ArrestCheckInterval` ms, the arrest system checks:

1. Does the player have a wanted level of at least `Config.ArrestWantedLevelMin`?
2. Is the player currently stunned/tased (if `Config.ArrestRequiresStunned = true`)?
3. Is any police NPC within `Config.ArrestDistance` units?

If all conditions are met, the arrest sequence fires:
- Player is frozen and an arrest animation plays.
- After `Config.ArrestAnimationDuration` ms, a server event fires.
- Server calculates jail time and fine from the wanted level.
- Jail script is triggered, wanted level is cleared.

### Surrender

When the player activates hands-up (X key, compatible with QB-Core's built-in HandsUp system):
- The system checks for a police NPC within `Config.SurrenderDistance` units.
- If one is found, the arrest sequence is triggered immediately (bypasses the stun requirement).

---

## Admin Commands

| Command | Permission | Description |
|---|---|---|
| `/npcforcearrest [id] [wantedlevel]` | admin/god | Force-arrest a player with a specified wanted level |
| `/npcwanted [id] [level]` | admin/god | Set a player's wanted level (0 to clear) |

---

## Server-Side Exports

Other scripts can hook into the arrest system:

```lua
-- Arrest a player (triggers animation + jail)
exports['qb-policenpc']:ArrestPlayer(src, wantedLevel)

-- Set a player's wanted level
exports['qb-policenpc']:SetWantedLevel(src, level)
```

### Custom Event Hook

Listen for arrests in your own scripts:

```lua
AddEventHandler('qb-policenpc:server:OnPlayerArrested', function(src, data)
    -- data.playerName
    -- data.citizenId
    -- data.wantedLevel
    -- data.jailTime
    -- data.fineAmount
    print(data.playerName .. ' was arrested at wanted level ' .. data.wantedLevel)
end)
```

---

## Configuration Reference

| Key | Default | Description |
|---|---|---|
| `Config.Debug` | `false` | Enables debug prints in F8 console |
| `Config.TaserOnly` | `true` | Force all police NPCs to use taser |
| `Config.TaserAmmo` | `50` | Ammo given to each police NPC taser |
| `Config.WeaponCheckInterval` | `1500` | How often (ms) to check/re-apply taser |
| `Config.ArrestEnabled` | `true` | Enable proximity arrest system |
| `Config.ArrestDistance` | `2.0` | Distance in GTA units to trigger arrest |
| `Config.ArrestCheckInterval` | `500` | How often (ms) to check for arrests |
| `Config.ArrestCooldown` | `10000` | Cooldown (ms) between arrests |
| `Config.ArrestRequiresStunned` | `true` | Player must be tased before arrest |
| `Config.ArrestWantedLevelMin` | `1` | Min wanted level for arrest to trigger |
| `Config.ArrestAnimationDuration` | `8000` | Length of arrest animation (ms) |
| `Config.JailEnabled` | `true` | Send player to jail on arrest |
| `Config.JailEvent` | `qb-jail:server:SendToJail` | Server event for your jail script |
| `Config.JailTimePerStar` | `{5,10,20,35,60}` | Jail time (min) per wanted star |
| `Config.FineEnabled` | `false` | Enable fines on arrest |
| `Config.FinePerStar` | `{500,...,10000}` | Fine amount per wanted star |
| `Config.SurrenderEnabled` | `true` | Allow manual surrender |
| `Config.SurrenderDistance` | `10.0` | Distance for surrender to be valid |
| `Config.NotifyStyle` | `qb` | Notification style: `qb`, `ox`, `custom` |

---

## Troubleshooting

**Police peds are still using guns:**
- Make sure `Config.TaserOnly = true` in `config.lua`.
- Check that police ped models are listed in `Config.PolicePedModels`.
- Enable `Config.Debug = true` and check the F8 console for weapon override messages.
- Try `/debugpolicenpc` in-game (requires `Config.Debug = true`) to see which peds are detected.

**Police NPCs are not spawning at all:**
- Make sure `Config.BlacklistedPeds` in `qb-smallresources/config.lua` does not include police models.
- Confirm `Config.AIResponse.wantedLevels = true` and at least dispatch service `[1]` is `true` in `qb-smallresources/config.lua`.

**Player is not being arrested:**
- Enable `Config.Debug = true` and check F8 for arrest distance logs.
- If `Config.ArrestRequiresStunned = true`, the player must be actively tased/stunned first.
- Confirm `Config.ArrestEnabled = true`.

**Jail is not triggering:**
- Confirm `Config.JailEnabled = true`.
- Verify `Config.JailEvent` matches the exact event name your jail script uses.
- Check server console for arrest logs and errors.

---

## License

This resource was built for use on your QB-Core FiveM server. Modify freely.