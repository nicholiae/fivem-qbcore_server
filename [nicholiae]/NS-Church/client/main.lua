local QBCore = exports['qb-core']:GetCoreObject()

local canDonate = 0
local wantedLevel = 0

local churchCache = {}

local PlayerSitted = false
local PlayerSeated = 1

-- Server Seat Locales
local Seat1 = false
local Seat2 = false
local Seat3 = false
local Seat4 = false
local Seat5 = false
local Seat6 = false
local Seat7 = false

-- Client Seat Locales
local Seat1Taken = false
local Seat2Taken = false
local Seat3Taken = false
local Seat4Taken = false
local Seat5Taken = false
local Seat6Taken = false
local Seat7Taken = false


-- FreezeEntityPosition(PlayerPedId(), false)

function AttendChurch()
	if Config.Debug == true then
		print("outfit change")
	end
	if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then
		TriggerEvent('qb-clothing:client:loadOutfit', {
			outfitData = {
				["arms"] = { item = 14, texture = 0 },
				["t-shirt"] = { item = -1, texture = 0 },
				["torso2"] = { item = 4, texture = 0 },
				["vest"] = { item = 21, texture = 0 },
				["pants"] = { item = 13, texture = 0 },
				["shoes"] = { item = 68, texture = 0 },
				["glass"] = { item = 0, texture = 0 }
			}
		})
	else
		TriggerEvent('qb-clothing:client:loadOutfit', {
			outfitData = {
				["arms"] = { item = 356, texture = 0 },
				["t-shirt"] = { item = 6, texture = 0 },
				["torso2"] = { item = 366, texture = 1 },
				["pants"] = { item = 37, texture = 0 },
				["shoes"] = { item = 79, texture = 2 },
				["glass"] = { item = 0, texture = 0 }
			}
		})
	end
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

CreateThread(function()
	local blip = AddBlipForCoord(Config.EnterLocation.x, Config.EnterLocation.y, Config.EnterLocation.z)
	SetBlipSprite (blip, 153)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.75)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 0)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName("God's House")
	EndTextCommandSetBlipName(blip)
end)

local function LoadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end
end

local function hintToDisplay(text)
	exports['qb-core']:DrawText(text)
end

local function hideLastHint()
	exports['qb-core']:HideText()
end
-- Ped spawn and mission accept
CreateThread(function()
	while true do
		local plyCoords = GetEntityCoords(PlayerPedId())
		local dist = #(Config.EnterLocation - plyCoords)
		local sleep = 5000
		if dist <= 50.0 then
			sleep = 500
			if dist <= 5.0 then
				-- if Config.Debug == true then
					-- print("callback return value: "..tostring(activeStatus))
				-- end
				sleep = 0
				DrawText3D(Config.EnterLocation.x, Config.EnterLocation.y, Config.EnterLocation.z+0.5,"~b~[E]~w~ To Attend Church")		
				if IsControlJustPressed(0, 38) then
								
					TriggerServerEvent('NS-Church:GetPlayerSeated')
					wantedLevel = GetPlayerWantedLevel(PlayerId())
					
					if Config.DebugWanted == true then
						print("wantedLevel for Cost: "..tostring(wantedLevel))
						print("wantedLevel for Get: "..tostring(GetPlayerWantedLevel(PlayerId())))
					end
					-- if wantedLevel == 0 then
						-- wantedLevel = 1 
					-- end
					if Config.Debug == true then
						print("Accepted Church")
					end
					TriggerServerEvent("NS-Church:server:accept")
				end
			end
		end
		Wait(sleep)
	end
end)

function startDonate()
	canDonate = 1
	if Config.Debug == true then
		print("startDonate")
	end
	CreateThread(function()
		if Config.DebugDonate == true then
			print("Outside canDonate")
		end
		while canDonate == 1 do
			
			
			local donationPrice = Config.DonationToEnd*wantedLevel
			if Config.DebugDonate == true then
				print("Inside canDonate")
				print("Donation Price: "..tostring(donationPrice))
				print("DonationToEnd: "..tostring(Config.DonationToEnd))
				print("wantedLevel: "..tostring(wantedLevel))
				print("Inside canDonate")
			end
			DrawText3D(Config.SeatLocations[PlayerSeated].x, Config.SeatLocations[PlayerSeated].y, Config.SeatLocations[PlayerSeated].z+0.5,"~b~[E]~w~ To Donate "..Config.Currency..tostring(donationPrice).." to Church")
			if IsControlJustPressed(0, 38) then
				if Config.DebugDonate == true then
					print("Donated to Church")
				end
				canDonate = 0
				local newLevel = 0
				SetPlayerWantedLevel(PlayerId(), newLevel)
				TriggerServerEvent('NS-Church:server:resetWanted', PlayerId(), newLevel)
				TriggerServerEvent("NS-Church:server:donation", donationPrice)
			end	
			Wait(1)
		end
		Wait(1)
	end)
end

RegisterNetEvent('NS-Church:client:started', function()
	-- this is where we need to start after accepting
	
	if Config.Debug == true then
		print("Attending Church")
	end
	DoScreenFadeOut(500)
	Wait(1000)
	
	if not Seat1 and not Seat1Taken then
		Seat1Taken = true
		TriggerServerEvent('NS-Church:Seat1')
	elseif not Seat2 and not Seat2Taken then
		Seat2Taken = true
		TriggerServerEvent('NS-Church:Seat2')
	elseif not Seat3 and not Seat3Taken then
		Seat3Taken = true
		TriggerServerEvent('NS-Church:Seat3')
	elseif not Seat4 and not Seat4Taken then
		Seat4Taken = true
		TriggerServerEvent('NS-Church:Seat4')
	elseif not Seat5 and not Seat5Taken then
		Seat5Taken = true
		TriggerServerEvent('NS-Church:Seat5')
	elseif not Seat6 and not Seat6Taken then
		Seat6Taken = true
		TriggerServerEvent('NS-Church:Seat6')
	elseif not Seat7 and not Seat7Taken then
		Seat7Taken = true
		TriggerServerEvent('NS-Church:Seat7')
	end
	
	local player = PlayerPedId()
	local plib = 'tigerle@custom@couple@sittingonbench@no1a'
	local panim = 'tigerle_couple_sittingonbench_no1a'
	LoadAnimDict(plib)
	AttendChurch()
	startService = 1 
	
	if Config.Debug == true then
		print("PlayerSeated: "..tostring(PlayerSeated))
	end
	if PlayerSeated == 0 then
		PlayerSeated = 1
	end
	SetEntityCoords(player, Config.SeatLocations[PlayerSeated].x, Config.SeatLocations[PlayerSeated].y, Config.SeatLocations[PlayerSeated].z, true, true, true, false)
	SetEntityHeading(player,Config.SeatLocations[PlayerSeated].w)
	SetEntityCompletelyDisableCollision(player, true, false)
	TaskPlayAnim(player, plib, panim, 3.0, 3.0, 600000, 1, 0.15, 0, 0, 0)
	-- TaskStartScenarioInPlace(player,'PROP_HUMAN_SEAT_CHAIR_MP_PLAYER')
	FreezeEntityPosition(player, true)
	Wait(1000)
	DoScreenFadeIn(500)
	startDonate()
	while startService == 1 do
		canDonate = 1
		if Config.DebugPriest == true then
			print("Inside StartService")
		end
		local randomNumber = math.random(1,9)
		if Config.DebugPriest == true then
			print("Priest Animation #"..tostring(randomNumber))
		end
		local newLevel = GetPlayerWantedLevel(PlayerId())-1
		if newLevel < 0 then
			newLevel = 0
		end
		local Time = (3000*newLevel)
		if Time == 0 then
			Time = 3000
		end
		QBCore.Functions.Notify('You are attending mass', "success", Time)
		SetPlayerWantedLevel(PlayerId(), newLevel)
		TriggerServerEvent('NS-Church:server:resetWanted', player, newLevel)
		local priestlib = Config.PriestLib[randomNumber]
		LoadAnimDict(priestlib)
		local pranim = Config.PriestAnim[randomNumber]
		TriggerServerEvent('NS-Church:server:dancePriest',player, priestlib,pranim)
		Wait(Time)
	end
end)



RegisterNetEvent('NS-Church:client:CleanUp', function()

	if Config.Debug == true then
		print("Top of cleanup")
	end
	
	------------------- First seat ----------------------
	if Seat1Taken then
		Seat1Taken = false
		TriggerServerEvent('NS-Church:RemoveSeat1')

	------------------- Second seat ----------------------
	elseif Seat2Taken then
		Seat2Taken = false
		TriggerServerEvent('NS-Church:RemoveSeat2')

	------------------- Third seat ----------------------
	elseif Seat3Taken then
		Seat3Taken = false
		TriggerServerEvent('NS-Church:RemoveSeat3')

	------------------- Fourth seat ----------------------
	elseif Seat4Taken then
		Seat4Taken = false
		TriggerServerEvent('NS-Church:RemoveSeat4')

	------------------- Fifth seat ----------------------
	elseif Seat5Taken then
		Seat5Taken = false
		TriggerServerEvent('NS-Church:RemoveSeat5')

	------------------- Sixth seat ----------------------
	elseif Seat6Taken then
		Seat6Taken = false
		TriggerServerEvent('NS-Church:RemoveSeat6')

	------------------- Seventh seat ----------------------
	elseif Seat7Taken then
		Seat7Taken = false
		TriggerServerEvent('NS-Church:RemoveSeat7')
	end
	
	local player = PlayerPedId()
	startService = 0
	canDonate = 0
	wantedLevel = 0
	ClearPedTasks(PlayerPedId())
	-- DeleteEntity(priest)
	SetEntityCompletelyDisableCollision(player, false, true)
	SetEntityCollision(player, true, true)
	FreezeEntityPosition(player, false)
	if Config.Debug == true then
		print("Finally Clean")
	end
	QBCore.Functions.Notify('Church is setting up for next service', "success")
end)

RegisterNetEvent('NS-Church:client:Paid', function()
	-- this is where we need to end the service early
	startService = 0
	if Config.Debug == true then
		print("Paid Client")
	end
	TriggerEvent('NS-Church:client:CleanUp', -1)
	
end)


RegisterNetEvent("NS-Church:SetPlayerSeated")
AddEventHandler("NS-Church:SetPlayerSeated", function(GetPlayerSeated, Seat1Busy,  Seat2Busy, Seat3Busy, Seat4Busy, Seat5Busy, Seat6Busy, Seat7Busy)
	Seat1 = Seat1Busy
	Seat2 = Seat2Busy
	Seat3 = Seat3Busy
	Seat4 = Seat4Busy
	Seat5 = Seat5Busy
	Seat6 = Seat6Busy
	Seat7 = Seat7Busy
	PlayerSeated = GetPlayerSeated
end)
