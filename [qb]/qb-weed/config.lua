QBWeed = {}

QBWeed.Progress = { -- How much progress will be added to a healthy plant every GrowthTick
    min = 4,        -- Changing this will change growth time progression. Example 1 to 50 will give 50 progression in the 9.6 min cycle.
    max = 10,        -- See above, make sure max is more then min.
}


QBWeed.MinYield = 12
QBWeed.MaxYield = 24


QBWeed.ShowStages = true -- Show the stages of the plants
QBWeed.GrowthTick = 11.6  -- Amount of time (in mins) to increase plant growth &amp; update health / nutrition (every second tick)
QBWeed.FoodUsage = 8/3   -- Amount of food to use per-tick (2.67% - reduced from 4% for better balance)

-- NEW: Health-based yield system
QBWeed.YieldSystem = {
    enabled = true,              -- Enable health-based yield system
    perfectHealthThreshold = 70, -- Health % for 100% yields
    minimumHealthThreshold = 20, -- Health % for minimum yields
    minimumYieldPercent = 10,    -- Minimum yield % (at or below threshold)
}

-- NEW: Growth requirement (what stat must be >50% for growth)
QBWeed.GrowthRequirement = 'nutrition'  -- 'nutrition' or 'health' - nutrition stops growth if <50%

QBWeed.StageLabels = {
    [1] = 'Germination',
    [2] = 'Seedling',
    [3] = 'Vegetative',
    [4] = 'Budding',
    [5] = 'Pre-flowering',
    [6] = 'Flowering',
    [7] = 'Ready for harvest',
}

QBWeed.DefaultProps = {
    [1] = 'bkr_prop_weed_01_small_01c',
    [2] = 'bkr_prop_weed_01_small_01b',
    [3] = 'bkr_prop_weed_01_small_01a',
    [4] = 'bkr_prop_weed_med_01b',
    [5] = 'bkr_prop_weed_lrg_01a',
    [6] = 'bkr_prop_weed_lrg_01b',
    [7] = 'bkr_prop_weed_lrg_01b',
}

QBWeed.Plants = {
    fentanylleaf = {
        label = 'Opium Fentanyl',
        item = 'weed_fentanylleaf',
        stages = QBWeed.DefaultProps,
        highestStage = 7,
    },
    cokeleaf = {
        label = 'Erythroxylum Coca',
        item = 'weed_cokeleaf',
        stages = QBWeed.DefaultProps,
        highestStage = 7,
    },
    ogkush = {
        label = 'OGKush 2g',
        item = 'weed_ogkush',
        stages = QBWeed.DefaultProps,
        highestStage = 7,
    },
    amnesia = {
        label = 'Amnesia 2g',
        item = 'weed_amnesia',
        stages = QBWeed.DefaultProps,
        highestStage = 7,
    },
    skunk = {
        label = 'Skunk 2g',
        item = 'weed_skunk',
        stages = QBWeed.DefaultProps,
        highestStage = 7,
    },
    ak47 = {
        label = 'AK47 2g',
        item = 'weed_ak47',
        stages = QBWeed.DefaultProps,
        highestStage = 7,
    },
    purplehaze = {
        label = 'Purple Haze 2g',
        item = 'weed_purplehaze',
        stages = QBWeed.DefaultProps,
        highestStage = 7,
    },
    whitewidow = {
        label = 'White Widow 2g',
        item = 'weed_whitewidow',
        stages = QBWeed.DefaultProps,
        highestStage = 7,
    },
}
