Crypto = {
	Lower = math.random(1500,1600),
	Upper = math.random(2500,2800),
    History = {
        ["qbit"] = {}
    },

    Worth = {
        ["qbit"] = math.random(2000,2100)
        -- ["qbit"] = 555
    },

    Labels = {
        ["qbit"] = "Qbit"
    },

    Exchange = {
        coords = vector3(1276.21, -1709.88, 54.57),
        RebootInfo = {
            state = false,
            percentage = 5
        },
    },
	
	PurchaseTax = 0.10,
    -- For auto updating the value of qbit
    Coin = 'qbit',
    RefreshTimer = math.random(3,7), -- In minutes, so every 10 minutes.

    -- Crashes or luck
    ChanceOfCrashOrLuck = math.random(3,9), -- This is in % (1-100)
    Crash = {math.random(200,400),math.random(600,800)}, -- Min / Max
    Luck = {math.random(200,400),math.random(500,600)}, -- Min / Max

    -- If not not Chance of crash or luck, then this shit
	ChanceOfCrash = math.random(0,808),
    ChanceOfDown = math.random(math.random(30,35),math.random(40,45)), -- If out of 100 hits less or equal to
    ChanceOfUp = math.random(math.random(40,45),math.random(50,55)), -- If out of 100 is greater or equal to
    CasualDown = {math.random(10,15),math.random(60,90)}, -- Min / Max (If it goes down)
    CasualUp = {math.random(10,15),math.random(30,45)}, -- Min / Max (If it goes up)
}




Ticker = {
    Enabled = false, -- Decide whether the real life price ticker should be enabled or not :)  
    coin = 'BTC', --- The coin, please make sure you find the actual name, for example: Bitcoin vs BTC, BTC would be correct
    currency = 'USD', -- For example USD, NOK, SEK, EUR, CAD and more here https://www.countries-ofthe-world.com/world-currencies.html
    tick_time = 2, --- Minutes (Minimum is 2 minutes) 20,160 Requests a month, Its recommended to get the free API key so the crypto script doesnt switch on and off if ratelimit is encountered
    Api_key = 'put_api_key_here', -- If you decide to get an api key for the API (https://min-api.cryptocompare.com/pricing) The free plan should be more than enough for 1 Fivem server
    --- Error handle stuff, for more user friendly and readable errors, Don't touch.
    Error_handle = {
        ['fsym is a required param.'] = 'Config error: Invalid / Missing coin name',
        ['tsyms is a required param.'] = 'Config error: Invalid / Missing currency',
        ['cccagg_or_exchange'] = 'Config error: Invalid currency / coin combination', -- For some reason api throws this error if either coin or currency is invalid
    },
}
