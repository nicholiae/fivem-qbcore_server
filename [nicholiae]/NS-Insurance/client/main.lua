local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local PlayerGang = {}
local PlayerJob = {}
local garageZones = {}
local listenForKey = false

SetNuiFocus(false, false)


-- Functions

local function round(num, numDecimalPlaces)
    return tonumber(string.format('%.' .. (numDecimalPlaces or 0) .. 'f', num))
end

local function CheckPlayers(vehicle)
    for i = -1, 5, 1 do
        local seat = GetPedInVehicleSeat(vehicle, i)
        if seat then
            TaskLeaveVehicle(seat, vehicle, 0)
        end
    end
	-- print("Should have deleted")
	-- print(vehicle)
    QBCore.Functions.DeleteVehicle(vehicle)
end

local function OpenGarageMenu(data)
    QBCore.Functions.TriggerCallback('NS-Insurance:server:GetGarageVehicles', function(result)
        if result == nil then return QBCore.Functions.Notify(Lang:t('error.no_vehicles'), 'error', 5000) end
        local formattedVehicles = {}
        for _, v in pairs(result) do
            local enginePercent = round(v.engine, 0)
            local bodyPercent = round(v.body, 0)
            local vname = nil
            pcall(function()
                vname = QBCore.Shared.Vehicles[v.vehicle].name
            end)
            formattedVehicles[#formattedVehicles + 1] = {
                vehicle = v.vehicle,
                vehicleLabel = vname or v.vehicle,
                plate = v.plate,
                state = v.state,
                fuel = v.fuel,
                engine = enginePercent,
                body = bodyPercent,
                distance = v.drivingdistance or 0,
                garage = Config.Garages[data.indexgarage],
                type = data.type,
                index = data.indexgarage,
                depotPrice = v.depotprice or 0,
                balance = v.balance or 0
            }
        end
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'VehicleList',
            garageLabel = 'Insurance Claims',
            vehicles = formattedVehicles,
        })
    end, data.indexgarage, data.type, data.category)
end

local function DepositVehicle(veh, data)
    local plate = data.plate
    QBCore.Functions.TriggerCallback('NS-Insurance:server:canDeposit', function(canDeposit)
        if canDeposit then
			local bodyDamageCharge = math.ceil(data.stats.body)
            local engineDamageCharge = math.ceil(data.stats.engine)
            local totalFuelCharge = exports[Config.FuelResource]:GetFuel(veh)
			
            local bodyDamage = 1000
            local engineDamage = 1000
            local totalFuel = 100
			local vehicleValue = QBCore.Shared.Vehicles[data.vehicle]['price']
			
			if Config.Debug then	
				print("Vehicle Value")
				print(vehicleValue)
			end
			
			local bodyChargePercentage = math.ceil((bodyDamage - bodyDamageCharge)*0.1)
			local engineChargePercentage = math.ceil((engineDamage - engineDamageCharge)*0.1)
			local fuelChargePercentage = totalFuel - totalFuelCharge
			local chargeForBody = math.ceil(((vehicleValue/2)*(bodyChargePercentage/100))*(Config.RepairWeight/100))
			local chargeForEngine = math.ceil(((vehicleValue/2)*(engineChargePercentage/100))*(Config.RepairWeight/100))
			local chargeForFuel = math.ceil(fuelChargePercentage*Config.FuelCharge/100)
			if Config.Debug then	
				print(bodyChargePercentage)
				print(engineChargePercentage)
				print(fuelChargePercentage)
				print(chargeForBody)
				print(chargeForEngine)
				print(chargeForFuel)
			end
			local totalCharges = chargeForFuel + chargeForEngine + chargeForBody
			QBCore.Functions.TriggerCallback('NS-Insurance:server:canPay', function(canPay)
				if canPay then
					TriggerServerEvent('NS-Insurance:server:PayClaim', totalCharges)
					TriggerServerEvent('NS-Insurance:server:updateVehicleStats', plate, totalFuel, engineDamage, bodyDamage)
					TriggerServerEvent('qb-mechanicjob:server:SaveVehicleProps', QBCore.Functions.GetVehicleProperties(veh))
					CheckPlayers(veh)
					if plate then TriggerServerEvent('NS-Insurance:server:UpdateOutsideVehicle', plate, nil) end
					if plate then TriggerServerEvent('NS-Insurance:server:updateVehicleState', 1, plate) end
					print('DoesEntityExist:'..tostring(DoesEntityExist(veh)))
					if DoesEntityExist(veh) == 1 then 
						DeleteEntity(veh)
					end
					QBCore.Functions.Notify("Successfully filed an Insurance Claim", 'primary', 2500)
					QBCore.Functions.Notify("You may pick up your vehicle in the Garage", 'primary', 4500)
				else
					-- TriggerServerEvent('qb-mechanicjob:server:SaveVehicleProps', QBCore.Functions.GetVehicleProperties(veh))
					-- TriggerServerEvent('NS-Insurance:server:updateVehicleStats', plate, totalFuelCharge, engineDamageCharge, bodyDamageCharge)
					-- CheckPlayers(veh)
					-- if plate then TriggerServerEvent('NS-Insurance:server:UpdateOutsideVehicle', plate, nil) end
					-- if plate then TriggerServerEvent('NS-Insurance:server:updateVehicleState', 1, plate) end
					QBCore.Functions.Notify("Failed to file an Insurance Claim", 'error', 2500)
					QBCore.Functions.Notify("You were unable to Pay your claim", 'error', 4500)
				end
			end, totalCharges)
        else
            QBCore.Functions.Notify(Lang:t('error.not_owned'), 'error', 3500)
        end
    end, plate, data.type, data.indexgarage, 1)
end

local function IsVehicleAllowed(classList, vehicle)
    if not Config.ClassSystem then return true end
    for _, class in ipairs(classList) do
        if GetVehicleClass(vehicle) == class then
            return true
        end
    end
    return false
end

local function CreateBlips(setloc)
    local Garage = AddBlipForCoord(setloc.takeVehicle.x, setloc.takeVehicle.y, setloc.takeVehicle.z)
    SetBlipSprite(Garage, setloc.blipNumber)
    SetBlipDisplay(Garage, 4)
    SetBlipScale(Garage, 0.60)
    SetBlipAsShortRange(Garage, true)
    SetBlipColour(Garage, setloc.blipColor)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(setloc.blipName)
    EndTextCommandSetBlipName(Garage)
end

local function CreateZone(index, garage, zoneType)
    local zone = CircleZone:Create(garage.takeVehicle, 3.0, {
        name = zoneType .. '_' .. index,
        debugPoly = false,
        useZ = true,
        data = {
            indexgarage = index,
            type = garage.type,
            category = garage.category
        }
    })

    return zone
end

local function CreateBlipsZones()
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerGang = PlayerData.gang
    PlayerJob = PlayerData.job

    for index, garage in pairs(Config.Garages) do
        local zone
        if garage.showBlip then
            CreateBlips(garage)
        end
        if garage.type == 'job' and (PlayerJob.name == garage.job or PlayerJob.type == garage.jobType) then
            zone = CreateZone(index, garage, 'job')
        elseif garage.type == 'gang' and PlayerGang.name == garage.job then
            zone = CreateZone(index, garage, 'gang')
        elseif garage.type == 'depot' then
            zone = CreateZone(index, garage, 'depot')
        elseif garage.type == 'public' then
            zone = CreateZone(index, garage, 'public')
        end

        if zone then
            garageZones[#garageZones + 1] = zone
        end
    end

    local comboZone = ComboZone:Create(garageZones, { name = 'garageCombo', debugPoly = false })

    comboZone:onPlayerInOut(function(isPointInside, _, zone)
        if isPointInside then
            listenForKey = true
            CreateThread(function()
                while listenForKey do
                    Wait(0)
                    if IsControlJustReleased(0, 38) then
						OpenGarageMenu(zone.data)
                    end
                end
            end)

            local displayText = Lang:t('info.car_e')
            if zone.data.vehicle == 'sea' then
                displayText = Lang:t('info.sea_e')
            elseif zone.data.vehicle == 'air' then
                displayText = Lang:t('info.air_e')
            elseif zone.data.vehicle == 'rig' then
                displayText = Lang:t('info.rig_e')
            elseif zone.data.type == 'depot' then
                displayText = Lang:t('info.depot_e')
            end
            exports['qb-core']:DrawText(displayText, 'left')
        else
            listenForKey = false
            exports['qb-core']:HideText()
        end
    end)
end

function GetSpawnPoint(garage)
    local location = nil
    if #garage.spawnPoint > 1 then
        local maxTries = #garage.spawnPoint
        for i = 1, maxTries do
            local randomIndex = math.random(1, #garage.spawnPoint)
            local chosenSpawnPoint = garage.spawnPoint[randomIndex]
            local isOccupied = IsPositionOccupied(
                chosenSpawnPoint.x,
                chosenSpawnPoint.y,
                chosenSpawnPoint.z,
                5.0,   -- range
                false,
                true,  -- checkVehicles
                false, -- checkPeds
                false,
                false,
                0,
                false
            )
            if not isOccupied then
                location = chosenSpawnPoint
                break
            end
        end
    elseif #garage.spawnPoint == 1 then
        location = garage.spawnPoint[1]
    end
    if not location then
        QBCore.Functions.Notify(Lang:t('error.vehicle_occupied'), 'error')
    end
    return location
end

-- NUI Callbacks

RegisterNUICallback('closeGarage', function(_, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback('takeOutVehicle', function(data, cb)
    TriggerEvent('NS-Insurance:client:takeOutGarage', data)
    cb('ok')
end)

RegisterNUICallback('trackVehicle', function(plate, cb)
    TriggerServerEvent('NS-Insurance:server:trackVehicle', plate)
    cb('ok')
end)

RegisterNUICallback('takeOutDepo', function(data, cb)
    local depotPrice = data.depotPrice
    if depotPrice ~= 0 then
        TriggerServerEvent('NS-Insurance:server:PayDepotPrice', data)
    else
        TriggerEvent('NS-Insurance:client:takeOutGarage', data)
    end
    cb('ok')
end)

local function CheckPlate(vehicle, plateToSet)
    local vehiclePlate = promise.new()
    CreateThread(function()
        while true do
            Wait(500)
            if GetVehicleNumberPlateText(vehicle) == plateToSet then
                vehiclePlate:resolve(true)
                return
            else
                SetVehicleNumberPlateText(vehicle, plateToSet)
            end
        end
    end)
    return vehiclePlate
end



RegisterNetEvent('NS-Insurance:client:takeOutGarage', function(data)
    
	local location = GetSpawnPoint(data.garage)
			
	if Config.Debug then
		print("Take Out Garage")

		for k,v in pairs(data) do
			print("k:"..tostring(k))
			print("v:"..tostring(v))
		end
	end
	if not location then return end
	QBCore.Functions.TriggerCallback('NS-Insurance:server:spawnvehicle', function(netId, properties, vehPlate)
		while not NetworkDoesNetworkIdExist(netId) do Wait(10) end
		local veh = NetworkGetEntityFromNetworkId(netId)
		Citizen.Await(CheckPlate(veh, vehPlate))
		QBCore.Functions.SetVehicleProperties(veh, properties)
		exports[Config.FuelResource]:SetFuel(veh, data.stats.fuel)
		if Config.Debug then
			print("Above Set Owner")
		end
		TriggerServerEvent('NS-Insurance:server:updateVehicleState', 0, vehPlate)
		TriggerEvent('vehiclekeys:client:SetOwner', vehPlate)
		if Config.Debug then
			print("Should Deposit")
			print(veh)
			for k,v in pairs(data) do
				print("k:"..tostring(k))
				print("v:"..tostring(v))
			end
			print("STATS")
			for k,v in pairs(data.stats) do
				print("k:"..tostring(k))
				print("v:"..tostring(v))
			end
		end
		SetNuiFocus(false, false)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
		Wait(2000)
        local currentVehicle = GetVehiclePedIsUsing(PlayerPedId())
		DepositVehicle(currentVehicle, data)
	end, data.plate, data.vehicle, location, true)

end)

-- Events

local function CheckPlate(vehicle, plateToSet)
    local vehiclePlate = promise.new()
    CreateThread(function()
        while true do
            Wait(500)
            if GetVehicleNumberPlateText(vehicle) == plateToSet then
                vehiclePlate:resolve(true)
                return
            else
                SetVehicleNumberPlateText(vehicle, plateToSet)
            end
        end
    end)
    return vehiclePlate
end

-- Handlers

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    CreateBlipsZones()
end)

AddEventHandler('onResourceStart', function(res)
    if res ~= GetCurrentResourceName() then return end
    CreateBlipsZones()
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function(gang)
    PlayerGang = gang
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerJob = job
end)

