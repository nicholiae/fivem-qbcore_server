-- NC Drug Addiction System
-- Server-side exports for external resource integration

local QBCore = nil

CreateThread(function()
    Wait(2000)
    QBCore = exports['qb-core']:GetCoreObject()
end)

-- Get player's addiction data for all drugs
-- Returns: table with addictions, tolerance, lastUse, totalUseCount
function GetPlayerDrugData(citizenid)
    local playerData = exports['nc-drugaddiction']:GetPlayerAddictions(citizenid)
    if not playerData then
        return nil
    end
    
    return {
        addictions = playerData.addictions or {},
        tolerance = playerData.tolerance or {},
        lastUse = playerData.lastUse or {},
        totalUseCount = playerData.totalUseCount or {}
    }
end

-- Get addiction level for a specific drug
-- Parameters: citizenid (string), drugType (string)
-- Returns: number (0-100)
function GetDrugAddictionLevel(citizenid, drugType)
    local playerData = exports['nc-drugaddiction']:GetPlayerAddictions(citizenid)
    if not playerData then return 0 end
    
    return playerData.addictions[drugType] or 0
end

-- Get tolerance level for a specific drug
-- Parameters: citizenid (string), drugType (string)
-- Returns: number (0-100)
function GetDrugToleranceLevel(citizenid, drugType)
    local playerData = exports['nc-drugaddiction']:GetPlayerAddictions(citizenid)
    if not playerData then return 0 end
    
    return playerData.tolerance[drugType] or 0
end

-- Get calculated health cap for a player
-- This considers all addiction levels and withdrawal effects
-- Parameters: citizenid (string)
-- Returns: number (health cap value)
function GetPlayerHealthCap(citizenid)
    local playerData = exports['nc-drugaddiction']:GetPlayerAddictions(citizenid)
    if not playerData then return Config.BaseMaxHealth end
    
    local totalAddiction = 0
    for _, level in pairs(playerData.addictions) do
        totalAddiction = totalAddiction + level
    end
    
    local healthCapReduction = totalAddiction * Config.HealthCapPerAddictionLevel
    local withdrawalModifier = exports['nc-drugaddiction']:GetWithdrawalHealthModifier(citizenid)
    
    local healthCap = Config.BaseMaxHealth - healthCapReduction + withdrawalModifier
    healthCap = math.max(Config.MinimumHealthCap, healthCap)
    
    return healthCap
end

-- Manually add addiction to a player (for external scripts)
-- Parameters: citizenid (string), drugType (string), amount (number)
function AddAddiction(citizenid, drugType, amount)
    local playerData = exports['nc-drugaddiction']:GetPlayerAddictions(citizenid)
    if not playerData then return false end
    
    -- Initialize if needed
    if not playerData.addictions[drugType] then
        playerData.addictions[drugType] = 0
    end
    
    playerData.addictions[drugType] = math.min(100, playerData.addictions[drugType] + amount)
    
    -- Save
    exports['nc-drugaddiction']:SavePlayerAddictions(citizenid, playerData)
    
    return true
end

-- Manually remove addiction from a player (for external scripts)
-- Parameters: citizenid (string), drugType (string), amount (number)
function RemoveAddiction(citizenid, drugType, amount)
    local playerData = exports['nc-drugaddiction']:GetPlayerAddictions(citizenid)
    if not playerData then return false end
    
    if playerData.addictions[drugType] then
        playerData.addictions[drugType] = math.max(0, playerData.addictions[drugType] - amount)
        
        -- Save
        exports['nc-drugaddiction']:SavePlayerAddictions(citizenid, playerData)
    end
    
    return true
end

-- Reset all addictions for a player (narcan effect)
-- Parameters: citizenid (string)
function ResetAllAddictions(citizenid)
    local playerData = exports['nc-drugaddiction']:GetPlayerAddictions(citizenid)
    if not playerData then return false end
    
    for drugType, _ in pairs(playerData.addictions) do
        playerData.addictions[drugType] = 0
        playerData.recentUses[drugType] = {}
    end
    
    -- Save
    exports['nc-drugaddiction']:SavePlayerAddictions(citizenid, playerData)
    
    return true
end

-- Check if player is currently in withdrawal
-- Parameters: citizenid (string), drugType (string - optional)
-- Returns: boolean, stage (number), drugType (string if not specified)
function CheckWithdrawal(citizenid, drugType)
    return exports['nc-drugaddiction']:IsInWithdrawal(citizenid, drugType)
end

-- Get list of all drugs player is addicted to (above threshold)
-- Parameters: citizenid (string), threshold (number - optional, default 0)
-- Returns: table of drug types with levels
function GetPlayerAddictionsList(citizenid, threshold)
    threshold = threshold or 0
    local playerData = exports['nc-drugaddiction']:GetPlayerAddictions(citizenid)
    if not playerData then return {} end
    
    local result = {}
    for drugType, level in pairs(playerData.addictions) do
        if level > threshold then
            result[drugType] = level
        end
    end
    
    return result
end

-- Calculate drug effect multiplier based on tolerance
-- Higher tolerance = reduced effects
-- Parameters: citizenid (string), drugType (string)
-- Returns: number (multiplier, 0.5 to 1.0)
function GetDrugEffectMultiplier(citizenid, drugType)
    local playerData = exports['nc-drugaddiction']:GetPlayerAddictions(citizenid)
    if not playerData then return 1.0 end
    
    local tolerance = playerData.tolerance[drugType] or 0
    local multiplier = 1.0 - (tolerance / 200) -- Max 50% reduction
    
    return math.max(0.5, multiplier)
end

-- Force save player data (useful before server restart)
-- Parameters: citizenid (string)
function ForceSavePlayerData(citizenid)
    local playerData = exports['nc-drugaddiction']:GetPlayerAddictions(citizenid)
    if playerData then
        exports['nc-drugaddiction']:SavePlayerAddictions(citizenid, playerData)
        return true
    end
    return false
end

-- Register item use from qb-smallresources or other resources
-- Call this when a player uses a drug item
-- Parameters: source (number), itemName (string)
function RegisterDrugUse(source, itemName)
    TriggerEvent('nc-drugaddiction:server:UseDrug', source, itemName)
end

-- Export all functions
exports('GetPlayerDrugData', GetPlayerDrugData)
exports('GetDrugAddictionLevel', GetDrugAddictionLevel)
exports('GetDrugToleranceLevel', GetDrugToleranceLevel)
exports('GetPlayerHealthCap', GetPlayerHealthCap)
exports('AddAddiction', AddAddiction)
exports('RemoveAddiction', RemoveAddiction)
exports('ResetAllAddictions', ResetAllAddictions)
exports('CheckWithdrawal', CheckWithdrawal)
exports('GetPlayerAddictionsList', GetPlayerAddictionsList)
exports('GetDrugEffectMultiplier', GetDrugEffectMultiplier)
exports('ForceSavePlayerData', ForceSavePlayerData)
exports('RegisterDrugUse', RegisterDrugUse)