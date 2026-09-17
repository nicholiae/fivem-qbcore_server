-- NC Drug Addiction System
-- Server-side main initialization

local QBCore = nil
local Players = {}

-- Initialize QBCore
CreateThread(function()
    Wait(1000)
    QBCore = exports['qb-core']:GetCoreObject()
    
    if Config.Debug then
        print('[NC-DrugAddiction] Server initialized')
    end
end)

-- Store player addiction data in memory
local PlayerAddictions = {}

-- Get player's addiction data
function GetPlayerAddictions(citizenid)
    if not PlayerAddictions[citizenid] then
        PlayerAddictions[citizenid] = {
            addictions = {},
            tolerance = {},
            lastUse = {},
            lastOnline = os.time(),
            totalUseCount = {},
            recentUses = {} -- Track recent uses for overdose detection
        }
    end
    return PlayerAddictions[citizenid]
end

-- Initialize addiction data structure for a drug type
function InitializeDrugData(playerData, drugType)
    if not playerData.addictions[drugType] then
        playerData.addictions[drugType] = 0
    end
    if not playerData.tolerance[drugType] then
        playerData.tolerance[drugType] = 0
    end
    if not playerData.lastUse[drugType] then
        playerData.lastUse[drugType] = 0
    end
    if not playerData.totalUseCount[drugType] then
        playerData.totalUseCount[drugType] = 0
    end
    if not playerData.recentUses[drugType] then
        playerData.recentUses[drugType] = {}
    end
end

-- Player connecting - load data from metadata
AddEventHandler('QBCore:Server:PlayerLoaded', function(Player)
    if not Player then return end
    
    local citizenid = Player.PlayerData.citizenid
    local playerData = GetPlayerAddictions(citizenid)
    
    -- Load from player metadata if exists
    local metadata = Player.PlayerData.metadata or {}
    if metadata.drugaddictions then
        playerData.addictions = metadata.drugaddictions.addictions or {}
        playerData.tolerance = metadata.drugaddictions.tolerance or {}
        playerData.lastUse = metadata.drugaddictions.lastUse or {}
        playerData.totalUseCount = metadata.drugaddictions.totalUseCount or {}
        playerData.lastOnline = os.time()
        
        if Config.Debug then
            print('[NC-DrugAddiction] Loaded data for: ' .. citizenid)
        end
    end
    
    -- Calculate offline decay
    if metadata.drugaddictions and metadata.drugaddictions.lastOnline then
        local offlineTime = os.time() - metadata.drugaddictions.lastOnline
        local offlineHours = offlineTime / 3600
        ApplyOfflineDecay(playerData, offlineHours)
    end
    
    -- Trigger client sync
    TriggerClientEvent('nc-drugaddiction:client:SyncAddictions', Player.PlayerData.source, playerData)
    
    Players[Player.PlayerData.source] = citizenid
end)

-- Player disconnecting - save data
AddEventHandler('QBCore:Server:OnPlayerUnload', function(src)
    local citizenid = Players[src]
    if not citizenid then return end
    
    local playerData = PlayerAddictions[citizenid]
    if playerData then
        playerData.lastOnline = os.time()
        SavePlayerAddictions(citizenid, playerData)
    end
    
    Players[src] = nil
end)

-- Apply offline decay to addictions
function ApplyOfflineDecay(playerData, hours)
    local decayAmount = hours * Config.OfflineDecayRate
    
    for drugType, addictionLevel in pairs(playerData.addictions) do
        if addictionLevel > 0 then
            local newLevel = math.max(0, addictionLevel - decayAmount)
            playerData.addictions[drugType] = newLevel
            
            if Config.Debug then
                print('[NC-DrugAddiction] Offline decay applied: ' .. drugType .. ' -' .. decayAmount)
            end
        end
    end
end

-- Save player addictions to metadata
function SavePlayerAddictions(citizenid, playerData)
    local Player = QBCore.Functions.GetPlayerByCitizenId(citizenid)
    if not Player then return end
    
    local currentMetadata = Player.PlayerData.metadata or {}
    currentMetadata.drugaddictions = {
        addictions = playerData.addictions,
        tolerance = playerData.tolerance,
        lastUse = playerData.lastUse,
        lastOnline = playerData.lastOnline or os.time(),
        totalUseCount = playerData.totalUseCount
    }
    
    Player.Functions.SetMetaData('drugaddictions', currentMetadata.drugaddictions)
    
    if Config.Debug then
        print('[NC-DrugAddiction] Saved data for: ' .. citizenid)
    end
end

-- Periodic save and decay for online players
CreateThread(function()
    while true do
        Wait(60000) -- Every minute
        
        if not QBCore then goto continue end
        
        for src, citizenid in pairs(Players) do
            local playerData = PlayerAddictions[citizenid]
            if playerData then
                -- Apply online decay (2.0 per hour = 0.0333 per minute)
                local decayPerMinute = Config.OnlineDecayRate / 60
                
                for drugType, addictionLevel in pairs(playerData.addictions) do
                    if addictionLevel > 0 and (not playerData.lastUse[drugType] or os.time() - playerData.lastUse[drugType] > 3600) then
                        -- Only decay if not used in the last hour
                        local newLevel = math.max(0, addictionLevel - decayPerMinute)
                        playerData.addictions[drugType] = newLevel
                    end
                end
                
                -- Sync with client
                local Player = QBCore.Functions.GetPlayerByCitizenId(citizenid)
                if Player then
                    TriggerClientEvent('nc-drugaddiction:client:SyncAddictions', Player.PlayerData.source, playerData)
                end
            end
        end
        
        ::continue::
    end
end)

-- Periodic save (every 5 minutes)
CreateThread(function()
    while true do
        Wait(300000)
        
        if not QBCore then goto continue end
        
        for src, citizenid in pairs(Players) do
            local playerData = PlayerAddictions[citizenid]
            if playerData then
                SavePlayerAddictions(citizenid, playerData)
            end
        end
        
        ::continue::
    end
end)

-- Export functions
exports('GetPlayerAddictions', GetPlayerAddictions)
exports('SavePlayerAddictions', SavePlayerAddictions)