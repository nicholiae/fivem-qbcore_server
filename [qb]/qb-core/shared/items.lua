QBShared = QBShared or {}
QBShared.Items = {

	
	-- WALLETS
	['wallet'] = {
		['name'] = 'wallet',
		['label'] = 'Leather Wallet',
		['weight'] = 100,
		['type'] = 'item',
		['image'] = 'wallet.png',
		['unique'] = true,
		['useable'] = true,
		['shouldClose'] = true,
		['combinable'] = nil,
		['description'] = 'A simple leather wallet for carrying small items'
	},

	['wallet_premium'] = {
		['name'] = 'wallet_premium',
		['label'] = 'Premium Wallet',
		['weight'] = 150,
		['type'] = 'item',
		['image'] = 'wallet_premium.png',
		['unique'] = true,
		['useable'] = true,
		['shouldClose'] = true,
		['combinable'] = nil,
		['description'] = 'A premium leather wallet with extra space'
	},

	-- BACKPACKS
	['backpack_small'] = {
		['name'] = 'backpack_small',
		['label'] = 'Small Backpack',
		['weight'] = 500,
		['type'] = 'item',
		['image'] = 'backpack_small.png',
		['unique'] = true,
		['useable'] = true,
		['shouldClose'] = true,
		['combinable'] = nil,
		['description'] = 'A small backpack for carrying extra items'
	},

	['backpack_medium'] = {
		['name'] = 'backpack_medium',
		['label'] = 'Medium Backpack',
		['weight'] = 750,
		['type'] = 'item',
		['image'] = 'backpack_medium.png',
		['unique'] = true,
		['useable'] = true,
		['shouldClose'] = true,
		['combinable'] = nil,
		['description'] = 'A medium-sized backpack with decent storage'
	},

	['backpack_large'] = {
		['name'] = 'backpack_large',
		['label'] = 'Large Backpack',
		['weight'] = 1000,
		['type'] = 'item',
		['image'] = 'backpack_large.png',
		['unique'] = true,
		['useable'] = true,
		['shouldClose'] = true,
		['combinable'] = nil,
		['description'] = 'A large backpack with plenty of storage space'
	},

	-- FURNITURE STORAGE
	['storage_crate'] = {
		['name'] = 'storage_crate',
		['label'] = 'Storage Crate',
		['weight'] = 5000,
		['type'] = 'item',
		['image'] = 'storage_crate.png',
		['unique'] = false,
		['useable'] = true,
		['shouldClose'] = true,
		['combinable'] = nil,
		['description'] = 'A wooden storage crate that can be placed in your house'
	},

	['storage_safe'] = {
		['name'] = 'storage_safe',
		['label'] = 'Personal Safe',
		['weight'] = 10000,
		['type'] = 'item',
		['image'] = 'storage_safe.png',
		['unique'] = false,
		['useable'] = true,
		['shouldClose'] = true,
		['combinable'] = nil,
		['description'] = 'A secure safe for valuable items'
	},

	['storage_cabinet'] = {
		['name'] = 'storage_cabinet',
		['label'] = 'Storage Cabinet',
		['weight'] = 8000,
		['type'] = 'item',
		['image'] = 'storage_cabinet.png',
		['unique'] = false,
		['useable'] = true,
		['shouldClose'] = true,
		['combinable'] = nil,
		['description'] = 'A large storage cabinet for your home'
	},
	
	physicalcash = {
		name = "physicalcash",
		label = "Physical Cash",
		weight = 100,
		type = "item",
		image = "cashstack.png",
		unique = true,
		useable = true,
		shouldClose = true,
		description = "Physical cash that can be traded hand-to-hand"
	},
	skateboard = {name = "skateboard", label = "Skateboard", weight = 100, type = "item", image = "skateboard.png", unique = true, useable = true, shouldClose = true,  description = "A cool skateboard!"},
--tequilala
	walk_me_down 			 		= {name = 'walk_me_down', 					label = 'Walk Me Down', 			weight  = 100, 		type = 'item', 		image = 'walk_me_down.png', 		unique = false, 	useable = true, 	shouldClose = true,	      description = 'You are going to need an assist after this'},
	old_fashioned 			 		= {name = 'old_fashioned', 					label = 'Old Fashioned', 			weight  = 100, 		type = 'item', 		image = 'old_fashioned.png', 		unique = false, 	useable = true, 	shouldClose = true,	      description = 'Call me...wait, what'},
	pizza_burger 			 		= {name = 'pizza_burger', 					label = 'Pizza Burger', 			weight  = 100, 		type = 'item', 		image = 'pizza_burger.png', 		unique = false, 	useable = true, 	shouldClose = true,	      description = 'The two best things on earth in one'},
	ground_beef_pastel 			 	= {name = 'ground_beef_pastel', 			label = 'Ground Beef Pastel', 		weight  = 100, 		type = 'item', 		image = 'ground_beef_pastel.png', 	unique = false, 	useable = true, 	shouldClose = true,	      description = 'Did you know this amount of goodness could fit on one plate'},
	tenderloin_horseshoe 			= {name = 'tenderloin_horseshoe', 			label = 'Tenderloin Horseshoe', 	weight  = 100, 		type = 'item', 		image = 'tenderloin_horseshoe.png', unique = false, 	useable = true, 	shouldClose = true,	      description = 'I dont think this comes from a horse...'},
	quesabirria_tacos 			 	= {name = 'quesabirria_tacos', 				label = 'Quesabirria Tacos', 		weight  = 100, 		type = 'item', 		image = 'quesabirria_tacos.png', 	unique = false, 	useable = true, 	shouldClose = true,	      description = 'Tacos.. nuff said'},
	sonoran_hot_dog 			 	= {name = 'sonoran_hot_dog', 				label = 'Sonoran Hot Dog', 			weight  = 100, 		type = 'item', 		image = 'sonoran_hot_dog.png', 		unique = false, 	useable = true, 	shouldClose = true,	      description = 'This will be your new favorite dog'},
	sour_apple_highball 			= {name = 'sour_apple_highball', 			label = 'Sour Apple Highball', 		weight  = 100, 		type = 'item', 		image = 'sour_apple_highball.png', 	unique = false, 	useable = true, 	shouldClose = true,	      description = 'No low balls here'},
	take_9 			 		 		= {name = 'take_9', 						label = 'Take 9', 					weight  = 100, 		type = 'item', 		image = 'take_9.png', 				unique = false, 	useable = true, 	shouldClose = true,	      description = 'Take as long as you like'},
	fish_bowl 			 		 	= {name = 'fish_bowl', 						label = 'Fish Bowl', 				weight  = 100, 		type = 'item', 		image = 'fish_bowl.png', 			unique = false, 	useable = true, 	shouldClose = true,	      description = 'Gold fish not included'},
	last_word 			 		 	= {name = 'last_word', 						label = 'Last Word', 				weight  = 100, 		type = 'item', 		image = 'last_word.png', 			unique = false, 	useable = true, 	shouldClose = true,	      description = 'You only get one'},
	aperol_spritz 			 		= {name = 'aperol_spritz', 					label = 'Aperol Spritz', 			weight  = 100, 		type = 'item', 		image = 'aperol_spritz.png', 		unique = false, 	useable = true, 	shouldClose = true,	      description = 'Spritz up your life?'},
	black_russian 			 		= {name = 'black_russian', 					label = 'Black Russian', 			weight  = 100, 		type = 'item', 		image = 'black_russian.png', 		unique = false, 	useable = true, 	shouldClose = true,	      description = 'A potent combination, if I do say so myself'},
	irish_coffee 			 		= {name = 'irish_coffee', 					label = 'Irish Coffee', 			weight  = 100, 		type = 'item', 		image = 'irish_coffee.png', 		unique = false, 	useable = true, 	shouldClose = true,	      description = 'The Irish always know how to spice it up'},
	panty_dropper 			 		= {name = 'panty_dropper', 					label = 'Panty Dropper', 			weight  = 100, 		type = 'item', 		image = 'panty_dropper.png', 		unique = false, 	useable = true, 	shouldClose = true,	      description = 'Need some? Ya you do.'},
	
--brutal ems
	head_bandage 			 		 = {name = 'head_bandage', 					label = 'Head Bandage', 				weight  = 100, 		type = 'item', 		image = 'head_bandage.png', 				unique = false, 	useable = true, 	shouldClose = true,	      description = ''},
	arm_wrap 			 			 = {name = 'arm_wrap', 						label = 'Arm Wrap', 					weight  = 100, 		type = 'item', 		image = 'arm_wrap.png', 				unique = false, 	useable = true, 	shouldClose = true,	      description = ''},
	leg_plaster 					 = {name = 'leg_plaster', 					label = 'Leg Plaster', 					weight  = 100, 		type = 'item', 		image = 'leg_plaster.png', 				unique = false, 	useable = true, 	shouldClose = true,	      description = ''},
	body_bandage 					 = {name = 'body_bandage', 					label = 'Body Bandage', 				weight  = 100, 		type = 'item', 		image = 'body_bandage.png', 				unique = false, 	useable = true, 	shouldClose = true,	      description = ''},
	bandage 			 			 = {name = 'bandage', 						label = 'Bandage', 						weight  = 100, 		type = 'item', 		image = 'bandage.png', 				unique = false, 	useable = true, 	shouldClose = true,	      description = ''},
	medikit 			 			 = {name = 'medikit', 						label = 'Medikit', 						weight  = 100, 		type = 'item', 		image = 'medikit.png', 				unique = false, 	useable = true, 	shouldClose = true,	      description = ''},
	small_heal 						 = {name = 'small_heal', 					label = 'Small Heal', 					weight  = 100, 		type = 'item', 		image = 'small_heal.png', 				unique = false, 	useable = true, 	shouldClose = true,	      description = ''},
	big_heal 						 = {name = 'big_heal', 						label = 'Big Heal', 					weight  = 100, 		type = 'item', 		image = 'big_heal.png', 				unique = false, 	useable = true, 	shouldClose = true,	      description = ''},

--Perscriptions
    xscript                = { name = 'xscript', label = 'Xanax Prescription', 			weight  = 100, type = 'item', image = 'weapon_license.png', unique = true, useable = true, shouldClose = true, description = 'Prescription for Xanax' },
    mscript                = { name = 'mscript', label = 'Morphine Prescription', 		weight  = 100, type = 'item', image = 'weapon_license.png', unique = true, useable = true, shouldClose = true, description = 'Prescription for Morphine' },
    oscript                = { name = 'oscript', label = 'Oxycodone Prescription', 		weight  = 100, type = 'item', image = 'weapon_license.png', unique = true, useable = true, shouldClose = true, description = 'Prescription for Oxycodone' },
    ascript                = { name = 'ascript', label = 'Amoxixillin Prescription', 	weight  = 100, type = 'item', image = 'weapon_license.png', unique = true, useable = true, shouldClose = true, description = 'Prescription for Amoxixillin' },
    iscript                = { name = 'iscript', label = 'Ibuprofen Prescription',		weight  = 100, type = 'item', image = 'weapon_license.png', unique = true, useable = true, shouldClose = true, description = 'Prescription for Ibuprofen' },

--Perscription Drugs
	xanax                = { name = 'xanax', 		label = 'Xanax', 		weight  = 100, type = 'item', image = 'xanax.png', 			unique = false, useable = true, shouldClose = true, description = 'A Prescription drug: Xanax makes your stress melt away' },
    morphine             = { name = 'morphine', 	label = 'Morphine', 	weight  = 100, type = 'item', image = 'morphine.png',	 	unique = false, useable = true, shouldClose = true, description = 'A Prescription drug: Morphine does the body gooooooda' },
    oxycodone            = { name = 'oxycodone', 	label = 'Oxycodone', 	weight  = 100, type = 'item', image = 'oxycodone.png', 		unique = false, useable = true, shouldClose = true, description = 'A Prescription drug: Oxys make you go forever!' },
    amoxixillin          = { name = 'amoxixillin', 	label = 'Amoxixillin', 	weight  = 100, type = 'item', image = 'amoxixillin.png', 	unique = false, useable = true, shouldClose = true, description = 'A Prescription drug: Amoxis make you Goooooooooooo!' },
    ibuprofen            = { name = 'ibuprofen', 	label = 'Ibuprofen', 	weight  = 100, type = 'item', image = 'ibuprofen.png', 		unique = false, useable = true, shouldClose = true, description = 'A Prescription drug: Ibu removes the bleed and hurt' },
    
	narcan            	= { name = 'narcan', 	label = 'Narcan', 	weight  = 100, type = 'item', image = 'narcan.png', unique = false, useable = true, shouldClose = true, description = 'A Powerful Counter Drug: narcan' },
	
	xanax_bottle		= { name = 'xanax_bottle', 		label = 'Xanax Bottle', 		weight  = 100, type = 'item', image = 'pillbottle.png', 			unique = false, useable = true, shouldClose = true, description = 'A Prescription drug bottle: with 25 pills' },
	morphine_bottle		= { name = 'morphine_bottle', 		label = 'Morphine Bottle', 		weight  = 100, type = 'item', image = 'pillbottle.png', 			unique = false, useable = true, shouldClose = true, description = 'A Prescription drug bottle: with 25 pills' },
	oxycodone_bottle		= { name = 'oxycodone_bottle', 		label = 'Oxycodone Bottle', 		weight  = 100, type = 'item', image = 'pillbottle.png', 			unique = false, useable = true, shouldClose = true, description = 'A Prescription drug bottle: with 25 pills' },
	amoxixillin_bottle		= { name = 'amoxixillin_bottle', 		label = 'Amoxixillin Bottle', 		weight  = 100, type = 'item', image = 'pillbottle.png', 			unique = false, useable = true, shouldClose = true, description = 'A Prescription drug bottle: with 25 pills' },
	ibuprofen_bottle		= { name = 'ibuprofen_bottle', 		label = 'Ibuprofen Bottle', 		weight  = 100, type = 'item', image = 'pillbottle.png', 			unique = false, useable = true, shouldClose = true, description = 'A Prescription drug bottle: with 25 pills' },

--casino 
	casino_goldchip 			 = {name = "casino_goldchip", 			 label = "Casino Chip", 			weight = 0, 		type = "item", 		image = "casino_goldchip.png", 				unique = false, 	useable = false, 	shouldClose = false,      description = "Diamond Casino Chip"},
	casino_member 				 = {name = "casino_member", 			 label = "Casino Membership", 		weight = 5, 		type = "item", 		image = "casino_member.png", 				unique = true, 		useable = false, 	shouldClose = false,      description = "Diamond Casino Member Card"},
	casino_vip 					 = {name = "casino_vip", 			 	 label = "V.I.P Membership", 		weight = 5, 		type = "item", 		image = "casino_vip.png", 				    unique = true, 		useable = false, 	shouldClose = false,      description = "Diamond Casino V.I.P Card"},

-- Fishing
	fishingrod 					 = {name = 'fishingrod', 					label = 'Fishing Rod', 				weight = 1000, 		type = 'item', 		image = 'fishingrod.png', 			unique = false, 	useable = true, 	shouldClose = true,		   description = 'With this I can catch the fish..'},
	fishingbait 				 = {name = 'fishingbait', 					label = 'Fishing Bait', 			weight  = 100, 		type = 'item', 		image = 'fishingbait.png', 			unique = false, 	useable = false, 	shouldClose = false,	   description = 'With this I can lure the fishessss..'},
	catfish 			 		 = {name = 'catfish', 						label = 'Catfish', 					weight = 1000, 		type = 'item', 		image = 'catfish.png', 				unique = false, 	useable = false, 	shouldClose = false,	   description = 'A Fish'},
	fish 						 = {name = 'fish', 							label = 'Fish', 					weight = 1000, 		type = 'item', 		image = 'fish.png', 				unique = false, 	useable = false, 	shouldClose = false,	   description = 'A Fish'},
	fish2 						 = {name = 'fish2', 						label = 'Fish', 					weight = 1000, 		type = 'item', 		image = 'fish2.png', 				unique = false, 	useable = false, 	shouldClose = false,	   description = 'A Fish'},
	goldfish 					 = {name = 'goldfish', 						label = 'Goldfish', 				weight = 1000, 		type = 'item', 		image = 'goldfish.png', 			unique = false, 	useable = false, 	shouldClose = false,	   description = 'A Fish'},
	largemouthbass 				 = {name = 'largemouthbass', 				label = 'Largemouth Bass', 			weight = 1000, 		type = 'item', 		image = 'largemouthbass.png', 		unique = false, 	useable = false, 	shouldClose = false,	   description = 'A Fish'},
	redfish 					 = {name = 'redfish', 						label = 'Redfish', 					weight = 1000, 		type = 'item', 		image = 'redfish.png', 				unique = false, 	useable = false, 	shouldClose = false,	   description = 'A Fish'},
	salmon 						 = {name = 'salmon', 						label = 'Salmon', 					weight = 1000, 		type = 'item', 		image = 'salmon.png', 				unique = false, 	useable = false, 	shouldClose = false,	   description = 'A Fish'},
	stingray 					 = {name = 'stingray', 						label = 'Stingray', 				weight = 1000, 		type = 'item', 		image = 'stingray.png', 			unique = false, 	useable = false, 	shouldClose = false,	   description = 'A Fish'},
	stripedbass 				 = {name = 'stripedbass', 					label = 'Striped Bass', 			weight = 1000, 		type = 'item', 		image = 'stripedbass.png', 			unique = false, 	useable = false, 	shouldClose = false,	   description = 'A Fish'},
	whale 			 			 = {name = 'whale', 						label = 'Whale', 					weight = 1000, 		type = 'item', 		image = 'whale.png', 				unique = false, 	useable = false, 	shouldClose = false,	   description = 'A Fish'},
	whale2 						 = {name = 'whale2', 						label = 'Whale', 					weight = 1000, 		type = 'item', 		image = 'whale2.png', 				unique = false, 	useable = false, 	shouldClose = false,	   description = 'A Fish'},
	
	scratch_ticket = { name = 'scratch_ticket', label = 'Scratch Ticket', weight  = 100, type = 'item', image = 'scratch_ticket.png', unique = false, useable = true, shouldClose = true,  description = 'Odds Are Meant to be Beaten' },

--dynx gym
	gym_pass	= {name = "gym_pass",  label = "Gym Membership", 	weight  = 100, type = "item", image = "gym_pass.png", unique = false, useable = false, 	shouldClose = false,      description = "Lifetime Gym Membership"},
	gym_shake	= {name = "gym_shake", label = "Pre-Workout Shake", weight  = 100, type = "item", image = "gym_shake.png", unique = false, useable = true, 	shouldClose = false,      description = "Drink this before a workout to increase skill gain"},
 
--drivein

	popcorn 		= {name = 'popcorn', 		label = 'Popcorn', 			weight = 500, 		type = 'item', 		image = 'popcorn.png', 			unique = false, 		useable = true, 	shouldClose = true,	      description = ''},
	candy 			= {name = 'candy', 			label = 'Candy', 			weight = 500, 		type = 'item', 		image = 'candy.png', 			unique = false, 		useable = true, 	shouldClose = true,	      description = ''},
	movieticket 	= {name = 'movieticket', 	label = 'Movie Ticket', 	weight = 500, 		type = 'item', 		image = 'movieticket.png', 		unique = false, 		useable = true, 	shouldClose = true,	      description = ''},
	
-- NS-hunting
	meatdeer 			 = {name = 'meatdeer', 				label = 'Deer Meat', 				weight = 500, 		type = 'item', 		image = 'deermeat.png', 		unique = false, 		useable = false, 	shouldClose = true,	      description = ''},
	meatpig 			 = {name = 'meatpig', 				label = 'Pig Meat', 				weight = 500, 		type = 'item', 		image = 'pigmeat.png', 			unique = false, 		useable = false, 	shouldClose = true,	      description = ''},
	meatboar 			 = {name = 'meatboar', 				label = 'Boar Meat', 				weight = 500, 		type = 'item', 		image = 'boarmeat.png', 		unique = false, 		useable = false, 	shouldClose = true,	      description = ''},
	meatlion 			 = {name = 'meatlion', 				label = 'Lion Meat', 				weight = 500, 		type = 'item', 		image = 'lionmeat.png', 		unique = false, 		useable = false, 	shouldClose = true,	      description = ''},
	meatcow 			 = {name = 'meatcow', 				label = 'Cow Meat', 				weight = 500, 		type = 'item', 		image = 'cowmeat.png', 			unique = false, 		useable = false, 	shouldClose = true,	      description = ''},
	meatcoyote 			 = {name = 'meatcoyote', 			label = 'Coyote Meat', 				weight = 500, 		type = 'item', 		image = 'coyotemeat.png', 		unique = false, 		useable = false, 	shouldClose = true,	      description = ''},
	meatrabbit 			 = {name = 'meatrabbit', 			label = 'Rabbit Meat', 				weight = 500, 		type = 'item', 		image = 'rabbitmeat.png', 		unique = false, 		useable = false, 	shouldClose = true,	      description = ''},
	meatbird 			 = {name = 'meatbird', 				label = 'Bird Meat', 				weight = 500, 		type = 'item', 		image = 'birdmeat.png', 		unique = false, 		useable = false, 	shouldClose = true,	      description = ''},
	meatseagull 	     = {name = 'meatseagull', 			label = 'Seagull Meat', 		    weight = 500, 		type = 'item', 		image = 'seagullmeat.png', 		unique = false, 		useable = false, 	shouldClose = true,	      description = ''},
	meatcormorant 	     = {name = 'meatcormorant', 		label = 'Cormorant Meat', 			weight = 500, 		type = 'item', 		image = 'cormorantmeat.png', 	unique = false, 		useable = false, 	shouldClose = true,	      description = ''},
	meatchickenhawk 	 = {name = 'meatchickenhawk', 		label = 'Chicken Meat', 			weight = 500, 		type = 'item', 		image = 'chickenmeat.png', 		unique = false, 		useable = false, 	shouldClose = true,	      description = ''},
	meatcrow 			 = {name = 'meatcrow', 				label = 'Crow Meat', 				weight = 500, 		type = 'item', 		image = 'crowmeat.png', 		unique = false, 		useable = false, 	shouldClose = true,	      description = ''},
	
--Butcher 

	groundmeat 	= {name = 'groundmeat', 	label = 'Ground Meat', 	weight = 500, 		type = 'item', 		image = 'groundmeat.png', 	unique = false, 		useable = false, 	shouldClose = true,	      description = ''},
	ribmeat 	= {name = 'ribmeat', 		label = 'Rib Meat', 	weight = 500, 		type = 'item', 		image = 'ribmeat.png', 		unique = false, 		useable = false, 	shouldClose = true,	      description = ''},
	loinmeat 	= {name = 'loinmeat', 		label = 'Loin Meat', 	weight = 500, 		type = 'item', 		image = 'loinmeat.png', 	unique = false, 		useable = false, 	shouldClose = true,	      description = ''},
	thighmeat 	= {name = 'thighmeat', 		label = 'Thigh Meat', 	weight = 500, 		type = 'item', 		image = 'thighmeat.png', 	unique = false, 		useable = false, 	shouldClose = true,	      description = ''},
	wingmeat 	= {name = 'wingmeat', 		label = 'Wing Meat', 	weight = 500, 		type = 'item', 		image = 'wingmeat.png',		unique = false, 		useable = false, 	shouldClose = true,	      description = ''},
	breastmeat 	= {name = 'breastmeat', 	label = 'Breast Meat',	weight = 500, 		type = 'item', 		image = 'breastmeat.png', 	unique = false, 		useable = false, 	shouldClose = true,	      description = ''},
	steakmeat 	= {name = 'steakmeat', 		label = 'Steak Meat', 	weight = 500, 		type = 'item', 		image = 'steakmeat.png', 	unique = false, 		useable = false, 	shouldClose = true,	      description = ''},
	sausagemeat = {name = 'sausagemeat', 	label = 'Sausage Meat', weight = 500, 		type = 'item', 		image = 'sausagemeat.png', 	unique = false, 		useable = false, 	shouldClose = true,	      description = ''},
	brisketmeat = {name = 'brisketmeat', 	label = 'Brisket Meat', weight = 500, 		type = 'item', 		image = 'brisketmeat.png', 	unique = false, 		useable = false, 	shouldClose = true,	      description = ''},
	
--Burgershot
	the_birdy_burger 		= {name = 'the_birdy_burger', 		label = 'The Birdy Burger', 			weight = 500, 		type = 'item', 		image = 'birdyburger.png', 					unique = false, 		useable = true, 	shouldClose = true,	      description = ''},
	little_creek_burger 	= {name = 'little_creek_burger', 	label = 'Little Creek Burger', 			weight = 500, 		type = 'item', 		image = 'littlecreekburger.png', 					unique = false, 		useable = true, 	shouldClose = true,	      description = ''},
	west_coast_deluxe 		= {name = 'west_coast_deluxe', 		label = 'West Coast Deluxe', 			weight = 500, 		type = 'item', 		image = 'westcoastdeluxe.png', 					unique = false, 		useable = true, 	shouldClose = true,	      description = ''},
	
	burger 					= {name = 'burger', 				label = 'HamBurger', 				weight = 500, 		type = 'item', 		image = 'burger.png', 					unique = false, 		useable = true, 	shouldClose = true,	      description = ''},
	chickennuggets 			= {name = 'chickennuggets', 		label = 'Chicken Nuggets', 			weight = 500, 		type = 'item', 		image = 'chickennuggets.png', 			unique = false, 		useable = true, 	shouldClose = true,	      description = ''},
	chickensandwich 		= {name = 'chickensandwich', 		label = 'Chicken Sandwich', 		weight = 500, 		type = 'item', 		image = 'chickensandwich.png', 			unique = false, 		useable = true, 	shouldClose = true,	      description = ''},
	chickentenders 			= {name = 'chickentenders', 		label = 'Chicken Tenders', 			weight = 500, 		type = 'item', 		image = 'chickentenders.png', 			unique = false, 		useable = true, 	shouldClose = true,	      description = ''},
	fries 					= {name = 'fries', 					label = 'French Fries', 			weight = 500, 		type = 'item', 		image = 'fries.png',					unique = false, 		useable = true, 	shouldClose = true,	      description = ''},
	grilledchickentenders 	= {name = 'grilledchickentenders', 	label = 'Grilled Chicken Tenders',	weight = 500, 		type = 'item', 		image = 'grilledchickentenders.png', 	unique = false, 		useable = true, 	shouldClose = true,	      description = ''},
	softdrink 				= {name = 'softdrink', 				label = 'Fountain Drink', 			weight = 500, 		type = 'item', 		image = 'softdrink.png', 				unique = false, 		useable = true, 	shouldClose = true,	      description = ''},
	
--psMDT
	mdtcitation 			= {name = 'mdtcitation', 			label = 'Citation', 		weight = 1000, 		type = 'item', 		image = 'citation.png', 	unique = true, 		useable = false, shouldClose = true,	      description = 'Citation from a police officer!'},
--boombox
	boombox 				= {name = 'boombox', 				label = 'Boombox', 			weight = 250, 		type = 'item', 		image = 'boombox.png', 		unique = true, 		useable = true, 	shouldClose = true,	      description = ''},
	
-- jim-mining stuff
	stone 		 	 			 = {name = "stone",           				label = "Stone",	 				weight = 2000, 	    type = "item", 		image = "stone.png", 				unique = false, 	useable = false, 	shouldClose = false,    description = "Stone woo"},

	uncut_emerald 				 = {name = "uncut_emerald", 			  	label = "Uncut Emerald", 			weight = 100, 		type = "item", 		image = "uncut_emerald.png", 		unique = false, 	useable = false, 	shouldClose = false,    description = "A rough Emerald"},
	uncut_ruby 					 = {name = "uncut_ruby", 			  	  	label = "Uncut Ruby", 				weight = 100, 		type = "item", 		image = "uncut_ruby.png", 			unique = false, 	useable = false, 	shouldClose = false,    description = "A rough Ruby"},
	uncut_diamond 				 = {name = "uncut_diamond", 			  	label = "Uncut Diamond", 			weight = 100, 		type = "item", 		image = "uncut_diamond.png", 		unique = false, 	useable = false, 	shouldClose = false,    description = "A rough Diamond"},
	uncut_sapphire 				 = {name = "uncut_sapphire", 			  	label = "Uncut Sapphire", 			weight = 100, 		type = "item", 		image = "uncut_sapphire.png", 		unique = false, 	useable = false, 	shouldClose = false,    description = "A rough Sapphire"},

	emerald 					 = {name = "emerald", 			  	  		label = "Emerald", 					weight = 100, 		type = "item", 		image = "emerald.png", 				unique = false, 	useable = false, 	shouldClose = false,    description = "A Emerald that shimmers"},
	ruby 						 = {name = "ruby", 			  	  			label = "Ruby", 					weight = 100, 		type = "item", 		image = "ruby.png", 				unique = false, 	useable = false, 	shouldClose = false,    description = "A Ruby that shimmers"},
	diamond 					 = {name = "diamond", 			  	  		label = "Diamond", 					weight = 100, 		type = "item", 		image = "diamond.png", 				unique = false, 	useable = false, 	shouldClose = false,    description = "A Diamond that shimmers"},
	sapphire 					 = {name = "sapphire", 			  	  		label = "Sapphire",					weight = 100, 		type = "item", 		image = "sapphire.png", 			unique = false, 	useable = false, 	shouldClose = false,    description = "A Sapphire that shimmers"},

	gold_ring 					 = {name = "gold_ring", 			  	  	label = "Gold Ring", 				weight = 200, 		type = "item", 		image = "gold_ring.png", 			unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	diamond_ring 				 = {name = "diamond_ring", 			  	  	label = "Diamond Ring", 			weight = 200, 		type = "item", 		image = "diamond_ring.png", 		unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	ruby_ring 					 = {name = "ruby_ring", 			  	  	label = "Ruby Ring", 				weight = 200, 		type = "item", 		image = "ruby_ring.png", 			unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	sapphire_ring 				 = {name = "sapphire_ring", 			  	label = "Sapphire Ring", 			weight = 200, 		type = "item", 		image = "sapphire_ring.png", 		unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	emerald_ring 				 = {name = "emerald_ring", 			  	  	label = "Emerald Ring", 			weight = 200, 		type = "item", 		image = "emerald_ring.png", 		unique = false, 	useable = false, 	shouldClose = false,    description = ""},

	silver_ring 				 = {name = "silver_ring", 			  		label = "Silver Ring", 				weight = 200, 		type = "item", 		image = "silver_ring.png", 			unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	diamond_ring_silver 		 = {name = "diamond_ring_silver", 		  	label = "Diamond Ring Silver", 		weight = 200, 		type = "item", 		image = "diamond_ring_silver.png", 	unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	ruby_ring_silver 			 = {name = "ruby_ring_silver", 			  	label = "Ruby Ring Silver", 		weight = 200, 		type = "item", 		image = "ruby_ring_silver.png", 	unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	sapphire_ring_silver 		 = {name = "sapphire_ring_silver", 		 	label = "Sapphire Ring Silver", 	weight = 200, 		type = "item", 		image = "sapphire_ring_silver.png", unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	emerald_ring_silver 		 = {name = "emerald_ring_silver", 		  	label = "Emerald Ring Silver", 		weight = 200, 		type = "item", 		image = "emerald_ring_silver.png", 	unique = false, 	useable = false, 	shouldClose = false,    description = ""},

	goldchain 				 	 = {name = "goldchain", 			  	  	label = "Golden Chain", 			weight = 200, 		type = "item", 		image = "goldchain.png", 			unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	diamond_necklace 			 = {name = "diamond_necklace", 			  	label = "Diamond Necklace", 		weight = 200, 		type = "item", 		image = "diamond_necklace.png", 	unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	ruby_necklace 				 = {name = "ruby_necklace", 			  	label = "Ruby Necklace", 			weight = 200, 		type = "item", 		image = "ruby_necklace.png", 		unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	sapphire_necklace 			 = {name = "sapphire_necklace", 			label = "Sapphire Necklace", 		weight = 200, 		type = "item", 		image = "sapphire_necklace.png", 	unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	emerald_necklace 			 = {name = "emerald_necklace", 			  	label = "Emerald Necklace", 		weight = 200, 		type = "item", 		image = "emerald_necklace.png", 	unique = false, 	useable = false, 	shouldClose = false,    description = ""},

	silverchain 				 = {name = "silverchain", 			  	 	label = "Silver Chain", 			weight = 200, 		type = "item", 		image = "silverchain.png", 			unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	diamond_necklace_silver 	 = {name = "diamond_necklace_silver", 		label = "Diamond Necklace Silver", 	weight = 200, 		type = "item", 		image = "diamond_necklace_silver.png", 	unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	ruby_necklace_silver 		 = {name = "ruby_necklace_silver", 			label = "Ruby Necklace Silver", 	weight = 200, 		type = "item", 		image = "ruby_necklace_silver.png", 		unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	sapphire_necklace_silver 	 = {name = "sapphire_necklace_silver", 		label = "Sapphire Necklace Silver", weight = 200, 		type = "item", 		image = "sapphire_necklace_silver.png", 	unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	emerald_necklace_silver 	 = {name = "emerald_necklace_silver", 		label = "Emerald Necklace Silver", 	weight = 200, 		type = "item", 		image = "emerald_necklace_silver.png", 	unique = false, 	useable = false, 	shouldClose = false,    description = ""},

	goldearring 				 = {name = "goldearring", 				  	label = "Golden Earrings", 			weight = 200, 		type = "item", 		image = "gold_earring.png", 		unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	diamond_earring 			 = {name = "diamond_earring", 			  	label = "Diamond Earrings", 		weight = 200, 		type = "item", 		image = "diamond_earring.png", 		unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	ruby_earring 				 = {name = "ruby_earring", 			  		label = "Ruby Earrings", 			weight = 200, 		type = "item", 		image = "ruby_earring.png", 		unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	sapphire_earring 			 = {name = "sapphire_earring", 				label = "Sapphire Earrings", 		weight = 200, 		type = "item", 		image = "sapphire_earring.png", 	unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	emerald_earring 			 = {name = "emerald_earring", 			  	label = "Emerald Earrings", 		weight = 200, 		type = "item", 		image = "emerald_earring.png", 		unique = false, 	useable = false, 	shouldClose = false,    description = ""},

	silverearring 				 = {name = "silverearring", 				label = "Silver Earrings", 			weight = 200, 		type = "item", 		image = "silver_earring.png", 		unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	diamond_earring_silver 		 = {name = "diamond_earring_silver", 		label = "Diamond Earrings Silver", 	weight = 200, 		type = "item", 		image = "diamond_earring_silver.png", 		unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	ruby_earring_silver 		 = {name = "ruby_earring_silver", 			label = "Ruby Earrings Silver", 	weight = 200, 		type = "item", 		image = "ruby_earring_silver.png", 		unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	sapphire_earring_silver 	 = {name = "sapphire_earring_silver", 		label = "Sapphire Earrings Silver", weight = 200, 		type = "item", 		image = "sapphire_earring_silver.png", 	unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	emerald_earring_silver 		 = {name = "emerald_earring_silver", 		label = "Emerald Earrings Silver", 	weight = 200, 		type = "item", 		image = "emerald_earring_silver.png", 		unique = false, 	useable = false, 	shouldClose = false,    description = ""},

	carbon 					 	 = {name = "carbon", 			  	  		label = "Carbon", 					weight = 1000, 		type = "item", 		image = "carbon.png", 				unique = false, 	useable = false, 	shouldClose = false,    description = "Carbon, a base ore."},
	ironore 					 = {name = "ironore", 			  	  		label = "Iron Ore", 				weight = 1000, 		type = "item", 		image = "ironore.png", 				unique = false, 	useable = false, 	shouldClose = false,    description = "Iron, a base ore."},
	copperore 					 = {name = "copperore", 			  	  	label = "Copper Ore", 				weight = 1000, 		type = "item", 		image = "copperore.png", 			unique = false, 	useable = false, 	shouldClose = false,    description = "Copper, a base ore."},
	goldore 					 = {name = "goldore", 			  	  		label = "Gold Ore", 				weight = 1000, 		type = "item", 		image = "goldore.png", 				unique = false, 	useable = false, 	shouldClose = false,    description = "Gold Ore"},
	silverore 					 = {name = "silverore", 			  	  	label = "Silver Ore", 				weight = 1000, 		type = "item", 		image = "silverore.png", 			unique = false, 	useable = false, 	shouldClose = false,    description = "Silver Ore"},

	goldingot 					 = {name = "goldingot", 			  	  	label = "Gold Ingot", 				weight = 1000, 		type = "item", 		image = "goldingot.png", 			unique = false, 	useable = false, 	shouldClose = false,    description = ""},
	silveringot 				 = {name = "silveringot", 			  	  	label = "Silver Ingot", 			weight = 1000, 		type = "item", 		image = "silveringot.png", 			unique = false, 	useable = false, 	shouldClose = false,    description = ""},

	pickaxe 					 = {name = "pickaxe", 			  	  		label = "Pickaxe", 					weight = 1000, 		type = "item", 		image = "pickaxe.png", 				unique = false, 	useable = false, 	shouldClose = false,    description = "" },
	miningdrill 				 = {name = "miningdrill", 			  	  	label = "Mining Drill", 			weight = 1000, 		type = "item", 		image = "miningdrill.png", 			unique = false, 	useable = false, 	shouldClose = false,    description = "" },
	mininglaser 				 = {name = "mininglaser", 			  	  	label = "Mining Laser", 			weight = 900, 		type = "item", 		image = "mininglaser.png", 			unique = false, 	useable = false, 	shouldClose = false,    description = "" },
	drillbit 					 = {name = "drillbit", 			  	  		label = "Drill Bit", 				weight  = 100, 		type = "item", 		image = "drillbit.png", 			unique = false, 	useable = false, 	shouldClose = false,    description = "" },

	goldpan 					 = {name = "goldpan", 			  	  		label = "Gold Panning Tray", 		weight  = 100, 		type = "item", 		image = "goldpan.png", 				unique = false, 	useable = false, 	shouldClose = false,    description = "" },

	bottle 						 = {name = "bottle", 			  	  		label = "Empty Bottle", 			weight  = 100, 		type = "item", 		image = "bottle.png", 				unique = false, 	useable = false, 	shouldClose = false,    description = "A glass bottle"},
	can 						 = {name = "can", 			  	  			label = "Empty Can", 				weight  = 100, 		type = "item", 		image = "can.png", 					unique = false, 	useable = false, 	shouldClose = false,    description = "An empty can, good for recycling"},

--Rusty Browns
	iced_coffee 			= {name = 'iced_coffee', 				label = 'Iced Coffee', 			weight = 500, 		type = 'item', 		image = 'icedcoffee.png', 		unique = false, 		useable = true, 	shouldClose = true,	      description = ''},
	hot_coffee 			 	= {name = 'hot_coffee', 				label = 'Hot Coffee', 			weight = 500, 		type = 'item', 		image = 'hotcoffee.png', 		unique = false, 		useable = true, 	shouldClose = true,	      description = ''},
	frozen_coffee 			= {name = 'frozen_coffee', 				label = 'Frozen Coffee', 		weight = 500, 		type = 'item', 		image = 'frozencoffee.png', 	unique = false, 		useable = true, 	shouldClose = true,	      description = ''},
	donut 			 		= {name = 'donut', 						label = 'Donut', 				weight = 500, 		type = 'item', 		image = 'donut.png', 			unique = false, 		useable = true, 	shouldClose = true,	      description = ''},
	breakfast_sandwich 		= {name = 'breakfast_sandwich', 		label = 'Breakfast Sandwich', 	weight = 500, 		type = 'item', 		image = 'breakfastsandwich.png',unique = false, 		useable = true, 	shouldClose = true,	      description = ''},
	bagel 			 		= {name = 'bagel', 						label = 'Bagel', 				weight = 500, 		type = 'item', 		image = 'bagel.png', 			unique = false, 		useable = true, 	shouldClose = true,	      description = ''},
	bacon_egg_roll 			= {name = 'bacon_egg_roll', 			label = 'Bacon Eggroll', 		weight = 500, 		type = 'item', 		image = 'baconeggroll.png', 	unique = false, 		useable = true, 	shouldClose = true,	      description = ''},
	hotdog 			 		= {name = 'hotdog', 					label = 'Hotdog', 				weight = 500, 		type = 'item', 		image = 'hotdog.png', 			unique = false, 		useable = true, 	shouldClose = true,	      description = ''},
	
	
	['basketball'] = 			{['name'] = 'basketball', ['label'] = 'Basketball', ['weight'] = 0, ['type'] = 'item', ['image'] = 'basketball.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Play basketball with your friends on any court'},
	['basketball_hoop'] = 		{['name'] = 'basketball_hoop', ['label'] = 'Basketball Hoop', ['weight'] = 0, ['type'] = 'item', ['image'] = 'basketball_hoop.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Place anywhere and play basketball wherever you want'},

	--Kyros Weapon Pack V2
    weapon_heraarms              = { name = 'weapon_heraarms',       label = 'HERA ARMS',          weight = 2000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'WEAPON_HERAARMS.png', unique = true, useable = false, description = '' },
    weapon_sa80                  = { name = 'weapon_sa80',           label = 'SA80',               weight = 5000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'WEAPON_SA80.png', unique = true, useable = false, description = '' },
    weapon_honeybadger           = { name = 'weapon_honeybadger',    label = 'HONEYBADGER',        weight = 5000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'WEAPON_HONEYBADGER.png', unique = true, useable = false, description = '' },
    weapon_m45a1                 = { name = 'weapon_m45a1',          label = 'COLT M45A1',         weight = 3000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'WEAPON_M45A1.png', unique = true, useable = false, description = '' },
    weapon_ace                   = { name = 'weapon_ace',            label = 'IWI Galil ACE',      weight = 6000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'WEAPON_ACE.png', unique = true, useable = false, description = '' },
    weapon_ak47                  = { name = 'weapon_ak47',           label = 'AK-47',              weight = 4500, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'WEAPON_AK47.png', unique = true, useable = false, description = '' },
    weapon_m14                   = { name = 'weapon_m14',            label = 'M14',                weight = 5500, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'WEAPON_M14.png', unique = true, useable = false, description = '' },
    weapon_rpk16                 = { name = 'weapon_rpk16',          label = 'RPK-16',             weight = 5000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'WEAPON_RPK16.png', unique = true, useable = false, description = '' },
    weapon_m249                  = { name = 'weapon_m249',           label = 'M249',               weight = 8500, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'WEAPON_M249.png', unique = true, useable = false, description = '' },
    weapon_m1918a2               = { name = 'weapon_m1918a2',        label = 'M1918A2',            weight = 4600, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'WEAPON_M1918A2.png', unique = true, useable = false, description = '' },
    weapon_lvoca                 = { name = 'weapon_lvoca',          label = 'LVOA-C',             weight = 5000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'WEAPON_LVOCA.png', unique = true, useable = false, description = '' },
    weapon_g36k                  = { name = 'weapon_g36k',           label = 'G36K',               weight = 7000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'WEAPON_G36K.png', unique = true, useable = false, description = '' },
    weapon_xm4                   = { name = 'weapon_xm4',            label = 'COLT XM4',           weight = 6000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'WEAPON_XM4.png', unique = true, useable = false, description = '' },
    weapon_gardone               = { name = 'weapon_gardone',        label = 'GARDONE',            weight = 2000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_GARDONE.png', unique = true, useable = false, description = '' },
    weapon_beretta               = { name = 'weapon_beretta',        label = 'BERETTA',            weight = 5000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_BERETTA.png', unique = true, useable = false, description = '' },
    weapon_python                = { name = 'weapon_python',         label = 'PYTHON',             weight = 4000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_PYTHON.png', unique = true, useable = false, description = '' },
    weapon_maxim9                = { name = 'weapon_maxim9',         label = 'MAXIM 9',            weight = 3000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_MAXIM9.png', unique = true, useable = false, description = '' },
    weapon_cj                    = { name = 'weapon_cj',             label = 'COLT JUNIOR',        weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_CJ.png', unique = true, useable = false, description = '' },
    weapon_snub                  = { name = 'weapon_snub',           label = 'SNUBNOSE REVOLVER',  weight = 1200, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_SNUB.png', unique = true, useable = false, description = '' },
    weapon_laugoarms             = { name = 'weapon_laugoarms',      label = 'LAUGO ARMS',         weight = 1500, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_LAUGOARMS.png', unique = true, useable = false, description = '' },
    weapon_b93r                  = { name = 'weapon_b93r',           label = 'Beretta 93R',        weight = 2000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_B93R.png', unique = true, useable = false, description = '' },
    weapon_makarov               = { name = 'weapon_makarov',        label = 'MAKAROV',            weight = 2000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_MAKAROV.png', unique = true, useable = false, description = '' },
    weapon_fn502                 = { name = 'weapon_fn502',          label = 'FN 502',             weight = 2000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_FN502.png', unique = true, useable = false, description = '' },
    weapon_1911                  = { name = 'weapon_1911',           label = '1911',               weight = 2000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_1911.png', unique = true, useable = false, description = '' },
    weapon_659                   = { name = 'weapon_659',            label = 'S&W M659',           weight = 1500, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_659.png', unique = true, useable = false, description = '' },
    weapon_m906                  = { name = 'weapon_m906',           label = 'ZORAKI M906',        weight = 1700, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_M906.png', unique = true, useable = false, description = '' },
    weapon_magpulpdr             = { name = 'weapon_magpulpdr',      label = 'MAGPUL PDR',         weight = 3000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'WEAPON_MAGPULPDR.png', unique = true, useable = false, description = '' },
    weapon_mp9                   = { name = 'weapon_mp9',            label = 'B&T MP9',            weight = 4400, type = 'weapon', ammotype = 'AMMO_SMG', image = 'WEAPON_MP9.png', unique = true, useable = false, description = '' },
    weapon_m32                   = { name = 'weapon_m32',            label = 'M32 GL',             weight = 7500, type = 'weapon', ammotype = 'AMMO_GRENADELAUNCHER', image = 'WEAPON_M32.png', unique = true, useable = false, description = '' },
    weapon_bryson                = { name = 'weapon_bryson',         label = 'BRYSON 890',         weight = 5500, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'WEAPON_BRYSON.png', unique = true, useable = false, description = '' },
    weapon_aa12                  = { name = 'weapon_aa12',           label = 'AA-12',              weight = 6000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'WEAPON_AA12.png', unique = true, useable = false, description = '' },

	--Kyros Weapon Pack Police
    weapon_pdg19                 = { name = 'weapon_pdg19',       label = 'PD GLOCK 19',       weight = 2000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_PDG19.png', unique = true, useable = false, description = '' },
    weapon_pdg22                 = { name = 'weapon_pdg22',       label = 'PD GLOCK 22',       weight = 2000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_PDG22.png', unique = true, useable = false, description = '' },
    weapon_pdp88                 = { name = 'weapon_pdp88',       label = 'PD WALTHER P88',    weight = 2000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_PDP88.png', unique = true, useable = false, description = '' },
    weapon_pdhk45                = { name = 'weapon_pdhk45',      label = 'PD HK45',           weight = 2000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_PDHK45.png', unique = true, useable = false, description = '' },
    weapon_pdhkusp               = { name = 'weapon_pdhkusp',     label = 'PD HK USP',         weight = 2000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_PDHKUSP.png', unique = true, useable = false, description = '' },
    weapon_hk417                 = { name = 'weapon_hk417',       label = 'PD HK417',          weight = 4000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'WEAPON_HK417.png', unique = true, useable = false, description = '' },
    weapon_pdcm607               = { name = 'weapon_pdcm607',     label = 'PD COLT M607',      weight = 4000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'WEAPON_PDCM607.png', unique = true, useable = false, description = '' },
    weapon_pdc7                  = { name = 'weapon_pdc7',        label = 'PD COLT C7',        weight = 4500, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'WEAPON_PDC7.png', unique = true, useable = false, description = '' },
    weapon_pdhk33                = { name = 'weapon_pdhk33',      label = 'PD HK433',          weight = 4500, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'WEAPON_PDHK33.png', unique = true, useable = false, description = '' },
    weapon_pdbaton               = { name = 'weapon_pdbaton',     label = 'PD BATON',          weight = 1000,  type = 'weapon', ammotype = nil, image = 'WEAPON_PDBATON.png', unique = true, useable = false, description = '' },
    weapon_btaser                = { name = 'weapon_btaser',      label = 'PD BLACK TASER',    weight = 1000, type = 'weapon', ammotype = nil, image = 'WEAPON_BTASER.png', unique = true, useable = false, description = '' },
    weapon_ytaser                = { name = 'weapon_ytaser',      label = 'PD YELLOW TASER',   weight = 1000, type = 'weapon', ammotype = nil, image = 'WEAPON_YTASER.png', unique = true, useable = false, description = '' },
    weapon_pdbm3                 = { name = 'weapon_pdbm3',       label = 'PD BENELLI M3',     weight = 4800, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'WEAPON_PDBM3.png', unique = true, useable = false, description = '' },
    weapon_pd870                 = { name = 'weapon_pd870',       label = 'PD REMINGTON 870',  weight = 6000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'WEAPON_PD870.png', unique = true, useable = false, description = '' },
    weapon_pdm700                = { name = 'weapon_pdm700',      label = 'PD REMINGTON M700', weight = 8000, type = 'weapon', ammotype = 'AMMO_SNIPER', image = 'WEAPON_PDM700.png', unique = true, useable = false, description = '' },


--Kyros Weapon Pack V1
    weapon_draco                 = { name = 'weapon_draco',     label = 'MINI DRACO',       weight = 4500, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'WEAPON_DRACO.png', unique = true, shouldClose = false, useable = false, description = 'DRACO' },
    weapon_sig516                = { name = 'weapon_sig516',    label = 'SIG 516',          weight = 5500, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'WEAPON_SIG516.png', unique = true, shouldClose = false,useable = false, description = 'SIG516' },
    weapon_nsr                   = { name = 'weapon_nsr',       label = 'NSR',              weight = 5500, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'WEAPON_NSR.png', unique = true, shouldClose = false, useable = false, description = 'NSR' },
    weapon_gardone               = { name = 'weapon_gardone',   label = 'GARDONE',          weight = 2000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_GARDONE.png', unique = true, shouldClose = false, useable = false, description = 'GARDONE' },
    weapon_fnx                   = { name = 'weapon_fnx',       label = 'FNX .45',          weight = 2000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_FNX.png', unique = true, shouldClose = false, useable = false, description = 'FNX' },
    weapon_g30                   = { name = 'weapon_g30',       label = 'GLOCK 30',         weight = 2000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_G30.png', unique = true, shouldClose = false, useable = false, description = 'G30' },
    weapon_tec9                  = { name = 'weapon_tec9',      label = 'TEC-9',            weight = 3000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_TEC9.png', unique = true, shouldClose = false, useable = false, description = 'TEC9' },
    weapon_p226                  = { name = 'weapon_p226',      label = 'P226R',            weight = 1500, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_P226.png', unique = true, shouldClose = false, useable = false, description = 'P226' },
    weapon_g18c                  = { name = 'weapon_g18c',      label = 'GLOCK 18C',        weight = 1500, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_G18C.png', unique = true, shouldClose = false, useable = false, description = 'G18C' },
    weapon_g17                   = { name = 'weapon_g17',       label = 'GLOCK 17',         weight = 1800, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'WEAPON_G17.png', unique = true, shouldClose = false, useable = false, description = 'G17' },
    weapon_barrett               = { name = 'weapon_barrett',   label = 'BARRETT 50',       weight = 9000, type = 'weapon', ammotype = 'AMMO_SNIPER', image = 'WEAPON_BARRETT.png', unique = true, shouldClose = false, useable = false, description = 'BARRETT' },
    weapon_mp5                   = { name = 'weapon_mp5',       label = 'MP5',              weight = 3500, type = 'weapon', ammotype = 'AMMO_SMG', image = 'WEAPON_MP5.png', unique = true, shouldClose = false, useable = false, description = 'MP5' },
    weapon_mac                   = { name = 'weapon_mac',       label = 'MAC-10',           weight = 2500, type = 'weapon', ammotype = 'AMMO_SMG', image = 'WEAPON_MAC.png', unique = true, shouldClose = false, useable = false, description = 'MAC' },
    weapon_m870                  = { name = 'weapon_m870',      label = 'REMINGTON M870',   weight = 6500, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'WEAPON_M870.png', unique = true, shouldClose = false, useable = false, description = 'M870' },
    weapon_paintball             = { name = 'weapon_paintball', label = 'PAINT BALL GUN',   weight = 2500, type = 'weapon', ammotype = 'AMMO_PAINTBALL', image = 'WEAPON_PAINTBALL.png', unique = true, shouldClose = false, useable = false, description = 'PAINT GUN' },

    -- WEAPONS
    -- Melee
    weapon_unarmed               = { name = 'weapon_unarmed', label = 'Fists', weight = 1000, type = 'weapon', ammotype = nil, image = 'placeholder.png', unique = true, shouldClose = false, useable = false, description = 'Fisticuffs' },
    weapon_dagger                = { name = 'weapon_dagger', label = 'Dagger', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_dagger.png', unique = true, shouldClose = false, useable = false, description = 'A short knife with a pointed and edged blade, used as a weapon' },
    weapon_bat                   = { name = 'weapon_bat', label = 'Bat', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_bat.png', unique = true, shouldClose = false, useable = false, description = 'Used for hitting a ball in sports or other things' },
    weapon_bottle                = { name = 'weapon_bottle', label = 'Broken Bottle', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_bottle.png', unique = true, shouldClose = false, useable = false, description = 'A broken bottle' },
    weapon_crowbar               = { name = 'weapon_crowbar', label = 'Crowbar', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_crowbar.png', unique = true, shouldClose = false, useable = false, description = 'An iron bar with a flattened end, used as a lever' },
    weapon_flashlight            = { name = 'weapon_flashlight', label = 'Flashlight', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_flashlight.png', unique = true, shouldClose = false, useable = false, description = 'A battery-operated portable light' },
    weapon_golfclub              = { name = 'weapon_golfclub', label = 'Golfclub', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_golfclub.png', unique = true, shouldClose = false, useable = false, description = 'A club used to hit the ball in golf' },
    weapon_hammer                = { name = 'weapon_hammer', label = 'Hammer', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_hammer.png', unique = true, shouldClose = false, useable = false, description = 'Used for jobs such as breaking things (legs) and driving in nails' },
    weapon_hatchet               = { name = 'weapon_hatchet', label = 'Hatchet', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_hatchet.png', unique = true, shouldClose = false, useable = false, description = 'A small axe with a short handle for use in one hand' },
    weapon_knuckle               = { name = 'weapon_knuckle', label = 'Knuckle', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_knuckle.png', unique = true, shouldClose = false, useable = false, description = 'A metal guard worn over the knuckles in fighting, especially to increase the effect of the blows' },
    weapon_knife                 = { name = 'weapon_knife', label = 'Knife', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_knife.png', unique = true, shouldClose = false, useable = false, description = 'An instrument composed of a blade fixed into a handle, used for cutting or as a weapon' },
    weapon_machete               = { name = 'weapon_machete', label = 'Machete', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_machete.png', unique = true, shouldClose = false, useable = false, description = 'A broad, heavy knife used as a weapon' },
    weapon_switchblade           = { name = 'weapon_switchblade', label = 'Switchblade', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_switchblade.png', unique = true, shouldClose = false, useable = false, description = 'A knife with a blade that springs out from the handle when a button is pressed' },
    weapon_nightstick            = { name = 'weapon_nightstick', label = 'Nightstick', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_nightstick.png', unique = true, shouldClose = false, useable = false, description = 'A police officers club or billy' },
    weapon_wrench                = { name = 'weapon_wrench', label = 'Wrench', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_wrench.png', unique = true,  shouldClose = false,useable = false, description = 'A tool used for gripping and turning nuts, bolts, pipes, etc' },
    weapon_battleaxe             = { name = 'weapon_battleaxe', label = 'Battle Axe', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_battleaxe.png', unique = true, shouldClose = false, useable = false, description = 'A large broad-bladed axe used in ancient warfare' },
    weapon_poolcue               = { name = 'weapon_poolcue', label = 'Poolcue', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_poolcue.png', unique = true, shouldClose = false, useable = false, description = 'A stick used to strike a ball, usually the cue ball (or other things)' },
    weapon_briefcase             = { name = 'weapon_briefcase', label = 'Briefcase', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_briefcase.png', unique = true, shouldClose = false, useable = false, description = 'A briefcase for storing important documents' },
    weapon_briefcase_02          = { name = 'weapon_briefcase_02', label = 'Suitcase', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_briefcase2.png', unique = true, shouldClose = false, useable = false, description = 'Wonderfull for nice vacation to Liberty City' },
    weapon_garbagebag            = { name = 'weapon_garbagebag', label = 'Garbage Bag', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_garbagebag.png', unique = true, shouldClose = false, useable = false, description = 'A garbage bag' },
    weapon_handcuffs             = { name = 'weapon_handcuffs', label = 'Handcuffs', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_handcuffs.png', unique = true, shouldClose = false, useable = false, description = 'A pair of lockable linked metal rings for securing a prisoners wrists' },
    weapon_bread                 = { name = 'weapon_bread', label = 'Baquette', weight = 1000, type = 'weapon', ammotype = nil, image = 'baquette.png', unique = true, shouldClose = false, useable = false, description = 'Bread...?' },
    weapon_stone_hatchet         = { name = 'weapon_stone_hatchet', label = 'Stone Hatchet', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_stone_hatchet.png', unique = true, shouldClose = false, useable = true, description = 'Stone Hatchet' },
    weapon_candycane             = { name = 'weapon_candycane', label = 'Candy Cane', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_candycane', unique = true, shouldClose = false, useable = true, description = 'Candy Cane' },

    -- Handguns
    weapon_pistol                = { name = 'weapon_pistol', label = 'Walther P99', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_pistol.png', unique = true, shouldClose = false, useable = false, description = 'A small firearm designed to be held in one hand' },
    weapon_pistol_mk2            = { name = 'weapon_pistol_mk2', label = 'Pistol Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_pistol_mk2.png', unique = true, shouldClose = false, useable = false, description = 'An upgraded small firearm designed to be held in one hand' },
    weapon_combatpistol          = { name = 'weapon_combatpistol', label = 'Combat Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_combatpistol.png', unique = true, shouldClose = false, useable = false, description = 'A combat version small firearm designed to be held in one hand' },
    weapon_appistol              = { name = 'weapon_appistol', label = 'AP Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_appistol.png', unique = true, shouldClose = false, useable = false, description = 'A small firearm designed to be held in one hand that is automatic' },
    weapon_stungun               = { name = 'weapon_stungun', label = 'Taser', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_stungun.png', unique = true, shouldClose = false, useable = false, description = 'A weapon firing barbs attached by wires to batteries, causing temporary paralysis' },
    weapon_pistol50              = { name = 'weapon_pistol50', label = 'Pistol .50', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_pistol50.png', unique = true, shouldClose = false, useable = false, description = 'A .50 caliber firearm designed to be held with both hands' },
    weapon_snspistol             = { name = 'weapon_snspistol', label = 'SNS Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_snspistol.png', unique = true, shouldClose = false, useable = false, description = 'A very small firearm designed to be easily concealed' },
    weapon_heavypistol           = { name = 'weapon_heavypistol', label = 'Heavy Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_heavypistol.png', unique = true, shouldClose = false, useable = false, description = 'A hefty firearm designed to be held in one hand or attempted' },
    weapon_vintagepistol         = { name = 'weapon_vintagepistol', label = 'Vintage Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_vintagepistol.png', unique = true, shouldClose = false, useable = false, description = 'An antique firearm designed to be held in one hand' },
    weapon_flaregun              = { name = 'weapon_flaregun', label = 'Flare Gun', weight = 1000, type = 'weapon', ammotype = 'AMMO_FLARE', image = 'weapon_flaregun.png', unique = true, shouldClose = false, useable = false, description = 'A handgun for firing signal rockets' },
    weapon_marksmanpistol        = { name = 'weapon_marksmanpistol', label = 'Marksman Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_marksmanpistol.png', unique = true, shouldClose = false, useable = false, description = 'A very accurate small firearm designed to be held in one hand' },
    weapon_revolver              = { name = 'weapon_revolver', label = 'Revolver', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_revolver.png', unique = true, shouldClose = false, useable = false, description = 'A pistol with revolving chambers enabling several shots to be fired without reloading' },
    weapon_revolver_mk2          = { name = 'weapon_revolver_mk2', label = 'Violence', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_revolver_mk2.png', unique = true, shouldClose = false, useable = true, description = 'da Violence' },
    weapon_doubleaction          = { name = 'weapon_doubleaction', label = 'Double Action Revolver', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_doubleaction.png', unique = true, shouldClose = false, useable = true, description = 'Double Action Revolver' },
    weapon_snspistol_mk2         = { name = 'weapon_snspistol_mk2', label = 'Paintball Gun', weight = 1000, type = 'weapon', ammotype = 'AMMO_PAINTBALL', image = 'WEAPON_PAINTBALL.png', unique = true, shouldClose = false, useable = true, description = 'Paintball Gun' },
    weapon_raypistol             = { name = 'weapon_raypistol', label = 'Up-n-Atomizer', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_raypistol.png', unique = true, shouldClose = false, useable = true, description = 'Weapon Raypistol' },
    weapon_ceramicpistol         = { name = 'weapon_ceramicpistol', label = 'Ceramic Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_ceramicpistol.png', unique = true, shouldClose = false, useable = true, description = 'Weapon Ceramicpistol' },
    weapon_navyrevolver          = { name = 'weapon_navyrevolver', label = 'Navy Revolver', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_navyrevolver.png', unique = true, shouldClose = false, useable = true, description = 'Weapon Navyrevolver' },
    weapon_gadgetpistol          = { name = 'weapon_gadgetpistol', label = 'Perico Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_gadgetpistol.png', unique = true, shouldClose = false, useable = true, description = 'Weapon Gadgetpistol' },
    weapon_pistolxm3             = { name = 'weapon_pistolxm3', label = 'Pistol XM3', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_pistolxm3.png', unique = true, shouldClose = false, useable = true, description = 'Pistol XM3' },

    -- Submachine Guns
    weapon_microsmg              = { name = 'weapon_microsmg', label = 'Micro SMG', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_microsmg.png', unique = true, shouldClose = false, useable = false, description = 'A handheld light machine gun' },
    weapon_smg                   = { name = 'weapon_smg', label = 'SMG', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_smg.png', unique = true, shouldClose = false, useable = false, description = 'A handheld light machine gun' },
    weapon_smg_mk2               = { name = 'weapon_smg_mk2', label = 'SMG Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_smg_mk2.png', unique = true, shouldClose = false, useable = true, description = 'SMG MK2' },
    weapon_assaultsmg            = { name = 'weapon_assaultsmg', label = 'Assault SMG', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_assaultsmg.png', unique = true, shouldClose = false, useable = false, description = 'An assault version of a handheld light machine gun' },
    weapon_combatpdw             = { name = 'weapon_combatpdw', label = 'Combat PDW', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_combatpdw.png', unique = true, shouldClose = false, useable = false, description = 'A combat version of a handheld light machine gun' },
    weapon_machinepistol         = { name = 'weapon_machinepistol', label = 'Tec-9', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_machinepistol.png', unique = true, shouldClose = false, useable = false, description = 'A self-loading pistol capable of burst or fully automatic fire' },
    weapon_minismg               = { name = 'weapon_minismg', label = 'Mini SMG', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_minismg.png', unique = true, shouldClose = false, useable = false, description = 'A mini handheld light machine gun' },
    weapon_raycarbine            = { name = 'weapon_raycarbine', label = 'Unholy Hellbringer', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_raycarbine.png', unique = true, shouldClose = false, useable = true, description = 'Weapon Raycarbine' },

    -- Shotguns
    weapon_pumpshotgun           = { name = 'weapon_pumpshotgun', label = 'Pump Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_pumpshotgun.png', unique = true, shouldClose = false, useable = false, description = 'A pump-action smoothbore gun for firing small shot at short range' },
    weapon_sawnoffshotgun        = { name = 'weapon_sawnoffshotgun', label = 'Sawn-off Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_sawnoffshotgun.png', unique = true, shouldClose = false, useable = false, description = 'A sawn-off smoothbore gun for firing small shot at short range' },
    weapon_assaultshotgun        = { name = 'weapon_assaultshotgun', label = 'Assault Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_assaultshotgun.png', unique = true, shouldClose = false, useable = false, description = 'An assault version of asmoothbore gun for firing small shot at short range' },
    weapon_bullpupshotgun        = { name = 'weapon_bullpupshotgun', label = 'Bullpup Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_bullpupshotgun.png', unique = true, shouldClose = false, useable = false, description = 'A compact smoothbore gun for firing small shot at short range' },
    weapon_musket                = { name = 'weapon_musket', label = 'Musket', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_musket.png', unique = true, shouldClose = false, useable = false, description = 'An infantrymans light gun with a long barrel, typically smooth-bored, muzzleloading, and fired from the shoulder' },
    weapon_heavyshotgun          = { name = 'weapon_heavyshotgun', label = 'Heavy Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_heavyshotgun.png', unique = true, shouldClose = false, useable = false, description = 'A large smoothbore gun for firing small shot at short range' },
    weapon_dbshotgun             = { name = 'weapon_dbshotgun', label = 'Double-barrel Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_dbshotgun.png', unique = true, shouldClose = false, useable = false, description = 'A shotgun with two parallel barrels, allowing two single shots to be fired in quick succession' },
    weapon_autoshotgun           = { name = 'weapon_autoshotgun', label = 'Auto Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_autoshotgun.png', unique = true, shouldClose = false, useable = false, description = 'A shotgun capable of rapid continous fire' },
    weapon_pumpshotgun_mk2       = { name = 'weapon_pumpshotgun_mk2', label = 'Pumpshotgun Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_pumpshotgun_mk2.png', unique = true, shouldClose = false, useable = true, description = 'Pumpshotgun MK2' },
    weapon_combatshotgun         = { name = 'weapon_combatshotgun', label = 'Combat Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_combatshotgun.png', unique = true, shouldClose = false, useable = true, description = 'Weapon Combatshotgun' },

    -- Assault Rifles
    weapon_assaultrifle          = { name = 'weapon_assaultrifle', label = 'Assault Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_assaultrifle.png', unique = true, shouldClose = false, useable = false, description = 'A rapid-fire, magazine-fed automatic rifle designed for infantry use' },
    weapon_assaultrifle_mk2      = { name = 'weapon_assaultrifle_mk2', label = 'Assault Rifle Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_assaultrifle_mk2.png', unique = true, shouldClose = false, useable = true, description = 'Assault Rifle MK2' },
    weapon_carbinerifle          = { name = 'weapon_carbinerifle', label = 'Carbine Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_carbinerifle.png', unique = true, shouldClose = false, useable = false, description = 'A light automatic rifle' },
    weapon_carbinerifle_mk2      = { name = 'weapon_carbinerifle_mk2', label = 'Carbine Rifle Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_carbinerifle_mk2.png', unique = true, shouldClose = false, useable = true, description = 'Carbine Rifle MK2' },
    weapon_advancedrifle         = { name = 'weapon_advancedrifle', label = 'Advanced Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_advancedrifle.png', unique = true, shouldClose = false, useable = false, description = 'An assault version of a rapid-fire, magazine-fed automatic rifle designed for infantry use' },
    weapon_specialcarbine        = { name = 'weapon_specialcarbine', label = 'Special Carbine', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_specialcarbine.png', unique = true, shouldClose = false, useable = false, description = 'An extremely versatile assault rifle for any combat situation' },
    weapon_bullpuprifle          = { name = 'weapon_bullpuprifle', label = 'Bullpup Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_bullpuprifle.png', unique = true, shouldClose = false, useable = false, description = 'A compact automatic assault rifle' },
    weapon_compactrifle          = { name = 'weapon_compactrifle', label = 'Compact Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_compactrifle.png', unique = true, shouldClose = false, useable = false, description = 'A compact version of an assault rifle' },
    weapon_specialcarbine_mk2    = { name = 'weapon_specialcarbine_mk2', label = 'Special Carbine Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_specialcarbine_mk2.png', unique = true, shouldClose = false, useable = true, description = 'Weapon Wpecialcarbine MK2' },
    weapon_bullpuprifle_mk2      = { name = 'weapon_bullpuprifle_mk2', label = 'Bullpup Rifle Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_bullpuprifle_mk2.png', unique = true, shouldClose = false, useable = true, description = 'Bull Puprifle MK2' },
    weapon_militaryrifle         = { name = 'weapon_militaryrifle', label = 'Military Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_militaryrifle.png', unique = true, shouldClose = false, useable = true, description = 'Weapon Militaryrifle' },

    -- Light Machine Guns
    weapon_mg                    = { name = 'weapon_mg', label = 'Machinegun', weight = 1000, type = 'weapon', ammotype = 'AMMO_MG', image = 'weapon_mg.png', unique = true, shouldClose = false, useable = false, description = 'An automatic gun that fires bullets in rapid succession for as long as the trigger is pressed' },
    weapon_combatmg              = { name = 'weapon_combatmg', label = 'Combat MG', weight = 1000, type = 'weapon', ammotype = 'AMMO_MG', image = 'weapon_combatmg.png', unique = true, shouldClose = false, useable = false, description = 'A combat version of an automatic gun that fires bullets in rapid succession for as long as the trigger is pressed' },
    weapon_gusenberg             = { name = 'weapon_gusenberg', label = 'Thompson SMG', weight = 1000, type = 'weapon', ammotype = 'AMMO_MG', image = 'weapon_gusenberg.png', unique = true, shouldClose = false, useable = false, description = 'An automatic rifle commonly referred to as a tommy gun' },
    weapon_combatmg_mk2          = { name = 'weapon_combatmg_mk2', label = 'Combat MG Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_MG', image = 'weapon_combatmg_mk2.png', unique = true, shouldClose = false, useable = true, description = 'Weapon Combatmg MK2' },

    -- Sniper Rifles
    weapon_sniperrifle           = { name = 'weapon_sniperrifle', label = 'Sniper Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER', image = 'weapon_sniperrifle.png', unique = true, shouldClose = false, useable = false, description = 'A high-precision, long-range rifle' },
    weapon_heavysniper           = { name = 'weapon_heavysniper', label = 'Heavy Sniper', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER', image = 'weapon_heavysniper.png', unique = true, shouldClose = false, useable = false, description = 'An upgraded high-precision, long-range rifle' },
    weapon_marksmanrifle         = { name = 'weapon_marksmanrifle', label = 'Marksman Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER', image = 'weapon_marksmanrifle.png', unique = true, shouldClose = false, useable = false, description = 'A very accurate single-fire rifle' },
    weapon_remotesniper          = { name = 'weapon_remotesniper', label = 'Remote Sniper', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER_REMOTE', image = 'weapon_remotesniper.png', unique = true, shouldClose = false, useable = false, description = 'A portable high-precision, long-range rifle' },
    weapon_heavysniper_mk2       = { name = 'weapon_heavysniper_mk2', label = 'Heavy Sniper Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER', image = 'weapon_heavysniper_mk2.png', unique = true, shouldClose = false, useable = true, description = 'Weapon Heavysniper MK2' },
    weapon_marksmanrifle_mk2     = { name = 'weapon_marksmanrifle_mk2', label = 'Marksman Rifle Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER', image = 'weapon_marksmanrifle_mk2.png', unique = true, shouldClose = false, useable = true, description = 'Weapon Marksmanrifle MK2' },

    -- Heavy Weapons
    -- weapon_rpg                   = { name = 'weapon_rpg', label = 'RPG', weight = 1000, type = 'weapon', ammotype = 'AMMO_RPG', image = 'weapon_rpg.png', unique = true, shouldClose = false, useable = false, description = 'A rocket-propelled grenade launcher' },
    weapon_grenadelauncher       = { name = 'weapon_grenadelauncher', label = 'Grenade Launcher', weight = 1000, type = 'weapon', ammotype = 'AMMO_GRENADELAUNCHER', image = 'weapon_grenadelauncher.png', unique = true, shouldClose = false, useable = false, description = 'A weapon that fires a specially-designed large-caliber projectile, often with an explosive, smoke or gas warhead' },
    weapon_grenadelauncher_smoke = { name = 'weapon_grenadelauncher_smoke', label = 'Smoke Grenade Launcher', weight = 1000, type = 'weapon', ammotype = 'AMMO_GRENADELAUNCHER', image = 'weapon_grenadelauncher.png', unique = true, shouldClose = false, useable = false, description = 'A bomb that produces a lot of smoke when it explodes' },
    weapon_minigun               = { name = 'weapon_minigun', label = 'Minigun', weight = 1000, type = 'weapon', ammotype = 'AMMO_MINIGUN', image = 'weapon_minigun.png', unique = true, shouldClose = false, useable = false, description = 'A portable machine gun consisting of a rotating cluster of six barrels and capable of variable rates of fire of up to 6,000 rounds per minute' },
    weapon_firework              = { name = 'weapon_firework', label = 'Firework Launcher', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_firework.png', unique = true, shouldClose = false, useable = false, description = 'A device containing gunpowder and other combustible chemicals that causes a spectacular explosion when ignited' },
    weapon_railgun               = { name = 'weapon_railgun', label = 'Railgun', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_railgun.png', unique = true, shouldClose = false, useable = false, description = 'A weapon that uses electromagnetic force to launch high velocity projectiles' },
    weapon_railgunxm3            = { name = 'weapon_railgunxm3', label = 'Railgun XM3', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_railgunxm3.png', unique = true, shouldClose = false, useable = false, description = 'A weapon that uses electromagnetic force to launch high velocity projectiles' },
    weapon_hominglauncher        = { name = 'weapon_hominglauncher', label = 'Homing Launcher', weight = 1000, type = 'weapon', ammotype = 'AMMO_STINGER', image = 'weapon_hominglauncher.png', unique = true, shouldClose = false, useable = false, description = 'A weapon fitted with an electronic device that enables it to find and hit a target' },
    weapon_compactlauncher       = { name = 'weapon_compactlauncher', label = 'Compact Launcher', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_compactlauncher.png', unique = true, shouldClose = false, useable = false, description = 'A compact grenade launcher' },
    weapon_rayminigun            = { name = 'weapon_rayminigun', label = 'Widowmaker', weight = 1000, type = 'weapon', ammotype = 'AMMO_MINIGUN', image = 'weapon_rayminigun.png', unique = true, shouldClose = false, useable = true, description = 'Weapon Rayminigun' },

    -- Throwables
    weapon_grenade               = { name = 'weapon_grenade', label = 'Grenade', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_grenade.png', unique = true, shouldClose = false, useable = false, description = 'A handheld throwable bomb' },
    weapon_bzgas                 = { name = 'weapon_bzgas', label = 'BZ Gas', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_bzgas.png', unique = true, shouldClose = false, useable = false, description = 'A cannister of gas that causes extreme pain' },
    weapon_molotov               = { name = 'weapon_molotov', label = 'Molotov', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_molotov.png', unique = true, shouldClose = false, useable = false, description = 'A crude bomb made of a bottle filled with a flammable liquid and fitted with a wick for lighting' },
    weapon_stickybomb            = { name = 'weapon_stickybomb', label = 'C4', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_stickybomb.png', unique = true, shouldClose = false, useable = false, description = 'An explosive charge covered with an adhesive that when thrown against an object sticks until it explodes' },
    weapon_proxmine              = { name = 'weapon_proxmine', label = 'Proxmine Grenade', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_proximitymine.png', unique = true, shouldClose = false, useable = false, description = 'A bomb placed on the ground that detonates when going within its proximity' },
    weapon_snowball              = { name = 'weapon_snowball', label = 'Snowball', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_snowball.png', unique = true, shouldClose = false, useable = false, description = 'A ball of packed snow, especially one made for throwing at other people for fun' },
    weapon_pipebomb              = { name = 'weapon_pipebomb', label = 'Pipe Bomb', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_pipebomb.png', unique = true, shouldClose = false, useable = false, description = 'A homemade bomb, the components of which are contained in a pipe' },
    weapon_ball                  = { name = 'weapon_ball', label = 'Ball', weight = 1000, type = 'weapon', ammotype = 'AMMO_BALL', image = 'weapon_ball.png', unique = true, shouldClose = false, useable = false, description = 'A solid or hollow spherical or egg-shaped object that is kicked, thrown, or hit in a game' },
    weapon_smokegrenade          = { name = 'weapon_smokegrenade', label = 'Smoke Grenade', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_grenade.png', unique = true, shouldClose = false, useable = false, description = 'An explosive charge that can be remotely detonated' },
    weapon_flare                 = { name = 'weapon_flare', label = 'Flare pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_FLARE', image = 'weapon_flare.png', unique = true, shouldClose = false, useable = false, description = 'A small pyrotechnic devices used for illumination and signalling' },

    -- Miscellaneous
    weapon_petrolcan             = { name = 'weapon_petrolcan', label = 'Petrol Can', weight = 1000, type = 'weapon', ammotype = 'AMMO_PETROLCAN', image = 'weapon_petrolcan.png', unique = true, useable = false, shouldClose = false, description = 'A robust liquid container made from pressed steel' },
    weapon_fireextinguisher      = { name = 'weapon_fireextinguisher', label = 'Fire Extinguisher', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_fireextinguisher.png', unique = true, shouldClose = false, useable = false, description = 'A portable device that discharges a jet of water, foam, gas, or other material to extinguish a fire' },
    weapon_hazardcan             = { name = 'weapon_hazardcan', label = 'Hazardous Jerry Can', weight = 1000, type = 'weapon', ammotype = 'AMMO_PETROLCAN', image = 'weapon_hazardcan.png', unique = true, shouldClose = false, useable = true, description = 'Weapon Hazardcan' },

    -- Weapon Attachments
    clip_attachment              = { name = 'clip_attachment', label = 'Clip', weight = 1000, type = 'item', image = 'clip_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A clip for a weapon' },
    drum_attachment              = { name = 'drum_attachment', label = 'Drum', weight = 1000, type = 'item', image = 'drum_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A drum for a weapon' },
    flashlight_attachment        = { name = 'flashlight_attachment', label = 'Flashlight', weight = 1000, type = 'item', image = 'flashlight_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A flashlight for a weapon' },
    suppressor_attachment        = { name = 'suppressor_attachment', label = 'Suppressor', weight = 1000, type = 'item', image = 'suppressor_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A suppressor for a weapon' },
    smallscope_attachment        = { name = 'smallscope_attachment', label = 'Small Scope', weight = 1000, type = 'item', image = 'smallscope_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A small scope for a weapon' },
    medscope_attachment          = { name = 'medscope_attachment', label = 'Medium Scope', weight = 1000, type = 'item', image = 'medscope_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A medium scope for a weapon' },
    largescope_attachment        = { name = 'largescope_attachment', label = 'Large Scope', weight = 1000, type = 'item', image = 'largescope_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A large scope for a weapon' },
    holoscope_attachment         = { name = 'holoscope_attachment', label = 'Holo Scope', weight = 1000, type = 'item', image = 'holoscope_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A holo scope for a weapon' },
    advscope_attachment          = { name = 'advscope_attachment', label = 'Advanced Scope', weight = 1000, type = 'item', image = 'advscope_attachment.png', unique = false, useable = true, shouldClose = true, description = 'An advanced scope for a weapon' },
    nvscope_attachment           = { name = 'nvscope_attachment', label = 'Night Vision Scope', weight = 1000, type = 'item', image = 'nvscope_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A night vision scope for a weapon' },
    thermalscope_attachment      = { name = 'thermalscope_attachment', label = 'Thermal Scope', weight = 1000, type = 'item', image = 'thermalscope_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A thermal scope for a weapon' },
    flat_muzzle_brake            = { name = 'flat_muzzle_brake', label = 'Flat Muzzle Brake', weight = 1000, type = 'item', image = 'flat_muzzle_brake.png', unique = false, useable = true, shouldClose = true, description = 'A muzzle brake for a weapon' },
    tactical_muzzle_brake        = { name = 'tactical_muzzle_brake', label = 'Tactical Muzzle Brake', weight = 1000, type = 'item', image = 'tactical_muzzle_brake.png', unique = false, useable = true, shouldClose = true, description = 'A muzzle brakee for a weapon' },
    fat_end_muzzle_brake         = { name = 'fat_end_muzzle_brake', label = 'Fat End Muzzle Brake', weight = 1000, type = 'item', image = 'fat_end_muzzle_brake.png', unique = false, useable = true, shouldClose = true, description = 'A muzzle brake for a weapon' },
    precision_muzzle_brake       = { name = 'precision_muzzle_brake', label = 'Precision Muzzle Brake', weight = 1000, type = 'item', image = 'precision_muzzle_brake.png', unique = false, useable = true, shouldClose = true, description = 'A muzzle brake for a weapon' },
    heavy_duty_muzzle_brake      = { name = 'heavy_duty_muzzle_brake', label = 'HD Muzzle Brake', weight = 1000, type = 'item', image = 'heavy_duty_muzzle_brake.png', unique = false, useable = true, shouldClose = true, description = 'A muzzle brake for a weapon' },
    slanted_muzzle_brake         = { name = 'slanted_muzzle_brake', label = 'Slanted Muzzle Brake', weight = 1000, type = 'item', image = 'slanted_muzzle_brake.png', unique = false, useable = true, shouldClose = true, description = 'A muzzle brake for a weapon' },
    split_end_muzzle_brake       = { name = 'split_end_muzzle_brake', label = 'Split End Muzzle Brake', weight = 1000, type = 'item', image = 'split_end_muzzle_brake.png', unique = false, useable = true, shouldClose = true, description = 'A muzzle brake for a weapon' },
    squared_muzzle_brake         = { name = 'squared_muzzle_brake', label = 'Squared Muzzle Brake', weight = 1000, type = 'item', image = 'squared_muzzle_brake.png', unique = false, useable = true, shouldClose = true, description = 'A muzzle brake for a weapon' },
    bellend_muzzle_brake         = { name = 'bellend_muzzle_brake', label = 'Bellend Muzzle Brake', weight = 1000, type = 'item', image = 'bellend_muzzle_brake.png', unique = false, useable = true, shouldClose = true, description = 'A muzzle brake for a weapon' },
    barrel_attachment            = { name = 'barrel_attachment', label = 'Barrel', weight = 1000, type = 'item', image = 'barrel_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A barrel for a weapon' },
    grip_attachment              = { name = 'grip_attachment', label = 'Grip', weight = 1000, type = 'item', image = 'grip_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A grip for a weapon' },
    comp_attachment              = { name = 'comp_attachment', label = 'Compensator', weight = 1000, type = 'item', image = 'comp_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A compensator for a weapon' },
    luxuryfinish_attachment      = { name = 'luxuryfinish_attachment', label = 'Luxury Finish', weight = 1000, type = 'item', image = 'luxuryfinish_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A luxury finish for a weapon' },
    digicamo_attachment          = { name = 'digicamo_attachment', label = 'Digital Camo', weight = 1000, type = 'item', image = 'digicamo_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A digital camo for a weapon' },
    brushcamo_attachment         = { name = 'brushcamo_attachment', label = 'Brushstroke Camo', weight = 1000, type = 'item', image = 'brushcamo_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A brushstroke camo for a weapon' },
    woodcamo_attachment          = { name = 'woodcamo_attachment', label = 'Woodland Camo', weight = 1000, type = 'item', image = 'woodcamo_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A woodland camo for a weapon' },
    skullcamo_attachment         = { name = 'skullcamo_attachment', label = 'Skull Camo', weight = 1000, type = 'item', image = 'skullcamo_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A skull camo for a weapon' },
    sessantacamo_attachment      = { name = 'sessantacamo_attachment', label = 'Sessanta Nove Camo', weight = 1000, type = 'item', image = 'sessantacamo_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A sessanta nove camo for a weapon' },
    perseuscamo_attachment       = { name = 'perseuscamo_attachment', label = 'Perseus Camo', weight = 1000, type = 'item', image = 'perseuscamo_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A perseus camo for a weapon' },
    leopardcamo_attachment       = { name = 'leopardcamo_attachment', label = 'Leopard Camo', weight = 1000, type = 'item', image = 'leopardcamo_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A leopard camo for a weapon' },
    zebracamo_attachment         = { name = 'zebracamo_attachment', label = 'Zebra Camo', weight = 1000, type = 'item', image = 'zebracamo_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A zebra camo for a weapon' },
    geocamo_attachment           = { name = 'geocamo_attachment', label = 'Geometric Camo', weight = 1000, type = 'item', image = 'geocamo_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A geometric camo for a weapon' },
    boomcamo_attachment          = { name = 'boomcamo_attachment', label = 'Boom Camo', weight = 1000, type = 'item', image = 'boomcamo_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A boom camo for a weapon' },
    patriotcamo_attachment       = { name = 'patriotcamo_attachment', label = 'Patriot Camo', weight = 1000, type = 'item', image = 'patriotcamo_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A patriot camo for a weapon' },

    -- Weapon Tints
    weapontint_0                 = { name = 'weapontint_0', label = 'Default Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Default Black Weapon Tint' },
    weapontint_1                 = { name = 'weapontint_1', label = 'Green Tint', weight = 1000, type = 'item', image = 'weapontint_green.png', unique = false, useable = true, shouldClose = true, description = 'Green Weapon Tint' },
    weapontint_2                 = { name = 'weapontint_2', label = 'Gold Tint', weight = 1000, type = 'item', image = 'weapontint_gold.png', unique = false, useable = true, shouldClose = true, description = 'Gold Weapon Tint' },
    weapontint_3                 = { name = 'weapontint_3', label = 'Pink Tint', weight = 1000, type = 'item', image = 'weapontint_pink.png', unique = false, useable = true, shouldClose = true, description = 'Pink Weapon Tint' },
    weapontint_4                 = { name = 'weapontint_4', label = 'Army Tint', weight = 1000, type = 'item', image = 'weapontint_army.png', unique = false, useable = true, shouldClose = true, description = 'Army Weapon Tint' },
    weapontint_5                 = { name = 'weapontint_5', label = 'LSPD Tint', weight = 1000, type = 'item', image = 'weapontint_lspd.png', unique = false, useable = true, shouldClose = true, description = 'LSPD Weapon Tint' },
    weapontint_6                 = { name = 'weapontint_6', label = 'Orange Tint', weight = 1000, type = 'item', image = 'weapontint_orange.png', unique = false, useable = true, shouldClose = true, description = 'Orange Weapon Tint' },
    weapontint_7                 = { name = 'weapontint_7', label = 'Platinum Tint', weight = 1000, type = 'item', image = 'weapontint_plat.png', unique = false, useable = true, shouldClose = true, description = 'Platinum Weapon Tint' },
    weapontint_mk2_0             = { name = 'weapontint_mk2_0', label = 'Classic Black Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Classic Black Weapon Tint for MK2 Weapons' },
    weapontint_mk2_1             = { name = 'weapontint_mk2_1', label = 'Classic Gray Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Classic Gray Weapon Tint for MK2 Weapons' },
    weapontint_mk2_2             = { name = 'weapontint_mk2_2', label = 'Classic Two-Tone Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Classic Two-Tone Weapon Tint for MK2 Weapons' },
    weapontint_mk2_3             = { name = 'weapontint_mk2_3', label = 'Classic White Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Classic White Weapon Tint for MK2 Weapons' },
    weapontint_mk2_4             = { name = 'weapontint_mk2_4', label = 'Classic Beige Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Classic Beige Weapon Tint for MK2 Weapons' },
    weapontint_mk2_5             = { name = 'weapontint_mk2_5', label = 'Classic Green Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Classic Green Weapon Tint for MK2 Weapons' },
    weapontint_mk2_6             = { name = 'weapontint_mk2_6', label = 'Classic Blue Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Classic Blue Weapon Tint for MK2 Weapons' },
    weapontint_mk2_7             = { name = 'weapontint_mk2_7',  label = 'Classic Earth Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Classic Earth Weapon Tint for MK2 Weapons' },
    weapontint_mk2_8             = { name = 'weapontint_mk2_8',  label = 'Classic Brown & Black Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Classic Brown & Black Weapon Tint for MK2 Weapons' },
    weapontint_mk2_9             = { name = 'weapontint_mk2_9',  label = 'Red Contrast Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Red Contrast Weapon Tint for MK2 Weapons' },
    weapontint_mk2_10            = { name = 'weapontint_mk2_10', label = 'Blue Contrast Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Blue Contrast Weapon Tint for MK2 Weapons' },
    weapontint_mk2_11            = { name = 'weapontint_mk2_11', label = 'Yellow Contrast Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Yellow Contrast Weapon Tint for MK2 Weapons' },
    weapontint_mk2_12            = { name = 'weapontint_mk2_12', label = 'Orange Contrast Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Orange Contrast Weapon Tint for MK2 Weapons' },
    weapontint_mk2_13            = { name = 'weapontint_mk2_13', label = 'Bold Pink Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Bold Pink Weapon Tint for MK2 Weapons' },
    weapontint_mk2_14            = { name = 'weapontint_mk2_14', label = 'Bold Purple & Yellow Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Bold Purple & Yellow Weapon Tint for MK2 Weapons' },
    weapontint_mk2_15            = { name = 'weapontint_mk2_15', label = 'Bold Orange Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Bold Orange Weapon Tint for MK2 Weapons' },
    weapontint_mk2_16            = { name = 'weapontint_mk2_16', label = 'Bold Green & Purple Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Bold Green & Purple Weapon Tint for MK2 Weapons' },
    weapontint_mk2_17            = { name = 'weapontint_mk2_17', label = 'Bold Red Features Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Bold Red Features Weapon Tint for MK2 Weapons' },
    weapontint_mk2_18            = { name = 'weapontint_mk2_18', label = 'Bold Green Features Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Bold Green Features Weapon Tint for MK2 Weapons' },
    weapontint_mk2_19            = { name = 'weapontint_mk2_19', label = 'Bold Cyan Features Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Bold Cyan Features Weapon Tint for MK2 Weapons' },
    weapontint_mk2_20            = { name = 'weapontint_mk2_20', label = 'Bold Yellow Features Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Bold Yellow Features Weapon Tint for MK2 Weapons' },
    weapontint_mk2_21            = { name = 'weapontint_mk2_21', label = 'Bold Red & White Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Bold Red & White Weapon Tint for MK2 Weapons' },
    weapontint_mk2_22            = { name = 'weapontint_mk2_22', label = 'Bold Blue & White Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Bold Blue & White Weapon Tint for MK2 Weapons' },
    weapontint_mk2_23            = { name = 'weapontint_mk2_23', label = 'Metallic Gold Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Metallic Gold Weapon Tint for MK2 Weapons' },
    weapontint_mk2_24            = { name = 'weapontint_mk2_24', label = 'Metallic Platinum Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Metallic Platinum Weapon Tint for MK2 Weapons' },
    weapontint_mk2_25            = { name = 'weapontint_mk2_25', label = 'Metallic Gray & Lilac Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Metallic Gray & Lilac Weapon Tint for MK2 Weapons' },
    weapontint_mk2_26            = { name = 'weapontint_mk2_26', label = 'Metallic Purple & Lime Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Metallic Purple & Lime Weapon Tint for MK2 Weapons' },
    weapontint_mk2_27            = { name = 'weapontint_mk2_27', label = 'Metallic Red Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Metallic Red Weapon Tint for MK2 Weapons' },
    weapontint_mk2_28            = { name = 'weapontint_mk2_28', label = 'Metallic Green Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Metallic Green Weapon Tint for MK2 Weapons' },
    weapontint_mk2_29            = { name = 'weapontint_mk2_29', label = 'Metallic Blue Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Metallic Blue Weapon Tint for MK2 Weapons' },
    weapontint_mk2_30            = { name = 'weapontint_mk2_30', label = 'Metallic White & Aqua Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Metallic White & Aqua Weapon Tint for MK2 Weapons' },
    weapontint_mk2_31            = { name = 'weapontint_mk2_31', label = 'Metallic Orange & Yellow Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Metallic Orange & Yellow Weapon Tint for MK2 Weapons' },
    weapontint_mk2_32            = { name = 'weapontint_mk2_32', label = 'Metallic Red and Yellow Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Metallic Red and Yellow Weapon Tint for MK2 Weapons' },
    -- ITEMS

	--manish pulse nightclub
	long_island                         = { name = 'long_island', label = 'Long Island', weight = 200, type = 'item', image = 'long_island.png', unique = false, useable = true, shouldClose = true, description = 'TopShelf is good for you' },
    side_car                       	 	= { name = 'side_car', label = 'Side Car', weight = 200, type = 'item', image = 'side_car.png', unique = false, useable = true, shouldClose = true, description = 'TopShelf is good for you' },
    sex_on_the_beach                    = { name = 'sex_on_the_beach', label = 'Sex On The Beach', weight = 200, type = 'item', image = 'sex_on_the_beach.png', unique = false, useable = true, shouldClose = true, description = 'TopShelf is good for you' },
    hot_wings                       	= { name = 'hot_wings', label = 'Hot Wings', weight = 200, type = 'item', image = 'hot_wings.png', unique = false, useable = true, shouldClose = true, description = 'Nice to eat' },
    boneless_wings                      = { name = 'boneless_wings', label = 'Boneless Wings', weight = 200, type = 'item', image = 'boneless_wings.png', unique = false, useable = true, shouldClose = true, description = 'Nice to eat' },
    nachos                        		= { name = 'nachos', label = 'Nachoes', weight = 200, type = 'item', image = 'nachos.png', unique = false, useable = true, shouldClose = true, description = 'Nice to eat' },
    sliders                        		= { name = 'sliders', label = 'Sliders', weight = 200, type = 'item', image = 'sliders.png', unique = false, useable = true, shouldClose = true, description = 'Nice to eat' },
    loaded_fries                        = { name = 'loaded_fries', label = 'Loaded Fries', weight = 200, type = 'item', image = 'loaded_fries.png', unique = false, useable = true, shouldClose = true, description = 'Nice to eat' },

    -- Ammo ITEMS
    pistol_ammo                  = { name = 'pistol_ammo', label = 'Pistol Ammo', weight = 200, type = 'item', image = 'pistol_ammo.png', unique = false, useable = true, shouldClose = true, description = 'Ammo for Pistols' },
    rifle_ammo                   = { name = 'rifle_ammo', label = 'Rifle Ammo', weight = 1000, type = 'item', image = 'rifle_ammo.png', unique = false, useable = true, shouldClose = true, description = 'Ammo for Rifles' },
    smg_ammo                     = { name = 'smg_ammo', label = 'SMG Ammo', weight = 500, type = 'item', image = 'smg_ammo.png', unique = false, useable = true, shouldClose = true, description = 'Ammo for Sub Machine Guns' },
    shotgun_ammo                 = { name = 'shotgun_ammo', label = 'Shotgun Ammo', weight = 500, type = 'item', image = 'shotgun_ammo.png', unique = false, useable = true, shouldClose = true, description = 'Ammo for Shotguns' },
    mg_ammo                      = { name = 'mg_ammo', label = 'MG Ammo', weight = 1000, type = 'item', image = 'mg_ammo.png', unique = false, useable = true, shouldClose = true, description = 'Ammo for Machine Guns' },
    snp_ammo                     = { name = 'snp_ammo', label = 'Sniper Ammo', weight = 1000, type = 'item', image = 'sniper_ammo.png', unique = false, useable = true, shouldClose = true, description = 'Ammo for Sniper Rifles' },
    emp_ammo                     = { name = 'emp_ammo', label = 'EMP Ammo', weight = 200, type = 'item', image = 'emp_ammo.png', unique = false, useable = true, shouldClose = true, description = 'Ammo for EMP Launcher' },
	paintball_ammo               = { name = 'paintball_ammo', label = 'Paintball Ammo', weight = 200, type = 'item', image = 'np_paintball_ammo.png', unique = false, useable = true, shouldClose = true, description = 'Ammo for paintball guns' },
	-- rpg_ammo               		 = { name = 'rpg_ammo', label = 'RPG Ammo', weight = 200, type = 'item', image = 'rpg_ammo.png', unique = false, useable = true, shouldClose = true, description = 'Ammo for an RPG' },
	mini_ammo					 = { name = 'mini_ammo', label = 'MiniGun Ammo', weight = 1000, type = 'item', image = 'belt_ammo.png', unique = false, useable = true, shouldClose = true, description = 'Ammo for Mini Guns' },
	grenade_ammo				 = { name = 'grenade_ammo', label = 'GrenadeLauncher Ammo', weight = 1000, type = 'item', image = 'grenade_ammo.png', unique = false, useable = true, shouldClose = true, description = 'Ammo for grenade launchers' },
	sniper_ammo					 = { name = 'sniper_ammo', label = 'Sniper Ammo', weight = 1000, type = 'item', image = 'sniper_ammo.png', unique = false, useable = true, shouldClose = true, description = 'Ammo for Sniper Rifles' },
	
    -- Card ITEMS
    id_card                      = { name = 'id_card', label = 'ID Card', weight  = 100, type = 'item', image = 'id_card.png', unique = true, useable = true, shouldClose = false, description = 'A card containing all your information to identify yourself' },
    driver_license               = { name = 'driver_license', label = 'Drivers License', weight  = 100, type = 'item', image = 'driver_license.png', unique = true, useable = true, shouldClose = false, description = 'Permit to show you can drive a vehicle' },
    lawyerpass                   = { name = 'lawyerpass', label = 'Lawyer Pass', weight  = 100, type = 'item', image = 'lawyerpass.png', unique = true, useable = true, shouldClose = false, description = 'Pass exclusive to lawyers to show they can represent a suspect' },
    warrant                   	 = { name = 'warrant', label = 'Warrant', weight  = 100, type = 'item', image = 'warrant.png', unique = true, useable = true, shouldClose = false, description = 'A warrant issued from on high.' },
    weaponlicense                = { name = 'weaponlicense', label = 'Weapon License', weight  = 100, type = 'item', image = 'weapon_license.png', unique = true, useable = true, shouldClose = true, description = 'Weapon License' },
    bank_card                    = { name = 'bank_card', label = 'Bank Card', weight  = 100, type = 'item', image = 'bank_card.png', unique = true, useable = true, shouldClose = true, description = 'Used to access ATM' },
    security_card_01             = { name = 'security_card_01', label = 'Security Card A', weight  = 100, type = 'item', image = 'security_card_01.png', unique = false, useable = true, shouldClose = true, description = 'A security card... I wonder what it goes to' },
    security_card_02             = { name = 'security_card_02', label = 'Security Card B', weight  = 100, type = 'item', image = 'security_card_02.png', unique = false, useable = true, shouldClose = true, description = 'A security card... I wonder what it goes to' },

    -- Eat ITEMS
    tosti                        = { name = 'tosti', label = 'Grilled Cheese Sandwich', weight = 200, type = 'item', image = 'tosti.png', unique = false, useable = true, shouldClose = true, description = 'Nice to eat' },
    twerks_candy                 = { name = 'twerks_candy', label = 'Twerks', weight = 100, type = 'item', image = 'twerks_candy.png', unique = false, useable = true, shouldClose = true, description = 'Some delicious candy :O' },
    snikkel_candy                = { name = 'snikkel_candy', label = 'Snikkel', weight = 100, type = 'item', image = 'snikkel_candy.png', unique = false, useable = true, shouldClose = true, description = 'Some delicious candy :O' },
    sandwich                     = { name = 'sandwich', label = 'Sandwich', weight = 200, type = 'item', image = 'sandwich.png', unique = false, useable = true, shouldClose = true, description = 'Nice bread for your stomach' },

    -- Drink ITEMS
    water_bottle                 = { name = 'water_bottle', label = 'Bottle of Water', weight = 500, type = 'item', image = 'water_bottle.png', unique = false, useable = true, shouldClose = true, description = 'For all the thirsty out there' },
    coffee                       = { name = 'coffee', label = 'Coffee', weight = 200, type = 'item', image = 'coffee.png', unique = false, useable = true, shouldClose = true, description = 'Pump 4 Caffeine' },
    kurkakola                    = { name = 'kurkakola', label = 'Cola', weight = 500, type = 'item', image = 'cola.png', unique = false, useable = true, shouldClose = true, description = 'For all the thirsty out there' },

    -- Alcohol
    tequila                      = { name = 'tequila', label = 'Tequila', weight = 500, type = 'item', image = 'tequila.png', unique = false, useable = true, shouldClose = true, description = 'For all the thirsty out there' },
    beer                         = { name = 'beer', label = 'Beer', weight = 500, type = 'item', image = 'beer.png', unique = false, useable = true, shouldClose = true, description = 'Nothing like a good cold beer!' },
    whiskey                      = { name = 'whiskey', label = 'Whiskey', weight = 500, type = 'item', image = 'whiskey.png', unique = false, useable = true, shouldClose = true, description = 'For all the thirsty out there' },
    vodka                        = { name = 'vodka', label = 'Vodka', weight = 500, type = 'item', image = 'vodka.png', unique = false, useable = true, shouldClose = true, description = 'For all the thirsty out there' },
    grape                        = { name = 'grape', label = 'Grape', weight = 100, type = 'item', image = 'grape.png', unique = false, useable = true, shouldClose = true, description = 'Mmmmh yummie, grapes' },
    wine                         = { name = 'wine', label = 'Wine', weight = 300, type = 'item', image = 'wine.png', unique = false, useable = true, shouldClose = true, description = 'Some good wine to drink on a fine evening' },
   
	--bigjohns
	grape_soda                      = { name = 'grape_soda', label = 'Grape Soda', weight = 100, type = 'item', image = 'grape_soda.png', unique = false, useable = true, shouldClose = false, description = 'Grape Drank, this was something else in my day...' },
    mango_soda                      = { name = 'mango_soda', label = 'Mango Soda', weight = 100, type = 'item', image = 'mango_soda.png', unique = false, useable = true, shouldClose = false, description = 'Of course you love mango Only a toungless creetin wouldnt love mango' },
    mango_orange_soda               = { name = 'mango_orange_soda', label = 'Mango & Orange Soda', weight = 100, type = 'item', image = 'mango_orange_soda.png', unique = false, useable = true, shouldClose = false, description = 'Best of both worlds' },
    orange_soda                     = { name = 'orange_soda', label = 'Orange Soda', weight = 100, type = 'item', image = 'orange_soda.png', unique = false, useable = true, shouldClose = false, description = 'Orange soda doesnt come from oranges, did you know that' },
    lemonade                        = { name = 'lemonade', label = 'Lemonade', weight = 100, type = 'item', image = 'lemonade.png', unique = false, useable = true, shouldClose = false, description = 'lemon aiding water makes lemonaid...' },
    jalapeno_poppers                = { name = 'jalapeno_poppers', label = 'Jalapeno Poppers', weight = 100, type = 'item', image = 'jalapeno_poppers.png', unique = false, useable = true, shouldClose = false, description = 'Caution when squeezing, contents inside may be too delicious, oh and hot' },
    garlic_bread                    = { name = 'garlic_bread', label = 'Garlic Bread', weight = 100, type = 'item', image = 'garlic_bread.png', unique = false, useable = true, shouldClose = false, description = 'Everythings better with garlic' },
    cheesy_steak_pizza              = { name = 'cheesy_steak_pizza', label = 'Cheese Steak Pizza', weight = 100, type = 'item', image = 'cheesy_steak_pizza.png', unique = false, useable = true, shouldClose = false, description = 'Philitaly pizza, Cheese Steak' },
    supreme_pizza                   = { name = 'supreme_pizza', label = 'Supreme Pizza', weight = 100, type = 'item', image = 'supreme_pizza.png', unique = false, useable = true, shouldClose = false, description = 'Supreme Pizza, ALL THE TOPPINGS' },
    buffalo_wings                   = { name = 'buffalo_wings', label = 'Buffalo Wings', weight = 100, type = 'item', image = 'buffalo_wings.png', unique = false, useable = true, shouldClose = false, description = 'Not too hot, buffalo Wings' },
    bbq_ribs                        = { name = 'bbq_ribs', label = 'BBQ Ribs', weight = 100, type = 'item', image = 'bbq_ribs.png', unique = false, useable = true, shouldClose = false, description = 'Finger lickin good bbq ribs' },
    meat_lovers_pizza               = { name = 'meat_lovers_pizza', label = 'Meat Lovers Pizza', weight = 100, type = 'item', image = 'meat_lovers_pizza.png', unique = false, useable = true, shouldClose = false, description = 'This has the MEATS' },
    garlic 							= {name = "garlic", label = "garlic",weight  = 100, 		type = "item", 		image = "garlic.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	mango 							= {name = "mango", label = "mango",weight  = 100, 		type = "item", 		image = "mango.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	lemon 							= {name = "lemon", label = "lemon",weight  = 100, 		type = "item", 		image = "lemon.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	
	--Farming
	
	apple 							= {name = "apple",  	     		label = "Apple",	 		weight  = 100, 		type = "item", 		image = "apple.png", 				unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	apple_juice 					= {name = "apple_juice",  	     	label = "Apple Juice",	 	weight = 100, 		type = "item", 		image = "apple_juice.png", 				unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	emptycowbucket 					= {name = "emptycowbucket",  	    label = "Empty Bucket",	 	weight  = 100, 		type = "item", 		image = "emptybucket.png", 			unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	milkbucket 						= {name = "milkbucket",  	     	label = "Milk Bucket",	 	weight  = 100, 		type = "item", 		image = "milkbucket.png", 			unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	raw_beef 						= {name = "raw_beef",  	     		label = "Raw Beef",	 		weight  = 100, 		type = "item", 		image = "raw_beef.png", 			unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	beef 							= {name = "beef",  	     			label = "Beef",	 		    weight  = 100, 		type = "item", 		image = "beef.png", 				unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	milk 							= {name = "milk",  	     			label = "Milk",	 		    weight  = 100, 		type = "item", 		image = "milk.png", 				unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	rawpumpkin 						= {name = "rawpumpkin",  	     	label = "Raw Pumpkin",	    weight  = 100, 		type = "item", 		image = "raw_pumpkin.png", 			unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	pumpkinpiebox 					= {name = "pumpkinpiebox",  	    label = "Box of Pie",	    weight  = 100, 		type = "item", 		image = "pumpkinpiebox.png", 		unique = false, 	useable = true, 	shouldClose = true,   	 description = ""},
	slicedpie 						= {name = "slicedpie",  	  		label = "Slice of Pie",	    weight  = 100, 		type = "item", 		image = "slicedpie.png", 		unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	corncob 						= {name = "corncob",  	  			label = "Corn Cob",	    	weight  = 100, 		type = "item", 		image = "corncob.png", 				unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	canofcorn 						= {name = "canofcorn",  	  		label = "Can Of Corn",	    weight  = 100, 		type = "item", 		image = "canofcorn.png", 			unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	grapes 							= {name = "grapes",  	  			label = "Grapes",	   		weight  = 100, 		type = "item", 		image = "grapes.png", 				unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	grapejuice 						= {name = "grapejuice",  	  		label = "Grape Juice",	    weight  = 100, 		type = "item", 		image = "grapejuice.png", 			unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	greenpepper 					= {name = "greenpepper",  	  		label = "Green Pepper",	    weight  = 100, 		type = "item", 		image = "greenpepper.png", 			unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	chillypepper 					= {name = "chillypepper",  	  		label = "Chilly Pepper",	weight  = 100, 		type = "item", 		image = "chillypepper.png", 		unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	hotsauce 						= {name = "hotsauce",  	  			label = "Hot Sauce",	    weight  = 100, 		type = "item", 		image = "hotsauce.png", 			unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	tomato 							= {name = "tomato",  	  			label = "tomato",	    	weight  = 100, 		type = "item", 		image = "tomato.png", 			unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	tomatopaste 					= {name = "tomatopaste",  	  		label = "tomato Paste",		weight  = 100, 		type = "item", 		image = "tomatopaste.png", 		unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	soybeans 						= {name = "soybeans",  	  			label = "Soy Beans",	    weight  = 100, 		type = "item", 		image = "soybeans.png", 			unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	raw_bacon 						= {name = "raw_bacon",  	  		label = "Raw Bacon",	    weight  = 100, 		type = "item", 		image = "raw_bacon.png", 			unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	raw_sausage 					= {name = "raw_sausage",  	  		label = "Raw Sausage",	    weight  = 100, 		type = "item", 		image = "raw_sausage.png", 			unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	raw_pork 						= {name = "raw_pork",  	  			label = "Raw Pork",	  	  	weight  = 100, 		type = "item", 		image = "raw_pork.png", 			unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	raw_ham 						= {name = "raw_ham",  	  			label = "Raw Ham",	  	  	weight  = 100, 		type = "item", 		image = "raw_ham.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	cooked_bacon 					= {name = "cooked_bacon",  	  		label = "Cooked Bacon",	    weight  = 100, 		type = "item", 		image = "cooked_bacon.png", 		unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	cooked_sausage 					= {name = "cooked_sausage",  	  	label = "Cooked Sausage",	weight  = 100, 		type = "item", 		image = "cooked_sausage.png", 		unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	cooked_pork 					= {name = "cooked_pork",  	  		label = "Cooked Pork",	    weight  = 100, 		type = "item", 		image = "cooked_pork.png", 			unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	cooked_ham 						= {name = "cooked_ham",  	  		label = "Cooked Ham",	    weight  = 100, 		type = "item", 		image = "cooked_ham.png", 			unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	pig_leather						= {name = "pig_leather",  	  		label = "Pig Skin",	   		weight  = 100, 		type = "item", 		image = "pig_leather.png", 			unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	cow_leather						= {name = "cow_leather",  	  		label = "Cow Skin",	  		weight  = 100, 		type = "item", 		image = "cow_leather.png", 			unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	wheat 							= {name = "wheat",  	     		label = "Wheat",	 		weight  = 100, 		type = "item", 		image = "wraps.png", 				unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},
	grain 							= {name = "grain",  	     		label = "Grain",	 		weight  = 100, 		type = "item", 		image = "grain_oatmeal.png", 				unique = false, 	useable = true, 	shouldClose = true,   	   description = ""},

	cheese 							= {name = "cheese",  	     		label = "Cheese",	 				weight  = 100, 		type = "item", 		image = "cheese.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	dough 							= {name = "dough",  	     		label = "Dough",	 				weight  = 100, 		type = "item", 		image = "dough.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	pepperoni 						= {name = "pepperoni",  	     	label = "Pepperoni",	 			weight  = 100, 		type = "item", 		image = "pepperoni.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	sourappleschnapps 				= {name = "sourappleschnapps",  	label = "Sour Apple Schnapps",	 	weight  = 100, 		type = "item", 		image = "sourappleschnapps.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	sprunk 							= {name = "sprunk",  	     		label = "Sprunk",	 				weight  = 100, 		type = "item", 		image = "sprunk.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	dryvermouth 					= {name = "dryvermouth",  	     	label = "Dry Vermouth",	 			weight  = 100, 		type = "item", 		image = "dryvermouth.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	bluecuracao 					= {name = "bluecuracao",  	     	label = "Blue Curacao",	 			weight  = 100, 		type = "item", 		image = "bluecuracao.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	spicedrum 						= {name = "spicedrum",  	     	label = "Spiced Rum",	 			weight  = 100, 		type = "item", 		image = "spicedrum.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	coconutrum 						= {name = "coconutrum",  	     	label = "Coconut Rum",	 			weight  = 100, 		type = "item", 		image = "coconutrum.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	greenchartreuseliqueur 			= {name = "greenchartreuseliqueur", label = "Green Chartreuse Liqueur",	weight  = 100, 		type = "item", 		image = "greenchartreuseliqueur.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	maraschinoliqueur 				= {name = "maraschinoliqueur",  	label = "Maraschino Liqueur",	 	weight  = 100, 		type = "item", 		image = "maraschinoliqueur.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	gin 							= {name = "gin",  	     			label = "Gin",	 					weight  = 100, 		type = "item", 		image = "gin.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	simplesyrup 					= {name = "simplesyrup",  	     	label = "Simple Syrup",	 			weight  = 100, 		type = "item", 		image = "simplesyrup.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	bitters 						= {name = "bitters",  	     		label = "Bitters",	 				weight  = 100, 		type = "item", 		image = "bitters.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	bourbon 						= {name = "bourbon",  	     		label = "Bourbon",	 				weight  = 100, 		type = "item", 		image = "bourbon.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	aperol 							= {name = "aperol",  	     		label = "Asperols",	 				weight  = 100, 		type = "item", 		image = "aperol.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	prosecco 						= {name = "prosecco",  	     		label = "Prossekko",	 			weight  = 100, 		type = "item", 		image = "prosecco.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	orange 							= {name = "orange",  	     		label = "Orange",	 				weight  = 100, 		type = "item", 		image = "orange.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	kahlua 							= {name = "kahlua",  	     		label = "Kawhluar",	 				weight  = 100, 		type = "item", 		image = "kahlua.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	cremedementhe 					= {name = "cremedementhe",  	    label = "Creme De Menthe",	 		weight  = 100, 		type = "item", 		image = "cremedementhe.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	cranberryjuice 					= {name = "cranberryjuice",  	    label = "Cranberry Juice",	 		weight  = 100, 		type = "item", 		image = "cranberryjuice.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	blueberryschnapps 				= {name = "blueberryschnapps",  	label = "Blueberry Schnapps",	 	weight  = 100, 		type = "item", 		image = "blueberryschnapps.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	
	peachschnapps 					= {name = "peachschnapps",  		label = "Peach Schnapps",	 		weight  = 100, 		type = "item", 		image = "peachschnapps.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	triplesec 						= {name = "triplesec",  			label = "Triple Sec",	 			weight  = 100, 		type = "item", 		image = "triplesec.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	cognac 							= {name = "cognac",  				label = "Cognac",	 				weight  = 100, 		type = "item", 		image = "cognac.png", 				unique = false, 	useable = false, 	shouldClose = true,   	   description = ""},
	
	--joints
	blueberry_cruffinjoint           = { name = 'blueberry_cruffinjoint', 	label = 'BlueBerry Cruffin Joint', weight  = 100, type = 'item', image = 'joint.png', unique = false, useable = true, shouldClose = true, description = 'Angie would be very proud at you' },
    cake_mixjoint                    = { name = 'cake_mixjoint', 			label = 'Cake Joint', weight  = 100, type = 'item', 			image = 'joint.png', unique = false, useable = true, shouldClose = true, description = 'Angie would be very proud at you' },
	cereal_milkjoint                 = { name = 'cereal_milkjoint', 		label = 'Cereal Joint', weight  = 100, type = 'item', 			image = 'joint.png', unique = false, useable = true, shouldClose = true, description = 'Angie would be very proud at you' },
	cheetah_pissjoint                = { name = 'cheetah_pissjoint', 		label = 'Cheetah Joint', weight  = 100, type = 'item', 		image = 'joint.png', unique = false, useable = true, shouldClose = true, description = 'Angie would be very proud at you' },
	gary_paytonjoint                 = { name = 'gary_paytonjoint', 		label = 'Gary Joint', weight  = 100, type = 'item', 			image = 'joint.png', unique = false, useable = true, shouldClose = true, description = 'Angie would be very proud at you' },
	gelattijoint                     = { name = 'gelattijoint',				label = 'Gellati Joint', weight  = 100, type = 'item', 		image = 'joint.png', unique = false, useable = true, shouldClose = true, description = 'Angie would be very proud at you' },
	georgia_piejoint                 = { name = 'georgia_piejoint', 		label = 'Georgia Joint', weight  = 100, type = 'item', 		image = 'joint.png', unique = false, useable = true, shouldClose = true, description = 'Angie would be very proud at you' },
	grabba_leafjoint                 = { name = 'grabba_leafjoint', 		label = 'Grabba Joint', weight  = 100, type = 'item', 			image = 'joint.png', unique = false, useable = true, shouldClose = true, description = 'Angie would be very proud at you' },
	jefejoint                        = { name = 'jefejoint',				label = 'Jefe Joint', weight  = 100, type = 'item', 			image = 'joint.png', unique = false, useable = true, shouldClose = true, description = 'Angie would be very proud at you' },
	snow_manjoint                    = { name = 'snow_manjoint', 			label = 'Snow Joint', weight  = 100, type = 'item', 			image = 'joint.png', unique = false, useable = true, shouldClose = true, description = 'Angie would be very proud at you' },
	white_runtzjoint                 = { name = 'white_runtzjoint', 		label = 'Runtz Joint', weight  = 100, type = 'item', 			image = 'joint.png', unique = false, useable = true, shouldClose = true, description = 'Angie would be very proud at you' },
	whitecherry_gelatojoint          = { name = 'whitecherry_gelatojoint', 	label = 'Gelato Joint', weight  = 100, type = 'item', 			image = 'joint.png', unique = false, useable = true, shouldClose = true, description = 'Angie would be very proud at you' },
	
	--blunts
	blueberry_cruffinblunt           = { name = 'blueberry_cruffinblunt', 	label = 'BlueBerry Cruffin Blunt', weight  = 100, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
    cake_mixblunt                    = { name = 'cake_mixblunt', 			label = 'Cake Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	cereal_milkblunt                 = { name = 'cereal_milkblunt', 		label = 'Cereal Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	cheetah_pissblunt                = { name = 'cheetah_pissblunt', 		label = 'Cheetah Blunt', weight  = 100, type = 'item', 		image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	gary_paytonblunt                 = { name = 'gary_paytonblunt', 		label = 'Gary Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	gelattiblunt                     = { name = 'gelattiblunt',				label = 'Gellati Blunt', weight  = 100, type = 'item', 		image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	georgia_pieblunt                 = { name = 'georgia_pieblunt', 		label = 'Georgia Blunt', weight  = 100, type = 'item', 		image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	grabba_leafblunt                 = { name = 'grabba_leafblunt', 		label = 'Grabba Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	jefeblunt                        = { name = 'jefeblunt',				label = 'Jefe Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	snow_manblunt                    = { name = 'snow_manblunt', 			label = 'Snow Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	white_runtzblunt                 = { name = 'white_runtzblunt', 		label = 'Runtz Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	whitecherry_gelatoblunt          = { name = 'whitecherry_gelatoblunt', 	label = 'Gelato Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	--
	
	--cookies
	--blunts wraps
    backwoods_grape              = { name = 'backwoods_grape', label = 'BackWoods Grape', weight  = 100, type = 'item', image = 'backwoods_grape.png', unique = false, useable = true, shouldClose = true, description = 'Yum Grape' },
    
	--Grape weed blunts
	weed_whitewidow_blunt_grape              = { name = 'weed_whitewidow_blunt', label = 'White Widow blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of White Widow' },
    weed_skunk_blunt_grape                  = { name = 'weed_skunk_blunt', label = 'Skunk blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of Skunk' },
    weed_purplehaze_blunt_grape              = { name = 'weed_purplehaze_blunt', label = 'Purple Haze blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of Purple Haze' },
    weed_ogkush_blunt_grape                  = { name = 'weed_ogkush_blunt', label = 'OGKush blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of OG Kush' },
    weed_amnesia_blunt_grape                 = { name = 'weed_amnesia_blunt', label = 'Amnesia blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of Amnesia' },
    weed_ak47_blunt_grape                    = { name = 'weed_ak47_blunt', label = 'AK47 blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of AK47' },
	
	blueberry_cruffinblunt_grape           = { name = 'blueberry_cruffinblunt', 	label = 'BlueBerry Cruffin Blunt', weight  = 100, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
    cake_mixblunt_grape                    = { name = 'cake_mixblunt', 			label = 'Cake Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	cereal_milkblunt_grape                 = { name = 'cereal_milkblunt', 		label = 'Cereal Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	cheetah_pissblunt_grape                = { name = 'cheetah_pissblunt', 		label = 'Cheetah Blunt', weight  = 100, type = 'item', 		image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	gary_paytonblunt_grape                 = { name = 'gary_paytonblunt', 		label = 'Gary Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	gelattiblunt_grape                     = { name = 'gelattiblunt',				label = 'Gellati Blunt', weight  = 100, type = 'item', 		image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	georgia_pieblunt_grape                 = { name = 'georgia_pieblunt', 		label = 'Georgia Blunt', weight  = 100, type = 'item', 		image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	grabba_leafblunt_grape                 = { name = 'grabba_leafblunt', 		label = 'Grabba Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	jefeblunt_grape                        = { name = 'jefeblunt',				label = 'Jefe Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	snow_manblunt_grape                    = { name = 'snow_manblunt', 			label = 'Snow Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	white_runtzblunt_grape                 = { name = 'white_runtzblunt', 		label = 'Runtz Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	whitecherry_gelatoblunt_grape          = { name = 'whitecherry_gelatoblunt', 	label = 'Gelato Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	
	backwoods_honey              = { name = 'backwoods_honey', label = 'BackWoods honey', weight  = 100, type = 'item', image = 'backwoods_honey.png', unique = false, useable = true, shouldClose = true, description = 'Yum Honey' },
    
	--Honey weed blunts
	weed_whitewidow_blunt_honey              = { name = 'weed_whitewidow_blunt', label = 'White Widow blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of White Widow' },
    weed_skunk_blunt_honey                  = { name = 'weed_skunk_blunt', label = 'Skunk blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of Skunk' },
    weed_purplehaze_blunt_honey              = { name = 'weed_purplehaze_blunt', label = 'Purple Haze blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of Purple Haze' },
    weed_ogkush_blunt_honey                  = { name = 'weed_ogkush_blunt', label = 'OGKush blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of OG Kush' },
    weed_amnesia_blunt_honey                 = { name = 'weed_amnesia_blunt', label = 'Amnesia blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of Amnesia' },
    weed_ak47_blunt_honey                    = { name = 'weed_ak47_blunt', label = 'AK47 blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of AK47' },
	
	blueberry_cruffinblunt_honey           = { name = 'blueberry_cruffinblunt', 	label = 'BlueBerry Cruffin Blunt', weight  = 100, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
    cake_mixblunt_honey                    = { name = 'cake_mixblunt', 			label = 'Cake Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	cereal_milkblunt_honey                 = { name = 'cereal_milkblunt', 		label = 'Cereal Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	cheetah_pissblunt_honey                = { name = 'cheetah_pissblunt', 		label = 'Cheetah Blunt', weight  = 100, type = 'item', 		image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	gary_paytonblunt_honey                 = { name = 'gary_paytonblunt', 		label = 'Gary Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	gelattiblunt_honey                     = { name = 'gelattiblunt',				label = 'Gellati Blunt', weight  = 100, type = 'item', 		image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	georgia_pieblunt_honey                 = { name = 'georgia_pieblunt', 		label = 'Georgia Blunt', weight  = 100, type = 'item', 		image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	grabba_leafblunt_honey                 = { name = 'grabba_leafblunt', 		label = 'Grabba Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	jefeblunt_honey                        = { name = 'jefeblunt',				label = 'Jefe Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	snow_manblunt_honey                    = { name = 'snow_manblunt', 			label = 'Snow Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	white_runtzblunt_honey                 = { name = 'white_runtzblunt', 		label = 'Runtz Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	whitecherry_gelatoblunt_honey          = { name = 'whitecherry_gelatoblunt', 	label = 'Gelato Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	
	backwoods_russian_cream      = { name = 'backwoods_russian_cream', label = 'BackWoods Russian Cream', weight  = 100, type = 'item', image = 'backwoods_russian_cream.png', unique = false, useable = true, shouldClose = true, description = 'Yum Russian Cream' },
    
	--Grape weed blunts
	weed_whitewidow_blunt_cream              = { name = 'weed_whitewidow_blunt', label = 'White Widow blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of White Widow' },
    weed_skunk_blunt_cream                  = { name = 'weed_skunk_blunt', label = 'Skunk blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of Skunk' },
    weed_purplehaze_blunt_cream              = { name = 'weed_purplehaze_blunt', label = 'Purple Haze blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of Purple Haze' },
    weed_ogkush_blunt_cream                  = { name = 'weed_ogkush_blunt', label = 'OGKush blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of OG Kush' },
    weed_amnesia_blunt_cream                 = { name = 'weed_amnesia_blunt', label = 'Amnesia blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of Amnesia' },
    weed_ak47_blunt_cream 					= { name = 'weed_ak47_blunt', label = 'AK47 blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of AK47' },

	blueberry_cruffinblunt_cream           = { name = 'blueberry_cruffinblunt', 	label = 'BlueBerry Cruffin Blunt', weight  = 100, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
    cake_mixblunt_cream                    = { name = 'cake_mixblunt', 			label = 'Cake Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	cereal_milkblunt_cream                 = { name = 'cereal_milkblunt', 		label = 'Cereal Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	cheetah_pissblunt_cream                = { name = 'cheetah_pissblunt', 		label = 'Cheetah Blunt', weight  = 100, type = 'item', 		image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	gary_paytonblunt_cream                 = { name = 'gary_paytonblunt', 		label = 'Gary Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	gelattiblunt_cream                     = { name = 'gelattiblunt',				label = 'Gellati Blunt', weight  = 100, type = 'item', 		image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	georgia_pieblunt_cream                 = { name = 'georgia_pieblunt', 		label = 'Georgia Blunt', weight  = 100, type = 'item', 		image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	grabba_leafblunt_cream                 = { name = 'grabba_leafblunt', 		label = 'Grabba Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	jefeblunt_cream                        = { name = 'jefeblunt',				label = 'Jefe Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	snow_manblunt_cream                    = { name = 'snow_manblunt', 			label = 'Snow Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	white_runtzblunt_cream                 = { name = 'white_runtzblunt', 		label = 'Runtz Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	whitecherry_gelatoblunt_cream          = { name = 'whitecherry_gelatoblunt', 	label = 'Gelato Blunt', weight  = 100, type = 'item', 			image = 'blunt.png', unique = false, useable = true, shouldClose = true, description = 'Beatrice would be very proud at you' },
	
	
	--edables
	blueberry_cruffin      		 = { name = 'blueberry_cruffin', label = 'BlueBerry Cruffin', weight  = 100, type = 'item', image = 'blueberry_cruffin.png', unique = false, useable = true, shouldClose = true, description = 'Yum Blueberry Cream' },
    cake_mix      		 		 = { name = 'cake_mix', label = 'Cake Mix', weight  = 100, type = 'item', image = 'cake_mix.png', unique = false, useable = true, shouldClose = true, description = 'Yum Cake Mix' },
    cereal_milk      		 	 = { name = 'cereal_milk', label = 'Cereal Milk', weight  = 100, type = 'item', image = 'cereal_milk.png', unique = false, useable = true, shouldClose = true, description = 'Yum Cereal Milk' },
    cheap_lighter      		 	 = { name = 'cheap_lighter', label = 'Cheap Lighter', weight  = 100, type = 'item', image = 'cheap_lighter.png', unique = false, useable = true, shouldClose = true, description = 'Cheap Lighter' },
    lighter      		 	 	 = { name = 'lighter', label = 'Cheap Lighter', weight  = 100, type = 'item', image = 'cheap_lighter.png', unique = false, useable = true, shouldClose = true, description = 'Cheap Lighter' },
    cheetah_piss      		 	 = { name = 'cheetah_piss', label = 'Cheetah Piss', weight  = 100, type = 'item', image = 'cheetah_piss.png', unique = false, useable = true, shouldClose = true, description = 'Yum piss from a cheetah' },
    gary_payton      		 	 = { name = 'gary_payton', label = 'Gary Payton', weight  = 100, type = 'item', image = 'gary_payton.png', unique = false, useable = true, shouldClose = true, description = 'Yum Gary Payton' },
    gelatti      		 	 	 = { name = 'gelatti', label = 'Gelatti', weight  = 100, type = 'item', image = 'gelatti.png', unique = false, useable = true, shouldClose = true, description = 'Yum Gelatti' },
    georgia_pie      		 	 = { name = 'georgia_pie', label = 'Georgia Pie', weight  = 100, type = 'item', image = 'georgia_pie.png', unique = false, useable = true, shouldClose = true, description = 'Yum Georgia Pie' },
    grabba_leaf      		 	 = { name = 'grabba_leaf', label = 'Grabba Leaf', weight  = 100, type = 'item', image = 'grabba_leaf.png', unique = false, useable = true, shouldClose = true, description = 'Yum Grabba Leaf, wtf that is' },
    jefe      		 	 		 = { name = 'jefe', label = 'Jefe', weight  = 100, type = 'item', image = 'jefe.png', unique = false, useable = true, shouldClose = true, description = 'Yum jefe' },
    snow_man      		 	 	 = { name = 'snow_man', label = 'Snow Man', weight  = 100, type = 'item', image = 'snow_man.png', unique = false, useable = true, shouldClose = true, description = 'Yum Snow Man' },
    white_runtz      		 	 = { name = 'white_runtz', label = 'White Runtz', weight  = 100, type = 'item', image = 'white_runtz.png', unique = false, useable = true, shouldClose = true, description = 'Yum White Runtz' },
    whitecherry_gelato      	 = { name = 'whitecherry_gelato', label = 'White Cherry Gelato', weight  = 100, type = 'item', image = 'whitecherry_gelato.png', unique = false, useable = true, shouldClose = true, description = 'Yum White Cherry Gelato' },
	beklighter      		 	 = { name = 'beklighter', label = 'BEK', weight  = 100, type = 'item', image = 'lighter.png', unique = false, useable = true, shouldClose = true, description = 'BEK is Better' },
	lighterfluid      		 	 = { name = 'lighterfluid', label = 'Lighter Fluid', weight  = 100, type = 'item', image = 'lighterfluid.png', unique = false, useable = false, shouldClose = true, description = 'lighterfluid' },
	weed_fertilizer      	 	 			 = { name = 'weed_fertilizer', label = 'Weed Fertilizer', weight  = 100, type = 'item', image = 'weed_fertilizer.png', unique = false, useable = true, shouldClose = true, description = 'Weed Fertilizer to grow your weeds' },
	weed_fertilizer_fast      	 	 		 = { name = 'weed_fertilizer_fast', label = 'Fast Acting Weed Fertilizer', weight  = 100, type = 'item', image = 'weed_fertilizer.png', unique = false, useable = true, shouldClose = true, description = 'Weed Fertilizer to grow your weeds 2x as fast but sacrifices 25% of the crop yields!' },
	weed_fertilizer_extrastrength     	 	 = { name = 'weed_fertilizer_extrastrength', label = 'Industrial Grade Weed Fertilizer', weight  = 100, type = 'item', image = 'weed_fertilizer.png', unique = false, useable = true, shouldClose = true, description = 'Weed Fertilizer to grow your weeds, this stuff is so potent it will allow for up to 200% nutrition on the plant' },
	weed_fertilizer_increasedyield     	 	 = { name = 'weed_fertilizer_increasedyield', label = 'Miracle Weed Fertilizer', weight  = 100, type = 'item', image = 'weed_fertilizer.png', unique = false, useable = true, shouldClose = true, description = 'Weed Fertilizer to grow your weeds with miracles! Double yields but quadruples the consumption of Nutrition!' },
    
	weed_cokeleaf_seed        	 = { name = 'weed_cokeleaf_seed', label = 'Cocaine Seed', weight  = 100, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, description = 'A seed for the cocaine plant' },
	
	--first stage Coke
	weed_cokeleaf               = { name = 'weed_cokeleaf', label = 'Coca Leaf', weight  = 100, type = 'item', image = 'cocaineleaf.png', unique = false, useable = true, shouldClose = true, description = 'A very potent plant, I wonder what could be done with this...' },
    butter                  	= { name = 'butter', label = 'Butter', weight  = 100, type = 'item', image = 'butter.png', unique = false, useable = true, shouldClose = true, description = 'I wonder what could be done with this...' },
    
	--second stage Coke
	rawcoca						= { name = 'rawcoca', label = 'Raw Coca', weight  = 100, type = 'item', image = 'cocaine_raw.png', unique = false, useable = true, shouldClose = true, description = 'Raw mixture of some butter and a cocaleaf' },
	bakingsoda					= { name = 'bakingsoda', label = 'Baking Soda', weight  = 100, type = 'item', image = 'bakingsoda.png', unique = false, useable = true, shouldClose = true, description = 'What am I a pastry chef? WTF am I supposed to do with this?' },
	
	--Cigarette 
	cigarette_pack              = { name = 'cigarette_pack', label = 'Pack of Cigarettes', weight  = 100, type = 'item', image = 'packosmokes.png', unique = false, useable = true, shouldClose = true, description = 'A full pack of Cigarettes' },
    cigarette           		= { name = 'cigarette', label = 'Cigarette', weight  = 100, type = 'item', image = 'smokes.png', unique = false, useable = true, shouldClose = true, description = 'A Cigarette' },
    
	--pixiedust
	
	pixiedust                   = { name = 'pixiedust', label = 'Pixiedust', weight  = 100, type = 'item', image = 'pixiedust.png', unique = false, useable = true, shouldClose = true, description = 'it is truely magical' },
	pixiedust_brick             = { name = 'pixiedust_brick', label = 'Pixiedust Brick', weight = 1000, type = 'item', image = 'coke_brick.png', unique = false, useable = true, shouldClose = true, description = 'Heavy package of Pixiedust, breaks down to 100 bags' },
	pixiedust_small_brick       = { name = 'pixiedust_small_brick', label = 'Pixiedust Package', weight = 350, type = 'item', image = 'coke_small_brick.png', unique = false, useable = true, shouldClose = true, description = 'Small package of Pixiedust, Breaks down to 50 bags' },
    
	--Crack
	crack_brick                   = { name = 'crack_brick', label = 'Crack Brick', weight = 1000, type = 'item', image = 'coke_brick.png', unique = false, useable = true, shouldClose = true, description = 'Heavy package of crack, breaks down to 100 bags' },
	crack_small_brick             = { name = 'crack_small_brick', label = 'Crack Package', weight = 350, type = 'item', image = 'coke_small_brick.png', unique = false, useable = true, shouldClose = true, description = 'Small package of crack, Breaks down to 50 bags' },
    
	printedcash 			     = {name = "printedcash", label = "Printed Cash Bundle", 	weight  = 100, 		type = "item", 		image = "cashstack.png", 			unique = true, 		useable = true, 	shouldClose = false, description = "Cash!"},
    
	-- Drugs
    fentanyl_brick             	 = { name = 'fentanyl_brick', label = 'Fentanyl Brick', weight = 1000, type = 'item', image = 'coke_brick.png', unique = false, useable = true, shouldClose = true, description = 'Heavy package of Fentanyl, breaks down to 100 bags' },
	fentanyl_small_brick       	 = { name = 'fentanyl_small_brick', label = 'Fentanyl Package', weight = 350, type = 'item', image = 'coke_small_brick.png', unique = false, useable = true, shouldClose = true, description = 'Small package of Fentanyl, Breaks down to 50 bags' },
	fentanyl                     = { name = 'fentanyl', label = 'Fentanyl', weight  = 100, type = 'item', image = 'fentanyl.png', unique = false, useable = true, shouldClose = true, description = 'Sidney would be very disappointed in you' },
	weed_fentanylleaf_seed       = { name = 'weed_fentanylleaf_seed', label = 'Fentanyl Seed', weight  = 100, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, description = 'A seed for the fentanyl plant' },
	weed_fentanylleaf            = { name = 'weed_fentanylleaf', label = 'Fentanyl Leaf', weight  = 100, type = 'item', image = 'fentanylleaf.png', unique = false, useable = true, shouldClose = true, description = 'A very potent plant, I wonder what could be done with this...' },
    rawfentanyl					 = { name = 'rawfentanyl', label = 'Raw Fentanyl', weight  = 100, type = 'item', image = 'fentanyl_raw.png', unique = false, useable = true, shouldClose = true, description = 'Raw mixture of some butter and a fentanylleaf' },
	joint                        = { name = 'joint', label = 'Joint', weight  = 100, type = 'item', image = 'joint.png', unique = false, useable = true, shouldClose = true, description = 'Sidney would be very proud at you' },
    cokebaggy                    = { name = 'cokebaggy', label = 'Bag of Coke', weight  = 100, type = 'item', image = 'cocaine_baggy.png', unique = false, useable = true, shouldClose = true, description = 'To get happy real quick' },
    crack_baggy                  = { name = 'crack_baggy', label = 'Bag of Crack', weight  = 100, type = 'item', image = 'crack_baggy.png', unique = false, useable = true, shouldClose = true, description = 'To get happy faster' },
    xtcbaggy                     = { name = 'xtcbaggy', label = 'Bag of XTC', weight  = 100, type = 'item', image = 'xtc_baggy.png', unique = false, useable = true, shouldClose = true, description = 'Pop those pills baby' },
    coke_brick                   = { name = 'coke_brick', label = 'Coke Brick', weight = 1000, type = 'item', image = 'coke_brick.png', unique = false, useable = true, shouldClose = true, description = 'Heavy package of cocaine, breaks down to 100 bags' },
    weed_brick                   = { name = 'weed_brick', label = 'Weed Brick', weight = 1000, type = 'item', image = 'weed_brick.png', unique = false, useable = true, shouldClose = true, description = 'Breaks down to 100 bags' },
    coke_small_brick             = { name = 'coke_small_brick', label = 'Coke Package', weight = 350, type = 'item', image = 'coke_small_brick.png', unique = false, useable = true, shouldClose = true, description = 'Small package of cocaine, breaks down to 50 bags' },
    oxy                          = { name = 'oxy', label = 'Prescription Oxy', weight  = 100, type = 'item', image = 'oxy.png', unique = false, useable = true, shouldClose = true, description = 'The Label Has Been Ripped Off' },
    meth                         = { name = 'meth', label = 'Meth', weight = 100, type = 'item', image = 'meth_baggy.png', unique = false, useable = true, shouldClose = true, description = 'A baggie of Meth' },
    rolling_paper                = { name = 'rolling_paper', label = 'Rolling Paper', weight  = 100, type = 'item', image = 'rolling_paper.png', unique = false, useable = false, shouldClose = true, description = 'Paper made specifically for encasing and smoking tobacco or cannabis.' },
    
	
	--lean items
	lean_small_bottle            = { name = 'lean_small_bottle', label = 'Small Bottle of Lean', weight = 1500, type = 'item', image = 'smalllean.png', unique = false, useable = false, shouldClose = false, description = 'Small package of lean' },
	lean_large_bottle            = { name = 'lean_large_bottle', label = 'Large Bottle of Lean', weight = 3000, type = 'item', image = 'largelean.png', unique = false, useable = false, shouldClose = false, description = 'Large package of lean' },
	prometh                		 = { name = 'prometh', label = 'Prometh and Codeine', weight = 300, type = 'item', image = 'prometh.png', unique = false, useable = false, shouldClose = false, description = 'Prometh and Codeine mixture' },
	jollyranchers                = { name = 'jollyranchers', label = 'Jolly Ranchers', weight = 300, type = 'item', image = 'jollyranchers.png', unique = false, useable = true, shouldClose = false, description = 'Yummy Candy' },
	jollysprite                  = { name = 'jollysprite', label = 'Jolly Sprite', weight = 300, type = 'item', image = 'jollysprite.png', unique = false, useable = false, shouldClose = false, description = 'A Start to making it lean' },
	lean                         = { name = 'lean', label = 'Lean', weight = 300, type = 'item', image = 'lean.png', unique = false, useable = true, shouldClose = false, description = 'This is the start of a good night' },
	
	--vanilla weed blunts
	weed_whitewidow_blunt              = { name = 'weed_whitewidow_blunt', label = 'White Widow blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of White Widow' },
    weed_skunk_blunt                   = { name = 'weed_skunk_blunt', label = 'Skunk blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of Skunk' },
    weed_purplehaze_blunt              = { name = 'weed_purplehaze_blunt', label = 'Purple Haze blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of Purple Haze' },
    weed_ogkush_blunt                  = { name = 'weed_ogkush_blunt', label = 'OGKush blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of OG Kush' },
    weed_amnesia_blunt                 = { name = 'weed_amnesia_blunt', label = 'Amnesia blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of Amnesia' },
    weed_ak47_blunt                    = { name = 'weed_ak47_blunt', label = 'AK47 blunt', weight = 200, type = 'item', image = 'blunt.png', unique = false, useable = true, shouldClose = false, description = 'A blunt of AK47' },
	
	--vanilla weed joints
	weed_whitewidow_joint              = { name = 'weed_whitewidow_joint', label = 'White Widow joint', weight = 200, type = 'item', image = 'joint.png', unique = false, useable = true, shouldClose = false, description = 'A joint of White Widow' },
    weed_skunk_joint                   = { name = 'weed_skunk_joint', label = 'Skunk joint', weight = 200, type = 'item', image = 'joint.png', unique = false, useable = true, shouldClose = false, description = 'A joint of Skunk' },
    weed_purplehaze_joint              = { name = 'weed_purplehaze_joint', label = 'Purple Haze joint', weight = 200, type = 'item', image = 'joint.png', unique = false, useable = true, shouldClose = false, description = 'A joint of Purple Haze' },
    weed_ogkush_joint                  = { name = 'weed_ogkush_joint', label = 'OGKush joint', weight = 200, type = 'item', image = 'joint.png', unique = false, useable = true, shouldClose = false, description = 'A joint of OG Kush' },
    weed_amnesia_joint                 = { name = 'weed_amnesia_joint', label = 'Amnesia joint', weight = 200, type = 'item', image = 'joint.png', unique = false, useable = true, shouldClose = false, description = 'A joint of Amnesia' },
    weed_ak47_joint                    = { name = 'weed_ak47_joint', label = 'AK47 joint', weight = 200, type = 'item', image = 'joint.png', unique = false, useable = true, shouldClose = false, description = 'A joint of AK47' },
    
    -- Seed And Weed
    weed_whitewidow              = { name = 'weed_whitewidow', label = 'White Widow Bud', weight = 200, type = 'item', image = 'weed_raw.png', unique = false, useable = true, shouldClose = false, description = 'A bud of White Widow' },
    weed_skunk                   = { name = 'weed_skunk', label = 'Skunk Bud', weight = 200, type = 'item', image = 'weed_raw.png', unique = false, useable = true, shouldClose = false, description = 'A bud of Skunk' },
    weed_purplehaze              = { name = 'weed_purplehaze', label = 'Purple Haze Bud', weight = 200, type = 'item', image = 'weed_raw.png', unique = false, useable = true, shouldClose = false, description = 'A bud of Purple Haze' },
    weed_ogkush                  = { name = 'weed_ogkush', label = 'OGKush Bud', weight = 200, type = 'item', image = 'weed_raw.png', unique = false, useable = true, shouldClose = false, description = 'A bud of OG Kush' },
    weed_amnesia                 = { name = 'weed_amnesia', label = 'Amnesia Bud', weight = 200, type = 'item', image = 'weed_raw.png', unique = false, useable = true, shouldClose = false, description = 'A bud of Amnesia' },
    weed_ak47                    = { name = 'weed_ak47', label = 'AK47 Bud', weight = 200, type = 'item', image = 'weed_raw.png', unique = false, useable = true, shouldClose = false, description = 'A bud of AK47' },
    weed_whitewidow_seed         = { name = 'weed_whitewidow_seed', label = 'White Widow Seed', weight  = 100, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = false, description = 'A weed seed of White Widow' },
    weed_skunk_seed              = { name = 'weed_skunk_seed', label = 'Skunk Seed', weight  = 100, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, description = 'A weed seed of Skunk' },
    weed_purplehaze_seed         = { name = 'weed_purplehaze_seed', label = 'Purple Haze Seed', weight  = 100, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, description = 'A weed seed of Purple Haze' },
    weed_ogkush_seed             = { name = 'weed_ogkush_seed', label = 'OGKush Seed', weight  = 100, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, description = 'A weed seed of OG Kush' },
    weed_amnesia_seed            = { name = 'weed_amnesia_seed', label = 'Amnesia Seed', weight  = 100, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, description = 'A weed seed of Amnesia' },
    weed_ak47_seed               = { name = 'weed_ak47_seed', label = 'AK47 Seed', weight  = 100, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, description = 'A weed seed of AK47' },
    empty_weed_bag               = { name = 'empty_weed_bag', label = 'Empty Weed Bag', weight  = 100, type = 'item', image = 'weed_baggy_empty.png', unique = false, useable = true, shouldClose = true, description = 'A small empty bag' },
    weed_nutrition               = { name = 'weed_nutrition', label = 'Plant Fertilizer', weight = 2000, type = 'item', image = 'weed_nutrition.png', unique = false, useable = true, shouldClose = true, description = 'Plant nutrition' },
	
	-- Weed Baggies
	
	--TEMPLATE FOR NEW BAGGIES OF WEED JST REPLACE EMPTY WITH WEED TYPE
	--empty_weed_bag               = { name = 'empty_weed_bag', label = 'Empty Weed Bag', weight  = 100, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = true, description = 'A small quarter bag of weed' },
    whitewidow_weed_bag         = { name = 'whitewidow_weed_bag', label = 'whitewidow Weed Bag', weight  = 400, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = true, description = 'A small quarter bag of weed' },
	skunk_weed_bag              = { name = 'skunk_weed_bag', label = 'skunk Weed Bag', weight  = 400, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = true, description = 'A small quarter bag of weed' },
	purplehaze_weed_bag         = { name = 'purplehaze_weed_bag', label = 'purplehaze Weed Bag', weight  = 400, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = true, description = 'A small quarter bag of weed' },
	ogkush_weed_bag             = { name = 'ogkush_weed_bag', label = 'ogkush Weed Bag', weight  = 400, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = true, description = 'A small quarter bag of weed' },
	amnesia_weed_bag            = { name = 'amnesia_weed_bag', label = 'amnesia Weed Bag', weight  = 400, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = true, description = 'A small quarter bag of weed' },
	ak47_weed_bag               = { name = 'ak47_weed_bag', label = 'ak47 Weed Bag', weight  = 400, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = true, description = 'A small quarter bag of weed' },
	
	whitewidow_weed_brick         = { name = 'whitewidow_weed_brick', label = 'whitewidow Weed Brick', weight  = 800, type = 'item', image = 'weed_brick.png', unique = false, useable = true, shouldClose = true, description = 'A LB bag of weed' },
	skunk_weed_brick              = { name = 'skunk_weed_brick', 	  label = 'skunk Weed Brick', weight  = 800, type = 'item', image = 'weed_brick.png', unique = false, useable = true, shouldClose = true, description = 'A LB bag of weed' },
	purplehaze_weed_brick         = { name = 'purplehaze_weed_brick', label = 'purplehaze Weed Brick', weight  = 800, type = 'item', image = 'weed_brick.png', unique = false, useable = true, shouldClose = true, description = 'A LB bag of weed' },
	ogkush_weed_brick             = { name = 'ogkush_weed_brick', 	  label = 'ogkush Weed Brick', weight  = 800, type = 'item', image = 'weed_brick.png', unique = false, useable = true, shouldClose = true, description = 'A LB bag of weed' },
	amnesia_weed_brick            = { name = 'amnesia_weed_brick', 	  label = 'amnesia Weed Brick', weight  = 800, type = 'item', image = 'weed_brick.png', unique = false, useable = true, shouldClose = true, description = 'A LB bag of weed' },
	ak47_weed_brick               = { name = 'ak47_weed_brick', 	  label = 'ak47 Weed Brick', weight  = 800, type = 'item', image = 'weed_brick.png', unique = false, useable = true, shouldClose = true, description = 'A LB bag of weed' },
	
    -- Material
    plastic                      = { name = 'plastic', label = 'Plastic', weight = 100, type = 'item', image = 'plastic.png', unique = false, useable = false, shouldClose = false, description = 'RECYCLE! - Greta Thunberg 2019' },
    metalscrap                   = { name = 'metalscrap', label = 'Metal Scrap', weight = 100, type = 'item', image = 'metalscrap.png', unique = false, useable = false, shouldClose = false, description = 'You can probably make something nice out of this' },
    copper                       = { name = 'copper', label = 'Copper', weight = 100, type = 'item', image = 'copper.png', unique = false, useable = false, shouldClose = false, description = 'Nice piece of metal that you can probably use for something' },
    aluminum                     = { name = 'aluminum', label = 'Aluminium', weight = 100, type = 'item', image = 'aluminum.png', unique = false, useable = false, shouldClose = false, description = 'Nice piece of metal that you can probably use for something' },
    aluminumoxide                = { name = 'aluminumoxide', label = 'Aluminium Powder', weight = 100, type = 'item', image = 'aluminumoxide.png', unique = false, useable = false, shouldClose = false, description = 'Some powder to mix with' },
    iron                         = { name = 'iron', label = 'Iron', weight = 100, type = 'item', image = 'iron.png', unique = false, useable = false, shouldClose = false, description = 'Handy piece of metal that you can probably use for something' },
    ironoxide                    = { name = 'ironoxide', label = 'Iron Powder', weight = 100, type = 'item', image = 'ironoxide.png', unique = false, useable = false, shouldClose = false, description = 'Some powder to mix with.' },
    steel                        = { name = 'steel', label = 'Steel', weight = 100, type = 'item', image = 'steel.png', unique = false, useable = false, shouldClose = false, description = 'Nice piece of metal that you can probably use for something' },
    rubber                       = { name = 'rubber', label = 'Rubber', weight = 100, type = 'item', image = 'rubber.png', unique = false, useable = false, shouldClose = false, description = 'Rubber, I believe you can make your own rubber ducky with it :D' },
    glass                        = { name = 'glass', label = 'Glass', weight = 100, type = 'item', image = 'glass.png', unique = false, useable = false, shouldClose = false, description = 'It is very fragile, watch out' },

	--graffiti
	["spraycan"]                        = {["name"] = "spraycan",                          ["label"] = "Spray Can",                ["weight"] = 1000,          ["type"] = "item",         ["image"] = "spraycan.png",                ["unique"] = true,          ["useable"] = true,     ["shouldClose"] = true,       ["combinable"] = nil,   ["description"] = "Spray Can"},
    ["sprayremover"]                    = {["name"] = "sprayremover",                      ["label"] = "Spray Remover",            ["weight"] = 100,           ["type"] = "item",         ["image"] = "sprayremover.png",                ["unique"] = true,          ["useable"] = true,     ["shouldClose"] = true,       ["combinable"] = nil,   ["description"] = "Spray Remover"},

    -- beauty
    cucu_spray                   = { name = 'cucu_spray', label = 'Cucu Spray T1', weight = 300, type = 'item', image = 'cucu.png', unique = false, useable = true, shouldClose = true, description = 'A nicely smelling spray to make you smell good' },
    guudgurl_spray               = { name = 'guudgurl_spray', label = 'GuudGurl Spray T2', weight = 300, type = 'item', image = 'guudgurl.png', unique = false, useable = true, shouldClose = true, description = 'A nicely smelling spray to make you smell good' },
    missduor_spray               = { name = 'missduor_spray', label = 'MissDuor Spray T3', weight = 300, type = 'item', image = 'missduor.png', unique = false, useable = true, shouldClose = true, description = 'A nicely smelling spray to make you smell good' },
    
	copid_spray                  = { name = 'copid_spray', label = 'Copid Spray T1', weight = 300, type = 'item', image = 'copid.png', unique = false, useable = true, shouldClose = true, description = 'A nicely smelling spray to make you smell good' },
    duor_spray                   = { name = 'duor_spray', label = 'Duor Spray T2', weight = 300, type = 'item', image = 'duor.png', unique = false, useable = true, shouldClose = true, description = 'A nicely smelling spray to make you smell good' },
    uros_spray                   = { name = 'uros_spray', label = 'Uros Spray T3', weight = 300, type = 'item', image = 'uros.png', unique = false, useable = true, shouldClose = true, description = 'A nicely smelling spray to make you smell good' },
	
	duv_wash                     = { name = 'duv_wash', label = 'Duv Wash T1', weight = 300, type = 'item', image = 'duv.png', unique = false, useable = true, shouldClose = true, description = 'A nicely smelling Wash to make you clean' },
    hudandshudders_wash          = { name = 'hudandshudders_wash', label = 'Hud & Shudders Wash T2', weight = 300, type = 'item', image = 'hudandshudders.png', unique = false, useable = true, shouldClose = true, description = 'A nicely smelling Wash to make you clean' },
    trusumm_wash                 = { name = 'trusumm_wash', label = 'Trusumm Wash T3', weight = 300, type = 'item', image = 'trusumm.png', unique = false, useable = true, shouldClose = true, description = 'A nicely smelling Wash to make you clean' },

	puntune_wash                 = { name = 'puntune_wash', label = 'Puntune Wash T1', weight = 300, type = 'item', image = 'puntune.png', unique = false, useable = true, shouldClose = true, description = 'A nicely smelling Wash to make you clean' },
    suvmer_wash          		 = { name = 'suvmer_wash', label = 'Suvmer Wash T2', weight = 300, type = 'item', image = 'suvmer.png', unique = false, useable = true, shouldClose = true, description = 'A nicely smelling Wash to make you clean' },
    ussi_wash                    = { name = 'ussi_wash', label = 'Ussi Wash T3', weight = 300, type = 'item', image = 'ussi.png', unique = false, useable = true, shouldClose = true, description = 'A nicely smelling Wash to make you clean' },

    -- Tools
    lockpick                     = { name = 'lockpick', label = 'Lockpick', weight = 300, type = 'item', image = 'lockpick.png', unique = false, useable = true, shouldClose = true, description = 'Very useful if you lose your keys a lot.. or if you want to use it for something else...' },
    advancedlockpick             = { name = 'advancedlockpick', label = 'Advanced Lockpick', weight = 500, type = 'item', image = 'advancedlockpick.png', unique = false, useable = true, shouldClose = true, description = 'If you lose your keys a lot this is very useful... Also useful to open your beers' },
    cuffpick            		 = { name = 'cuffpick', label = 'Cuff Pick', weight = 500, type = 'item', image = 'advancedlockpick.png', unique = false, useable = true, shouldClose = true, description = 'A way to break handcuffs' },
    electronickit                = { name = 'electronickit', label = 'Electronic Kit', weight = 100, type = 'item', image = 'electronickit.png', unique = false, useable = true, shouldClose = true, description = 'If you have always wanted to build a robot you can maybe start here. Maybe you will be the new Elon Musk?' },
    gatecrack                    = { name = 'gatecrack', label = 'Gatecrack', weight  = 100, type = 'item', image = 'usb_device.png', unique = false, useable = false, shouldClose = true, description = 'Handy software to tear down some fences' },
    thermite                     = { name = 'thermite', label = 'Thermite', weight = 1000, type = 'item', image = 'thermite.png', unique = false, useable = true, shouldClose = true, description = 'Sometimes you\'d wish for everything to burn' },
    trojan_usb                   = { name = 'trojan_usb', label = 'Trojan USB', weight  = 100, type = 'item', image = 'usb_device.png', unique = false, useable = false, shouldClose = true, description = 'Handy software to shut down some systems' },
    screwdriverset               = { name = 'screwdriverset', label = 'Toolkit', weight = 1000, type = 'item', image = 'screwdriverset.png', unique = false, useable = false, shouldClose = false, description = 'Very useful to screw... screws...' },
    drill                        = { name = 'drill', label = 'Drill', weight = 20000, type = 'item', image = 'drill.png', unique = false, useable = false, shouldClose = false, description = 'The real deal...' },
	razorblade					 = { name = 'razorblade', label = 'Razor Blade', weight  = 100, type = 'item', image = 'razor.png', unique = false, useable = false, shouldClose = false, description = 'The real deal...' },
	mallet					 	 = { name = 'mallet', label = 'Cooking Mallet', weight  = 100, type = 'item', image = 'mallet.png', unique = false, useable = false, shouldClose = false, description = 'The real deal...' },
   
   -- Vehicle Tools
    nitrous                      = { name = 'nitrous', label = 'Nitrous', weight = 1000, type = 'item', image = 'nitrous.png', unique = false, useable = true, shouldClose = true, description = 'Speed up, gas pedal! :D' },
    weaponrepairkit              = { name = 'weaponrepairkit', label = 'Weapon Repair Kit', weight = 2500, type = 'item', image = 'repairkit.png', unique = false, useable = true, shouldClose = true, description = 'A nice toolbox with stuff to repair your weapon' },
    repairkit                    = { name = 'repairkit', label = 'Repairkit', weight = 2500, type = 'item', image = 'repairkit.png', unique = false, useable = true, shouldClose = true, description = 'A nice toolbox with stuff to repair your vehicle' },
    advancedrepairkit            = { name = 'advancedrepairkit', label = 'Advanced Repairkit', weight = 4000, type = 'item', image = 'advancedkit.png', unique = false, useable = true, shouldClose = true, description = 'A nice toolbox with stuff to repair your vehicle' },
    cleaningkit                  = { name = 'cleaningkit', label = 'Cleaning Kit', weight = 250, type = 'item', image = 'cleaningkit.png', unique = false, useable = true, shouldClose = true, description = 'A microfiber cloth with some soap will let your car sparkle again!' },
    tunerlaptop                  = { name = 'tunerlaptop', label = 'Tunerchip', weight = 2000, type = 'item', image = 'tunerchip.png', unique = true, useable = true, shouldClose = true, description = 'With this tunerchip you can get your car on steroids... If you know what you are doing' },
    harness                      = { name = 'harness', label = 'Race Harness', weight = 1000, type = 'item', image = 'harness.png', unique = true, useable = true, shouldClose = true, description = 'Racing Harness so no matter what you stay in the car' },
    jerry_can                    = { name = 'jerry_can', label = 'Jerrycan 20L', weight = 20000, type = 'item', image = 'jerry_can.png', unique = false, useable = true, shouldClose = true, description = 'A can full of Fuel' },
    tirerepairkit                = { name = 'tirerepairkit', label = 'Tire Repair Kit', weight = 1000, type = 'item', image = 'tirerepairkit.png', unique = false, useable = true, shouldClose = true, description = 'A kit to repair your tires' },
	
	-- JIM mech Parts
	mechanic_tools              = { name = "mechanic_tools", label = "Mechanic tools", weight  = 100, type = "item", image = "mechanic_tools.png", unique = true, useable = true, shouldClose = true, description = "Needed for vehicle repairs"},
	toolbox                     = { name = "toolbox", label = "Toolbox", weight  = 100, type = "item", image = "toolbox.png", unique = true, useable = true, shouldClose = true, description = "Needed for Performance part removal"},
	ducttape                    = { name = "ducttape", label = "Duct Tape", weight  = 100, type = "item", image = "bodyrepair.png", unique = true, useable = true, shouldClose = true, description = "Good for quick fixes"},
	mechboard                   = { name = "mechboard", label = "Mechanic Sheet", weight  = 100, type = "item", image = "mechboard.png", unique = true, useable = true, shouldClose = true, description = ""},

	-- Nitrous/Nos
	nos                         = { name = "nos", label = "NOS Bottle", weight  = 100, type = "item", image = "nos.png", unique = true, useable = true, shouldClose = true, description = "A full bottle of NOS"},
	noscan                      = { name = "noscan", label = "Empty NOS Bottle", weight  = 100, type = "item", image = "noscan.png", unique = false, useable = true, shouldClose = true, description = "An Empty bottle of NOS"},
	noscolour                   = { name = "noscolour", label = "NOS Colour Injector", weight  = 100, type = "item", image = "noscolour.png", unique = false, useable = true, shouldClose = true, description = "Make that purge spray"},

	--Performance
	turbo                       = { name = "turbo", label = "Supercharger Turbo",	weight  = 100, type = "item", image = "turbo.png", unique = true, useable = true, shouldClose = true, description = ""},
	car_armor                   = { name = "car_armor", label = "Vehicle Armor", weight  = 100, type = "item", image = "car_armour.png", unique = true, useable = true, shouldClose = true, description = ""},

	engine1                     = { name = "engine1", label = "Tier 1 Engine", weight  = 100, type = "item", image = "engine1.png", unique = false, useable = true, shouldClose = true, description = ""},
	engine2                     = { name = "engine2", label = "Tier 2 Engine", weight  = 100, type = "item", image = "engine2.png", unique = false, useable = true, shouldClose = true, description = ""},
	engine3                     = { name = "engine3", label = "Tier 3 Engine", weight  = 100, type = "item", image = "engine3.png", unique = false, useable = true, shouldClose = true, description = ""},
	engine4                     = { name = "engine4", label = "Tier 4 Engine", weight  = 100, type = "item", image = "engine4.png", unique = false, useable = true, shouldClose = true, description = ""},
	engine5                     = { name = "engine5", label = "Tier 5 Engine", weight  = 100, type = "item", image = "engine5.png", unique = false, useable = true, shouldClose = true, description = ""},

	transmission1               = { name = "transmission1", label = "Tier 1 Transmission", weight  = 100, type = "item", image = "transmission1.png", unique = false, useable = true, shouldClose = true, description = ""},
	transmission2               = { name = "transmission2", label = "Tier 2 Transmission", weight  = 100, type = "item", image = "transmission2.png", unique = false, useable = true, shouldClose = true, description = ""},
	transmission3               = { name = "transmission3", label = "Tier 3 Transmission", weight  = 100, type = "item", image = "transmission3.png", unique = false, useable = true, shouldClose = true, description = ""},
	transmission4               = { name = "transmission4", label = "Tier 4 Transmission", weight  = 100, type = "item", image = "transmission4.png", unique = false, useable = true, shouldClose = true, description = ""},

	brakes1                     = { name = "brakes1", label = "Tier 1 Brakes", weight  = 100, type = "item", image = "brakes1.png", unique = false, useable = true, shouldClose = true, description = ""},
	brakes2                     = { name = "brakes2", label = "Tier 2 Brakes", weight  = 100, type = "item", image = "brakes2.png", unique = false, useable = true, shouldClose = true, description = ""},
	brakes3                     = { name = "brakes3", label = "Tier 3 Brakes", weight  = 100, type = "item", image = "brakes3.png", unique = false, useable = true, shouldClose = true, description = ""},

	suspension1                 = { name = "suspension1", label = "Tier 1 Suspension", weight  = 100, type = "item", image = "suspension1.png", unique = false, useable = true, shouldClose = true, description = ""},
	suspension2                 = { name = "suspension2", label = "Tier 2 Suspension", weight  = 100, type = "item", image = "suspension2.png", unique = false, useable = true, shouldClose = true, description = ""},
	suspension3                 = { name = "suspension3", label = "Tier 3 Suspension", weight  = 100, type = "item", image = "suspension3.png", unique = false, useable = true, shouldClose = true, description = ""},
	suspension4                 = { name = "suspension4", label = "Tier 4 Suspension", weight  = 100, type = "item", image = "suspension4.png", unique = false, useable = true, shouldClose = true, description = ""},
	suspension5                 = { name = "suspension5", label = "Tier 5 Suspension", weight  = 100, type = "item", image = "suspension5.png", unique = false, useable = true, shouldClose = true, description = ""},

	-- Tire Style Changers
	bprooftires                 = { name = "bprooftires", label = "Bulletproof Tires", weight  = 100, type = "item", image = "bprooftires.png", unique = false, useable = true, shouldClose = true, description = ""},
	drifttires                  = { name = "drifttires", label = "Drift Tires", weight  = 100, type = "item", image = "drifttires.png", unique = false, useable = true, shouldClose = true, description = ""},

	-- Vehicle Extra Damage Items
	oilp1                       = { name = "oilp1", label = "Tier 1 Oil Pump", weight  = 100, type = "item", image = "oilp1.png", unique = false, useable = true, shouldClose = true, description = ""},
	oilp2                       = { name = "oilp2", label = "Tier 2 Oil Pump", weight  = 100, type = "item", image = "oilp2.png", unique = false, useable = true, shouldClose = true, description = ""},
	oilp3                       = { name = "oilp3", label = "Tier 3 Oil Pump", weight  = 100, type = "item", image = "oilp3.png", unique = false, useable = true, shouldClose = true, description = ""},

	drives1                     = { name = "drives1", label = "Tier 1 Drive Shaft", weight  = 100, type = "item", image = "drives1.png", unique = false, useable = true, shouldClose = true, description = ""},
	drives2                     = { name = "drives2", label = "Tier 2 Drive Shaft", weight  = 100, type = "item", image = "drives2.png", unique = false, useable = true, shouldClose = true, description = ""},
	drives3                     = { name = "drives3", label = "Tier 3 Drive Shaft", weight  = 100, type = "item", image = "drives3.png", unique = false, useable = true, shouldClose = true, description = ""},

	cylind1                     = { name = "cylind1", label = "Tier 1 Cylinder Head",	weight  = 100, type = "item", image = "cylind1.png", unique = false, useable = true, shouldClose = true, description = ""},
	cylind2                     = { name = "cylind2", label = "Tier 2 Cylinder Head",	weight  = 100, type = "item", image = "cylind2.png", unique = false, useable = true, shouldClose = true, description = ""},
	cylind3                     = { name = "cylind3", label = "Tier 3 Cylinder Head",	weight  = 100, type = "item", image = "cylind3.png", unique = false, useable = true, shouldClose = true, description = ""},

	cables1                     = { name = "cables1", label = "Tier 1 Battery Cables", weight  = 100, type = "item", image = "cables1.png", unique = false, useable = true, shouldClose = true, description = ""},
	cables2                     = { name = "cables2", label = "Tier 2 Battery Cables", weight  = 100, type = "item", image = "cables2.png", unique = false, useable = true, shouldClose = true, description = ""},
	cables3                     = { name = "cables3", label = "Tier 3 Battery Cables", weight  = 100, type = "item", image = "cables3.png", unique = false, useable = true, shouldClose = true, description = ""},

	fueltank1                   = { name = "fueltank1", label = "Tier 1 Fuel Tank", weight  = 100, type = "item", image = "fueltank1.png", unique = false, useable = true, shouldClose = true, description = ""},
	fueltank2                   = { name = "fueltank2", label = "Tier 2 Fuel Tank", weight  = 100, type = "item", image = "fueltank2.png", unique = false, useable = true, shouldClose = true, description = ""},
	fueltank3                   = { name = "fueltank3", label = "Tier 3 Fuel Tank", weight  = 100, type = "item", image = "fueltank3.png", unique = false, useable = true, shouldClose = true, description = ""},

	antilag                     = { name = "antilag", label = "AntiLag", weight  = 100, type = "item", image = "antiLag.png", unique = true, useable = true, shouldClose = true, description = ""},

	--Cosmetics
	underglow_controller        = { name = "underglow_controller", label = "Neon Controller", weight  = 100, type = "item", image = "underglow_controller.png", unique = false, useable = true, shouldClose = true, description = "RGB LED Vehicle Remote"},
	headlights                  = { name = "headlights", label = "Xenon Headlights", weight  = 100, type = "item", image = "headlights.png", unique = false, useable = true, shouldClose = true, description = ""},

	tint_supplies               = { name = "tint_supplies", label = "Window Tint Kit", weight  = 100, type = "item", image = "tint_supplies.png", unique = false, useable = true, shouldClose = true, description = "Supplies for window tinting"},

	customplate                 = { name = "customplate", label = "Customized Plates", weight  = 100, type = "item", image = "plate.png", unique = false, useable = true, shouldClose = true, description = ""},
	hood                        = { name = "hood", label = "Vehicle Hood", weight  = 100, type = "item", image = "hood.png", unique = false, useable = true, shouldClose = true, description = ""},
	roof                        = { name = "roof", label = "Vehicle Roof", weight  = 100, type = "item", image = "roof.png", unique = false, useable = true, shouldClose = true, description = ""},
	spoiler                     = { name = "spoiler", label = "Vehicle Spoiler", weight  = 100, type = "item", image = "spoiler.png", unique = false, useable = true, shouldClose = true, description = ""},
	bumper                      = { name = "bumper", label = "Vehicle Bumper", weight  = 100, type = "item", image = "bumper.png", unique = false, useable = true, shouldClose = true, description = ""},
	skirts                      = { name = "skirts", label = "Vehicle Skirts", weight  = 100, type = "item", image = "skirts.png", unique = false, useable = true, shouldClose = true, description = ""},
	exhaust                     = { name = "exhaust", label = "Vehicle Exhaust", weight  = 100, type = "item", image = "exhaust.png", unique = false, useable = true, shouldClose = true, description = ""},
	seat                        = { name = "seat", label = "Seat Cosmetics", weight  = 100, type = "item", image = "seat.png", unique = false, useable = true, shouldClose = true, description = ""},
	rollcage                    = { name = "rollcage", label = "Roll Cage", weight  = 100, type = "item", image = "rollcage.png", unique = false, useable = true, shouldClose = true, description = ""},

	rims                        = { name = "rims", label = "Custom Wheel Rims", weight  = 100, type = "item", image = "rims.png", unique = false, useable = true, shouldClose = true, description = ""},

	livery                      = { name = "livery", label = "Livery Roll", weight  = 100, type = "item", image = "livery.png", unique = false, useable = true, shouldClose = true, description = ""},
	paintcan                    = { name = "paintcan", label = "Vehicle Spray Can", weight  = 100, type = "item", image = "spraycan.png", unique = false, useable = true, shouldClose = true, description = ""},
	tires                       = { name = "tires", label = "Drift Smoke Tires",	weight  = 100, type = "item", image = "tires.png", unique = false, useable = true, shouldClose = true, description = ""},

	horn                        = { name = "horn", label = "Custom Vehicle Horn",	weight  = 100, type = "item", image = "horn.png", unique = false, useable = true, shouldClose = true, description = ""},

	internals                   = { name = "internals", label = "Internal Cosmetics",	weight  = 100, type = "item", image = "internals.png", unique = false, useable = true, shouldClose = true, description = ""},
	externals                   = { name = "externals", label = "Exterior Cosmetics",	weight  = 100, type = "item", image = "mirror.png", unique = false, useable = true, shouldClose = true, description = ""},

	--Repair Parts
	newoil                      = { name = "newoil", label = "Car Oil", weight  = 100, type = "item", image = "caroil.png", unique = false, useable = false, shouldClose = false, description = ""},
	sparkplugs                  = { name = "sparkplugs", label = "Spark Plugs", weight  = 100, type = "item", image = "sparkplugs.png", unique = false, useable = false, shouldClose = false, description = ""},
	carbattery                  = { name = "carbattery", label = "Car Battery", weight  = 100, type = "item", image = "carbattery.png", unique = false, useable = false, shouldClose = false, description = ""},
	axleparts                   = { name = "axleparts", label = "Axle Parts", weight  = 100, type = "item", image = "axleparts.png", unique = false, useable = false, shouldClose = false, description = ""},
	sparetire                   = { name = "sparetire", label = "Spare Tire", weight  = 100, type = "item", image = "sparetire.png", unique = false, useable = false, shouldClose = false, description = ""},

	manual                      = { name = 'manual', label = 'Manual Transmission', weight  = 100, type = 'item', image = 'manual.png', unique = false, useable = true, shouldClose = true,  description = 'Manual Transmission change for vehicles' },
	underglow                   = { name = 'underglow', label = 'Underglow LEDS', weight  = 100, type = 'item', image = 'underglow.png', unique = false, useable = true, shouldClose = true,  description = 'Underglow addition for vehicles' },

	--Already in QBCore
	--harness                      = { name = 'harness', label = 'Race Harness', weight = 1000, type = 'item', image = 'harness.png', unique = true, useable = true, shouldClose = true,  description = 'Racing Harness so no matter what you stay in the car' },
	--repairkit                    = { name = 'repairkit', label = 'Repairkit', weight = 2500, type = 'item', image = 'repairkit.png', unique = false, useable = true, shouldClose = true,  description = 'A nice toolbox with stuff to repair your vehicle' },
	--advancedrepairkit            = { name = 'advancedrepairkit', label = 'Advanced Repairkit', weight = 4000, type = 'item', image = 'advancedkit.png', unique = false, useable = true, shouldClose = true,  description = 'A nice toolbox with stuff to repair your vehicle' },
	--cleaningkit                  = { name = 'cleaningkit', label = 'Cleaning Kit', weight = 250, type = 'item', image = 'cleaningkit.png', unique = false, useable = true, shouldClose = true,  description = 'A microfiber cloth with some soap will let your car sparkle again!' },

    -- Mechanic Parts
    veh_toolbox                  = { name = 'veh_toolbox', label = 'Toolbox', weight = 1000, type = 'item', image = 'veh_toolbox.png', unique = false, useable = true, shouldClose = true, description = 'Check vehicle status' },
    veh_armor                    = { name = 'veh_armor', label = 'Armor', weight = 1000, type = 'item', image = 'veh_armor.png', unique = false, useable = true, shouldClose = true, description = 'Upgrade vehicle armor' },
    veh_brakes                   = { name = 'veh_brakes', label = 'Brakes', weight = 1000, type = 'item', image = 'veh_brakes.png', unique = false, useable = true, shouldClose = true, description = 'Upgrade vehicle brakes' },
    veh_engine                   = { name = 'veh_engine', label = 'Engine', weight = 1000, type = 'item', image = 'veh_engine.png', unique = false, useable = true, shouldClose = true, description = 'Upgrade vehicle engine' },
    veh_suspension               = { name = 'veh_suspension', label = 'Suspension', weight = 1000, type = 'item', image = 'veh_suspension.png', unique = false, useable = true, shouldClose = true, description = 'Upgrade vehicle suspension' },
    veh_transmission             = { name = 'veh_transmission', label = 'Transmission', weight = 1000, type = 'item', image = 'veh_transmission.png', unique = false, useable = true, shouldClose = true, description = 'Upgrade vehicle transmission' },
    veh_turbo                    = { name = 'veh_turbo', label = 'Turbo', weight = 1000, type = 'item', image = 'veh_turbo.png', unique = false, useable = true, shouldClose = true, description = 'Install vehicle turbo' },
    veh_interior                 = { name = 'veh_interior', label = 'Interior', weight = 1000, type = 'item', image = 'veh_interior.png', unique = false, useable = true, shouldClose = true, description = 'Upgrade vehicle interior' },
    veh_exterior                 = { name = 'veh_exterior', label = 'Exterior', weight = 1000, type = 'item', image = 'veh_exterior.png', unique = false, useable = true, shouldClose = true, description = 'Upgrade vehicle exterior' },
    veh_wheels                   = { name = 'veh_wheels', label = 'Wheels', weight = 1000, type = 'item', image = 'veh_wheels.png', unique = false, useable = true, shouldClose = true, description = 'Upgrade vehicle wheels' },
    veh_neons                    = { name = 'veh_neons', label = 'Neons', weight = 1000, type = 'item', image = 'veh_neons.png', unique = false, useable = true, shouldClose = true, description = 'Upgrade vehicle neons' },
    veh_xenons                   = { name = 'veh_xenons', label = 'Xenons', weight = 1000, type = 'item', image = 'veh_xenons.png', unique = false, useable = true, shouldClose = true, description = 'Upgrade vehicle xenons' },
    veh_tint                     = { name = 'veh_tint', label = 'Tints', weight = 1000, type = 'item', image = 'veh_tint.png', unique = false, useable = true, shouldClose = true, description = 'Install vehicle tint' },
    veh_plates                   = { name = 'veh_plates', label = 'Plates', weight = 1000, type = 'item', image = 'veh_plates.png', unique = false, useable = true, shouldClose = true, description = 'Install vehicle plates' },

    -- Medication
    firstaid                     = { name = 'firstaid', label = 'First Aid', weight = 2500, type = 'item', image = 'firstaid.png', unique = false, useable = true, shouldClose = true, description = 'You can use this First Aid kit to get people back on their feet' },
    bandage                      = { name = 'bandage', label = 'Bandage', weight  = 100, type = 'item', image = 'bandage.png', unique = false, useable = true, shouldClose = true, description = 'A bandage works every time' },
    ifaks                        = { name = 'ifaks', label = 'ifaks', weight = 200, type = 'item', image = 'ifaks.png', unique = false, useable = true, shouldClose = true, description = 'ifaks for healing and a complete stress remover.' },
    painkillers                  = { name = 'painkillers', label = 'Painkillers', weight  = 100, type = 'item', image = 'painkillers.png', unique = false, useable = true, shouldClose = true, description = 'For pain you can\'t stand anymore, take this pill that\'d make you feel great again' },
    walkstick                    = { name = 'walkstick', label = 'Walking Stick', weight = 1000, type = 'item', image = 'walkstick.png', unique = false, useable = true, shouldClose = true, description = 'Walking stick for ya\'ll grannies out there.. HAHA' },

    -- Communication
    phone                        = { name = 'phone', label = 'Phone', weight = 700, type = 'item', image = 'phone.png', unique = true, useable = false, shouldClose = false, description = 'Neat phone ya got there' },
    radio                        = { name = 'radio', label = 'Radio', weight = 2000, type = 'item', image = 'radio.png', unique = true, useable = true, shouldClose = true, description = 'You can communicate with this through a signal' },
    iphone                       = { name = 'iphone', label = 'iPhone', weight = 1000, type = 'item', image = 'iphone.png', unique = false, useable = false, shouldClose = true, description = 'Very expensive phone' },
    samsungphone                 = { name = 'samsungphone', label = 'Samsung S10', weight = 1000, type = 'item', image = 'samsungphone.png', unique = false, useable = false, shouldClose = true, description = 'Very expensive phone' },
    laptop                       = { name = 'laptop', label = 'Laptop', weight = 4000, type = 'item', image = 'laptop.png', unique = false, useable = false, shouldClose = true, description = 'Expensive laptop' },
    tablet                       = { name = 'tablet', label = 'Tablet', weight = 2000, type = 'item', image = 'tablet.png', unique = false, useable = false, shouldClose = true, description = 'Expensive tablet' },
    fitbit                       = { name = 'fitbit', label = 'Fitbit', weight = 500, type = 'item', image = 'fitbit.png', unique = true, useable = true, shouldClose = true, description = 'I like fitbit' },
    radioscanner                 = { name = 'radioscanner', label = 'Radio Scanner', weight = 1000, type = 'item', image = 'radioscanner.png', unique = false, useable = false, shouldClose = true, description = 'With this you can get some police alerts. Not 100% effective however' },
    pinger                       = { name = 'pinger', label = 'Pinger', weight = 1000, type = 'item', image = 'pinger.png', unique = false, useable = false, shouldClose = true, description = 'With a pinger and your phone you can send out your location' },
    cryptostick                  = { name = 'cryptostick', label = 'Crypto Stick', weight = 200, type = 'item', image = 'cryptostick.png', unique = false, useable = true, shouldClose = true, description = 'Why would someone ever buy money that doesn\'t exist.. How many would it contain..?' },

    -- Theft and Jewelry
    rolex                        = { name = 'rolex', label = 'Golden Watch', weight = 1500, type = 'item', image = 'rolex.png', unique = false, useable = false, shouldClose = true, description = 'A golden watch seems like the jackpot to me!' },
    diamond_ring                 = { name = 'diamond_ring', label = 'Diamond Ring', weight = 1500, type = 'item', image = 'diamond_ring.png', unique = false, useable = false, shouldClose = true, description = 'A diamond ring seems like the jackpot to me!' },
    diamond                      = { name = 'diamond', label = 'Diamond', weight = 1000, type = 'item', image = 'diamond.png', unique = false, useable = false, shouldClose = true, description = 'A diamond seems like the jackpot to me!' },
    goldchain                    = { name = 'goldchain', label = 'Golden Chain', weight = 1500, type = 'item', image = 'goldchain.png', unique = false, useable = false, shouldClose = true, description = 'A golden chain seems like the jackpot to me!' },
    tenkgoldchain                = { name = 'tenkgoldchain', label = '10k Gold Chain', weight = 2000, type = 'item', image = '10kgoldchain.png', unique = false, useable = false, shouldClose = true, description = '10 carat golden chain' },
    goldbar                      = { name = 'goldbar', label = 'Gold Bar', weight = 7000, type = 'item', image = 'goldbar.png', unique = false, useable = false, shouldClose = true, description = 'Looks pretty expensive to me' },
    zipties                      = { name = 'zipties', label = 'ZipTie', weight = 100, type = 'item', image = 'zips.png', unique = false, useable = true, shouldClose = true, description = 'Comes in handy when people misbehave.' },
   
	--Christmas 
	present                      = { name = 'present', label = 'Christmas Present', weight = 7000, type = 'item', image = 'present.png', unique = true, useable = true, shouldClose = true, description = 'Who doesnt love a present?' },

    -- Cops Tools
    armor                        = { name = 'armor', label = 'Armor', weight = 5000, type = 'item', image = 'armor.png', unique = false, useable = true, shouldClose = true, description = 'Some protection won\'t hurt... right?' },
    heavyarmor                   = { name = 'heavyarmor', label = 'Heavy Armor', weight = 5000, type = 'item', image = 'armor.png', unique = false, useable = true, shouldClose = true, description = 'Some protection won\'t hurt... right?' },
    med_bodyarmor                = { name = 'med_bodyarmor', label = 'Heavy Armor', weight = 5000, type = 'item', image = 'armor.png', unique = false, useable = true, shouldClose = true, description = 'Some protection won\'t hurt... right?' },
    handcuffs                    = { name = 'handcuffs', label = 'Handcuffs', weight = 100, type = 'item', image = 'handcuffs.png', unique = false, useable = true, shouldClose = true, description = 'Comes in handy when people misbehave. Maybe it can be used for something else?' },
    police_stormram              = { name = 'police_stormram', label = 'Stormram', weight = 18000, type = 'item', image = 'police_stormram.png', unique = false, useable = true, shouldClose = true, description = 'A nice tool to break into doors' },
    empty_evidence_bag           = { name = 'empty_evidence_bag', label = 'Empty Evidence Bag', weight  = 100, type = 'item', image = 'evidence.png', unique = false, useable = false, shouldClose = false, description = 'Used a lot to keep DNA from blood, bullet shells and more' },
    filled_evidence_bag          = { name = 'filled_evidence_bag', label = 'Evidence Bag', weight = 200, type = 'item', image = 'evidence.png', unique = true, useable = false, shouldClose = false, description = 'A filled evidence bag to see who committed the crime' },

    -- Firework Tools
    firework1                    = { name = 'firework1', label = '2Brothers', weight = 1000, type = 'item', image = 'firework1.png', unique = false, useable = true, shouldClose = true, description = 'Fireworks' },
    firework2                    = { name = 'firework2', label = 'Poppelers', weight = 1000, type = 'item', image = 'firework2.png', unique = false, useable = true, shouldClose = true, description = 'Fireworks' },
    firework3                    = { name = 'firework3', label = 'WipeOut', weight = 1000, type = 'item', image = 'firework3.png', unique = false, useable = true, shouldClose = true, description = 'Fireworks' },
    firework4                    = { name = 'firework4', label = 'Weeping Willow', weight = 1000, type = 'item', image = 'firework4.png', unique = false, useable = true, shouldClose = true, description = 'Fireworks' },

    -- Sea Tools
    dendrogyra_coral             = { name = 'dendrogyra_coral', label = 'Dendrogyra', weight = 1000, type = 'item', image = 'dendrogyra_coral.png', unique = false, useable = false, shouldClose = true, description = 'Its also known as pillar coral' },
    antipatharia_coral           = { name = 'antipatharia_coral', label = 'Antipatharia', weight = 1000, type = 'item', image = 'antipatharia_coral.png', unique = false, useable = false, shouldClose = true, description = 'Its also known as black corals or thorn corals' },
    diving_gear                  = { name = 'diving_gear', label = 'Diving Gear', weight = 30000, type = 'item', image = 'diving_gear.png', unique = true, useable = true, shouldClose = true, description = 'An oxygen tank and a rebreather' },
    diving_fill                  = { name = 'diving_fill', label = 'Diving Tube', weight = 3000, type = 'item', image = 'diving_tube.png', unique = true, useable = true, shouldClose = true, description = 'An oxygen tube and a rebreather' },

    -- Other Tools
    casinochips                  = { name = 'casinochips', label = 'Casino Chips', weight  = 10, type = 'item', image = 'casinochips.png', unique = false, useable = false, shouldClose = false, description = 'Chips For Casino Gambling' },
    stickynote                   = { name = 'stickynote', label = 'Sticky note', weight  = 100, type = 'item', image = 'stickynote.png', unique = true, useable = false, shouldClose = false, description = 'Sometimes handy to remember something :)' },
    moneybag                     = { name = 'moneybag', label = 'Money Bag', weight  = 100, type = 'item', image = 'moneybag.png', unique = true, useable = true, shouldClose = true, description = 'A bag with cash' },
    parachute                    = { name = 'parachute', label = 'Parachute', weight = 30000, type = 'item', image = 'parachute.png', unique = false, useable = true, shouldClose = true, description = 'The sky is the limit! Woohoo!' },
    binoculars                   = { name = 'binoculars', label = 'Binoculars', weight = 600, type = 'item', image = 'binoculars.png', unique = false, useable = true, shouldClose = true, description = 'Sneaky Breaky...' },
    certificate                  = { name = 'certificate', label = 'Certificate of Failure', weight  = 100, type = 'item', image = 'certificate.png', unique = false, useable = false, shouldClose = true, description = 'Certificate that proves you failed, CONRGRATS' },
    freebag                 	 = { name = 'freebag', 	label = 'FreeBag', weight  = 100, type = 'item', image = 'duffel3.png', unique = true, useable = false, shouldClose = true, description = 'This will prevent you from losing your inventory upon death, having more than 1 of these is exploiting and will get you banned.' },
    markedbills                  = { name = 'markedbills', label = 'Marked Money', weight = 1000, type = 'item', image = 'markedbills.png', unique = true, useable = false, shouldClose = true, description = 'Money?' },
    labkey                       = { name = 'labkey', label = 'Key', weight = 500, type = 'item', image = 'labkey.png', unique = false, useable = true, shouldClose = true, description = 'Key for a lock...?' },
    printerdocument              = { name = 'printerdocument', label = 'Document', weight = 500, type = 'item', image = 'printerdocument.png', unique = false, useable = true, shouldClose = true, description = 'A nice document' },
    newscam                      = { name = 'newscam', label = 'News Camera', weight = 100, type = 'item', image = 'newscam.png', unique = false, useable = true, shouldClose = true, description = 'A camera for the news' },
    newsmic                      = { name = 'newsmic', label = 'News Microphone', weight = 100, type = 'item', image = 'newsmic.png', unique = false, useable = true, shouldClose = true, description = 'A microphone for the news' },
    newsbmic                     = { name = 'newsbmic', label = 'Boom Microphone', weight = 100, type = 'item', image = 'newsbmic.png', unique = false, useable = true, shouldClose = true, description = 'A Useable BoomMic' },


	------ PETS -------------
    petnet                     	 = { name = 'petnet', label = 'Pet Net', weight = 100, type = 'item', image = 'petnet.png', unique = false, useable = true, shouldClose = true, description = 'A net used to capture pets' },
	
	["rottweiler1"]              = {
        ["name"] = "rottweiler1",
        ["label"] = "Rottweiler",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "rottweiler1.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Black-colored"
    },
    ["rottweiler2"]              = {
        ["name"] = "rottweiler2",
        ["label"] = "Rottweiler",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "rottweiler2.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Brown-colored"
    },
    ["rottweiler3"]              = {
        ["name"] = "rottweiler3",
        ["label"] = "Rottweiler",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "rottweiler3.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Dark brown brindle-colored"
    },

    ["cat1"]                     = {
        ["name"] = "cat1",
        ["label"] = "Cat",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "cat1.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Tabby kitten"
    },
    ["cat2"]                     = {
        ["name"] = "cat2",
        ["label"] = "Cat",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "cat2.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Tuxedo kitten"
    },
    ["cat3"]                     = {
        ["name"] = "cat3",
        ["label"] = "Cat",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "cat3.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Orange kitten"
    },

    ["chicken"]                  = {
        ["name"] = "chicken",
        ["label"] = "Chicken",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "chicken.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Orange kitten"
    },

    ["husky1"]                   = {
        ["name"] = "husky1",
        ["label"] = "Husky",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "husky1.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Black and white-colored"
    },
    ["husky2"]                   = {
        ["name"] = "husky2",
        ["label"] = "Husky",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "husky2.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Golden and white-colored"
    },
    ["husky3"]                   = {
        ["name"] = "husky3",
        ["label"] = "Husky",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "husky3.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Light-colored"
    },

    ["mtlion1"]                  = {
        ["name"] = "mtlion1",
        ["label"] = "Mountain Lion",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "mtlion1.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "What is a kitten doing here?"
    },

    ["panther"]                  = {
        ["name"] = "panther",
        ["label"] = "Panther",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "panther.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "What is a kitten doing here?"
    },

    ["poodle"]                   = {
        ["name"] = "poodle",
        ["label"] = "Poodle",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "poodle.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "A dog for fancy people"
    },

    ["pug1"]                     = {
        ["name"] = "pug1",
        ["label"] = "Pug",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "pug1.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Light-colored"
    },

    ["pug2"]                     = {
        ["name"] = "pug2",
        ["label"] = "Pug",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "pug2.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Gray-colored"

    },
    ["pug3"]                     = {
        ["name"] = "pug3",
        ["label"] = "Pug",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "pug3.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Brown-colored"

    },
    ["pug4"]                     = {
        ["name"] = "pug4",
        ["label"] = "Pug",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "pug4.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Black-colored"
    },

    ["retriever1"]               = {
        ["name"] = "retriever1",
        ["label"] = "Retriever",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "retriever1.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Light orange-colored"

    },
    ["retriever2"]               = {
        ["name"] = "retriever2",
        ["label"] = "Retriever",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "retriever2.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Black-colored"
    },
    ["retriever3"]               = {
        ["name"] = "retriever3",
        ["label"] = "Retriever",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "retriever3.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Light brown-colored"
    },
    ["retriever4"]               = {
        ["name"] = "retriever4",
        ["label"] = "Retriever",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "retriever4.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Brown-colored"
    },

    ["shepherd1"]                = {
        ["name"] = "shepherd1",
        ["label"] = "Shepherd",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "shepherd1.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Good shepherd dog"
    },

    ["westy1"]                   = {
        ["name"] = "westy1",
        ["label"] = "Westy",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "westy1.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "White-colored"
    },
    ["westy2"]                   = {
        ["name"] = "westy2",
        ["label"] = "Westy",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "westy2.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Brown-colored"
    },
    ["westy3"]                   = {
        ["name"] = "westy3",
        ["label"] = "Westy",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "westy3.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Black-colored"
    },

    ["rabbit"]                   = {
        ["name"] = "rabbit",
        ["label"] = "Rabbit",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "rabbit.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "I think he likes rabbits."
    },

}
