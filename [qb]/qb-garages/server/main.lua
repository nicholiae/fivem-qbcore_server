local QBCore = exports['qb-core']:GetCoreObject()
local OutsideVehicles = {}
local thisHouseName

-- Handler

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
        if Config['AutoRespawn'] then
            MySQL.update('UPDATE player_vehicles SET state = 1 WHERE state = 0', {})
        else
            MySQL.update('UPDATE player_vehicles SET depotprice = 500 WHERE state = 0', {})
        end
    end
end)

-- Functions

local vehicleClasses = {
    compacts = 0,
    sedans = 1,
    suvs = 2,
    coupes = 3,
    muscle = 4,
    sportsclassics = 5,
    sports = 6,
    super = 7,
    motorcycles = 8,
    offroad = 9,
    industrial = 10,
    utility = 11,
    vans = 12,
    cycles = 13,
    boats = 14,
    helicopters = 15,
    planes = 16,
    service = 17,
    emergency = 18,
    military = 19,
    commercial = 20,
    trains = 21,
    openwheel = 22,
    reserved = 23,
    electric = 24,
    reservedair = 25,
    trailers = 26,
}

local function arrayToSet(array)
    local set = {}
    for _, item in ipairs(array) do
        set[item] = true
    end
    return set
end

local function filterVehiclesByCategory(vehicles, category)
    local filtered = {}
    local categorySet = arrayToSet(category)

    for _, vehicle in pairs(vehicles) do
        local vehicleData = QBCore.Shared.Vehicles[vehicle.vehicle]
        local vehicleCategoryString = vehicleData and vehicleData.category or 'compacts'
        local vehicleCategoryNumber = vehicleClasses[vehicleCategoryString]

        if vehicleCategoryNumber and categorySet[vehicleCategoryNumber] then
            filtered[#filtered + 1] = vehicle
        end
    end

    return filtered
end

-- Callbacks

QBCore.Functions.CreateCallback('qb-garages:server:getHouseGarage', function(_, cb, house)
    local houseInfo = MySQL.single.await('SELECT * FROM houselocations WHERE name = ?', { house })
    cb(houseInfo)
end)

QBCore.Functions.CreateCallback('qb-garages:server:GetGarageVehicles', function(source, cb, garage, type, category)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    local citizenId = Player.PlayerData.citizenid

    local vehicles

    if type == 'depot' then
        vehicles = MySQL.rawExecute.await('SELECT * FROM player_vehicles WHERE citizenid = ? AND depotprice > 0', { citizenId })
    elseif Config.SharedGarages then
        vehicles = MySQL.rawExecute.await('SELECT * FROM player_vehicles WHERE citizenid = ?', { citizenId })
    else
        vehicles = MySQL.rawExecute.await('SELECT * FROM player_vehicles WHERE citizenid = ? AND garage = ?', { citizenId, garage })
    end
    if #vehicles == 0 then
        cb(nil)
        return
    end
    if Config.ClassSystem then
        local filteredVehicles = filterVehiclesByCategory(vehicles, category)
        cb(filteredVehicles)
    else
        cb(vehicles)
    end
end)

-- Backwards Compat
local vehicleTypes = { -- https://docs.fivem.net/natives/?_0xA273060E
    motorcycles = 'bike',
    boats = 'boat',
    helicopters = 'heli',
    planes = 'plane',
    submarines = 'submarine',
    trailer = 'trailer',
    train = 'train'
}

local function GetVehicleTypeByModel(model)
    local vehicleData = QBCore.Shared.Vehicles[model]
    if not vehicleData then return 'automobile' end
    local category = vehicleData.category
    local vehicleType = vehicleTypes[category]
    return vehicleType or 'automobile'
end
-- Backwards Compat

-- Spawns a vehicle and returns its network ID and properties.
QBCore.Functions.CreateCallback('qb-garages:server:spawnvehicle', function(source, cb, plate, vehicle, coords)
    local vehType = QBCore.Shared.Vehicles[vehicle] and QBCore.Shared.Vehicles[vehicle].type or GetVehicleTypeByModel(vehicle)
    local veh = CreateVehicleServerSetter(GetHashKey(vehicle), vehType, coords.x, coords.y, coords.z, coords.w)
    local netId = NetworkGetNetworkIdFromEntity(veh)
    SetVehicleNumberPlateText(veh, plate)
    local vehProps = {}
    local result = MySQL.rawExecute.await('SELECT mods FROM player_vehicles WHERE plate = ?', { plate })
	
    if result and result[1] then vehProps = json.decode(result[1].mods) end
	-- for k,v in pairs(result) do
		-- print('k:'..tostring(k))
		-- print('v:'..tostring(v))
	-- end
	-- for k,v in pairs(result[1]) do
		-- print('k:'..tostring(k))
		-- print('v:'..tostring(v))
	-- end
	-- for k,v in pairs(vehProps) do 
		-- print('k:'..tostring(k))
		-- print('v:'..tostring(v))
	-- end
	-- if not vehProps then
		-- return false
	-- end
	-- print(result[1].mods)
	
    OutsideVehicles[plate] = { netID = netId, entity = veh }
	-- print(OutsideVehicles[plate])
	-- print(plate)
    cb(netId, vehProps, plate)
end)

-- Checks if a vehicle can be spawned based on its type and location.
QBCore.Functions.CreateCallback('qb-garages:server:IsSpawnOk', function(_, cb, plate, type)
	-- print(plate)
	-- print(type)
	-- print(OutsideVehicles[plate])
	
    if OutsideVehicles[plate] and DoesEntityExist(OutsideVehicles[plate].entity) then
        cb(false)
        return
    end
    cb(true)
end)

-- QBCore.Functions.CreateCallback('qb-garages:server:canDeposit', function(source, cb, plate, type, garage, state)
    -- local Player = QBCore.Functions.GetPlayer(source)
    -- local isOwned = MySQL.scalar.await('SELECT citizenid FROM player_vehicles WHERE plate = ? LIMIT 1', { plate })
	
	-- print(tostring(state))
	-- print(tostring(isOwned))
	-- print(tostring(Player.PlayerData.citizenid))
	-- if garage then
		-- if Config.Garages[garage].houseName then
			-- print(tostring(Config.Garages[garage].houseName))
			-- print(tostring(garage))
		-- end
		-- local garageLoc = MySQL.scalar.await('SELECT house FROM player_houses WHERE identifier = ?', { Player.PlayerData.license })
		-- print(tostring(MySQL.scalar.await('SELECT name FROM houselocations WHERE name = ?', { tostring(garageLoc) })))
		-- local thisHouseName = MySQL.scalar.await('SELECT name FROM houselocations WHERE name = ?', { tostring(garageLoc) })
		-- print(tostring(exports['qb-houses']:hasKey(Player.PlayerData.license, Player.PlayerData.citizenid, tostring(thisHouseName))))
		-- if isOwned ~= Player.PlayerData.citizenid then
			-- print("The vehicle is not owned:"..tostring(isOwned))
			-- TriggerClientEvent('QBCore:Notify', source, "The vehicle is owned by you:"..tostring(isOwned), 'error')
			-- cb(false)
			-- return
		-- end
		-- if Config.Garages[garage].houseName ~= nil then
			-- local garageLoc = MySQL.scalar.await('SELECT house FROM player_houses WHERE identifier = ?', { Player.PlayerData.license })
			-- local thisHouseName = MySQL.scalar.await('SELECT name FROM houselocations WHERE name = ?', { tostring(garageLoc) })
			-- if type == 'house' and exports['qb-houses']:hasKey(Player.PlayerData.license, Player.PlayerData.citizenid, tostring(thisHouseName)) then
				-- print("The House is not owned:"..tostring(exports['qb-houses']:hasKey(Player.PlayerData.license, Player.PlayerData.citizenid, tostring(thisHouseName))))
				-- TriggerClientEvent('QBCore:Notify', source, "The House is owned by you:"..tostring(exports['qb-houses']:hasKey(Player.PlayerData.license, Player.PlayerData.citizenid, tostring(thisHouseName))), 'error')
				-- if state == 0 then
					-- print("Owned and depositable")
					-- MySQL.update('UPDATE player_vehicles SET state = ?, garage = ? WHERE plate = ?', { 1, garage, plate })
					-- cb(true)
					-- return
				-- end
			-- end
		-- else
			-- if type == 'house' and not exports['qb-houses']:hasKey(Player.PlayerData.license, Player.PlayerData.citizenid, Config.Garages[garage].houseName) then
				-- print("The House is not owned:"..tostring(exports['qb-houses']:hasKey(Player.PlayerData.license, Player.PlayerData.citizenid, Config.Garages[garage].houseName)))
				-- TriggerClientEvent('QBCore:Notify', source, "The House is owned by you:"..tostring(exports['qb-houses']:hasKey(Player.PlayerData.license, Player.PlayerData.citizenid, Config.Garages[garage].houseName)), 'error')
				-- cb(false)
				-- return
			-- end
		-- end
		-- if state == 0 then
			-- print("Owned and depositable")
			-- MySQL.update('UPDATE player_vehicles SET state = ?, garage = ? WHERE plate = ?', { 1, garage, plate })
			-- cb(true)
		-- else
			-- cb(false)
		-- end
	-- else
		-- TriggerClientEvent('QBCore:Notify', source, "An error occurred getting the garage. Report this if it continues.", 'error')
		-- cb(false)
		-- return
	-- end
-- end)
QBCore.Functions.CreateCallback('qb-garages:server:canDeposit', function(source, cb, plate, type, garage, state)
    local src = source 
    local Player = QBCore.Functions.GetPlayer(source)
    local isOwned = MySQL.scalar.await('SELECT citizenid FROM player_vehicles WHERE plate = ? LIMIT 1', { plate })
	-- print(garage)
	-- print(Player.PlayerData.license)
	-- print(Player.PlayerData.citizenid)
	-- print(Config.Garages[garage])
	-- if Config.Garages[garage] ~= nil then
		-- for k,v in pairs(Config.Garages[garage]) do
			-- print('k:'..tostring(k))
			-- print('v:'..tostring(v))
		-- end
	-- end
	-- print(state)
	-- print(plate)
	-- print(isOwned)
	-- print(type)
	-- print(Player.PlayerData.citizenid)
	if type == 'house' then
		thisHouseName =  MySQL.rawExecute.await('SELECT `name` FROM `houselocations` WHERE `label` = ?', { Config.Garages[garage].label })
		-- print(thisHouseName[1].name)
		-- for k,v in pairs(houseName) do
			-- for ke,ve in pairs(v) do
				-- print('k:'..tostring(ke))
				-- print('v:'..tostring(ve))
			-- end
		-- end
	end
	if isOwned ~= Player.PlayerData.citizenid then
        TriggerClientEvent('QBCore:Notify', src, 'You dont own this vehicle', 'warning')
        cb(false)
        return
    end
    -- if type == 'house' and not exports['qb-houses']:hasKey(Player.PlayerData.license, Player.PlayerData.citizenid, Config.Garages[garage].houseName) then
    if type == 'house' and not exports['qb-houses']:hasKey(Player.PlayerData.license, Player.PlayerData.citizenid, thisHouseName[1].name) then
        TriggerClientEvent('QBCore:Notify', src, 'You dont have keys to this house', 'warning')
        cb(false)
        return
    end
    if state == 1 then
        MySQL.update('UPDATE player_vehicles SET state = ?, garage = ? WHERE plate = ?', { state, garage, plate })
        cb(true)
    else
        TriggerClientEvent('QBCore:Notify', src, 'Ran into a problem', 'error')
        cb(false)
    end
end)
-- Events

RegisterNetEvent('qb-garages:server:updateVehicleStats', function(plate, fuel, engine, body)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    MySQL.update('UPDATE player_vehicles SET fuel = ?, engine = ?, body = ? WHERE plate = ? AND citizenid = ?', { fuel, engine, body, plate, Player.PlayerData.citizenid })
end)

RegisterNetEvent('qb-garages:server:updateVehicleState', function(state, plate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    MySQL.update('UPDATE player_vehicles SET state = ?, depotprice = ? WHERE plate = ? AND citizenid = ?', { state, 0, plate, Player.PlayerData.citizenid })
end)

RegisterNetEvent('qb-garages:server:UpdateOutsideVehicle', function(plate, vehicleNetID)
    OutsideVehicles[plate] = {
        netID = vehicleNetID,
        entity = NetworkGetEntityFromNetworkId(vehicleNetID)
    }
end)

RegisterNetEvent('qb-garages:server:trackVehicle', function(plate)
    local src = source
    local vehicleData = OutsideVehicles[plate]
    if vehicleData and DoesEntityExist(vehicleData.entity) then
        TriggerClientEvent('qb-garages:client:trackVehicle', src, GetEntityCoords(vehicleData.entity))
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.vehicle_tracked'), 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.vehicle_not_tracked'), 'error')
    end
end)

RegisterNetEvent('qb-garages:server:PayDepotPrice', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cashBalance = Player.PlayerData.money['cash']
    local bankBalance = Player.PlayerData.money['bank']
    MySQL.scalar('SELECT depotprice FROM player_vehicles WHERE plate = ?', { data.plate }, function(result)
        if result then
            local depotPrice = result

            if cashBalance >= depotPrice then
                Player.Functions.RemoveMoney('cash', depotPrice, 'paid-depot')
                TriggerClientEvent('qb-garages:client:takeOutGarage', src, data)
            elseif bankBalance >= depotPrice then
                Player.Functions.RemoveMoney('bank', depotPrice, 'paid-depot')
                TriggerClientEvent('qb-garages:client:takeOutGarage', src, data)
            else
                TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_enough'), 'error')
            end
        end
    end)
end)

-- House Garages

RegisterNetEvent('qb-garages:server:syncGarage', function(updatedGarages)
    Config.Garages = updatedGarages
end)

--Call from qb-phone

QBCore.Functions.CreateCallback('qb-garages:server:GetPlayerVehicles', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Vehicles = {}

    MySQL.rawExecute('SELECT * FROM player_vehicles WHERE citizenid = ?', { Player.PlayerData.citizenid }, function(result)
        if result[1] then
            for _, v in pairs(result) do
                local VehicleData = QBCore.Shared.Vehicles[v.vehicle]

                local VehicleGarage = Lang:t('error.no_garage')
                if v.garage ~= nil then
                    if Config.Garages[v.garage] ~= nil then
                        VehicleGarage = Config.Garages[v.garage].label
                    else
                        VehicleGarage = Lang:t('info.house_garage')
                    end
                end

                local stateTranslation
                if v.state == 0 then
                    stateTranslation = Lang:t('status.out')
                elseif v.state == 1 then
                    stateTranslation = Lang:t('status.garaged')
                elseif v.state == 2 then
                    stateTranslation = Lang:t('status.impound')
                end

                local fullname
                if VehicleData and VehicleData['brand'] then
                    fullname = VehicleData['brand'] .. ' ' .. VehicleData['name']
                else
                    fullname = VehicleData and VehicleData['name'] or 'Unknown Vehicle'
                end

                Vehicles[#Vehicles + 1] = {
                    fullname = fullname,
                    brand = VehicleData and VehicleData['brand'] or '',
                    model = VehicleData and VehicleData['name'] or '',
                    plate = v.plate,
                    garage = VehicleGarage,
                    state = stateTranslation,
                    fuel = v.fuel,
                    engine = v.engine,
                    body = v.body
                }
            end
            cb(Vehicles)
        else
            cb(nil)
        end
    end)
end)

local function getAllGarages()
    local garages = {}
    for k, v in pairs(Config.Garages) do
        garages[#garages + 1] = {
            name = k,
            label = v.label,
            type = v.type,
            takeVehicle = v.takeVehicle,
            putVehicle = v.putVehicle,
            spawnPoint = v.spawnPoint,
            showBlip = v.showBlip,
            blipName = v.blipName,
            blipNumber = v.blipNumber,
            blipColor = v.blipColor,
            vehicle = v.vehicle
        }
    end
    return garages
end

exports('getAllGarages', getAllGarages)
