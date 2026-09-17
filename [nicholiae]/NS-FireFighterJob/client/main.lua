local QBCore = exports['qb-core']:GetCoreObject()
local currentFires = {}
local quedFires = {}
local players
local firefighterCount = 0
local triggeredFires = 0
local unlucky = Config.StartLuck
local firestarterExplo = false
local firestarter = false
local blip
local blip2
local blip3
local blip4
-- Functions

---@param witnesses table | Array of peds that witnessed the event
---@param ped number | Ped ID to check
---@return boolean | Returns true if the ped is in the witnesses table
local function isPedAWitness(witnesses, ped)
    for k, v in pairs(witnesses) do
        if v == ped then
            return true
        end
    end
    return false
end

local function DrawText3D(x, y, z, text)
	SetTextScale(0.3, 0.3)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 400
    DrawRect(0.0, 0.0+0.0110, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

-- Events

local function CreateFire(Firecoords, elapsed, children)
	if Config.Debug then
		print('Fire create @'..tostring(Firecoords)..' with a timer of '..tostring(elapsed)..' and '..tostring(children)..' children')
	end
	if firefighterCount < 1 then
		elapsed = 5
		children = 10
	end
	for _ = 1, math.random(1, 7), 1 do
		TriggerServerEvent("firefighter:StartServerFire", Firecoords, children, true)
	end
	if elapsed > 0 then
		Wait(elapsed*60000)
		TriggerServerEvent("firefighter:StopFires")
	end
end

RegisterNetEvent('firefighter:client:SetFireFighterCount', function(amount)
    firefighterCount = amount or 0
	if firefighterCount < 0 then
		firefighterCount = 0
	end
	if Config.Debug then
		print("firefighterCount:"..tostring(firefighterCount))
	end
end)

RegisterNetEvent('firefighter:client:sendLuck', function(luck)
    unlucky = luck
	if Config.Debug then
		print('sendLuck:'..tostring(unlucky))
	end
end)

RegisterNetEvent('firefighter:StartFire', function(coords, maxChildren, isGasFire)
	if Config.Debug then
		print('StartFire Coords:'..tostring(coords))
	end
    if #(vector3(coords.x, coords.y, coords.z) - GetEntityCoords(PlayerPedId())) < 100 then
		local pos = {
			x = coords.x,
			y = coords.y,
			z = coords.z,
		}
		local fire = StartScriptFire(pos.x, pos.y, pos.z, maxChildren, isGasFire)
		currentFires[#currentFires+1] = fire
    end
end)

-- RegisterNetEvent('firefighter:queFireForFireFighters', function(coords, maxChildren, isGasFire)
	-- if Config.Debug then
		-- print('queFireForFireFighters Coords:'..tostring(coords))
	-- end
	-- local pos = {
		-- x = coords.x,
		-- y = coords.y,
		-- z = coords.z,
	-- }
	-- local retval, groundZ = GetGroundZFor_3dCoord(pos.x, pos.y, pos.z, true)

	-- if retval then
	   -- local newPosOfFire = vector3(pos.x,pos.y, groundZ)
	   -- pos = newPosOfFire
	-- end
	-- local fire = 
	-- {
		-- ['pos'] = vector3(pos.x, pos.y, pos.z), 
		-- ['maxChildren'] = maxChildren, 
		-- ['isGasFire'] = isGasFire 
	-- }
	-- quedFires[#quedFires+1] = fire
-- end)

RegisterNetEvent('firefighter:StopFires', function()
    for i = 1, #currentFires do
        RemoveScriptFire(currentFires[i])
    end
	currentFires = {}
	unlucky = 50
	triggeredFires = 0
end)

AddEventHandler('CEventExplosionHeard', function(witnesses, ped)
	
	if witnesses and not isPedAWitness(witnesses, ped) then return end
	for k,v in pairs(witnesses) do
		if not IsPedAPlayer(v) then
			local pos = GetEntityCoords(witnesses[k])
			local pheading = GetEntityHeading(witnesses[k])
			local forw = GetEntityForwardVector(witnesses[k])
			local street1, street2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
			local street1name = GetStreetNameFromHashKey(street1)
			local street2name = GetStreetNameFromHashKey(street2)
			local text = street1name.. ' ' ..street2name
			-- local posofFire = vector3(pos.x+forw.y+8, pos.y-forw.x-8, pos.z)
			local posofFire = vector3(pos.x, pos.y, pos.z)
			local breakCounter = 10
			local dist = #(posofFire - vector3(0.0,0.0,0.0))
			if dist < 100 then
				return
			end
			while pos.x == 0.000000 or pos.y == 0.000000 do
				pos = GetEntityCoords(witnesses[k])
				pheading = GetEntityHeading(witnesses[k])
				forw = GetEntityForwardVector(witnesses[k])
				street1, street2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
				street1name = GetStreetNameFromHashKey(street1)
				street2name = GetStreetNameFromHashKey(street2)
				text = street1name.. ' ' ..street2name
				posofFire = vector3(pos.x, pos.y, pos.z)
				Wait(5000)
				breakCounter -= 1
				if breakCounter == 0 then
					if Config.Debug then
						print('An error occured while getting the fire position explosion alert')
					end
					break
				end
			end
			local ped = PlayerPedId()
			local pedCoords = GetEntityCoords(ped) 
			local retval, groundZ = GetGroundZFor_3dCoord(posofFire.x, posofFire.y, posofFire.z, true)

			if retval then
			   -- Do stuff with groundZ
			   local newPosOfFire = vector3(posofFire.x,posofFire.y, groundZ+0.5)
			   posofFire = newPosOfFire
			end
			
			if Config.Debug then
				for k,v in pairs(witnesses) do
					print("witnesses k:"..tostring(k))
					print("witnesses v:"..tostring(v))
					
				end
				print("ped:"..tostring(ped))
				print("pos:"..tostring(pos))
				print("posofFire:"..tostring(posofFire))
			end
			TriggerServerEvent("firefighter:server:fireAlert", text, posofFire)
			-- firestarterExplo = true
			-- while firestarterExplo do
				-- local pos = GetEntityCoords(PlayerPedId())
				-- local dist = #(pos-posofFire)
				-- if dist < Config.DistToTriggerFire then
			CreateFire(posofFire,10,25)
					-- firestarterExplo = false
				-- end
				-- Wait(1000)
			-- end
		end
	end
end)

RegisterNetEvent('firefighter:client:fireAlert', function(coords, text)

	if Config.Debug then
		print("triggering a fire fireAlert")
		print("unlucky:"..tostring(unlucky))
		print("Config.UnluckyChance:"..tostring(Config.UnluckyChance))
		print("triggering a fire fireAlert")
	end
	local breakCounter = 10
	while coords.x == 0.000000 or coords.y == 0.000000 do
		local rando = math.random(#Config.RandomFireLocations)
		pos = Config.RandomFireLocations[rando].location
		street1, street2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
		street1name = GetStreetNameFromHashKey(street1)
		street2name = GetStreetNameFromHashKey(street2)
		text = street1name.. ' ' ..street2name or Config.RandomFireLocations[rando].name
		coords = vector3(pos.x, pos.y, pos.z)
		Wait(5000)
		breakCounter -= 1
		if breakCounter == 0 then
			if Config.Debug then
				print('An error occured while getting the fire position in fire alert')
			end
			break
		end
	end
    local street1, street2 = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street1name = GetStreetNameFromHashKey(street1)
    local street2name = GetStreetNameFromHashKey(street2)
    QBCore.Functions.Notify({text = text, caption = street1name.. ' ' ..street2name}, 'warning')
	SetNewWaypoint(coords.x, coords.y)
    PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
    local transG = 250
	if not blip or not blip2 then
		
		blip = AddBlipForCoord(coords.x, coords.y, coords.z)
		blip2 = AddBlipForCoord(coords.x, coords.y, coords.z)
		local blipText = 'Fire Alert - ' ..text
		SetBlipSprite(blip, 436)
		SetBlipSprite(blip2, 161)
		SetBlipColour(blip, 1)
		SetBlipColour(blip2, 1)
		SetBlipDisplay(blip, 4)
		SetBlipDisplay(blip2, 8)
		SetBlipAlpha(blip, transG)
		SetBlipAlpha(blip2, transG)
		SetBlipScale(blip, 0.8)
		SetBlipScale(blip2, 2.0)
		SetBlipAsShortRange(blip, false)
		SetBlipAsShortRange(blip2, false)
		PulseBlip(blip2)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString(blipText)
		EndTextCommandSetBlipName(blip)
		CreateThread(function()
			while transG ~= 0 do
				Wait(1000)
				transG = transG - 1
				SetBlipAlpha(blip, transG)
				SetBlipAlpha(blip2, transG)
				if transG == 0 then
					RemoveBlip(blip)
					RemoveBlip(blip2)
					return
				end
			end
		end)
	else
		blip3 = AddBlipForCoord(coords.x, coords.y, coords.z)
		blip4 = AddBlipForCoord(coords.x, coords.y, coords.z)
		local blipText = 'Fire Alert - ' ..text
		SetBlipSprite(blip3, 436)
		SetBlipSprite(blip4, 161)
		SetBlipColour(blip3, 1)
		SetBlipColour(blip4, 1)
		SetBlipDisplay(blip3, 4)
		SetBlipDisplay(blip4, 8)
		SetBlipAlpha(blip3, transG)
		SetBlipAlpha(blip4, transG)
		SetBlipScale(blip3, 0.8)
		SetBlipScale(blip4, 2.0)
		SetBlipAsShortRange(blip3, false)
		SetBlipAsShortRange(blip4, false)
		PulseBlip(blip4)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString(blipText)
		EndTextCommandSetBlipName(blip3)
		CreateThread(function()
			while transG ~= 0 do
				Wait(1000)
				transG = transG - 1
				SetBlipAlpha(blip3, transG)
				SetBlipAlpha(blip4, transG)
				if transG == 0 then
					RemoveBlip(blip3)
					RemoveBlip(blip4)
					return
				end
			end
		end)
	end
end)

-- Threads

CreateThread(function()
    for k, station in pairs(Config.Locations["stations"]) do
        local blip = AddBlipForCoord(station.coords.x, station.coords.y, station.coords.z)
        SetBlipSprite(blip, 436)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 1)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(station.label)
        EndTextCommandSetBlipName(blip)
    end
end)

CreateThread(function()
	while true do
		if firefighterCount > 0 then
			if players then
				for k,v in pairs(players) do
					-- if Config.Debug then
						-- print('loop players IN: '..tostring(players))
						-- print("players.k:"..tostring(k))
						-- print("players.v:"..tostring(v))
						-- print('loop players IN: '..tostring(players))
					-- end
					if v.PlayerData.job.name == 'firefighter' or v.PlayerData.job.name == 'police' and v.PlayerData.job.onduty then
						if Config.Debug then
							print("unlucky:"..tostring(unlucky))
							print("Config.UnluckyChance:"..tostring(Config.UnluckyChance))
							print("players:"..tostring(players))
						end
						if unlucky < Config.UnluckyChance then
							if Config.Debug then
								print("triggering a fire")
								print("unlucky:"..tostring(unlucky))
								print("Config.UnluckyChance:"..tostring(Config.UnluckyChance))
								print("triggering a fire")
							end
							if #currentFires < 1 then
								local chosenLoc = math.random(#Config.RandomFireLocations)
								local fireLocation = Config.RandomFireLocations[chosenLoc]['location']
								local elapsedTimeofFire = 30
								local childrenofFire = 25
								local text = "A fire has broken out at "..tostring(Config.RandomFireLocations[chosenLoc]['name'])
								TriggerServerEvent("firefighter:server:fireAlert", text, fireLocation)
								firestarter = true
								if Config.Debug then
									print("firestarter:"..tostring(firestarter))
								end
								while firestarter do
									local pos = GetEntityCoords(PlayerPedId())
									local dist = #(fireLocation-pos)
									if Config.Debug then
										print("dist:"..tostring(dist))
									end
									if dist < Config.DistToTriggerFire then
										CreateFire(fireLocation,elapsedTimeofFire,childrenofFire)
										firestarter = false
									end
									Wait(1000)
								end
							end
						end
					end
				end
			end
		end
		Wait(5000)
	end
end)

CreateThread(function()
	while true do
		if Config.Debug then
			print("#currentFires:"..tostring(#currentFires))
			print("unlucky:"..tostring(unlucky))
			print("firefighterCount:"..tostring(firefighterCount))
		end
		QBCore.Functions.TriggerCallback('firefighter:GetFireFighters', function(firefighters)
			TriggerEvent('firefighter:client:SetFireFighterCount', firefighters)
		end)
		if Config.Debug then
			print("players:"..tostring(players))
		end
		if firefighterCount > 0 and not firestarter then
			-- unlucky = math.random(1,100)
			QBCore.Functions.TriggerCallback('firefighter:GetAllPlayers', function(playersList)
				players = playersList
				-- for k,v in pairs(players) do
					-- print("k:"..tostring(k))
					-- print("v:"..tostring(v))
					-- print("playersList:"..tostring(playersList))
					-- print("players:"..tostring(players))
				-- end
			end)
		end
		Wait(Config.Frequency*60000) -- x minutes
	end
end)

CreateThread(function()
	while true do
		Wait(1000) -- 1 second
		if #currentFires > 0 then
			triggeredFires = #currentFires
			if Config.Debug then
				for k,v in pairs(currentFires) do
					print("currentFires k:"..tostring(k))
					print("currentFires v:"..tostring(v))
				end
			end
			while triggeredFires ~= 0 do
				local pos = GetEntityCoords(PlayerPedId())
				if Config.Debug then
					print(pos)
					print(GetClosestFirePos(pos, pos.x,pos.y,pos.z))
					print("CurrentFires:"..tostring(#currentFires).." vs triggered:"..tostring(triggeredFires))
				end
				if not GetClosestFirePos(pos, pos.x,pos.y,pos.z) then
					firestarter = false
					triggeredFires = 0
					unlucky = 50
					currentFires = {}
					TriggerServerEvent("firefighter:StopFires")
					TriggerServerEvent("firefighter:server:PayFireService")
					if blip then
						RemoveBlip(blip)
						RemoveBlip(blip2)
					end
					if blip3 then
						RemoveBlip(blip3)
						RemoveBlip(blip4)
					end
				elseif #currentFires > triggeredFires then
					QBCore.Functions.Notify('Another fire has started!', 'warning')
					local text = 'Another fire has started!'
					local fireLocation = vector3(GetClosestFirePos(pos, pos.x,pos.y,pos.z))
					if Config.Debug then
						print(text)
						print(fireLocation)
						print("CurrentFires:"..tostring(#currentFires).." vs triggered:"..tostring(triggeredFires))
					end
					TriggerServerEvent("firefighter:server:fireAlert", text, fireLocation)
					triggeredFires = #currentFires
				end
				Wait(1)
			end
		end
	end
end)

-- CreateThread(function()
	-- while true do
		-- Wait(1000) -- 1 second
		-- if #quedFires > 0 then
			-- if Config.DebugQue then
				-- for k,v in pairs(quedFires) do
					-- print("quedFires k:"..tostring(k))
					-- print("quedFires v:"..tostring(v))
				-- end
			-- end
			-- while #quedFires >= 1 do
				-- for i = 1, #quedFires do
					-- firePos = quedFires[i].pos
					-- maxChildren = quedFires[i].maxChildren
					-- isGasFire = quedFires[i].isGasFire
					-- local pos = GetEntityCoords(PlayerPedId())
					-- local distToFire = #(pos - firePos)
					-- if Config.DebugQue then
						-- print("firePos:"..tostring(firePos))
						-- print("PlayerPedIdpos:"..tostring(pos))
						-- print("distToFire:"..tostring(distToFire))
					-- end
					-- if distToFire < 40 then
						-- table.remove(quedFires, i)
						-- local text = 'A fire has been sighted!'
						-- local _,fireLocation = GetClosestFirePos(fireLocation, pos.x,pos.y,pos.z)
						-- TriggerServerEvent("firefighter:server:fireAlert", text, fireLocation)
						-- CreateFire(firePos, maxChildren, isGasFire)
					-- else
						-- TriggerServerEvent("firefighter:server:fireAlert", 'A Fire has been Reported', firePos)
						-- Wait(3000)
					-- end
				-- end
				-- Wait(1)
			-- end
		-- end
	-- end
-- end)

