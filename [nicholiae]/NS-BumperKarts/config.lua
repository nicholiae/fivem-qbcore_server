cfg = {}

cfg.minPlayers = 1
cfg.maxPlayers = 10
cfg.costToPlay = 50

cfg.ticketMaster = {
    ped = `a_m_m_fatlatin_01`,
    location = vector3(-1721.669921875,-1125.4945068359,13.114929199219),
    markerLocation = vector3(-1722.4866943359,-1124.8459472656,13.134929199219)
}

cfg.bumperKarts = {
    vehicleModel = `brioso2`,
    vehicleModelList = {
		`durango`,
		`porsche`,
		`x6mf96`,
		`sjbbox`,
		`ruck72`,
		`ro90`,
		`Shelbytacoma4x4`,
		`vagner`,
		`dune`,
		`everon`,
		`outlaw`,
		`trophytruck`,
		`issi6`,
		`winky`,
		`dune3`,
		`kart3`,
		`brioso2`,
		`bifta`,
		`yosemite3`,
		`rhapsody`,
		`f12rp`,
		`ToraChargerLifted`,
		`rmodcharger69`,
		`raid`
	},
    locations = { -- All locations are based on this map: https://www.gta5-mods.com/maps/car-bumper-funny-mapping, all credits to Patoche for the map.
        vector3(-1716.4959716797,-1148.2423095703,13.1),
        vector3(-1708.3111572266,-1158.0,13.1),
        vector3(-1711.5904541016,-1171.166015625,13.1),
        vector3(-1721.5659179688,-1174.2330322266,13.1),
        vector3(-1736.6031494141,-1172.1981201172,13.1),
        vector3(-1764.66, -1186.78, 13.0),
        vector3(-1746.9, -1201.2, 13.0),
        vector3(-1715.32, -1202.92, 13.0),
        vector3(-1715.07, -1170.37, 13.0),
        vector3(-1736.09, -1177.47, 13.0)
    }
}

cfg.gameSettings = {
    queueTimer = 18, -- SECONDS  
    timeToPlayGame = 90, -- SECONDS
    spawnLocAfterGame = vector3(-1732.5638427734,-1116.8132324219,13.017228126526)

}

