QBCore = exports['qb-core']:GetCoreObject()
local hasEntered = false
local capturing = false
local profileZones = {}

local function OpenProfileMenu(data)
	local formattedVehicles = {}
	if type(data.profiles) == 'table' then
		for k,v in pairs(data.profiles) do
			for i,d in pairs(v) do
				formattedVehicles[#formattedVehicles + 1] = {
					plate = data.props.plate,
					profileName = d
				}
			end
		end
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'ProfileList',
			garageLabel = 'Vehicle Profiles',
			vehicles = formattedVehicles,
		})
	else
		formattedVehicles[#formattedVehicles + 1] = {
			plate = data.props.plate,
			profileName = data.profiles
		}
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'ProfileList',
			garageLabel = 'Vehicle Profiles',
			vehicles = formattedVehicles,
		})
	end
end

local function startWatching()
		-- Retrieve the LocalPlayer.
	while hasEntered == true do
		local playerPed = PlayerPedId()
		local PlayerData =  QBCore.Functions.GetPlayerData()
		local src = PlayerData.source
		-- Retrieve the vehicle the player is currently in. 
		local vehicle = GetVehiclePedIsIn(playerPed, false)

		-- Check if the vehicle exists in the game world.
		-- if not DoesEntityExist(vehicle) then 
			-- If the vehicle does not exist, end the execution of the code here.
			-- return 
		-- end
		if vehicle ~= 0 then
			-- Print the vehicle id
			local VehModel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
			TriggerServerEvent('qb-log:server:CreateLog', 'militarywatch', PlayerData.name..' is stealing a vehicle from the DMZ', 'red', 
				'👨🏻Player: '..tostring(PlayerData.name)..
				'\n🎫CivID: '..tostring(PlayerData.citizenid)..
				'\n🎫FirstName: '..tostring(PlayerData.charinfo.firstname)..
				'\n🎫LastName: '..tostring(PlayerData.charinfo.lastname)..
				'\n🎫BirthDate: '..tostring(PlayerData.charinfo.birthdate)..
				'\n🎫Gender: '..tostring(PlayerData.charinfo.gender)..
				'\n🎫Nationality: '..tostring(PlayerData.charinfo.nationality)..
				'\n🛠Current Job: '..tostring(PlayerData.job.name)..
				'\n🚙Vehicle VehModel: '..tostring(VehModel)
			)
			Wait(5000)
		else
			Wait(1000)
		end
	end
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

local function CreateZone(index, garage)
    local zone = CircleZone:Create(garage.takeVehicle, 5.0, {
        name = garage.blipName,
        debugPoly = false,
        useZ = true,
        data = {
            indexgarage = index
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
        zone = CreateZone(index, garage)
		
        if zone then
            profileZones[#profileZones + 1] = zone
        end
    end

    local comboZone = ComboZone:Create(profileZones, { name = 'profileZone', debugPoly = false })

    comboZone:onPlayerInOut(function(isPointInside, _, zone)
        if isPointInside then
            listenForKey = true
            CreateThread(function()
                while listenForKey do
                    Wait(0)
                    if IsControlJustReleased(0, 38) then
                        if GetVehiclePedIsUsing(PlayerPedId()) ~= 0 then
							local playerPed = PlayerPedId()
							local vehicle = GetVehiclePedIsIn(playerPed, false)
							if not DoesEntityExist(vehicle) then 
								return 
							end
							local props = QBCore.Functions.GetVehicleProperties(vehicle)
							local plate = props.plate
							local player = QBCore.Functions.GetPlayerData()
							local cid = player.citizenid
							TriggerServerEvent('ns-cac:server:profileVehicle', cid, plate, json.encode(props))
                        end
                    end
                end
            end)

            local displayText = 'Vehicle Closet'
            exports['qb-core']:DrawText(displayText, 'Right')
        else
            listenForKey = false
            exports['qb-core']:HideText()
        end
    end)
end

CreateThread(function()
    -- Start with empty array (for ComboZone)
    local zones = {}

    for k, v in pairs(Config.WatchZones) do
        if v.box then -- BoxZone
            zones[#zones+1] = BoxZone:Create(v.coords, v.length, v.width, {
                name = "WatchZones"..k,
                minZ = v.minZ,
                maxZ = v.maxZ,
                debugPoly = false
            })
        else -- PolyZone
            zones[#zones+1] = PolyZone:Create(v.points, {
                name = "WatchZones"..k,
                minZ = v.minZ,
                maxZ = v.maxZ,
                debugGrid = false,
            })
        end
    end

    local watchCombo = ComboZone:Create(zones, {
        name = "watchCombo", 
        debugPoly = false
    })
	
    watchCombo:onPlayerInOut(function(isPointInside, point, zone)
        if isPointInside then
			local playerPed = PlayerPedId()
			local PlayerData =  QBCore.Functions.GetPlayerData()
			local src = PlayerData.source
			hasEntered = true
            exports['qb-core']:DrawText('You are in a watch Zone, you better be in RP or this may be your last rodeo', 'Right')
			TriggerServerEvent('qb-log:server:CreateLog', 'militarywatch', PlayerData.name..' has Entered the restricted area', 'yellow', 
				'👨🏻Player: '..tostring(PlayerData.name)..
				'\n🎫CivID: '..tostring(PlayerData.citizenid)..
				'\n🎫FirstName: '..tostring(PlayerData.charinfo.firstname)..
				'\n🎫LastName: '..tostring(PlayerData.charinfo.lastname)..
				'\n🎫BirthDate: '..tostring(PlayerData.charinfo.birthdate)..
				'\n🎫Gender: '..tostring(PlayerData.charinfo.gender)..
				'\n🎫Nationality: '..tostring(PlayerData.charinfo.nationality)..
				'\n🛠Current Job: '..tostring(PlayerData.job.name)
			)
        else
			local PlayerData =  QBCore.Functions.GetPlayerData()
			local playerPed = PlayerPedId()
			local src = PlayerData.source
            exports['qb-core']:HideText()
			if hasEntered then
				local vehicle = GetVehiclePedIsIn(playerPed, false)
				if vehicle ~= 0 then
					local VehModel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)) 
					if VehModel == 'RHINO' then 
						
						TriggerServerEvent('qb-log:server:CreateLog', 'anticheat', PlayerData.name..' has Left the restricted area **in a Tank**', 'red', 
							'👨🏻Player: '..tostring(PlayerData.name)..
							'\n🎫CivID: '..tostring(PlayerData.citizenid)..
							'\n🎫FirstName: '..tostring(PlayerData.charinfo.firstname)..
							'\n🎫LastName: '..tostring(PlayerData.charinfo.lastname)..
							'\n🎫BirthDate: '..tostring(PlayerData.charinfo.birthdate)..
							'\n🎫Gender: '..tostring(PlayerData.charinfo.gender)..
							'\n🎫Nationality: '..tostring(PlayerData.charinfo.nationality)..
							'\n🛠Current Job: '..tostring(PlayerData.job.name)..
							'\n🚙Current Vehicle: '..tostring(VehModel)
						)
						DeleteEntity(vehicle)
						Wait(1000)
						TriggerServerEvent('ns-customadmincommands:server:kickPlayerForExploit', src)
					end
				else
					TriggerServerEvent('qb-log:server:CreateLog', 'militarywatch', PlayerData.name..' has Left the restricted area', 'yellow', 
						'👨🏻Player: '..tostring(PlayerData.name)..
						'\n🎫CivID: '..tostring(PlayerData.citizenid)..
						'\n🎫FirstName: '..tostring(PlayerData.charinfo.firstname)..
						'\n🎫LastName: '..tostring(PlayerData.charinfo.lastname)..
						'\n🎫BirthDate: '..tostring(PlayerData.charinfo.birthdate)..
						'\n🎫Gender: '..tostring(PlayerData.charinfo.gender)..
						'\n🎫Nationality: '..tostring(PlayerData.charinfo.nationality)..
						'\n🛠Current Job: '..tostring(PlayerData.job.name)
					)
					hasEntered = false
				end
			end
        end
    end)
end)


CreateThread(function()
	local sleep = 5000
	while true do
		if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then 
			sleep = 2000
			local playerCoords = GetEntityCoords(PlayerPedId(), true)
			-- local vehicle = GetClosestVehicle(playerCoords.x,playerCoords.y,playerCoords.z, 10,0,0)
			local vehicle = GetVehiclePedIsUsing(PlayerPedId())
			local engineHealth = GetVehicleEngineHealth(vehicle)
			
			if engineHealth <= 300 then
				SetVehicleEngineOn(vehicle, false, false, true)
				-- SetVehicleEngineHealth(vehicle, -4000)
				QBCore.Functions.Notify('This vehicle is broken beyond functional', 'warning')
				TaskEveryoneLeaveVehicle(vehicle)
				TaskLeaveVehicle(PlayerPedId(),vehicle, 4160)
			end
		else
			sleep = 5000
		end
	Wait(sleep)
	end
end)


RegisterNetEvent('NSCAC:client:buyShowroomVehicle', function(vehicle, plate)
	local pos = GetEntityCoords(PlayerPedId(), true)
    QBCore.Functions.TriggerCallback('QBCore:Server:SpawnVehicle', function(netId)
		local pos = GetEntityCoords(PlayerPedId(), true)
		local heading = GetEntityHeading(PlayerPedId())
		local myVector4 = vector4(pos,heading)
        local veh = NetToVeh(netId)
        exports['myFuel']:SetFuel(veh, 100)
        SetVehicleNumberPlateText(veh, plate)
        SetEntityHeading(veh, heading)
        TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(veh))
        TriggerServerEvent('qb-mechanicjob:server:SaveVehicleProps', QBCore.Functions.GetVehicleProperties(veh))
    end, vehicle, myVector4, true)
end)

RegisterNetEvent('NSCAC:client:setCapture', function()
	local src = source
	if not capturing then
		capturing = true
	else
		exports['qb-core']:HideText()
		capturing = false
	end
	local listofVectors = {}
	while capturing do
        exports['qb-core']:DrawText('Press "E" to Capture location', 'right')
		if IsControlJustPressed(0, 38) then
			exports['qb-core']:KeyPressed()
			exports['qb-core']:HideText()
			local v3 = GetEntityCoords(PlayerPedId())
			local h = GetEntityHeading(PlayerPedId())
			local myVector4 = vector4(v3, h)
			listofVectors[#listofVectors+1] = myVector4
		end
		Wait(0)
	end
end)

RegisterNetEvent('ns-cac:client:test', function()
	local playerPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)

end)

RegisterNetEvent('ns-cac:client:savethis', function(profile)
	
	local playerPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	if not DoesEntityExist(vehicle) then 
		return 
	end

	local props = QBCore.Functions.GetVehicleProperties(vehicle)
	local plate = props.plate
	local player = QBCore.Functions.GetPlayerData()
	local cid = player.citizenid
	
	local dialog = exports['qb-input']:ShowInput({
		header = 'New Profile',
		submitText = 'Submit',
		inputs = {
			{
				text = 'Name of Profile',
				name = "savename",
				type = "text",
				isRequired = true,
				default = profile,
			}
		}
	})
	if not dialog or not next(dialog) then return end
	local inputData = dialog
	local profile = inputData.savename
	TriggerServerEvent('ns-cac:server:savevehicleproperties', cid, plate, json.encode(props), profile)
	
end)

RegisterNetEvent('ns-cac:client:profileThis', function()
	
	local playerPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	if not DoesEntityExist(vehicle) then 
		return 
	end
	local props = QBCore.Functions.GetVehicleProperties(vehicle)
	local plate = props.plate
	local player = QBCore.Functions.GetPlayerData()
	local cid = player.citizenid
	TriggerServerEvent('ns-cac:server:profileVehicle', cid, plate, json.encode(props))
	
end)

RegisterNetEvent('ns-cac:client:profileVehicleEnd', function(profiles)
	local playerPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	local props = QBCore.Functions.GetVehicleProperties(vehicle)
	local data = {profiles ={}, props={}}
	data.profiles = profiles
	data.props = props
	OpenProfileMenu(data)
	
end)

RegisterNetEvent('ns-cac:client:restorethis', function(profile)
	
	local playerPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	if not DoesEntityExist(vehicle) then 
		return 
	end
	local profileName = profile
	local player = QBCore.Functions.GetPlayerData()
	local cid = player.citizenid
	local props = QBCore.Functions.GetVehicleProperties(vehicle)
	local plate = props.plate
	TriggerServerEvent('ns-cac:server:restorevehicleproperties', cid, plate, profileName)
	
end)


-- NUI Callbacks

RegisterNUICallback('closeGarage', function(_, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback('selectProfile', function(data, cb)
    SetNuiFocus(false, false)
	local playerPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	if not DoesEntityExist(vehicle) then 
		return 
	end
	local profileName = data.profile
	local player = QBCore.Functions.GetPlayerData()
	local cid = player.citizenid
	local plate = data.plate
	TriggerServerEvent('ns-cac:server:restorevehicleproperties', cid, plate, profileName)
    cb('ok')
end)

RegisterNUICallback('deleteProfile', function(data, cb)
    SetNuiFocus(false, false)
	local playerPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	if not DoesEntityExist(vehicle) then 
		return 
	end
	local profileName = data.profile
	local player = QBCore.Functions.GetPlayerData()
	local cid = player.citizenid
	local plate = data.plate
	TriggerServerEvent('ns-cac:server:deleteVehicleprofile', cid, plate, profileName)
    cb('ok')
end)

RegisterNUICallback('saveNewProfile', function(data, cb)
    SetNuiFocus(false, false)
	local playerPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	if not DoesEntityExist(vehicle) then 
		return 
	end
	local player = QBCore.Functions.GetPlayerData()
	local cid = player.citizenid
	local props = QBCore.Functions.GetVehicleProperties(vehicle)
	local plate = props.plate
	local profileName = tostring(plate)..'-'..tostring(data.counts)
	
	TriggerEvent('ns-cac:client:savethis', profileName)
    cb('ok')
end)

RegisterNUICallback('updateProfile', function(data, cb)
    SetNuiFocus(false, false)
	local playerPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	if not DoesEntityExist(vehicle) then 
		return 
	end
	local profileName = data.profile
	local player = QBCore.Functions.GetPlayerData()
	local cid = player.citizenid
	local plate = data.plate
	TriggerEvent('ns-cac:client:savethis', profileName)
    cb('ok')
end)

-- NET Events

RegisterNetEvent('ns-cac:client:restorethisend', function(props)
	
	local playerPed = PlayerPedId()
	local veh = GetVehiclePedIsIn(playerPed, false)
	local properties = props
	
	QBCore.Functions.SetVehicleProperties(veh, properties)

	
end)

RegisterNetEvent('NSCAC:client:setwantedlevel', function(targetPlayer, level)

	SetPlayerWantedLevel(targetPlayer, level)
	
end)


RegisterNetEvent('NS-Wantedhandler:client:addStars', function(targetPlayer, level, message)
	
	SetPlayerWantedLevel(targetPlayer, level)
	if not message then
		message = 'You are now Wanted'
	end
	TriggerServerEvent('NS-Wantedhandler:server:addStars', targetPlayer, message)
    
end)


RegisterNetEvent('NS-Wantedhandler:client:resetAllStars', function()
	local src = QBCore.Functions.GetPlayerData().source
	local level = 0
	SetPlayerWantedLevel(src, level)
    QBCore.Functions.Notify('This has been a test of the emergency note system', 'success')
    
end)

RegisterNetEvent('NS-Wantedhandler:client:setAllStars', function(stars)
	local src = QBCore.Functions.GetPlayerData().source
	local level = stars
	SetPlayerWantedLevel(src, tonumber(level))
	SetMaxWantedLevel(src, tonumber(level))
    QBCore.Functions.Notify('This has been a test of the wanted system, your max star level is now '..tostring(level), 'success')
    
end)


RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    local playerJob = JobInfo
	local PlayerData = QBCore.Functions.GetPlayerData()
	TriggerServerEvent('qb-log:server:CreateLog', 'qbjobs', 'Job Update', 'red', 
		'👨🏻Player: '..tostring(PlayerData.name)..
		'\n🎫CivID: '..tostring(PlayerData.citizenid)..
		'\n💰Bank: $'..tostring(PlayerData.money.bank)..
		'\n💸Cash: $'..tostring(PlayerData.money.cash)..
		'\n🧰JobChangedTo: '..tostring(playerJob.label)..
		'\n🔢Rank: '..tostring(playerJob.grade.level)
		
	)
end)


AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	local player = QBCore.Functions.GetPlayerData()
	local v = player.source
	TriggerServerEvent('NSCAC:server:logonload', v, player)
    CreateBlipsZones()
	CreateThread(function()
		local bancount = 0
		while true do
			Wait(15000)
			local player = QBCore.Functions.GetPlayerData()
			local src = player.source
			if not player or not src then return end
			if QBCore.Functions.HasItem('zipties', 11) then
				QBCore.Functions.Notify('You are holding too many ZipTies. 10 or less or you will be kicked for exploit', 'error')
				bancount = bancount + 1
				QBCore.Functions.Notify('You are attempting an exploit and will be banned if you continue.', 'error')
				if bancount >= 3 then
					local reason = 'Attempted Exploit of Zipties carry amount'
					TriggerServerEvent('qb-log:server:CreateLog', 'bans', 'Player Kicked', 'red', string.format('%s was kicked by %s for %s', GetPlayerName(src), 'ACS', reason), true)
					TriggerServerEvent('nscac:server:drop', reason)
					bancount = 0
				end
			else
				bancount = 0
			end
		end
	end)
end)

AddEventHandler('onResourceStart', function(res)
    if res ~= GetCurrentResourceName() then return end
    CreateBlipsZones()
end)