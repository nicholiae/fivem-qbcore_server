-- NC Drug Addiction System
-- Client-side health cap enforcement

local QBCore = nil
local currentHealthCap = 200
local withdrawalHealthModifier = 0
local healthCapThreadRunning = false

CreateThread(function()
    Wait(1500)
    QBCore = exports['qb-core']:GetCoreObject()
    StartHealthCapThread()
end)

-- Calculate health cap based on addictions
function CalculateHealthCap()
    local addictionData = exports['nc-drugaddiction']:GetAllAddictionData()
    if not addictionData or not addictionData.addictions then
        return Config.BaseMaxHealth
    end
    
    local totalAddiction = 0
    for drugType, level in pairs(addictionData.addictions) do
        totalAddiction = totalAddiction + level
    end
    
    -- Calculate health cap reduction
    -- Each addiction point reduces max health by Config.HealthCapPerAddictionLevel
    local healthCapReduction = totalAddiction * Config.HealthCapPerAddictionLevel
    
    -- Apply withdrawal modifier
    local withdrawalMod = 0
    for drugType, level in pairs(addictionData.addictions) do
        if level > 20 then
            local lastUse = addictionData.lastUse and addictionData.lastUse[drugType] or 0
            local stage = GetWithdrawalStageLocal(lastUse)
            
            if stage > 0 and Config.WithdrawalEffects[stage] then
                withdrawalMod = withdrawalMod + (Config.WithdrawalEffects[stage].healthCapModifier or 0)
            end
        end
    end
    
    -- Calculate final health cap
    local healthCap = Config.BaseMaxHealth - healthCapReduction + withdrawalMod
    
    -- Enforce minimum health cap
    healthCap = math.max(Config.MinimumHealthCap, healthCap)
    
    return math.floor(healthCap)
end

-- Get withdrawal stage locally
function GetWithdrawalStageLocal(lastUseTime)
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

-- Start health cap enforcement thread
function StartHealthCapThread()
    if healthCapThreadRunning then return end
    healthCapThreadRunning = true
    
    CreateThread(function()
        while true do
            local ped = PlayerPedId()
            
            if IsPedHuman(ped) and GetPlayerPed(-1) == ped then
                -- Calculate current health cap
                currentHealthCap = CalculateHealthCap()
                
                -- Get current health
                local currentHealth = GetEntityHealth(ped)
                
                -- If health exceeds cap, reduce it
                if currentHealth > currentHealthCap then
                    -- Gradual reduction rather than instant snap
                    local newHealth = math.max(currentHealthCap, currentHealth - 1)
                    SetEntityHealth(ped, newHealth)
                end
                
                -- Visual indicator when health is capped
                if currentHealth >= currentHealthCap and currentHealthCap < Config.BaseMaxHealth then
                    -- Optionally show subtle indicator
                    -- This could be expanded to show on HUD/UI
                end
            end
            
            Wait(1000) -- Check every second
        end
    end)
end

-- Update health cap from server sync
RegisterNetEvent('nc-drugaddiction:client:UpdateHealthCap', function()
    currentHealthCap = CalculateHealthCap()
    
    if Config.Debug then
        print('[NC-DrugAddiction] Health cap updated: ' .. currentHealthCap)
    end
end)

-- Get current health cap (for UI/HUD)
function GetCurrentHealthCap()
    return currentHealthCap
end

-- Get health cap as percentage
function GetHealthCapPercentage()
    return math.floor((currentHealthCap / Config.BaseMaxHealth) * 100)
end

-- Check if health is capped
function IsHealthCapped()
    local ped = PlayerPedId()
    local currentHealth = GetEntityHealth(ped)
    return currentHealth >= currentHealthCap and currentHealthCap < Config.BaseMaxHealth
end

-- Get health deficit (how much health is lost due to addiction)
function GetHealthDeficit()
    return Config.BaseMaxHealth - currentHealthCap
end

-- Export functions
exports('GetCurrentHealthCap', GetCurrentHealthCap)
exports('GetHealthCapPercentage', GetHealthCapPercentage)
exports('IsHealthCapped', IsHealthCapped)
exports('GetHealthDeficit', GetHealthDeficit)
exports('CalculateHealthCap', CalculateHealthCap)