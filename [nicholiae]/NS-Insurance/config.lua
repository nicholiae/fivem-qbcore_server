Config = {}
Config.AutoRespawn = true          -- true == stores cars in garage on restart | false == doesnt modify car states
Config.VisuallyDamageCars = true   -- true == damage car on spawn | false == no damage on spawn
Config.SharedGarages = true       -- true == take any car from any garage | false == only take car from garage stored in
Config.ClassSystem = true         -- true == restrict vehicles by class | false == any vehicle class in any garage
Config.FuelResource = 'myFuel' -- supports any that has a GetFuel() and SetFuel() export
Config.Warp = false                 -- true == warp player into vehicle | false == vehicle spawns without warping
Config.MarkerDist = 100
Config.RepairWeight = 7 -- percent of value charged for repairs
Config.FuelCharge = 3000 -- if fuel is at 0% capacity this amount to fill it
Config.Debug = false
-- https://docs.fivem.net/natives/?_0x29439776AAA00A62
Config.VehicleClass = {
    all = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26 },
    car = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 13, 18, 22, 23, 24, 26 },
    air = { 15, 16, 25 },
    sea = { 14 },
    rig = { 10, 11, 17, 19, 20, 26 },
    trailers = { 26 }
}
Config.Garages = {
    
   insuranceclaimair = {
        label = 'Insurance Claims',
        takeVehicle = vector3(-537.5, -179.1, 42.9),
        spawnPoint = {
            vector4(-540.39, -252.45, 36.66, 205.41)
        },
        showBlip = false,
        blipName = 'Airial Insurance',
        blipNumber = 372,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['air']
    },
   insuranceclaimsea = {
        label = 'Insurance Claims',
        takeVehicle = vector3(-531.44, -189.67, 42.9),
        spawnPoint = {
            vector4(-540.39, -252.45, 36.66, 205.41)
        },
        showBlip = false,
        blipName = 'Nautical Insurance',
        blipNumber = 371,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['sea']
    },
   insuranceclaimtrailer = {
        label = 'Insurance Claims',
        takeVehicle = vector3(-536.01, -192.35, 42.9),
        spawnPoint = {
            vector4(-540.39, -252.45, 36.66, 205.41)
        },
        showBlip = false,
        blipName = 'Trailer Insurance',
        blipNumber = 369,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['trailers']
    },
}
