local QBCore = exports['qb-core']:GetCoreObject()
local BlowBackdoor = 0
local BlowBackdoor2 = 0
local SilenceAlarm = 0
local PoliceAlert = 0
local PoliceBlip = 0
local LootTime = 1
local GuardsDead = 0
local prop
local lootable = 0
local BlownUp = 0
local TruckBlip
local TruckBlip2
local transport
local transport2
local MissionStart = 0
local MissionEndStart = 0
local warning = 0
local VehicleCoords = nil
local VehicleCoords2 = nil
local dealer
local PlayerJob = {}
local pilot
local navigator
local navigator2
local bag
local playerDeathCheck = false

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

local function PoliceCall()
    local player = PlayerPedId()
	local pid = GetPlayerServerId(NetworkGetPlayerIndexFromPed(player))
	-- QBCore.Functions.Notify(pid..' player id', 'error')
	local level = 5
	local message = "You are now wanted for Interfering with a Federal investigation!"
	-- QBCore.Functions.Notify(message, 'error')
	TriggerServerEvent('NS-Wantedhandler:server:addStars', pid, level, message)
    TriggerServerEvent('police:server:policeAlert', 'Grand Theft in progress')
end

local function CovertOp()
    local player = PlayerPedId()
	local pid = GetPlayerServerId(NetworkGetPlayerIndexFromPed(player))
	-- QBCore.Functions.Notify(pid..' player id', 'error')
	local level = 0
	local message = "Bought you some time with the cops, hurry up!"
	-- QBCore.Functions.Notify(message, 'error')
	TriggerServerEvent('NS-Wantedhandler:server:addStars', pid, level, message)
end
  
-- CreateThread(function()
	-- local blip = AddBlipForCoord(Config.MissionMarker.x, Config.MissionMarker.y, Config.MissionMarker.z)
	-- SetBlipSprite (blip, 67)
	-- SetBlipDisplay(blip, 4)
	-- SetBlipScale  (blip, 0.75)
	-- SetBlipAsShortRange(blip, true)
	-- SetBlipColour(blip, 50)
	-- BeginTextCommandSetBlipName('STRING')
	-- AddTextComponentSubstringPlayerName('StingInterrupt')
	-- EndTextCommandSetBlipName(blip)
-- end)

-- Ped spawn and mission accept
CreateThread(function()
	while true do
		local plyCoords = GetEntityCoords(PlayerPedId(), false)
		local dist = #(plyCoords - vector3(Config.MissionMarker.x, Config.MissionMarker.y, Config.MissionMarker.z))
		local sleep = 500
		if dist <= 25.0 then
			sleep = 0
			if not DoesEntityExist(dealer) then
				RequestModel("s_m_y_dealer_01")
				while not HasModelLoaded("s_m_y_dealer_01") do
					Wait(10)
				end
				dealer = CreatePed(26, "s_m_y_dealer_01", Config.DealerCoords.x, Config.DealerCoords.y, Config.DealerCoords.z, 268.9422, false, false)
				SetEntityHeading(dealer, 72.48)
				SetBlockingOfNonTemporaryEvents(dealer, true)
				TaskStartScenarioInPlace(dealer, "WORLD_HUMAN_AA_SMOKE", 0, false)
			end
			if dist <= 2.0 then
				DrawText3D(Config.MissionMarker.x, Config.MissionMarker.y, Config.MissionMarker.z, "~b~[E]~w~ To accept mission")
				if IsControlJustPressed(0, 38) then
					TriggerServerEvent("NS-DealInterruptus:accept")
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
			TriggerServerEvent('NS-DealInterruptus:Server:DeathCleanUp', player)
			playerDeathCheck = false
		end
		Wait(600)
	end
end)
---
local function CheckGuards()
	if IsPedDeadOrDying(pilot) == 1 or IsPedDeadOrDying(navigator) == 1 then
		
		GuardsDead = 1
		
	end
end

function AlertPolice()
    local a, b, c = table.unpack(GetEntityCoords(transport))
    local AlertCoordA = tonumber(string.format("%.2f", a))
    local AlertCoordB = tonumber(string.format("%.2f", b))
    local AlertCoordC = tonumber(string.format("%.2f", c))
    TriggerServerEvent('NS-DealInterruptus:zawiadompsy', AlertCoordA, AlertCoordB, AlertCoordC)
end

RegisterNetEvent('NS-DealInterruptus:InfoForLspd', function(x, y, z)
	if PlayerJob ~= nil and PlayerJob.name == 'police' then
		if PoliceBlip == 0 then
			PoliceBlip = 1
			local blip = AddBlipForCoord(x, y, z)
			SetBlipSprite(blip, 67)
			SetBlipScale(blip, 1.0)
			SetBlipColour(blip, 2)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentSubstringPlayerName('Assault on the Sting Operation')
			EndTextCommandSetBlipName(blip)
			SetNewWaypoint(x, y)
			Wait(10000)
			RemoveBlip(blip)
			PoliceBlip = 0
		end
		local PoliceCoords = GetEntityCoords(PlayerPedId(), false)
		local PoliceDist = #(PoliceCoords - vector3(x, y, z))
		if PoliceDist <= 4.5 then
			local dict = "anim@mp_player_intmenu@key_fob@"
			RequestAnimDict(dict)
			while not HasAnimDictLoaded(dict) do
				Wait(100)
			end
			if SilenceAlarm == 0 then
				hintToDisplay('Press ~INPUT_DETONATE~ to silence the alarm')
				SilenceAlarm = 1
			end
			if IsControlPressed(0, 47) and GuardsDead == 1 then
				hideLastHint()
				TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
				TriggerEvent('NS-DealInterruptus:CleanUp')
				RemoveBlip(TruckBlip)
			end
		end
	end
end)

RegisterNetEvent('NS-DealInterruptus:client:911alert', function()
	if PoliceAlert == 0 then
		local transCoords = GetEntityCoords(transport)
		local s1, s2 = GetStreetNameAtCoord(transCoords.x, transCoords.y, transCoords.z)
		local street1 = GetStreetNameFromHashKey(s1)
		local street2 = GetStreetNameFromHashKey(s2)
		local streetLabel = street1
		if street2 ~= nil then
			streetLabel = streetLabel .. " " .. street2
		end
		TriggerServerEvent("NS-DealInterruptus:server:callCops", streetLabel, transCoords)
		PlaySoundFrontend(-1, "Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 0)
		PoliceAlert = 1
	end
end)

RegisterNetEvent('NS-DealInterruptus:client:robberyCall', function(streetLabel, coords)
	if PlayerJob.name == "police" then
		local store = "Sting Gone Bad"
		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
		TriggerEvent('qb-policealerts:client:AddPoliceAlert', {
			timeOut = 10000,
			alertTitle = "Sting Gone Bad",
			coords = {
				x = coords.x,
				y = coords.y,
				z = coords.z,
			},
			details = {
				[1] = {
					icon = '<i class="fas fa-university"></i>',
					detail = store,
				},
				[2] = {
					icon = '<i class="fas fa-globe-europe"></i>',
					detail = streetLabel,
				},
			},
			callSign = QBCore.Functions.GetPlayerData().metadata["callsign"],
		})
		local transG = 250
		local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
		SetBlipSprite(blip, 487)
		SetBlipColour(blip, 4)
		SetBlipDisplay(blip, 4)
		SetBlipAlpha(blip, transG)
		SetBlipScale(blip, 1.2)
		SetBlipFlashes(blip, true)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName("10-90: Sting Gone Bad")
		EndTextCommandSetBlipName(blip)
		while transG ~= 0 do
			Wait(180 * 4)
			transG = transG - 1
			SetBlipAlpha(blip, transG)
			if transG == 0 then
				SetBlipSprite(blip, 2)
				RemoveBlip(blip)
				return
			end
		end
	end
end)

function MissionNotification()
	Wait(2000)
	TriggerServerEvent('qb-phone:server:sendNewMail', {
		sender = "Unknown",
		subject = "New Target",
		message = "You are going to need a crew to hit this crew, plus the other gang wont be too happy, not to mention the cops, if they know about this meeting... sending you the location now, good luck!.",
	})
end
function MissionNotification2()
	Wait(2000)
	TriggerServerEvent('qb-phone:server:sendNewMail', {
		sender = "Unknown",
		subject = "You fucked up",
		message = "Sorry asshole, but it seems you got the attention of the locals, now you gotta do one more thing.",
	})
end
---
RegisterNetEvent('NS-DealInterruptus:CarChase', function()
	MissionNotification2()
	VehicleCoords2 = Config.LastSpot
	local spawned2 = false
	CreateThread(function()
		local ped = PlayerPedId()
		SetNewWaypoint(VehicleCoords2.x, VehicleCoords2.y)
		while not spawned2 do
			local coords = GetEntityCoords(ped)
			local distance = #(coords - vector3(VehicleCoords2.x, VehicleCoords2.y, VehicleCoords2.z))
			if distance < 200 then
				spawned2 = true
				RequestModel(`volatus2`)
				while not HasModelLoaded(`volatus2`) do
					Wait(0)
				end
				ClearAreaOfVehicles(VehicleCoords2.x, VehicleCoords2.y, VehicleCoords2.z, 15.0, false, false, false, false, false)
				transport2 = CreateVehicle(`volatus2`, VehicleCoords2.x, VehicleCoords2.y, VehicleCoords2.z, 64.27, true, true)
				SetEntityAsMissionEntity(transport2)
				TruckBlip2 = AddBlipForEntity(transport2)
				SetBlipSprite(TruckBlip2, 57)
				SetBlipColour(TruckBlip2, 1)
				SetBlipFlashes(TruckBlip2, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentSubstringPlayerName('Helicopter waiting for the Cash')
				EndTextCommandSetBlipName(TruckBlip2)
				--
			end
			startEndMission()
			Wait(600)
		end
	end)
	MissionEndStart = 1
end)
--

--Crims side of the mission
function startEndMission()
	CreateThread(function()
		while MissionEndStart == 1 do
			playerDeathCheck = true
			local plyCoords2 = GetEntityCoords(PlayerPedId(), false)
			local transCoords2 = GetEntityCoords(transport2)
			local dist = #(plyCoords2 - transCoords2)
			local sleep = 500
			local wantedLevel = GetPlayerWantedLevel(PlayerPedId())
			if wantedLevel == 0 then
				if dist <= 20.0 then
					sleep = 0
					DrawMarker(0, transCoords2.x, transCoords2.y, transCoords2.z+4.5, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 135, 31, 35, 100, 1, 0, 0, 0)
					
					if GuardsDead == 0 then
						CheckGuards()
						
					end
					
					if dist <= 7 and PlayerJob.name ~= 'police' then
						if BlowBackdoor2 == 0 then
							hintToDisplay('Press [G] to stow the money in the chopper')
							if IsControlJustPressed(0, 47) then
								BlowBackdoor2 = 1
								Wait(250)
								DoScreenFadeOut(250)
								hideLastHint()
								VehicleCoords2 = Config.LastSpot
								DeleteVehicle(transport2)
								ClearAreaOfVehicles(VehicleCoords2.x, VehicleCoords2.y, VehicleCoords2.z, 50.0, false, false, false, false, false)
								sleep = 500
								Wait(500)
								DoScreenFadeIn(250)
								TriggerEvent("NS-DealInterruptus:client:allDone")
							end
						end
					end
				end
				Wait(sleep)
			end
			if dist <= 500.0 and wantedLevel > 0 then
				QBCore.Functions.Notify("Lose the cops or you aint getting near this bird!", "error")
			end
			Wait(60000)
			-- if dist <= 20.0  then
				-- sleep = 30
				-- DrawMarker(0, transCoords2.x, transCoords2.y, transCoords2.z+4.5, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 135, 31, 35, 100, 1, 0, 0, 0)
				-- QBCore.Functions.Notify("Put the money in the helicopter", "error")
				-- if dist <= 10 and PlayerJob.name ~= 'police' then
					-- hintToDisplay('Press [G] to stow the money')
					-- if IsControlJustPressed(0, 47) then
						-- hideLastHint()
						-- TriggerEvent("NS-DealInterruptus:client:allDone")
						-- sleep = 500
					-- end
					
				-- end
			-- end
			-- Wait(sleep)
		end
	end)
end
--

RegisterNetEvent('NS-DealInterruptus:client:allDone', function()
	TriggerEvent('NS-DealInterruptus:CleanUp')
	
	-- QBCore.Functions.Notify("Job well done!", "success")
	local targetPlayer = PlayerPedId()
	local level = 0
	SetPlayerWantedLevel(targetPlayer, level)
	TriggerServerEvent('NS-Wantedhandler:server:addStars', targetPlayer, 'You are no longer wanted')
	Wait(30)
	TriggerServerEvent("NS-DealInterruptus:ANTIgraczZrobilnapad")

end)

RegisterNetEvent('NS-DealInterruptus:Pozwolwykonac', function()
	MissionNotification()
	ClearPedTasks(dealer)
	TaskWanderStandard(dealer, 100,100)
	local DrawCoord = 1
	VehicleCoords = Config.VehicleSpawn[DrawCoord]

	local spawned = false
	CreateThread(function()
		local ped = PlayerPedId()
		SetNewWaypoint(VehicleCoords.x, VehicleCoords.y)
		while not spawned do
			local coords = GetEntityCoords(ped)
			local distance = #(coords - vector3(VehicleCoords.x, VehicleCoords.y, VehicleCoords.z))
			if distance < 200 then
				spawned = true
				RequestModel(`mule3`)
				while not HasModelLoaded(`mule3`) do
					Wait(0)
				end
				ClearAreaOfVehicles(VehicleCoords.x, VehicleCoords.y, VehicleCoords.z, 15.0, false, false, false, false, false)
				transport = CreateVehicle(`mule3`, VehicleCoords.x, VehicleCoords.y, VehicleCoords.z, 52.0, true, true)
				SetEntityAsMissionEntity(transport)
				TruckBlip = AddBlipForEntity(transport)
				SetBlipSprite(TruckBlip, 57)
				SetBlipColour(TruckBlip, 1)
				SetBlipFlashes(TruckBlip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentSubstringPlayerName('Van with Cash')
				EndTextCommandSetBlipName(TruckBlip)
				--
				RequestModel("g_m_y_korean_02")
				while not HasModelLoaded("g_m_y_korean_02") do
					Wait(10)
				end
				pilot = CreatePed(26, "g_m_y_korean_02", VehicleCoords.x+5, VehicleCoords.y, VehicleCoords.z, 8.9422, true, false)
				navigator = CreatePed(26, "g_m_y_korean_02", VehicleCoords.x, VehicleCoords.y+5, VehicleCoords.z, 8.9422, true, false)
				navigator2 = CreatePed(26, "g_m_y_korean_02", VehicleCoords.x+5, VehicleCoords.y+5, VehicleCoords.z, 8.9422, true, false)
				navigator3 = CreatePed(26, "g_m_y_korean_02", VehicleCoords.x-5, VehicleCoords.y+5, VehicleCoords.z, 8.9422, true, false)
				navigator4 = CreatePed(26, "g_m_y_korean_02", VehicleCoords.x+5, VehicleCoords.y-5, VehicleCoords.z, 8.9422, true, false)
				navigator5 = CreatePed(26, "g_m_y_korean_02", VehicleCoords.x-5, VehicleCoords.y-5, VehicleCoords.z, 8.9422, true, false)
				navigator6 = CreatePed(26, "g_m_y_korean_02", VehicleCoords.x, VehicleCoords.y-5, VehicleCoords.z, 8.9422, true, false)
				navigator7 = CreatePed(26, "g_m_y_korean_02", VehicleCoords.x-5, VehicleCoords.y, VehicleCoords.z, 8.9422, true, false)

				SetPedFleeAttributes(pilot, 0, 0)
				SetPedCombatAttributes(pilot, 46, 1)
				SetPedCombatAbility(pilot, 100)
				SetPedCombatMovement(pilot, 2)
				SetPedCombatRange(pilot, 2)
				SetPedKeepTask(pilot, true)
				GiveWeaponToPed(pilot, Config.DriverWep,250,false,true)
				SetPedAsCop(pilot, true)
				SetPedArmour(pilot, 100)
				--
				SetPedFleeAttributes(navigator, 0, 0)
				SetPedCombatAttributes(navigator, 46, 1)
				SetPedCombatAbility(navigator, 100)
				SetPedCombatMovement(navigator, 2)
				SetPedCombatRange(navigator, 2)
				SetPedKeepTask(navigator, true)
				GiveWeaponToPed(navigator, Config.NavWep,250,false,true)
				SetPedAsCop(navigator, true)
				SetPedArmour(navigator, 100)
				--
				SetPedFleeAttributes(navigator2, 0, 0)
				SetPedCombatAttributes(navigator2, 46, 1)
				SetPedCombatAbility(navigator2, 100)
				SetPedCombatMovement(navigator2, 2)
				SetPedCombatRange(navigator2, 2)
				SetPedKeepTask(navigator2, true)
				GiveWeaponToPed(navigator2, Config.NavWep,250,false,true)
				SetPedAsCop(navigator2, true)
				SetPedArmour(navigator2, 100)
				--
				SetPedFleeAttributes(navigator3, 0, 0)
				SetPedCombatAttributes(navigator3, 46, 1)
				SetPedCombatAbility(navigator3, 100)
				SetPedCombatMovement(navigator3, 2)
				SetPedCombatRange(navigator3, 2)
				SetPedKeepTask(navigator3, true)
				GiveWeaponToPed(navigator3, Config.NavWep,250,false,true)
				SetPedAsCop(navigator3, true)
				SetPedArmour(navigator3, 100)
				--
				SetPedFleeAttributes(navigator4, 0, 0)
				SetPedCombatAttributes(navigator4, 46, 1)
				SetPedCombatAbility(navigator4, 100)
				SetPedCombatMovement(navigator4, 2)
				SetPedCombatRange(navigator4, 2)
				SetPedKeepTask(navigator4, true)
				GiveWeaponToPed(navigator4, Config.NavWep,250,false,true)
				SetPedAsCop(navigator4, true)
				SetPedArmour(navigator4, 100)
				--
				SetPedFleeAttributes(navigator5, 0, 0)
				SetPedCombatAttributes(navigator5, 46, 1)
				SetPedCombatAbility(navigator5, 100)
				SetPedCombatMovement(navigator5, 2)
				SetPedCombatRange(navigator5, 2)
				SetPedKeepTask(navigator5, true)
				GiveWeaponToPed(navigator5, Config.NavWep,250,false,true)
				SetPedAsCop(navigator5, true)
				SetPedArmour(navigator5, 100)
				--
				SetPedFleeAttributes(navigator6, 0, 0)
				SetPedCombatAttributes(navigator6, 46, 1)
				SetPedCombatAbility(navigator6, 100)
				SetPedCombatMovement(navigator6, 2)
				SetPedCombatRange(navigator6, 2)
				SetPedKeepTask(navigator6, true)
				GiveWeaponToPed(navigator6, Config.NavWep,250,false,true)
				SetPedAsCop(navigator6, true)
				SetPedArmour(navigator6, 100)
				--
				SetPedFleeAttributes(navigator7, 0, 0)
				SetPedCombatAttributes(navigator7, 46, 1)
				SetPedCombatAbility(navigator7, 100)
				SetPedCombatMovement(navigator7, 2)
				SetPedCombatRange(navigator7, 2)
				SetPedKeepTask(navigator7, true)
				GiveWeaponToPed(navigator7, Config.NavWep,250,false,true)
				SetPedAsCop(navigator7, true)
				SetPedArmour(navigator7, 100)
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

		GiveWeaponToPed(navigator, Config.NavWeap, 420, 0, 1)
		GiveWeaponToPed(navigator2, Config.NavWeap, 420, 0, 1)
		GiveWeaponToPed(pilot, Config.DriverWeap, 420, 0, 1)

		SetPedDropsWeaponsWhenDead(navigator,false)
		SetPedRelationshipGroupDefaultHash(navigator,`COP`)
		SetPedRelationshipGroupHash(navigator,`COP`)
		SetPedAsCop(navigator,true)
		SetCanAttackFriendly(navigator,false,true)
		
		SetPedDropsWeaponsWhenDead(navigator3,false)
		SetPedRelationshipGroupDefaultHash(navigator3,`COP`)
		SetPedRelationshipGroupHash(navigator3,`COP`)
		SetPedAsCop(navigator3,true)
		SetCanAttackFriendly(navigator3,false,true)

		SetPedDropsWeaponsWhenDead(navigator4,false)
		SetPedRelationshipGroupDefaultHash(navigator4,`COP`)
		SetPedRelationshipGroupHash(navigator4,`COP`)
		SetPedAsCop(navigator4,true)
		SetCanAttackFriendly(navigator4,false,true)
		
		SetPedDropsWeaponsWhenDead(navigator5,false)
		SetPedRelationshipGroupDefaultHash(navigator5,`COP`)
		SetPedRelationshipGroupHash(navigator5,`COP`)
		SetPedAsCop(navigator5,true)
		SetCanAttackFriendly(navigator5,false,true)
		
		SetPedDropsWeaponsWhenDead(navigator6,false)
		SetPedRelationshipGroupDefaultHash(navigator6,`COP`)
		SetPedRelationshipGroupHash(navigator6,`COP`)
		SetPedAsCop(navigator6,true)
		SetCanAttackFriendly(navigator6,false,true)
		
		SetPedDropsWeaponsWhenDead(navigator7,false)
		SetPedRelationshipGroupDefaultHash(navigator7,`COP`)
		SetPedRelationshipGroupHash(navigator7,`COP`)
		SetPedAsCop(navigator7,true)
		SetCanAttackFriendly(navigator7,false,true)
		
		SetPedDropsWeaponsWhenDead(navigator2,false)
		SetPedRelationshipGroupDefaultHash(navigator2,`COP`)
		SetPedRelationshipGroupHash(navigator2,`COP`)
		SetPedAsCop(navigator2,true)
		SetCanAttackFriendly(navigator2,false,true)

		SetPedDropsWeaponsWhenDead(pilot,false)
		SetPedRelationshipGroupDefaultHash(pilot,`COP`)
		SetPedRelationshipGroupHash(pilot,`COP`)
		SetPedAsCop(pilot,true)
		SetCanAttackFriendly(pilot,false,true)

		TaskCombatPed(pilot, PlayerPedId(), 0, 16)
		TaskCombatPed(navigator, PlayerPedId(), 0, 16)
		TaskCombatPed(navigator2, PlayerPedId(), 0, 16)
		TaskCombatPed(navigator3, PlayerPedId(), 0, 16)
		TaskCombatPed(navigator4, PlayerPedId(), 0, 16)
		TaskCombatPed(navigator5, PlayerPedId(), 0, 16)
		TaskCombatPed(navigator6, PlayerPedId(), 0, 16)
		TaskCombatPed(navigator7, PlayerPedId(), 0, 16)

		TaskEveryoneLeaveVehicle(transport)
	end)
end

--Crims side of the mission
function startMission()
	CreateThread(function()
		while MissionStart == 1 do
			playerDeathCheck = true
			local plyCoords = GetEntityCoords(PlayerPedId(), false)
			local transCoords = GetEntityCoords(transport)
			local dist = #(plyCoords - transCoords)
			local sleep = 500
			if dist <= 100.0  then
				sleep = 0
				DrawMarker(0, transCoords.x, transCoords.y, transCoords.z+4.5, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 135, 31, 35, 100, 1, 0, 0, 0)
				if warning == 0 then
					warning = 1
					stopAndBeAngry()
					CovertOp()
					QBCore.Functions.Notify("Get rid of the gang before you place the bomb.", "error")
					AlertPolice()
				end
				
				if GuardsDead == 0 then
					CheckGuards()
					
				end

				if dist <= 7 and BlownUp == 0 and PlayerJob.name ~= 'police' then
					if BlowBackdoor == 0 then
						hintToDisplay('Press [G] to blow up the back door and take the money')
						if IsControlJustPressed(0, 47) then
							BlowBackdoor = 1
							CheckVehicleInformation()
							TriggerEvent("NS-DealInterruptus:client:911alert")
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
		if IsVehicleSeatFree(transport, -1) and IsVehicleSeatFree(transport, 0) and IsVehicleSeatFree(transport, 1) and GuardsDead == 1 then
			if not IsEntityInWater(PlayerPedId()) then
				RequestAnimDict('anim@heists@ornate_bank@thermal_charge_heels')
				while not HasAnimDictLoaded('anim@heists@ornate_bank@thermal_charge_heels') do
					Wait(50)
				end
				local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
				prop = CreateObject(`prop_c4_final_green`, x, y, z+0.2,  true,  true, true)
				AttachEntityToEntity(prop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.06, 0.0, 0.06, 90.0, 0.0, 0.0, true, true, false, true, 1, true)
				SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`,true)
				FreezeEntityPosition(PlayerPedId(), true)
				TaskPlayAnim(PlayerPedId(), 'anim@heists@ornate_bank@thermal_charge_heels', "thermal_charge", 3.0, -8, -1, 63, 0, 0, 0, 0 )
				Wait(5500)
				ClearPedTasks(PlayerPedId())
				DetachEntity(prop)
				AttachEntityToEntity(prop, transport, GetEntityBoneIndexByName(transport, 'door_pside_r'), -0.7, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
				hideLastHint()
				QBCore.Functions.Notify('The load will be detonated in '..Config.TimeToBlow ..' seconds.', "error")
				Wait(600)
				CovertOp()
				FreezeEntityPosition(PlayerPedId(), false)
				Wait(Config.TimeToBlow*1000)
				local transCoords = GetEntityCoords(transport)
				SetVehicleDoorBroken(transport, 2, false)
				SetVehicleDoorBroken(transport, 3, false)
				AddExplosion(transCoords.x,transCoords.y,transCoords.z, 'EXPLOSION_TANKER', 2.0, true, false, 2.0)
				-- ApplyForceToEntity(transport, 0, transCoords.x,transCoords.y,transCoords.z, 0.0, 0.0, 0.0, 1, false, true, true, true, true)
				BlownUp = 1
				lootable = 1
				QBCore.Functions.Notify('You can start collecting cash.', "success")
				PoliceCall()
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
			local transCoords = GetEntityCoords(transport)
            local dist = #(plyCoords - transCoords)
			if dist <= 4.5 then
				sleep = 0
				hintToDisplay('Press [E] to take the money')
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


RegisterNetEvent('NS-DealInterruptus:CleanUp', function()
	QBCore.Functions.Notify('Mission has been successfully cleanedup', "success")
	BlowBackdoor = 0
	BlowBackdoor2 = 0
	SilenceAlarm = 0
	PoliceAlert = 0
	PoliceBlip = 0
	moneyCalc = 1
	LootTime = 1
	GuardsDead = 0
	lootable = 0
	BlownUp = 0
	MissionStart = 0
	MissionEndStart = 0
	warning = 0
	
end)

-- Crim Client
function TakingMoney()
    RequestAnimDict('anim@heists@ornate_bank@grab_cash_heels')
    while not HasAnimDictLoaded('anim@heists@ornate_bank@grab_cash_heels') do
        Wait(50)
    end

	local PedCoords = GetEntityCoords(PlayerPedId())
	bag = CreateObject(`prop_cs_heist_bag_02`,PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
	AttachEntityToEntity(bag, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.0, 0.0, -0.16, 250.0, -30.0, 0.0, false, false, false, false, 2, true)
	TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@grab_cash_heels", "grab", 8.0, -8.0, -1, 1, 0, false, false, false)
	FreezeEntityPosition(PlayerPedId(), true)
	QBCore.Functions.Notify('You are packing cash into a bag', "success")
	local _time = GetGameTimer()
	while GetGameTimer() - _time < 20000 do
		if IsControlPressed(0, 47) then
			hideLastHint()
			break
		end
		hintToDisplay('Hold [G] to bail out')
		Wait(0)
	end
	LootTime = GetGameTimer() - _time
	DeleteEntity(bag)
	ClearPedTasks(PlayerPedId())
	FreezeEntityPosition(PlayerPedId(), false)
	SetPedComponentVariation(PlayerPedId(), 5, 45, 0, 2)
	TriggerServerEvent("NS-DealInterruptus:graczZrobilnapad", LootTime)
	-- TriggerEvent('NS-DealInterruptus:CleanUp') -- replaced with car chase 
	TriggerEvent('NS-DealInterruptus:CarChase')
	Wait(2500)
end
