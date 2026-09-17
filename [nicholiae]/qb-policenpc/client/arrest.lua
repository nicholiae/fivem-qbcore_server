--[[
    ============================================================
    QB-Core Police NPC Control System
    client/arrest.lua
    ------------------------------------------------------------
    Handles:
      - Proximity detection: triggers arrest when a police NPC
        is side-by-side with the player
      - Surrender mechanic: player can press hands-up key near
        a police NPC to voluntarily surrender
      - Arrest animation sequence
      - Fires server event to process jail time / fines
    ============================================================
]]

local QBCore = exports['qb-core']:GetCoreObject()

-- ============================================================
-- LOCAL STATE
-- ============================================================
local isBeingArrested    = false    -- Arrest sequence currently in progress
local lastArrestTime     = 0        -- Timestamp of last arrest (for cooldown)
local surrenderActive    = false    -- Whether player has hands up

-- ============================================================
-- UTILITY: Check if player is currently stunned (tased)
-- ============================================================
local function IsPlayerStunned()
    local ped = PlayerPedId()
    return IsPedBeingStunned(ped, 0)
        or IsPedRagdoll(ped)
        or IsPedFalling(ped)
end

-- ============================================================
-- UTILITY: Get the closest police NPC to the player
-- Returns the ped handle and distance, or nil if none found
-- ============================================================
local function GetClosestPolicePed(maxDist)
    local playerPed   = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local closestPed  = nil
    local closestDist = maxDist or Config.ArrestDistance

    local pedPool = GetGamePool('CPed')
    for _, ped in ipairs(pedPool) do
        if IsPolicePed(ped) then
            local pedCoords = GetEntityCoords(ped)
            local dist = #(playerCoords - pedCoords)
            if dist < closestDist then
                closestDist = dist
                closestPed = ped
            end
        end
    end

    return closestPed, closestDist
end

-- ============================================================
-- CORE: Play the arrest animation sequence on the player ped
-- ============================================================
local function PlayArrestAnimation()
    local ped      = PlayerPedId()
    local animDict = Config.ArrestAnims.arrestedDict
    local animName = Config.ArrestAnims.arrestedAnim

    -- Request and load the animation dictionary
    RequestAnimDict(animDict)
    local timeout = 0
    while not HasAnimDictLoaded(animDict) do
        Wait(100)
        timeout = timeout + 100
        if timeout > 5000 then
            DebugPrint('Warning: Anim dict ' .. animDict .. ' failed to load in time')
            break
        end
    end

    -- Play the arrested idle animation (hands behind back)
    TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, Config.ArrestAnimationDuration, 49, 0, false, false, false)

    -- Freeze player in place during the arrest sequence
    FreezeEntityPosition(ped, true)

    -- Block most player inputs during arrest
    DisableAllControlActions(0)
end

-- ============================================================
-- CORE: The full arrest sequence
-- ============================================================
local function ExecuteArrest()
    if isBeingArrested then return end

    local now = GetGameTimer()
    if (now - lastArrestTime) < Config.ArrestCooldown then
        DebugPrint('Arrest on cooldown, skipping')
        return
    end

    local wantedLevel = GetPlayerWantedLevel(PlayerId())
    if wantedLevel < Config.ArrestWantedLevelMin then
        DebugPrint('Wanted level ' .. wantedLevel .. ' below minimum for arrest')
        return
    end

    isBeingArrested = true
    lastArrestTime  = now

    DebugPrint('Arrest sequence started, wanted level: ' .. wantedLevel)

    -- Notify player
    NotifyPlayer(Config.ArrestNotification, 'error')

    -- Play arrest animation
    PlayArrestAnimation()

    -- Wait for animation to complete
    Wait(Config.ArrestAnimationDuration)

    -- Unfreeze player
    local ped = PlayerPedId()
    FreezeEntityPosition(ped, false)
    EnableAllControlActions(0)
    ClearPedTasks(ped)

    -- Tell the server to process the arrest (jail time, fines, etc.)
    TriggerServerEvent('qb-policenpc:server:ProcessArrest', wantedLevel)

    isBeingArrested = false
    surrenderActive = false

    DebugPrint('Arrest sequence complete, server event fired')
end

-- ============================================================
-- MAIN THREAD: Proximity arrest detection
-- Checks if a police NPC is close enough to the player to
-- trigger an arrest. Runs every ArrestCheckInterval ms.
-- ============================================================
CreateThread(function()
    while true do
        Wait(Config.ArrestCheckInterval)

        if not Config.ArrestEnabled then goto continue end
        if isBeingArrested then goto continue end

        local wantedLevel = GetPlayerWantedLevel(PlayerId())
        if wantedLevel < Config.ArrestWantedLevelMin then goto continue end

        local playerPed = PlayerPedId()

        -- Don't arrest if player is already dead
        if IsEntityDead(playerPed) then goto continue end

        -- Check stun requirement
        local stunConditionMet = true
        if Config.ArrestRequiresStunned then
            stunConditionMet = IsPlayerStunned() or surrenderActive
        end

        if not stunConditionMet then goto continue end

        -- Find closest police ped within arrest distance
        local closestPed, dist = GetClosestPolicePed(Config.ArrestDistance)

        if closestPed then
            DebugPrint('Police ped within arrest distance (' .. string.format('%.2f', dist) .. ' units) - triggering arrest')
            ExecuteArrest()
        end

        ::continue::
    end
end)

-- ============================================================
-- SURRENDER SYSTEM
-- Detects when a player puts their hands up (X key default)
-- near a police NPC and initiates arrest
-- ============================================================
CreateThread(function()
    if not Config.SurrenderEnabled then return end

    while true do
        Wait(300)

        if isBeingArrested then goto continueS end

        local wantedLevel = GetPlayerWantedLevel(PlayerId())
        if wantedLevel < Config.ArrestWantedLevelMin then
            surrenderActive = false
            goto continueS
        end

        -- Detect hands-up key (X by default in QB-Core, control index 47)
        -- We detect the animation state rather than the key press directly
        -- to stay compatible with QB-Core's own HandsUp system
        local playerPed = PlayerPedId()

        -- Check if player is currently in a hands-up animation
        local isHandsUp = IsEntityPlayingAnim(playerPed, 'mp_facial', 'facials@gen_male@variations@scared', 3)
                       or IsEntityPlayingAnim(playerPed, 'random@arrests', 'idle_2_hands_up', 3)
                       or IsEntityPlayingAnim(playerPed, 'random@arrests@busted', 'idle_a', 3)

        if not isHandsUp then
            surrenderActive = false
            goto continueS
        end

        -- Check if a police ped is nearby (surrender distance)
        local closestPed, dist = GetClosestPolicePed(Config.SurrenderDistance)

        if closestPed and not surrenderActive then
            surrenderActive = true
            NotifyPlayer(Config.SurrenderNotification, 'error')
            DebugPrint('Player surrendered - police ped at ' .. string.format('%.2f', dist) .. ' units')
            Wait(2000)  -- Brief delay so notification shows before arrest anim
            ExecuteArrest()
        end

        ::continueS::
    end
end)

-- ============================================================
-- EVENT: Server acknowledges arrest and sends player to jail
-- This event is triggered AFTER the server has processed jail
-- ============================================================
RegisterNetEvent('qb-policenpc:client:SendToJail', function(jailTime)
    DebugPrint('Received SendToJail event - jail time: ' .. tostring(jailTime) .. ' minutes')
    -- Your jail script handles the actual teleport.
    -- This event lets you hook in additional client-side effects if needed.
    -- For example, a black screen fade, a notification, etc.
    NotifyPlayer('Sentenced to ' .. jailTime .. ' minute(s) in prison.', 'error')
end)

-- ============================================================
-- EVENT: Force arrest from server (e.g. admin command)
-- ============================================================
RegisterNetEvent('qb-policenpc:client:ForceArrest', function()
    DebugPrint('ForceArrest event received from server')
    ExecuteArrest()
end)
