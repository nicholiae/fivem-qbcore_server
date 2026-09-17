Config = {}
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add setr UseTarget true)
Config.MinimalDoctors = 10                                    -- How many players with the ambulance job to prevent the hospital check-in system from being used
Config.DocCooldown = 1                                       -- Cooldown between doctor calls allowed, in minutes
Config.WipeInventoryOnRespawn = false                         -- Enable or disable removing all the players items when they respawn at the hospital
Config.Helicopter = 'polmav'                                 -- Helicopter model that players with the ambulance job can use
Config.BillCost = 2000                                       -- Price that players are charged for using the hospital check-in system
Config.DeathTime = 600                                       -- How long the timer is for players to bleed out completely and respawn at the hospital
Config.ReviveInterval = 600                                  -- How long the timer is for players to revive a player in laststand
Config.MinimumRevive = 600                                   -- How long the timer is for players to revive a player in laststand
Config.PainkillerInterval = 60                               -- Set the length of time painkillers last (per one)
Config.HealthDamage = 5                                      -- Minumum damage done to health before checking for injuries
Config.ArmorDamage = 5                                       -- Minumum damage done to armor before checking for injuries
Config.ForceInjury = 35                                      -- Maximum amount of damage a player can take before limb damage & effects are forced to occur
Config.AlwaysBleedChance = 70                                -- Set the chance out of 100 that if a player is hit with a weapon, that also has a random chance, it will cause bleeding
Config.MessageTimer = 12                                     -- How long it will take to display limb/bleed message
Config.AIHealTimer = 20                                      -- How long it will take to be healed after checking in, in seconds
Config.BleedTickRate = 30                                    -- How much time, in seconds, between bleed ticks
Config.BleedMovementTick = 10                                -- How many seconds is taken away from the bleed tick rate if the player is walking, jogging, or sprinting
Config.BleedMovementAdvance = 3                              -- How much time moving while bleeding adds
Config.BleedTickDamage = 8                              	-- How much time moving while bleeding adds
Config.DrugDurations = 90                                   -- The base damage that is multiplied by bleed level everytime a bleed tick occurs
Config.FadeOutTimer = 2                                      -- How many bleed ticks occur before fadeout happens
Config.BlackoutTimer = 10                                    -- How many bleed ticks occur before blacking out
Config.AdvanceBleedTimer = 10                                -- How many bleed ticks occur before bleed level increases
Config.HeadInjuryTimer = 30                                  -- How much time, in seconds, do head injury effects chance occur
Config.ArmInjuryTimer = 30                                   -- How much time, in seconds, do arm injury effects chance occur
Config.LegInjuryTimer = 15                                   -- How much time, in seconds, do leg injury effects chance occur
Config.HeadInjuryChance = 25                                 -- The chance, in percent, that head injury side-effects get applied
Config.LegInjuryChance = {                                   -- The chance, in percent, that leg injury side-effects get applied
    Running = 50,
    Walking = 15
}
Config.BandageHealAmount = 25
Config.LicenseRank = 4

Config.IfakHeal = math.random(45,75)
Config.MajorArmoredBleedChance = 45 -- The chance, in percent, that a player will get a bleed effect when taking heavy damage while wearing armor
Config.MaxInjuryChanceMulti = 3     -- How many times the HealthDamage value above can divide into damage taken before damage is forced to be applied
Config.DamageMinorToMajor = 35      -- How much damage would have to be applied for a minor weapon to be considered a major damage event. Put this at 100 if you want to disable it
Config.AlertShowInfo = 2            -- How many injuries a player must have before being alerted about them
Config.Boat = 'policeboatrb'

Config.Locations = {                -- Edit the various interaction points for players or create new ones
    ['checking'] = {
        vector3(308.19, -595.35, 43.29),
        vector3(-254.54, 6331.78, 32.43), -- paleto
		vector3(-677.3, 325.48, 83.08), -- 6187
    },
    ['duty'] = {
        -- vector3(311.18, -599.25, 43.29),
        -- vector3(-254.88, 6324.5, 32.58), -- paleto
    },
    ['boat'] = {
        vector4(-785.34, -1512.0, -0.04, 290.99), -- DAVIS
        -- [2] = vector4(183.34, -1661.44, 29.8, 239.46), -- DAVIS
        -- [3] = vector4(1198.45, -1548.8, 39.4, 12.04), -- FS7
    },
    ['vehicle'] = {
        -- vector4(294.578, -574.761, 43.179, 35.79),
        -- vector4(-234.28, 6329.16, 32.15, 222.5), -- paleto
    },
    ['helicopter'] = {
        -- vector4(351.58, -587.45, 74.16, 160.5),
        -- vector4(-475.43, 5988.353, 31.716, 31.34), -- paleto
    },
    ['roof'] = {
        -- vector4(338.5, -583.85, 74.16, 245.5),
    },
    ['main'] = {
        -- vector3(298.74, -599.33, 43.29),
    },
    ['stash'] = {
        -- vector3(309.78, -596.6, 43.29),
    },
    ['beds'] = {
        { coords = vector4(353.1, -584.6, 43.11, 152.08),    taken = false, model = 1631638868 },
        { coords = vector4(356.79, -585.86, 43.11, 152.08),  taken = false, model = 1631638868 },
        { coords = vector4(354.12, -593.12, 43.1, 336.32),   taken = false, model = 2117668672 },
        { coords = vector4(350.79, -591.8, 43.1, 336.32),    taken = false, model = 2117668672 },
        { coords = vector4(346.99, -590.48, 43.1, 336.32),   taken = false, model = 2117668672 },
        { coords = vector4(360.32, -587.19, 43.02, 152.08),  taken = false, model = -1091386327 },
        { coords = vector4(349.82, -583.33, 43.02, 152.08),  taken = false, model = -1091386327 },
        { coords = vector4(326.98, -576.17, 43.02, 152.08),  taken = false, model = -1091386327 },
        -- - paleto
        { coords = vector4(-252.43, 6312.25, 32.34, 313.48), taken = false, model = 2117668672 },
        { coords = vector4(-247.04, 6317.95, 32.34, 134.64), taken = false, model = 2117668672 },
        { coords = vector4(-255.98, 6315.67, 32.34, 313.91), taken = false, model = 2117668672 },
		--6187
        { coords = vector4(-669.46, 343.63, 82.85, 355.0), taken = false, model = 1631638868 },
        { coords = vector4(-669.75, 339.25, 82.99, 175.0), taken = false, model = 1631638868 },
        { coords = vector4(-665.85, 342.94, 83.08, 355.0), taken = false, model = 1631638868 },
        { coords = vector4(-662.3, 343.05, 82.98, 355.0), taken = false, model = 1631638868 },
        { coords = vector4(-655.19, 341.3, 82.95, 265.0), taken = false, model = 1631638868 },
        { coords = vector4(-654.84, 337.58, 82.9, 265.0), taken = false, model = 1631638868 },
        { coords = vector4(-656.06, 334.96, 82.88, 175.0), taken = false, model = 1631638868 },
        { coords = vector4(-659.66, 335.19, 82.87, 175.0), taken = false, model = 1631638868 },
        { coords = vector4(-663.46, 335.56, 82.82, 175.0), taken = false, model = 1631638868 },
    },
    ['jailbeds'] = {
        { coords = vector4(1761.96, 2597.74, 45.66, 270.14), taken = false, model = 2117668672 },
        { coords = vector4(1761.96, 2591.51, 45.66, 269.8),  taken = false, model = 2117668672 },
        { coords = vector4(1771.8, 2598.02, 45.66, 89.05),   taken = false, model = 2117668672 },
        { coords = vector4(1771.85, 2591.85, 45.66, 91.51),  taken = false, model = 2117668672 },
    },
    ['hospital'] = {
        {
            ['name'] = Lang:t('info.pb_hospital'),
            ['location'] = vector3(308.36, -595.25, 43.28),
            ['beds'] = {
                { coords = vector4(353.1, -584.6, 43.11, 152.08),   taken = false, model = 1631638868 },
                { coords = vector4(356.79, -585.86, 43.11, 152.08), taken = false, model = 1631638868 },
                { coords = vector4(354.12, -593.12, 43.1, 336.32),  taken = false, model = 2117668672 },
                { coords = vector4(350.79, -591.8, 43.1, 336.32),   taken = false, model = 2117668672 },
                { coords = vector4(346.99, -590.48, 43.1, 336.32),  taken = false, model = 2117668672 },
                { coords = vector4(360.32, -587.19, 43.02, 152.08), taken = false, model = -1091386327 },
                { coords = vector4(349.82, -583.33, 43.02, 152.08), taken = false, model = -1091386327 },
                { coords = vector4(326.98, -576.17, 43.02, 152.08), taken = false, model = -1091386327 },
            },
        },
        {
            ['name'] = Lang:t('info.paleto_hospital'),
            ['location'] = vector3(-254.54, 6331.78, 32.43),
            ['beds'] = {
                { coords = vector4(-252.43, 6312.25, 32.34, 313.48), taken = false, model = 2117668672 },
                { coords = vector4(-247.04, 6317.95, 32.34, 134.64), taken = false, model = 2117668672 },
                { coords = vector4(-255.98, 6315.67, 32.34, 313.91), taken = false, model = 2117668672 },
            },
        },
        {
            ['name'] = 'StarValley Emergency Care',
            ['location'] = vector3(-677.35, 325.36, 83.08),
            ['beds'] = {
				{ coords = vector4(-669.46, 343.63, 82.85, 355.0), taken = false, model = 1631638868 },
				{ coords = vector4(-669.75, 339.25, 82.99, 175.0), taken = false, model = 1631638868 },
				{ coords = vector4(-665.85, 342.94, 83.08, 355.0), taken = false, model = 1631638868 },
				{ coords = vector4(-662.3, 343.05, 82.98, 355.0), taken = false, model = 1631638868 },
				{ coords = vector4(-655.19, 341.3, 82.95, 265.0), taken = false, model = 1631638868 },
				{ coords = vector4(-654.84, 337.58, 82.9, 265.0), taken = false, model = 1631638868 },
				{ coords = vector4(-656.06, 334.96, 82.88, 175.0), taken = false, model = 1631638868 },
				{ coords = vector4(-659.66, 335.19, 82.87, 175.0), taken = false, model = 1631638868 },
				{ coords = vector4(-663.46, 335.56, 82.82, 175.0), taken = false, model = 1631638868 },
            },
        },
    },
    ['stations'] = {
        { label = Lang:t('info.pb_hospital'), coords = vector3(304.27, -600.33, 43.28) },
        { label = 'StarValley Emergency Care', coords = vector3(-663.77, 337.67, 83.08) }
    }
}

Config.AuthorizedVehicles = { -- Grade is key, don't add same vehicle in multiple grades. Higher rank can see lower
    [0] = {
        ['ambulance'] = 'Ambulance',
        ['ambulance1'] = 'Ambulance1',
        ['Ambulance_Dodge_RAM'] = 'Dodge Ram Ambulance',
        ['BMW-x5_medic'] = 'BMW Medic',
        ['emsbmwm7'] = 'BMW EMS',
        ['RoyalYamahaEMS_white'] = 'Yamaha EMS',
        ['SHEL'] = 'SHEL',
        ['22g63'] = 'Ambulance3',
        ['dlswift'] = 'Swift Ambulance',
        ['dlissiamb'] = 'Ambulance4',
        ['dlgranger'] = 'Ranger Ambulance',
        ['dlemsb'] = 'EMS B',
        ['dlbuffalo'] = 'Buffalo Ambulance',
        ['dlamb'] = 'LAMB Ambulance',
        ['emsnspeedo'] = 'Speedo Ambulance'
    }
}

Config.WeaponClasses = { -- Define gta weapon classe numbers
    ['SMALL_CALIBER'] = 1,
    ['MEDIUM_CALIBER'] = 2,
    ['HIGH_CALIBER'] = 3,
    ['SHOTGUN'] = 4,
    ['CUTTING'] = 5,
    ['LIGHT_IMPACT'] = 6,
    ['HEAVY_IMPACT'] = 7,
    ['EXPLOSIVE'] = 8,
    ['FIRE'] = 9,
    ['SUFFOCATING'] = 10,
    ['OTHER'] = 11,
    ['WILDLIFE'] = 12,
    ['NOTHING'] = 13
}

Config.MinorInjurWeapons = { -- Define which weapons cause small injuries
    [Config.WeaponClasses['SMALL_CALIBER']] = true,
    [Config.WeaponClasses['MEDIUM_CALIBER']] = true,
    [Config.WeaponClasses['CUTTING']] = true,
    [Config.WeaponClasses['WILDLIFE']] = true,
    [Config.WeaponClasses['OTHER']] = true,
    [Config.WeaponClasses['LIGHT_IMPACT']] = true,
}

Config.MajorInjurWeapons = { -- Define which weapons cause large injuries
    [Config.WeaponClasses['HIGH_CALIBER']] = true,
    [Config.WeaponClasses['HEAVY_IMPACT']] = true,
    [Config.WeaponClasses['SHOTGUN']] = true,
    [Config.WeaponClasses['EXPLOSIVE']] = true,
}

Config.AlwaysBleedChanceWeapons = { -- Define which weapons will always cause bleedign
    [Config.WeaponClasses['SMALL_CALIBER']] = true,
    [Config.WeaponClasses['MEDIUM_CALIBER']] = true,
    [Config.WeaponClasses['CUTTING']] = true,
    [Config.WeaponClasses['WILDLIFE']] = false,
}

Config.ForceInjuryWeapons = { -- Define which weapons will always cause injuries
    [Config.WeaponClasses['HIGH_CALIBER']] = true,
    [Config.WeaponClasses['HEAVY_IMPACT']] = true,
    [Config.WeaponClasses['EXPLOSIVE']] = true,
}

Config.CriticalAreas = { -- Define body areas that will always cause bleeding if wearing armor or not
    ['UPPER_BODY'] = { armored = false },
    ['LOWER_BODY'] = { armored = true },
    ['SPINE'] = { armored = true },
}

Config.StaggerAreas = { -- Define body areas that will always cause staggering if wearing armor or not
    ['SPINE'] = { armored = true, major = 60, minor = 30 },
    ['UPPER_BODY'] = { armored = false, major = 60, minor = 30 },
    ['LLEG'] = { armored = true, major = 100, minor = 85 },
    ['RLEG'] = { armored = true, major = 100, minor = 85 },
    ['LFOOT'] = { armored = true, major = 100, minor = 100 },
    ['RFOOT'] = { armored = true, major = 100, minor = 100 },
}

Config.WoundStates = { -- Translate wound alerts
    Lang:t('states.irritated'),
    Lang:t('states.quite_painful'),
    Lang:t('states.painful'),
    Lang:t('states.really_painful'),
}

Config.BleedingStates = { -- Translate bleeding alerts
    { label = Lang:t('states.little_bleed') },
    { label = Lang:t('states.bleed') },
    { label = Lang:t('states.lot_bleed') },
    { label = Lang:t('states.big_bleed') },
}

Config.MovementRate = { -- Set the player movement rate based on the level of damage they have
    0.98,
    0.96,
    0.94,
    0.92,
}

Config.Bones = { -- Correspond bone hash numbers to their label
    [0]     = 'NONE',
    [31085] = 'HEAD',
    [31086] = 'HEAD',
    [39317] = 'NECK',
    [57597] = 'SPINE',
    [23553] = 'SPINE',
    [24816] = 'SPINE',
    [24817] = 'SPINE',
    [24818] = 'SPINE',
    [10706] = 'UPPER_BODY',
    [64729] = 'UPPER_BODY',
    [11816] = 'LOWER_BODY',
    [45509] = 'LARM',
    [61163] = 'LARM',
    [18905] = 'LHAND',
    [4089]  = 'LFINGER',
    [4090]  = 'LFINGER',
    [4137]  = 'LFINGER',
    [4138]  = 'LFINGER',
    [4153]  = 'LFINGER',
    [4154]  = 'LFINGER',
    [4169]  = 'LFINGER',
    [4170]  = 'LFINGER',
    [4185]  = 'LFINGER',
    [4186]  = 'LFINGER',
    [26610] = 'LFINGER',
    [26611] = 'LFINGER',
    [26612] = 'LFINGER',
    [26613] = 'LFINGER',
    [26614] = 'LFINGER',
    [58271] = 'LLEG',
    [63931] = 'LLEG',
    [2108]  = 'LFOOT',
    [14201] = 'LFOOT',
    [40269] = 'RARM',
    [28252] = 'RARM',
    [57005] = 'RHAND',
    [58866] = 'RFINGER',
    [58867] = 'RFINGER',
    [58868] = 'RFINGER',
    [58869] = 'RFINGER',
    [58870] = 'RFINGER',
    [64016] = 'RFINGER',
    [64017] = 'RFINGER',
    [64064] = 'RFINGER',
    [64065] = 'RFINGER',
    [64080] = 'RFINGER',
    [64081] = 'RFINGER',
    [64096] = 'RFINGER',
    [64097] = 'RFINGER',
    [64112] = 'RFINGER',
    [64113] = 'RFINGER',
    [36864] = 'RLEG',
    [51826] = 'RLEG',
    [20781] = 'RFOOT',
    [52301] = 'RFOOT',
}

Config.BoneIndexes = { -- Correspond bone labels to their hash number
    ['NONE'] = 0,
    -- ['HEAD'] = 31085,
    ['HEAD'] = 31086,
    ['NECK'] = 39317,
    -- ['SPINE'] = 57597,
    -- ['SPINE'] = 23553,
    -- ['SPINE'] = 24816,
    -- ['SPINE'] = 24817,
    ['SPINE'] = 24818,
    -- ['UPPER_BODY'] = 10706,
    ['UPPER_BODY'] = 64729,
    ['LOWER_BODY'] = 11816,
    -- ['LARM'] = 45509,
    ['LARM'] = 61163,
    ['LHAND'] = 18905,
    -- ['LFINGER'] = 4089,
    -- ['LFINGER'] = 4090,
    -- ['LFINGER'] = 4137,
    -- ['LFINGER'] = 4138,
    -- ['LFINGER'] = 4153,
    -- ['LFINGER'] = 4154,
    -- ['LFINGER'] = 4169,
    -- ['LFINGER'] = 4170,
    -- ['LFINGER'] = 4185,
    -- ['LFINGER'] = 4186,
    -- ['LFINGER'] = 26610,
    -- ['LFINGER'] = 26611,
    -- ['LFINGER'] = 26612,
    -- ['LFINGER'] = 26613,
    ['LFINGER'] = 26614,
    -- ['LLEG'] = 58271,
    ['LLEG'] = 63931,
    -- ['LFOOT'] = 2108,
    ['LFOOT'] = 14201,
    -- ['RARM'] = 40269,
    ['RARM'] = 28252,
    ['RHAND'] = 57005,
    -- ['RFINGER'] = 58866,
    -- ['RFINGER'] = 58867,
    -- ['RFINGER'] = 58868,
    -- ['RFINGER'] = 58869,
    -- ['RFINGER'] = 58870,
    -- ['RFINGER'] = 64016,
    -- ['RFINGER'] = 64017,
    -- ['RFINGER'] = 64064,
    -- ['RFINGER'] = 64065,
    -- ['RFINGER'] = 64080,
    -- ['RFINGER'] = 64081,
    -- ['RFINGER'] = 64096,
    -- ['RFINGER'] = 64097,
    -- ['RFINGER'] = 64112,
    ['RFINGER'] = 64113,
    -- ['RLEG'] = 36864,
    ['RLEG'] = 51826,
    -- ['RFOOT'] = 20781,
    ['RFOOT'] = 52301,
}

Config.Weapons = { -- Correspond weapon names to their class number
    [`WEAPON_STUNGUN`] = Config.WeaponClasses['NONE'],
    [`WEAPON_STUNGUN_MP`] = Config.WeaponClasses['NONE'],
    --[[ Small Caliber ]] --
    [`WEAPON_PISTOL`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_COMBATPISTOL`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_APPISTOL`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_COMBATPDW`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_MACHINEPISTOL`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_MICROSMG`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_MINISMG`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_PISTOL_MK2`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_SNSPISTOL`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_SNSPISTOL_MK2`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_VINTAGEPISTOL`] = Config.WeaponClasses['SMALL_CALIBER'],

    --[[ Medium Caliber ]] --
    [`WEAPON_ADVANCEDRIFLE`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_ASSAULTSMG`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_BULLPUPRIFLE`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_BULLPUPRIFLE_MK2`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_CARBINERIFLE`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_CARBINERIFLE_MK2`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_COMPACTRIFLE`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_DOUBLEACTION`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_GUSENBERG`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_HEAVYPISTOL`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_MARKSMANPISTOL`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_PISTOL50`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_REVOLVER`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_REVOLVER_MK2`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_SMG`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_SMG_MK2`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_SPECIALCARBINE`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_SPECIALCARBINE_MK2`] = Config.WeaponClasses['MEDIUM_CALIBER'],

    --[[ High Caliber ]] --
    [`WEAPON_ASSAULTRIFLE`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_ASSAULTRIFLE_MK2`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_COMBATMG`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_COMBATMG_MK2`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_HEAVYSNIPER`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_HEAVYSNIPER_MK2`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_MARKSMANRIFLE`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_MARKSMANRIFLE_MK2`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_MG`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_MINIGUN`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_MUSKET`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_RAILGUN`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_HEAVYRIFLE`] = Config.WeaponClasses['HIGH_CALIBER'],

    --[[ Shotguns ]] --
    [`WEAPON_ASSAULTSHOTGUN`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_BULLUPSHOTGUN`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_DBSHOTGUN`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_HEAVYSHOTGUN`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_PUMPSHOTGUN`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_PUMPSHOTGUN_MK2`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_SAWNOFFSHOTGUN`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_SWEEPERSHOTGUN`] = Config.WeaponClasses['SHOTGUN'],

    --[[ Animals ]]                                            --
    [`WEAPON_ANIMAL`] = Config.WeaponClasses['WILDLIFE'],      -- Animal
    [`WEAPON_COUGAR`] = Config.WeaponClasses['WILDLIFE'],      -- Cougar
    [`WEAPON_BARBED_WIRE`] = Config.WeaponClasses['WILDLIFE'], -- Barbed Wire

    --[[ Cutting Weapons ]]                                    --
    [`WEAPON_BATTLEAXE`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_BOTTLE`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_DAGGER`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_HATCHET`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_KNIFE`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_MACHETE`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_SWITCHBLADE`] = Config.WeaponClasses['CUTTING'],

    --[[ Light Impact ]] --
    [`WEAPON_KNUCKLE`] = Config.WeaponClasses['LIGHT_IMPACT'],

    --[[ Heavy Impact ]] --
    [`WEAPON_BAT`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_CROWBAR`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_FIREEXTINGUISHER`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_FIRWORK`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_GOLFLCUB`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_HAMMER`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_PETROLCAN`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_POOLCUE`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_WRENCH`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_RAMMED_BY_CAR`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_RUN_OVER_BY_CAR`] = Config.WeaponClasses['HEAVY_IMPACT'],

    --[[ Explosives ]] --
    [`WEAPON_EXPLOSION`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_GRENADE`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_COMPACTLAUNCHER`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_HOMINGLAUNCHER`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_PIPEBOMB`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_PROXMINE`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_RPG`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_STICKYBOMB`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_HELI_CRASH`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_EMPLAUNCHER`] = Config.WeaponClasses['EXPLOSIVE'],

    --[[ Other ]]                                                   --
    [`WEAPON_FALL`] = Config.WeaponClasses['OTHER'],                -- Fall
    [`WEAPON_HIT_BY_WATER_CANNON`] = Config.WeaponClasses['OTHER'], -- Water Cannon

    --[[ Fire ]]                                                    --
    [`WEAPON_ELECTRIC_FENCE`] = Config.WeaponClasses['FIRE'],
    [`WEAPON_FIRE`] = Config.WeaponClasses['FIRE'],
    [`WEAPON_MOLOTOV`] = Config.WeaponClasses['FIRE'],
    [`WEAPON_FLARE`] = Config.WeaponClasses['FIRE'],
    [`WEAPON_FLAREGUN`] = Config.WeaponClasses['FIRE'],

    --[[ Suffocate ]]                                                     --
    [`WEAPON_DROWNING`] = Config.WeaponClasses['SUFFOCATING'],            -- Drowning
    [`WEAPON_DROWNING_IN_VEHICLE`] = Config.WeaponClasses['SUFFOCATING'], -- Drowning Veh
    [`WEAPON_EXHAUSTION`] = Config.WeaponClasses['SUFFOCATING'],          -- Exhaust
    [`WEAPON_BZGAS`] = Config.WeaponClasses['SUFFOCATING'],
    [`WEAPON_SMOKEGRENADE`] = Config.WeaponClasses['SUFFOCATING'],
}

Config.ItemsToRemoveOnDeath = {
	-- ammo
		'pistol_ammo',
		'rifle_ammo',
		'smg_ammo',
		'shotgun_ammo',
		'mg_ammo',
		'snp_ammo',
		'emp_ammo',
		'paintball_ammo',
		-- 'rpg_ammo',
		'mini_ammo',
		'grenade_ammo',
		'sniper_ammo',
	-- top shelf items
		'long_island',
		'side_car',
		'sex_on_the_beach',
		'walk_me_down',
		'old_fashioned',
		'pizza_burger',
		'meat_lovers_pizza',
		'bbq_ribs',
		'buffalo_wings',
		'the_birdy_burger',
		'west_coast_deluxe',
		'little_creek_burger',
	-- black market 
		'security_card_01',
		'security_card_02',
		'electronickit',
		'gatecrack',
		'thermite',
		'trojan_usb',
		'clip_attachment',
		'drum_attachment',
		'advscope_attachment',
		'grip_attachment',
		'holoscope_attachment',
		'suppressor_attachment',
	-- consumable heals
		'bandage',
		'morphine',
		'oxycodone',
		'xanax',
		'amoxixillin',
		'ibuprofen',
	-- misc items
		'parachute',
		'casino_goldchip',
		'casinochips',
		'stickynote',
		'drill',
	-- jewelry
		'emerald',
		'ruby',
		'diamond',
		'sapphire',
		'gold_ring',
		'diamond_ring',
		'ruby_ring',
		'sapphire_ring',
		'emerald_ring',
		'silver_ring',
		'diamond_ring_silver',
		'ruby_ring_silver',
		'sapphire_ring_silver',
		'emerald_ring_silver',
		'goldchain',
		'diamond_necklace',
		'sapphire_necklace',
		'ruby_necklace',
		'emerald_necklace',
		'silverchain',
		'diamond_necklace_silver',
		'ruby_necklace_silver',
		'sapphire_necklace_silver',
		'emerald_necklace_silver',
		'goldearring',
		'diamond_earring',
		'ruby_earring',
		'sapphire_earring',
		'emerald_earring',
		'silverearring',
		'diamond_earring_silver',
		'ruby_earring_silver',
		'sapphire_earring_silver',
		'emerald_earring_silver',
		'ironore',
		'copperore',
		'goldore',
		'silverore',
		'goldingot',
		'silveringot',
		'miningdrill',
		'mininglaser',
		'drillbit',
		'goldbar',
		'tenkgoldchain',
		'goldchain',
		'diamond',
		'diamond_ring',
		'rolex',
		'cryptostick',
		'advancedlockpick',
		'cuffpick',
		'lockpick',
		'zipties',
		'screwdriverset',
	-- drugs
		'joint',
		'cokebaggy',
		'crack_baggy',
		'xtcbaggy',
		'coke_brick',
		'weed_brick',
		'coke_small_brick',
		'oxy',
		'meth',
		'rolling_paper',
		'crack_brick',
		'crack_small_brick',
		'pixiedust',
		'pixiedust_brick',
		'pixiedust_small_brick',
		'rawcoca',
		'weed_fertilizer',
		'lean_small_bottle',
		'lean_large_bottle',
		'prometh',
		'lean',
	-- recycle items
		'plastic',
		'metalscrap',
		'copper',
		'aluminum',
		'aluminumoxide',
		'iron',
		'ironoxide',
		'rubber',
		'glass',
	-- marked money
		'printedcash',
		'markedbills',
		'moneybag'
}

Config.VehicleSettings = { -- Enable or disable vehicle extras when pulling them from the ambulance job vehicle spawner
    ['car1'] = {           -- Model name
        ['extras'] = {
            ['1'] = false, -- on/off
            ['2'] = true,
            ['3'] = true,
            ['4'] = true,
            ['5'] = true,
            ['6'] = true,
            ['7'] = true,
            ['8'] = true,
            ['9'] = true,
            ['10'] = true,
            ['11'] = true,
            ['12'] = true,
        }
    },
    ['car2'] = {
        ['extras'] = {
            ['1'] = false,
            ['2'] = true,
            ['3'] = true,
            ['4'] = true,
            ['5'] = true,
            ['6'] = true,
            ['7'] = true,
            ['8'] = true,
            ['9'] = true,
            ['10'] = true,
            ['11'] = true,
            ['12'] = true,
        }
    }
}


