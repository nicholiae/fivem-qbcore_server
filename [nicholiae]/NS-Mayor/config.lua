Config = {}
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'
Config.FuelResource = 'LegacyFuel' -- supports any that has a GetFuel() and SetFuel() export
Config.LicenseRank = 3
Config.MayorHelicopter = 'conada'

Config.Locations = {
    duty = {
        vector3(-526.44, -188.38, 47.74),
    },
    vehicle = {
        vector4(-532.64, -270.56, 35.2, 109.05),
    },
    stash = {
        vector3(-535.47, -195.86, 47.74),
    },
    helicopter = {
		vector4(-539.4, -251.67, 36.0, 207.85)
    },
    trash = {
        vector3(-529.41, -193.33, 47.74),
    },
    stations = {
        { 
			label = 'City Hall',        		
			coords = vector4(-517.99, -251.29, 35.68, 206.11) 
		},
    },
}

Config.AuthorizedVehicles = {
    -- Grade 0 and higher
    [0] = {
        coach = 'Coach Bus',
	},
	[1] = {
		Urus_Stretch_6 = 'Stretch Limo',
    },
	[2] = {		
		gofvrb = 'Police Dune',
	},
	[4] = {
		urusbeastedit = 'Beast',
	},
}
