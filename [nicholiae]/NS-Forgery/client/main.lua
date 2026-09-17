local QBCore = exports['qb-core']:GetCoreObject()
local inside = false
local isInside = false
local insideAgain = false
local isInsideAgain = false
local isInsideAgainAgain = false
local gotDocs = false
local gotDocsAgain = false
local StartedCarChase = false
local policePed
local uncuffPed
local JailVeh 
local JailGetAwayVeh 
local CurrentCops = 0
local goToPlayerCount = 0

FreezeEntityPosition(PlayerPedId(), false)
DoScreenFadeIn(2000)

ForgeryHeist = {
    ['heistPeds'] = {}

}
ForgeryHeistAgain = {
    ['heistPeds'] = {}

}
ForgeryCrazyPeds = {
    ['heistPeds'] = {}

}
ForgeryPoliceHeist = {
    ['heistPeds'] = {}
}

RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

-- Functions


local function MakeCraziesAroundHostile()

	local nearby = GetGamePool('CPed')
	for key,value in pairs(nearby) do
		if not IsPedAPlayer(value) and not IsEntityDead(value) then
			if not IsPedArmed(value, 1|2|4) then
				local randomNum = math.random(1,#Config.CrazyPedWeapon)
				GiveWeaponToPed(value, Config.CrazyPedWeapon[randomNum],450,false,true)
				SetPedArmour(value, Config.PedArmor)
				SetCanAttackFriendly(value,false,false)
				SetPedFleeAttributes(value, 0, true)
				SetPedCombatAttributes(value, 46, true)
				SetPedAccuracy(value, 40)
				SetPedCombatAbility(value, 1)
				SetPedCombatMovement(value, 3)
				SetPedCombatRange(value, 0)
				SetPedDropsWeaponsWhenDead(value,false)
				TaskCombatPed(value, PlayerPedId(), 0, 16)
				SetPedKeepTask(value, true)
				SetBlockingOfNonTemporaryEvents(value, true)
			end
		end
	end
end

local function DeleteFirstEntry()

	DeleteEntity(policePed)
	
end
local function CleanUp()
	if DoesEntityExist(policePed) then
		DeleteEntity(policePed)
	end
	if DoesEntityExist(JailVeh) then
		DeleteEntity(JailVeh)
	end
	if DoesEntityExist(JailGetAwayVeh) then
		DeleteEntity(JailGetAwayVeh)
	end
	if DoesEntityExist(uncuffPed) then
		DeleteEntity(uncuffPed)
	end
	SetMaxWantedLevel(5)
	inside = false
	isInside = false
	insideAgain = false
	isInsideAgain = false
	isInsideAgainAgain = false
	gotDocs = false
	gotDocsAgain = false
	StartedCarChase = false
end

local function loadModel(model)
    if type(model) == 'number' then
        model = model
    else
        model = GetHashKey(model)
    end
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
end

local function alertCops()
	TriggerServerEvent('police:server:policeAlert', "Someone is Escaping Prison!")
	local player = PlayerPedId()
	local pid = GetPlayerServerId(NetworkGetPlayerIndexFromPed(player))
	-- QBCore.Functions.Notify(pid..' player id', 'error')
	local level = 5
	local message = "You are now a Fugitive"
	TriggerServerEvent('NS-Wantedhandler:server:addStars', pid, level, message)
end

local function DrawText3Ds(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    BeginTextCommandDisplayText('STRING')
    SetTextCentre(true)
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(x, y, z, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local function loadAnimDict(dict)
    RequestAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do Wait(5) end
end

local function openStoreAnim()
    loadAnimDict('anim@heists@keycard@')
    TaskPlayAnim(PlayerPedId(), 'anim@heists@keycard@', 'exit', 5.0, 1.0, -1, 16, 0, 0, 0, 0)
    Wait(400)
    ClearPedTasks(PlayerPedId())
end

local function TeleportPlayer(x,y,z,w,fin,fout)
	if fout then
		DoScreenFadeOut(2000)
		while not IsScreenFadedOut() do
			DoScreenFadeOut(500)
			Citizen.Wait(1000)
		end
	end
    local ped = PlayerPedId()
    SetEntityCoords(ped, x,y,z)
    SetEntityHeading(ped, w)
	Wait(1000)
	if fout or fin then
		DoScreenFadeIn(2000)
	end
end

local function GetCuffedAnimation(playerId)
    local ped = PlayerPedId()
    local cuffer = GetPlayerPed(GetPlayerFromServerId(playerId))
    local heading = GetEntityHeading(cuffer)
    TriggerServerEvent('InteractSound_SV:PlayOnSource', 'Cuff', 0.2)
    loadAnimDict('mp_arrest_paired')
    SetEntityCoords(ped, GetOffsetFromEntityInWorldCoords(cuffer, 0.0, 0.45, 0.0))

    Wait(100)
    SetEntityHeading(ped, heading)
    TaskPlayAnim(ped, 'mp_arrest_paired', 'crook_p2_back_right', 3.0, 3.0, -1, 32, 0, 0, 0, 0, true, true, true)
    Wait(2500)
end

local function CreateJailScene()
	local ped = PlayerPedId()

    SetPedRelationshipGroupHash(ped, GetHashKey('PLAYER'))
	if not DoesRelationshipGroupExist(GetHashKey('ForgeryPolicePeds')) then
		
		AddRelationshipGroup('ForgeryPolicePeds')

	end
    for k, v in pairs(Config.JailPeds.PedConfig) do
        loadModel(v['ped'])
        ForgeryPoliceHeist['heistPeds'][k] = CreatePed(26, GetHashKey(v['ped']), v['pos'], v['heading'], true, true)
		if DoesRelationshipGroupExist(GetHashKey('ForgeryPolicePeds')) then
			NetworkRegisterEntityAsNetworked(ForgeryPoliceHeist['heistPeds'][k])
			networkID = NetworkGetNetworkIdFromEntity(ForgeryPoliceHeist['heistPeds'][k])
			while networkID == 0 do
				NetworkRegisterEntityAsNetworked(ForgeryPoliceHeist['heistPeds'][k])
				networkID = NetworkGetNetworkIdFromEntity(ForgeryPoliceHeist['heistPeds'][k])
				Wait(500)
			end	
			SetNetworkIdCanMigrate(networkID, true)
			SetNetworkIdExistsOnAllMachines(networkID, true)
			SetEntityAsMissionEntity(ForgeryPoliceHeist['heistPeds'][k])
			SetPedRelationshipGroupHash(ForgeryPoliceHeist['heistPeds'][k], GetHashKey("ForgeryPolicePeds"))
			SetEntityVisible(ForgeryPoliceHeist['heistPeds'][k], true)
			SetPedRandomComponentVariation(ForgeryPoliceHeist['heistPeds'][k], 0)
			SetPedRandomProps(ForgeryPoliceHeist['heistPeds'][k])
			GiveWeaponToPed(ForgeryPoliceHeist['heistPeds'][k], GetHashKey('weapon_assaultsmg'), 255, false, false)
			SetPedAccuracy(ForgeryPoliceHeist['heistPeds'][k], 25)
			SetPedArmour(ForgeryPoliceHeist['heistPeds'][k], 200)
			SetPedCanSwitchWeapon(ForgeryPoliceHeist['heistPeds'][k], false)
			SetPedDropsWeaponsWhenDead(ForgeryPoliceHeist['heistPeds'][k], false)
			SetPedFleeAttributes(ForgeryPoliceHeist['heistPeds'][k], 0, false)
			
			loadAnimDict('missfbi_s4mop')
			TaskPlayAnim(ped, 'missfbi_s4mop', 'lobby_security_guard', 8.0, 8.0, -1, 50, 0, 0, 0, 0)
			
			-- end
			SetBlockingOfNonTemporaryEvents(ForgeryPoliceHeist['heistPeds'][k], true)
			
		else
			print("no relationship group exists")
		end
    end

    SetRelationshipBetweenGroups(0, GetHashKey("ForgeryPolicePeds"), GetHashKey("ForgeryPolicePeds"))
    SetRelationshipBetweenGroups(0, GetHashKey("COP"), GetHashKey("ForgeryPolicePeds"))
    SetRelationshipBetweenGroups(0, GetHashKey("ForgeryPolicePeds"), GetHashKey("COP"))
	SetRelationshipBetweenGroups(4, GetHashKey("ForgeryPolicePeds"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(4, GetHashKey("PLAYER"), GetHashKey("ForgeryPolicePeds"))
end


local function MissionNotification()
	Wait(2000)
	TriggerServerEvent('qb-phone:server:sendNewMail', {
		sender = "A Friend you Need",
		subject = "You Owe Me One",
		message = "You dont know me, but I know you. Get to these coordinates and maybe you will live long enough to meet me.",
	})
end

local function SpawnCrazyTown()
    local ped = PlayerPedId()
	StartedCarChase = false
	SetPlayerWantedLevel(ped,0)
	SetMaxWantedLevel(0)
	
    SetPedRelationshipGroupHash(ped, GetHashKey('PLAYER'))
    AddRelationshipGroup('CrazyPeds')

    for k, v in pairs(Config.CrazyPeds.PedConfig) do
        loadModel(v['ped'])
        ForgeryCrazyPeds['heistPeds'][k] = CreatePed(26, GetHashKey(v['ped']), v['pos'], v['heading'], true, true)
		if DoesRelationshipGroupExist(GetHashKey('CrazyPeds')) then
			NetworkRegisterEntityAsNetworked(ForgeryCrazyPeds['heistPeds'][k])
			networkID = NetworkGetNetworkIdFromEntity(ForgeryCrazyPeds['heistPeds'][k])
			while networkID == 0 do
				NetworkRegisterEntityAsNetworked(ForgeryCrazyPeds['heistPeds'][k])
				networkID = NetworkGetNetworkIdFromEntity(ForgeryCrazyPeds['heistPeds'][k])
				Wait(500)
			end	
			SetNetworkIdCanMigrate(networkID, true)
			SetNetworkIdExistsOnAllMachines(networkID, true)
			SetEntityAsMissionEntity(ForgeryCrazyPeds['heistPeds'][k])
			SetPedRelationshipGroupHash(ForgeryCrazyPeds['heistPeds'][k], GetHashKey("CrazyPeds"))
			SetEntityVisible(ForgeryCrazyPeds['heistPeds'][k], true)
			SetPedRandomComponentVariation(ForgeryCrazyPeds['heistPeds'][k], 0)
			SetPedRandomProps(ForgeryCrazyPeds['heistPeds'][k])
			loadAnimDict('friends@frj@ig_1')
			TaskPlayAnim(ForgeryCrazyPeds['heistPeds'][k], 'friends@frj@ig_1', 'wave_c', 8.0, 8.0, -1, 50, 0, 0, 0, 0)
			SetBlockingOfNonTemporaryEvents(ForgeryCrazyPeds['heistPeds'][k], true)
			
			GiveWeaponToPed(ForgeryCrazyPeds['heistPeds'][k], GetHashKey('weapon_stone_hatchet'), 255, false, false)
			SetPedAccuracy(ForgeryCrazyPeds['heistPeds'][k], 100)
			SetPedArmour(ForgeryCrazyPeds['heistPeds'][k], 200)
			SetPedCanSwitchWeapon(ForgeryCrazyPeds['heistPeds'][k], false)
			SetPedDropsWeaponsWhenDead(ForgeryCrazyPeds['heistPeds'][k], false)
			SetPedFleeAttributes(ForgeryCrazyPeds['heistPeds'][k], 0, false)
		
		else
			print("no relationship group exists")
		end
    end
    SetRelationshipBetweenGroups(0, GetHashKey("CrazyPeds"), GetHashKey("CrazyPeds"))
	SetRelationshipBetweenGroups(5, GetHashKey("CrazyPeds"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("CrazyPeds"))
	
	local playerPos = GetEntityCoords(ped)
	local dist = #(playerPos - vector3(-1166.65, 4925.76, 223.01))
	while dist >= 10 do
		SetNewWaypoint(-1166.65, 4925.76)
		local sleep = 1
		playerPos = GetEntityCoords(ped)
		dist = #(playerPos - vector3(-1166.65, 4925.76, 223.01))
		if dist <= 10 then
		
			for i = 1, #ForgeryCrazyPeds['heistPeds'] do

				TaskCombatPed(ForgeryCrazyPeds['heistPeds'][i], ped, 0, 16)
				SetPedKeepTask(ForgeryCrazyPeds['heistPeds'][i], true)
				SetBlockingOfNonTemporaryEvents(ForgeryCrazyPeds['heistPeds'][i], true)
				
			end
			sleep = 500
			MakeCraziesAroundHostile()
			break
		end
		Wait(sleep)
	end
	Wait(sleep)
	QBCore.Functions.Notify('This place is Crazy! Kill em All before they kill you!', 'warning')
	SetMaxWantedLevel(0)
	SetPlayerWantedLevel(ped,0)
	SetNewWaypoint(-1000.97, 4853.33)
	
	
end

local function TriggerGaurds()

	for i = 1, #ForgeryPoliceHeist['heistPeds'] do

		TaskCombatPed(ForgeryPoliceHeist['heistPeds'][i], ped, 0, 16)
		SetPedKeepTask(ForgeryPoliceHeist['heistPeds'][i], true)
		SetBlockingOfNonTemporaryEvents(ForgeryPoliceHeist['heistPeds'][i], true)
		
	end
end

local function initiateCarChase()
	
    local ped = PlayerPedId()
	if IsPedInVehicle(ped, JailVeh, false) then
		Wait(5000)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(JailVeh))
		SetVehicleEngineOn(JailVeh, true, true, false)
		QBCore.Functions.Notify('You Got away Clean, end of mission.', 'success')
		local x = 1666.75
		local y = -62.45
		local z = 174.17
		local w = 260.48
		local fin = true
		local fout = false
		DoScreenFadeOut(2000)
		Wait(2000)
		CleanUp()
		Wait(500)
		TeleportPlayer(x,y,z,w,fin,fout)
	elseif IsPedInVehicle(ped, JailGetAwayVeh, false) then
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(JailGetAwayVeh))
		SetVehicleEngineOn(JailGetAwayVeh, true, true, false)
		MissionNotification()
		SetNewWaypoint(-1105.94, 4920.46)
		StartedCarChase = true
		local sleep = 1
		alertCops()
		while StartedCarChase do
			SetMaxWantedLevel(5)
			SetPlayerWantedLevel(ped,5)
			TriggerGaurds()
			local playerPos = GetEntityCoords(ped)
			local dist = #(playerPos - vector3(-1167.47, 4926.52, 223.07))
			if dist < 50 then
				sleep = 500
				SpawnCrazyTown()
				-- break
			end
			Wait(sleep)
		end
	end
end

local function TriggerTheFever()

	gotDocsAgain = true
	isInsideAgainAgain = true
	isInsideAgain = false
	
	
    local ped = PlayerPedId()
	
    SetPedRelationshipGroupHash(ped, GetHashKey('PLAYER'))
	if not DoesRelationshipGroupExist(GetHashKey('ForgeryPeds')) then
	
		AddRelationshipGroup('ForgeryPeds')
		
	end
	
	for i = 1, #ForgeryHeistAgain['heistPeds'] do
		if not IsEntityDead(ForgeryHeistAgain['heistPeds'][i]) then
			GiveWeaponToPed(policePed, GetHashKey('weapon_pistol'), 255, false, false)
			SetPedAccuracy(policePed, 1)
			SetPedArmour(policePed, 200)
			SetPedCanSwitchWeapon(policePed, true)
			SetPedDropsWeaponsWhenDead(policePed, false)
			SetPedFleeAttributes(policePed, 0, false)
			
			SetRelationshipBetweenGroups(5, GetHashKey("ForgeryPeds"), GetHashKey("PLAYER"))
			SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("ForgeryPeds"))
			
			TaskCombatPed(policePed, ForgeryHeistAgain['heistPeds'][i], 0, 16)
			SetPedKeepTask(policePed, true)
			SetBlockingOfNonTemporaryEvents(policePed, true)
			Wait(200)
		end
	end
		
end

local function TriggerThePolice()
    -- DoScreenFadeOut(1000)
    -- while not IsScreenFadedOut() do
        -- Citizen.Wait(50)
    -- end
	gotDocs = true
	if Config.MyDebug then
		print("Trigger Police Start")
	end
	TriggerServerEvent('NS-ForgeryHeist:server:GivePlayerForgedDocuments')
	
    local ped = PlayerPedId()
	
    SetPedRelationshipGroupHash(ped, GetHashKey('PLAYER'))
    AddRelationshipGroup('ForgeryPolicePeds')
	
	if Config.MyDebug then
		print("Trigger Police after AddRelationshipGroup")
		print(Config.ForgeryPolicePeds.PedConfig[1]['ped'])
	end
	
	loadModel(Config.ForgeryPolicePeds.PedConfig[1]['ped'])
	-- ForgeryPoliceHeist['heistPolicePeds'][1] = CreatePed(26, GetHashKey(Config.ForgeryPolicePeds.PedConfig['ped']), Config.ForgeryPolicePeds.PedConfig['pos'], Config.ForgeryPolicePeds.PedConfig['heading'], true, true)
	if Config.MyDebug then
		print("Trigger Police after loadModel")
	end
	
	policePed = CreatePed(26, GetHashKey(Config.ForgeryPolicePeds.PedConfig[1]['ped']), Config.ForgeryPolicePeds.PedConfig[1]['pos'], Config.ForgeryPolicePeds.PedConfig[1]['heading'], true, true)
	
	if Config.MyDebug then
		print("Trigger Police Before While Loop")
	end
	
	while not DoesEntityExist(policePed) do
		Wait(1000)
		policePed = CreatePed(26, GetHashKey(Config.ForgeryPolicePeds.PedConfig[1]['ped']), Config.ForgeryPolicePeds.PedConfig[1]['pos'], Config.ForgeryPolicePeds.PedConfig[1]['heading'], true, true)
		if Config.MyDebug then
			print("Attempting Creation of PolicePed")
			print(Config.ForgeryPolicePeds.PedConfig[1]['ped'])
			print(Config.ForgeryPolicePeds.PedConfig[1]['pos'])
			print(Config.ForgeryPolicePeds.PedConfig[1]['heading'])
			print(DoesRelationshipGroupExist(GetHashKey('ForgeryPolicePeds')))
		end
	end
	if Config.MyDebug then
		print("Police should be triggered")
	end
	if DoesRelationshipGroupExist(GetHashKey('ForgeryPolicePeds')) then
		NetworkRegisterEntityAsNetworked(policePed)
		networkID = NetworkGetNetworkIdFromEntity(policePed)
		
		if Config.MyDebug then
			print("Police In if")
		end
		
		while networkID == 0 do
			NetworkRegisterEntityAsNetworked(policePed)
			networkID = NetworkGetNetworkIdFromEntity(policePed)
			Wait(500)
		end	
		SetNetworkIdCanMigrate(networkID, true)
		SetNetworkIdExistsOnAllMachines(networkID, true)
		SetEntityAsMissionEntity(policePed)
		SetPedRelationshipGroupHash(policePed, GetHashKey("ForgeryPolicePeds"))
		SetEntityVisible(policePed, true)
		SetPedRandomComponentVariation(policePed, 0)
		SetPedRandomProps(policePed)
		GiveWeaponToPed(policePed, GetHashKey('weapon_assaultsmg'), 255, false, false)
		SetPedAccuracy(policePed, 100)
		SetPedArmour(policePed, 200)
		SetPedCanSwitchWeapon(policePed, true)
		SetPedDropsWeaponsWhenDead(policePed, false)
		SetPedFleeAttributes(policePed, 0, false)
		
		SetRelationshipBetweenGroups(0, GetHashKey("ForgeryPolicePeds"), GetHashKey("ForgeryPolicePeds"))
		SetRelationshipBetweenGroups(5, GetHashKey("ForgeryPolicePeds"), GetHashKey("ForgeryPeds"))
		SetRelationshipBetweenGroups(0, GetHashKey("ForgeryPolicePeds"), GetHashKey("PLAYER"))
		SetRelationshipBetweenGroups(0, GetHashKey("PLAYER"), GetHashKey("ForgeryPolicePeds"))
		
		loadAnimDict('missminuteman_1ig_2')
		TaskPlayAnim(ped, 'missminuteman_1ig_2', 'handsup_enter', 8.0, 8.0, -1, 50, 0, 0, 0, 0)
		SetEntityHeading(ped, 267.12)
		Wait(1000)
		FreezeEntityPosition(ped, true)
	
		for i = 1, #ForgeryHeist['heistPeds'] do
			if Config.MyDebug then
				print("Police In For")
			end
			
			loadAnimDict('missminuteman_1ig_2')
			TaskPlayAnim(ped, 'missminuteman_1ig_2', 'handsup_enter', 8.0, 8.0, -1, 50, 0, 0, 0, 0)
			while not IsEntityDead(ForgeryHeist['heistPeds'][i]) do
			
				loadAnimDict('missminuteman_1ig_2')
				TaskPlayAnim(ped, 'missminuteman_1ig_2', 'handsup_enter', 8.0, 8.0, -1, 50, 0, 0, 0, 0)
				TaskCombatPed(policePed, ForgeryHeist['heistPeds'][i], 0, 16)
				SetPedKeepTask(policePed, true)
				SetBlockingOfNonTemporaryEvents(policePed, true)
				Wait(5000)
			end
		end
		
	else
		print("no relationship group exists")
	end
	
	ClearPedTasks(policePed)
	Wait(1000)
    local ped = PlayerPedId()
	TaskGoToEntityWhileAimingAtEntity(policePed, ped, ped, 1, false,0.0,0.0,0,0,0)
	local PlayerPos = GetEntityCoords(ped)
	local PedPos = GetEntityCoords(policePed)
	local dist = #(PlayerPos - PedPos)
	local oldDist = 0
	while dist > 2.5 do
	
		PedPos = GetEntityCoords(policePed)
		PlayerPos = GetEntityCoords(ped)
		dist = #(PlayerPos - PedPos)
		if oldDist == dist then
			ClearPedTasks(policePed)
			FreezeEntityPosition(policePed, false)
			SetBlockingOfNonTemporaryEvents(policePed, false)
			Wait(1000)
			TaskGoToEntityWhileAimingAtEntity(policePed, ped, ped, 1, false,0.0,0.0,0,0,0)
			-- TaskGoToCoordAnyMeans(policePed, ped, 2, 0, false,false,false)
			SetPedKeepTask(policePed, true)
			SetBlockingOfNonTemporaryEvents(policePed, true)
			Wait(2500)
			goToPlayerCount = goToPlayerCount + 1
			if goToPlayerCount >= 3 then
			
				SetEntityCoords(policePed, GetEntityCoords(PlayerPedId()))
				
			end
		end
		if dist > 2.5 then
			oldDist = dist
			
		end
		if Config.MyDebug then
			print("Police GO TO Player")
			print(dist)
		end
		TaskGoToEntityWhileAimingAtEntity(policePed, ped, ped, 1, false,0.0,0.0,0,0,0)
		Wait(50)
	end
	if dist <= 2.5 then
	
		local playerId = GetPlayerServerId(ped)
		-- TriggerServerEvent('police:server:CuffPlayer', playerId, true)
		GetCuffedAnimation(playerId)
		Wait(500)
		local x = Config.Jail.x
		local y = Config.Jail.y
		local z = Config.Jail.z
		local w = Config.Jail.w
		DoScreenFadeOut(2000)
		local fin = true
		local fout = false
		Wait(500)
		CreateJailScene()
		Wait(500)
		TeleportPlayer(x,y,z,w,fin,fout)
		Wait(500)
		DeleteFirstEntry()
		Wait(500)
		loadModel(Config.JailBus)
		JailVeh = CreateVehicle(Config.JailBus, Config.BusJail.x, Config.BusJail.y, Config.BusJail.z, Config.BusJail.w, true, true)
		Wait(500)
		loadModel(Config.JailGetAwayVeh)
		JailGetAwayVeh = CreateVehicle(Config.JailGetAwayVeh, Config.JailGetAwayLoc.x, Config.JailGetAwayLoc.y, Config.JailGetAwayLoc.z, Config.JailGetAwayLoc.w, true, true)
		Wait(1000)
		TaskGoToCoordAnyMeans(ForgeryPoliceHeist['heistPeds'][4],GetEntityCoords(ped), 1.0,0,false,0,0)
		Wait(1000)
		FreezeEntityPosition(ped, false)
		TaskGoToCoordAnyMeans(ForgeryPoliceHeist['heistPeds'][1],1854.68, 2586.12, 45.67, 1.0,0,false,0,0)
		
		local PedPos = GetEntityCoords(ped)
		uncuffPed = GetEntityCoords(ForgeryPoliceHeist['heistPeds'][4])
		PoPed = GetEntityCoords(ForgeryPoliceHeist['heistPeds'][1])
		local playerDist = #(vector3(1853.6, 2608.38, 45.67) - PedPos)
		local uncuffDist = #(PedPos - uncuffPed)
		local isPlayerUncuffed = false
	
		while not IsPedInAnyVehicle(PlayerPedId(), false) do
			PedPos = GetEntityCoords(ped)
			uncuffPed = GetEntityCoords(ForgeryPoliceHeist['heistPeds'][4])
			PoPed = GetEntityCoords(ForgeryPoliceHeist['heistPeds'][1])
			uncuffDist = #(PedPos - uncuffPed)
			pedDist = #(PoPed - vector3(1854.68, 2586.12, 45.67))
			playerDist = #(vector3(1853.6, 2608.38, 45.67) - PedPos)
			
			if Config.MyDebug then
				print("pedDist")
				print(pedDist)
				print("uncuffDist")
				print(uncuffDist)
				print("playerDist")
				print(playerDist)
			end
			-- if playerDist >= 2.0 then
				-- break
			-- end
			if uncuffDist <= 0.75 then
				
				local playerId = GetPlayerServerId(ped)
				-- TriggerServerEvent('police:server:CuffPlayer', playerId, true)
				if not isPlayerUncuffed then
					TriggerServerEvent('police:server:SetHandcuffStatus', false)
					ClearPedTasksImmediately(ped)
					TriggerServerEvent('InteractSound_SV:PlayOnSource', 'Uncuff', 0.2)
					Wait(250)
					ClearPedTasksImmediately(ForgeryPoliceHeist['heistPeds'][4])
					Wait(250)
					TaskEnterVehicle(ForgeryPoliceHeist['heistPeds'][4], JailVeh, 60, 1, 1.0, 1, 0)
					isPlayerUncuffed = true
				end
				
			end
			if pedDist <= 0.5 and not IsPedInAnyVehicle(PlayerPedId(), false) then
				QBCore.Functions.Notify('You Failed to Escape', 'error')
				DoScreenFadeOut(2000)
				TriggerEvent('police:client:SendToJail', 15)
				if Config.MyDebug then
					QBCore.Functions.Notify('SHOULD HAVE GONE TO JAIL', 'error')
				end
				Wait(2000)
				CleanUp()
				break
			end
			if IsPedInAnyVehicle(PlayerPedId(), true) then
				QBCore.Functions.Notify('INITIATING CAR CHASE', 'success')
				initiateCarChase()
			end
			Wait(100)
			-- PedPos = GetEntityCoords(ped)
			-- uncuffPed = GetEntityCoords(ForgeryPoliceHeist['heistPeds'][4])
			-- uncuffDist = #(PedPos - uncuffPed)
			-- pedDist = #(vector3(1854.68, 2586.12, 45.67) - uncuffPed)
			-- playerDist = #(vector3(1853.6, 2608.38, 45.67) - PedPos)
			-- if pedDist <= 0.5 then
				-- QBCore.Functions.Notify('You Failed to Escape', 'error')
				-- DoScreenFadeOut(2000)
				-- TriggerEvent('police:client:SendToJail', 15)
				-- QBCore.Functions.Notify('SHOULD HAVE GONE TO JAIL', 'error')
				-- Wait(2000)
				-- CleanUp()
			-- elseif IsPedInAnyVehicle(PlayerPedId(), false) then
				-- initiateCarChase()
			-- end
			-- Wait(100)
		end
		
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			if Config.MyDebug then
				QBCore.Functions.Notify('init car chase', 'success')
			end
			initiateCarChase()
		end
	end	
end



local function CreateNPCPedsAgain()
    local ped = PlayerPedId()

    SetPedRelationshipGroupHash(ped, GetHashKey('PLAYER'))
    AddRelationshipGroup('ForgeryPeds')

    for k, v in pairs(Config.ForgeryPeds.PedConfig) do
        loadModel(v['ped'])
        ForgeryHeistAgain['heistPeds'][k] = CreatePed(26, GetHashKey(v['ped']), v['pos'], v['heading'], true, true)
		if DoesRelationshipGroupExist(GetHashKey('ForgeryPeds')) then
			NetworkRegisterEntityAsNetworked(ForgeryHeistAgain['heistPeds'][k])
			networkID = NetworkGetNetworkIdFromEntity(ForgeryHeistAgain['heistPeds'][k])
			while networkID == 0 do
				NetworkRegisterEntityAsNetworked(ForgeryHeistAgain['heistPeds'][k])
				networkID = NetworkGetNetworkIdFromEntity(ForgeryHeistAgain['heistPeds'][k])
				Wait(500)
			end	
			SetNetworkIdCanMigrate(networkID, true)
			SetNetworkIdExistsOnAllMachines(networkID, true)
			SetEntityAsMissionEntity(ForgeryHeistAgain['heistPeds'][k])
			SetPedRelationshipGroupHash(ForgeryHeistAgain['heistPeds'][k], GetHashKey("ForgeryPeds"))
			SetEntityVisible(ForgeryHeistAgain['heistPeds'][k], true)
			SetPedRandomComponentVariation(ForgeryHeistAgain['heistPeds'][k], 0)
			SetPedRandomProps(ForgeryHeistAgain['heistPeds'][k])
			loadAnimDict('gestures@f@standing@casual')
			TaskPlayAnim(ForgeryHeistAgain['heistPeds'][k], 'gestures@f@standing@casual', 'gesture_point', 8.0, 8.0, -1, 50, 0, 0, 0, 0)
			SetBlockingOfNonTemporaryEvents(ForgeryHeistAgain['heistPeds'][k], true)
			
		else
			if Config.MyDebug then
				print("no relationship group exists")
			end
		end
    end

    SetRelationshipBetweenGroups(0, GetHashKey("ForgeryPeds"), GetHashKey("ForgeryPeds"))
	SetRelationshipBetweenGroups(5, GetHashKey("ForgeryPeds"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("ForgeryPeds"))
	
end

local function CreateNPCPeds()
    local ped = PlayerPedId()

    SetPedRelationshipGroupHash(ped, GetHashKey('PLAYER'))
    AddRelationshipGroup('ForgeryPeds')

    for k, v in pairs(Config.ForgeryPeds.PedConfig) do
        loadModel(v['ped'])
        ForgeryHeist['heistPeds'][k] = CreatePed(26, GetHashKey(v['ped']), v['pos'], v['heading'], true, true)
		if DoesRelationshipGroupExist(GetHashKey('ForgeryPeds')) then
			NetworkRegisterEntityAsNetworked(ForgeryHeist['heistPeds'][k])
			networkID = NetworkGetNetworkIdFromEntity(ForgeryHeist['heistPeds'][k])
			while networkID == 0 do
				NetworkRegisterEntityAsNetworked(ForgeryHeist['heistPeds'][k])
				networkID = NetworkGetNetworkIdFromEntity(ForgeryHeist['heistPeds'][k])
				Wait(500)
			end	
			SetNetworkIdCanMigrate(networkID, true)
			SetNetworkIdExistsOnAllMachines(networkID, true)
			SetEntityAsMissionEntity(ForgeryHeist['heistPeds'][k])
			SetPedRelationshipGroupHash(ForgeryHeist['heistPeds'][k], GetHashKey("ForgeryPeds"))
			SetEntityVisible(ForgeryHeist['heistPeds'][k], true)
			SetPedRandomComponentVariation(ForgeryHeist['heistPeds'][k], 0)
			SetPedRandomProps(ForgeryHeist['heistPeds'][k])
			loadAnimDict('missminuteman_1ig_2')
			TaskPlayAnim(ForgeryHeist['heistPeds'][k], 'missminuteman_1ig_2', 'handsup_enter', 8.0, 8.0, -1, 50, 0, 0, 0, 0)
			SetBlockingOfNonTemporaryEvents(ForgeryHeist['heistPeds'][k], true)
			
		else
			if Config.MyDebug then
				print("no relationship group exists")
			end
		end
    end

    SetRelationshipBetweenGroups(0, GetHashKey("ForgeryPeds"), GetHashKey("ForgeryPeds"))
	SetRelationshipBetweenGroups(0, GetHashKey("ForgeryPeds"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("PLAYER"), GetHashKey("ForgeryPeds"))
end

local function MakeEveryoneAroundHostile()

	local nearby = GetGamePool('CPed')
	for key,value in pairs(nearby) do
		if not IsPedAPlayer(value) and not IsEntityDead(value) then
			if not IsPedArmed(value, 1|2|4) then
				local randomNum = math.random(1,#Config.PedWeapon)
				GiveWeaponToPed(value, Config.PedWeapon[randomNum],450,false,true)
				SetPedArmour(value, Config.PedArmor)
				SetCanAttackFriendly(value,false,false)
				SetPedFleeAttributes(value, 0, true)
				SetPedCombatAttributes(value, 46, true)
				SetPedAccuracy(value, 40)
				SetPedCombatAbility(value, 1)
				SetPedCombatMovement(value, 3)
				SetPedCombatRange(value, 0)
				SetPedDropsWeaponsWhenDead(value,false)
				TaskCombatPed(value, PlayerPedId(), 0, 16)
				SetPedKeepTask(value, true)
				SetBlockingOfNonTemporaryEvents(value, true)
			end
		end
	end
end

local function enterForgeryAgain()
   
	isInsideAgain = true
	insideAgain = true
    TriggerServerEvent('InteractSound_SV:PlayOnSource', 'stores_door_open', 0.25)
    openStoreAnim()
	CreateNPCPedsAgain()
    Wait(250)
	local x = Config.InsideStart.x
	local y = Config.InsideStart.y
	local z = Config.InsideStart.z
	local w = Config.InsideStart.w
	local fin = true
	local fout = true
	TeleportPlayer(x,y,z,w,fin,fout)
	
end

local function enterForgery()
   
	isInside = true
	inside = true
    TriggerServerEvent('InteractSound_SV:PlayOnSource', 'stores_door_open', 0.25)
    openStoreAnim()
	CreateNPCPeds()
    Wait(250)
	local x = Config.InsideStart.x
	local y = Config.InsideStart.y
	local z = Config.InsideStart.z
	local w = Config.InsideStart.w
	local fin = true
	local fout = true
	TeleportPlayer(x,y,z,w,fin,fout)
	
end
-- Threads

CreateThread(function()
    Wait(500)
    local requiredItemsAgain = {
        [1] = { name = QBCore.Shared.Items['certificate']['name'], image = QBCore.Shared.Items['certificate']['image'] },
    }
    local requiredItemsShowed = false
    while true do
        thisInRange = false
        local PlayerPed = PlayerPedId()
        local PlayerPos = GetEntityCoords(PlayerPed)
		
		if not insideAgain then
			local dist = #(PlayerPos - vector3(Config.CrazyEntrance.x, Config.CrazyEntrance.y, Config.CrazyEntrance.z))
			if dist <= 1.5 then
				thisInRange = true
				-- if CurrentCops >= Config.PoliceOnDutyRequired then
					DrawText3Ds(Config.CrazyEntrance.x, Config.CrazyEntrance.y, Config.CrazyEntrance.z, Lang:t('info.henter'))
					if IsControlJustPressed(0, 38) then
						local hasItem = Config.HasItem("certificate")
						if hasItem then	
							local CustomSettings = {
								settings = {
									handleEnd = true;  --Send a result message if true and callback when message closed or callback immediately without showing the message
									speed = 6; --pixels / second
									scoreWin = 1000; --Score to win
									scoreLose = -150; --Lose if this score is reached
									maxTime = 30000; --sec
									maxMistake = 3; --How many missed keys can there be before losing
									speedIncrement = 1; --How much should the speed increase when a key hit was successful
								},
								keys = {"a", "w", "d", "s"}; --You can hash this out if you want to use default keys in the java side.
							}
							local success = exports['cd_keymaster']:StartKeyMaster(CustomSettings)
							if success then
								-- TriggerServerEvent('NS-ForgeryHeist:server:removeGateCracker')
								enterForgeryAgain()
							else
								TriggerServerEvent('NS-ForgeryHeist:server:removeBothEntranceFail')
								MakeEveryoneAroundHostile()
							end
						else
							QBCore.Functions.Notify('You require the Certificate to Continue.', 'error')
						end
					end
					if not requiredItemsShowed then
						requiredItemsShowed = true
						TriggerEvent('qb-inventory:client:requiredItems', requiredItemsAgain, true)
					end
				-- end
			end
		end
        if not thisInRange then
            if requiredItemsShowed then
                requiredItemsShowed = false
                TriggerEvent('qb-inventory:client:requiredItems', requiredItemsAgain, false)
            end
            Wait(1000)
        end
        Wait(1)
    end
end)

CreateThread(function()
    Wait(500)
    local requiredItems = {
        [1] = { name = QBCore.Shared.Items['gatecrack']['name'], image = QBCore.Shared.Items['gatecrack']['image'] },
        [2] = { name = QBCore.Shared.Items['electronickit']['name'], image = QBCore.Shared.Items['electronickit']['image'] },
    }
    local requiredItemsShowed = false
    while true do
        inRange = false
        local PlayerPed = PlayerPedId()
        local PlayerPos = GetEntityCoords(PlayerPed)
		
		if not inside then
			local dist = #(PlayerPos - vector3(Config.Entrance.x, Config.Entrance.y, Config.Entrance.z))
			if dist <= 1.5 then
				inRange = true
				-- if CurrentCops >= Config.PoliceOnDutyRequired then
					DrawText3Ds(Config.Entrance.x, Config.Entrance.y, Config.Entrance.z, Lang:t('info.henter'))
					if IsControlJustPressed(0, 38) then
						local hasItem = Config.HasItem("gatecrack")
						if hasItem then	
							local CustomSettings = {
								settings = {
									handleEnd = true;  --Send a result message if true and callback when message closed or callback immediately without showing the message
									speed = 10; --pixels / second
									scoreWin = 1000; --Score to win
									scoreLose = -150; --Lose if this score is reached
									maxTime = 30000; --sec
									maxMistake = 3; --How many missed keys can there be before losing
									speedIncrement = 1; --How much should the speed increase when a key hit was successful
								},
								keys = {"a", "w", "d", "s"}; --You can hash this out if you want to use default keys in the java side.
							}
							local success = exports['cd_keymaster']:StartKeyMaster(CustomSettings)
							if success then
								TriggerServerEvent('NS-ForgeryHeist:server:removeGateCracker')
								enterForgery()
							else
								TriggerServerEvent('NS-ForgeryHeist:server:removeBothEntranceFail')
								MakeEveryoneAroundHostile()
							end
						else
							QBCore.Functions.Notify('You are Missing something.', 'error')
						end
					end
					if not requiredItemsShowed then
						requiredItemsShowed = true
						TriggerEvent('qb-inventory:client:requiredItems', requiredItems, true)
					end
				-- end
			end
		end
        if not inRange then
            if requiredItemsShowed then
                requiredItemsShowed = false
                TriggerEvent('qb-inventory:client:requiredItems', requiredItems, false)
            end
            Wait(1000)
        end
        Wait(1)
    end
end)

CreateThread(function()
	local sleep = 500
	while true do
		if Config.MyDebug then
			print("OUTSIDE")
			print(isInside)		
			print("OUTSIDE")
		end
		while isInside == true do
			if Config.MyDebug then
				print("isInside")
				print(isInside)	
				print("isInside")
			end
			
			local PlayerPed = PlayerPedId()
			local PlayerPos = GetEntityCoords(PlayerPed)
			
			local dist = #(PlayerPos - vector3(Config.ForgeryPeds.PedConfig[3].pos.x, Config.ForgeryPeds.PedConfig[3].pos.y, Config.ForgeryPeds.PedConfig[3].pos.z))
			if dist <= 1.5 then
				if not gotDocs then
					DrawText3Ds(Config.ForgeryPeds.PedConfig[3].pos.x, Config.ForgeryPeds.PedConfig[3].pos.y, Config.ForgeryPeds.PedConfig[3].pos.z, '"~g~E~w~" to Take Forged Documents')
					if IsControlJustPressed(0, 38) then
					
						TriggerThePolice()
						
					end
					sleep = 1
				end
			end
			Wait(sleep)
		end
	Wait(sleep)
	end
end)

CreateThread(function()
	local sleep = 500
	while true do
		if Config.MyDebug then
			print("OUTSIDEAGAIN")
			print(isInsideAgain)		
			print("OUTSIDEAGAIN")
		end
		while isInsideAgain == true do
			if Config.MyDebug then
				print("isInsideAgain")
				print(isInsideAgain)	
				print("isInsideAgain")
			end
			local PlayerPed = PlayerPedId()
			local PlayerPos = GetEntityCoords(PlayerPed)
			TaskPlayAnim(ForgeryHeistAgain['heistPeds'][2], 'gestures@f@standing@casual', 'gesture_point', 8.0, 8.0, -1, 50, 0, 0, 0, 0)
			local dist = #(PlayerPos - vector3(Config.ForgeryPeds.PedConfig[2].pos.x, Config.ForgeryPeds.PedConfig[2].pos.y, Config.ForgeryPeds.PedConfig[2].pos.z))
			if dist <= 1.5 then
				if not gotDocsAgain then
					DrawText3Ds(Config.ForgeryPeds.PedConfig[2].pos.x, Config.ForgeryPeds.PedConfig[2].pos.y, Config.ForgeryPeds.PedConfig[2].pos.z, '"~g~E~w~" to Take Forged Documents')
					if IsControlJustPressed(0, 38) then
					
						TriggerTheFever()
						
					end
					sleep = 1
				end
			end
			Wait(sleep)
		end
	Wait(sleep)
	end
end)



CreateThread(function()
	while true do
		Wait(1)
		while isInsideAgainAgain do
			Wait(1)
			while not Looted do
				Wait(1)
				playerX, playerY, playerZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
				pedX, pedY, pedZ = table.unpack(GetEntityCoords(ForgeryHeistAgain['heistPeds'][1], true))	
				if(Vdist(playerX, playerY, playerZ, pedX, pedY, pedZ) < 2.0) then
					if IsEntityDead(ForgeryHeistAgain['heistPeds'][1]) then
						QBCore.Functions.DrawText3D(pedX, pedY, pedZ + 0.2, 'Search Body - [~g~E~w~]')
						if IsControlJustReleased(1, 51) then
							if DoesEntityExist(GetPlayerPed(-1)) then
								RequestAnimDict("random@domestic")
								while not HasAnimDictLoaded("random@domestic") do
									Wait(1)
								end
								TaskPlayAnim(PlayerPedId(), "random@domestic", "pickup_low", 8.0, -8, 2000, 2, 0, 0, 0, 0)
								Wait(2000)
								local hasBag = Config.HasItem('freebag')
								local hasItem = Config.HasItem('certificate')
								if hasItem and not hasBag then
									TriggerServerEvent('NS-ForgeryHeist:server:GivePlayerThePrize')
								end
								ClearPedSecondaryTask(GetPlayerPed(-1))
								SetEntityAsNoLongerNeeded(ForgeryHeistAgain['heistPeds'][1])
								DeleteEntity(ForgeryHeistAgain['heistPeds'][1])
								Looted = true
							end
						end
					end
				end
			end
			while not Looted2 do
				Wait(1)
				playerX, playerY, playerZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
				pedX, pedY, pedZ = table.unpack(GetEntityCoords(ForgeryHeistAgain['heistPeds'][2], true))	
				if(Vdist(playerX, playerY, playerZ, pedX, pedY, pedZ) < 2.0) then
					if IsEntityDead(ForgeryHeistAgain['heistPeds'][2]) then
						QBCore.Functions.DrawText3D(pedX, pedY, pedZ + 0.2, 'Search Body - [~g~E~w~]')
						if IsControlJustReleased(1, 51) then
							if DoesEntityExist(GetPlayerPed(-1)) then
								RequestAnimDict("random@domestic")
								while not HasAnimDictLoaded("random@domestic") do
									Wait(1)
								end
								TaskPlayAnim(PlayerPedId(), "random@domestic", "pickup_low", 8.0, -8, 2000, 2, 0, 0, 0, 0)
								Wait(2000)
								TriggerServerEvent('NS-ForgeryHeist:server:GiveMoney')
								ClearPedSecondaryTask(GetPlayerPed(-1))
								SetEntityAsNoLongerNeeded(ForgeryHeistAgain['heistPeds'][2])
								DeleteEntity(ForgeryHeistAgain['heistPeds'][2])
								Looted2 = true
							end
						end
					end
				end
			end
			while not Looted3 do
				Wait(1)
				playerX, playerY, playerZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
				pedX, pedY, pedZ = table.unpack(GetEntityCoords(ForgeryHeistAgain['heistPeds'][3], true))	
				if(Vdist(playerX, playerY, playerZ, pedX, pedY, pedZ) < 2.0) then
					if IsEntityDead(ForgeryHeistAgain['heistPeds'][3]) then
						QBCore.Functions.DrawText3D(pedX, pedY, pedZ + 0.2, 'Search Body - [~g~E~w~]')
						if IsControlJustReleased(1, 51) then
							if DoesEntityExist(GetPlayerPed(-1)) then
								RequestAnimDict("random@domestic")
								while not HasAnimDictLoaded("random@domestic") do
									Wait(1)
								end
								TaskPlayAnim(PlayerPedId(), "random@domestic", "pickup_low", 8.0, -8, 2000, 2, 0, 0, 0, 0)
								Wait(2000)
								TriggerServerEvent('NS-ForgeryHeist:server:GiveGold')
								ClearPedSecondaryTask(GetPlayerPed(-1))
								SetEntityAsNoLongerNeeded(ForgeryHeistAgain['heistPeds'][3])
								DeleteEntity(ForgeryHeistAgain['heistPeds'][3])
								Looted3 = true
							end
						end
					end
				end
			end
		end		
	end
end)

CreateThread(function()
	while true do
		Wait(1)
		while Looted3 do
			Wait(1)
			local PlayerPed = PlayerPedId()
			local PlayerPos = GetEntityCoords(PlayerPed)
			local dist = #(PlayerPos - vector3(Config.theExit.x,Config.theExit.y,Config.theExit.z))
			if dist <= 1.5 then
				QBCore.Functions.DrawText3D(Config.theExit.x,Config.theExit.y,Config.theExit.z + 0.2, 'Wake Up! - [~g~E~w~]')
				if IsControlJustReleased(1, 51) then
					local x = Config.WakeUp.x
					local y = Config.WakeUp.y
					local z = Config.WakeUp.z
					local w = Config.WakeUp.w
					local fin = false
					local fout = true
					TeleportPlayer(x,y,z,w,fin,fout)
					Wait(1000)
					TaskPlayAnim(PlayerPedId(), "timetable@tracy@sleep@", "base", 8.0, -8, 2000, 2, 0, 0, 0, 0)
					if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then
						
						TriggerEvent('qb-clothing:client:loadOutfit', {
							outfitData = {
								["arms"] = { item = 15, texture = 0 },
								["t-shirt"] = { item = 15, texture = 0 },
								["torso2"] = { item = 15, texture = 0 },
								["pants"] = { item = 307, texture = 0 },
								["shoes"] = { item = 17, texture = 0 },
								["glass"] = { item = 0, texture = 0 }
							}
						})
					else
						TriggerEvent('qb-clothing:client:loadOutfit', {
							outfitData = {
								["arms"] = { item = 15, texture = 0 },
								["t-shirt"] = { item = -1, texture = 0 },
								["torso2"] = { item = -1, texture = 0 },
								["pants"] = { item = 49, texture = 0 },
								["shoes"] = { item = 14, texture = 0 },
								["glass"] = { item = 0, texture = 0 }
							}
						})
					end
					Wait(1000)
					DoScreenFadeIn(3000)
					CleanUp()
				end
			end
		end		
	end
end)