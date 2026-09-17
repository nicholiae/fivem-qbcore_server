local QBCore = exports['qb-core']:GetCoreObject()
local timeLeft = 0
local tenCountdown = cfg.gameSettings.timeToPlayGame
local clientHillSize = cfg.gameSettings.playZoneDiameterStart
local pedCreated = false
local clientPlayZone = nil
local respawn = true
local ClosestStash = nil
local playZone = nil
local hillZone = nil
local IsInside = false
local IsInsideHill = false
local ClientIsInsideHill = false
local doWeBreak = true
local trigger = true
local started = false
local playStarted = false
local flyStart = false
local clientHillLocation = nil
local stashLocation = nil
local location = nil
local lootChestLocationsClient = {}
local lootChestIdsClient = {}
local TeamBlips = {}
local vehicle = nil
local gameTypeClient = 0
local clientvotese = 0
local clientvotesy = 0
local clientvotesq = 0
local deathCheck = false
local teamCheck = false
local hillCheck = false
local clientPlayerQueue = {}
local clientKillDeathCounterList = {}
local clientKillCounterList = {}
local clientDeathCounterList = {}




-- death handler
-- change spawn points per zone




function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end

function clientSetPedInvis(pedId)
    local ped = pedId
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
end

function DrawAdvancedNativeText(x,y,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end

function openLootChest()

    local stashLoc = vector3(stashLocation.x, stashLocation.y, stashLocation.z)
    TriggerServerEvent('InteractSound_SV:PlayOnSource', 'StashOpen', 0.4)
    TriggerServerEvent('BattleRoyal:chestOpen', ClosestStash)
    
end


local function SetClosestLootChest()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local current = nil
    local sleep = 1000
    local dist = nil
    if not IsInside then
		count = 1
		if started == true then
			if #lootChestLocationsClient ~= 0 then
				for _,loc in pairs(lootChestLocationsClient) do
					local distcheck = #(pos - vector3(loc.x, loc.y, loc.z))
					if current ~= nil then
						if distcheck < dist then
							current = lootChestIdsClient[count]
							dist = distcheck
							location = vector3(loc.x, loc.y, loc.z)
						end
					else
						dist = distcheck
						current = lootChestIdsClient[count]
						location = vector3(loc.x, loc.y, loc.z)
						
					end
					count = count + 1
				end
				
				ClosestStash = current
				if location ~= nil then
					stashLocation = vector3(location.x, location.y, location.z)
				end
				if cfg.debugCrates then
					print('stashLocation '..tostring(stashLocation))
					print('pos '..tostring(pos))
					print('dist '..tostring(dist))
				end
				while dist < 4.0 do
					sleep = 0
					IsInside = true
					pos = GetEntityCoords(PlayerPedId(), true)
					dist = #(pos - vector3(location.x, location.y, location.z))
					exports['qb-core']:DrawText('Open [E] '..tostring(ClosestStash), 'Right')
					-- print('dist<3.5:'..tostring(isInside))
					if IsControlJustPressed(0, 38) then
						openLootChest()
						exports['qb-core']:HideText()
						IsInside = false
					end
					Wait(sleep)
				end
				-- print('dist:'..tostring(dist))
				IsInside = false
				-- exports['qb-core']:HideText()
			end
		end
        -- if ClosestStash ~= nil and tonumber(dist) < 30 then
        -- end
    end
end

Citizen.CreateThread(function()
	
    local sleep = 500
    while not LocalPlayer.state.isLoggedIn do
        -- do nothing
        Wait(sleep)
    end
    Wait(sleep)
    while true do
		-- print('thread:'..tostring(started))
		sleep = 1000
		while started == true do
			sleep = 500
			if doWeBreak then
				break
			end
			if cfg.debugCrates then
				print('IsInside '..tostring(IsInside))
			end
			if not IsInside then
				SetClosestLootChest()
			end

			if IsInside then
				sleep = 0
				if IsControlJustPressed(0, 38) then
					openLootChest()
					exports['qb-core']:HideText()
					IsInside = false
				end
			end
			Wait(sleep)
		end
		Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while not HasModelLoaded(cfg.ticketMaster.ped) do
        RequestModel(cfg.ticketMaster.ped)
        Wait(0)
    end
    if not pedCreated then
        local ped = CreatePed(1, cfg.ticketMaster.ped, cfg.ticketMaster.location, 45.0, false, true)
        SetEntityAsMissionEntity(ped, true, true)
        clientSetPedInvis(ped)
        pedCreated = true
    end 
end)

Citizen.CreateThread(function()   
    local sleep = 1000
    while true do
        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)
        if #(pedCoords - cfg.ticketMaster.markerLocation) < 10 then
            sleep = 0
            DrawMarker(27, cfg.ticketMaster.markerLocation, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 251, 0, 1.0, false, true, 2, false, nil, nil, false)
            if #(pedCoords - cfg.ticketMaster.markerLocation) < 2 then
                alert("Press ~INPUT_CONTEXT~ to join BattleRoyal!")
                if IsControlJustPressed(1, 51) then
					doWeBreak = false
                    TriggerServerEvent("BattleRoyal:updateTable")
                end
            end
        else
            sleep = 1000
        end
        Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    local sleep = 2500
    while true do
		while not doWeBreak do
			sleep = 2500
			while playStarted and not hillCheck do
				sleep = 0
				local zonecycle = 1
				local newPlayZone = clientHillSize - (zonecycle*cfg.gameSettings.playZoneShrink) -- every Wait period (see below note on Wait()) shrink by cfg*zonecycle
				if cfg.debugZoneCircle then
					print('newPlayZone '..tostring(newPlayZone))
				end
				if newPlayZone < cfg.gameSettings.playZoneDiameterMinimum then
					newPlayZone = cfg.gameSettings.playZoneDiameterMinimum
				end
				if tenCountdown < 180 then
					notify("~r~ There are no more respawns for the rest of the game.")
					respawn = false
				end
				clientHillSize = newPlayZone
				Wait(1000*(cfg.gameSettings.playZoneSession*60)) -- playZoneSession in minutes * 60(seconds) * 1000(convert to ms)
				zonecycle = zonecycle + 1
				-- if doWeBreak then
					-- if cfg.debugZoneCircle then
						-- print('debugZoneCircle '..tostring('break'))
					-- end
					-- break
				-- end
			end
			Wait(sleep)
		end
		Wait(sleep)
	end
end)

Citizen.CreateThread(function()
    local sleep = 1000
    while true do
		while not doWeBreak do
			sleep = 2000
			if cfg.debugZoneDamage then
				print('ClientIsInsidePlayZone: '..tostring(ClientIsInsidePlayZone))
				print('playStarted: '..tostring(playStarted))
				print('flyStart: '..tostring(flyStart))
			end
			while not ClientIsInsidePlayZone and playStarted and not flyStart do
				sleep = 1000
				notify("~r~ Enter the Active Zone or you will suffer Zone DPS")
				local health = GetEntityHealth(PlayerPedId())
				local newHealth = tonumber(health)-cfg.gameSettings.circleZoneDPS
				if cfg.debugZoneDamage then
					print('health: '..tostring(health))
					print('newHealth: '..tostring(newHealth))
				end
				SetEntityHealth(PlayerPedId(), newHealth)
				Wait(sleep)
			end
			-- if doWeBreak then
				-- break
			-- end
			Wait(sleep)
		end
		Wait(sleep)
	end
end)

RegisterNetEvent("BattleRoyal:gamePlayCircle")
AddEventHandler("BattleRoyal:gamePlayCircle", function(newPlayZone)
	playStarted = true
	clientPlayZone = newPlayZone
	if playZone then playZone:destroy() end
	CreateThread(function()
		while playStarted and not hillCheck do
			if not playZone then 
				-- playZone = CircleZone:Create(vector3(cfg.gameSettings.playZoneCenter.x, cfg.gameSettings.playZoneCenter.y, cfg.gameSettings.playZoneCenter.z), clientHillSize, {
				playZone = CircleZone:Create(vector3(clientPlayZone.x, clientPlayZone.y, clientPlayZone.z), clientHillSize, {
					name = 'Active Zone',
					debugColor = {255, 0, 0},
					debugPoly = false
				})
			end
			playZone:onPlayerInOut(function(IsInsidePlayZone)
				if IsInsidePlayZone then
					if cfg.debugPlayCircle then
						print('IsInsidePlayZone: '..tostring(IsInsidePlayZone))
						print('ClientIsInsidePlayZone: '..tostring(ClientIsInsidePlayZone))
					end
					ClientIsInsidePlayZone = true
				else
					if cfg.debugPlayCircle then
						print('IsInsidePlayZone: '..tostring(IsInsidePlayZone))
						print('ClientIsInsidePlayZone: '..tostring(ClientIsInsidePlayZone))
					end
					ClientIsInsidePlayZone = false
				end
			end)
			local point = GetEntityCoords(PlayerPedId())
			if not playZone:isPointInside(vector2(point.x,point.y)) then
				if playStarted and not flyStart then
					ClientIsInsidePlayZone = false
				end
			else
				ClientIsInsidePlayZone = true
			end
			playZone:setRadius(clientHillSize)
			playZone:draw()
			if doWeBreak then
				playZone:destroy()
				break
			end
			Wait(0)
		end
	end)
end)

RegisterNetEvent("BattleRoyal:HillLocationSync")
AddEventHandler("BattleRoyal:HillLocationSync", function(hillLocation)
	clientHillLocation = hillLocation
	hillStarted = true
	if hillZone then hillZone:destroy() end -- used to recreate the hill on sync
	CreateThread(function()
		-- while true do
		-- while not doWeBreak do
		if not hillZone then
			hillZone = BoxZone:Create(vector3(clientHillLocation.x, clientHillLocation.y, clientHillLocation.z), 9.5, 9.5, {
				name = 'Kings Hill',
				heading = 45.0,
				minZ = clientHillLocation.z - 1.0,
				maxZ = clientHillLocation.z + 1.0,
				debugColor = {0, 0, 255},
				debugPoly = false
			})
		end
		SetNewWaypoint(clientHillLocation.x, clientHillLocation.y)
		hillZone:onPlayerInOut(function(IsInsideHill)
			if IsInsideHill then
				exports['qb-core']:DrawText('You are King of the Hill', 'Right')
				if not ClientIsInsideHill then
					ClientIsInsideHill = true
					TriggerServerEvent('BattleRoyal:inHill', ClientIsInsideHill)
				end
			else
				exports['qb-core']:HideText()
				SetNewWaypoint(clientHillLocation.x, clientHillLocation.y)
				if ClientIsInsideHill then
					ClientIsInsideHill = false
					TriggerServerEvent('BattleRoyal:inHill', ClientIsInsideHill)
				end
			end

		end)
		hillZone:draw()
		if doWeBreak then
			hillZone:destroy()
			SetNewWaypoint(cfg.ticketMaster.location.x, cfg.ticketMaster.location.y)
			-- break
		end
		-- if doWeBreak then
			-- break
		-- end
		Wait(0)
		-- end
	end)
end)

RegisterNetEvent("BattleRoyal:lootChestLocationSync")
AddEventHandler("BattleRoyal:lootChestLocationSync", function(lootChestLocations, lootChestIds)
	count = 1
	lootChestLocationsClient = lootChestLocations
	lootChestIdsClient = lootChestIds
	started = true
	CreateThread(function()
		-- while true do
		-- while not doWeBreak do
		
		if stashLocation == nil then
			stashLocation = vector4(4006.73, -4630.83, 3.21, 296.53)
		end
		if ClosestStash == nil then
			ClosestStash = 'LootCrate:'..tostring(8)
		end
		chestTargetBox = BoxZone:Create(vector3(stashLocation.x, stashLocation.y, stashLocation.z), 1.5, 1.5, {
		-- chestTargetBox = BoxZone:Create(vector3(loc.x, loc.y, loc.z), 1.5, 1.5, {
			-- name = lootChestIds[count],
			name = ClosestStash,
			heading = 0.0,
			minZ = stashLocation.z - 1.0,
			maxZ = stashLocation.z + 1.0,
			debugPoly = false
		})
		chestTargetBox:onPlayerInOut(function(IsInside)
			if IsInside then
				IsInside = true
				exports['qb-core']:DrawText('Open [E] '..tostring(ClosestStash), 'Right')
				if IsControlJustPressed(0, 38) then
					openLootChest()
					exports['qb-core']:HideText()
					IsInside = false
				end
			else
				exports['qb-core']:HideText()
				IsInside = false
			end
		end)
		if IsInside == false then
			exports['qb-core']:HideText()
		end
		if doWeBreak then
			chestTargetBox:destroy()
		end
		-- if doWeBreak then
			-- break
		-- end
		Wait(0)
		-- end
	end)
end)

RegisterNetEvent("BattleRoyal:goToFly")
AddEventHandler("BattleRoyal:goToFly", function(plane, gameType, source, plane2, plane3)
    local src = source
	local playerPed = PlayerPedId()
	TriggerServerEvent('BattleRoyal:SaveItems')
	flyStart = true
	if cfg.debug then
		print('goToFly src:'..tostring(src))
		print('goToFly playerid:'..tostring(PlayerId()))
		print('goToFly playerPed:'..tostring(playerPed))
		print('goToFly plane:'..tostring(plane))
		print('goToFly gametype:'..tostring(gameType))
	end
	
	-- FreezeEntityPosition(plane,true)
	SetVehicleForwardSpeed(plane, cfg.planespeed)
	SetVehicleForwardSpeed(plane2, cfg.planespeed)
	SetVehicleForwardSpeed(plane3, cfg.planespeed)
	if gameType == 1 then
		deathCheck = true
		deathCheckTele = true
		gameTypeClient = 1
	end
	if gameType == 2 then
		hillCheck = true
		deathCheckTele = true
		deathCheck = true
		gameTypeClient = 2
	end
	if gameType == 3 then
		teamCheck = true
		deathCheckTele = true
		deathCheck = true
		gameTypeClient = 3
	end
	-- TriggerEvent('consumables:client:ResetParachute', source)
	TriggerEvent('consumables:client:UseParachute', src)
	-- Retrieve the vehicle the player is currently in. 
	Wait(100)
	-- local vehicle = plane
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	local vehiclesaved = GetVehiclePedIsIn(playerPed, false)
	if not vehicle then 
		TriggerServerEvent('BattleRoyal:putmeinaseat', PlayerPedId())
	end
	-- Check if the vehicle exists in the game world.
	-- if not DoesEntityExist(vehicle) then 
		-- If the vehicle does not exist, end the execution of the code here.
		-- return 
	-- end
	SetVehicleForwardSpeed(vehicle, cfg.planespeed)
	-- FreezeEntityPosition(vehicle,true)
	
	Wait(100)
    exports['myFuel']:SetFuel(vehicle, 100.0)
	SetVehicleForwardSpeed(vehicle, cfg.planespeed)
	TriggerServerEvent("BattleRoyal:clearInv")
	local autoChute = false
	while flyStart == true do
	
		SetEntityInvincible(playerPed, true)
		-- FreezeEntityPosition(vehicle,false)
		vehicle = GetVehiclePedIsIn(playerPed, false)
		
		SetVehicleForwardSpeed(vehicle, cfg.planespeed)
		-- TaskPlaneTaxi(pilot ,vehicle ,x ,y ,z ,100 ,10 )
		local coords = GetEntityCoords(vehicle)
		local planedist = #cfg.islandLoc - #coords 
		if not autoChute then
			DrawRect(0.15, 0.25, 0.15, 0.032, 0, 0, 0, 150)
			DrawAdvancedNativeText(0.25, 0.25, 0.005, 0.0028, 0.29, "AUTOCHUTE IN: "..tostring((math.floor(GetEntityHeightAboveGround(playerPed)-cfg.gameSettings.chuteAutoHeight)))..' feet', 255, 255, 255, 255, 0, 0)
		end
		if planedist < 10 then
			local check = GetVehiclePedIsIn(playerPed, false)
			if check then
				TaskLeaveVehicle(playerPed, check, 4160)
				if DoesEntityExist(check) then
					Wait(3000)
					ExplodeVehicle(check, true, false)
					Wait(3000)
					DeleteEntity(check)
				end
			else
				if DoesEntityExist(vehicle) then
					Wait(3000)
					ExplodeVehicle(vehicle, true, false)
					Wait(3000)
					DeleteEntity(vehicle)
				end
			end
		end
		if not vehicle then
			if DoesEntityExist(vehiclesaved) then
				Wait(3000)
				ExplodeVehicle(vehiclesaved, true, false)
				Wait(3000)
				DeleteEntity(vehiclesaved)
			end
		end
		if GetEntityHeightAboveGround(playerPed) <= cfg.gameSettings.chuteAutoHeight then
           if autoChute == false then
				if cfg.debugchute then
					print('Chute GetEntityHeightAboveGround(playerPed) '.. tostring(GetEntityHeightAboveGround(playerPed)))
					print('Chute cfg.gameSettings.chuteAutoHeight '.. tostring(cfg.gameSettings.chuteAutoHeight))
					print('Chute Deployed')
				end
				ForcePedToOpenParachute(playerPed)
				autoChute = true
			end
		end
		if GetEntityHeightAboveGround(playerPed) <= 1.0 then
			TriggerServerEvent('BattleRoyal:deleteBus')
			Wait(3000)
			SetEntityInvincible(playerPed, false)
			flyStart = false
			break
		end
		Wait(1)
	end
end)

RegisterNetEvent("BattleRoyal:announcement")
AddEventHandler("BattleRoyal:announcement", function(killerName, dead)
	
	notify("~r~ "..tostring(killerName).." has killed "..tostring(dead))


end)

RegisterNetEvent("BattleRoyal:tensecondcountdown")
AddEventHandler("BattleRoyal:tensecondcountdown", function()
    tenCountdown = cfg.gameSettings.timeToPlayGame
	if cfg.debugtensecondcountdown then
		print('tensecondcountdown:client:wewerecalled')
		print('tensecondcountdown:client: '..tostring(tenCountdown))
	end
	respawn = true
	started = true
    while started do
		if cfg.debugtensecondcountdown then
			local count = 0
			count = count + 1
			if count == 10000 or count == 0 then
				print('BattleRoyal:tensecondcountdown #clientKillDeathCounterList: '..tostring(#clientKillDeathCounterList))
				print('BattleRoyal:tensecondcountdown tenCountdown: '..tostring(tenCountdown))
				count = 0
			end
		end
        if tenCountdown <= cfg.gameSettings.timeToPlayGame and tenCountdown >= 10 then
            DrawRect(0.944, 0.886, 0.17, 0.032, 0, 0, 0, 150)
            DrawAdvancedNativeText(1.0, 0.892, 0.005, 0.0028, 0.29, "TIME REMAINING:", 255, 255, 255, 255, 0, 0)
			if tenCountdown <= 60 then 
				DrawAdvancedNativeText(1.06, 0.885, 0.005, 0.0028, 0.464, "00:" .. tostring(tenCountdown), 255, 255, 255, 255, 0, 0)
			else
				local minutesCountDown = math.floor(tenCountdown / 60)
				local secondsLeft = math.floor(tenCountdown-(math.floor(minutesCountDown*60)))
				if secondsLeft < 10 then
					DrawAdvancedNativeText(1.06, 0.885, 0.005, 0.0028, 0.464, tostring(minutesCountDown)..":0"..tostring(secondsLeft), 255, 255, 255, 255, 0, 0)
				else
					DrawAdvancedNativeText(1.06, 0.885, 0.005, 0.0028, 0.464, tostring(minutesCountDown)..":"..tostring(secondsLeft), 255, 255, 255, 255, 0, 0)
				end
			end
        end
        if tenCountdown <= cfg.gameSettings.timeToPlayGame and tenCountdown < 10 then
            DrawRect(0.944, 0.886, 0.17, 0.032, 0, 0, 0, 150)
            DrawAdvancedNativeText(1.0, 0.892, 0.005, 0.0028, 0.29, "TIME REMAINING:", 255, 255, 255, 255, 0, 0)
            DrawAdvancedNativeText(1.06, 0.885, 0.005, 0.0028, 0.464, "00:0" .. tostring(tenCountdown), 255, 255, 255, 255, 0, 0)
        end
		DrawRect(0.85, 0.15, 0.30, 0.25, 0, 0, 0, 150)
		DrawAdvancedNativeText(0.84, 0.05, 0.005, 0.0028, 0.35, "PlayerName", 0, 255, 0, 255, 0, 0)
		DrawAdvancedNativeText(0.89, 0.05, 0.005, 0.0028, 0.35, "Kills", 255, 0, 0, 255, 0, 0)
		DrawAdvancedNativeText(0.94, 0.05, 0.005, 0.0028, 0.35, "Deaths", 0, 0, 255, 255, 0, 0)
		DrawAdvancedNativeText(0.99, 0.05, 0.005, 0.0028, 0.35, "TimeAlive", 155, 155, 155, 255, 0, 0)
		DrawAdvancedNativeText(1.04, 0.05, 0.005, 0.0028, 0.35, "TimeInHill", 0, 255, 255, 255, 0, 0)
		DrawAdvancedNativeText(1.08, 0.05, 0.005, 0.0028, 0.35, "Team", 0, 255, 0, 255, 0, 0)
		local w = 0.05
		if #clientKillDeathCounterList > 0 then
			for i,d in pairs(clientKillDeathCounterList) do
				w = w + 0.03
				DrawAdvancedNativeText(0.84, w, 0.005, 0.0028, 0.25, tostring(clientKillDeathCounterList[i].name), 0, 255, 0, 255, 0, 0)
				DrawAdvancedNativeText(0.89, w, 0.005, 0.0028, 0.25, tostring(clientKillDeathCounterList[i].kills), 255, 0, 0, 255, 0, 0)
				DrawAdvancedNativeText(0.94, w, 0.005, 0.0028, 0.25, tostring(clientKillDeathCounterList[i].deaths), 0, 0, 255, 255, 0, 0)
				if teamCheck then
					DrawAdvancedNativeText(1.09, w, 0.005, 0.0028, 0.25, tostring(clientKillDeathCounterList[i].team), 0, 255, 0, 255, 0, 0)
				end
				if clientKillDeathCounterList[i].surviveTime > 60 then
					local minutes = math.floor(clientKillDeathCounterList[i].surviveTime / 60)
					if clientKillDeathCounterList[i].surviveTime-(minutes*60) < 10 then
						DrawAdvancedNativeText(0.99, w, 0.005, 0.0028, 0.25, tostring(minutes)..':0'..tostring(clientKillDeathCounterList[i].surviveTime-(minutes*60)), 155, 155, 155, 255, 0, 0)
					else
						DrawAdvancedNativeText(0.99, w, 0.005, 0.0028, 0.25, tostring(minutes)..':'..tostring(clientKillDeathCounterList[i].surviveTime-(minutes*60)), 155, 155, 155, 255, 0, 0)
					end
				else
					DrawAdvancedNativeText(0.99, w, 0.005, 0.0028, 0.25, tostring(clientKillDeathCounterList[i].surviveTime), 155, 155, 155, 255, 0, 0)
				end
				if clientKillDeathCounterList[i].hillTime > 60 then
					local minutes = math.floor(clientKillDeathCounterList[i].hillTime / 60)
					if clientKillDeathCounterList[i].hillTime-(minutes*60) < 10 then
						DrawAdvancedNativeText(1.04, w, 0.005, 0.0028, 0.25, tostring(minutes)..':0'..tostring(clientKillDeathCounterList[i].hillTime-(minutes*60)), 0, 255, 255, 255, 0, 0)
					else
						DrawAdvancedNativeText(1.04, w, 0.005, 0.0028, 0.25, tostring(minutes)..':'..tostring(clientKillDeathCounterList[i].hillTime-(minutes*60)), 0, 255, 255, 255, 0, 0)
					end
				else
					DrawAdvancedNativeText(1.04, w, 0.005, 0.0028, 0.25, tostring(clientKillDeathCounterList[i].hillTime), 0, 255, 255, 255, 0, 0)
				end
				-- DrawAdvancedNativeText(h, w, 0.005, 0.0028, 0.25, tostring(GetPlayerName(tonumber(i))), 0, 255, 0, 255, 0, 0)
			end
		end
        if doWeBreak then
			started = false
            break
        end
        Wait(0)
    end
end)


Citizen.CreateThread(function()
    timeLeft = 0
    while true do
        while timeLeft > 0 do
            timeLeft = timeLeft - 1
            Wait(1000)
        end
        Wait(1000)
    end
end)

Citizen.CreateThread(function()
    tenCountdown = cfg.gameSettings.timeToPlayGame
    while true do
		if gameTypeClient == 1 then
			while not doWeBreak do
				while tenCountdown > 0 do
					if cfg.debugtensecondcountdown then
						print("cfg.debugtensecondcountdown tenCountdown: "..tostring(tenCountdown))
						print('#clientKillDeathCounterList: '..tostring(#clientKillDeathCounterList))
					end
					if tenCountdown < 60 then
						if #clientKillDeathCounterList > 1 then
							local aliveCount = 0
							for a,b in pairs(clientKillDeathCounterList) do
								if cfg.debugtensecondcountdown then
									print('clientKillDeathCounterList A: '..tostring(a))
									print('clientKillDeathCounterList B: '..tostring(b))
								end
								if clientKillDeathCounterList[a].isAlive == true then
									if cfg.debugtensecondcountdown then
										print('clientKillDeathCounterList.id: '..tostring(clientKillDeathCounterList[a].id))
										print('clientKillDeathCounterList.isAlive: '..tostring(clientKillDeathCounterList[a].isAlive))
									end
									aliveCount = aliveCount + 1
								end
								if cfg.debugtensecondcountdown then
									print('aliveCount: '..tostring(aliveCount))
								end
								if aliveCount > 1 then
									tenCountdown = tenCountdown + 1
								elseif aliveCount <= 1 then
									if trigger then 
										trigger = false
										if cfg.debugtensecondcountdown then
											print('trigger: '..tostring(trigger))
										end
										TriggerServerEvent('BattleRoyal:morethanone', false)
									end
								end
							end
						end
					end
					tenCountdown = tenCountdown - 1
					Wait(1000)
				end	
			Wait(1000)
			end
		end
    Wait(5000)
    end
end)

Citizen.CreateThread(function()
    local ped = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()
	local sleep = 2500
    while true do
		while not doWeBreak do
			if started then
				sleep = 1000
				if deathCheck or deathCheckTele then
					local player = PlayerId()
					local killer_2, killerWeapon = NetworkGetEntityKillerOfPlayer(player)
					local killer = GetPedSourceOfDeath(ped)
					if killer_2 ~= 0 and killer_2 ~= -1 then killer = killer_2 end
					local killerId = NetworkGetPlayerIndexFromPed(killer)
					local killerName = killerId ~= -1 and GetPlayerName(killerId) .. ' ' .. '(' .. GetPlayerServerId(killerId) .. ')' or Lang:t('info.self_death')
					local weaponLabel = Lang:t('info.wep_unknown')
					local weaponName = Lang:t('info.wep_unknown')
					local weaponItem = QBCore.Shared.Weapons[killerWeapon]
					local killerWeapon = NetworkGetEntityKillerOfPlayer(player)
					if weaponItem then
						weaponLabel = weaponItem.label
						weaponName = weaponItem.name
					end
					if killerId == -1 then killerId = PlayerData.source end
					if killerId ~= -1 and GetEntityHealth(PlayerPedId()) == 0 then
								
						if cfg.debugKills then
							print('ped'..tostring(ped))
							print('killerName'..tostring(killerName))
							print('killerWeapon: '..tostring(killerWeapon))
							print('player: '..tostring(player))
							print('killerId: '..tostring(GetPlayerServerId(killerId)))
							print('killerIdentity: '..tostring(killerIdentity))
							print('weaponName: '..tostring(weaponName))
							print('DeathName: '..tostring(PlayerData.name))
							print('Deathsource: '..tostring(PlayerData.source))
							
						end
						-- TriggerServerEvent('BattleRoyal:killCounter', GetPlayerServerId(killerId))
						TriggerServerEvent('BattleRoyal:killCounter', killerId)
						notify("~g~ You will be revived in 5 seconds.")
						Wait(5000)
						if respawn == true then
							if deathCheckTele then
								notify("~g~ You will be teleported in 5 seconds.")
								Wait(5000)
								-- TriggerServerEvent('BattleRoyal:reviveMe')
								if cfg.debugKills then
									SetEntityCoords(ped, vector3(4455.43, -4499.14, 4.19), false, false, false, false)
								else
									local spawnPoint = cfg.gameSettings.spawnOnDeath[math.random(#cfg.gameSettings.spawnOnDeath)]
									if gameTypeClient ~= 2 then
										while not playZone:isPointInside(spawnPoint) do
											spawnPoint = cfg.gameSettings.spawnOnDeath[math.random(#cfg.gameSettings.spawnOnDeath)]
											Wait(1)
										end
									end
									SetEntityCoords(ped, spawnPoint, false, false, false, false)
								end
								notify("~g~ You will be revived in 5 seconds.")
								Wait(5000)
								TriggerEvent('hospital:client:Revive', PlayerData.source)
							end
							TriggerEvent('hospital:client:Revive', PlayerData.source)
						else
							notify("~r~ Respawns disabled for the rest of the game.")
							notify("~g~ You will be revived in 5 seconds.")
							Wait(5000)
							TriggerEvent('hospital:client:Revive', PlayerData.source)
							notify("~r~ Respawns disabled for the rest of the game.")
							notify("~y~ Please observe the match ONLY.")
							SetEntityCoords(ped, cfg.gameSettings.spawnOnDeathWithNoRevive, false, false, false, false)
							SetEntityInvincible(PlayerPedId(), true)
							TriggerServerEvent("BattleRoyal:clearInvGold")
							if cfg.debugKills then
								SetEntityCoords(ped, vector3(4455.43, -4499.14, 4.19), false, false, false, false)
							end
						end
					end
				end
			else
				sleep = 5000
			end
			Wait(sleep)
		end
		Wait(sleep)
	end
end)

Citizen.CreateThread(function()
    local ped = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()
	local player = PlayerId()
	local myTeam = nil
	local sleep = 5000
    -- while true do
    while not doWeBreak do
		if started then
			if teamCheck then
				sleep = 0
				for o,p in pairs(clientKillDeathCounterList) do
					if PlayerData.source == clientKillDeathCounterList[o].id then
						myTeam = clientKillDeathCounterList[o].team
					end
				end
				for k,l in pairs(clientKillDeathCounterList) do
					if myTeam == clientKillDeathCounterList[k].team then
						local pid = clientKillDeathCounterList[k].id
						local ped = GetPlayerPed(pid)
						local blip = GetBlipFromEntity(ped)
						local playerLocation = GetEntityCoords(ped)
						-- local blip = nil
						if not DoesBlipExist(blip) then
							if NetworkIsPlayerActive(pid) then
								blip = AddBlipForEntity(ped)
							else
								blip = AddBlipForCoord(playerLocation.x, playerLocation.y, playerLocation.z)
							end
							SetBlipSprite(blip, 1)
							ShowHeadingIndicatorOnBlip(blip, true)
							SetBlipRotation(blip, GetEntityHeading(ped))
							SetBlipScale(blip, 1.0)
							SetBlipColour(blip, 69)
							SetBlipAsShortRange(blip, true)
							BeginTextCommandSetBlipName('STRING')
							AddTextComponentSubstringPlayerName('TeamMate')
							EndTextCommandSetBlipName(blip)
							TeamBlips[#TeamBlips + 1] = blip
						end

						if GetBlipFromEntity(PlayerPedId()) == blip then
							-- Ensure we remove our own blip.
							RemoveBlip(blip)
						end
					end
				end
			else
				sleep = 2000
			end
		else
			sleep = 5000
		end
		Wait(sleep)
    end
end)


RegisterNetEvent("BattleRoyal:updateKD")
AddEventHandler("BattleRoyal:updateKD", function(killDeathCounterList)
	if cfg.debugKDCounterList then
		print('KDCounterList: '..tostring(killDeathCounterList))
	end
	clientKillDeathCounterList = killDeathCounterList
end)

RegisterNetEvent("BattleRoyal:SlotsFilled")
AddEventHandler("BattleRoyal:SlotsFilled", function()
    notify("~r~No space available")
end)

RegisterNetEvent("BattleRoyal:alreadyInQueue")
AddEventHandler("BattleRoyal:alreadyInQueue", function()
    notify("~r~You are already in the queue.")
end)

RegisterNetEvent("BattleRoyal:GameOngoing")
AddEventHandler("BattleRoyal:GameOngoing", function()
    notify("~r~There is currently a game ongoing.")
end)

RegisterNetEvent("BattleRoyal:NotEnoughPlayers")
AddEventHandler("BattleRoyal:NotEnoughPlayers", function()
    notify("~r~Not enough players to start the game.")
end)

RegisterNetEvent("BattleRoyal:gameover")
AddEventHandler("BattleRoyal:gameover", function()
	local ped = GetPlayerPed()
	TriggerEvent("hospital:client:Revive")
	TriggerServerEvent("BattleRoyal:clearInvGold")
	Wait(1000)
	TriggerServerEvent("BattleRoyal:GiveItems")
    notify("~g~Your game has now finished.")
	SetCurrentPedWeapon(PlayerPedId(), `weapon_unarmed`, true)
	timeLeft = 0
	tenCountdown = 0
	clientHillSize = cfg.gameSettings.playZoneDiameterStart
	pedCreated = false
	clientPlayZone = nil
	respawn = true
	ClosestStash = nil
	playZone = nil
	hillZone = nil
	IsInside = false
	IsInsideHill = false
	ClientIsInsideHill = false
	doWeBreak = true
	trigger = true
	started = false
	playStarted = false
	flyStart = false
	clientHillLocation = nil
	stashLocation = nil
	location = nil
	lootChestLocationsClient = {}
	lootChestIdsClient = {}
	TeamBlips = {}
	vehicle = nil
	gameTypeClient = 0
	clientvotese = 0
	clientvotesy = 0
	clientvotesq = 0
	deathCheck = false
	teamCheck = false
	hillCheck = false
	clientPlayerQueue = {}
	clientKillDeathCounterList = {}
	clientKillCounterList = {}
	clientDeathCounterList = {}
	-- timeLeft = 30
	-- tenCountdown = cfg.gameSettings.timeToPlayGame
	-- clientHillSize = cfg.gameSettings.playZoneDiameterStart
	-- pedCreated = false
	-- respawn = true
	-- ClosestStash = nil
	-- playZone = nil
	-- clientPlayZone = nil
	-- hillZone = nil
	-- hillStarted = false
	-- playStarted = false
	-- started = false
	-- IsInside = false
	-- ClientIsInsideHill = false
	-- flyStart = false
	-- clientHillLocation = nil
	-- stashLocation = nil
	-- location = nil
	-- lootChestLocationsClient = {}
	-- lootChestIdsClient = {}
	-- trigger = true
	-- TeamBlips = {}
	-- vehicle = nil
	-- clientvotese = 0
	-- clientvotesy = 0
	-- clientvotesq = 0
	-- deathCheckTele = false
	-- deathCheck = false
	-- teamCheck = false
	-- hillCheck = false
	-- doWeBreak = true
	-- clientPlayerQueue = {}
	-- clientKillDeathCounterList = {}
	-- clientKillCounterList = {}
	-- clientDeathCounterList = {}
	SetNewWaypoint(cfg.ticketMaster.location.x, cfg.ticketMaster.location.y)
	SetEntityInvincible(PlayerPedId(), false)
	exports['qb-core']:HideText()
end)

RegisterNetEvent("BattleRoyal:JoinedQueue")
AddEventHandler("BattleRoyal:JoinedQueue", function(timer)
    notify("~g~You have joined the queue.")
	TriggerServerEvent("NS-BattleRoyal:server:payForPlay")
	local myVote = nil
    timeLeft = timer
	local count = 200
	Wait(1000)
	local textList = {'[E] = Last Man Standing','[Y] = King of the Hill','[Q] = Team DeathMatch'}
    while true do
		if myVote == nil and timeLeft >= 3 then
            DrawRect(0.5, 0.5, 0.40, 0.30, 0, 0, 0, 150)
            DrawAdvancedNativeText(0.50, 0.45, 0.005, 0.0028, 0.55, "VOTE:", 100, 0, 255, 255, 0, 0)
            DrawAdvancedNativeText(0.58, 0.46, 0.005, 0.0028, 0.35, "TESTING [E][Y][Q]", 100, 0, 255, 255, 0, 0)
            DrawAdvancedNativeText(0.55, 0.50, 0.005, 0.0028, 0.35, "[E] = Last Man Standing", 255, 0, 0, 255, 0, 0)
            DrawAdvancedNativeText(0.55, 0.55, 0.005, 0.0028, 0.35, "[Y] = King of the Hill", 0, 255, 0, 255, 0, 0)
            DrawAdvancedNativeText(0.55, 0.60, 0.005, 0.0028, 0.35, "[Q] = Team DeathMatch", 155, 155, 155, 255, 0, 0)
            if IsControlJustPressed(0, 38) then -- E
				myVote = '[E] = Last Man Standing'
				local vote = 1
				notify("~r~You have selected "..tostring(myVote))
				TriggerServerEvent('BattleRoyal:receiveVote', vote)
			end
			if IsControlJustPressed(0, 246) then -- Y
				myVote = '[Y] = King of the Hill'
				local vote = 2
				notify("~g~You have selected "..tostring(myVote))
				TriggerServerEvent('BattleRoyal:receiveVote', vote)
			end
			if IsControlJustPressed(0, 264) then -- Q
				myVote = '[Q] = Team DeathMatch'
				local vote = 3
				notify("~y~You have selected "..tostring(myVote))
				TriggerServerEvent('BattleRoyal:receiveVote', vote)
			end
			if timeLeft == 3 and myVote == nil then
				local vote = cfg.gameSettings.default
				myVote = textList[vote]
				notify("~b~You have selected default "..tostring(myVote))
				TriggerServerEvent('BattleRoyal:receiveVote', vote)
			end
		end
		if count == 200 then
			QBCore.Functions.TriggerCallback('BattleRoyal:votesReturn', function(results)
				clientvotese = results[1]
				clientvotesy = results[2]
				clientvotesq = results[3]
			end, clientvotese, clientvotesy, clientvotesq)
		end
		count = count - 1
		if count <= 0 then 
			count = 200
		end
		if myVote ~= nil then
            DrawRect(0.5, 0.5, 0.40, 0.30, 0, 0, 0, 150)
            DrawAdvancedNativeText(0.50, 0.45, 0.005, 0.0028, 0.55, "VOTE:", 0, 0, 255, 255, 0, 0)
            DrawAdvancedNativeText(0.58, 0.46, 0.005, 0.0028, 0.35, tostring(myVote), 255, 0, 0, 255, 0, 0)
            DrawAdvancedNativeText(0.55, 0.50, 0.005, 0.0028, 0.35, "[E] = Last Man Standing = "..tostring(clientvotese), 155, 155, 155, 255, 0, 0)
            DrawAdvancedNativeText(0.55, 0.55, 0.005, 0.0028, 0.35, "[Y] = King of the Hill = "..tostring(clientvotesy), 155, 155, 155, 255, 0, 0)
            DrawAdvancedNativeText(0.55, 0.60, 0.005, 0.0028, 0.35, "[Q] = Team DeathMatch = "..tostring(clientvotesq), 155, 155, 155, 255, 0, 0)
		end
        if timeLeft > 9 then 
            DrawRect(0.944, 0.886, 0.081, 0.032, 0, 0, 0, 150)
            DrawAdvancedNativeText(1.013, 0.892, 0.005, 0.0028, 0.29, "TIME:", 255, 255, 255, 255, 0, 0)
            DrawAdvancedNativeText(1.05, 0.885, 0.005, 0.0028, 0.464, "00:" .. tostring(timeLeft), 255, 255, 255, 255, 0, 0)
        elseif timeLeft < 10 then
            DrawRect(0.944, 0.886, 0.081, 0.032, 0, 0, 0, 150)
            DrawAdvancedNativeText(1.013, 0.892, 0.005, 0.0028, 0.29, "TIME:", 255, 255, 255, 255, 0, 0)
            DrawAdvancedNativeText(1.05, 0.885, 0.005, 0.0028, 0.464, "00:0" .. tostring(timeLeft), 255, 255, 255, 255, 0, 0)
        end
        if timeLeft == 0 then
            break
        end
	Wait(0)
    end
end)

RegisterNetEvent("BattleRoyal:Started")
AddEventHandler("BattleRoyal:Started", function()
	
    notify("~g~Game starting in 3")
	TriggerServerEvent('BattleRoyal:SaveItems')
    Citizen.Wait(1000)
    notify("~g~Game starting in 2")
    Citizen.Wait(1000)
    notify("~g~Game starting in 1")
    Citizen.Wait(1000)
    TriggerServerEvent("BattleRoyal:Start")
    while not HasModelLoaded(cfg.transport.vehicleModel) do 
        RequestModel(cfg.transport.vehicleModel)
        Wait(0) 
    end
	started = true
    notify("~g~Game started!")

    
end)

