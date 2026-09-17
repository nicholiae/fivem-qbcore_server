--[[
    ============================================================
    QB-Core Police NPC Control System
    server/main.lua
    ------------------------------------------------------------
    Handles:
      - Processing arrests server-side (jail time, fines)
      - Admin commands for force-arresting players
      - Logging arrests to Discord/console
      - Integration hooks for external jail scripts
    ============================================================
]]

local QBCore = exports['qb-core']:GetCoreObject()

-- ============================================================
-- UTILITY: Debug Print
-- ============================================================
local function DebugPrint(msg)
    if Config.Debug then
        print('^3[qb-policenpc SERVER]^7 ' .. tostring(msg))
    end
end

-- ============================================================
-- UTILITY: Get jail time based on wanted level
-- ============================================================
local function GetJailTime(wantedLevel)
    local level = math.max(1, math.min(5, wantedLevel))
    return Config.JailTimePerStar[level] or 5
end

-- ============================================================
-- UTILITY: Get fine amount based on wanted level
-- ============================================================
local function GetFineAmount(wantedLevel)
    local level = math.max(1, math.min(5, wantedLevel))
    return Config.FinePerStar[level] or 0
end

-- ============================================================
-- UTILITY: Log arrest to console (and optionally Discord)
-- ============================================================
local function LogArrest(src, playerName, citizenId, wantedLevel, jailTime, fine)
    local logMsg = string.format(
        '[ARREST] Player: %s (ID: %d | CitizenID: %s) | Wanted Level: %d | Jail: %d min | Fine: $%d',
        playerName, src, citizenId, wantedLevel, jailTime, fine
    )
    print('^2[qb-policenpc]^7 ' .. logMsg)

    -- Discord webhook logging (optional)
    -- Uncomment and configure if you want Discord logging
    --[[
    local webhookUrl = 'YOUR_DISCORD_WEBHOOK_URL_HERE'
    PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST',
        json.encode({
            username = 'LSPD Arrest Log',
            embeds = {{
                title = '🚔 NPC Police Arrest',
                color = 16711680,
                fields = {
                    { name = 'Player',        value = playerName,          inline = true  },
                    { name = 'Server ID',     value = tostring(src),       inline = true  },
                    { name = 'Citizen ID',    value = citizenId,           inline = true  },
                    { name = 'Wanted Level',  value = tostring(wantedLevel), inline = true },
                    { name = 'Jail Time',     value = jailTime .. ' min',  inline = true  },
                    { name = 'Fine',          value = '$' .. fine,         inline = true  },
                },
                footer = { text = os.date('%Y-%m-%d %H:%M:%S') }
            }}
        }),
        { ['Content-Type'] = 'application/json' }
    )
    ]]
end

-- ============================================================
-- CORE EVENT: ProcessArrest
-- Fired from client when a player has been arrested by an NPC
-- ============================================================
RegisterNetEvent('qb-policenpc:server:ProcessArrest', function(wantedLevel)
    local src    = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then
        DebugPrint('ProcessArrest: Could not find player for source ' .. tostring(src))
        return
    end

    local playerName = Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
    local citizenId  = Player.PlayerData.citizenid
    local jailTime   = GetJailTime(wantedLevel)
    local fineAmount = Config.FineEnabled and GetFineAmount(wantedLevel) or 0

    DebugPrint('Processing arrest for ' .. playerName .. ' (CitizenID: ' .. citizenId .. ') | Wanted: ' .. wantedLevel .. ' | Jail: ' .. jailTime .. 'min')

    -- --------------------------------------------------------
    -- Apply fine (if enabled)
    -- --------------------------------------------------------
    if Config.FineEnabled and fineAmount > 0 then
        local account = Config.FineBankAccount or 'bank'
        local currentMoney = Player.PlayerData.money[account] or 0

        if currentMoney >= fineAmount then
            Player.Functions.RemoveMoney(account, fineAmount, 'npc-police-arrest-fine')
            DebugPrint('Fine of $' .. fineAmount .. ' deducted from ' .. account)
        else
            -- Take whatever they have if they can't afford the full fine
            Player.Functions.RemoveMoney(account, currentMoney, 'npc-police-arrest-fine-partial')
            DebugPrint('Partial fine of $' .. currentMoney .. ' deducted (player could not afford full fine of $' .. fineAmount .. ')')
        end

        TriggerClientEvent('qb-policenpc:client:SendToJail', src, jailTime)
    end

    -- --------------------------------------------------------
    -- Confirm arrest on client (clears wanted level)
    -- --------------------------------------------------------
    TriggerClientEvent('qb-policenpc:client:ArrestConfirmed', src)

    -- --------------------------------------------------------
    -- Send to jail (if enabled)
    -- --------------------------------------------------------
    if Config.JailEnabled then
        -- Give a short delay so the client-side animation/notification
        -- has time to complete before jail teleport fires
        SetTimeout(3000, function()
            -- Check player is still connected
            if not QBCore.Functions.GetPlayer(src) then return end

            DebugPrint('Firing jail event: ' .. Config.JailEvent .. ' for ' .. playerName)

            -- Fire the configured jail event
            -- Default: works with qb-jail and qb-prison out of the box
            -- qb-jail   expects: (src, time)
            -- qb-prison expects: (src, time)
            -- Adjust parameters below if your jail script uses different args
            TriggerClientEvent(Config.JailEvent, src, jailTime)

            -- Also notify client of jail sentence duration
            TriggerClientEvent('qb-policenpc:client:SendToJail', src, jailTime)
        end)
    else
        -- No jail configured - just clear wanted level (already done client-side)
        DebugPrint('Jail disabled - arrest processed with wanted level clear only')
    end

    -- --------------------------------------------------------
    -- Log the arrest
    -- --------------------------------------------------------
    LogArrest(src, playerName, citizenId, wantedLevel, jailTime, fineAmount)

    -- --------------------------------------------------------
    -- Optional: Trigger a custom server event hook for your
    -- other scripts to listen to (e.g. for stats tracking)
    -- --------------------------------------------------------
    TriggerEvent('qb-policenpc:server:OnPlayerArrested', src, {
        playerName   = playerName,
        citizenId    = citizenId,
        wantedLevel  = wantedLevel,
        jailTime     = jailTime,
        fineAmount   = fineAmount,
    })
end)

-- ============================================================
-- ADMIN COMMAND: Force arrest a player by server ID
-- Usage: /npcforcearest [id] [wantedlevel]
-- ============================================================
QBCore.Commands.Add('npcforcearrest', 'Force arrest a player via NPC system (Admin)', {
    { name = 'id',           help = 'Server ID of the player to arrest' },
    { name = 'wantedlevel',  help = 'Wanted level (1-5) to apply for jail time calculation' }
}, true, function(source, args)
    local adminPlayer = QBCore.Functions.GetPlayer(source)
    if not adminPlayer then return end

    -- Permission check: admin or god group only
    local adminGroup = QBCore.Functions.GetPermission(source)
    if adminGroup ~= 'admin' and adminGroup ~= 'god' then
        TriggerClientEvent('QBCore:Notify', source, 'You do not have permission to use this command.', 'error')
        return
    end

    local targetId     = tonumber(args[1])
    local wantedLevel  = tonumber(args[2]) or 3

    if not targetId then
        TriggerClientEvent('QBCore:Notify', source, 'Invalid player ID.', 'error')
        return
    end

    local targetPlayer = QBCore.Functions.GetPlayer(targetId)
    if not targetPlayer then
        TriggerClientEvent('QBCore:Notify', source, 'Player not found.', 'error')
        return
    end

    wantedLevel = math.max(1, math.min(5, wantedLevel))

    DebugPrint('Admin ' .. source .. ' force-arresting player ' .. targetId .. ' with wanted level ' .. wantedLevel)

    -- Trigger client-side arrest animation on target
    TriggerClientEvent('qb-policenpc:client:ForceArrest', targetId)

    -- Process the arrest server-side after a short delay (for animation)
    SetTimeout(Config.ArrestAnimationDuration + 500, function()
        -- Re-fire the process arrest as if it came from the target
        local jailTime   = GetJailTime(wantedLevel)
        local fineAmount = Config.FineEnabled and GetFineAmount(wantedLevel) or 0
        local Player     = QBCore.Functions.GetPlayer(targetId)

        if not Player then return end

        local playerName = Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
        local citizenId  = Player.PlayerData.citizenid

        TriggerClientEvent('qb-policenpc:client:ArrestConfirmed', targetId)

        if Config.JailEnabled then
            TriggerClientEvent(Config.JailEvent, targetId, jailTime)
            TriggerClientEvent('qb-policenpc:client:SendToJail', targetId, jailTime)
        end

        LogArrest(targetId, playerName, citizenId, wantedLevel, jailTime, fineAmount)

        TriggerClientEvent('QBCore:Notify', source,
            'Player ' .. playerName .. ' has been force-arrested (Wanted: ' .. wantedLevel .. ', Jail: ' .. jailTime .. 'min)',
            'success'
        )
    end)
end, 'admin')

-- ============================================================
-- ADMIN COMMAND: Set a player's wanted level
-- Usage: /npcwanted [id] [level]
-- ============================================================
QBCore.Commands.Add('npcwanted', 'Set NPC wanted level for a player (Admin)', {
    { name = 'id',    help = 'Server ID of the player' },
    { name = 'level', help = 'Wanted level to set (0-5). 0 clears wanted level.' }
}, true, function(source, args)
    local adminGroup = QBCore.Functions.GetPermission(source)
    if adminGroup ~= 'admin' and adminGroup ~= 'god' then
        TriggerClientEvent('QBCore:Notify', source, 'You do not have permission to use this command.', 'error')
        return
    end

    local targetId = tonumber(args[1])
    local level    = tonumber(args[2])

    if not targetId or not level then
        TriggerClientEvent('QBCore:Notify', source, 'Usage: /npcwanted [id] [level 0-5]', 'error')
        return
    end

    level = math.max(0, math.min(5, level))

    local targetPlayer = QBCore.Functions.GetPlayer(targetId)
    if not targetPlayer then
        TriggerClientEvent('QBCore:Notify', source, 'Player not found.', 'error')
        return
    end

    TriggerClientEvent('qb-policenpc:client:SetWantedLevel', targetId, level)

    TriggerClientEvent('QBCore:Notify', source,
        'Set wanted level to ' .. level .. ' for player ID ' .. targetId,
        'success'
    )

    DebugPrint('Admin ' .. source .. ' set wanted level ' .. level .. ' for player ' .. targetId)
end, 'admin')

-- ============================================================
-- CLIENT EVENT: Set wanted level (fired from admin command above)
-- ============================================================
RegisterNetEvent('qb-policenpc:client:SetWantedLevel', function(level)
    -- This is handled client-side - see below
end)

-- Handle the SetWantedLevel on the client that receives it
-- (We register a passthrough net event the client listens to)
-- The actual SetPlayerWantedLevel native must be called client-side
AddEventHandler('qb-policenpc:server:SetWantedLevelPassthrough', function(src, level)
    TriggerClientEvent('qb-policenpc:client:SetWantedLevel', src, level)
end)

-- ============================================================
-- EXPORT: Allow other scripts to trigger an NPC arrest
-- Usage from another server script:
--   exports['qb-policenpc']:ArrestPlayer(src, wantedLevel)
-- ============================================================
exports('ArrestPlayer', function(src, wantedLevel)
    wantedLevel = tonumber(wantedLevel) or 1
    TriggerClientEvent('qb-policenpc:client:ForceArrest', src)
    SetTimeout(Config.ArrestAnimationDuration + 500, function()
        TriggerEvent('qb-policenpc:server:ProcessArrest', src)
    end)
end)

-- ============================================================
-- EXPORT: Allow other scripts to set a player's wanted level
-- Usage from another server script:
--   exports['qb-policenpc']:SetWantedLevel(src, level)
-- ============================================================
exports('SetWantedLevel', function(src, level)
    level = math.max(0, math.min(5, tonumber(level) or 1))
    TriggerClientEvent('qb-policenpc:client:SetWantedLevel', src, level)
end)

DebugPrint('server/main.lua loaded successfully')