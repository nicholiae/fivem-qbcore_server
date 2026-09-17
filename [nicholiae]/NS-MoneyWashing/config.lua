Config = {}

Config.WashLocation = {
    [1] = {
            coords = vector3(1122.31, -3194.71, -40.4),
            length = 1.5,
            width = 1.8,
            heading = 2.0,
            debugPoly = false,
            minZ = -41.00,
            maxZ = -39.00,
            distance = 3.0
        },
    }

Config.BankMoney = false -- Set to true if you want the money to go into the players bank
Config.UseTimes = false -- Set to false if you want the wash open 24/7
Config.TimeOpen = 7 -- Opening Time
Config.TimeClosed = 17 -- Closing Time
Config.SendWashingEmail = true
Config.tax = math.random(7,12) -- percentage 
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'

Config.ScrubItems = {
	{
		item = 'goldbar',
		price = math.random(1500,2500)
	},
	{
        item = 'printedcash',
        price = math.random(4000,6000)
    }
}

Config.WashItems = { -- meltTime is amount of time in minutes per item
    {
        item = 'moneybag',
        rewards = {
            [1] = {
                item = 'cash',
                amount = math.random(7,12)
            }
        },
        washTime = 0.25
    },
	{
        item = 'markedbills',
        rewards = {
            [1] = {
                item = 'cash',
                amount = math.random(7,12)
            }
        },
        washTime = 0.15
    }
}
