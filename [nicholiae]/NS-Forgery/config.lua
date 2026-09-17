local QBCore = exports['qb-core']:GetCoreObject()


Config = {}


Config.PoliceOnDutyRequired = 0
Config.MyDebug = false
Config.Entrance = vector4(2475.63, -384.04, 94.4, 91.36)
Config.CrazyEntrance = vector4(-1000.97, 4853.33, 274.61, 336.31)
Config.InsideStart = vector4(1173.79, -3196.62, -39.01, 90.61)
Config.Jail = vector4(1853.58, 2608.27, 45.67, 269.8)
Config.BusJail = vector4(1850.26, 2608.38, 45.59, 89.52)
Config.JailBus = 'policet'
Config.JailGetAwayLoc = vector4(1869.55, 2595.36, 45.67, 268.39)
Config.JailGetAwayVeh = 'mkivsupra'
Config.theExit = vector3(1160.29, -3192.23, -39.01)
Config.WakeUp = vector4(319.65, -191.76, 58.57, 245.49)

Config.ForgeryPeds = {
	PedConfig = {
		{pos = vector3(1167.12, -3196.97, -39.01), heading = 270.27, ped = 'a_m_y_smartcaspat_01'},
		{pos = vector3(1162.66, -3197.5, -39.01), heading = 270.71, ped = 'cs_orleans'},
		{pos = vector3(1157.82, -3196.98, -39.01), heading = 270.0, ped = 'csb_anton'},
	}
}
Config.JailPeds = {
	PedConfig = {
		{pos = vector3(1849.28, 2606.95, 45.58), heading = 167.43, ped = 'a_f_y_femaleagent', weapon = 'weapon_autoshotgun'},
		{pos = vector3(1830.46, 2603.26, 45.89), heading = 7.61, ped = 's_m_m_chemsec_01', weapon = 'weapon_militaryrifle'},
		{pos = vector3(1846.62, 2601.38, 45.61), heading = 267.04, ped = 's_m_m_chemsec_01', weapon = 'weapon_militaryrifle'},
		{pos = vector3(1849.28, 2609.79, 45.6), heading = 356.22, ped = 's_m_m_chemsec_01', weapon = 'weapon_militaryrifle'},
	}
}

Config.ForgeryPolicePeds = {
	PedConfig = {
		{pos = vector3(1171.79, -3197.02, -39.01), heading = 79.67, ped = 'a_f_y_femaleagent'}
	}
}
Config.CrazyPeds = {
	PedConfig = {
		{pos = vector3(-1167.93, 4926.17, 223.07), heading = 267.12, ped = 'cs_orleans'},
		{pos = vector3(-1149.53, 4940.43, 222.27), heading = 267.12, ped = 'a_f_m_fatcult_01'},
		{pos = vector3(-1133.1, 4952.13, 222.27), heading = 267.12, ped = 'a_m_m_acult_01'},
		{pos = vector3(-1106.81, 4935.34, 218.37), heading = 267.12, ped = 'a_f_m_fatcult_01'},
		{pos = vector3(-1113.16, 4903.33, 218.6), heading = 267.12, ped = 'a_m_m_acult_01'},
		{pos = vector3(-1148.12, 4908.3, 220.97), heading = 267.12, ped = 'a_f_m_fatcult_01'},
		{pos = vector3(-1176.64, 4913.58, 220.05), heading = 267.12, ped = 'a_m_m_acult_01'},
	}
}
Config.PedArmor = 100 -- default 100 given to every ped


Config.CrazyPedWeapon = {
	'weapon_stone_hatchet',
	'weapon_candycane',
	'weapon_bread',
	'weapon_battleaxe',
}

Config.PedWeapon = {
	'weapon_heavypistol',
	'weapon_revolver_mk2',
	'weapon_assaultsmg',
	'weapon_autoshotgun',
}

function Config.HasItem(items, amount)
    return QBCore.Functions.HasItem(items, amount)
end
