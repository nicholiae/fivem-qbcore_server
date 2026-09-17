Config = {
	ResetPlayersXp = false,
    EnableSkillCheck = true,
    ImageBasePath = "nui://qb-inventory/html/images/",
    unemployed_bench = {
        object = `prop_tool_bench02`,
        xpType = 'craftingrep',
        recipes = {
			{
                item = 'butter',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'milk', amount = 2 },
                    { item = 'emptycowbucket', amount = 1 }
                }
            },
			-- {
                -- item = 'butter',
				-- yield = 3,
				-- xpRequired = 10000,
				-- xpGain = 103,
                -- requiredItems = {
                    -- { item = 'milk', amount = 2 },
                    -- { item = 'emptycowbucket', amount = 1 }
                -- }
            -- },
		-- attachments
            {
                item = 'advancedlockpick',
				yield = 1,
				xpRequired = 500,
				xpGain = 5,
                requiredItems = {
                    { item = 'lockpick', amount = 1 },
                    { item = 'screwdriverset', amount = 1 },
                    { item = 'plastic', amount = 1 }
                }
            },
            {
                item = 'cuffpick',
				yield = 1,
				xpRequired = 50000,
				xpGain = 515,
                requiredItems = {
                    { item = 'advancedlockpick', amount = 1 },
                    { item = 'screwdriverset', amount = 1 },
                    { item = 'plastic', amount = 1 },
                    { item = 'metalscrap', amount = 5 },
                    { item = 'rubber', amount = 1 }
                }
            },
			{
                item = 'flashlight_attachment',
				yield = 1,
				xpRequired = 35000,
				xpGain = 360,
                requiredItems = {
                    { item = 'plastic', amount = 6 },
                    { item = 'metalscrap', amount = 10 },
                    { item = 'aluminum', amount = 8 },
                    { item = 'rubber', amount = 6 },
                    { item = 'glass', amount = 40 },
                    { item = 'electronickit', amount = 5 },
                    { item = 'screwdriverset', amount = 1 },
                    { item = 'drill', amount = 1 }
                }
            },
            {
                item = 'grip_attachment',
				yield = 1,
				xpRequired = 25000,
				xpGain = 257,
                requiredItems = {
                    { item = 'plastic', amount = 6 },
                    { item = 'metalscrap', amount = 30 },
                    { item = 'aluminum', amount = 6 },
                    { item = 'rubber', amount = 60 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'smallscope_attachment',
				yield = 1,
				xpRequired = 50000,
				xpGain = 515,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    { item = 'metalscrap', amount = 10 },
                    { item = 'aluminum', amount = 18 },
                    { item = 'rubber', amount = 6 },
                    { item = 'glass', amount = 40 },
                    { item = 'electronickit', amount = 6 },
                    { item = 'screwdriverset', amount = 1 },
                    { item = 'drill', amount = 1 }
                }
            },
            {
                item = 'medscope_attachment',
				yield = 1,
				xpRequired = 75000,
				xpGain = 773,
                requiredItems = {
                    { item = 'plastic', amount = 20 },
                    { item = 'metalscrap', amount = 20 },
                    { item = 'aluminum', amount = 28 },
                    { item = 'rubber', amount = 16 },
                    { item = 'glass', amount = 50 },
                    { item = 'electronickit', amount = 12 },
                    { item = 'screwdriverset', amount = 1 },
                    { item = 'drill', amount = 1 }
                }
            },
            {
                item = 'clip_attachment',
				yield = 1,
				xpRequired = 100000,
				xpGain = 1030,
                requiredItems = {
                    { item = 'plastic', amount = 30 },
                    { item = 'metalscrap', amount = 30 },
                    { item = 'aluminum', amount = 38 },
                    { item = 'rubber', amount = 26 },
                    { item = 'glass', amount = 60 },
                    { item = 'electronickit', amount = 28 },
                    { item = 'screwdriverset', amount = 1 },
                    { item = 'drill', amount = 1 }
                }
            },
            {
                item = 'thermalscope_attachment',
				yield = 1,
				xpRequired = 125000,
				xpGain = 1288,
                requiredItems = {
                    { item = 'plastic', amount = 70 },
                    { item = 'metalscrap', amount = 70 },
                    { item = 'aluminum', amount = 78 },
                    { item = 'rubber', amount = 66 },
                    { item = 'glass', amount = 100 },
                    { item = 'electronickit', amount = 18 },
                    { item = 'screwdriverset', amount = 1 },
                    { item = 'drill', amount = 1 }
                }
            },
            {
                item = 'largescope_attachment',
				yield = 1,
				xpRequired = 150000,
				xpGain = 1546,
                requiredItems = {
                    { item = 'plastic', amount = 50 },
                    { item = 'metalscrap', amount = 50 },
                    { item = 'aluminum', amount = 58 },
                    { item = 'rubber', amount = 46 },
                    { item = 'glass', amount = 80 },
                    { item = 'electronickit', amount = 20 },
                    { item = 'screwdriverset', amount = 1 },
                    { item = 'drill', amount = 1 }
                }
            },
            {
                item = 'holoscope_attachment',
				yield = 1,
				xpRequired = 175000,
				xpGain = 1804,
                requiredItems = {
                    { item = 'plastic', amount = 60 },
                    { item = 'metalscrap', amount = 60 },
                    { item = 'aluminum', amount = 68 },
                    { item = 'rubber', amount = 56 },
                    { item = 'glass', amount = 90 },
                    { item = 'electronickit', amount = 20 },
                    { item = 'screwdriverset', amount = 1 },
                    { item = 'drill', amount = 1 }
                }
            },
            {
                item = 'suppressor_attachment',
				yield = 1,
				xpRequired = 200000,
				xpGain = 2061,
                requiredItems = {
                    { item = 'plastic', amount = 40 },
                    { item = 'metalscrap', amount = 40 },
                    { item = 'aluminum', amount = 48 },
                    { item = 'rubber', amount = 36 },
                    { item = 'glass', amount = 70 },
                    { item = 'electronickit', amount = 8 },
                    { item = 'screwdriverset', amount = 1 },
                    { item = 'drill', amount = 1 }
                }
            },
            {
                item = 'electronickit',
				yield = 2,
				xpRequired = 300000,
				xpGain = 3092,
                requiredItems = {
                    { item = 'plastic', amount = 90 },
                    { item = 'metalscrap', amount = 30 },
                    { item = 'aluminum', amount = 32 },
                    { item = 'rubber', amount = 96 },
                    { item = 'glass', amount = 20 },
                    { item = 'iron', amount = 18 },
                    { item = 'copper', amount = 84 },
                    { item = 'screwdriverset', amount = 1 },
                    { item = 'mininglaser', amount = 1 },
                    { item = 'drillbit', amount = 1 }
                }
            },
		}
	},
    lux_bench = {
        object = `prop_tool_bench02`,
        xpType = 'craftingrep',
        recipes = {
			
			{
                item = 'dough',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'wheat', amount = 1 },
                    { item = 'milk', amount = 1 }
                }
            },
			{
                item = 'cheese',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'milk', amount = 1 },
                    { item = 'butter', amount = 1 }
                }
			},
			{
                item = 'loaded_fries',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'cheese', amount = 1 },
                    { item = 'dough', amount = 1 },
                    { item = 'raw_beef', amount = 1 }
                }
            },
			{
                item = 'sliders',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'dough', amount = 1 },
                    { item = 'cheese', amount = 1 },
                    { item = 'raw_beef', amount = 3 }
                }
            },
			{
                item = 'nachos',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'cheese', amount = 1 },
                    { item = 'dough', amount = 1 },
                    { item = 'chillypepper', amount = 1 }
                }
            },
			{
                item = 'boneless_wings',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'wingmeat', amount = 3 },
                    { item = 'tomato', amount = 1 },
                    { item = 'dough', amount = 1 }
                }
            },
			{
                item = 'hot_wings',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'wingmeat', amount = 3 },
                    { item = 'tomato', amount = 1 },
                    { item = 'chillypepper', amount = 1 }
                }
            },
			{
                item = 'sex_on_the_beach',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'orange', amount = 2 },
                    { item = 'cranberryjuice', amount = 1 },
                    { item = 'vodka', amount = 2 },
                    { item = 'peachschnapps', amount = 1 }
                }
            },
			{
                item = 'side_car',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'cognac', amount = 4 },
                    { item = 'triplesec', amount = 1 },
                    { item = 'lemon', amount = 1 }
                }
            },
			{
                item = 'long_island',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'tequila', amount = 1 },
                    { item = 'triplesec', amount = 1 },
                    { item = 'coconutrum', amount = 1 },
                    { item = 'lemon', amount = 1 },
                    { item = 'gin', amount = 1 },
                    { item = 'vodka', amount = 1 }
                }
            },
		}
	},
	joint_bench = {
        object = `prop_tool_bench02`,
        xpType = 'craftingrep',
        recipes = {
		-- jointS
            {
                item = 'blueberry_cruffinjoint',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'blueberry_cruffin', amount = 1 },
                    { item = 'rolling_paper', amount = 1 }
                }
            },
            {
                item = 'cake_mixjoint',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'cake_mix', amount = 1 },
                    { item = 'rolling_paper', amount = 1 }
                }
            },
            {
                item = 'cereal_milkjoint',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'cereal_milk', amount = 1 },
                    { item = 'rolling_paper', amount = 1 }
                }
            },
            {
                item = 'cheetah_pissjoint',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'cheetah_piss', amount = 1 },
                    { item = 'rolling_paper', amount = 1 }
                }
            },
            {
                item = 'gary_paytonjoint',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'gary_payton', amount = 1 },
                    { item = 'rolling_paper', amount = 1 }
                }
            },
            {
                item = 'gelattijoint',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'gelatti', amount = 1 },
                    { item = 'rolling_paper', amount = 1 }
                }
            },
            {
                item = 'georgia_piejoint',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'georgia_pie', amount = 1 },
                    { item = 'rolling_paper', amount = 1 }
                }
            },
            {
                item = 'grabba_leafjoint',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'grabba_leaf', amount = 1 },
                    { item = 'rolling_paper', amount = 1 }
                }
            },
            {
                item = 'jefejoint',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'jefe', amount = 1 },
                    { item = 'rolling_paper', amount = 1 }
                }
            },
            {
                item = 'snow_manjoint',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'snow_man', amount = 1 },
                    { item = 'rolling_paper', amount = 1 }
                }
            },
            {
                item = 'white_runtzjoint',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'white_runtz', amount = 1 },
                    { item = 'rolling_paper', amount = 1 }
                }
            },
            {
                item = 'whitecherry_gelatojoint',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'whitecherry_gelato', amount = 1 },
                    { item = 'rolling_paper', amount = 1 }
                }
            },
		--Vanilla joints
            {
                item = 'weed_whitewidow_joint',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_whitewidow', amount = 1 },
                    { item = 'rolling_paper', amount = 1 }
                }
			},
            {
                item = 'weed_skunk_joint',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_skunk', amount = 1 },
                    { item = 'rolling_paper', amount = 1 }
                }
			},
            {
                item = 'weed_purplehaze_joint',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_purplehaze', amount = 1 },
                    { item = 'rolling_paper', amount = 1 }
                }
            },
            {
                item = 'weed_ogkush_joint',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_ogkush', amount = 1 },
                    { item = 'rolling_paper', amount = 1 }
                }
            },
            {
                item = 'weed_amnesia_joint',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_amnesia', amount = 1 },
                    { item = 'rolling_paper', amount = 1 }
                }
            },
            {
                item = 'weed_ak47_joint',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_ak47', amount = 1 },
                    { item = 'rolling_paper', amount = 1 }
                }
            },
		}
	},
		--Vanilla joints
	blunt_bench = {
        object = `prop_tool_bench02`,
        xpType = 'craftingrep',
        recipes = {
		-- jointS
		-- backwoods_grape bluntS
            {
                item = 'blueberry_cruffinblunt_grape',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'blueberry_cruffin', amount = 3 },
                    { item = 'backwoods_grape', amount = 1 }
                }
            },
            {
                item = 'cake_mixblunt_grape',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'cake_mix', amount = 3 },
                    { item = 'backwoods_grape', amount = 1 }
                }
            },
            {
                item = 'cereal_milkblunt_grape',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'cereal_milk', amount = 3 },
                    { item = 'backwoods_grape', amount = 1 }
                }
            },
            {
                item = 'cheetah_pissblunt_grape',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'cheetah_piss', amount = 3 },
                    { item = 'backwoods_grape', amount = 1 }
                }
            },
            {
                item = 'gary_paytonblunt_grape',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'gary_payton', amount = 3 },
                    { item = 'backwoods_grape', amount = 1 }
                }
            },
            {
                item = 'gelattiblunt_grape',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'gelatti', amount = 3 },
                    { item = 'backwoods_grape', amount = 1 }
                }
            },
            {
                item = 'georgia_pieblunt_grape',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'georgia_pie', amount = 3 },
                    { item = 'backwoods_grape', amount = 1 }
                }
            },
            {
                item = 'grabba_leafblunt_grape',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'grabba_leaf', amount = 3 },
                    { item = 'backwoods_grape', amount = 1 }
                }
            },
            {
                item = 'jefeblunt_grape',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'jefe', amount = 3 },
                    { item = 'backwoods_grape', amount = 1 }
                }
            },
            {
                item = 'snow_manblunt_grape',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'snow_man', amount = 3 },
                    { item = 'backwoods_grape', amount = 1 }
                }
            },
            {
                item = 'white_runtzblunt_grape',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'white_runtz', amount = 3 },
                    { item = 'backwoods_grape', amount = 1 }
                }
            },
            {
                item = 'whitecherry_gelatoblunt_grape',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'whitecherry_gelato', amount = 3 },
                    { item = 'backwoods_grape', amount = 1 }
                }
            },
           
		-- backwoods_grape bluntS 
		-- backwoods_russian_cream bluntS
             {
                item = 'blueberry_cruffinblunt_cream',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'blueberry_cruffin', amount = 3 },
                    { item = 'backwoods_russian_cream', amount = 1 }
                }
            },
            {
                item = 'cake_mixblunt_cream',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'cake_mix', amount = 3 },
                    { item = 'backwoods_russian_cream', amount = 1 }
                }
            },
            {
                item = 'cereal_milkblunt_cream',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'cereal_milk', amount = 3 },
                    { item = 'backwoods_russian_cream', amount = 1 }
                }
            },
            {
                item = 'cheetah_pissblunt_cream',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'cheetah_piss', amount = 3 },
                    { item = 'backwoods_russian_cream', amount = 1 }
                }
            },
            {
                item = 'gary_paytonblunt_cream',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'gary_payton', amount = 3 },
                    { item = 'backwoods_russian_cream', amount = 1 }
                }
            },
            {
                item = 'gelattiblunt_cream',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'gelatti', amount = 3 },
                    { item = 'backwoods_russian_cream', amount = 1 }
                }
            },
            {
                item = 'georgia_pieblunt_cream',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'georgia_pie', amount = 3 },
                    { item = 'backwoods_russian_cream', amount = 1 }
                }
            },
            {
                item = 'grabba_leafblunt_cream',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'grabba_leaf', amount = 3 },
                    { item = 'backwoods_russian_cream', amount = 1 }
                }
            },
            {
                item = 'jefeblunt_cream',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'jefe', amount = 3 },
                    { item = 'backwoods_russian_cream', amount = 1 }
                }
            },
            {
                item = 'snow_manblunt_cream',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'snow_man', amount = 3 },
                    { item = 'backwoods_russian_cream', amount = 1 }
                }
            },
            {
                item = 'white_runtzblunt_cream',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'white_runtz', amount = 3 },
                    { item = 'backwoods_russian_cream', amount = 1 }
                }
            },
            {
                item = 'whitecherry_gelatoblunt_cream',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'whitecherry_gelato', amount = 3 },
                    { item = 'backwoods_russian_cream', amount = 1 }
                }
            },
           
		-- backwoods_russian_cream bluntS 
		--Vanilla blunts
            {
                item = 'weed_whitewidow_blunt_honey',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_whitewidow', amount = 3 },
                    { item = 'backwoods_honey', amount = 1 }
                }
            },
            {
                item = 'weed_whitewidow_blunt_cream',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_whitewidow', amount = 3 },
                    { item = 'backwoods_russian_cream', amount = 1 }
                }
            },
            {
                item = 'weed_whitewidow_blunt_grape',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_whitewidow', amount = 3 },
                    { item = 'backwoods_grape', amount = 1 }
                }
            },
            {
                item = 'weed_skunk_blunt_honey',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_skunk', amount = 3 },
                    { item = 'backwoods_honey', amount = 1 }
                }
            },
            {
                item = 'weed_skunk_blunt_cream',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_skunk', amount = 3 },
                    { item = 'backwoods_russian_cream', amount = 1 }
                }
            },
            {
                item = 'weed_skunk_blunt',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_skunk', amount = 3 },
                    { item = 'backwoods_grape', amount = 1 }
                }
            },
            {
                item = 'weed_purplehaze_blunt_honey',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_purplehaze', amount = 3 },
                    { item = 'backwoods_honey', amount = 1 }
                }
            },
            {
                item = 'weed_purplehaze_blunt_cream',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_purplehaze', amount = 3 },
                    { item = 'backwoods_russian_cream', amount = 1 }
                }
            },
            {
                item = 'weed_purplehaze_blunt_grape',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_purplehaze', amount = 3 },
                    { item = 'backwoods_grape', amount = 1 }
                }
            },
            {
                item = 'weed_ogkush_blunt_honey',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_ogkush', amount = 3 },
                    { item = 'backwoods_honey', amount = 1 }
                }
            },
            {
                item = 'weed_ogkush_blunt_cream',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_ogkush', amount = 3 },
                    { item = 'backwoods_russian_cream', amount = 1 }
                }
            },
            {
                item = 'weed_ogkush_blunt_grape',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_ogkush', amount = 3 },
                    { item = 'backwoods_grape', amount = 1 }
                }
            },
            {
                item = 'weed_amnesia_blunt_honey',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_amnesia', amount = 3 },
                    { item = 'backwoods_honey', amount = 1 }
                }
            },
            {
                item = 'weed_amnesia_blunt_cream',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_amnesia', amount = 3 },
                    { item = 'backwoods_russian_cream', amount = 1 }
                }
            },
            {
                item = 'weed_amnesia_blunt_grape',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_amnesia', amount = 3 },
                    { item = 'backwoods_grape', amount = 1 }
                }
            },
            {
                item = 'weed_ak47_blunt_honey',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_ak47', amount = 3 },
                    { item = 'backwoods_honey', amount = 1 }
                }
            },
            {
                item = 'weed_ak47_blunt_cream',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_ak47', amount = 3 },
                    { item = 'backwoods_russian_cream', amount = 1 }
                }
            },
            {
                item = 'weed_ak47_blunt_grape',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_ak47', amount = 3 },
                    { item = 'backwoods_grape', amount = 1 }
                }
            },
		--Vanilla blunts
		-- backwoods_honey bluntS
			{
                item = 'blueberry_cruffinblunt_honey',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'blueberry_cruffin', amount = 3 },
                    { item = 'backwoods_honey', amount = 1 }
                }
            },
            {
                item = 'cake_mixblunt_honey',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'cake_mix', amount = 3 },
                    { item = 'backwoods_honey', amount = 1 }
                }
            },
            {
                item = 'cereal_milkblunt_honey',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'cereal_milk', amount = 3 },
                    { item = 'backwoods_honey', amount = 1 }
                }
            },
            {
                item = 'cheetah_pissblunt_honey',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'cheetah_piss', amount = 3 },
                    { item = 'backwoods_honey', amount = 1 }
                }
            },
            {
                item = 'gary_paytonblunt_honey',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'gary_payton', amount = 3 },
                    { item = 'backwoods_honey', amount = 1 }
                }
            },
            {
                item = 'gelattiblunt_honey',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'gelatti', amount = 3 },
                    { item = 'backwoods_honey', amount = 1 }
                }
            },
            {
                item = 'georgia_pieblunt_honey',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'georgia_pie', amount = 3 },
                    { item = 'backwoods_honey', amount = 1 }
                }
            },
            {
                item = 'grabba_leafblunt_honey',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'grabba_leaf', amount = 3 },
                    { item = 'backwoods_honey', amount = 1 }
                }
            },
            {
                item = 'jefeblunt_honey',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'jefe', amount = 3 },
                    { item = 'backwoods_honey', amount = 1 }
                }
            },
            {
                item = 'snow_manblunt_honey',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'snow_man', amount = 3 },
                    { item = 'backwoods_honey', amount = 1 }
                }
            },
            {
                item = 'white_runtzblunt_honey',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'white_runtz', amount = 3 },
                    { item = 'backwoods_honey', amount = 1 }
                }
            },
            {
                item = 'whitecherry_gelatoblunt_honey',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'whitecherry_gelato', amount = 3 },
                    { item = 'backwoods_honey', amount = 1 }
                }
            }
        }
    },
    pets_bench = {
        object = `prop_tool_bench02`,
        xpType = 'craftingrep',
        recipes = {
			{
                item = 'petnet',
				yield = 1,
				xpRequired = 50000,
				xpGain = 515,
                requiredItems = {
                    { item = 'rubber', amount = 12 },
                    { item = 'plastic', amount = 9 },
                    { item = 'metalscrap', amount = 6 }
                }
            }
		}
	},
    rustybrowns_bench = {
        object = `prop_tool_bench02`,
        xpType = 'craftingrep',
        recipes = {
			{
                item = 'iced_coffee',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'soybeans', amount = 3 },
                    { item = 'milk', amount = 1 }
                }
            },
			{
                item = 'hot_coffee',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'soybeans', amount = 3 },
                    { item = 'milk', amount = 1 }
                }
            },
			{
                item = 'frozen_coffee',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'soybeans', amount = 3 },
                    { item = 'milk', amount = 1 }
                }
            },
			{
                item = 'donut',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'grain', amount = 1 },
                    { item = 'milk', amount = 1 }
                }
            },
			{
                item = 'breakfast_sandwich',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'bagel', amount = 1 },
                    { item = 'sausagemeat', amount = 1 }
                }
            },
			{
                item = 'bagel',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'chillypepper', amount = 1 },
                    { item = 'grain', amount = 1 },
                    { item = 'milk', amount = 1 }
                }
            },
			{
                item = 'bacon_egg_roll',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatpig', amount = 1 },
                    { item = 'grain', amount = 1 },
                    { item = 'milk', amount = 1 }
                }
            },
			{
                item = 'hotdogs',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'wheat', amount = 1 },
                    { item = 'sausagemeat', amount = 1 }
                }
            },
		}
	},
    tequilala_bench = {
        object = `prop_tool_bench02`,
        xpType = 'craftingrep',
        recipes = {
			{
                item = 'dough',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'wheat', amount = 1 },
                    { item = 'milk', amount = 1 }
                }
            },
			{
                item = 'cheese',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'milk', amount = 1 },
                    { item = 'butter', amount = 1 }
                }
            },
			{
                item = 'pepperoni',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'raw_pork', amount = 1 },
                    { item = 'raw_beef', amount = 1 }
                }
            },
			{
                item = 'sour_apple_highball',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'vodka', amount = 1 },
                    { item = 'sourappleschnapps', amount = 1 },
                    { item = 'sprunk', amount = 1 }
                }
            },
			{
                item = 'aperol_spritz',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'aperol', amount = 1 },
                    { item = 'prosecco', amount = 1 },
                    { item = 'orange', amount = 1 }
                }
            },
			{
                item = 'panty_dropper',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'blueberryschnapps', amount = 1 },
                    { item = 'vodka', amount = 1 },
                    { item = 'cranberryjuice', amount = 1 }
                }
            },
			{
                item = 'irish_coffee',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'whiskey', amount = 1 },
                    { item = 'coffee', amount = 1 },
                    { item = 'cremedementhe', amount = 1 }
                }
            },
			{
                item = 'black_russian',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'vodka', amount = 1 },
                    { item = 'kahlua', amount = 1 }
                }
            },
			{
                item = 'last_word',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'greenchartreuseliqueur', amount = 1 },
                    { item = 'maraschinoliqueur', amount = 1 },
                    { item = 'gin', amount = 1 }
                }
            },
			{
                item = 'take_9',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'spicedrum', amount = 1 },
                    { item = 'bluecuracao', amount = 1 },
                    { item = 'dryvermouth', amount = 1 }
                }
            },
			{
                item = 'fish_bowl',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'coconutrum', amount = 1 },
                    { item = 'bluecuracao', amount = 1 },
                    { item = 'vodka', amount = 1 }
                }
            },
			{
                item = 'old_fashioned',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'bourbon', amount = 1 },
                    { item = 'bitters', amount = 1 },
                    { item = 'simplesyrup', amount = 1 }
                }
            },
			{
                item = 'pizza_burger',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'dough', amount = 1 },
                    { item = 'pepperoni', amount = 1 },
                    { item = 'cheese', amount = 1 }
                }
            },
			{
                item = 'walk_me_down',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'tequila', amount = 1 },
                    { item = 'bluecuracao', amount = 1 },
                    { item = 'sprunk', amount = 1 }
                }
            },
		}
	},
    bigjohns_bench = {
        object = `prop_tool_bench02`,
        xpType = 'craftingrep',
        recipes = {
			{
                item = 'dough',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'wheat', amount = 1 },
                    { item = 'milk', amount = 1 }
                }
            },
			{
                item = 'cheese',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'milk', amount = 1 },
                    { item = 'butter', amount = 1 }
                }
            },
			{
                item = 'pepperoni',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'raw_pork', amount = 1 },
                    { item = 'raw_beef', amount = 1 }
                }
            },
			{
                item = 'meat_lovers_pizza',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'pepperoni', amount = 1 },
                    { item = 'raw_pork', amount = 1 },
                    { item = 'raw_beef', amount = 1 },
                    { item = 'steakmeat', amount = 1 },
                    { item = 'sausagemeat', amount = 1 },
                    { item = 'cheese', amount = 1 },
                    { item = 'dough', amount = 1 },
                    { item = 'tomato', amount = 1 },
                    { item = 'tomatopaste', amount = 1 }
                }
            },
			{
                item = 'bbq_ribs',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'ribmeat', amount = 2 },
                    { item = 'tomatopaste', amount = 1 },
                    { item = 'chillypepper', amount = 1 }
                }
            },
			{
                item = 'buffalo_wings',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'wingmeat', amount = 3 },
                    { item = 'tomato', amount = 1 },
                    { item = 'chillypepper', amount = 1 }
                }
            },
			{
                item = 'supreme_pizza',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'pepperoni', amount = 1 },
                    { item = 'raw_pork', amount = 1 },
                    { item = 'raw_beef', amount = 1 },
                    { item = 'cheese', amount = 1 },
                    { item = 'dough', amount = 1 },
                    { item = 'greenpepper', amount = 1 },
                    { item = 'tomato', amount = 1 },
                    { item = 'tomatopaste', amount = 1 }
                }
            },
			{
                item = 'jalapeno_poppers',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'chillypepper', amount = 1 },
                    { item = 'greenpepper', amount = 1 },
                    { item = 'hotsauce', amount = 1 }
                }
            },
			{
                item = 'cheesy_steak_pizza',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'steakmeat', amount = 1 },
                    { item = 'cheese', amount = 2 },
                    { item = 'dough', amount = 1 },
                    { item = 'tomatopaste', amount = 1 }
                }
            },
			{
                item = 'garlic_bread',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'dough', amount = 1 },
                    { item = 'garlic', amount = 1 }
                }
            },
			{
                item = 'lemonade',
				yield = 1,
				xpRequired = 25,
				xpGain = 5,
                requiredItems = {
                    { item = 'water_bottle', amount = 1 },
                    { item = 'lemon', amount = 1 }
                }
            },
			{
                item = 'orange_soda',
				yield = 1,
				xpRequired = 25,
				xpGain = 5,
                requiredItems = {
                    { item = 'water_bottle', amount = 1 },
                    { item = 'orange', amount = 1 }
                }
            },
			{
                item = 'mango_soda',
				yield = 1,
				xpRequired = 25,
				xpGain = 5,
                requiredItems = {
                    { item = 'water_bottle', amount = 1 },
                    { item = 'mango', amount = 1 }
                }
            },
			{
                item = 'mango_orange_soda',
				yield = 2,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'mango_soda', amount = 1 },
                    { item = 'orange_soda', amount = 1 }
                }
            },
			{
                item = 'grape_soda',
				yield = 1,
				xpRequired = 25,
				xpGain = 5,
                requiredItems = {
                    { item = 'water_bottle', amount = 1 },
                    { item = 'grapejuice', amount = 1 }
                }
            }
		}
	},
    drivein_bench = {
        object = `prop_tool_bench02`,
        xpType = 'craftingrep',
        recipes = {
			{
                item = 'popcorn',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'corncob', amount = 3 },
                    { item = 'mallet', amount = 1 }
                }
            },
			{
                item = 'candy',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'soybeans', amount = 3 },
                    { item = 'chillypepper', amount = 1 },
                    { item = 'tomatopaste', amount = 1 },
                    { item = 'milk', amount = 1 },
                    { item = 'apple_juice', amount = 1 }
                }
            },
			{
                item = 'softdrink',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'apple', amount = 3 },
                    { item = 'mallet', amount = 1 }
                }
            },
		}
	},
    burgershot_bench = {
        object = `prop_tool_bench02`,
        xpType = 'craftingrep',
        recipes = {
			{
                item = 'cheese',
				yield = 1,
				xpRequired = 1,
				xpGain = 5,
                requiredItems = {
                    { item = 'milk', amount = 1 },
                    { item = 'milk', amount = 1 }
                }
            },
			{
                item = 'the_birdy_burger',
				yield = 1,
				xpRequired = 300,
				xpGain = 3,
                requiredItems = {
                    { item = 'greenpepper', amount = 1 },
                    { item = 'chillypepper', amount = 1 },
                    { item = 'wingmeat', amount = 1 },
                    { item = 'groundmeat', amount = 1 },
                    { item = 'cheese', amount = 1 },
                    { item = 'wheat', amount = 1 }
                }
            },
			{
                item = 'west_coast_deluxe',
				yield = 1,
				xpRequired = 200,
				xpGain = 2,
                requiredItems = {
                    { item = 'cooked_bacon', amount = 1 },
                    { item = 'chillypepper', amount = 1 },
                    { item = 'groundmeat', amount = 1 },
                    { item = 'cheese', amount = 1 },
                    { item = 'wheat', amount = 1 }
                }
            },
			{
                item = 'little_creek_burger',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'cooked_bacon', amount = 1 },
                    { item = 'chillypepper', amount = 1 },
                    { item = 'groundmeat', amount = 1 },
                    { item = 'cheese', amount = 1 },
                    { item = 'wheat', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatdeer', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatpig', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatboar', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatlion', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatcow', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatcoyote', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatrabbit', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatbird', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatseagull', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatcormorant', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatchickenhawk', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatcrow', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'wingmeat',
				yield = 1,
				xpRequired = 30,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatcrow', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'wingmeat',
				yield = 1,
				xpRequired = 30,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatchickenhawk', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'wingmeat',
				yield = 1,
				xpRequired = 30,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatcormorant', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'wingmeat',
				yield = 1,
				xpRequired = 30,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatseagull', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'wingmeat',
				yield = 1,
				xpRequired = 30,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatbird', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
			{
                item = 'burger',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'groundmeat', amount = 1 },
                    { item = 'grain', amount = 1 }
                }
            },
			{
                item = 'chickennuggets',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'breastmeat', amount = 3 },
                    { item = 'grain', amount = 1 }
                }
            },
			{
                item = 'chickensandwich',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'breastmeat', amount = 2 },
                    { item = 'grain', amount = 1 }
                }
            },
			{
                item = 'chickentenders',
				yield = 100,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'breastmeat', amount = 5 },
                    { item = 'grain', amount = 1 }
                }
            },
			{
                item = 'fries',
				yield = 100,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'milk', amount = 1 },
                    { item = 'grain', amount = 3 }
                }
            },
			{
                item = 'grilledchickentenders',
				yield = 100,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'breastmeat', amount = 5 },
                    { item = 'milk', amount = 1 }
                }
            },
			{
                item = 'softdrink',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'apple', amount = 3 },
                    { item = 'mallet', amount = 1 }
                }
            },
		
		}
	},
    butcher_bench = {
        object = `prop_tool_bench02`,
        xpType = 'craftingrep',
        recipes = {
		-- Processed Meat
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatdeer', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatpig', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatboar', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatlion', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatcow', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatcoyote', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatrabbit', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatbird', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatseagull', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatcormorant', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatchickenhawk', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'groundmeat',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatcrow', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'ribmeat',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatdeer', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'ribmeat',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatpig', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'ribmeat',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatboar', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'ribmeat',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatlion', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'ribmeat',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatcow', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'ribmeat',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatcoyote', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'loinmeat',
				yield = 1,
				xpRequired = 20,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatcow', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'loinmeat',
				yield = 1,
				xpRequired = 20,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatdeer', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'loinmeat',
				yield = 1,
				xpRequired = 20,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatlion', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'thighmeat',
				yield = 1,
				xpRequired = 30,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatcrow', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'thighmeat',
				yield = 1,
				xpRequired = 30,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatchickenhawk', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'thighmeat',
				yield = 1,
				xpRequired = 30,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatcormorant', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'thighmeat',
				yield = 1,
				xpRequired = 30,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatseagull', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'thighmeat',
				yield = 1,
				xpRequired = 30,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatbird', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'wingmeat',
				yield = 1,
				xpRequired = 30,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatcrow', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'wingmeat',
				yield = 1,
				xpRequired = 30,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatchickenhawk', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'wingmeat',
				yield = 1,
				xpRequired = 30,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatcormorant', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'wingmeat',
				yield = 1,
				xpRequired = 30,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatseagull', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'wingmeat',
				yield = 1,
				xpRequired = 30,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatbird', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'breastmeat',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatchickenhawk', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'breastmeat',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatpig', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'breastmeat',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatdeer', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'breastmeat',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatcow', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'steakmeat',
				yield = 1,
				xpRequired = 60,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatcow', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'steakmeat',
				yield = 1,
				xpRequired = 60,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatdeer', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'sausagemeat',
				yield = 1,
				xpRequired = 70,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatdeer', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'sausagemeat',
				yield = 1,
				xpRequired = 70,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatpig', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'sausagemeat',
				yield = 1,
				xpRequired = 70,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatcow', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'brisketmeat',
				yield = 1,
				xpRequired = 80,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatdeer', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            },
            {
                item = 'brisketmeat',
				yield = 1,
				xpRequired = 80,
				xpGain = 5,
                requiredItems = {
                    { item = 'meatcow', amount = 1 },
                    { item = 'mallet', amount = 1 }
                }
            }
		-- Processed Meat
        }
    },
    bikes_bench = {
        object = `prop_tool_bench02`,
        xpType = 'craftingrep',
        recipes = {
		-- Mechanic Parts
            {
                item = 'engine2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'engine1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'engine3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'engine2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'engine4',
				yield = 1,
				xpRequired = 150,
				xpGain = 1,
                requiredItems = {
                    { item = 'engine3', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'engine5',
				yield = 1,
				xpRequired = 200,
				xpGain = 2,
                requiredItems = {
                    { item = 'engine4', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'transmission2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'transmission1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'transmission3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'transmission2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'transmission4',
				yield = 1,
				xpRequired = 200,
				xpGain = 2,
                requiredItems = {
                    { item = 'transmission3', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'brakes2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'brakes1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'brakes3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'brakes2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'suspension2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'suspension1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'suspension3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'suspension2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'suspension4',
				yield = 1,
				xpRequired = 200,
				xpGain = 2,
                requiredItems = {
                    { item = 'suspension3', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'suspension5',
				yield = 1,
				xpRequired = 400,
				xpGain = 4,
                requiredItems = {
                    { item = 'suspension4', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'oilp2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'oilp1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'oilp3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'oilp2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'cylind2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'cylind1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'cylind3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'cylind2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'drives2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'drives1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'drives3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'drives2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'cables2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'cables1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'cables3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'cables2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'fueltank2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'fueltank1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'fueltank3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'fueltank2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
        }
    },
    pjsauto_bench = {
        object = `prop_tool_bench02`,
        xpType = 'craftingrep',
        recipes = {
		-- Mechanic Parts
            {
                item = 'engine2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'engine1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'engine3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'engine2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'engine4',
				yield = 1,
				xpRequired = 150,
				xpGain = 1,
                requiredItems = {
                    { item = 'engine3', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'engine5',
				yield = 1,
				xpRequired = 200,
				xpGain = 2,
                requiredItems = {
                    { item = 'engine4', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'transmission2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'transmission1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'transmission3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'transmission2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'transmission4',
				yield = 1,
				xpRequired = 200,
				xpGain = 2,
                requiredItems = {
                    { item = 'transmission3', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'brakes2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'brakes1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'brakes3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'brakes2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'suspension2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'suspension1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'suspension3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'suspension2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'suspension4',
				yield = 1,
				xpRequired = 200,
				xpGain = 2,
                requiredItems = {
                    { item = 'suspension3', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'suspension5',
				yield = 1,
				xpRequired = 400,
				xpGain = 4,
                requiredItems = {
                    { item = 'suspension4', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'oilp2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'oilp1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'oilp3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'oilp2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'cylind2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'cylind1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'cylind3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'cylind2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'drives2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'drives1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'drives3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'drives2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'cables2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'cables1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'cables3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'cables2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'fueltank2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'fueltank1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'fueltank3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'fueltank2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
		-- Mechanic Parts
        }
    },
    mechj_bench = {
        object = `prop_tool_bench02`,
        xpType = 'craftingrep',
        recipes = {
		-- Mechanic Parts
            {
                item = 'engine2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'engine1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'engine3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'engine2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'engine4',
				yield = 1,
				xpRequired = 150,
				xpGain = 1,
                requiredItems = {
                    { item = 'engine3', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'engine5',
				yield = 1,
				xpRequired = 200,
				xpGain = 2,
                requiredItems = {
                    { item = 'engine4', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'transmission2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'transmission1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'transmission3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'transmission2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'transmission4',
				yield = 1,
				xpRequired = 200,
				xpGain = 2,
                requiredItems = {
                    { item = 'transmission3', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'brakes2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'brakes1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'brakes3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'brakes2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'suspension2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'suspension1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'suspension3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'suspension2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'suspension4',
				yield = 1,
				xpRequired = 200,
				xpGain = 2,
                requiredItems = {
                    { item = 'suspension3', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'suspension5',
				yield = 1,
				xpRequired = 400,
				xpGain = 4,
                requiredItems = {
                    { item = 'suspension4', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'oilp2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'oilp1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'oilp3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'oilp2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'cylind2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'cylind1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'cylind3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'cylind2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'drives2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'drives1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'drives3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'drives2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'cables2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'cables1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'cables3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'cables2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'fueltank2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'fueltank1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'fueltank3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'fueltank2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
		}
    },
    tuners_bench = {
        object = `prop_tool_bench02`,
        xpType = 'craftingrep',
        recipes = {
		-- Mechanic Parts
            {
                item = 'engine2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'engine1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'engine3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'engine2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'engine4',
				yield = 1,
				xpRequired = 150,
				xpGain = 1,
                requiredItems = {
                    { item = 'engine3', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'engine5',
				yield = 1,
				xpRequired = 200,
				xpGain = 2,
                requiredItems = {
                    { item = 'engine4', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'transmission2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'transmission1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'transmission3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'transmission2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'transmission4',
				yield = 1,
				xpRequired = 200,
				xpGain = 2,
                requiredItems = {
                    { item = 'transmission3', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'brakes2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'brakes1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'brakes3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'brakes2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'suspension2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'suspension1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'suspension3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'suspension2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'suspension4',
				yield = 1,
				xpRequired = 200,
				xpGain = 2,
                requiredItems = {
                    { item = 'suspension3', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'suspension5',
				yield = 1,
				xpRequired = 400,
				xpGain = 4,
                requiredItems = {
                    { item = 'suspension4', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'oilp2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'oilp1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'oilp3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'oilp2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'cylind2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'cylind1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'cylind3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'cylind2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'drives2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'drives1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'drives3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'drives2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'cables2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'cables1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'cables3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'cables2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'fueltank2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'fueltank1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'fueltank3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'fueltank2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
		-- Mechanic Parts
        }
    },
    customs_bench = {
        object = `prop_tool_bench02`,
        xpType = 'craftingrep',
        recipes = {
		-- Mechanic Parts
            {
                item = 'engine2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'engine1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'engine3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'engine2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'engine4',
				yield = 1,
				xpRequired = 150,
				xpGain = 1,
                requiredItems = {
                    { item = 'engine3', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'engine5',
				yield = 1,
				xpRequired = 200,
				xpGain = 2,
                requiredItems = {
                    { item = 'engine4', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'transmission2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'transmission1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'transmission3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'transmission2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'transmission4',
				yield = 1,
				xpRequired = 200,
				xpGain = 2,
                requiredItems = {
                    { item = 'transmission3', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'brakes2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'brakes1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'brakes3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'brakes2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'suspension2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'suspension1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'suspension3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'suspension2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'suspension4',
				yield = 1,
				xpRequired = 200,
				xpGain = 2,
                requiredItems = {
                    { item = 'suspension3', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'suspension5',
				yield = 1,
				xpRequired = 400,
				xpGain = 4,
                requiredItems = {
                    { item = 'suspension4', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'oilp2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'oilp1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'oilp3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'oilp2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'cylind2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'cylind1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'cylind3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'cylind2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'drives2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'drives1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'drives3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'drives2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'cables2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'cables1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'cables3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'cables2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'fueltank2',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'fueltank1', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'fueltank3',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'fueltank2', amount = 2 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
        }
    },
    cookies_bench = {
        object = `prop_tool_bench02`,
        xpType = 'craftingrep',
        recipes = {
		-- Weed edibles T2
            {
                item = 'cereal_milk',
				yield = 3,
				xpRequired = 500,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_whitewidow', amount = 1 },
                    { item = 'weed_skunk', amount = 1 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 1 },
                    { item = 'butter', amount = 1 }
                }
            },
            {
                item = 'cake_mix',
				yield = 3,
				xpRequired = 550,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_ak47', amount = 1 },
                    { item = 'weed_skunk', amount = 1 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 1 },
                    { item = 'butter', amount = 1 }
                }
            },
            {
                item = 'blueberry_cruffin',
				yield = 3,
				xpRequired = 660,
				xpGain = 6,
                requiredItems = {
                    { item = 'weed_purplehaze', amount = 1 },
                    { item = 'apple_juice', amount = 1 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 1 },
                    { item = 'butter', amount = 1 }
                }
            },
            {
                item = 'cheetah_piss',
				yield = 3,
				xpRequired = 770,
				xpGain = 7,
                requiredItems = {
                    { item = 'weed_amnesia', amount = 1 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 1 },
                    { item = 'butter', amount = 1 }
                }
            },
            {
                item = 'gary_payton',
				yield = 3,
				xpRequired = 880,
				xpGain = 9,
                requiredItems = {
                    { item = 'weed_amnesia', amount = 1 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 1 },
                    { item = 'butter', amount = 1 }
                }
            },
            {
                item = 'gelatti',
				yield = 3,
				xpRequired = 990,
				xpGain = 10,
                requiredItems = {
                    { item = 'weed_ak47', amount = 1 },
                    { item = 'weed_whitewidow', amount = 1 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 1 },
                    { item = 'butter', amount = 1 }
                }
            },
            {
                item = 'georgia_pie',
				yield = 3,
				xpRequired = 1100,
				xpGain = 11,
                requiredItems = {
                    { item = 'weed_ogkush', amount = 1 },
                    { item = 'weed_purplehaze', amount = 1 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 1 },
                    { item = 'butter', amount = 1 }
                }
            },
            {
                item = 'grabba_leaf',
				yield = 3,
				xpRequired = 1200,
				xpGain = 12,
                requiredItems = {
                    { item = 'weed_ak47', amount = 1 },
                    { item = 'weed_ogkush', amount = 1 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 1 },
                    { item = 'butter', amount = 1 }
                }
            },
            {
                item = 'jefe',
				yield = 3,
				xpRequired = 1300,
				xpGain = 13,
                requiredItems = {
                    { item = 'gelatti', amount = 1 },
                    { item = 'grabba_leaf', amount = 1 },
                    { item = 'weed_ak47', amount = 1 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 1 },
                    { item = 'butter', amount = 1 }
                }
            },
            {
                item = 'snow_man',
				yield = 3,
				xpRequired = 1400,
				xpGain = 14,
                requiredItems = {
                    { item = 'weed_amnesia', amount = 1 },
                    { item = 'weed_whitewidow', amount = 1 },
                    { item = 'cake_mix', amount = 1 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 1 },
                    { item = 'butter', amount = 1 }
                }
            },
            {
                item = 'white_runtz',
				yield = 3,
				xpRequired = 1500,
				xpGain = 15,
                requiredItems = {
                    { item = 'weed_ak47', amount = 1 },
                    { item = 'weed_whitewidow', amount = 1 },
                    { item = 'snow_man', amount = 1 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 1 },
                    { item = 'butter', amount = 1 }
                }
            },
            {
                item = 'whitecherry_gelato',
				yield = 3,
				xpRequired = 1600,
				xpGain = 16,
                requiredItems = {
                    { item = 'weed_whitewidow', amount = 2 },
                    { item = 'weed_ak47', amount = 1 },
                    { item = 'weed_skunk', amount = 1 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 1 },
                    { item = 'butter', amount = 1 }
                }
            },
		-- Weed edibles
            {
                item = 'cereal_milk',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_ogkush', amount = 1 },
                    { item = 'weed_skunk', amount = 1 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 1 }
                }
            },
            {
                item = 'cake_mix',
				yield = 1,
				xpRequired = 10,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_purplehaze', amount = 1 },
                    { item = 'weed_skunk', amount = 1 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 1 }
                }
            },
            {
                item = 'blueberry_cruffin',
				yield = 1,
				xpRequired = 20,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_whitewidow', amount = 1 },
                    { item = 'apple_juice', amount = 1 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 1 }
                }
            },
            {
                item = 'cheetah_piss',
				yield = 1,
				xpRequired = 30,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_skunk', amount = 1 },
                    { item = 'weed_ogkush', amount = 1 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 1 }
                }
            },
            {
                item = 'gary_payton',
				yield = 1,
				xpRequired = 40,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_ak47', amount = 2 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 1 }
                }
            },
            {
                item = 'gelatti',
				yield = 1,
				xpRequired = 50,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_amnesia', amount = 1 },
                    { item = 'weed_ak47', amount = 1 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 15 }
                }
            },
            {
                item = 'georgia_pie',
				yield = 1,
				xpRequired = 60,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_amnesia', amount = 1 },
                    { item = 'weed_ak47', amount = 1 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 10 }
                }
            },
            {
                item = 'grabba_leaf',
				yield = 1,
				xpRequired = 70,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_ak47', amount = 1 },
                    { item = 'weed_amnesia', amount = 1 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 5 }
                }
            },
            {
                item = 'jefe',
				yield = 1,
				xpRequired = 80,
				xpGain = 5,
                requiredItems = {
                    { item = 'gelatti', amount = 1 },
                    { item = 'grabba_leaf', amount = 1 },
                    { item = 'weed_ak47', amount = 2 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 1 }
                }
            },
            {
                item = 'snow_man',
				yield = 1,
				xpRequired = 90,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_amnesia', amount = 2 },
                    { item = 'weed_whitewidow', amount = 1 },
                    { item = 'cake_mix', amount = 1 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 1 }
                }
            },
            {
                item = 'white_runtz',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'weed_ak47', amount = 2 },
                    { item = 'weed_whitewidow', amount = 1 },
                    { item = 'snow_man', amount = 1 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 1 }
                }
            },
            {
                item = 'whitecherry_gelato',
				yield = 1,
				xpRequired = 200,
				xpGain = 2,
                requiredItems = {
                    { item = 'weed_whitewidow', amount = 2 },
                    { item = 'weed_ak47', amount = 2 },
                    { item = 'weed_skunk', amount = 2 },
                    { item = 'empty_weed_bag', amount = 1 },
                    { item = 'milk', amount = 1 }
                }
            },
		-- Weed edibles
		
        }
    },
    whitewidow_bench = {
        object = `prop_tool_bench02`,
        xpType = 'craftingrep',
        recipes = {
		-- Weed bags
            {
                item = 'whitewidow_weed_bag',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_whitewidow', amount = 2 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'skunk_weed_bag',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_skunk', amount = 2 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'purplehaze_weed_bag',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_purplehaze', amount = 2 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'ogkush_weed_bag',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_ogkush', amount = 2 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'amnesia_weed_bag',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_amnesia', amount = 2 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'ak47_weed_bag',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_ak47', amount = 2 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
		-- Weed bags
		-- Weed bricks
            {
                item = 'whitewidow_weed_brick',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'weed_whitewidow', amount = 100 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'skunk_weed_brick',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'weed_skunk', amount = 100 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'purplehaze_weed_brick',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'weed_purplehaze', amount = 100 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'ogkush_weed_brick',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'weed_ogkush', amount = 100 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'amnesia_weed_brick',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'weed_amnesia', amount = 100 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'ak47_weed_brick',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'weed_ak47', amount = 100 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
		-- Weed bricks
        }
    },
    weedshop_bench = {
        object = `prop_tool_bench02`,
        xpType = 'craftingrep',
        recipes = {
		-- Weed bags
            {
                item = 'whitewidow_weed_bag',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_whitewidow', amount = 2 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'skunk_weed_bag',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_skunk', amount = 2 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'purplehaze_weed_bag',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_purplehaze', amount = 2 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'ogkush_weed_bag',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_ogkush', amount = 2 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'amnesia_weed_bag',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_amnesia', amount = 2 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'ak47_weed_bag',
				yield = 1,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_ak47', amount = 2 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
		-- Weed bags
		-- Weed bricks
            {
                item = 'whitewidow_weed_brick',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'weed_whitewidow', amount = 100 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'skunk_weed_brick',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'weed_skunk', amount = 100 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'purplehaze_weed_brick',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'weed_purplehaze', amount = 100 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'ogkush_weed_brick',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'weed_ogkush', amount = 100 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'amnesia_weed_brick',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'weed_amnesia', amount = 100 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'ak47_weed_brick',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'weed_ak47', amount = 100 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
		-- Weed bricks
        }
    },
    ballas_bench = {
        object = `prop_tool_bench02_ld`,
        xpType = 'craftingrep',
        recipes = {
		--crack crafting
            {
                item = 'rawcoca',
				yield = 2,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_cokeleaf', amount = 1 },
                    { item = 'butter', amount = 1 }
                }
            },
            {
                item = 'crack_baggy',
				yield = 2,
				xpRequired = 20,
				xpGain = 5,
                requiredItems = {
                    { item = 'rawcoca', amount = 1 },
                    { item = 'lighterfluid', amount = 2 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'crack_small_brick',
				yield = 1,
				xpRequired = 40,
				xpGain = 5,
                requiredItems = {
                    { item = 'crack_baggy', amount = 50 },
                    { item = 'lighterfluid', amount = 1 }
                }
            },
            {
                item = 'crack_brick',
				yield = 1,
				xpRequired = 80,
				xpGain = 5,
                requiredItems = {
                    { item = 'crack_baggy', amount = 100 },
                    { item = 'lighterfluid', amount = 1 }
                }
            },
            {
                item = 'weed_cokeleaf_seed',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'weed_cokeleaf', amount = 1 },
                    { item = 'razorblade', amount = 1 }
                }
            },
		--crack crafting
		}
	},
    syndicate_bench = {
        object = `prop_tool_bench02_ld`,
        xpType = 'craftingrep',
        recipes = {
		--fentanyl crafting
            {
                item = 'rawfentanyl',
				yield = 2,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_fentanylleaf', amount = 1 },
                    { item = 'butter', amount = 1 }
                }
            },
            {
                item = 'fentanyl',
				yield = 2,
				xpRequired = 20,
				xpGain = 5,
                requiredItems = {
                    { item = 'rawfentanyl', amount = 1 },
                    { item = 'bakingsoda', amount = 2 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'weed_fentanylleaf_seed',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'weed_fentanylleaf', amount = 1 },
                    { item = 'razorblade', amount = 1 }
                }
            },
            {
                item = 'fentanyl_small_brick',
				yield = 1,
				xpRequired = 40,
				xpGain = 5,
                requiredItems = {
                    { item = 'fentanyl', amount = 50 },
                    { item = 'bakingsoda', amount = 1 }
                }
            },
            {
                item = 'fentanyl_brick',
				yield = 1,
				xpRequired = 80,
				xpGain = 5,
                requiredItems = {
                    { item = 'fentanyl', amount = 100 },
                    { item = 'bakingsoda', amount = 1 }
                }
            },
		--fentanyl crafting
		}
	},
    abk_bench = {
        object = `prop_tool_bench02_ld`,
        xpType = 'craftingrep',
        recipes = {
		--coke crafting
            {
                item = 'rawcoca',
				yield = 2,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_cokeleaf', amount = 1 },
                    { item = 'butter', amount = 1 }
                }
            },
            {
                item = 'cokebaggy',
				yield = 2,
				xpRequired = 20,
				xpGain = 5,
                requiredItems = {
                    { item = 'rawcoca', amount = 1 },
                    { item = 'bakingsoda', amount = 2 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'coke_small_brick',
				yield = 1,
				xpRequired = 40,
				xpGain = 5,
                requiredItems = {
                    { item = 'cokebaggy', amount = 50 },
                    { item = 'bakingsoda', amount = 1 }
                }
            },
            {
                item = 'coke_brick',
				yield = 1,
				xpRequired = 80,
				xpGain = 5,
                requiredItems = {
                    { item = 'cokebaggy', amount = 100 },
                    { item = 'bakingsoda', amount = 1 }
                }
            },
            {
                item = 'weed_cokeleaf_seed',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'weed_cokeleaf', amount = 1 },
                    { item = 'razorblade', amount = 1 }
                }
            },
		--coke crafting
		}
	},
    otf_bench = {
        object = `prop_tool_bench02_ld`,
        xpType = 'craftingrep',
        recipes = {
		--coke crafting
            {
                item = 'jollysprite',
				yield = 3,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'jollyranchers', amount = 2 },
                    { item = 'sprunk', amount = 1 }
                }
            },
            {
                item = 'lean',
				yield = 2,
				xpRequired = 20,
				xpGain = 5,
                requiredItems = {
                    { item = 'jollysprite', amount = 2 },
                    { item = 'prometh', amount = 1 }
                }
            },
            {
                item = 'lean_small_bottle',
				yield = 1,
				xpRequired = 40,
				xpGain = 5,
                requiredItems = {
                    { item = 'lean', amount = 50 },
                    { item = 'water_bottle', amount = 1 }
                }
            },
            {
                item = 'lean_large_bottle',
				yield = 1,
				xpRequired = 80,
				xpGain = 5,
                requiredItems = {
                    { item = 'lean', amount = 100 },
                    { item = 'bottle', amount = 1 }
                }
            },
		--coke crafting
		}
	},
    lostmc_bench = {
        object = `prop_tool_bench02_ld`,
        xpType = 'craftingrep',
        recipes = {
		--coke crafting
            {
                item = 'rawcoca',
				yield = 2,
				xpRequired = 0,
				xpGain = 5,
                requiredItems = {
                    { item = 'weed_cokeleaf', amount = 1 },
                    { item = 'butter', amount = 1 }
                }
            },
            {
                item = 'pixiedust',
				yield = 2,
				xpRequired = 20,
				xpGain = 5,
                requiredItems = {
                    { item = 'rawcoca', amount = 1 },
                    { item = 'cigarette', amount = 1 },
                    { item = 'bakingsoda', amount = 1 },
                    { item = 'empty_weed_bag', amount = 1 }
                }
            },
            {
                item = 'pixiedust_small_brick',
				yield = 1,
				xpRequired = 40,
				xpGain = 5,
                requiredItems = {
                    { item = 'pixiedust', amount = 50 },
                    { item = 'bakingsoda', amount = 1 }
                }
            },
            {
                item = 'pixiedust_brick',
				yield = 1,
				xpRequired = 80,
				xpGain = 5,
                requiredItems = {
                    { item = 'pixiedust', amount = 100 },
                    { item = 'bakingsoda', amount = 1 }
                }
            },
            {
                item = 'weed_cokeleaf_seed',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'weed_cokeleaf', amount = 1 },
                    { item = 'razorblade', amount = 1 }
                }
            },
		--coke crafting
		}
	},
    police_bench = {
        object = `prop_tool_bench02_ld`,
        xpType = 'craftingrep',
        recipes = {
		--weapons crafting
            {
                item = 'weapon_draco',
				yield = 1,
				xpRequired = 3000,
				xpGain = 30,
                requiredItems = {
                    { item = 'plastic', amount = 5 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 3 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_sig516',
				yield = 1,
				xpRequired = 3000,
				xpGain = 30,
                requiredItems = {
                    { item = 'plastic', amount = 5 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 4 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_nsr',
				yield = 1,
				xpRequired = 3000,
				xpGain = 30,
                requiredItems = {
                    { item = 'plastic', amount = 5 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 5 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_gardone',
				yield = 1,
				xpRequired = 2000,
				xpGain = 20,
                requiredItems = {
                    { item = 'plastic', amount = 5 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 5 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_fnx',
				yield = 1,
				xpRequired = 3000,
				xpGain = 30,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    { item = 'metalscrap', amount = 2 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 10 },
                    { item = 'iron', amount = 2 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 5 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_g30',
				yield = 1,
				xpRequired = 2000,
				xpGain = 20,
                requiredItems = {
                    { item = 'plastic', amount = 5 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 6 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_tec9',
				yield = 1,
				xpRequired = 3000,
				xpGain = 30,
                requiredItems = {
                    { item = 'plastic', amount = 5 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 3 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_p226',
				yield = 1,
				xpRequired = 4000,
				xpGain = 41,
                requiredItems = {
                    { item = 'plastic', amount = 5 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 3 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_g18c',
				yield = 1,
				xpRequired = 5000,
				xpGain = 51,
                requiredItems = {
                    { item = 'plastic', amount = 5 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 2 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_g17',
				yield = 1,
				xpRequired = 6000,
				xpGain = 61,
                requiredItems = {
                    { item = 'plastic', amount = 5 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 2 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_barrett',
				yield = 1,
				xpRequired = 7000,
				xpGain = 72,
                requiredItems = {
                    { item = 'plastic', amount = 35 },
                    { item = 'metalscrap', amount = 10 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 35 },
                    { item = 'iron', amount = 3 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 10 },
                    { item = 'glass', amount = 6 },
                    { item = 'electronickit', amount = 12 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_mp5',
				yield = 1,
				xpRequired = 8000,
				xpGain = 82,
                requiredItems = {
                    { item = 'plastic', amount = 15 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 8 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_mac',
				yield = 1,
				xpRequired = 9000,
				xpGain = 92,
                requiredItems = {
                    { item = 'plastic', amount = 15 },
                    { item = 'metalscrap', amount = 3 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 12 },
                    { item = 'iron', amount = 4 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 7 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_m870',
				yield = 1,
				xpRequired = 10000,
				xpGain = 103,
                requiredItems = {
                    { item = 'plastic', amount = 15 },
                    { item = 'metalscrap', amount = 3 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 15 },
                    { item = 'iron', amount = 2 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 6 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 9 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
			--kyros above
			--vanilla start handguns
            {
                item = 'weapon_pistol',
				yield = 1,
				xpRequired = 4000,
				xpGain = 41,
                requiredItems = {
                    { item = 'plastic', amount = 5 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 2 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_combatpistol',
				yield = 1,
				xpRequired = 4000,
				xpGain = 41,
                requiredItems = {
                    { item = 'plastic', amount = 5 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 2 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
			-- vanilla sub MGs
            {
                item = 'weapon_assaultsmg',
				yield = 1,
				xpRequired = 5000,
				xpGain = 51,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    { item = 'metalscrap', amount = 2 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 10 },
                    { item = 'iron', amount = 2 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 6 },
                    { item = 'glass', amount = 3 },
                    { item = 'electronickit', amount = 4 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_smg',
				yield = 1,
				xpRequired = 5000,
				xpGain = 51,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    { item = 'metalscrap', amount = 2 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 10 },
                    { item = 'iron', amount = 2 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 6 },
                    { item = 'glass', amount = 3 },
                    { item = 'electronickit', amount = 4 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_machinepistol',
				yield = 1,
				xpRequired = 5000,
				xpGain = 51,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    { item = 'metalscrap', amount = 2 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 10 },
                    { item = 'iron', amount = 2 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 6 },
                    { item = 'glass', amount = 3 },
                    { item = 'electronickit', amount = 4 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
			-- vanilla shotguns
            {
                item = 'weapon_assaultshotgun',
				yield = 1,
				xpRequired = 6000,
				xpGain = 61,
                requiredItems = {
                    { item = 'plastic', amount = 15 },
                    { item = 'metalscrap', amount = 3 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 15 },
                    { item = 'iron', amount = 3 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 9 },
                    { item = 'glass', amount = 6 },
                    { item = 'electronickit', amount = 4 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_bullpupshotgun',
				yield = 1,
				xpRequired = 6000,
				xpGain = 61,
                requiredItems = {
                    { item = 'plastic', amount = 15 },
                    { item = 'metalscrap', amount = 3 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 15 },
                    { item = 'iron', amount = 3 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 9 },
                    { item = 'glass', amount = 6 },
                    { item = 'electronickit', amount = 4 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_combatshotgun',
				yield = 1,
				xpRequired = 6000,
				xpGain = 61,
                requiredItems = {
                    { item = 'plastic', amount = 15 },
                    { item = 'metalscrap', amount = 3 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 15 },
                    { item = 'iron', amount = 3 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 9 },
                    { item = 'glass', amount = 6 },
                    { item = 'electronickit', amount = 4 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
			-- vanilla ARs
            {
                item = 'weapon_assaultrifle',
				yield = 1,
				xpRequired = 7000,
				xpGain = 72,
                requiredItems = {
                    { item = 'plastic', amount = 20 },
                    { item = 'metalscrap', amount = 4 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 20 },
                    { item = 'iron', amount = 4 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 12 },
                    { item = 'glass', amount = 8 },
                    { item = 'electronickit', amount = 6 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_carbinerifle',
				yield = 1,
				xpRequired = 7000,
				xpGain = 72,
                requiredItems = {
                    { item = 'plastic', amount = 20 },
                    { item = 'metalscrap', amount = 4 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 20 },
                    { item = 'iron', amount = 4 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 12 },
                    { item = 'glass', amount = 8 },
                    { item = 'electronickit', amount = 6 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_specialcarbine_mk2',
				yield = 1,
				xpRequired = 7000,
				xpGain = 72,
                requiredItems = {
                    { item = 'plastic', amount = 20 },
                    { item = 'metalscrap', amount = 4 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 20 },
                    { item = 'iron', amount = 4 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 12 },
                    { item = 'glass', amount = 8 },
                    { item = 'electronickit', amount = 6 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
			--Vanilla MGs
            {
                item = 'weapon_mg',
				yield = 1,
				xpRequired = 8000,
				xpGain = 82,
                requiredItems = {
                    { item = 'plastic', amount = 25 },
                    { item = 'metalscrap', amount = 5 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 25 },
                    { item = 'iron', amount = 5 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 15 },
                    { item = 'glass', amount = 10 },
                    { item = 'electronickit', amount = 9 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
			--Vanilla Snipers
            {
                item = 'weapon_heavysniper',
				yield = 1,
				xpRequired = 9000,
				xpGain = 92,
                requiredItems = {
                    { item = 'plastic', amount = 30 },
                    { item = 'metalscrap', amount = 6 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 30 },
                    { item = 'iron', amount = 6 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 18 },
                    { item = 'glass', amount = 12 },
                    { item = 'electronickit', amount = 9 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
			--Vanilla Heavy
            -- {
                -- item = 'weapon_rpg',
				-- yield = 1,
				xpRequired = 10000,
				xpGain = 103,
                -- requiredItems = {
                    -- { item = 'plastic', amount = 50 },
                    -- { item = 'metalscrap', amount = 10 },
                    -- { item = 'copper', amount = 20000 },
                    -- { item = 'aluminum', amount = 50 },
                    -- { item = 'iron', amount = 10 },
                    -- { item = 'steel', amount = 100 },
                    -- { item = 'rubber', amount = 30 },
                    -- { item = 'glass', amount = 20 },
                    -- { item = 'electronickit', amount = 15 },
                    -- { item = 'weapon_hammer', amount = 2 },
                    -- { item = 'screwdriverset', amount = 2 }
                -- }
            -- },
			--Ammo Start
            {
                item = 'pistol_ammo',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    -- { item = 'metalscrap', amount = 1 },
                    { item = 'copper', amount = 5 },
                    { item = 'aluminum', amount = 2 },
                    -- { item = 'iron', amount = 1 },
                    -- { item = 'steel', amount = 1 },
                    { item = 'rubber', amount = 3 },
                    -- { item = 'glass', amount = 2 },
                    -- { item = 'advancedlockpick', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'rifle_ammo',
				yield = 1,
				xpRequired = 1500,
				xpGain = 15,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    -- { item = 'metalscrap', amount = 1 },
                    { item = 'copper', amount = 5 },
                    { item = 'aluminum', amount = 2 },
                    -- { item = 'iron', amount = 1 },
                    -- { item = 'steel', amount = 1 },
                    { item = 'rubber', amount = 3 },
                    -- { item = 'glass', amount = 2 },
                    -- { item = 'advancedlockpick', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'smg_ammo',
				yield = 1,
				xpRequired = 2000,
				xpGain = 20,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    -- { item = 'metalscrap', amount = 1 },
                    { item = 'copper', amount = 5 },
                    { item = 'aluminum', amount = 3 },
                    -- { item = 'iron', amount = 1 },
                    -- { item = 'steel', amount = 1 },
                    { item = 'rubber', amount = 3 },
                    -- { item = 'glass', amount = 2 },
                    -- { item = 'advancedlockpick', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'shotgun_ammo',
				yield = 1,
				xpRequired = 3000,
				xpGain = 30,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    -- { item = 'metalscrap', amount = 1 },
                    { item = 'copper', amount = 5 },
                    { item = 'aluminum', amount = 4 },
                    -- { item = 'iron', amount = 1 },
                    -- { item = 'steel', amount = 1 },
                    { item = 'rubber', amount = 3 },
                    -- { item = 'glass', amount = 2 },
                    -- { item = 'advancedlockpick', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'mg_ammo',
				yield = 1,
				xpRequired = 4000,
				xpGain = 41,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    -- { item = 'metalscrap', amount = 1 },
                    { item = 'copper', amount = 5 },
                    { item = 'aluminum', amount = 5 },
                    -- { item = 'iron', amount = 1 },
                    -- { item = 'steel', amount = 1 },
                    { item = 'rubber', amount = 3 },
                    -- { item = 'glass', amount = 2 },
                    -- { item = 'advancedlockpick', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'snp_ammo',
				yield = 1,
				xpRequired = 5000,
				xpGain = 51,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    -- { item = 'metalscrap', amount = 1 },
                    { item = 'copper', amount = 5 },
                    { item = 'aluminum', amount = 6 },
                    -- { item = 'iron', amount = 1 },
                    -- { item = 'steel', amount = 1 },
                    { item = 'rubber', amount = 3 },
                    -- { item = 'glass', amount = 2 },
                    -- { item = 'advancedlockpick', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'paintball_ammo',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    -- { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 0 },
                    { item = 'aluminum', amount = 1 },
                    -- { item = 'iron', amount = 1 },
                    -- { item = 'steel', amount = 1 },
                    { item = 'rubber', amount = 5 },
                    -- { item = 'glass', amount = 2 },
                    -- { item = 'advancedlockpick', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
		--weapons crafting
		}
	},
    gang_bench = {
        object = `prop_tool_bench02_ld`,
        xpType = 'craftingrep',
        recipes = {
		--weapons crafting
            {
                item = 'weapon_draco',
				yield = 1,
				xpRequired = 3000,
				xpGain = 30,
                requiredItems = {
                    { item = 'plastic', amount = 5 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 3 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_sig516',
				yield = 1,
				xpRequired = 3000,
				xpGain = 30,
                requiredItems = {
                    { item = 'plastic', amount = 5 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 4 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_nsr',
				yield = 1,
				xpRequired = 3000,
				xpGain = 30,
                requiredItems = {
                    { item = 'plastic', amount = 5 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 5 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_gardone',
				yield = 1,
				xpRequired = 2000,
				xpGain = 20,
                requiredItems = {
                    { item = 'plastic', amount = 5 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 5 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_fnx',
				yield = 1,
				xpRequired = 3000,
				xpGain = 30,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    { item = 'metalscrap', amount = 2 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 10 },
                    { item = 'iron', amount = 2 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 5 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_g30',
				yield = 1,
				xpRequired = 2000,
				xpGain = 20,
                requiredItems = {
                    { item = 'plastic', amount = 5 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 6 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_tec9',
				yield = 1,
				xpRequired = 3000,
				xpGain = 30,
                requiredItems = {
                    { item = 'plastic', amount = 5 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 3 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_p226',
				yield = 1,
				xpRequired = 4000,
				xpGain = 41,
                requiredItems = {
                    { item = 'plastic', amount = 5 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 3 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_g18c',
				yield = 1,
				xpRequired = 5000,
				xpGain = 51,
                requiredItems = {
                    { item = 'plastic', amount = 5 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 2 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_g17',
				yield = 1,
				xpRequired = 6000,
				xpGain = 61,
                requiredItems = {
                    { item = 'plastic', amount = 5 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 2 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_barrett',
				yield = 1,
				xpRequired = 7000,
				xpGain = 72,
                requiredItems = {
                    { item = 'plastic', amount = 35 },
                    { item = 'metalscrap', amount = 10 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 35 },
                    { item = 'iron', amount = 3 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 10 },
                    { item = 'glass', amount = 6 },
                    { item = 'electronickit', amount = 12 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_mp5',
				yield = 1,
				xpRequired = 8000,
				xpGain = 82,
                requiredItems = {
                    { item = 'plastic', amount = 15 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 8 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_mac',
				yield = 1,
				xpRequired = 9000,
				xpGain = 92,
                requiredItems = {
                    { item = 'plastic', amount = 15 },
                    { item = 'metalscrap', amount = 3 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 12 },
                    { item = 'iron', amount = 4 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 7 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_m870',
				yield = 1,
				xpRequired = 10000,
				xpGain = 103,
                requiredItems = {
                    { item = 'plastic', amount = 15 },
                    { item = 'metalscrap', amount = 3 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 15 },
                    { item = 'iron', amount = 2 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 6 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 9 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
			--kyros above
			--vanilla start handguns
            {
                item = 'weapon_pistol',
				yield = 1,
				xpRequired = 4000,
				xpGain = 41,
                requiredItems = {
                    { item = 'plastic', amount = 5 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 2 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_combatpistol',
				yield = 1,
				xpRequired = 4000,
				xpGain = 41,
                requiredItems = {
                    { item = 'plastic', amount = 5 },
                    { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 5 },
                    { item = 'iron', amount = 1 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 3 },
                    { item = 'glass', amount = 2 },
                    { item = 'electronickit', amount = 2 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
			-- vanilla sub MGs
            {
                item = 'weapon_assaultsmg',
				yield = 1,
				xpRequired = 5000,
				xpGain = 51,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    { item = 'metalscrap', amount = 2 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 10 },
                    { item = 'iron', amount = 2 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 6 },
                    { item = 'glass', amount = 3 },
                    { item = 'electronickit', amount = 4 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_smg',
				yield = 1,
				xpRequired = 5000,
				xpGain = 51,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    { item = 'metalscrap', amount = 2 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 10 },
                    { item = 'iron', amount = 2 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 6 },
                    { item = 'glass', amount = 3 },
                    { item = 'electronickit', amount = 4 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_machinepistol',
				yield = 1,
				xpRequired = 5000,
				xpGain = 51,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    { item = 'metalscrap', amount = 2 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 10 },
                    { item = 'iron', amount = 2 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 6 },
                    { item = 'glass', amount = 3 },
                    { item = 'electronickit', amount = 4 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
			-- vanilla shotguns
            {
                item = 'weapon_assaultshotgun',
				yield = 1,
				xpRequired = 6000,
				xpGain = 61,
                requiredItems = {
                    { item = 'plastic', amount = 15 },
                    { item = 'metalscrap', amount = 3 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 15 },
                    { item = 'iron', amount = 3 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 9 },
                    { item = 'glass', amount = 6 },
                    { item = 'electronickit', amount = 4 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_bullpupshotgun',
				yield = 1,
				xpRequired = 6000,
				xpGain = 61,
                requiredItems = {
                    { item = 'plastic', amount = 15 },
                    { item = 'metalscrap', amount = 3 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 15 },
                    { item = 'iron', amount = 3 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 9 },
                    { item = 'glass', amount = 6 },
                    { item = 'electronickit', amount = 4 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_combatshotgun',
				yield = 1,
				xpRequired = 6000,
				xpGain = 61,
                requiredItems = {
                    { item = 'plastic', amount = 15 },
                    { item = 'metalscrap', amount = 3 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 15 },
                    { item = 'iron', amount = 3 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 9 },
                    { item = 'glass', amount = 6 },
                    { item = 'electronickit', amount = 4 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
			-- vanilla ARs
            {
                item = 'weapon_assaultrifle',
				yield = 1,
				xpRequired = 7000,
				xpGain = 72,
                requiredItems = {
                    { item = 'plastic', amount = 20 },
                    { item = 'metalscrap', amount = 4 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 20 },
                    { item = 'iron', amount = 4 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 12 },
                    { item = 'glass', amount = 8 },
                    { item = 'electronickit', amount = 6 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_carbinerifle',
				yield = 1,
				xpRequired = 7000,
				xpGain = 72,
                requiredItems = {
                    { item = 'plastic', amount = 20 },
                    { item = 'metalscrap', amount = 4 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 20 },
                    { item = 'iron', amount = 4 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 12 },
                    { item = 'glass', amount = 8 },
                    { item = 'electronickit', amount = 6 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'weapon_specialcarbine_mk2',
				yield = 1,
				xpRequired = 7000,
				xpGain = 72,
                requiredItems = {
                    { item = 'plastic', amount = 20 },
                    { item = 'metalscrap', amount = 4 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 20 },
                    { item = 'iron', amount = 4 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 12 },
                    { item = 'glass', amount = 8 },
                    { item = 'electronickit', amount = 6 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
			--Vanilla MGs
            {
                item = 'weapon_mg',
				yield = 1,
				xpRequired = 8000,
				xpGain = 82,
                requiredItems = {
                    { item = 'plastic', amount = 25 },
                    { item = 'metalscrap', amount = 5 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 25 },
                    { item = 'iron', amount = 5 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 15 },
                    { item = 'glass', amount = 10 },
                    { item = 'electronickit', amount = 9 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
			--Vanilla Snipers
            {
                item = 'weapon_heavysniper',
				yield = 1,
				xpRequired = 9000,
				xpGain = 92,
                requiredItems = {
                    { item = 'plastic', amount = 30 },
                    { item = 'metalscrap', amount = 6 },
                    -- { item = 'copper', amount = 20000 },
                    { item = 'aluminum', amount = 30 },
                    { item = 'iron', amount = 6 },
                    { item = 'steel', amount = 100 },
                    { item = 'rubber', amount = 18 },
                    { item = 'glass', amount = 12 },
                    { item = 'electronickit', amount = 9 },
                    { item = 'weapon_hammer', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
			--Vanilla Heavy
            -- {
                -- item = 'weapon_rpg',
				-- yield = 1,
				xpRequired = 10000,
				xpGain = 103,
                -- requiredItems = {
                    -- { item = 'plastic', amount = 50 },
                    -- { item = 'metalscrap', amount = 10 },
                    -- { item = 'copper', amount = 20000 },
                    -- { item = 'aluminum', amount = 50 },
                    -- { item = 'iron', amount = 10 },
                    -- { item = 'steel', amount = 100 },
                    -- { item = 'rubber', amount = 30 },
                    -- { item = 'glass', amount = 20 },
                    -- { item = 'electronickit', amount = 15 },
                    -- { item = 'weapon_hammer', amount = 2 },
                    -- { item = 'screwdriverset', amount = 2 }
                -- }
            -- },
			--Ammo Start
            {
                item = 'pistol_ammo',
				yield = 1,
				xpRequired = 1000,
				xpGain = 10,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    -- { item = 'metalscrap', amount = 1 },
                    { item = 'copper', amount = 5 },
                    { item = 'aluminum', amount = 2 },
                    -- { item = 'iron', amount = 1 },
                    -- { item = 'steel', amount = 1 },
                    { item = 'rubber', amount = 3 },
                    -- { item = 'glass', amount = 2 },
                    -- { item = 'advancedlockpick', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'rifle_ammo',
				yield = 1,
				xpRequired = 1500,
				xpGain = 15,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    -- { item = 'metalscrap', amount = 1 },
                    { item = 'copper', amount = 5 },
                    { item = 'aluminum', amount = 2 },
                    -- { item = 'iron', amount = 1 },
                    -- { item = 'steel', amount = 1 },
                    { item = 'rubber', amount = 3 },
                    -- { item = 'glass', amount = 2 },
                    -- { item = 'advancedlockpick', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'smg_ammo',
				yield = 1,
				xpRequired = 2000,
				xpGain = 20,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    -- { item = 'metalscrap', amount = 1 },
                    { item = 'copper', amount = 5 },
                    { item = 'aluminum', amount = 3 },
                    -- { item = 'iron', amount = 1 },
                    -- { item = 'steel', amount = 1 },
                    { item = 'rubber', amount = 3 },
                    -- { item = 'glass', amount = 2 },
                    -- { item = 'advancedlockpick', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'shotgun_ammo',
				yield = 1,
				xpRequired = 3000,
				xpGain = 30,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    -- { item = 'metalscrap', amount = 1 },
                    { item = 'copper', amount = 5 },
                    { item = 'aluminum', amount = 4 },
                    -- { item = 'iron', amount = 1 },
                    -- { item = 'steel', amount = 1 },
                    { item = 'rubber', amount = 3 },
                    -- { item = 'glass', amount = 2 },
                    -- { item = 'advancedlockpick', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'mg_ammo',
				yield = 1,
				xpRequired = 4000,
				xpGain = 41,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    -- { item = 'metalscrap', amount = 1 },
                    { item = 'copper', amount = 5 },
                    { item = 'aluminum', amount = 5 },
                    -- { item = 'iron', amount = 1 },
                    -- { item = 'steel', amount = 1 },
                    { item = 'rubber', amount = 3 },
                    -- { item = 'glass', amount = 2 },
                    -- { item = 'advancedlockpick', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'snp_ammo',
				yield = 1,
				xpRequired = 5000,
				xpGain = 51,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    -- { item = 'metalscrap', amount = 1 },
                    { item = 'copper', amount = 5 },
                    { item = 'aluminum', amount = 6 },
                    -- { item = 'iron', amount = 1 },
                    -- { item = 'steel', amount = 1 },
                    { item = 'rubber', amount = 3 },
                    -- { item = 'glass', amount = 2 },
                    -- { item = 'advancedlockpick', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
            {
                item = 'paintball_ammo',
				yield = 1,
				xpRequired = 100,
				xpGain = 1,
                requiredItems = {
                    { item = 'plastic', amount = 10 },
                    -- { item = 'metalscrap', amount = 1 },
                    -- { item = 'copper', amount = 0 },
                    { item = 'aluminum', amount = 1 },
                    -- { item = 'iron', amount = 1 },
                    -- { item = 'steel', amount = 1 },
                    { item = 'rubber', amount = 5 },
                    -- { item = 'glass', amount = 2 },
                    -- { item = 'advancedlockpick', amount = 1 },
                    { item = 'screwdriverset', amount = 1 }
                }
            },
		--weapons crafting
		}
	}
}
Config.BonusZones = 
{
		['DrugLab1'] = {
		
            Center = vector3(2440.18, 4969.84, 46.82),
			Length = 30.0,
			Width = 30.0
        
		},
		['DrugLab2'] = {
		
            Center = vector3(1393.03, 3610.71, 38.94),
			Length = 20.0,
			Width = 20.0
        
		},
		['DrugLab3'] = {
		
            Center = vector3(244.14, 366.91, 105.74),
			Length = 6.0,
			Width = 6.0
        
		}
}
Config.TimeBonus = true
Config.YieldBonus = true
Config.debug = false
Config.BonusTime = 0.5 -- crafting time reduction in a percentage, default 0.75 reduces crafting times by 25%
Config.BonusYield = 2 -- crafting yield bonus in whole numbers only. 
Config.TTC = math.random(2000, 5000) -- time to craft in miliseconds default 2000-5000 or 2 - 5 seconds
Config.BlacklistItems = {
	'lean_large_bottle',
	'lean_small_bottle',
	'pixiedust_brick',
	'pixiedust_small_brick',
	'crack_small_brick',
	'crack_brick',
	'coke_brick',
	'coke_small_brick',
	'fentanyl_small_brick',
	'fentanyl_brick',
	'electronickit',
	'weed_brick',
	'whitewidow_weed_bag',
	'whitewidow_weed_brick',
	'purplehaze_weed_bag',
	'purplehaze_weed_brick',
	'ogkush_weed_bag',
	'ogkush_weed_brick',
	'skunk_weed_bag',
	'skunk_weed_brick',
	'amnesia_weed_bag',
	'amnesia_weed_brick',
	'ak47_weed_bag',
	'ak47_weed_brick',
}