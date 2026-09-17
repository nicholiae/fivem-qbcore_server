local QBCore = exports['qb-core']:GetCoreObject()
local BlowBackdoor = 0
local SilenceAlarm = 0
local EMSAlert = 0
local EMSBlip = 0
local LootTime = 1
local GuardsDead = 0
local prop
local lootable = 0
local BlownUp = 0
local TruckBlip
local transport
local MissionStart = 0
local warning = 0
local VehicleCoords = nil
local dealer
local evidence
local PlayerJob = {}
local pilot
local navigator
local playerDeathCheck = false


local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(1)
    end
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

local function hintToDisplay(text)
	exports['qb-core']:DrawText(text)
end

local function hideLastHint()
	exports['qb-core']:HideText()
end

local function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    BeginTextCommandDisplayText("STRING")
    SetTextCentre(true)
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(x,y,z, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

-- CreateThread(function()
	-- local blip = AddBlipForCoord(Config.MissionMarker.x, Config.MissionMarker.y, Config.MissionMarker.z)
	-- SetBlipSprite (blip, 58)
	-- SetBlipDisplay(blip, 4)
	-- SetBlipScale  (blip, 0.75)
	-- SetBlipAsShortRange(blip, true)
	-- SetBlipColour(blip, 8)
	-- BeginTextCommandSetBlipName('STRING')
	-- AddTextComponentSubstringPlayerName('EMS Dispatcher')
	-- EndTextCommandSetBlipName(blip)
-- end)

-- Evidence spawn 
CreateThread(function()
	while true do
		local plyCoords = GetEntityCoords(PlayerPedId(), false)
		local dist = #(plyCoords - vector3(Config.EvidenceCoords.x, Config.EvidenceCoords.y, Config.EvidenceCoords.z))
		local sleep = 500
		if dist <= 25.0 then
			sleep = 0
			if not DoesEntityExist(evidence) then
				RequestModel(Config.EvidencePed)
				while not HasModelLoaded(Config.EvidencePed) do
					Wait(10)
				end
				evidence = CreatePed(26, Config.EvidencePed, Config.EvidenceCoords.x, Config.EvidenceCoords.y, Config.EvidenceCoords.z, Config.EvidenceCoords.w, false, false)
				SetBlockingOfNonTemporaryEvents(evidence, true)
				TaskStartScenarioInPlace(evidence, "WORLD_HUMAN_COP_IDLES", 0, false)
				Wait(2000)
				FreezeEntityPosition(evidence, true)
			end
			
			local PlayerData = QBCore.Functions.GetPlayerData()
			local PlayerJob = PlayerData.job.name
			if dist <= 3.0 and PlayerJob == 'ambulance' then
				DrawText3D(Config.EvidenceCoords.x, Config.EvidenceCoords.y, Config.EvidenceCoords.z, "~b~[E]~w~ To Hand Over Evidence")
				if IsControlJustPressed(0, 38) then
					TriggerServerEvent("NS-EMSDispatch:Reward")
					sleep = 500
				end
			end
		end
		Wait(sleep)
	end
end)

-- Ped spawn and mission accept
CreateThread(function()
	while true do
		local plyCoords = GetEntityCoords(PlayerPedId(), false)
		local dist = #(plyCoords - vector3(Config.MissionMarker.x, Config.MissionMarker.y, Config.MissionMarker.z))
		local sleep = 500
		if dist <= 25.0 then
			sleep = 0
			if not DoesEntityExist(dealer) then
				RequestModel(Config.DispatchPed)
				while not HasModelLoaded(Config.DispatchPed) do
					Wait(10)
				end
				dealer = CreatePed(26, Config.DispatchPed, Config.DealerCoords.x, Config.DealerCoords.y, Config.DealerCoords.z, Config.DealerCoords.w, false, false)
				SetBlockingOfNonTemporaryEvents(dealer, true)
				TaskStartScenarioInPlace(dealer, "WORLD_HUMAN_COP_IDLES", 0, false)
			end
			
			local PlayerData = QBCore.Functions.GetPlayerData()
			local PlayerJob = PlayerData.job.name
			if dist <= 3.0 and PlayerJob == 'ambulance' then
				DrawText3D(Config.MissionMarker.x, Config.MissionMarker.y, Config.MissionMarker.z, "~b~[E]~w~ To accept the call")
				if IsControlJustPressed(0, 38) then
					TriggerServerEvent("NS-EMSDispatch:Accept")
					sleep = 500
				end
			end
		end
		Wait(sleep)
	end
end)
---
CreateThread(function()

	while playerDeathCheck == true do
		local player = PlayerPedId()
		if IsPedDeadOrDying(player) == 1 then
			QBCore.Functions.Notify("You died! Mission Failed!", "error")
			TriggerEvent('NS-EMSDispatch:CleanUp')
			playerDeathCheck = false
		end
		Wait(600)
	end

end)
---
local function CheckGuards()
	if IsPedDeadOrDying(navigator) == 1 then
		
		GuardsDead = 1
		
	end
end
local function CheckPilot()
	if IsPedDeadOrDying(pilot) == 1 then
		
		PilotDead = 1
		
	end
end

function MissionNotification(VehicleCoords)
	local coords = VehicleCoords
	local street1, street2 = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street1name = GetStreetNameFromHashKey(street1)
    local street2name = GetStreetNameFromHashKey(street2)
	Wait(2000)
	TriggerServerEvent('qb-phone:server:sendNewMail', {
		sender = "Dispatch",
		subject = "Dispatch to All EMS",
		message = "All available EMS please respond, stabbing at "..tostring(street1name .. ' ' .. street2name),
	})
end
---
--
RegisterNetEvent('NS-EMSDispatch:SpawnMissionAssets', function()
	ClearPedTasks(dealer)
	TaskWanderStandard(dealer, 100,100)
	local DrawCoord = math.random(1,#Config.VehicleSpawn)
	VehicleCoords = Config.VehicleSpawn[DrawCoord]
	MissionNotification(VehicleCoords)

	local spawned = false
	CreateThread(function()
		local ped = PlayerPedId()
		SetNewWaypoint(VehicleCoords.x, VehicleCoords.y)
		while not spawned do
			local coords = GetEntityCoords(ped)
			local distance = #(coords - vector3(VehicleCoords.x, VehicleCoords.y, VehicleCoords.z))
			SetNewWaypoint(VehicleCoords.x, VehicleCoords.y)
			if distance < 200 then
				spawned = true
				RequestModel(Config.VehicleHash)
				while not HasModelLoaded(Config.VehicleHash) do
					Wait(0)
				end
				ClearAreaOfVehicles(VehicleCoords.x, VehicleCoords.y, VehicleCoords.z, 15.0, false, false, false, false, false)
				transport = CreateVehicle(Config.VehicleHash, VehicleCoords.x, VehicleCoords.y, VehicleCoords.z, 52.0, true, true)
				SetEntityAsMissionEntity(transport)
				TruckBlip = AddBlipForEntity(transport)
				SetBlipSprite(TruckBlip, 57)
				SetBlipColour(TruckBlip, 1)
				SetBlipFlashes(TruckBlip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentSubstringPlayerName('')
				EndTextCommandSetBlipName(TruckBlip)
				--
				local femalePed = Config.FemalePed
				RequestModel(femalePed)
				while not HasModelLoaded(femalePed) do
					Wait(10)
				end
				pilot = CreatePed(22, femalePed, VehicleCoords.x+3, VehicleCoords.y+1, VehicleCoords.z, 268.9422, true, false)
				
				local malePed = Config.MalePed
				RequestModel(malePed)
				while not HasModelLoaded(malePed) do
					Wait(10)
				end
				navigator = CreatePed(26, malePed, VehicleCoords.x+2, VehicleCoords.y+1, VehicleCoords.z, 268.9422, true, false)

				SetPedFleeAttributes(pilot, 0, 0)
				SetPedCombatAttributes(pilot, 5, 1)
				SetPedCombatAbility(pilot, 100)
				SetPedCombatMovement(pilot, 3)
				SetPedCombatRange(pilot, 0)
				SetPedKeepTask(pilot, true)
				local chance = math.random(1,100)
				if chance < Config.weaponChance then
					giveWeaponToPed(pilot, Config.DriverWeap,250,false,true)
				end
				SetPedAsCop(pilot, false)
				--
				SetPedFleeAttributes(navigator, 0, 0)
				SetPedCombatAttributes(navigator, 5, 1)
				SetPedCombatAbility(navigator, 100)
				SetPedCombatMovement(navigator, 3)
				SetPedCombatRange(navigator, 0)
				SetPedKeepTask(navigator, true)
				if chance < Config.weaponChance then
					giveWeaponToPed(navigator, Config.NavWeap,250,false,true)
				end
				SetPedAsCop(navigator, false)
				--
				--
				-- TaskVehicleDriveWander(pilot, transport, 0.0, 0)
			end
			startMission()
			Wait(500)
		end
	end)
	MissionStart = 1
end)

function stopAndBeAngry()
	CreateThread(function()
		SetVehicleBrake(transport)
		Wait(1000)

		SetPedDropsWeaponsWhenDead(navigator,false)
		SetPedRelationshipGroupDefaultHash(navigator,`GANG_1`)
		SetPedRelationshipGroupHash(navigator,`GANG_1`)
		SetRelationshipBetweenGroups(5, `GANG_2`, `GANG_1`)
		SetPedAsCop(navigator,false)
		SetCanAttackFriendly(navigator,true,true)

		-- SetPedDropsWeaponsWhenDead(pilot,false)
		-- SetPedRelationshipGroupDefaultHash(pilot,`GANG_2`)
		-- SetPedRelationshipGroupHash(pilot,`GANG_2`)
		-- SetRelationshipBetweenGroups(5, `GANG_1`, `GANG_2`)
		-- SetPedAsCop(pilot,false)
		-- SetCanAttackFriendly(pilot,true,true)
				
		SetEntityHealth(pilot,0)
			
		TaskCombatPed(pilot, navigator, 0, 16)
		TaskCombatPed(navigator, pilot, 0, 16)

		-- TaskEveryoneLeaveVehicle(transport)
	end)
end

local function HelpAnimation()
    local ped = PlayerPedId()
	healAnimDict = 'mini@cpr@char_a@cpr_str'
	healAnim = 'cpr_pumpchest'
    loadAnimDict(healAnimDict)
    Wait(100)
    TaskPlayAnim(ped, healAnimDict, healAnim, 3.0, 3.0, -1, 48, 0, 0, 0, 0)
    Wait(3500)
end

--Crims side of the mission
function startMission()
	CreateThread(function()
		while MissionStart == 1 do
			playerDeathCheck = true
			local plyCoords = GetEntityCoords(PlayerPedId(), false)
			local transCoords = GetEntityCoords(pilot)
			local dist = #(plyCoords - transCoords)
			local sleep = 500
			if dist <= 35.0  then
				sleep = 0
				DrawMarker(0, transCoords.x, transCoords.y, transCoords.z+4.5, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 135, 31, 35, 100, 1, 0, 0, 0)
				if warning == 0 then
					warning = 1
					stopAndBeAngry()
					QBCore.Functions.Notify("Help the Citizen! Police will catch the criminal!", "error")
				end
				
				if GuardsDead == 0 or PilotDead == 0 then
					CheckGuards()
					CheckPilot()
				end

				if dist <= 7 and PilotDead == 1 then
					if BlowBackdoor == 0 then
						hintToDisplay('Press [G] to Perform Aid')
						if IsControlJustPressed(0, 47) then
							BlowBackdoor = 1
							CheckVehicleInformation()
							hideLastHint()
							sleep = 500
						end
					end
				end
			end
			Wait(sleep)
		end
	end)
end

function CheckVehicleInformation()
	if IsVehicleStopped(transport) then
		if PilotDead == 1 then
			if not IsEntityInWater(PlayerPedId()) then
				local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
				SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`,true)
				FreezeEntityPosition(PlayerPedId(), true)
				HelpAnimation()
				-- GetCuffedAnimation(PlayerPedId(), navigator)
				ClearPedTasks(navigator)
				TaskWanderStandard(navigator, 100,100)
				Wait(5500)
				ClearPedTasks(PlayerPedId())
				hideLastHint()
				QBCore.Functions.Notify('Unfortunately there is nothing you can do!', "error")
				Wait(600)
				FreezeEntityPosition(PlayerPedId(), false)
				BlownUp = 1
				lootable = 1
				QBCore.Functions.Notify('You can take TOD now.', "success")
				RemoveBlip(TruckBlip)
			else
				QBCore.Functions.Notify('Get out of the water', "error")
			end
		else
			QBCore.Functions.Notify('The vehicle must be empty to place the load', "error")
		end
	else
		QBCore.Functions.Notify('You can not rob a vehicle that is moving.', "error")
	end
end

-- Crim Client
CreateThread(function()
    while true do
		local sleep = 500
		if lootable == 1 then
			local plyCoords = GetEntityCoords(PlayerPedId(), false)
			local transCoords = GetEntityCoords(pilot)
            local dist = #(plyCoords - transCoords)
			if dist <= 2.5 then
				sleep = 0
				hintToDisplay('Press [E] to Declare TOD')
				if IsControlJustPressed(0, 38) or IsDisabledControlJustPressed(0, 38) then
					lootable = 0
					TakingMoney()
					hideLastHint()
					sleep = 500
				end
			end
		end
		Wait(sleep)
	end
end)

RegisterNetEvent('NS-EMSDispatch:CleanUp', function()
	DeleteEntity(pilot)
	DeleteEntity(navigator)
	DeleteEntity(transport)
	BlowBackdoor = 0
	SilenceAlarm = 0
	EMSAlert = 0
	EMSBlip = 0
	moneyCalc = 1
	LootTime = 1
	GuardsDead = 0
	lootable = 0
	BlownUp = 0
	MissionStart = 0
	warning = 0
end)

-- Crim Client
function TakingMoney()

    loadAnimDict('timetable@mime@ig_2')
	hideLastHint()
	local PedCoords = GetEntityCoords(PlayerPedId())
	TaskPlayAnim(PlayerPedId(), "timetable@mime@ig_2", "thumbs_down", 8.0, -8.0, -1, 1, 0, false, false, false)
	FreezeEntityPosition(PlayerPedId(), true)
	QBCore.Functions.Notify('You getting the TOD', "success")
	local _time = GetGameTimer()
	while GetGameTimer() - _time < 20000 do
		if IsControlPressed(0, 47) then
			hideLastHint()
			break
		end
		hintToDisplay('Hold [G] to quit(no reward)')
		Wait(0)
	end
	LootTime = GetGameTimer() - _time
	ClearPedTasks(PlayerPedId())
	FreezeEntityPosition(PlayerPedId(), false)
	SetPedComponentVariation(PlayerPedId(), 5, 45, 0, 2)
	TriggerServerEvent("NS-EMSDispatch:GiveLoot", LootTime)
	TriggerEvent('NS-EMSDispatch:CleanUp')
	Wait(2500)
end
