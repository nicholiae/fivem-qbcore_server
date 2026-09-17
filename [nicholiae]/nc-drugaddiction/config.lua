Config = {}

-- Enable/disable system
Config.Enabled = true

-- Debug mode
Config.Debug = true

-- Natural addiction decay (per hour)
Config.OnlineDecayRate = 2.0
Config.OfflineDecayRate = 0.1

-- Withdrawal timing (in minutes)
Config.WithdrawalThresholds = {
    stage1 = 60,    -- 1 hour
    stage2 = 180,   -- 3 hours
    stage3 = 360,   -- 6 hours
    stage4 = 720    -- 12 hours
}

-- Addiction gain per use
Config.AddictionGain = {
    alcohol = 5,
    weed = 3,
    cocaine = 10,
    crack = 15,
    meth = 12,
    ecstasy = 8,
    fentanyl = 20,
    lean = 7,
    oxycontin = 10,
    xanax = 3,
    morphine = 7
}

-- Tolerance gain per use (doubled)
Config.ToleranceGain = {
    alcohol = 4,
    weed = 2,
    cocaine = 8,
    crack = 12,
    meth = 10,
    ecstasy = 6,
    fentanyl = 16,
    lean = 4,
    oxycontin = 8,
    xanax = 4,
    morphine = 9
}

-- Overdose thresholds (uses within 10 minutes)
Config.OverdoseThresholds = {
    alcohol = 5,
    weed = 10,
    cocaine = 3,
    crack = 2,
    meth = 3,
    ecstasy = 4,
    fentanyl = 1,  -- Very easy to OD
    lean = 5,
    oxycontin = 3,
    xanax = 6,
    morphine = 3
}

-- Health cap settings
Config.BaseMaxHealth = 200
Config.MinimumHealthCap = 150  -- Minimum health is 150
Config.HealthCapPerAddictionLevel = 0.5  -- 0.5 health per addiction level point

-- Treatment settings
-- Narcan is universal - resets ALL addictions to 0
Config.NarcanResetsAllAddictions = true

Config.RehabTreatmentCost = 5000
Config.RehabReductionAmount = 50

-- Notify settings
Config.NotifyWithdrawal = true
Config.NotifyAddictionGain = true
Config.NotifyThreshold = 25  -- Notify when addiction reaches this level

-- Withdrawal effects per stage
Config.WithdrawalEffects = {
    [1] = {
        screenShake = 0.1,
        stressIncrease = 5,
        healthCapModifier = -5
    },
    [2] = {
        screenShake = 0.2,
        stressIncrease = 15,
        healthCapModifier = -10,
        speedMultiplier = 0.9
    },
    [3] = {
        screenShake = 0.4,
        stressIncrease = 25,
        healthCapModifier = -15,
        speedMultiplier = 0.8,
        staminaMultiplier = 0.7
    },
    [4] = {
        screenShake = 0.6,
        stressIncrease = 40,
        healthCapModifier = -25,
        speedMultiplier = 0.6,
        staminaMultiplier = 0.5,
        blackoutChance = 0.1  -- 10% chance per minute
    }
}

-- Drug display names for notifications
Config.DrugNames = {
    alcohol = 'Alcohol',
    weed = 'Marijuana',
    cocaine = 'Cocaine',
    crack = 'Crack Cocaine',
    meth = 'Methamphetamine',
    ecstasy = 'Ecstasy',
    fentanyl = 'Fentanyl',
    lean = 'Lean',
    oxycontin = 'Oxycontin',
    xanax = 'Xanax',
    morphine = 'Morphine'
}

-- Item names mapping to drug types
Config.ItemToDrug = {
    ['beer'] = 'alcohol',
    ['whiskey'] = 'alcohol',
    ['vodka'] = 'alcohol',
    ['wine'] = 'alcohol',
    ['joint'] = 'weed',
    ['weed_brick'] = 'weed',
    ['weed'] = 'weed',
    ['cokebaggy'] = 'cocaine',
    ['coke'] = 'cocaine',
    ['cocaine'] = 'cocaine',
    ['coke_brick'] = 'cocaine',
    ['coke_small_brick'] = 'cocaine',
    ['crack_baggy'] = 'crack',
    ['crack'] = 'crack',
    ['crack_brick'] = 'crack',
    ['crack_small_brick'] = 'crack',
    ['meth'] = 'meth',
    ['meth_brick'] = 'meth',
    ['xtcbaggy'] = 'ecstasy',
    ['ecstasy'] = 'ecstasy',
    ['xtc'] = 'ecstasy',
    ['fentanyl'] = 'fentanyl',
    ['lean'] = 'lean',
    ['oxy'] = 'oxycontin',
    ['oxycontin'] = 'oxycontin',
    ['oxycodone'] = 'oxycontin',
    ['xanax'] = 'xanax',
    ['morphine'] = 'morphine'
}