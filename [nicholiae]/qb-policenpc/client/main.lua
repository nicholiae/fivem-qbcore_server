--[[
    ============================================================
    QB-Core Police NPC Control System
    client/main.lua
    ------------------------------------------------------------
    Handles:
      - Forcing police NPCs spawned by the wanted system to use
        tasers only (non-lethal)
      - Utility functions shared across client scripts
    ============================================================
]]

local QBCore = exports['qb-core']:GetCoreObject()

-- ============================================================
-- LOCAL STATE
-- ============================================================
local processedPeds = {}        -- Track peds we have already equipped with tasers
                                -- to avoid redundant native calls every tick

-- ============================================================
-- UTILITY: Debug Print
-- ============================================================
function DebugPrint(msg)
    if Config.Debug then
        print('^3[qb-policenpc]^7 ' .. tostring(msg))
    end
end

-- ============================================================
-- UTILITY: Notify Player
-- ============================================================
function NotifyPlayer(msg, notifyType)
    notifyType = notifyType or 'primary'
    if Config.NotifyStyle == 'qb' then
        QBCore.Functions.Notify(msg, notifyType)
    elseif Config.NotifyStyle == 'ox' then
        lib.notify({ title = 'LSPD', description = msg, type = notifyType })
    else
        -- Custom: replace with your notification export
        QBCore.Functions.Notify(msg, notifyType)
    end
end

-- ============================================================
-- UTILITY: Check if a ped is a police NPC model
-- ============================================================
function IsPolicePed(ped)
    if not DoesEntityExist(ped) then return false end
    if IsPedAPlayer(ped) then return false end

    local model = GetEntityArchetypeName(ped)
    if not model then return false end

    for _, pedModel in ipairs(Config.PolicePedModels) do
        if model == pedModel then
            return true
        end
    end
    return false
end

-- ============================================================
-- CORE: Force a single police ped to use taser only
-- ============================================================
local function EquipPedWithTaser(ped)
    if not DoesEntityExist(ped) then return end

    local taserHash = GetHashKey('WEAPON_STUNGUN')

    -- Remove all existing weapons first to ensure clean loadout
    RemoveAllPedWeapons(ped, true)

    -- Give taser with configured ammo
    GiveWeaponToPed(ped, taserHash, Config.TaserAmmo, false, true)

    -- Force taser as current weapon
    SetCurrentPedWeapon(ped, taserHash, true)

    -- Prevent the ped from picking up weapons from the ground
    SetPedDropsWeaponsWhenDead(ped, false)

    -- Prevent weapon cycling to anything else
    SetPedCombatAttributes(ped, 14, false)   -- CanUseVehicles - keep false for on-foot peds
    SetPedCombatAttributes(ped, 46, true)    -- AlwaysFight
    SetPedCombatAttributes(ped, 5, false)    -- CanDoDrivebys

    -- Keep the ped from fleeing when low health - they should keep pursuing
    SetPedFleeAttributes(ped, 0, false)

    -- Increase combat range slightly so taser is usable
    SetPedCombatRange(ped, 1)               -- Medium range

    DebugPrint('Equipped ped ' .. tostring(ped) .. ' (' .. (GetEntityArchetypeName(ped) or 'unknown') .. ') with taser')
end

-- ============================================================
-- CORE: Continuously re-check equipped weapon on police peds
-- GTA V's AI will sometimes re-equip default weapons, so we
-- monitor and override on an interval
-- ============================================================
local function MonitorPedWeapon(ped)
    if processedPeds[ped] then return end
    processedPeds[ped] = true

    -- Spawn a coroutine that watches this specific ped
    CreateThread(function()
        local taserHash = GetHashKey('WEAPON_STUNGUN')
        while DoesEntityExist(ped) and IsPolicePed(ped) do
            local currentWeapon = GetSelectedPedWeapon(ped)

            -- If GTA tried to give them a different weapon, override it
            if currentWeapon ~= taserHash then
                DebugPrint('Ped ' .. tostring(ped) .. ' switched to weapon ' .. tostring(currentWeapon) .. ' - overriding with taser')
                EquipPedWithTaser(ped)
            end

            Wait(Config.WeaponCheckInterval)
        end
        -- Clean up when ped is gone
        processedPeds[ped] = nil
        DebugPrint('Ped ' .. tostring(ped) .. ' cleaned from processedPeds (no longer exists)')
    end)
end

-- ============================================================
-- MAIN THREAD: Scan for new police peds and arm them with taser
-- This runs on an interval and catches newly spawned peds
-- ============================================================
CreateThread(function()
    while true do
        -- Only run if wanted level system is active
        local wantedLevel = GetPlayerWantedLevel(PlayerId())

        if wantedLevel > 0 and Config.TaserOnly then
            local pedPool = GetGamePool('CPed')

            for _, ped in ipairs(pedPool) do
                if IsPolicePed(ped) and not processedPeds[ped] then
                    -- Initial equip
                    EquipPedWithTaser(ped)
                    -- Start persistent monitor for this ped
                    MonitorPedWeapon(ped)
                end
            end
        elseif wantedLevel == 0 then
            -- Clean up processed table periodically when not wanted
            -- to avoid stale entries building up
            local cleaned = 0
            for ped, _ in pairs(processedPeds) do
                if not DoesEntityExist(ped) then
                    processedPeds[ped] = nil
                    cleaned = cleaned + 1
                end
            end
            if cleaned > 0 then
                DebugPrint('Cleaned ' .. cleaned .. ' stale ped entries from processedPeds')
            end
        end

        Wait(Config.WeaponCheckInterval)
    end
end)

-- ============================================================
-- HOOK: populationPedCreating event
-- This fires the moment a new ped is being placed in the world.
-- We use this as an early-catch to grab police peds as soon as
-- they spawn rather than waiting for the pool scan interval.
-- ============================================================
AddEventHandler('populationPedCreating', function(x, y, z)
    -- Short wait to allow the entity handle to become valid
    CreateThread(function()
        Wait(300)
        local _, ped = GetClosestPed(x, y, z, 2.0, false, true, false, false, 1)

        if ped and ped ~= 0 and DoesEntityExist(ped) then
            if IsPolicePed(ped) and not processedPeds[ped] then
                EquipPedWithTaser(ped)
                MonitorPedWeapon(ped)
            end
        end
    end)
end)

-- ============================================================
-- EVENT: Called from server when arrest is confirmed
-- Clears the wanted level on the client side
-- ============================================================
RegisterNetEvent('qb-policenpc:client:ArrestConfirmed', function()
    ClearPlayerWantedLevel(PlayerId())
    SetMaxWantedLevel(0)
    Wait(2000)
    SetMaxWantedLevel(Config.MaxWantedLevel)
    DebugPrint('Arrest confirmed - wanted level cleared')
end)

-- ============================================================
-- EVENT: Debug command to test taser equip on nearest NPC
-- Usage: /testpolicenpc  (only works if Config.Debug = true)
-- ============================================================
if Config.Debug then
    RegisterCommand('testpolicenpc', function()
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local _, ped = GetClosestPed(coords.x, coords.y, coords.z, 10.0, false, true, false, false, 1)

        if ped and ped ~= 0 and DoesEntityExist(ped) then
            EquipPedWithTaser(ped)
            NotifyPlayer('Equipped nearest NPC (' .. (GetEntityArchetypeName(ped) or 'unknown') .. ') with taser', 'success')
        else
            NotifyPlayer('No NPC found within 10 units', 'error')
        end
    end, false)

    RegisterCommand('debugpolicenpc', function()
        local pedPool = GetGamePool('CPed')
        local count = 0
        for _, ped in ipairs(pedPool) do
            if IsPolicePed(ped) then
                count = count + 1
                print('^3[qb-policenpc DEBUG]^7 Police ped found: ' .. tostring(ped) .. ' model: ' .. (GetEntityArchetypeName(ped) or 'unknown') .. ' weapon: ' .. tostring(GetSelectedPedWeapon(ped)))
            end
        end
        NotifyPlayer('Found ' .. count .. ' police NPCs - check F8 console', 'primary')
    end, false)
end

-- ============================================================
-- EVENT: Admin-set wanted level (from server admin command)
-- ============================================================
RegisterNetEvent('qb-policenpc:client:SetWantedLevel', function(level)
    level = math.max(0, math.min(5, tonumber(level) or 0))
    SetPlayerWantedLevel(PlayerId(), level, false)
    SetPlayerWantedLevelNow(PlayerId(), false)
    DebugPrint('Wanted level set to ' .. level .. ' by server')
    if level > 0 then
        NotifyPlayer('Wanted level set to ' .. level .. ' star(s) by an admin.', 'error')
    else
        NotifyPlayer('Your wanted level has been cleared by an admin.', 'success')
    end
end)
