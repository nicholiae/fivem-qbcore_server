Config = {
	-- **** IMPORTANT ****
	-- UseTarget should only be set to true when using qb-target
	UseTarget               = GetConvar('UseTarget', 'false') == 'true',

	DutyLocation            = vector4(1230.71, -2911.23, 9.32, 269.34),
	DropLocation            = vector4(765.92, -3195.31, 5.96, 80.4),

	DrawPackageLocationBlip = true,

	PickupActionDuration    = math.random(4000, 6000),
	DeliveryActionDuration  = 5000,

	MaxItemsReceived        = 3,
	MinItemReceivedQty      = 20,
	MaxItemReceivedQty      = 60,
	Vehicle              	= 'forklift',
	VehicleSpawn            = vector3(1217.04, -2920.94, 5.87),
	VehicleSpawnHeading     = 153.31,
	ChanceItem              = 'cryptostick',
	LuckyItem               = 'electronickit',
	
	-- Specialty Package Settings
	SpecialtyPackageCost    = 500,
	SpecialtyChanceBonus    = 20,  -- Adds 20% to bonus item chances
	SpecialtyLuckyBonus     = 20,  -- Adds 20% to lucky item chances

	PickupLocations         = {
		[1]  = vector4(1169.81, -2973.51, 5.9, 90.06),
		[2]  = vector4(1064.48, -2976.9, 5.9, 88.05),
		[3]  = vector4(938.15, -2915.52, 5.9, 83.24),
		[4]  = vector4(892.9, -2966.91, 5.9, 283.01),
		[5]  = vector4(892.85, -3019.64, 5.9, 178.99),
		[6]  = vector4(892.47, -3072.74, 5.9, 268.76),
		[7]  = vector4(988.92, -3072.26, 5.9, 269.86),

		[8]  = vector4(1090.1, -3070.01, 5.9, 269.86),
		[9]  = vector4(1199.5, -3063.75, 6.0, 321.67),
		[10] = vector4(1183.36, -3015.89, 5.9, 87.73),
		[11] = vector4(1085.93, -3179.21, 5.9, 179.31),
		[12] = vector4(1178.13, -3173.96, 5.6, 262.54),
		[13] = vector4(1178.37, -3162.37, 5.59, 86.07),
		[14] = vector4(1136.81, -3105.84, 5.9, 90.43),

		[15] = vector4(875.55, -3104.37, 5.9, 33.05),
		[16] = vector4(870.3, -2905.63, 5.9, 3.29),
		[17] = vector4(1049.83, -2909.09, 5.9, 268.09),
		[18] = vector4(1197.29, -3104.12, 6.03, 177.88),
		[19] = vector4(1176.88, -3109.15, 6.03, 192.22),
		[20] = vector4(1175.43, -3199.76, 6.03, 245.06),
		[21] = vector4(1226.06, -3232.26, 6.03, 220.18),
	},
	PickupBoxModel          = 'prop_weed_pallet',
	ItemTable               = {
		[1] = 'metalscrap',
		[2] = 'plastic',
		[3] = 'copper',
		[4] = 'iron',
		[5] = 'aluminum',
		[6] = 'steel',
		[7] = 'glass',
		[8] = 'rubber',
	}
}