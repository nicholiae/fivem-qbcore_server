-- NC Drug Addiction System
-- Shared drug definitions and utilities

-- Drug categories
DrugCategories = {
    stimulant = {
        'cocaine',
        'crack', 
        'meth',
        'ecstasy'
    },
    depressant = {
        'alcohol',
        'lean',
        'oxycontin'
    },
    hallucinogen = {
        'weed',
        'ecstasy'
    },
    opioid = {
        'fentanyl',
        'oxycontin'
    }
}

-- Drug effect profiles
DrugEffectProfiles = {
    cocaine = {
        category = 'stimulant',
        effectDuration = 60000,
        healthImpact = -2,
        staminaModifier = 1.3,
        armorModifier = 0,
        stressModifier = 15,
        hungerModifier = -10,
        thirstModifier = -15
    },
    crack = {
        category = 'stimulant',
        effectDuration = 45000,
        healthImpact = -5,
        staminaModifier = 1.4,
        armorModifier = 0,
        stressModifier = 25,
        hungerModifier = -15,
        thirstModifier = -20
    },
    meth = {
        category = 'stimulant',
        effectDuration = 120000,
        healthImpact = -3,
        staminaModifier = 1.5,
        armorModifier = 0,
        stressModifier = 30,
        hungerModifier = -20,
        thirstModifier = -25
    },
    ecstasy = {
        category = 'stimulant',
        effectDuration = 90000,
        healthImpact = -2,
        staminaModifier = 1.2,
        armorModifier = 0,
        stressModifier = -10, -- Reduces stress temporarily
        hungerModifier = -5,
        thirstModifier = -20
    },
    weed = {
        category = 'hallucinogen',
        effectDuration = 60000,
        healthImpact = 0,
        staminaModifier = 0.9,
        armorModifier = 0,
        stressModifier = -20,
        hungerModifier = 15, -- Munchies
        thirstModifier = -5
    },
    alcohol = {
        category = 'depressant',
        effectDuration = 45000,
        healthImpact = -1,
        staminaModifier = 0.85,
        armorModifier = 0,
        stressModifier = -15,
        hungerModifier = -5,
        thirstModifier = -30
    },
    lean = {
        category = 'depressant',
        effectDuration = 75000,
        healthImpact = -2,
        staminaModifier = 0.8,
        armorModifier = 0,
        stressModifier = -25,
        hungerModifier = 5,
        thirstModifier = -15
    },
    fentanyl = {
        category = 'opioid',
        effectDuration = 30000,
        healthImpact = -10,
        staminaModifier = 0.6,
        armorModifier = 0,
        stressModifier = -30,
        hungerModifier = -10,
        thirstModifier = -10,
        overdoseRisk = 0.8
    },
    oxycontin = {
        category = 'opioid',
        effectDuration = 60000,
        healthImpact = -3,
        staminaModifier = 0.85,
        armorModifier = 0,
        stressModifier = -20,
        hungerModifier = -5,
        thirstModifier = -10
    }
}

-- Get drug category
function GetDrugCategory(drugType)
    for category, drugs in pairs(DrugCategories) do
        for _, drug in ipairs(drugs) do
            if drug == drugType then
                return category
            end
        end
    end
    return 'unknown'
end

-- Get drug effect profile
function GetDrugEffectProfile(drugType)
    return DrugEffectProfiles[drugType] or nil
end

-- Calculate effect modifier based on tolerance
function CalculateToleranceModifier(toleranceLevel)
    -- Higher tolerance = reduced effects
    -- At 100 tolerance, effects are 50% of base
    local modifier = 1.0 - (toleranceLevel / 200)
    return math.max(0.5, modifier)
end

-- Check if drug is dangerous (high overdose risk)
function IsDangerousDrug(drugType)
    local profile = DrugEffectProfiles[drugType]
    if profile and profile.overdoseRisk and profile.overdoseRisk > 0.5 then
        return true
    end
    
    -- Check if addiction level is high
    local addictionLevel = exports['nc-drugaddiction']:GetDrugAddictionLevel(nil, drugType) or 0
    return addictionLevel > 75
end

-- Get total addiction severity rating
function GetAddictionSeverity(addictionLevel)
    if addictionLevel >= 75 then
        return 'severe'
    elseif addictionLevel >= 50 then
        return 'moderate'
    elseif addictionLevel >= 25 then
        return 'mild'
    else
        return 'none'
    end
end

-- Export shared functions
exports('GetDrugCategory', GetDrugCategory)
exports('GetDrugEffectProfile', GetDrugEffectProfile)
exports('CalculateToleranceModifier', CalculateToleranceModifier)
exports('IsDangerousDrug', IsDangerousDrug)
exports('GetAddictionSeverity', GetAddictionSeverity)