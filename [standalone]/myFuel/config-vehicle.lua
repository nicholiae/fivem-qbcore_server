Vehicle = {}
Vehicle.DefaultFuelCapacityLiters = 100
Vehicle.DefaultFuelUsage = 1.0
Vehicle.DefaultFuelType = "gasoline"

-- Class multipliers. If you want SUVs to use less fuel, you can change it to anything under 1.0, and vise versa.
Vehicle.Classes = {
	[0] = {FuelCapacityLiters = 75, FuelUsage = 0.4, FuelType = "gasoline"}, -- Compacts
    [1] = {FuelCapacityLiters = 90, FuelUsage = 0.35, FuelType = "gasoline"}, -- Sedans
    [2] = {FuelCapacityLiters = 120, FuelUsage = 0.55, FuelType = "gasoline"}, -- SUVs
    [3] = {FuelCapacityLiters = 90, FuelUsage = 0.45, FuelType = "gasoline"}, -- Coupes
    [4] = {FuelCapacityLiters = 90, FuelUsage = 0.55, FuelType = "gasoline"}, -- Muscle
    [5] = {FuelCapacityLiters = 120, FuelUsage = 0.35, FuelType = "gasoline"}, -- Sports Classics
    [6] = {FuelCapacityLiters = 150, FuelUsage = 0.35, FuelType = "gasoline"}, -- Sports
    [7] = {FuelCapacityLiters = 150, FuelUsage = 0.35, FuelType = "gasoline"}, -- Super Sports
    [8] = {FuelCapacityLiters = 45, FuelUsage = 0.3, FuelType = "gasoline"}, -- Motorcycles
    [9] = {FuelCapacityLiters = 150, FuelUsage = 0.4, FuelType = "gasoline"}, -- Off-road
    [10] = {FuelCapacityLiters = 450, FuelUsage = 0.6, FuelType = "diesel"}, -- Industrial
    [11] = {FuelCapacityLiters = 120, FuelUsage = 0.55, FuelType = "diesel"}, -- Utility
    [12] = {FuelCapacityLiters = 90, FuelUsage = 0.55, FuelType = "gasoline"}, -- Vans
    [13] = {FuelCapacityLiters = 0, FuelUsage = 0.0, FuelType = nil}, -- Cycles
    [14] = {FuelCapacityLiters = 75, FuelUsage = 0.45, FuelType = "diesel"}, -- Boats
    [15] = {FuelCapacityLiters = 1350, FuelUsage = 0.45, FuelType = "paraffin"}, -- Helicopters
    [16] = {FuelCapacityLiters = 1350, FuelUsage = 0.45, FuelType = "paraffin"}, -- Planes
    [17] = {FuelCapacityLiters = 450, FuelUsage = 0.15, FuelType = "diesel"}, -- Service
    [18] = {FuelCapacityLiters = 450, FuelUsage = 0.15, FuelType = "diesel"}, -- Emergency
    [19] = {FuelCapacityLiters = 900, FuelUsage = 0.35, FuelType = "diesel"}, -- Military
    [20] = {FuelCapacityLiters = 1800, FuelUsage = 0.65, FuelType = "diesel"}, -- Commercial
    [21] = {FuelCapacityLiters = 1500, FuelUsage = 0.5, FuelType = "diesel"}, -- Trains
    [22] = {FuelCapacityLiters = 150, FuelUsage = 0.45, FuelType = "diesel"}, -- Open Wheel
    [23] = {FuelCapacityLiters = 0, FuelUsage = 0.0, FuelType = nil}, -- Reserved
    [24] = {FuelCapacityLiters = 0, FuelUsage = 0.0, FuelType = nil}, -- Electric
    [25] = {FuelCapacityLiters = 150, FuelUsage = 0.35, FuelType = "paraffin"}, -- ReservedAir
    [26] = {FuelCapacityLiters = 150, FuelUsage = 0.1, FuelType = "diesel"}, -- Trailers
}

--Model multipliers. only fill the models if you want sth different from classes
Vehicle.Models = {
	["adder"] = {FuelCapacityLiters = 80, FuelUsage = 1.0, FuelType = "gasoline"}
	
	,["airtug"] = {FuelCapacityLiters = 100, FuelUsage = 1.0, FuelType = "electricity"}	
	,["caddy"] = {FuelCapacityLiters = 100, FuelUsage = 1.0, FuelType = "electricity"}
	,["caddy2"] = {FuelCapacityLiters = 100, FuelUsage = 1.0, FuelType = "electricity"}
	,["caddy3"] = {FuelCapacityLiters = 100, FuelUsage = 1.0, FuelType = "electricity"}
	,["cyclone"] = {FuelCapacityLiters = 100, FuelUsage = 1.0, FuelType = "electricity"}
	,["dilettante"] = {FuelCapacityLiters = 100, FuelUsage = 1.0, FuelType = "electricity"}
	,["dilettante2"] = {FuelCapacityLiters = 100, FuelUsage = 1.0, FuelType = "electricity"}
	,["imorgon"] = {FuelCapacityLiters = 100, FuelUsage = 1.0, FuelType = "electricity"}
	,["khamelion"] = {FuelCapacityLiters = 100, FuelUsage = 1.0, FuelType = "electricity"}
	,["neon"] = {FuelCapacityLiters = 100, FuelUsage = 1.0, FuelType = "electricity"}
	,["raiden"] = {FuelCapacityLiters = 100, FuelUsage = 1.0, FuelType = "electricity"}
	,["rcbandito"] = {FuelCapacityLiters = 100, FuelUsage = 1.0, FuelType = "electricity"}
	,["surge"] = {FuelCapacityLiters = 100, FuelUsage = 1.0, FuelType = "electricity"}
	,["tezeract"] = {FuelCapacityLiters = 100, FuelUsage = 1.0, FuelType = "electricity"}
	,["voltic"] = {FuelCapacityLiters = 100, FuelUsage = 1.0, FuelType = "electricity"}
}

Vehicle.ModelsSociety = {
    ["ambulance"] = "society_ambulance"
    ,["fbi"] = "society_police"
    ,["fbi2"] = "society_police"
    ,["pbus"] = "society_police"
    ,["police"] = "society_police"
    ,["police2"] = "society_police"
    ,["police3"] = "society_police"
    ,["police4"] = "society_police"
    ,["policeb"] = "society_police"
    ,["polmav"] = "society_police"
    ,["policeold1"] = "society_police"
    ,["policeold2"] = "society_police"
    ,["policet"] = "society_police"
    ,["pranger"] = "society_police"
    ,["riot"] = "society_police"
    ,["riot2"] = "society_police"
    ,["sheriff"] = "society_police"
    ,["sheriff2"] = "society_police"
}


for k,v in pairs(Vehicle.Models) do 
    Vehicle.Models[GetHashKey(k)] = v
end   
for k,v in pairs(Vehicle.ModelsSociety) do 
    Vehicle.ModelsSociety[GetHashKey(k)] = v
end    

