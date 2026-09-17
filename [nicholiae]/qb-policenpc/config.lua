Config = {}

--[[
    ============================================================
    QB-Core Police NPC Control System - Configuration
    ============================================================
    This module intercepts police NPCs spawned by the native GTA
    wanted star system and modifies their behavior:
      1. Forces all police peds to use tasers only (non-lethal)
      2. Automatically arrests the player when a police NPC is
         within a close enough proximity (side-by-side)
    ============================================================
]]

-- ============================================================
-- GENERAL SETTINGS
-- ============================================================

Config.Debug = false                        -- Set to true to enable debug prints in F8 console
Config.Locale = 'en'                        -- Locale for notifications

-- ============================================================
-- WANTED LEVEL / DISPATCH SETTINGS
-- These mirror what you set in qb-smallresources config.lua.
-- This module assumes the wanted system is already ENABLED.
-- Make sure in qb-smallresources/config.lua:
--   Config.AIResponse.wantedLevels = true
--   Config.AIResponse.dispatchServices[1] = true  (Police Vehicles)
--   Config.AIResponse.dispatchServices[6] = true  (Police Motorcycles)
-- ============================================================

Config.MaxWantedLevel = 5                   -- Maximum wanted level (1-5). Set to match qb-smallresources

-- ============================================================
-- TASER / WEAPON SETTINGS
-- ============================================================

Config.TaserOnly = true                     -- If true, all police NPCs will be forced to use taser only
Config.TaserAmmo = 50                       -- Amount of taser ammo to give each police NPC
Config.WeaponCheckInterval = 1500           -- How often (ms) to check and re-apply taser to police peds
                                            -- Lower = more responsive but more CPU usage. 1000-2000 recommended.

-- List of all police/law enforcement ped models that should be forced to use tasers
Config.PolicePedModels = {
    's_m_y_cop_01',
    's_f_y_cop_01',
    's_m_y_sheriff_01',
    's_f_y_sheriff_01',
    's_m_y_ranger_01',
    's_f_y_ranger_01',
    's_m_y_hwaycop_01',
    's_m_y_swat_01',         -- SWAT (high wanted levels)
    's_m_m_fbi_01',          -- FIB
    's_m_m_fbi_02',
    's_m_y_noose_01',        -- NOOSE (wanted level 5)
}

-- ============================================================
-- ARREST SETTINGS
-- ============================================================

Config.ArrestEnabled = true                 -- Enable proximity arrest system
Config.ArrestDistance = 2.0                 -- Distance in GTA units for arrest to trigger (side-by-side)
Config.ArrestCheckInterval = 500            -- How often (ms) to check for nearby police peds
Config.ArrestCooldown = 10000               -- Cooldown (ms) after being arrested before it can trigger again
Config.ArrestRequiresStunned = false         -- If true, player must be stunned/tased before arrest triggers
                                            -- Recommended: true - makes taser meaningful before arrest
Config.ArrestWantedLevelMin = 1             -- Minimum wanted level required for arrest to trigger

-- How long the arrest animation plays before the player is sent to jail (ms)
Config.ArrestAnimationDuration = 8000

-- Notification shown to the player when being arrested
Config.ArrestNotification = 'You have been arrested by the LSPD!'

-- ============================================================
-- JAIL / PRISON INTEGRATION
-- ============================================================
-- This module fires a server event that your jail script listens to.
-- Default is set to work with qb-prison / qb-jail out of the box.
-- You can change the event name and parameters to match your custom jail script.

Config.JailEnabled = true                   -- If false, arrest will only clear wanted level (no jail time)
Config.JailEvent = 'police:client:SendToJail'  -- Server event to trigger on arrest
                                                 -- For qb-prison use: 'qb-prison:server:SendToJail'
                                                 -- For custom jail, change to your event name

-- Jail time in minutes per wanted star
-- e.g. 1 star = 5 mins, 2 stars = 10 mins, etc.
Config.JailTimePerStar = {
    [1] = 5,
    [2] = 10,
    [3] = 15,
    [4] = 20,
    [5] = 30,
}

-- ============================================================
-- SURRENDER SETTINGS
-- ============================================================
-- Players can optionally surrender (hands up) to trigger arrest
-- without waiting for a police ped to get close enough.

Config.SurrenderEnabled = true              -- Allow players to surrender manually
Config.SurrenderKey = 'X'                   -- Default QB-Core hands-up key (matches qb-smallresources)
Config.SurrenderDistance = 10.0             -- Must have a police NPC within this distance to surrender
Config.SurrenderNotification = 'You have surrendered to the LSPD!'

-- ============================================================
-- ANIMATION SETTINGS
-- ============================================================

Config.ArrestAnims = {
    arrestedDict   = 'mp_arresting',
    arrestedAnim   = 'idle',
    handcuffDict   = 'mp_arresting',
    handcuffAnim   = 'a_uncuff',
}

-- ============================================================
-- FINE SYSTEM (Optional)
-- ============================================================
-- If you want to add fines on top of jail time, enable this.
-- This will remove money from the player's account on arrest.

Config.FineEnabled = false                  -- Enable fine system on arrest
Config.FinePerStar = {
    [1] = 500,
    [2] = 1500,
    [3] = 3000,
    [4] = 6000,
    [5] = 10000,
}
Config.FineBankAccount = 'savings'          -- Which account to deduct from: 'cash', 'bank', 'savings'

-- ============================================================
-- NOTIFICATION STYLE
-- ============================================================
-- 'qb'       = Uses QBCore default notify
-- 'ox'       = Uses ox_lib notify
-- 'custom'   = Define your own in client/main.lua NotifyPlayer()

Config.NotifyStyle = 'qb'