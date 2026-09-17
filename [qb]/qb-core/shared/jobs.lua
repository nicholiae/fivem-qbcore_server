QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	unemployed = { label = 'Civilian', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Freelancer', payment = 100 } } },
	bus = { label = 'Bus', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 400 } } },
	mayor = { 
		label = 'Mayors Office', 
		type = 'leo',
		defaultDuty = true, 
		offDutyPay = true, 
		grades = { 
		['0'] = { 
				name = 'Aid Assistant', 
				payment = 1000 
			},
		['1'] = {
                name = "Council Assistant",
                payment = 1500
            },
		['2'] = {
                name = "Mayor Aid",
                payment = 2000
            },
		['3'] = {
                name = "Legal Council",
                payment = 2500
            },
		['4'] = {
                name = "Mayor",
				isboss = true,
                payment = 5000
            },
        },
	},
	rockrec = { 
		label = 'Rockford Records', 
		defaultDuty = true, 
		offDutyPay = false, 
		grades = { 
		['0'] = {
                name = "Manager",
                payment = 700
            },
		['1'] = {
                name = "Producer",
                payment = 800
            },
		['2'] = {
                name = "Engineer",
                payment = 900
            },
		['3'] = {
                name = "Owner",
				isboss = true,
                payment = 1000
            },
        },
	},
	supreme = { label = 'Supreme Justice', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Supreme Court Justice', payment = 2000 } } },
	judge = { label = 'Honorary', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Judge', payment = 1000 } } },
	lawyer = { label = 'Law Firm', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Associate', payment = 800 } } },
	reporter = { 
		label = 'StarValley News', 
		defaultDuty = true, 
		offDutyPay = false, 
		grades = { 
		['0'] = { 
				name = 'Boom Operator', 
				payment = 600 
			},
		['1'] = {
                name = "Camera Operator",
                payment = 700
            },
		['2'] = {
                name = "Weather Reporter",
                payment = 800
            },
		['3'] = {
                name = "Journalist",
                payment = 900
            },
		['4'] = {
                name = "Owner",
				isboss = true,
                payment = 1000
            },
        },
	},
	trucker = {
		label = 'Trucker', 
		defaultDuty = true, 
		offDutyPay = false,
		grades = { 
		['0'] = { 
				name = 'Secretary', 
				payment = 500 
			},
		['1'] = {
				name = 'Driver', 
				payment = 750 
            },
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 1000
            },
        },
	},
	tow = { 
		label = 'Towing', 
		defaultDuty = true, 
		offDutyPay = false,
		grades = { 
		['0'] = { 
				name = 'Secretary', 
				payment = 500 
			},
		['1'] = {
				name = 'Driver', 
				payment = 750 
            },
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 1000
            },
        },
	},
	garbage = { 
		label = 'Garbage', 
		defaultDuty = true, 
		offDutyPay = false,
		grades = { 
		['0'] = { 
				name = 'Secretary', 
				payment = 500 
			},
		['1'] = {
				name = 'Driver', 
				payment = 750 
            },
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 1000
            },
        },
	},
	vineyard = { 
		label = 'Vineyard', 
		defaultDuty = true, 
		offDutyPay = false,
		grades = { 
		['0'] = { 
				name = 'Secretary', 
				payment = 500 
			},
		['1'] = {
				name = 'Driver', 
				payment = 750 
            },
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 1000
            },
        },
	},
	hotdog = { label = 'Hotdog',
		defaultDuty = true, 
		offDutyPay = false,
		grades = { 
		['0'] = { 
				name = 'Secretary', 
				payment = 500 
			},
		['1'] = {
				name = 'Driver', 
				payment = 750 
            },
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 1000
            },
        },
	},
	gotur = { 
		label = "Götür", 
		defaultDuty = true, 
		grades = { 
		['0'] = { 
				name = 'Secretary', 
				payment = 500 
			},
		['1'] = {
				name = 'Driver', 
				payment = 750 
            },
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 1000
            },
        },
	},
	birdies = {
		label = 'Birdy\'s BirdHouses',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Janitorial', payment = 600 },
			['1'] = { name = 'Desk Clerk', payment = 700 },
			['2'] = { name = 'Host', payment = 800 },
			['3'] = { name = 'Manager', isboss = true, payment = 900 },
			['4'] = { name = 'Owner', isboss = true, payment = 1000 },
		},
	},
	bikes = {
		label = 'Lost Rides',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 600 },
			['1'] = { name = 'Novice', payment = 700 },
			['2'] = { name = 'Experienced', payment = 800 },
			['3'] = { name = 'Manager', payment = 900 },
			['4'] = { name = 'Owner', isboss = true, payment = 1000 },
		},
	},
	pets = { 
		label = "Animal Ark", 
		defaultDuty = true, 
		offDutyPay = false,
		grades = { 
		['0'] = {
                name = "Pet Petter",
                payment = 500
            },
		['1'] = {
                name = "Pet Walker",
                payment = 600
            },
  
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 750
            },
		['3'] = {
                name = "Owner",
				isboss = true,
                payment = 1000
            },
        },
	},
	pizzeria = { 
		label = "Zane's Pizzeria", 
		defaultDuty = true, 
		grades = { 
		['0'] = {
                name = "Pizza Turner",
                payment = 500
            },
		['1'] = {
                name = "Shop Keep",
                payment = 600
            },
  
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 750
            },
		['3'] = {
                name = "Owner",
				isboss = true,
                payment = 1000
            },
        },
	},
	tequilala = { 
		label = "Tequi-la-la", 
		defaultDuty = true, 
		grades = { 
		['0'] = {
                name = "La-La Supplier",
                payment = 500
            },
		['1'] = {
                name = "Shop Keep",
                payment = 600
            },
  
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 750
            },
		['3'] = {
                name = "Owner",
				isboss = true,
                payment = 1000
            },
        },
	},
	pjsauto = { 
		label = "PJs Auto", 
		defaultDuty = true, 
		grades = { 
		['0'] = {
                name = "PJ Spreader",
                payment = 500
            },
		['1'] = {
                name = "Shop Keep",
                payment = 600
            },
  
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 750
            },
		['3'] = {
                name = "Owner",
				isboss = true,
                payment = 1000
            },
        },
	},
	firefighter = {
		label = 'Firefighter',
		defaultDuty = true,
		offDutyPay = true,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 500
            },
            ['1'] = {
                name = 'Firefighter',
                payment = 600
            },
			['2'] = {
                name = 'Shift Leader',
                payment = 800
            },
			['3'] = {
                name = 'Lieutenant',
                payment = 1850
            },
            ['4'] = {
                name = 'Captain',
                payment = 2900
            },
            ['5'] = {
                name = 'Asst. Chief',
                isboss = true,
                payment = 3950
            },
			['6'] = {
                name = 'Chief',
				isboss = true,
                payment = 5000
            },
        },
	},
	pulse = { 
		label = "Pulse NightClub", 
		defaultDuty = true, 
		grades = { 
		['0'] = {
                name = "Pulse Checker",
                payment = 500
            },
		['1'] = {
                name = "Shop Keep",
                payment = 600
            },
  
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 750
            },
		['3'] = {
                name = "Owner",
				isboss = true,
                payment = 1000
            },
        },
	},
	lux = { 
		label = "LUX NightClub", 
		defaultDuty = true, 
		grades = { 
		['0'] = {
                name = "Bartender",
                payment = 150
            },
		['1'] = {
                name = "Promoter",
                payment = 350
            },
  
		['2'] = {
                name = "Disc Jockey",
                payment = 550
            },
		['3'] = {
                name = "Bouncer",
				isboss = true,
                payment = 750
            },
		['4'] = {
                name = "Owner",
				isboss = true,
                payment = 1000
            },
        },
	},
	weedshop = { 
		label = "Smoke on the Water", 
		defaultDuty = true, 
		grades = { 
		['0'] = {
                name = "Water Wetter",
                payment = 500
            },
		['1'] = {
                name = "Shop Keep",
                payment = 600
            },
  
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 750
            },
		['3'] = {
                name = "Owner",
				isboss = true,
                payment = 1000
            },
        },
	},
	
	drivein = { 
		label = "Drive-In", 
		defaultDuty = true, 
		grades = { 
		['0'] = {
                name = "Parking Space",
                payment = 500
            },
		['1'] = {
                name = "Shop Keep",
                payment = 600
            },
  
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 750
            },
		['3'] = {
                name = "Owner",
				isboss = true,
                payment = 1000
            },
        },
	},
	
	skydiving = { 
		label = "SkyDiving", 
		defaultDuty = true, 
		grades = { 
		['0'] = {
                name = "Wheel Turner",
                payment = 500
            },
		['1'] = {
                name = "Shop Keep",
                payment = 600
            },
  
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 750
            },
		['3'] = {
                name = "Owner",
				isboss = true,
                payment = 1000
            },
        },
	},
	
	mechj = { 
		label = "XCIV", 
		defaultDuty = true, 
		type = 'mechanic',
		grades = { 
		['0'] = {
                name = "Rubber Rubber",
                payment = 500
            },
		['1'] = {
                name = "Shop Keep",
                payment = 600
            },
  
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 750
            },
		['3'] = {
                name = "Owner",
				isboss = true,
                payment = 1000
            },
        },
	},
	tattoos = { -- the businessName from config_business.lua
		label = 'Ink Jet',
		defaultDuty = true,
		offDutyPay = false,
		grades = { -- names must be same as in config_business.lua
			['0'] = {
				name = 'novice',
				payment = 500
			},
			['1'] = {
				name = 'apprentice',
				payment = 600
			},
			['2'] = {
				name = 'artist',
				payment = 750
			},
			['3'] = {
				name = 'boss',
				payment = 1000,
				isboss = true 
				},
			},
	},
	
	beauty = { 
		label = "Beauty", 
		defaultDuty = true, 
		grades = { 
		['0'] = {
                name = "Greeter",
                payment = 500
            },
		['1'] = {
                name = "Register Operator",
                payment = 600
            },
  
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 750
            },
		['3'] = {
                name = "Owner",
				isboss = true,
                payment = 1000
            },
        },
	},
	
	tuners = { 
		label = "Tuner's", 
		defaultDuty = true, 
		type = 'mechanic',
		grades = { 
		['0'] = {
                name = "Rubber Rubber",
                payment = 500
            },
		['1'] = {
                name = "Shop Keep",
                payment = 600
            },
  
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 750
            },
		['3'] = {
                name = "Owner",
				isboss = true,
                payment = 1000
            },
        },
	},
	
	customs = { 
		label = "Smoke N Motors", 
		defaultDuty = true, 
		type = 'mechanic',
		grades = { 
		['0'] = {
                name = "Rubber Rubber",
                payment = 500
            },
		['1'] = {
                name = "Shop Keep",
                payment = 600
            },
  
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 750
            },
		['3'] = {
                name = "Owner",
				isboss = true,
                payment = 1000
            },
        },
	},
	
	butcher = { 
		label = "Butcher", 
		defaultDuty = true, 
		grades = { 
		['0'] = {
                name = "Meat Stroker",
                payment = 500
            },
		['1'] = {
                name = "Shop Keep",
                payment = 600
            },
  
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 750
            },
		['3'] = {
                name = "Owner",
				isboss = true,
                payment = 1000
            },
        },
	},
	
	burgershot = { 
		label = "Burger Shot", 
		defaultDuty = true, 
		grades = { 
		['0'] = {
                name = "Bun Fluffer",
                payment = 500
            },
		['1'] = {
                name = "Shop Keep",
                payment = 600
            },
  
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 750
            },
		['3'] = {
                name = "Owner",
				isboss = true,
                payment = 1000
            },
        },
	},
	
	rustys = { 
		label = "rustys", 
		defaultDuty = true, 
		grades = { 
		['0'] = {
                name = "Bean Counter",
                payment = 500
            },
		['1'] = {
                name = "Shop Keep",
                payment = 600
            },
  
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 750
            },
		['3'] = {
                name = "Owner",
				isboss = true,
                payment = 1000
            },
        },
	},
	
	whitewidow = { 
		label = "White Widow", 
		defaultDuty = true, 
		grades = { 
		['0'] = {
                name = "Widow Maker",
                payment = 500
            },
		['1'] = {
                name = "Shop Keep",
                payment = 600
            },
  
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 750
            },
		['3'] = {
                name = "Owner",
				isboss = true,
                payment = 1000
            },
        },
	},
	
	cookies = { 
		label = "Cookies", 
		defaultDuty = true, 
		grades = { 
		['0'] = {
                name = "Budd Tender",
                payment = 500
            },
		['1'] = {
                name = "Shop Keep",
                payment = 600
            },
  
		['2'] = {
                name = "Manager",
				isboss = true,
                payment = 750
            },
		['3'] = {
                name = "Owner",
				isboss = true,
                payment = 1000
            },
        },
	},
	
	police = {
		label = 'Law Enforcement',
		type = 'leo',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 500 },
			['1'] = { name = 'Officer', payment = 1000 },
			['2'] = { name = 'Sergeant', payment = 2000 },
			['3'] = { name = 'Lieutenant', payment = 3000 },
			['4'] = { name = 'Captain', isboss = true, payment = 4000 },
			['5'] = { name = 'Chief', isboss = true, payment = 5000 },
		},
	},
	ambulance = {
		label = 'EMS',
		type = 'ems',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 500 },
			['1'] = { name = 'Paramedic', payment = 1000 },
			['2'] = { name = 'Doctor', payment = 2000 },
			['3'] = { name = 'Surgeon', payment = 3000 },
			['4'] = { name = 'Captain', isboss = true, payment = 4000 },
			['5'] = { name = 'Chief', isboss = true, payment = 5000 },
		},
	},
	realestate = {
		label = 'Real Estate',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 1000 },
			['1'] = { name = 'House Sales', payment = 1500 },
			['2'] = { name = 'Business Sales', payment = 2000 },
			['3'] = { name = 'Broker', payment = 2500 },
			['4'] = { name = 'Manager', isboss = true, payment = 3000 },
		},
	},
	taxi = {
		label = 'Taxi',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 600 },
			['1'] = { name = 'Driver', payment = 700 },
			['2'] = { name = 'Event Driver', payment = 800 },
			['3'] = { name = 'Sales', payment = 900 },
			['4'] = { name = 'Manager', isboss = true, payment = 1000 },
		},
	},
	cardealer = {
		label = 'Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 600 },
			['1'] = { name = 'Showroom Sales', payment = 700 },
			['2'] = { name = 'Business Sales', payment = 800 },
			['3'] = { name = 'Finance', payment = 900 },
			['4'] = { name = 'Manager', isboss = true, payment = 1000 },
		},
	},
	mechanic = {
		label = 'LS Customs1',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 600 },
			['1'] = { name = 'Novice', payment = 700 },
			['2'] = { name = 'Experienced', payment = 800 },
			['3'] = { name = 'Advanced', payment = 900 },
			['4'] = { name = 'Manager', isboss = true, payment = 1000 },
		},
	},
	mechanic2 = {
		label = 'LS Customs2',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 600 },
			['1'] = { name = 'Novice', payment = 700 },
			['2'] = { name = 'Experienced', payment = 800 },
			['3'] = { name = 'Advanced', payment = 900 },
			['4'] = { name = 'Manager', isboss = true, payment = 1000 },
		},
	},
	mechanic3 = {
		label = 'LS Customs3',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 600 },
			['1'] = { name = 'Novice', payment = 700 },
			['2'] = { name = 'Experienced', payment = 800 },
			['3'] = { name = 'Advanced', payment = 900 },
			['4'] = { name = 'Manager', isboss = true, payment = 1000 },
		},
	},
	beeker = {
		label = 'Beeker\'s Garage',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 600 },
			['1'] = { name = 'Novice', payment = 700 },
			['2'] = { name = 'Experienced', payment = 800 },
			['3'] = { name = 'Advanced', payment = 900 },
			['4'] = { name = 'Manager', isboss = true, payment = 1000 },
		},
	},
	bennys = {
		label = 'Benny\'s Original Motor Works',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 600 },
			['1'] = { name = 'Novice', payment = 700 },
			['2'] = { name = 'Experienced', payment = 800 },
			['3'] = { name = 'Advanced', payment = 900 },
			['4'] = { name = 'Manager', isboss = true, payment = 1000 },
		},
	},
}
