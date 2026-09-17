Config = {}

Config.UseableItems = true -- Set to false if you want to use commands instead of usable items

Config.Locations = {
    ["main"] = {
        label = "Weazle News HQ",
        coords = vector4(-575.66, -912.82, 23.82, 115.76),
    },
    ["inside"] = {
        label = "Weazle News HQ Inside",
        coords = vector4(-77.46, -833.77, 243.38, 67.5),
    },
    ["outside"] = {
        label = "Weazle News HQ Outside",
        coords = vector4(-575.66, -912.82, 23.82, 115.76),
    },
    ["vehicle"] = {
        label = "Vehicle Storage",
        coords = vector4(-552.24, -925.61, 23.86, 242.5),
    },
    ["heli"] = {
        label = "Helicopter Storage",
        coords = vector4(-583.41, -930.63, 36.83, 74.57),
    }
}

Config.Vehicles = {
    -- Grade 0
    [0] = {
        ["rumpo"] = "Rumpo",
    },
    -- Grade 1
    [1] = {
        ["rumpo"] = "Rumpo",

    },
    -- Grade 2
    [2] = {
        ["rumpo"] = "Rumpo",
    },
    -- Grade 3
    [3] = {
        ["rumpo"] = "Rumpo",
    },
    -- Grade 4
    [4] = {
        ["rumpo"] = "Rumpo",
    }
}

Config.Helicopters = {
    -- Grade 0
    [0] = {
        ["frogger"] = "Frogger",
    },
    -- Grade 1
    [1] = {
        ["frogger"] = "Frogger",

    },
    -- Grade 2
    [2] = {
        ["frogger"] = "Frogger",
    },
    -- Grade 3
    [3] = {
        ["frogger"] = "Frogger",
    },
    -- Grade 4
    [4] = {
        ["frogger"] = "Frogger",
    }
}

Config.VehicleItems = {
    [1] = {
        name = "newscam",
        amount = 1,
        info = {},
    },
    [2] = {
        name = "newsmic",
        amount = 1,
        info = {},
    },
    [3] = {
        name = "newsbmic",
        amount = 1,
        info = {},
    },
}
