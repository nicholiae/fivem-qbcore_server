QBCore = nil
ESX = nil 

isUsingQBTarget = false
isUsingOXTarget = false

while ESX == nil and QBCore == nil do
	if GetResourceState('es_extended') == 'started' then
		ESX = exports["es_extended"]:getSharedObject()
	elseif GetResourceState('qb-core') == 'started' then 
		QBCore = exports["qb-core"]:GetCoreObject()	
	end
end 

CreateThread(function()
	if Config.useQB_Target then 
		if GetResourceState('qb-target') == 'started' then 
			isUsingQBTarget = true
		else
			print("Config.useQB_Target is set to true but qb-target is not started ! please check!")
		end 
	elseif Config.useOX_Target then 
		if GetResourceState('ox_target') == 'started' then 
			isUsingOXTarget = true
		else
			print("Config.useOX_Target is set to true but ox_target is not started ! please check!")
		end 	
	end
end)

DefinedGasStations = {}

local BlipData = {}

local PetrolCan = GetHashKey("WEAPON_PETROLCAN")

local CharIsBusy = false
local UIIsOpen = false

local CurrentVehicleData = nil
local PlayerInVehicle = false
local PlayerIsDriver = false
local currentVehicle = nil 
local currentMessage = nil
local PlayerNearFuelPump = false
local PlayerIsFillingVehicle = false
local GasStationPrices = {}

local isInAdminSpot = false
local AdminSpotGasStationID = nil
local currentMessageAdmin = ""
local pumpLocation = nil
local globalRopeObject = nil
local globalNozzleObject = nil
local holdingNozzle = false
local createdExtraPumps = {}

local GetGasStationInProgress = false
local pumpClass = nil

CreateThread(function()
	while #DefinedGasStations == 0 do
		Wait(500)

		if ESX ~= nil then 
			ESX.TriggerServerCallback('myFuel:GetGasStationsCallback', function(returndata)
				DefinedGasStations = returndata
			end)
		elseif QBCore ~= nil then 
			QBCore.Functions.TriggerCallback('myFuel:GetGasStationsCallback', function(returndata)
				DefinedGasStations = returndata
			end)
		end 
	end
end)

CreateThread(function()
	AddTargets()
end)


CreateThread(function()	
	for key, values in pairs(Config.CustomPumpLocations) do
		if values.location ~= nil then 
			RequestModel(values.model)
			while not HasModelLoaded(values.model) do
				Wait(0)
			end
			local pump = CreateObject(values.model,values.location[1],values.location[2], values.location[3] - 1.0 , false, true, true)
			SetEntityHeading(pump, values.location[4])
			FreezeEntityPosition(pump, true)
			table.insert(createdExtraPumps, pump)
		end 
	end
end)


CreateThread(function()
	if currentVehicle == nil then 
		local tmp = GetPlayersLastVehicle()
		if tmp ~= nil and tmp ~= 0 then 
			currentVehicle = GetPlayersLastVehicle()
			CurrentVehicleData = getVehicleData(currentVehicle)
		end 
		
	end 
end)


CreateThread(function()
	while true do
		Wait(500)
		if isInVehicle(PlayerPedId()) then -- beim einsteigen
			if PlayerInVehicle == false then 
				PlayerInVehicle = true
			end 

			local tempCurVeh = getVehicle(PlayerPedId())

			if currentVehicle ~= tempCurVeh then
				currentVehicle = tempCurVeh
				CurrentVehicleData = getVehicleData(currentVehicle)
			end

			PlayerIsDriver = isPlayerDriver(currentVehicle)
		elseif PlayerInVehicle then --beim aussteigen
			PlayerIsDriver = false
			PlayerInVehicle = false
		end 
	end
end)

CreateThread(function()
	while true do
		Wait(1000)
		if PlayerInVehicle and PlayerIsDriver and currentVehicle ~= nil then 	
			handleFuelUsage(currentVehicle, CurrentVehicleData)
		end 
	end
end)

CreateThread(function()
	while true do
		Wait(0)
		if (currentMessage ~= nil or currentMessageAdmin ~= nil) and UIIsOpen == false then

			local msg = currentMessageAdmin
			if currentMessageAdmin == nil then 
				msg = currentMessage
			end 

			if ESX ~= nil then 
				ESX.ShowHelpNotification(msg)
			elseif QBCore ~= nil then 
				showInfobar(msg)
			end 
		else 
			Wait(1)
		end 
	end
end)


CreateThread(function()
	while true do
		Wait(250)

		local pumpObject, pumpDistance = FindNearestFuelPump()

		if pumpDistance < 2.5 then
			pumpLocation = nil
			pumpClass = nil

			for k,v in pairs(DefinedGasStations) do
				if #(vector3(v.pos.x,v.pos.y,v.pos.z) - GetEntityCoords(pumpObject)) <= v.distance then
					pumpLocation = v.db_id
					pumpClass = v.class
					break
				end
			end 			

			PlayerNearFuelPump = pumpObject
		else
			PlayerNearFuelPump = false
			Wait(math.ceil(pumpDistance * 20))
		end
	end
end)


-- draw markers
CreateThread(function()

	if isUsingQBTarget ~= true and isUsingOXTarget ~= true then 
		while true do		
			if UIIsOpen == false then
				Wait(1)
	
				local playerCoords = GetEntityCoords(PlayerPedId())
				local executeSleep = true
				local ped = PlayerPedId()
				local playerCoords = GetEntityCoords(ped)
	
	
				for key, values in pairs(DefinedGasStations) do
					local distance = #(playerCoords - vector3(values.adminpos.x, values.adminpos.y, values.adminpos.z))
					if distance < Config.MarkerDrawDistance then
						DoDrawMarker(values.adminpos)
						executeSleep = false
					end
				end 
	
				if executeSleep then
					Wait(1000)
				end
			else
				Wait(250)
			end
		end
	end 
end)

NPCsSpawned = {}

--marke npcs
CreateThread(function()
	if isUsingQBTarget == true or isUsingOXTarget == true then 
		local model = "a_m_y_business_01"
		model = GetHashKey(model)

		RequestModel(model)

		
		while not HasModelLoaded(model) do
			Wait(1)
		end
		while #DefinedGasStations == 0 do
			Wait(1000)
		end

		if #NPCsSpawned == 0 then 
			for k,v in pairs(DefinedGasStations) do 		
				local npc = CreatePed(4, model, v.adminpos.x, v.adminpos.y, v.adminpos.z - 1.0, v.npc_heading or 100.0, false, false)	
				
				PlaceObjectOnGroundProperly(npc)
				SetEntityHeading(npc,  v.npc_heading or 100.0)
				FreezeEntityPosition(npc, true)
				SetEntityInvincible(npc, true)
				SetBlockingOfNonTemporaryEvents(npc, true)
				TaskLookAtEntity(npc, PlayerPedId(-1), -1)
				table.insert(NPCsSpawned, npc)
			end 
		end 
		addTargetToPeds()
	end 
end)



CreateThread(function()
	if isUsingQBTarget ~= true and isUsingOXTarget ~= true then 
		while true do		
			if UIIsOpen == false then
				Wait(1)
	
				local playerCoords = GetEntityCoords(PlayerPedId())
				local executeSleep = true
				local ped = PlayerPedId()
				local playerCoords = GetEntityCoords(ped)
	
				for key, values in pairs(DefinedGasStations) do
					local distance = #(playerCoords - vector3(values.adminpos.x, values.adminpos.y, values.adminpos.z))
					if distance < Config.MarkerDrawDistance then
						DoDrawMarker(values.adminpos)
						executeSleep = false
					end
				end 
	
				if executeSleep then
					Wait(1000)
				end
			else
				Wait(250)
			end
		end
	end 
end)





-- show notification
CreateThread(function()  
	
	while true do
		Wait(350)
		isInAdminSpot = false
		if UIIsOpen == false then
			local ped = PlayerPedId()
			local playerCoords = GetEntityCoords(ped)

			if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then
				if DoesEntityExist(ped)then
					if IsPedDeadOrDying(ped) == false then
						for key2, values2 in pairs(DefinedGasStations) do
							local distance = #(playerCoords - vector3(values2.adminpos.x, values2.adminpos.y, values2.adminpos.z))

							if isUsingQBTarget or isUsingOXTarget then 
								if distance < 5.0 then
									isInAdminSpot = true
									AdminSpotGasStationID = values2.db_id
								end
							else
								if distance < Config.MarkerActiveDistance then
									isInAdminSpot = true
									AdminSpotGasStationID = values2.db_id
									currentMessageAdmin = Translations[Config.Locale].notification_interact_with_gas_station
								end
							end 
						end 
					end
				end
			end
		end 
		if isInAdminSpot == false then
			currentMessageAdmin = nil
		end
	end 
	
end)



function CheckForGasStationOwnerCallback(data)
	if data.gas_station_has_owner == true then
		if data.gas_station_owned_by_user then 
			OpenGasStationAdminPanel(AdminSpotGasStationID)
		else
			
			TriggerEvent("myFuel:notify", Translations[Config.Locale].notification_not_for_sell)
		end 

	else
		UIIsOpen = true
		SetNuiFocus(true, true)
		SendNUIMessage({ message = "show_buy_menu",locale = Config.Locale, gas_station_id = AdminSpotGasStationID , playermoney = data.playermoney, price = data.price, logo_name = data.logoname })
	end	
end 

function handleGasStationInteraction()
	if ESX ~= nil then 
		ESX.TriggerServerCallback('myFuel:CheckForGasStationOwner', function(data)
			CheckForGasStationOwnerCallback(data)
		end, AdminSpotGasStationID)
	elseif QBCore ~= nil then 
		QBCore.Functions.TriggerCallback('myFuel:CheckForGasStationOwner', function(data) 
			CheckForGasStationOwnerCallback(data)	
		end, AdminSpotGasStationID)
	end 
end 


CreateThread(function()  
	while true do
		if isInAdminSpot and UIIsOpen == false then 
			if IsControlJustReleased(0, Config.HotkeytoActions) then
				handleGasStationInteraction()
			end
			Wait(0)
		else
			Wait(250)
		end
	end 
end)

function getClosestVehicleData()

	local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), Config.NearestVehicleSearchMeters)
	local vehicleData = nil

	if vehicle ~= nil then
		vehicleData = getVehicleData(vehicle)	
	end

	return vehicle, vehicleData
end 

function checkIfPlayerCanRefuelVehicle()
	local ped = PlayerPedId()

	if CharIsBusy then 
		return nil
	
	elseif not PlayerNearFuelPump then 
		return nil
		
	elseif IsPedInAnyVehicle(ped) then 
		return nil
	end 
	
	local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), Config.NearestVehicleSearchMeters) or currentVehicle

	if vehicle ~= nil and DoesEntityExist(vehicle) and NetworkGetEntityIsNetworked(vehicle) then
		if not isStatebagAvailable(vehicle) then
			initFuelForVehicle(vehicle)
		end

		local vehData = getVehicleData(vehicle)	
		local vehicleCoords = GetEntityCoords(vehicle)
		local playerCoords = GetEntityCoords(ped)
		local maxDistance = 2.5
	
		if pumpClass == "boat" then 
			maxDistance = 10.0
		elseif pumpClass == "planes" and vehData.maxCapacity > 100 then 
			maxDistance = 15.0
		end 
	
		if DoesEntityExist(vehicle) and #(playerCoords - vehicleCoords) < maxDistance and GetVehicleFuelLevel(vehicle) <= Config.MinFuelLevelForRefuelViaPump and PlayerNearFuelPump and GetEntityHealth(PlayerNearFuelPump) > 0 and DoesEntityExist(vehicle) and globalNozzleObject == nil then 
			return vehicle
		else
			return nil
		end 
	else
		return nil
	end
end

function checkIfPlayerCanBuyPetolCan()
	local ped = PlayerPedId()

	if CharIsBusy then 
		return false
	elseif IsPedInAnyVehicle(ped) then 
		return false
	end 

	return PlayerNearFuelPump and GetEntityHealth(PlayerNearFuelPump) > 0 and Config.AllowPetrolCans and not HasPedGotWeapon(ped, PetrolCan) and globalNozzleObject == nil 
end 

function buyPetrolCan()
	if ESX ~= nil then 
		ESX.TriggerServerCallback('myFuel:checkMoney', function(hasEnoughMoney)
			if hasEnoughMoney then
				TriggerServerEvent('myFuel:buyJerryCan', pumpLocation, Config.PetrolCanPrice, GetEntityCoords(PlayerPedId()))
				if not Config.OxInventory.Enabled then
					GiveWeaponToPed(PlayerPedId(), PetrolCan, 100, false, true)
				end
				
			else
				TriggerEvent("myFuel:notify", Translations[Config.Locale].notification_too_less_money)
			end
		end, Config.PetrolCanPrice)
	elseif QBCore ~= nil then 
		QBCore.Functions.TriggerCallback('myFuel:checkMoney', function(hasEnoughMoney)
			if hasEnoughMoney then
				-- log entry and add money to fuel station
				TriggerServerEvent('myFuel:buyJerryCan', pumpLocation, Config.PetrolCanPrice, GetEntityCoords(PlayerPedId()))
				
				GiveWeaponToPed(PlayerPedId(), PetrolCan, 100, false, true)
			else
				TriggerEvent("myFuel:notify", Translations[Config.Locale].notification_too_less_money)
			end
		end, Config.PetrolCanPrice)
	end 
end 

function startFillingUp(vehicle)
	local showFillingView = false

	local vehData = getVehicleData(vehicle)

	if globalNozzleObject ~= nil then 
		return 
	end 

	if Config.UseFuelNozzle then 

		local lastFuelPump = PlayerNearFuelPump

		globalRopeObject, globalNozzleObject, holdingNozzle = grabNozzleFromFuelPump(PlayerNearFuelPump)
		local isBike, tankBone, nozzleDesinationPos = getTankBone(vehicle, vehData.fuelType)
		local tankPosition = GetWorldPositionOfEntityBone(vehicle, tankBone)
		

		if isUsingQBTarget ~= true and isUsingOXTarget ~= true then 
			while holdingNozzle do
				local pumpdistance = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(lastFuelPump))
	
				if isVehicleInFront(vehicle, pumpClass) then
					currentMessage = Translations[Config.Locale].notification_fuelpump_nozzle_put_in_vehicle
					if IsControlJustReleased(0, Config.HotkeytoActions) then
						putNozzleInVehicle(globalNozzleObject, vehicle, tankBone, isBike, true, nozzleDesinationPos)
						showFillingView = true
						holdingNozzle = false
					end 
				else
					currentMessage = Translations[Config.Locale].notification_fuelpump_nozzle_put_back
					if IsControlJustReleased(0, Config.HotkeytoActions) then
						returnNozzleToFuelpump(globalNozzleObject, globalRopeObject, true)
						holdingNozzle = false
					end 
				end
				
				if pumpdistance > Config.NozzleMaxDistanceInHand then 
					returnNozzleToFuelpump(globalNozzleObject, globalRopeObject, false)
					holdingNozzle = false
					TriggerEvent("myFuel:notify", Translations[Config.Locale].notification_moved_to_far_away)						
				elseif DoesEntityExist(vehicle) == false then 
					returnNozzleToFuelpump(globalNozzleObject, globalRopeObject, false)
					holdingNozzle = false						
				elseif IsPedInAnyVehicle(PlayerPedId()) then 
					returnNozzleToFuelpump(globalNozzleObject, globalRopeObject, false)
					holdingNozzle = false
				end 
				Wait(0)
			end 
		else
			RemoveTargets(true)
		end 

		
	else
		showFillingView = true
	end  

	if showFillingView then 
		local isSocietyVeh, SocietyName = isSocietyVehicle(vehicle)
		openUI(pumpLocation, false, GetFuel(vehicle), vehData.maxCapacity, vehData.fuelType, isSocietyVeh, SocietyName)
	end
end



function checkIfPlayerCanRefuelVehicleViaPetrolCan(vehicle)
	

	if GetSelectedPedWeapon(PlayerPedId()) == PetrolCan or Config.OxInventory.Enabled then 
		if vehicle == nil then 
			vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), Config.NearestVehicleSearchMeters)
		end 
		if vehicle ~= nil and DoesEntityExist(vehicle) and NetworkGetEntityIsNetworked(vehicle) then
			if not isStatebagAvailable(vehicle) then
				initFuelForVehicle(vehicle)
			end
	
			return GetVehicleFuelLevel(vehicle) <= Config.MinFuelLevelForRefuelViaPetrolCan and DoesEntityExist(vehicle) 
		else
			return false
		end 
	else
		return false
	end 

	
	
end 




CreateThread(function()
	while true and isUsingQBTarget ~= true and isUsingOXTarget ~= true do
		local ped = PlayerPedId()
		if CharIsBusy == false then 
			if IsPedInAnyVehicle(ped) == false then
				local vehicle = checkIfPlayerCanRefuelVehicle()

				if vehicle ~= nil then
					

					currentMessage = Translations[Config.Locale].notification_fuelpump_fill_car

					if IsControlJustReleased(0, Config.HotkeytoActions) then
						startFillingUp(vehicle)
					end 
				elseif checkIfPlayerCanBuyPetolCan() then 
					if ESX ~= nil then 
						ESX.ShowHelpNotification(Translations[Config.Locale].notification_buy_can .. ' (~o~' .. Config.PetrolCanPrice .. '$~s~)')
					elseif QBCore ~= nil then 
						showInfobar(Translations[Config.Locale].notification_buy_can .. ' (~o~' .. Config.PetrolCanPrice .. '$~s~)')
					end 

					if IsControlJustReleased(0, Config.HotkeytoActions) then
						buyPetrolCan()
					end 

				elseif checkIfPlayerCanRefuelVehicleViaPetrolCan(nil) then -- here fill up via petrol can..
					local showMessage = false

					if GetSelectedPedWeapon(ped) == PetrolCan or Config.OxInventory.Enabled and Config.OxInventory.itemIsWeaponInInventory == false then 
						showMessage = true
					end 

					if showMessage then 
						if ESX ~= nil then 
							ESX.ShowHelpNotification(Translations[Config.Locale].notification_fill_by_can)
						elseif QBCore ~= nil then 
							showInfobar(Translations[Config.Locale].notification_fill_by_can)
						end 
						
						if IsControlJustReleased(0, Config.HotkeytoFillUpByPetrolCan) then
							FillUpViaPetrolCan(nil, true)
						end
					else
						currentMessage = nil
						Wait(0)
					end 


				else
					currentMessage = nil
					Wait(0)
				end 
			else
				currentMessage = nil
				Wait(0)
			end 
		else
			currentMessage = nil
			Wait(0)
		end 

		Wait(0)
	end
end)


if Config.ShowNearestGasStationOnly then
	CreateThread(function()
		local currentGasBlip = 0
		local lastCoordsFound = nil 
		local lastBlipHasOwner = false
		local lastBlipPlayerIsOwner = false

		local BlipNeedsUpdate = false

		while true do
			

			local coords = GetEntityCoords(PlayerPedId())
			local closest = 1000
			local closestCoords = nil
			local hasowner = false
			local playerisowner = false
			local gasstationid = nil

			for _, gasStationData in pairs(DefinedGasStations) do

				local gasStationCoords = vector3(gasStationData.pos.x,gasStationData.pos.y,gasStationData.pos.z)

				local dstcheck = #(coords - gasStationCoords)

				hasowner = gasStationData.has_owner
				playerisowner = gasStationData.playerisowner
				gasstationid = gasStationData.db_id
				

				
				if hasowner and playerisowner then 
					if BlipData[gasStationData.db_id] == nil then 
						local blip =  CreateBlip(gasStationCoords, Config.GasStationBlip, hasowner, playerisowner)
						BlipData[gasStationData.db_id] = blip
					end 
				elseif dstcheck < closest then
					closest = dstcheck
					closestCoords = gasStationCoords
				end 
			end


			if lastCoordsFound ~= closestCoords then 
				if BlipData[gasstationid] ~=nil then
					RemoveBlip(BlipData[gasstationid])
					BlipData[gasstationid] = nil 
				end
				BlipData[gasstationid] = CreateBlip(closestCoords, Config.GasStationBlip, hasowner, playerisowner)
			end 

			Wait(1000)
		end
	end)
elseif Config.ShowGasStationsOnMap then
	CreateThread(function()
		local blipscreated = false 
		while blipscreated == false do
			if #DefinedGasStations>0 then 
				for _, gasStationData in pairs(DefinedGasStations) do
					local gasStationCoords = vector3(gasStationData.pos.x, gasStationData.pos.y,gasStationData.pos.z)
					local blip =  CreateBlip(gasStationCoords, Config.GasStationBlip, gasStationData.has_owner, gasStationData.playerisowner)

					BlipData[gasStationData.db_id] = blip
				end

				blipscreated = true
			end

			
			Wait(0)
		end 
	end)
end

if Config.EnableUIHUD then 

	local mph = 0
	local kmh = 0
	local fuel = 0
	local fuel_in_unit = ""
	local displayHud = false

	local x = 0.01135
	local y = 0.002

	CreateThread(function()
		while true do
			local ped = PlayerPedId()

			if IsPedInAnyVehicle(ped) then
				local vehicle = GetVehiclePedIsIn(ped)
				local speed = GetEntitySpeed(vehicle)
				local displayFuel = GetFuelToUse(vehicle) ~= nil 

				if displayFuel then 
					fuel = tostring(math.ceil(GetFuel(vehicle)))
					fuel_in_unit = GetFuelInUnit(vehicle) .. "" .. GetFuelUnit(vehicle)

					displayFuel = Config.ShowFuelLevel
				end 


				local displayspeed = ""
				if Config.SpeedUnit ~= "kmh" then 
					displayspeed = tostring(math.ceil(speed * 2.236936))
				else 
					displayspeed = tostring(math.ceil(speed * 3.6))
				end 

				SendNUIMessage({ 
					message = "show_driverview", 
					ShowSpeed = Config.ShowSpeed, 
					ShowFuelLevel = displayFuel, 
					SpeedUnit = Config.SpeedUnit, 
					HudLocation = Config.HudLocation, 
					HUDFuelCritical = Config.HUDFuelCritical, 
					HUDFuelWarning = Config.HUDFuelWarning, 
					HUDextraMargins = Config.HUDextraMargins,
					ShowFuelInPercentage = Config.ShowFuelInPercentage, 	
					HUDRemoveBackground = Config.HUDRemoveBackground, 	
					speed = displayspeed,
					fuel_level = fuel,
					fuel_in_unit = fuel_in_unit
				})

				if displayHud == false then 
					displayHud = true
				end 
				
			else
				if displayHud == true then 
					displayHud = false
					SendNUIMessage({ message = "hide_driverview"})
				end 
				Wait(500)
			end

			Wait(100)
		end
	end)
end 

if Config.EnableHUD then
	local function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
		SetTextFont(font)
		SetTextProportional(0)
		SetTextScale(sc, sc)
		N_0x4e096588b13ffeca(jus)
		SetTextColour(r, g, b, a)
		SetTextDropShadow(0, 0, 0, 0,255)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		AddTextComponentString(text)
		DrawText(x - 0.1+w, y - 0.02+h)
	end

	local mph = 0
	local kmh = 0
	local fuel = 0
	local displayHud = false

	local x = 0.01135
	local y = 0.002

	CreateThread(function()
		while true do
			local ped = PlayerPedId()

			if IsPedInAnyVehicle(ped) then
				local vehicle = GetVehiclePedIsIn(ped)
				local speed = GetEntitySpeed(vehicle)

				mph = tostring(math.ceil(speed * 2.236936))
				kmh = tostring(math.ceil(speed * 3.6))
				fuel = tostring(math.ceil(GetVehicleFuelLevel(vehicle)))
				

				displayHud = true
			else
				displayHud = false

				Wait(500)
			end

			Wait(50)
		end
	end)

	CreateThread(function()
		while true do
			if displayHud then
				DrawAdvancedText(0.212 - x, 0.77 - y, 0.005, 0.0028, 0.6, fuel .. '%', 255, 255, 255, 255, 6, 1)
				DrawAdvancedText(0.2375  - x, 0.7765 - y, 0.005, 0.0028, 0.4, "Fuel", 255, 255, 255, 255, 6, 1)
			else
				Wait(750)
			end

			Wait(0)
		end
	end)
end




-- EVENTS 
RegisterNetEvent("myFuel:GasStationBuy_Success")
AddEventHandler("myFuel:GasStationBuy_Success",function()
	OpenGasStationAdminPanel(AdminSpotGasStationID)
end)
-- EVENTS 
RegisterNetEvent("myFuel:fillUpVehicleByItem")
AddEventHandler("myFuel:fillUpVehicleByItem",function()
	local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 3.0)

	if vehicle ~= nil then 
		FillUpViaPetrolCan(vehicle, false)
	else
		TriggerEvent("myFuel:notify", Translations[Config.Locale].no_car_nearby)
	end 
end)



RegisterNetEvent("myFuel:UpdateBlip")
AddEventHandler("myFuel:UpdateBlip",function(gas_station_id, hasOwner, playeridOwner)
	local iAmOwner = false

	if playeridOwner ~= nil then 
		iAmOwner = PlayerId() == GetPlayerFromServerId(playeridOwner)
	end



	--get defined Gas Station
	if #DefinedGasStations>0 then 
		for _, gasStationData in pairs(DefinedGasStations) do
			if gasStationData.db_id == gas_station_id then 
				
				DefinedGasStations[_].has_owner = hasOwner
				DefinedGasStations[_].playerIsOwner = iAmOwner
				
				if BlipData[gas_station_id] ~= nil then 
					RemoveBlip(BlipData[gas_station_id])
					BlipData[gasStationData.db_id] = nil
				end 

				if Config.ShowGasStationsOnMap then 
					local gasStationCoords = vector3(gasStationData.pos.x, gasStationData.pos.y,gasStationData.pos.z)
					local blip =  CreateBlip(gasStationCoords, Config.GasStationBlip, hasOwner, iAmOwner)
	
					BlipData[gasStationData.db_id] = blip
				end 
			end 
		end
	end 
end)

RegisterNetEvent("myFuel:GasStationBuy_MissingMoney")
AddEventHandler("myFuel:GasStationBuy_MissingMoney",function()
	closeUI();
	TriggerEvent("myFuel:notify", Translations[Config.Locale].notification_too_less_money)
end)

RegisterNetEvent("myfuel:handleItemFillupUI")
AddEventHandler("myfuel:handleItemFillupUI",function(message, ui_data)

	if message ~= "" then 
		TriggerEvent("myFuel:notify", message)
	end

	if UIIsOpen then 
		SendNUIMessage({ message = "updateOwnerView", updateDetails = "itemButtonUpdate", data = ui_data });
	end
end)

RegisterNetEvent("myFuel:SyncFuel")
AddEventHandler("myFuel:SyncFuel",function(veh, new_fuel_level)
	if NetworkDoesNetworkIdExist(veh) then
		local vehicle = NetToVeh(veh)
		if DoesEntityExist(vehicle) then
			SetFuel(vehicle, new_fuel_level)
		end
	end 
end)


RegisterNetEvent('myfuel:useitem')
AddEventHandler('myfuel:useitem', function(itemData)
	if Config.FillingUpJobs.Enabled then 
		if PlayerNearFuelPump and GetEntityHealth(PlayerNearFuelPump) > 0 then 
			if ESX ~= nil then 
				ESX.TriggerServerCallback('myFuel:CheckForGasStationOwner', function(gasStationData)
					useItemCallback(itemData, gasStationData)
				end, pumpLocation)
			elseif QBCore ~= nil then 
				QBCore.Functions.TriggerCallback('myFuel:CheckForGasStationOwner', function(gasStationData)
					useItemCallback(itemData, gasStationData)
				end, pumpLocation)
			end 
		end 
	end 
end)


RegisterNetEvent('myFuel:updateNUI:levelup_warehouse')
AddEventHandler('myFuel:updateNUI:levelup_warehouse', function(serverdata)
	if UIIsOpen then 
		SendNUIMessage({ message = "updateOwnerView", updateDetails = "warehouselevel", data = serverdata})
	end
end)

RegisterNetEvent('myFuel:updateNUI:set_new_fuel_price')
AddEventHandler('myFuel:updateNUI:set_new_fuel_price', function(serverdata)
	if UIIsOpen then 
		SendNUIMessage({ message = "updateOwnerView", updateDetails = "fuel_price", data = serverdata})
	end
end)

RegisterNetEvent('myFuel:updateNUI:bought_fuel')
AddEventHandler('myFuel:updateNUI:bought_fuel', function(serverdata)
	if UIIsOpen then 
		SendNUIMessage({ message = "updateOwnerView", updateDetails = "boughtFuel", data = serverdata})
	end
end)

RegisterNetEvent('myFuel:updateNUI:TransferedMoney')
AddEventHandler('myFuel:updateNUI:TransferedMoney', function(serverdata)
	if UIIsOpen then 
		SendNUIMessage({ message = "updateOwnerView", updateDetails = "TransferedMoney", data = serverdata})
	end
end)

RegisterNetEvent("myFuel:notify")
AddEventHandler("myFuel:notify", function(notificationtext)
	if Config.notifications.BtwLouis then
		TriggerEvent('notifications', '#07b95e', '', notificationtext)
	elseif Config.notifications.DefaultFiveM then
			SetNotificationTextEntry('STRING')
			AddTextComponentString(notificationtext)
			DrawNotification(false, false)
	elseif Config.notifications.Custom then
		--here your custom code...
	end
end)

RegisterNetEvent("myFuel:picturenotify")
AddEventHandler("myFuel:picturenotify", function(icon, msg, title, subtitle)
	if Config.notifications.BtwLouis then
		TriggerEvent('notifications', '#07b95e', '', msg)
	elseif  Config.notifications.DefaultFiveM then 
		SetNotificationTextEntry("STRING")
		AddTextComponentString(msg);
		SetNotificationMessage(icon, icon, true, 1, title, subtitle);
		DrawNotification(false, true);
	elseif Config.notifications.Custom then 
		--here your custom code...
	end 
end)


--NUI CALLBACKS
RegisterNUICallback('escape', function(data, cb)
    close()
	local ped = PlayerPedId()
	ClearPedTasks(ped)
	RemoveAnimDict("timetable@gardener@filling_can")
	cb({})
end)


RegisterNUICallback('getTranslations', function(data, cb)
	if UI_Translations[Config.Locale] ~= nil then 
		cb({ locale=Config.Locale, translations = UI_Translations[Config.Locale]})	
	else
		cb({ locale="en", translations = UI_Translations["en"] })	
	end 
end)

RegisterNUICallback('getItemCount', function(uidata, uicb)

	if ESX ~= nil then 
		ESX.TriggerServerCallback('myFuel:getItemCount', function(data)
			local retdata = {count = data}
			uicb(retdata)
		end, uidata.itemname)
	elseif QBCore ~= nil then 
		QBCore.Functions.TriggerCallback('myFuel:getItemCount', function(data)
			local retdata = {count = data}
			uicb(retdata)
		end, uidata.itemname)
	end 
end)


RegisterNUICallback('BuyGasStation', function(data, cb)
	local amount_to_pay = tonumber(data.amount_to_pay)
	local gas_station_id = data.gas_station_id

	TriggerServerEvent(
		'myFuel:BuyGasStation'
		,amount_to_pay
		,gas_station_id
	)
	
	cb({})
end)
RegisterNUICallback('SellGasStation', function(data, cb)
	local gas_station_id = data.gas_station_id

	closeUI();

	TriggerServerEvent(
		'myFuel:SellGasStation'
		,gas_station_id
	)
		
	cb({})
end)

RegisterNUICallback('OwnerFillUpByItem', function(ui_data, ui_cb)
	TriggerServerEvent(
		'myFuel:UpdateStock'
		,ui_data.gas_station_id
		,ui_data.fuel_type
		,ui_data.itemname
		,ui_data.itemlabel
		,ui_data.fillup_amount
		,ui_data.element_id
		,ui_data.amount
		,0
		,true
	)
	ui_cb({})
end)


RegisterNUICallback('LevelupWarehouse', function(data, cb)
	local amount_to_pay = tonumber(data.amounttopay)
	local gas_station_id = data.gas_station_id
	local new_level = data.new_level

	TriggerServerEvent(
		'myFuel:LevelupWarehouse'
		,amount_to_pay
		,gas_station_id
		,new_level
	)
	cb({})
end)

RegisterNUICallback('SaveFuelPrice', function(data, cb)
	local fuel_type = data.fuel_type
	local gas_station_id = data.gas_station_id
	local new_price = data.new_price

	TriggerServerEvent(
		'myFuel:SaveFuelPrice'
		,new_price
		,gas_station_id
		,fuel_type
	)
	cb({})
end)

-- MISSIONS

local tankerBlip
local tankerCoords
local spawnTruckLocation
local missionData 
local isInMission = false
local isNearMissionEnd = false
local missionTruck 
local missionTanker

CreateThread(function()
	while true do
		local sleep = 1000
		if isInMission then
			sleep = 350
			isNearMissionEnd = false

			local ped = PlayerPedId()
			local pos = GetEntityCoords(ped)

			if tankerCoords ~= nil and tankerBlip ~= nil then
				local distance = #(pos - vector3(tankerCoords[1], tankerCoords[2], tankerCoords[3]))
				if distance <= 10.0 then
					RemoveBlip(tankerBlip)
					tankerBlip = nil
					TriggerEvent('myFuel:picturenotify', Config.NotificationPicturePay, Translations[Config.Locale].mission_start, Translations[Config.Locale].mission_murrieta,  Translations[Config.Locale].mission_subtitle)
					SetNewWaypoint(spawnTruckLocation.x, spawnTruckLocation.y)
				end
			end

			if spawnTruckLocation ~= nil then
				local distance = #(pos - vector3(spawnTruckLocation.x, spawnTruckLocation.y, spawnTruckLocation.z))
				if distance <= 4.0 then
					isNearMissionEnd = true
				end
			end
		end
		Wait(sleep)
	end
end)

CreateThread(function()
	while true do
		local sleep = 1000
		if isInMission then
			sleep = 1
			if spawnTruckLocation ~= nil then
				DrawMarker(27, spawnTruckLocation.x , spawnTruckLocation.y, spawnTruckLocation.z - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.radius*1.5, Config.Marker.radius*1.5, Config.Marker.radius, Config.Marker.colour.r, Config.Marker.colour.g, Config.Marker.colour.b, Config.Marker.colour.a, false, false, 2, false, false, false, false)
				if isNearMissionEnd and tankerBlip == nil then

					if ESX ~= nil then 
						ESX.ShowHelpNotification(Translations[Config.Locale].mission_info_attach)
						if IsControlJustReleased(0, Config.HotkeytoActions) then
							local tankerExist = checkTankerExist(GetEntityCoords(PlayerPedId()), 10.0)
							if tankerExist then
								ESX.Game.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
								TriggerEvent('myFuel:picturenotify', Config.NotificationPicturePay, Translations[Config.Locale].notification_mission_complete .. UI_Translations[Config.Locale][missionData.type] .. Translations[Config.Locale].notification_mission_complete2, Translations[Config.Locale].mission_murrieta, Translations[Config.Locale].mission_subtitle)
								TriggerServerEvent('myFuel:SetStockToMax',missionData.id, missionData.type, missionData.to_set)
								if Config.MissionPricePerLiter ~= nil and Config.MissionPricePerLiter > 0.0 then
									TriggerServerEvent('myFuel:payForMission', missionData.price, missionData.id)
									TriggerEvent("myFuel:notify", Translations[Config.Locale].paid_for_mission .. math.floor(missionData.price))
								end
								isInMission = false
							else
								TriggerEvent("myFuel:notify", Translations[Config.Locale].notification_mission_no_tanker)
							end
						end
					elseif QBCore ~= nil then 
						showInfobar(Translations[Config.Locale].mission_info_attach)
						if IsControlJustReleased(0, Config.HotkeytoActions) then
							local tankerExist = checkTankerExist(GetEntityCoords(PlayerPedId()), 10.0)
							if tankerExist then
								QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
								TriggerEvent('myFuel:picturenotify', Config.NotificationPicturePay, Translations[Config.Locale].notification_mission_complete .. UI_Translations[Config.Locale][missionData.type] .. Translations[Config.Locale].notification_mission_complete2, Translations[Config.Locale].mission_murrieta, Translations[Config.Locale].mission_subtitle)
								TriggerServerEvent('myFuel:SetStockToMax',missionData.id, missionData.type, missionData.to_set)

								if Config.MissionPricePerLiter ~= nil and Config.MissionPricePerLiter > 0.0 then
									TriggerServerEvent('myFuel:payForMission', missionData.price, missionData.id)
									TriggerEvent("myFuel:notify", Translations[Config.Locale].paid_for_mission .. math.floor(missionData.price))
								end
								isInMission = false
							else
								TriggerEvent("myFuel:notify", Translations[Config.Locale].notification_mission_no_tanker)
							end
						end
					end 


				elseif isNearMissionEnd then
					if ESX ~= nil then 
						ESX.ShowHelpNotification(Translations[Config.Locale].mission_info_end)
						if IsControlJustReleased(0, Config.HotkeytoActions) then
							if tankerBlip ~= nil then
								RemoveBlip(tankerBlip)
							end

							if DoesEntityExist(missionTruck) then
								ESX.Game.DeleteVehicle(missionTruck)
							end

							if DoesEntityExist(missionTanker) then
								ESX.Game.DeleteVehicle(missionTanker)
							end
							isInMission = false
						end
					elseif QBCore ~= nil then
						showInfobar(Translations[Config.Locale].mission_info_end)
						if IsControlJustReleased(0, Config.HotkeytoActions) then
							if tankerBlip ~= nil then
								RemoveBlip(tankerBlip)
							end
	
							if DoesEntityExist(missionTruck) then
								QBCore.Functions.DeleteVehicle(missionTruck)
							end
	
							if DoesEntityExist(missionTanker) then
								QBCore.Functions.DeleteVehicle(missionTanker)
							end
							isInMission = false
						end
					end 
				end
			end
			
		end
		Wait(sleep)
	end
end)

RegisterNUICallback('StartMission', function(data, cb)
	local gas_station_id = data.gas_station_id
	local fuel_type = data.fuel_type
	local stock_to_set = data.stock_to_set
	local price = data.price

	missionData = {
		id = gas_station_id,
		type = fuel_type,
		to_set = stock_to_set,
		price = price
	}

	closeUI();
	if DoesEntityExist(missionTruck) then
		TriggerEvent("myFuel:notify", Translations[Config.Locale].mission_already_started)
	else

		for i, gas_station in pairs(DefinedGasStations) do
			if gas_station.db_id == gas_station_id then
				spawnTruckLocation = gas_station.missionpos
				break
			end
		end
		if GetClosestVehicle(spawnTruckLocation, 4.5) == nil then
			local location = vector3(spawnTruckLocation.x, spawnTruckLocation.y, spawnTruckLocation.z)
			isInMission = true

			if ESX ~= nil then 
				ESX.Game.SpawnVehicle(GetHashKey(Config.MissionVehicle), location, spawnTruckLocation.heading, function(callback_vehicle)
					missionTruck = callback_vehicle
					TaskWarpPedIntoVehicle(PlayerPedId(), callback_vehicle, -1)
					SetVehicleEngineOn(callback_vehicle, true, true)
					SetFuel(callback_vehicle, 100.0)
				end)
			elseif QBCore ~= nil then 
				QBCore.Functions.SpawnVehicle('hauler', function(veh)
					missionTruck = veh
					SetEntityHeading(veh, spawnTruckLocation.heading)
					TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
					SetVehicleEngineOn(veh, true, true)
					SetFuel(veh, 100.0)
					TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
				end, location, true)
			end 

			spawnRandomTanker()
			TriggerEvent('myFuel:picturenotify', Config.NotificationPicturePay, Translations[Config.Locale].mission_begin, Translations[Config.Locale].mission_murrieta, Translations[Config.Locale].mission_subtitle)
		else
			TriggerEvent("myFuel:notify", Translations[Config.Locale].mission_blocked)
		end
	end

end)

function spawnRandomTanker()

	local randomInt = math.random(1, #Config.MissionLocations)
	local trailerPos = searchBestParkingSpot(Config.MissionLocations[randomInt], Config.MissionLocations)
	tankerCoords = trailerPos

	tankerBlip = AddBlipForCoord(trailerPos[1], trailerPos[2])
        
	SetBlipSprite (tankerBlip, 479)
	SetBlipColour (tankerBlip, 0)
	SetBlipDisplay(tankerBlip, 2)
	SetBlipScale  (tankerBlip, 1.2)

	SetBlipAsShortRange(tankerBlip, false)
	SetBlipRoute(tankerBlip,  true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(Translations[Config.Locale]['tanker'])
	EndTextCommandSetBlipName(tankerBlip)

	CreateThread(function()
		while true do
			local dist = #(GetEntityCoords(PlayerPedId()) - vector3(tankerCoords.x or tankerCoords[1], tankerCoords.y or tankerCoords[2], tankerCoords.z or tankerCoords[3]))
			if dist < 55.0 then

				if ESX ~= nil then 
					ESX.Game.SpawnVehicle(GetHashKey('tanker'), {x = trailerPos[1],y = trailerPos[2], z = trailerPos[3]}, trailerPos[4], function(callback_vehicle)
						missionTanker = callback_vehicle
					end)
				elseif QBCore ~= nil then 
					QBCore.Functions.SpawnVehicle('tanker', function(veh)
						missionTanker = veh
						SetEntityHeading(veh, trailerPos[4])
					end, {x = trailerPos[1],y = trailerPos[2], z = trailerPos[3]}, true)
				end 

				break
			end

			Wait(1000)
		end
	
	end)

end

function searchBestParkingSpot(spawnCoords, alternativeSpawnCoords)
    local finalSpawnCoords = spawnCoords
    if alternativeSpawnCoords ~= nil and #alternativeSpawnCoords > 0 then
        if GetClosestVehicle(spawnCoords, 3.0) ~= nil then
            for k, altPos in pairs(alternativeSpawnCoords) do
                local vehicleOnPos = GetClosestVehicle(altPos, 3.0)
                if vehicleOnPos == nil then
                    finalSpawnCoords = altPos
                    break
                end
            end
        end
    end

    return finalSpawnCoords
end

-- Return closest loaded vehicle entity or nil if no vehicle is found
function GetClosestVehicle(position, maxRadius)
    local vehicles       = GetGamePool("CVehicle")
    local dist           = maxRadius
    local closestVehicle = nil
    
    for i=1, #vehicles, 1 do
        local vehicleCoords = GetEntityCoords(vehicles[i])
        local tempDist = #(vector3(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z) - vector3(position.x or position[1], position.y or position[2], position.z or position[3]))
        if (tempDist < dist) then
            dist = tempDist
            closestVehicle = vehicles[i]
        end
    end
    
    if (closestVehicle ~= nil and DoesEntityExist(closestVehicle)) then
        return closestVehicle
    else
        return nil
    end
end

function checkTankerExist(position, maxRadius)
    local vehicles       = GetGamePool("CVehicle")
    local dist           = maxRadius
    local exist = false
    
    for i=1, #vehicles, 1 do
        local vehicleCoords = GetEntityCoords(vehicles[i])
        local tempDist = #(vector3(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z) - vector3(position.x, position.y, position.z))
		
        if (tempDist < dist) and GetEntityModel(vehicles[i]) == GetHashKey('tanker') then
            exist = true
			break
        end
    end
    
    return exist
end

-- MISSIONS END

RegisterNUICallback('MoneyTransfer', function(data, cb)
	local gas_station_id = data.gas_station_id
	local money_amount = tonumber(data.money_amount)
	local tranfer_type = data.tranfer_type

	TriggerServerEvent(
		'myFuel:TransferMoney'
		,gas_station_id
		,money_amount
		,tranfer_type
	)
	cb({})
end)

RegisterNUICallback('BuyFuel', function(data, cb)
	local fuel_type = data.fuel_type
	local gas_station_id = data.gas_station_id
	local fuel_price = tonumber(data.fuel_price)
	local fuel_amount = tonumber(data.fuel_amount)
	local fuel_singleprice = tonumber(data.fuel_singleprice)

	TriggerServerEvent(
		'myFuel:BuyFuel'
		,gas_station_id
		,fuel_type
		,fuel_price
		,fuel_amount
		,fuel_singleprice
	)
	cb({})
end)

RegisterNUICallback('fillUpVehicle', function(data, cb)
	UIIsOpen = false
	SetNuiFocus(false, false)
	SendNUIMessage({ message = "hide_fillup_menu"})
	removeAnimation()

	local vehicle = GetPlayersLastVehicle()
    local new_fuel_percentage = tonumber(data.new_fuel_percentage)
    local amounttopay = tonumber(data.amounttopay)
    local liters_filled_up = tonumber(data.liters_filled_up)
    local fuel_type = data.fuel_type
    local single_price = tonumber(data.single_price)
    local payment_method = data.payment_method
	
	returnNozzleToFuelpump(globalNozzleObject, globalRopeObject, false)

	if DoesEntityExist(vehicle) and #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(vehicle)) < 5 then
		TriggerServerEvent(
			'myFuel:pay'
			,new_fuel_percentage
			,VehToNet(vehicle)
			,amounttopay
			,pumpLocation
			,fuel_type
			,liters_filled_up
			,single_price
			,payment_method
			,data.isSociety
			,data.SocietyName
		)
	end
	cb({})
end)

RegisterNUICallback('close', function(data, cb)
	closeUI()

	if globalNozzleObject ~= nil and globalRopeObject ~= nil then 
		returnNozzleToFuelpump(globalNozzleObject, globalRopeObject, false)
	end 
	cb({})

end)


RegisterNUICallback('startAnimation',function(data,cb)
	CharIsBusy = true
	local ped = PlayerPedId()
	local vehicle = GetPlayersLastVehicle()
	TaskTurnPedToFaceEntity(ped,vehicle,5000)
	LoadAnimDict("timetable@gardener@filling_can")
	TaskPlayAnim(ped,"timetable@gardener@filling_can","gar_ig_5_filling_can",2.0,8.0,-1,50,0,0,0,0)
	cb({})
end)


--functions 

function grabNozzleFromFuelPump(fuelPumpObject)
	local fuelPumpCoords = GetEntityCoords(fuelPumpObject)
	local ped = PlayerPedId()

    LoadAnimDict("anim@am_hold_up@male")
    TaskPlayAnim(ped, "anim@am_hold_up@male", "shoplift_high", 2.0, 8.0, -1, 50, 0, 0, 0, 0)

    Wait(300)
    local nozzle = CreateObject('prop_cs_fuel_nozle', 0, 0, 0, true, true, true)
    AttachEntityToEntity(nozzle, ped, GetPedBoneIndex(ped, 0x49D9), 0.11, 0.02, 0.02, -80.0, -90.0, 15.0, true, true, false, true, 1, true)
    RopeLoadTextures()
    while not RopeAreTexturesLoaded() do
        Wait(0)
    end
    RopeLoadTextures()
    while not fuelPumpCoords do
        Wait(0)
    end
    local rope = AddRope(fuelPumpCoords.x, fuelPumpCoords.y, fuelPumpCoords.z, 0.0, 0.0, 0.0, 3.0, 1, 1000.0, 0.0, 1.0, false, false, false, 1.0, true)
    while not rope do
        Wait(0)
    end
    ActivatePhysics(rope)
    Wait(50)
    local nozzlePos = GetEntityCoords(nozzle)
    nozzlePos = GetOffsetFromEntityInWorldCoords(nozzle, 0.0, -0.033, -0.195)
    AttachEntitiesToRope(rope, fuelPumpObject, nozzle, fuelPumpCoords.x, fuelPumpCoords.y, fuelPumpCoords.z + 1.45, nozzlePos.x, nozzlePos.y, nozzlePos.z, 5.0, false, false, nil, nil)

	return rope, nozzle, true
end 

function openUI(gas_station_id, isPetrolCan, currentLiters, maxLiters, fuel_type, is_society_veh, society_name)

	if ESX ~= nil then 
		ESX.TriggerServerCallback('myFuel:GetNecessaryFillupData', function(data)
			UIIsOpen = true
			SetNuiFocus(true, true)
			SendNUIMessage({ message = "show_fillup_menu",locale = Config.Locale, petrolCan = isPetrolCan , currentLiter = currentLiters , maxCapacity = maxLiters , data = data, fuel_tick_interval = Config.FuelRefillInterval, is_society_veh = is_society_veh, society_name = society_name })
		end, gas_station_id, fuel_type)
	elseif QBCore ~= nil then 
		QBCore.Functions.TriggerCallback('myFuel:GetNecessaryFillupData', function(data)
			UIIsOpen = true
			SetNuiFocus(true, true)
			SendNUIMessage({ message = "show_fillup_menu",locale = Config.Locale, petrolCan = isPetrolCan , currentLiter = currentLiters , maxCapacity = maxLiters , data = data, fuel_tick_interval = Config.FuelRefillInterval, is_society_veh = is_society_veh, society_name = society_name })
		end, gas_station_id, fuel_type)
	end 

	
end 

function close()
	SetNuiFocus(false, false)
	SendNUIMessage({ action = false })
end

function open(vehicle,data)
	SetNuiFocus(true, true)
	SendNUIMessage({ action = true, fuel = GetVehicleFuelLevel(vehicle), data = data })
end


function OpenGasStationAdminPanel(gas_station_id)

	if ESX ~= nil then 
		ESX.TriggerServerCallback('myFuel:GetOwnerInfo', function(returndata)
			UIIsOpen = true
			SetNuiFocus(true, true)
			SendNUIMessage({ message = "show_owner_menu",locale = Config.Locale, gas_station_id = gas_station_id , data = returndata })
		end, gas_station_id)
	elseif QBCore ~= nil then 
		QBCore.Functions.TriggerCallback('myFuel:GetOwnerInfo', function(returndata)
			UIIsOpen = true
			SetNuiFocus(true, true)
			SendNUIMessage({ message = "show_owner_menu",locale = Config.Locale, gas_station_id = gas_station_id , data = returndata })
		end, gas_station_id)
	end
end 

function removeAnimation()
	CharIsBusy = false
	local ped = PlayerPedId()
	ClearPedTasks(ped)
	RemoveAnimDict("timetable@gardener@filling_can")
end 

function closeUI()
	UIIsOpen = false
	SetNuiFocus(false, false)
	SendNUIMessage({ message = "close"})
	removeAnimation()
end 


function removeAllBlips()
	for key, blip in pairs(BlipData) do
		RemoveBlip(blip)
	end
	BlipData={}
end 

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end

	for key, value in pairs(createdExtraPumps) do
		DeleteObject(value)
	end 
	
	
	if globalNozzleObject ~= nil and globalRopeObject ~= nil then 
		returnNozzleToFuelpump(globalNozzleObject, globalRopeObject, false)
	end 
	RemoveTargets(false)

	FreezeEntityPosition(PlayerPedId(), false)	
	ClearPedTasks(PlayerPedId())
	removeAllBlips()

	for key, npc in pairs(NPCsSpawned) do
		DeletePed(npc)
		
	end

  end)

  -- delete nozzle and rope, and hide ui.
function returnNozzleToFuelpump(nozzle, rope, doAnimation)
	local ped = PlayerPedId()

	if doAnimation == true then 
		LoadAnimDict("anim@am_hold_up@male")
		TaskPlayAnim(ped, "anim@am_hold_up@male", "shoplift_high", 2.0, 8.0, -1, 50, 0, 0, 0, 0)
		Wait(300)
	end 

    DeleteEntity(nozzle)
    RopeUnloadTextures()
    DeleteRope(rope)

	if doAnimation == true then 
		Wait(1000)
		ClearPedTasks(ped)
	end 

	globalNozzleObject = nil
end


function putNozzleInVehicle(nozzle, vehicle, tankBone, isBike, dontClear, newTankPosition)



	LoadAnimDict("timetable@gardener@filling_can")
	TaskPlayAnim(PlayerPedId(), "timetable@gardener@filling_can", "gar_ig_5_filling_can", 2.0, 8.0, -1, 50, 0, 0, 0, 0)
	Wait(300)

    if isBike then
        AttachEntityToEntity(nozzle, vehicle, tankBone, 0.0 + newTankPosition.x, -0.2 + newTankPosition.y, 0.2 + newTankPosition.z, -80.0, 0.0, 0.0, true, true, false, false, 1, true)
    else
        AttachEntityToEntity(nozzle, vehicle, tankBone, -0.18 + newTankPosition.x, 0.0 + newTankPosition.y, 0.5 + newTankPosition.z, -125.0, -90.0, -90.0, true, true, false, false, 1, true)
    end
    if not dontClear and IsEntityPlayingAnim(PlayerPedId(), "timetable@gardener@filling_can", "gar_ig_5_filling_can", 3) then
        ClearPedTasks(PlayerPedId())
    end

	Wait(300)
	ClearPedTasks(PlayerPedId())

end

function FillUpViaPetrolCanCallback(vehicle)
	
	local ped = PlayerPedId(-1)
	LoadAnimDict("timetable@gardener@filling_can")
	TaskPlayAnim(ped, "timetable@gardener@filling_can", "gar_ig_5_filling_can", 2.0, 8.0, -1, 50, 0, 0, 0, 0)

	Wait(4000)
	
	ClearPedTasks(ped)
	RemoveAnimDict("timetable@gardener@filling_can")

	if Config.OxInventory.Enabled then
		TriggerServerEvent("myFuel:removejerrycan")
		RemoveWeaponFromPed(ped, PetrolCan)
	else
		RemoveWeaponFromPed(ped, PetrolCan)
	end
	
	local newFuel = math.ceil(GetVehicleFuelLevel(vehicle)) + Config.PetrolCanRemoveLiters
	SetFuel(vehicle, newFuel)
	

	TriggerEvent("myFuel:notify", Translations[Config.Locale].notification_fueled_by_can)
end 

function FillUpViaPetrolCan(targetVehicle, checkForItem)
	local vehicle = targetVehicle or currentVehicle

	if DoesEntityExist(vehicle) then 
		if checkForItem and Config.OxInventory.Enabled then 
			if ESX ~= nil then 
				ESX.TriggerServerCallback('myFuel:hasPetrolCan', function(returndata)
					if returndata then 
						FillUpViaPetrolCanCallback(vehicle)
					else
						TriggerEvent("myFuel:notify", Translations[Config.Locale].notification_no_can)
					end 
				end)
			elseif QBCore ~= nil then 
				QBCore.Functions.TriggerCallback('myFuel:hasPetrolCan', function(returndata)
					if returndata then 
						FillUpViaPetrolCanCallback(vehicle)
					else
						TriggerEvent("myFuel:notify", Translations[Config.Locale].notification_no_can)
					end 
				end)
			end 
		else
			FillUpViaPetrolCanCallback(vehicle)
		end 

		
	end 
end 

function useItemCallback(itemData, gasStationData)

	if gasStationData.gas_station_has_owner == false then
		local jobFound = false 
		for i=1, #Config.FillingUpJobs.JobList do
			if Config.FillingUpJobs.JobList[i] == gasStationData.playerjob then
				jobFound = true
			end
		end

		if jobFound then 				
			TaskTurnPedToFaceEntity(PlayerPedId(),PlayerNearFuelPump,5000)
			LoadAnimDict("timetable@gardener@filling_can")
			TaskPlayAnim(PlayerPedId(),"timetable@gardener@filling_can","gar_ig_5_filling_can",2.0,8.0,-1,50,0,0,0,0)
			FreezeEntityPosition(PlayerPedId(), true)	
			Wait(itemData.Waittime)
			FreezeEntityPosition(PlayerPedId(), false)	
			removeAnimation()

			TriggerServerEvent(
				'myFuel:UpdateStock'
				,pumpLocation
				,itemData.fuel_to_fillup
				,itemData.item
				,itemData.label
				,itemData.fillupAmountPerItem
				,""
				,1
				,itemData.paymentForFillup
				,false
			)
		end 
	else
		TriggerEvent("myFuel:notify", Translations[Config.Locale].gas_station_cannot_fillup_owner)
	end 
end 


function showInfobar(msg)
	CurrentActionMsg  = msg
	SetTextComponentFormat('STRING')
	AddTextComponentString(CurrentActionMsg)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end


function AddTargets()
	RemoveTargets(false)

	local models = {}
	for k,v in pairs(Config.PumpModels) do 
		table.insert(models, k)
	end 

	
	if isUsingQBTarget then 
		exports['qb-target']:AddTargetModel(models, {
			options = {
				{
					num= 1,
					type = "client",
					icon = "fas fa-gas-pump", 
					label = Translations[Config.Locale].target_fill_vehicle, 
					action = function(entity)
						startFillingUp(entity)
					end,
					canInteract = function(entity, distance, data)
						return checkIfPlayerCanRefuelVehicle()
					end
				},
				{
					num= 2,
					type = "client", 
					icon = 'fas fa-oil-can', 
					label = Translations[Config.Locale].target_buy_jerry_can, 
					action = function(entity) 
						buyPetrolCan()
					end,
					canInteract = function(entity, distance, data)
						return checkIfPlayerCanBuyPetolCan()
					end
				},
				{
					num= 2,
					type = "client", 
					icon = 'fas fa-oil-can', 
					label = Translations[Config.Locale].target_fuelpump_nozzle_put_back, 
					action = function(entity) 
						returnNozzleToFuelpump(globalNozzleObject, globalRopeObject, true)
					end,
					canInteract = function(entity, distance, data)
						return globalNozzleObject ~= nil 
					end
				}
			},
			distance = 7.5,
		})

		exports["qb-target"]:AddGlobalVehicle({
			options = {
				{
					num= 1,
					type = "client",
					icon = "fas fa-gas-pump", 
					label = Translations[Config.Locale].target_fill_vehicle,
					action = function(entity)
						local vehData = getVehicleData(entity)

						local isBike, tankBone, nozzleDesinationPos = getTankBone(entity, vehData.fuelType)
						putNozzleInVehicle(globalNozzleObject,entity, tankBone, isBike, true, nozzleDesinationPos)			
						local isSocietyVeh, SocietyName = isSocietyVehicle(entity)
						openUI(pumpLocation, false, GetFuel(entity), vehData.maxCapacity, vehData.fuelType, isSocietyVeh, SocietyName)
					end,
					canInteract = function(entity, distance, data)
						return globalNozzleObject ~= nil
					end
				},
				{
					num= 2,
					type = "client", 
					icon = "fas fa-gas-pump", 
					label = Translations[Config.Locale].target_fill_vehicle_petrolcan,
					item = Config.OxInventory.Enabled and string.lower(Config.OxInventory.Itemname) or nil,
					action = function(entity) 
						FillUpViaPetrolCan(entity, false)
					end,
					canInteract = function(entity, distance, data)
						return globalNozzleObject == nil and checkIfPlayerCanRefuelVehicleViaPetrolCan(entity)
					end
				}
			},
			distance = 7.5,
		})

	elseif isUsingOXTarget then 
		exports["ox_target"]:addModel(models, {
			{
				distance = 2.5,
				onSelect = function(data)
					startFillingUp(data.entity)
				end,
				icon = "fas fa-gas-pump",
				label = Translations[Config.Locale].target_fill_vehicle,
				canInteract = function(entity)
					return checkIfPlayerCanRefuelVehicle() ~= nil
				end
			},
			{
				distance = 2.5,
				onSelect = function(data)
					buyPetrolCan()
				end,
				icon = "fas fa-oil-can",
				label = Translations[Config.Locale].target_buy_jerry_can,
				canInteract = function(entity, distance, data) -- This will check if you can interact with it, this won't show up if it returns false, this is OPTIONAL
					return checkIfPlayerCanBuyPetolCan()
				end
			},
			{
				distance = 2.5,
				onSelect = function(data)
					returnNozzleToFuelpump(globalNozzleObject, globalRopeObject, true)
				end,
				icon = "fas fa-oil-can",
				label = Translations[Config.Locale].target_fuelpump_nozzle_put_back,
				canInteract = function(entity, distance, data) -- This will check if you can interact with it, this won't show up if it returns false, this is OPTIONAL
					return globalNozzleObject ~= nil 
				end
			},
		})

		exports["ox_target"]:addGlobalVehicle({
			{
				distance = 2.5,
				onSelect = function(data)
					local vehData = getVehicleData(data.entity)
					
					local isBike, tankBone, nozzleDesinationPos = getTankBone(data.entity, vehData.fuelType)
					putNozzleInVehicle(globalNozzleObject,data.entity, tankBone, isBike, true, nozzleDesinationPos)			
					local isSocietyVeh, SocietyName = isSocietyVehicle(data.entity)
					openUI(pumpLocation, false, GetFuel(data.entity), vehData.maxCapacity, vehData.fuelType, isSocietyVeh, SocietyName)
				end,
				icon = "fas fa-gas-pump",
				label = Translations[Config.Locale].target_fill_vehicle,
				canInteract = function(entity)
					return globalNozzleObject ~= nil
				end
			},
			{
				distance = 2.5,
				onSelect = function(data)
					FillUpViaPetrolCan(data.entity, true)
				end,				
				icon = "fas fa-gas-pump",
				label = Translations[Config.Locale].target_fill_vehicle_petrolcan,
				canInteract = function(entity, distance, coords, name, bone)
					return globalNozzleObject == nil and checkIfPlayerCanRefuelVehicleViaPetrolCan(entity)
				end
			}
		})

	end 
end 


function RemoveTargets(isRestart)
	if isUsingQBTarget then 
		local models = {}
		for k,v in pairs(Config.PumpModels) do 
			exports['qb-target']:RemoveTargetModel(k, 'myFuel stoppped')
		end 
	elseif isUsingOXTarget then 
		local models = {}
		for k,v in pairs(Config.PumpModels) do 
			table.insert(models, k)
		end 
		exports['ox_target']:removeModel(models, 'myFuel stoppped')
	end 
end 

function addTargetToPeds()

	if isUsingOXTarget then 
		exports['ox_target']:addGlobalPed( -- The bones can be a string or a table
			{
				distance = 2.5,
				onSelect = function()
					handleGasStationInteraction()
				end,
				icon = "fas fa-gas-pump",
				label = Translations[Config.Locale].target_owner_menu,
				canInteract = function(entity)
					return isInAdminSpot
				end
			}
		)
	elseif isUsingQBTarget then 

		exports['qb-target']:AddGlobalPed({
			options = {	
				{
					num= 1,
					type = "client", -- This specifies the type of event the target has to trigger on click, this can be "client", "server", "command" or "qbcommand", this is OPTIONAL and will only work if the event is also specified
					icon = "fas fa-gas-pump", -- This is the icon that will display next to this trigger option
					label = Translations[Config.Locale].target_owner_menu, -- This is the label of this option which you would be able to click on to trigger everything, this has to be a string
					action = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
						handleGasStationInteraction()
					end,
					canInteract = function(entity, distance, data) -- This will check if you can interact with it, this won't show up if it returns false, this is OPTIONAL
						return isInAdminSpot
					end

				}
			},
			distance = 2.5
		})
	end 
end 