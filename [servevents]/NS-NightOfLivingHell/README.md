# mt-hunting
Simple hunting script for QBCore

# Discord
https://discord.gg/AQHbsahZsV

# Preview
https://www.youtube.com/watch?v=-lqOiLwaBqQ

# Dependicies
- qb-core: https://github.com/qbcore-framework/qb-core
- qb-target: https://github.com/BerkieBb/qb-target
- qb-menu: https://github.com/qbcore-framework/qb-menu

# Add to qb-core/shared/items.lua

```
	-- mt-hunting
	['meatdeer'] 			 = {['name'] = 'meatdeer', 				['label'] = 'Deer Meat', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'meat.png', 		['unique'] = false, 		['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['meatpig'] 			 = {['name'] = 'meatpig', 				['label'] = 'Pig Meat', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'meat.png', 		['unique'] = false, 		['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['meatboar'] 			 = {['name'] = 'meatboar', 				['label'] = 'Boar Meat', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'meat.png', 		['unique'] = false, 		['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['meatlion'] 			 = {['name'] = 'meatlion', 				['label'] = 'Lion Meat', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'meat.png', 		['unique'] = false, 		['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['meatcow'] 			 = {['name'] = 'meatcow', 				['label'] = 'Cow Meat', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'meat.png', 		['unique'] = false, 		['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['meatcoyote'] 			 = {['name'] = 'meatcoyote', 			['label'] = 'Coyote Meat', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'meat.png', 		['unique'] = false, 		['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['meatrabbit'] 			 = {['name'] = 'meatrabbit', 			['label'] = 'Rabbit Meat', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'meat.png', 		['unique'] = false, 		['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['meatbird'] 			 = {['name'] = 'meatbird', 				['label'] = 'Bird Meat', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'meat.png', 		['unique'] = false, 		['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['meatseagull'] 	     = {['name'] = 'meatseagull', 			['label'] = 'Seagull Meat', 		    ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'meat.png', 		['unique'] = false, 		['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['meatcormorant'] 	     = {['name'] = 'meatcormorant', 		['label'] = 'Cormorant Meat', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'meat.png', 		['unique'] = false, 		['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['meatchickenhawk'] 	 = {['name'] = 'meatchickenhawk', 		['label'] = 'Chicken Meat', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'meat.png', 		['unique'] = false, 		['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['meatcrow'] 			 = {['name'] = 'meatcrow', 				['label'] = 'Crow Meat', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'meat.png', 		['unique'] = false, 		['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},

```

# Add to qb-target/init.lua

```
	["mt-hunting"] = {
        models = {
            "cs_hunter",
        },
        options = {
            {
                type = "client",
                event = "mt-hunting:client:LojaCaca",
                icon = "fas fa-circle",
                label = "Talk to employee",
            },
        },
        distance = 2.5,
    },
```

```
{ --mt-hunting
	model = 'cs_hunter',
	coords = vector4(-776.04, 5602.91, 32.74, 270.54),
	gender = 'male',
	freeze = true,
	invincible = false,
	blockevents = false,
},
```
