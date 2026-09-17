Config = {}

Config.Target = 'ox' -- or 'qb'

Config.Sections = { 
    HairChair = {
        stations = {
            [1] = {
                client = {
                    targetCoords = vector3(-1541.8, -421.49, 35.31),
                    playerCoords = vector3(-1541.72, -421.43, 34.87),
                    heading = 315.07,
                    animDict = "dc@salonchairsit",
                    animName = "salonchairsit_clip",
                    returnCoords = vector4(-1540.8181152344, -422.09796142578, 35.691589355469, 230.79997253418)
                },
            },
			[2] = {
                client = {
                    targetCoords = vector3(-1546.3, -417.51, 35.31),
                    playerCoords = vector3(-1546.3, -417.51, 34.87),
                    heading = 315.07,
                    animDict = "dc@salonchairsit",
                    animName = "salonchairsit_clip",
                    returnCoords = vector4(-1546.7218017578, -417.99923706055, 35.775188446045, 143.37586975098)
                },
            },
			[3] = {
                client = {
                    targetCoords = vector3(-1550.84, -413.65, 35.3),
                    playerCoords = vector3(-1550.84, -413.65, 34.87),
                    heading = 315.07,
                    animDict = "dc@salonchairsit",
                    animName = "salonchairsit_clip",
                    returnCoords = vector4(-1551.2845458984, -414.05780029297, 35.769786834717, 140.40194702148)
                },
            }
        }
    },
    NailChair = {
        stations = {
            [1] = {
                client = {
                    targetCoords = vector3(-1543.97, -414.85, 35.39),
                    playerCoords = vector3(-1543.87, -414.9, 34.90),
                    heading = 224.02249145508,
                    animDict = "dc@manicure",
                    animName = "manicure_clip",
                    returnCoords = vector4(-1544.0627441406, -415.8232421875, 35.707977294922, 174.56912231445)
                },
                employee = {
                    targetCoords = vector3(-1544.68, -414.26, 35.43),
                    playerCoords = vector3(-1544.68, -414.26, 34.9),
                    heading = 44.713272094727,
                    animDict = "dc@paintnails",
                    animName = "paintnails_clip",
                    returnCoords = vector4(-1545.5111083984, -414.60110473633, 35.711494445801, 141.21438598633)
                }
            },
			[2] = {
                client = {
                    targetCoords = vector3(-1542.11, -412.79, 35.41),
                    playerCoords = vector3(-1542.08, -412.82, 34.9),
                    heading = 224.02249145508,
                    animDict = "dc@manicure",
                    animName = "manicure_clip",
                    returnCoords = vector4(-1542.0601806641, -413.7424621582, 35.707653045654, 234.5267791748)
                },
                employee = {
                    targetCoords = vector3(-1542.86, -412.16, 35.46),
                    playerCoords = vector3(-1542.86, -412.16, 34.9),
                    heading = 44.713272094727,
                    animDict = "dc@paintnails",
                    animName = "paintnails_clip",
                    returnCoords = vector4(-1542.6358642578, -411.40536499023, 35.711280822754, 324.12963867188)
                }
            },
			[3] = {
                client = {
                    targetCoords = vector3(-1545.24, -410.04, 35.42),
                    playerCoords = vector3(-1545.24, -410.04, 34.9),
                    heading = 44.713272094727,
                    animDict = "dc@manicure",
                    animName = "manicure_clip",
                    returnCoords = vector4(-1544.9456787109, -409.30267333984, 35.717235565186, 11.03333568573)
                },
                employee = {
                    targetCoords = vector3(-1544.51, -410.66, 35.46),
                    playerCoords = vector3(-1544.51, -410.66, 34.9),
                    heading = 224.02249145508,
                    animDict = "dc@paintnails",
                    animName = "paintnails_clip",
                    returnCoords = vector4(-1543.6202392578, -410.57028198242, 35.713680267334, 327.59164428711)
                }
            },
			[4] = {
                client = {
                    targetCoords = vector3(-1547.07, -412.17, 35.41),
                    playerCoords = vector3(-1547.07, -412.17, 34.9),
                    heading = 44.713272094727,
                    animDict = "dc@manicure",
                    animName = "manicure_clip",
                    returnCoords = vector4(-1547.69921875, -412.48907470703, 35.717124938965, 120.03057098389)
                },
                employee = {
                    targetCoords = vector3(-1546.33, -412.77, 35.45),
                    playerCoords = vector3(-1546.33, -412.77, 34.9),
                    heading = 224.02249145508,
                    animDict = "dc@paintnails",
                    animName = "paintnails_clip",
                    returnCoords = vector4(-1546.5589599609, -414.03414916992, 35.713672637939, 155.87533569336)
                }
            }
        }
    },
    HairWashChair = {
        stations = {
            [1] = {
                client = {
                    targetCoords = vector3(-1543.65, -419.86, 35.23),
                    playerCoords = vector3(-1543.65, -419.86, 34.8),
                    heading = 135.69429016113,
                    animDict = "dc@shampoosit",
                    animName = "shampoosit_clip",
                    returnCoords = vector4(-1543.0802001953, -419.1364440918, 35.702644348145, 322.2141418457)
                },
                --[[employee = {
                    targetCoords = vector3(131.0, -241.0, 54.0),
                    playerCoords = vector3(131.2, -241.2, 54.0),
                    heading = 0.0,
                    animDict = "misshair_shop@washing",
                    animName = "keeper_wash",
                    returnCoords = vector3(132.0, -242.0, 54.0)
                }--]]
            },
			[2] = {
                client = {
                    targetCoords = vector3(-1544.45, -419.25, 35.24),
                    playerCoords = vector3(-1544.45, -419.25, 34.8),
                    heading = 135.69429016113,
                    animDict = "dc@shampoosit",
                    animName = "shampoosit_clip",
                    returnCoords = vector4(-1543.912109375, -418.55883789062, 35.705062866211, 321.18447875977)
                },
                --[[employee = {
                    targetCoords = vector3(131.0, -241.0, 54.0),
                    playerCoords = vector3(131.2, -241.2, 54.0),
                    heading = 0.0,
                    animDict = "misshair_shop@washing",
                    animName = "keeper_wash",
                    returnCoords = vector3(132.0, -242.0, 54.0)
                }--]]
            },
			[3] = {
                client = {
                    targetCoords = vector3(-1548.57, -415.73, 35.22),
                    playerCoords = vector3(-1548.57, -415.73, 34.8),
                    heading = 135.69429016113,
                    animDict = "dc@shampoosit",
                    animName = "shampoosit_clip",
                    returnCoords = vector4(-1547.9638671875, -415.09872436523, 35.715705871582, 323.07391357422)
                },
                --[[employee = {
                    targetCoords = vector3(131.0, -241.0, 54.0),
                    playerCoords = vector3(131.2, -241.2, 54.0),
                    heading = 0.0,
                    animDict = "misshair_shop@washing",
                    animName = "keeper_wash",
                    returnCoords = vector3(132.0, -242.0, 54.0)
                }--]]
            },
			[4] = {
                client = {
                    targetCoords = vector3(-1549.36, -415.09, 35.22),
                    playerCoords = vector3(-1549.36, -415.09, 34.8),
                    heading = 135.69429016113,
                    animDict = "dc@shampoosit",
                    animName = "shampoosit_clip",
                    returnCoords = vector4(-1548.810546875, -414.34625244141, 35.716442108154, 320.25741577148)
                },
                --[[employee = {
                    targetCoords = vector3(131.0, -241.0, 54.0),
                    playerCoords = vector3(131.2, -241.2, 54.0),
                    heading = 0.0,
                    animDict = "misshair_shop@washing",
                    animName = "keeper_wash",
                    returnCoords = vector3(132.0, -242.0, 54.0)
                }--]]
            }
        }
    },
    PedicureChair = {
        stations = {
            [1] = {
                client = {
                    targetCoords = vector3(-1547.96, -405.61, 35.44),
                    playerCoords = vector3(-1548.12, -405.53, 35.0),
                    heading = 45.471187591553,
                    animDict = "dc@pedchairclient2",
                    animName = "pedchairclient2_clip",
                    returnCoords = vector4(-1548.1339111328, -406.51754760742, 35.773002624512, 234.11026000977)
                },
                employee = {
                    targetCoords = vector3(-1547.04, -406.37, 35.33),
                    playerCoords = vector3(-1547.04, -406.37, 34.8),
                    heading = 228.76783752441,
                    animDict = "dc@pedchairtech",
                    animName = "pedchairtech_clip",
                    returnCoords = vector4(-1546.5191650391, -406.84262084961, 35.722854614258, 233.04510498047)
                }
            },
			[2] = {
                client = {
                    targetCoords = vector3(-1549.09, -406.69, 35.44),
                    playerCoords = vector3(-1549.09, -406.69, 35.0),
                    heading = 45.471187591553,
                    animDict = "dc@pedchairclient2",
                    animName = "pedchairclient2_clip",
                    returnCoords = vector4(-1549.2565917969, -407.49765014648, 35.773677825928, 232.08917236328)
                },
                employee = {
                    targetCoords = vector3(-1548.02, -407.56, 35.33),
                    playerCoords = vector3(-1548.02, -407.56, 34.8),
                    heading = 228.76783752441,
                    animDict = "dc@pedchairtech",
                    animName = "pedchairtech_clip",
                    returnCoords = vector4(-1547.4458007812, -408.03854370117, 35.722537994385, 233.69540405273)
                }
            },
			[3] = {
                client = {
                    targetCoords = vector3(-1550.05, -407.87, 35.44),
                    playerCoords = vector3(-1550.05, -407.87, 35.0),
                    heading = 45.471187591553,
                    animDict = "dc@pedchairclient2",
                    animName = "pedchairclient2_clip",
                    returnCoords = vector4(-1550.1815185547, -408.7966003418, 35.773342132568, 230.46801757812)
                },
                employee = {
                    targetCoords = vector3(-1548.99, -408.74, 35.33),
                    playerCoords = vector3(-1548.99, -408.74, 34.8),
                    heading = 228.76783752441,
                    animDict = "dc@pedchairtech",
                    animName = "pedchairtech_clip",
                    returnCoords = vector4(-1548.4952392578, -409.11578369141, 35.722560882568, 229.81721496582)
                }
            },
			[4] = {
                client = {
                    targetCoords = vector3(-1551.15, -409.06, 35.44),
                    playerCoords = vector3(-1551.15, -409.06, 35.0),
                    heading = 45.471187591553,
                    animDict = "dc@pedchairclient2",
                    animName = "pedchairclient2_clip",
                    returnCoords = vector4(-1550.7728271484, -410.63626098633, 35.723777770996, 201.95877075195)
                },
                employee = {
                    targetCoords = vector3(-1550.06, -409.94, 35.33),
                    playerCoords = vector3(-1550.06, -409.94, 34.8),
                    heading = 228.76783752441,
                    animDict = "dc@pedchairtech",
                    animName = "pedchairtech_clip",
                    returnCoords = vector4(-1549.3836669922, -410.52752685547, 35.721900939941, 223.40135192871)
                }
            }
        }
    },
	WaxChair = {
        stations = {
            [1] = {
                client = {
                    targetCoords = vector3(-1561.35, -403.38, 35.69),
                    playerCoords = vector3(-1561.35, -403.38, 35.67),
                    heading = 45.453598022461,
                    animDict = "dc@facialanim",
                    animName = "facialanim_clip",
                    returnCoords = vector4(-1561.6186523438, -404.552734375, 35.747745513916, 228.75187683105)
                },
                --[[employee = {
                    targetCoords = vector3(221.32, -1488.05, 28.93),
                    playerCoords = vector3(221.43, -1488.12, 28.4),
                    heading = 228.76783752441,
                    animDict = "dc@pedchairtech",
                    animName = "pedchairtech_clip",
                    returnCoords = vector4(221.91578674316, -1488.4467773438, 29.326290130615, 222.72453308105)
                }--]]
            }
        }
    },
    HairDryer = {
        stations = {
            [1] = {
                client = {
                    targetCoords = vector3(-1541.87, -409.01, 35.23),
                    playerCoords = vector3(-1541.71, -408.85, 34.8),
                    heading = 315.5205078125,
                    animDict = "dc@salonchairsit",
                    animName = "salonchairsit_clip",
                    returnCoords = vector4(-1542.3831787109, -409.5764465332, 35.713134765625, 144.89279174805)
                }
            },
			[2] = {
                client = {
                    targetCoords = vector3(-1542.94, -407.88, 35.22),
                    playerCoords = vector3(-1542.9, -407.84, 34.8),
                    heading = 315.5205078125,
                    animDict = "dc@salonchairsit",
                    animName = "salonchairsit_clip",
                    returnCoords = vector4(-1543.5600585938, -408.50869750977, 35.71635055542, 141.52935791016)
                }
            },
			[3] = {
                client = {
                    targetCoords = vector3(-1544.04, -406.86, 35.22),
                    playerCoords = vector3(-1544.04, -406.86, 34.8),
                    heading = 315.5205078125,
                    animDict = "dc@salonchairsit",
                    animName = "salonchairsit_clip",
                    returnCoords = vector4(-1544.6859130859, -407.68051147461, 35.719078063965, 138.42868041992)
                }
            },
			[4] = {
                client = {
                    targetCoords = vector3(-1545.2, -405.86, 35.22),
                    playerCoords = vector3(-1545.2, -405.86, 34.8),
                    heading = 315.5205078125,
                    animDict = "dc@salonchairsit",
                    animName = "salonchairsit_clip",
                    returnCoords = vector4(-1545.7770996094, -406.61108398438, 35.726612091064, 143.99563598633)
                }
            }
        }
    }
}
