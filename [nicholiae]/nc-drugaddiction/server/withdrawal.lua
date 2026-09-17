-- NC Drug Addiction System
-- Server-side withdrawal management

local QBCore = nil
local WithdrawalTimers = {}

CreateThread(function()
    Wait(1500)
    QBCore = exports['qb-core']:GetCoreObject()
end)

-- Get withdrawal stage based on time since last use
function GetWithdrawalStage(lastUseTime, drugType)
    if not lastUseTime or lastUseTime == 0 then
        return 0
    end
    
    local minutesSinceUse = (os.time() - lastUseTime) / 60
    
    if minutesSinceUse >= Config.WithdrawalThresholds.stage4 then
        return 4
    elseif minutesSinceUse >= Config.WithdrawalThresholds.stage3 then
        return 3
    elseif minutesSinceUse >= Config.WithdrawalThresholds.stage2 then
        return 2
    elseif minutesSinceUse >= Config.WithdrawalThresholds.stage1 then
        return 1
    end
    
    return 0
end

-- Check withdrawal status for all online players
CreateThread(function()
    while true do
        Wait(60000) -- Check every minute
        
        if not QBCore then goto continue end
        
        local players = QBCore.Functions.GetQBPlayers()
        
        for src, Player in pairs(players) do
            if Player then
                local citizenid = Player.PlayerData.citizenid
                local playerData = exports['nc-drugaddiction']:GetPlayerAddictions(citizenid)
                
                -- Check each drug for withdrawal
                for drugType, addictionLevel in pairs(playerData.addictions) do
                    if addictionLevel > 20 then -- Only check if addiction is significant
                        local lastUse = playerData.lastUse[drugType] or 0
                        local stage = GetWithdrawalStage(lastUse, drugType)
                        
                        if stage > 0 then
                            -- Calculate withdrawal intensity based on addiction level and stage
                            local intensity = (addictionLevel / 100) * (stage / 4)
                            local effects = Config.WithdrawalEffects[stage]
                            
                            -- Trigger client-side withdrawal effects
                            TriggerClientEvent('nc-drugaddiction:client:WithdrawalEffects', src, {
                                drugType = drugType,
                                stage = stage,
                                intensity = intensity,
                                effects = effects
                            })
                            
                            -- Notify player of withdrawal
                            if Config.NotifyWithdrawal then
                                local drugName = Config.DrugNames[drugType] or drugType
                                TriggerClientEvent('QBCore:Notify', src, 'You are experiencing ' .. drugName .. ' withdrawal (Stage ' .. stage .. ')', 'warning')
                            end
                        end
                    end
                end
            end
        end
        
        ::continue::
    end
end)

-- Check if player is in active withdrawal
function IsInWithdrawal(citizenid, drugType)
    local playerData = exports['nc-drugaddiction']:GetPlayerAddictions(citizenid)
    
    if drugType then
        local lastUse = playerData.lastUse[drugType] or 0
        local stage = GetWithdrawalStage(lastUse, drugType)
        return stage > 0, stage
    else
        -- Check all drugs
        for dtype, addictionLevel in pairs(playerData.addictions) do
            if addictionLevel > 20 then
                local lastUse = playerData.lastUse[dtype] or 0
                local stage = GetWithdrawalStage(lastUse, dtype)
                if stage > 0 then
                    return true, stage, dtype
                end
            end
        end
        return false, 0
    end
end

-- Get total withdrawal modifier (for health cap calculation)
function GetWithdrawalHealthModifier(citizenid)
    local playerData = exports['nc-drugaddiction']:GetPlayerAddictions(citizenid)
    local totalModifier = 0
    
    for drugType, addictionLevel in pairs(playerData.addictions) do
        if addictionLevel > 20 then
            local lastUse = playerData.lastUse[drugType] or 0
            local stage = GetWithdrawalStage(lastUse, drugType)
            
            if stage > 0 then
                local effects = Config.WithdrawalEffects[stage]
                if effects and effects.healthCapModifier then
                    totalModifier = totalModifier + effects.healthCapModifier
                end
            end
        end
    end
    
    return totalModifier
end

-- Export functions
exports('GetWithdrawalStage', GetWithdrawalStage)
exports('IsInWithdrawal', IsInWithdrawal)
exports('GetWithdrawalHealthModifier', GetWithdrawalHealthModifier)