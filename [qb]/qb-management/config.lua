-- Zones for Menus
Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.MarkerDist = 50

Config.BossMenus = {
    rockrec = {--
        vector3(-1007.85, -264.83, 44.8),
    },
    tow = {--
        vector3(473.54, -1313.65, 29.21),
    },
    firefighter = {--
        vector3(204.08, -1641.94, 29.8),
    },
    tuners = {--
        vector3(124.74, -3007.9, 7.04),
    },
    pets = {--
        vector3(558.91, 2752.55, 42.88),
    },
    mechj = {--
        vector3(-349.47, -1335.82, 36.29),
    },
    pulse = {--
        vector3(375.27, -742.4, 33.07),
    },
    lux = {--
        vector3(-318.88, 192.15, 144.37),
    },
    mayor = {--
        vector3(-535.35, -193.67, 47.74),
    },
	lawyer = {--
        vector3(0, 0, 0),
    },
	reporter = {--
        vector3(-575.06, -938.44, 28.82),
    },
	police = {--
        vector3(427.72, -979.41, 35.8),
    },
    ambulance = {--
        vector3(311.21, -599.36, 43.29),
    },
    cardealer = {--
        vector3(-1249.69, -345.39, 37.33),
    },
    mechanic = {--
        vector3(-347.59, -133.35, 39.01),
    },
    pjsauto = {--
        vector3(1187.13, 2637.36, 38.4),
    },
    customs = {--
        vector3(-337.81, -150.18, 45.8),
    },
    cookies = {--
        vector3(-933.75, -1168.24, 5.09),
    },
    whitewidow = {--
        vector3(183.14, -251.62, 54.07),
    },
    rustys = {--
        vector3(-589.2, -886.2, 25.95),
    },
    burgershot = {--
        vector3(-1192.89, -898.58, 14.0),
    },
    butcher = {--
        vector3(-69.53, 6256.01, 31.09),
    },
    skydiving = {--
        vector3(1702.42, 3290.77, 48.92),
    },
    drivein = {--
        vector3(-1193.91, -1759.44, 4.0),
    },
    realestate = {--
        vector3(-716.4, 260.25, 84.14),
    },
    weedshop = {--
        vector3(-1171.68, -1575.43, 4.51),
    },
    tequilala = {--
        vector3(-568.41, 291.12, 79.18),
    },
    bikes = {--
        vector3(-228.56, 6210.04, 31.97),
    },
    pizzeria = {--
        vector3(-1345.75, -1060.89, 3.87),
    },
    tattoos = {--
        vector3(321.8, 185.55, 103.59),
    },
    beauty = {--
        vector3(218.35, -1471.15, 29.33),
    },
}

Config.GangMenus = {
    cityservice = { -- 
        vector3(81.34, -1965.8, 18.04),--
    },
	otf = { -- zain gang Bloods HQ
        vector3(-1567.08, -411.03, 48.27),--
    },
    lostmc = {
        vector3(1045.83, -2531.38, 28.96),--
    },
    ballas = {
        vector3(0.0, 0.0, 0.0),--
    },
    syndicate = {
        vector3(5546.76, -5903.49, 21.8),--
    },
    abk = { --smokes gang Vagos affiliation
        vector3(453.84, -2199.92, 24.4),--
    },
    families = {
        vector3(0, 0, 0),--
    },
    marabunte = {
        vector3(0, 0, 0),--
    },
    hillbilly = {
        vector3(0, 0, 0),--
    },
    salva = {
        vector3(0, 0, 0),--
    },
	-- no NPC gangs --
    cartel = {
        vector3(0, 0, 0),--
    },
}
