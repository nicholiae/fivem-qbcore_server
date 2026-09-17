-- NC Drug Addiction System
-- Server-side addiction management

local QBCore = nil

CreateThread(function()
    Wait(1500)
    QBCore = exports['qb-core']:GetCoreObject()
end)

-- Handle drug use event
RegisterNetEvent('nc-drugaddiction:server:UseDrug', function(source, itemName)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then 
        if Config.Debug then
            print('[NC-DrugAddiction] Unknown source: ' .. src)
        end
		return 
	end
    
    local drugType = Config.ItemToDrug[itemName]
    if not drugType then
        if Config.Debug then
            print('[NC-DrugAddiction] Unknown drug item: ' .. itemName)
        end
        return
    end
    
    local citizenid = Player.PlayerData.citizenid
    local playerData = exports['nc-drugaddiction']:GetPlayerAddictions(citizenid)
    
    -- Initialize drug data if needed
    InitializeDrugData(playerData, drugType)
    
    -- Add recent use for overdose tracking
    table.insert(playerData.recentUses[drugType], os.time())
    
    -- Clean old recent uses (older than 10 minutes)
    local cutoffTime = os.time() - 600
    local filteredUses = {}
    for _, useTime in ipairs(playerData.recentUses[drugType]) do
        if useTime > cutoffTime then
            table.insert(filteredUses, useTime)
        end
    end
    playerData.recentUses[drugType] = filteredUses
    
    -- Check for overdose
    if #playerData.recentUses[drugType] >= Config.OverdoseThresholds[drugType] then
        TriggerClientEvent('nc-drugaddiction:client:Overdose', src, drugType)
        TriggerClientEvent('QBCore:Notify', src, 'You have overdosed! Seek medical attention immediately!', 'error')
        
        -- Alert nearby EMS
        TriggerEvent('nc-drugaddiction:server:AlertEMS', src, drugType)
        return
    end
    
    -- Calculate addiction gain with tolerance
    local baseAddictionGain = Config.AddictionGain[drugType] or 5
    local tolerance = playerData.tolerance[drugType] or 0
    local toleranceModifier = 1 - (tolerance / 200) -- Max 50% reduction at 100 tolerance
    toleranceModifier = math.max(0.5, toleranceModifier) -- Minimum 50% of base gain
    
    local actualAddictionGain = baseAddictionGain * toleranceModifier
    
    -- Apply addiction gain
    playerData.addictions[drugType] = (playerData.addictions[drugType] or 0) + actualAddictionGain
    playerData.addictions[drugType] = math.min(100, playerData.addictions[drugType])
    
	print(drugType)
	print(actualAddictionGain)
	print(playerData.addictions[drugType])
	
    -- Apply tolerance gain (doubled per user request)
    local toleranceGain = Config.ToleranceGain[drugType] or 5
    playerData.tolerance[drugType] = (playerData.tolerance[drugType] or 0) + toleranceGain
    playerData.tolerance[drugType] = math.min(100, playerData.tolerance[drugType])
    
	print(drugType)
	print(toleranceGain)
	print(playerData.tolerance[drugType])
	
    -- Update last use time
    playerData.lastUse[drugType] = os.time()
    playerData.totalUseCount[drugType] = (playerData.totalUseCount[drugType] or 0) + 1
    
    -- Notify player of addiction gain
    if Config.NotifyAddictionGain then
        local addictionLevel = math.floor(playerData.addictions[drugType])
        -- if addictionLevel >= Config.NotifyThreshold then
        TriggerClientEvent('QBCore:Notify', src, 'Your ' .. Config.DrugNames[drugType] .. ' addiction level: ' .. addictionLevel .. '%', 'warning')
        -- end
    end
    
    -- Sync with client
    TriggerClientEvent('nc-drugaddiction:client:SyncAddictions', src, playerData)
    
    -- Save to database
    exports['nc-drugaddiction']:SavePlayerAddictions(citizenid, playerData)
    
    if Config.Debug then
        print('[NC-DrugAddiction] ' .. citizenid .. ' used ' .. drugType .. ' - Addiction: ' .. playerData.addictions[drugType])
    end
end)

-- Initialize drug data helper (available server-side)
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

-- Narcan treatment - resets ALL addictions (universal cure)
RegisterNetEvent('nc-drugaddiction:server:UseNarcan', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
    local citizenid = Player.PlayerData.citizenid
    local playerData = exports['nc-drugaddiction']:GetPlayerAddictions(citizenid)
    
    -- Narcan is universal - resets all addictions
    if Config.NarcanResetsAllAddictions then
        for drugType, _ in pairs(playerData.addictions) do
            playerData.addictions[drugType] = 0
            playerData.recentUses[drugType] = {}
        end
        
        TriggerClientEvent('QBCore:Notify', src, 'Narcan administered. All addictions reset.', 'success')
    else
        -- Fallback: only reduce current addiction (legacy behavior)
        local highestAddiction = nil
        local highestLevel = 0
        
        for drugType, level in pairs(playerData.addictions) do
            if level > highestLevel then
                highestLevel = level
                highestAddiction = drugType
            end
        end
        
        if highestAddiction then
            playerData.addictions[highestAddiction] = math.max(0, playerData.addictions[highestAddiction] - 50)
        end
    end
    
    -- Sync with client
    TriggerClientEvent('nc-drugaddiction:client:SyncAddictions', src, playerData)
    TriggerClientEvent('nc-drugaddiction:client:NarcanUsed', src)
    
    -- Save to database
    exports['nc-drugaddiction']:SavePlayerAddictions(citizenid, playerData)
    
    if Config.Debug then
        print('[NC-DrugAddiction] Narcan used by: ' .. citizenid)
    end
end)

-- Rehab treatment - reduces all addictions
RegisterNetEvent('nc-drugaddiction:server:RehabTreatment', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
    local citizenid = Player.PlayerData.citizenid
    local playerData = exports['nc-drugaddiction']:GetPlayerAddictions(citizenid)
    
    -- Check if player can afford it
    if Player.PlayerData.money.cash < Config.RehabTreatmentCost then
        TriggerClientEvent('QBCore:Notify', src, 'You cannot afford rehab treatment ($' .. Config.RehabTreatmentCost .. ')', 'error')
        return
    end
    
    -- Deduct payment
    Player.Functions.RemoveMoney('cash', Config.RehabTreatmentCost, 'rehab-treatment')
    
    -- Reduce all addictions
    for drugType, _ in pairs(playerData.addictions) do
        playerData.addictions[drugType] = math.max(0, (playerData.addictions[drugType] or 0) - Config.RehabReductionAmount)
    end
    
    -- Reduce tolerance slightly
    for drugType, _ in pairs(playerData.tolerance) do
        playerData.tolerance[drugType] = math.max(0, (playerData.tolerance[drugType] or 0) - 10)
    end
    
    TriggerClientEvent('QBCore:Notify', src, 'Rehab treatment complete. Addictions reduced.', 'success')
    
    -- Sync with client
    TriggerClientEvent('nc-drugaddiction:client:SyncAddictions', src, playerData)
    
    -- Save to database
    exports['nc-drugaddiction']:SavePlayerAddictions(citizenid, playerData)
    
    if Config.Debug then
        print('[NC-DrugAddiction] Rehab treatment for: ' .. citizenid)
    end
end)

-- Alert EMS of overdose
RegisterNetEvent('nc-drugaddiction:server:AlertEMS', function(playerSrc, drugType)
    local Player = QBCore.Functions.GetPlayer(playerSrc)
    if not Player then return end
    
    local coords = GetEntityCoords(GetPlayerPed(playerSrc))
    local drugName = Config.DrugNames[drugType] or 'Unknown'
    
    -- Get all EMS players
    local players = QBCore.Functions.GetQBPlayers()
    for _, v in pairs(players) do
        if v.PlayerData.job.name == 'ambulance' or v.PlayerData.job.name == 'ems' then
            TriggerClientEvent('QBCore:Notify', v.PlayerData.source, 'OD Alert: ' .. Player.PlayerData.name .. ' has overdosed on ' .. drugName, 'error', 10000)
            TriggerClientEvent('nc-drugaddiction:client:ODBlip', v.PlayerData.source, coords, Player.PlayerData.name)
        end
    end
end)

-- Get addiction level for a specific drug
function GetAddictionLevel(citizenid, drugType)
    local playerData = exports['nc-drugaddiction']:GetPlayerAddictions(citizenid)
    return playerData.addictions[drugType] or 0
end

-- Get total addiction level across all drugs
function GetTotalAddictionLevel(citizenid)
    local playerData = exports['nc-drugaddiction']:GetPlayerAddictions(citizenid)
    local total = 0
    for _, level in pairs(playerData.addictions) do
        total = total + level
    end
    return math.min(100, total)
end

-- Export functions
exports('GetAddictionLevel', GetAddictionLevel)
exports('GetTotalAddictionLevel', GetTotalAddictionLevel)