-- NC Drug Addiction System
-- Client-side visual and gameplay effects

local QBCore = nil
local currentEffects = {}
local effectThreadRunning = false

CreateThread(function()
    Wait(1500)
    QBCore = exports['qb-core']:GetCoreObject()
end)

-- Handle withdrawal effects from server
RegisterNetEvent('nc-drugaddiction:client:WithdrawalEffects', function(data)
    if not Config.Enabled then return end
    
    local drugType = data.drugType
    local stage = data.stage
    local intensity = data.intensity
    local effects = data.effects
    
    -- Store current effects
    currentEffects[drugType] = {
        stage = stage,
        intensity = intensity,
        effects = effects
    }
    
    -- Start effect thread if not running
    if not effectThreadRunning then
        StartEffectThread()
    end
end)

-- Start effect processing thread
function StartEffectThread()
    if effectThreadRunning then return end
    effectThreadRunning = true
    
    CreateThread(function()
        while next(currentEffects) ~= nil do
            local ped = PlayerPedId()
            local totalStress = 0
            local totalShake = 0
            local totalSpeedMult = 1.0
            local totalStaminaMult = 1.0
            local hasBlackout = false
            
            -- Aggregate all withdrawal effects
            for drugType, data in pairs(currentEffects) do
                local effects = data.effects
                local intensity = data.intensity
                
                -- Screen shake
                if effects.screenShake then
                    totalShake = totalShake + (effects.screenShake * intensity)
                end
                
                -- Stress increase
                if effects.stressIncrease then
                    totalStress = totalStress + (effects.stressIncrease * intensity)
                end
                
                -- Speed multiplier (take minimum)
                if effects.speedMultiplier then
                    totalSpeedMult = math.min(totalSpeedMult, effects.speedMultiplier)
                end
                
                -- Stamina multiplier (take minimum)
                if effects.staminaMultiplier then
                    totalStaminaMult = math.min(totalStaminaMult, effects.staminaMultiplier)
                end
                
                -- Blackout chance
                if effects.blackoutChance and effects.blackoutChance > 0 then
                    if math.random() < (effects.blackoutChance * intensity) then
                        hasBlackout = true
                    end
                end
            end
            
            -- Apply screen shake
            if totalShake > 0 then
                ShakeGameplayCam('DRUNK_SHAKE', totalShake)
            end
            
            -- Apply stress
            if totalStress > 0 then
                -- Integrate with qb-smallresources stress system
                local currentStress = 0
                TriggerEvent('qb-smallresources:getStress', function(stress)
                    currentStress = stress or 0
                end)
                
                local newStress = math.min(100, currentStress + (totalStress * 0.1))
                TriggerEvent('qb-smallresources:updateStress', newStress)
            end
            
            -- Apply speed modifier
            if totalSpeedMult < 1.0 then
                SetPedMoveRateOverride(ped, totalSpeedMult)
            end
            
            -- Apply stamina modifier
            if totalStaminaMult < 1.0 then
                local stamina = GetPlayerStamina(PlayerId())
                SetPlayerStamina(PlayerId(), stamina * totalStaminaMult)
            end
            
            -- Handle blackout
            if hasBlackout then
                DoBlackoutEffect()
            end
            
            Wait(60000) -- Apply effects every minute
        end
        
        effectThreadRunning = false
    end)
end

-- Blackout effect
function DoBlackoutEffect()
    local ped = PlayerPedId()
    
    -- Fade out
    DoScreenFadeOut(1000)
    Wait(1000)
    
    -- Ragdoll
    SetPedToRagdoll(ped, 5000, 5000, 0, false, false, false)
    
    -- Wait a moment
    Wait(3000)
    
    -- Fade in
    DoScreenFadeIn(1000)
    
    -- Notification
    QBCore.Functions.Notify('You blacked out from withdrawal...', 'warning', 5000)
end

-- Drug high effects (triggered when using drugs)
function ApplyDrugHighEffect(drugType, duration)
    local effectDuration = duration or 60000 -- Default 1 minute
    
    -- Drug-specific effects
    if drugType == 'cocaine' or drugType == 'crack' then
        -- Energy/stimulant effect
        RequestAnimSet('move_m@hurry_butch@b')
        while not HasAnimSetLoaded('move_m@hurry_butch@b') do
            Wait(100)
        end
        SetPedMovementClipset(PlayerPedId(), 'move_m@hurry_butch@b', 1.0)
        
        -- Increase stamina
        ResetPlayerStamina(PlayerId())
        SetRunSprintMultiplierForPlayer(PlayerId(), 1.2)
        
        SetTimeout(effectDuration, function()
            ResetPedMovementClipset(PlayerPedId(), 0)
            SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
        end)
        
    elseif drugType == 'weed' then
        -- Relaxing effect
        AnimpostfxPlay('DrugsMichaelAliensFightIn', effectDuration, false)
        SetPedMotionBlur(PlayerPedId(), true)
        
        SetTimeout(effectDuration, function()
            AnimpostfxStop('DrugsMichaelAliensFightIn')
            SetPedMotionBlur(PlayerPedId(), false)
        end)
        
    elseif drugType == 'meth' then
        -- Intense stimulant
        ShakeGameplayCam('DRUNK_SHAKE', 0.5)
        SetRunSprintMultiplierForPlayer(PlayerId(), 1.3)
        SetPlayerHealthRechargeMultiplier(PlayerId(), 1.5)
        
        SetTimeout(effectDuration, function()
            StopGameplayCamShaking(true)
            SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
            SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
        end)
        
    elseif drugType == 'fentanyl' then
        -- Very intense, potentially dangerous
        AnimpostfxPlay('DrugsMichaelAliensFightIn', effectDuration, false)
        ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 0.3)
        
        -- Slow movement
        SetPedMoveRateOverride(PlayerPedId(), 0.7)
        
        SetTimeout(effectDuration, function()
            AnimpostfxStop('DrugsMichaelAliensFightIn')
            StopGameplayCamShaking(true)
            SetPedMoveRateOverride(PlayerPedId(), 1.0)
        end)
        
    elseif drugType == 'alcohol' then
        -- Drunk effect
        RequestAnimSet('move_m@drunk@verydrunk')
        while not HasAnimSetLoaded('move_m@drunk@verydrunk') do
            Wait(100)
        end
        SetPedMovementClipset(PlayerPedId(), 'move_m@drunk@verydrunk', 1.0)
        ShakeGameplayCam('DRUNK_SHAKE', 0.3)
        
        SetTimeout(effectDuration, function()
            ResetPedMovementClipset(PlayerPedId(), 0)
            StopGameplayCamShaking(true)
        end)
        
    elseif drugType == 'ecstasy' then
        -- Euphoric effect
        AnimpostfxPlay('DrugsMichaelAliensFightIn', effectDuration, false)
        SetRunSprintMultiplierForPlayer(PlayerId(), 1.1)
        
        SetTimeout(effectDuration, function()
            AnimpostfxStop('DrugsMichaelAliensFightIn')
            SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
        end)
        
    elseif drugType == 'lean' then
        -- Sedative effect
        ShakeGameplayCam('DRUNK_SHAKE', 0.2)
        SetPedMoveRateOverride(PlayerPedId(), 0.85)
        
        SetTimeout(effectDuration, function()
            StopGameplayCamShaking(true)
            SetPedMoveRateOverride(PlayerPedId(), 1.0)
        end)
        
    elseif drugType == 'oxycontin' then
        -- Pain relief, sedative
        AnimpostfxPlay('DrugsMichaelAliensFightIn', effectDuration * 0.5, false)
        SetPlayerHealthRechargeMultiplier(PlayerId(), 2.0)
        
        SetTimeout(effectDuration, function()
            AnimpostfxStop('DrugsMichaelAliensFightIn')
            SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
        end)
    end
end

-- Clear all effects (used when narcan is administered)
RegisterNetEvent('nc-drugaddiction:client:ClearWithdrawal', function()
    currentEffects = {}
    
    -- Stop all visual effects
    StopGameplayCamShaking(true)
    AnimpostfxStopAll()
    ResetPedMovementClipset(PlayerPedId(), 0)
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    SetPedMoveRateOverride(PlayerPedId(), 1.0)
    
    QBCore.Functions.Notify('The withdrawal symptoms have subsided...', 'success', 5000)
end)

-- Register drug use with effects
RegisterNetEvent('nc-drugaddiction:client:DrugUsed', function(drugType, addictionLevel)
    -- Apply high effect
    local tolerance = exports['nc-drugaddiction']:GetToleranceLevel(drugType)
    local effectDuration = 60000 * (1 - tolerance / 200) -- Reduced duration with tolerance
    
    ApplyDrugHighEffect(drugType, effectDuration)
end)

-- Export functions
exports('ApplyDrugHighEffect', ApplyDrugHighEffect)