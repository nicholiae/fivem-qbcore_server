Config = Config or {}
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'
-- Config --

Config.StandDeposit = 250

Config.MyLevel = 1
Config.MaxReputation = 200

Config.Locations = {
    ["take"] = {
        coords = vector4(39.31, -1005.54, 29.48, 240.57),
    },
    ["spawn"] = {
        coords = vector4(38.15, -1001.65, 29.44, 342.5),
    },
}

Config.Stock = {
    ["exotic"] = {
        Current = 0,
        Max = {
            [1] = 15,
            [2] = 30,
            [3] = 45,
            [4] = 60,
        },
        Label = Lang:t("info.label_a"),
        Price = {
            [1] = {
                min = 180,
                max = 212,
            },
            [2] = {
                min = 209,
                max = 313,
            },
            [3] = {
                min = 310,
                max = 414,
            },
            [4] = {
                min = 411,
                max = 515,
            },
        }
    },
    ["rare"] = {
        Current = 0,
        Max = {
            [1] = 15,
            [2] = 30,
            [3] = 45,
            [4] = 60,
        },
        Label = Lang:t("info.label_b"),
        Price = {
            [1] = {
                min = 56,
                max = 99,
            },
            [2] = {
                min = 97,
                max = 210,
            },
            [3] = {
                min = 108,
                max = 311,
            },
            [4] = {
                min = 209,
                max = 412,
            },
        }
    },
    ["common"] = {
        Current = 0,
        Max = {
            [1] = 15,
            [2] = 30,
            [3] = 45,
            [4] = 60,
        },
        Label = Lang:t('info.label_c'),
        Price = {
            [1] = {
                min = 14,
                max = 16,
            },
            [2] = {
                min = 25,
                max = 57,
            },
            [3] = {
                min = 106,
                max = 209,
            },
            [4] = {
                min = 207,
                max = 309,
            },
        }
    },
}
