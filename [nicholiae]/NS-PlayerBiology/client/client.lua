local QBCore = exports['qb-core']:GetCoreObject()
local notUsing = true
local relief = nil
local set = false
local swimming = false
local running = false
local hygieneBuffer = 0




RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()

	TriggerServerEvent('PlayerBiology:server:synchLocations')
	Wait(10000)
	setupBio()
	startDistWatcher()
	
end)


AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
	TriggerServerEvent('PlayerBiology:server:synchLocations')
	Wait(10000)
	setupBio()
	startDistWatcher()
	
end)

function blipps()
	-- Blips
	CreateThread(function()
		-- draw every frame
		for _, stationData in pairs(Config.Sections.public.stations) do
			-- for stationIndex, stationData in ipairs(sectionData.stations) do 
				-- if sectionName == 'public' then
					local Bathroom = AddBlipForCoord(stationData['targetCoords'])
					SetBlipSprite(Bathroom, 815)
					SetBlipDisplay(Bathroom, 4)
					SetBlipScale(Bathroom, 0.70)
					SetBlipAsShortRange(Bathroom, true)
					SetBlipColour(Bathroom, 15)
					BeginTextCommandSetBlipName('STRING')
					AddTextComponentSubstringPlayerName("Public Restroom")
					EndTextCommandSetBlipName(Bathroom)
				-- end
			-- end
		end
	end)
end

local function loadAnimDict(dict)
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(0)
        end
    end
end

local function draw()
	CreateThread(function()
		while true do
			-- draw every frame
			for sectionName, sectionData in pairs(Config.Sections) do
				for stationIndex, stationData in ipairs(sectionData.stations) do 
					DrawMarker(22, stationData.playerCoords.x, stationData.playerCoords.y, stationData.playerCoords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 200, 200, 200, 255, true, true, 2, nil, nil, true)
				end
			end
		Wait(0)
		end
	end)
end

local function DrawAdvancedNativeText(x,y,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end

-- Function to play animation
local function playAnimation(ped, animDict, animName)
    loadAnimDict(animDict)
    TaskPlayAnim(ped, animDict, animName, 8.0, 8.0, -1, 15, 0, false, false, false)
end

local function AddToBuffer(amount)		

	hygieneBuffer = hygieneBuffer + amount
	if hygieneBuffer > 100 then hygieneBuffer = 100 end
	
end

local function GetNaked()
	if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then
		
		TriggerEvent('qb-clothing:client:loadOutfit', {
			outfitData = {
				["arms"] = { item = 15, texture = 0 },
				["t-shirt"] = { item = 15, texture = 0 },
				["torso2"] = { item = 15, texture = 0 },
				["pants"] = { item = 21, texture = 0 },
				["shoes"] = { item = 34, texture = 0 },
				["glass"] = { item = 0, texture = 0 }
			}
		})
	else
		TriggerEvent('qb-clothing:client:loadOutfit', {
			outfitData = {
				["arms"] = { item = 15, texture = 0 },
				["t-shirt"] = { item = 14, texture = 0 },
				["torso2"] = { item = -1, texture = 0 },
				["pants"] = { item = 193, texture = 0 },
				["shoes"] = { item = 35, texture = 0 },
				["glass"] = { item = 0, texture = 0 }
			}
		})
	end
end

local function GetDressed(armorValue)
    TriggerServerEvent("qb-clothes:loadPlayerSkin")
	Wait(2000)
	SetPedArmour(PlayerPedId(),armorValue)
	Wait(1000)
	local now = GetPedArmour(PlayerPedId())
    TriggerServerEvent("qb-clothes:loadPlayerSkin")
	Wait(2000)
	now = GetPedArmour(PlayerPedId())
	if now ~= armorValue then
		SetPedArmour(PlayerPedId(),armorValue)
	end
	-- TriggerEvent('qb-clothing:client:openOutfitMenu')
end

local function GetNakedBottom()
	if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then
		
		TriggerEvent('qb-clothing:client:loadOutfit', {
			outfitData = {
				["pants"] = { item = 21, texture = 0 },
				["shoes"] = { item = 34, texture = 0 }
			}
		})
	else
		TriggerEvent('qb-clothing:client:loadOutfit', {
			outfitData = {
				["pants"] = { item = 193, texture = 0 },
				["shoes"] = { item = 35, texture = 0 }
			}
		})
	end
end

local function useStation(data)
	local playerPed = PlayerPedId()
	local armorValue = GetPedArmour(playerPed)
	local Player = QBCore.Functions.GetPlayerData()
	local src = Player.source
	-- Force player to exact playerCoords
	-- FreezeEntityPosition(playerPed, true)
    SetEntityCoords(playerPed, data.args.station.playerCoords.x, data.args.station.playerCoords.y, data.args.station.playerCoords.z, true, true, true)
    SetEntityHeading(playerPed, data.args.station.heading)
	--FreezeEntityPosition(playerPed, true)
	SetEntityCollision(playerPed, false, false)
	SetEntityCompletelyDisableCollision(playerPed, true)
	
    -- Play animation locally
    playAnimation(playerPed, data.args.station.animDict, data.args.station.animName)

    -- Show Text UI
    -- lib.showTextUI(
	-- '[X] - leave',
		-- {
        -- position = 'top-center',
        -- style = {
            -- backgroundColor = '#000000',
            -- color = '#FFFFFF'
        -- }
    -- })
	
	local isNaked = false
    -- Optimized thread for key press
    CreateThread(function()
        while true do
            Wait(0)	
			if data.label == 'Use showerStall' or data.label == 'Use bathTub' then
				relief = 'shower'
				if not isNaked then
					GetNaked()
					isNaked = true
				end
			elseif data.label == 'Use public' then
				relief = 'all'
				SetEntityVisible(PlayerPedId(), false, 0)
			elseif data.label == 'Use urinalStand' then
				relief = 'urinal'
			elseif data.label == 'Use handSink' then
				relief = 'hands'
			elseif data.label == 'Use toiletChair' then
				relief = 'toilet'
				if not isNaked then
					GetNakedBottom()
					isNaked = true
				end
			end
			exports['qb-core']:DrawText('[X] - Leave', 'top')
            if IsControlJustReleased(0, 73) then -- 73 is the control index for 'X'
                -- Stop animation and clear tasks
                ClearPedTasksImmediately(playerPed)
				relief = nil
                -- Enable collision and unfreeze position
                FreezeEntityPosition(playerPed, false)
				SetEntityVisible(PlayerPedId(), true, 0)
                SetEntityCollision(playerPed, true, true)
				QBCore.Functions.Notify('Hygiene Buffer: '..tostring(hygieneBuffer), 'success', 10000)
				
                -- Return to original coordinates
                SetEntityCoords(playerPed,  data.args.station.returnCoords.x,  data.args.station.returnCoords.y,  data.args.station.returnCoords.z, false, false, false, true)
                SetEntityHeading(playerPed,  data.args.station.returnCoords.w)

                -- Hide Text UI
                exports['qb-core']:HideText()
				GetDressed(armorValue)
				TriggerServerEvent('PlayerBiology:server:restart')
				notUsing = true
				isNaked = false
                break
            end
        end
    end)
end

local function startDistWatcher()
	while notUsing do
		local wait = 500
		local pos = GetEntityCoords(PlayerPedId())
		local item = nil
		local inRange = false
		local nearBossmenu = false
		for sectionName, sectionData in pairs(Config.Sections) do
			for stationIndex, stationData in ipairs(sectionData.stations) do
				pos = GetEntityCoords(PlayerPedId())
				wait = 0
				-- print(#(pos - stationData.targetCoords),sectionName)
				if #(pos - stationData.targetCoords) <= 1.0 then
					if Config.drawClosest then
						DrawMarker(22, stationData.playerCoords.x, stationData.playerCoords.y, stationData.playerCoords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 255, true, true, 2, nil, nil, true)
					end
				end
				if #(pos - stationData.targetCoords) <= 0.75 then
					wait = 0
					pos = GetEntityCoords(PlayerPedId())
					if Config.drawClosest then
						DrawMarker(22, stationData.playerCoords.x, stationData.playerCoords.y, stationData.playerCoords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 0, 255, 0, 255, true, true, 2, nil, nil, true)
					end
				-- if #(pos - stationData.targetCoords) <= 1.0 then
					exports['qb-core']:DrawText('[E] - Use '..sectionName, 'top')
					if IsControlJustReleased(0, 38) then
						exports['qb-core']:HideText()
						local clientOptions = {
							icon = 'fa-solid fa-chair',
							label = 'Use ' .. sectionName,
							args = {
								role = 'client',
								station = stationData
							}
						}
						notUsing = false
						-- print(sectionName)
						if sectionName == 'showerStall' or sectionName == 'bathTub' then
							if QBCore.Functions.HasItem('duv_wash', 1) then
								item = 'duv_wash'
								TriggerServerEvent('PlayerBiology:server:UseTOneWash', item)
								clientOptions.args.station.animDict = 'mp_safehouseshower@female@'
								clientOptions.args.station.animName = 'shower_idle_a'
							elseif QBCore.Functions.HasItem('puntune_wash', 1) then
								item = 'puntune_wash'
								TriggerServerEvent('PlayerBiology:server:UseTOneWash', item)
								clientOptions.args.station.animDict = 'mp_safehouseshower@female@'
								clientOptions.args.station.animName = 'shower_idle_a'
							elseif QBCore.Functions.HasItem('hudandshudders_wash', 1) then
								item = 'hudandshudders_wash'
								TriggerServerEvent('PlayerBiology:server:UseTTwoWash', item)
								clientOptions.args.station.animDict = 'mp_safehouseshower@male@'
								clientOptions.args.station.animName = 'male_shower_idle_d'
							elseif QBCore.Functions.HasItem('suvmer_wash', 1) then
								item = 'suvmer_wash'
								TriggerServerEvent('PlayerBiology:server:UeTTwoWash', item)
								clientOptions.args.station.animDict = 'mp_safehouseshower@male@'
								clientOptions.args.station.animName = 'male_shower_idle_d'
							elseif QBCore.Functions.HasItem('ussi_wash', 1) then
								item = 'ussi_wash'
								TriggerServerEvent('PlayerBiology:server:UseTThreeWash', item)
								clientOptions.args.station.animDict = 'mp_safehouseshower@male@'
								clientOptions.args.station.animName = 'male_shower_idle_c'
							elseif QBCore.Functions.HasItem('trusumm_wash', 1) then
								item = 'trusumm_wash'
								TriggerServerEvent('PlayerBiology:server:UseTThreeWash', item)
								clientOptions.args.station.animDict = 'mp_safehouseshower@male@'
								clientOptions.args.station.animName = 'male_shower_idle_c'
							end
						end
						useStation(clientOptions)
					end
					-- if #(pos - stationData.targetCoords) > 0.8 then
						-- Wait(3000)
						-- exports['qb-core']:HideText()
						-- notUsing = true
						-- break
					-- end
				end
				if #(pos - stationData.targetCoords) > 0.75 and #(pos - stationData.targetCoords) < 1.0 then
					exports['qb-core']:HideText()
					notUsing = true
				end
			end
		end
		Wait(wait)
	end
end

function setupBio()
	if not set then
		for sectionName, sectionData in pairs(Config.Sections) do
			for stationIndex, stationData in ipairs(sectionData.stations) do
				-- Client Target Setup
				if stationData then
					if Config.drawDebug then 
						draw()
					end
					local clientOptions = {
						{
							type = 'client',  -- Specify the type as 'client'
							event = 'PlayerBiology:useStation',
							icon = 'fa-solid fa-chair',
							label = 'Use ' .. sectionName,
							args = {
								role = 'client',
								station = stationData
							}
						}
					}
					if Config.Target == 'qb' then
						-- Generate a unique zone name
						local clientZoneName = sectionName .. stationIndex
						-- print(stationData.targetCoords)
						exports["qb-target"]:AddCircleZone(clientZoneName, stationData.targetCoords, 0.5, {
							name = clientZoneName,
							debugPoly = false,
							useZ = true
						}, {
							options = clientOptions,
							distance = 1.5  -- Adjust the interaction distance as needed
						})
					else
						startDistWatcher()
					end			
				end
			end
		end
		set = true 
	end
end

local function CopyToClipboard(data)
    local ped = PlayerPedId()
	SendNUIMessage({
		string = data
	})
	QBCore.Functions.Notify('Copied', 'success')
end

RegisterNetEvent('PlayerBiology:client:restartWatcher')
AddEventHandler('PlayerBiology:client:restartWatcher', function()
	
	Wait(2000)
	notUsing = true
	startDistWatcher()

end)

RegisterNetEvent('PlayerBiology:client:useApartmentSink')
AddEventHandler('PlayerBiology:client:useApartmentSink', function(ApartmentDataSend)
	
	-- print(ApartmentDataSend.sinkPos)
	local data = { args = 
		{
			station = {
				returnCoords = vector4(ApartmentDataSend.sinkPos.x,ApartmentDataSend.sinkPos.y,ApartmentDataSend.sinkPos.z,GetEntityHeading(PlayerPedId())),
				playerCoords = vector4(ApartmentDataSend.sinkPos.x,ApartmentDataSend.sinkPos.y,ApartmentDataSend.sinkPos.z,GetEntityHeading(PlayerPedId())),
				heading = GetEntityHeading(PlayerPedId()),
				animDict = "missheist_agency3aig_23",
				animName = "urinal_sink_loop"
			}
		},
		label = 'Use handSink'
	}
	useStation(data)

end)

RegisterNetEvent('PlayerBiology:client:useApartmentToilet')
AddEventHandler('PlayerBiology:client:useApartmentToilet', function(ApartmentDataSend)
	
	-- print(ApartmentDataSend.toiletPos)
	local data = { args = 
		{
			station = {
				returnCoords = vector4(ApartmentDataSend.toiletPos.x,ApartmentDataSend.toiletPos.y,ApartmentDataSend.toiletPos.z,GetEntityHeading(PlayerPedId())),
				playerCoords = vector4(ApartmentDataSend.toiletPos.x,ApartmentDataSend.toiletPos.y,ApartmentDataSend.toiletPos.z,GetEntityHeading(PlayerPedId())-180),
				heading = GetEntityHeading(PlayerPedId())-180,
				animDict = "timetable@michael@on_sofabase",
				animName = "sit_sofa_base"
			}
		},
		label = 'Use toiletChair'
	}
	useStation(data)

end)

RegisterNetEvent('PlayerBiology:client:useApartmentShower')
AddEventHandler('PlayerBiology:client:useApartmentShower', function(ApartmentDataSend)
	
	-- print(ApartmentDataSend.showerPos)
	local data = { args = 
		{
			station = {
				returnCoords = vector4(ApartmentDataSend.showerPos.x,ApartmentDataSend.showerPos.y,ApartmentDataSend.showerPos.z,GetEntityHeading(PlayerPedId())),
				playerCoords = vector4(ApartmentDataSend.showerPos.x,ApartmentDataSend.showerPos.y,ApartmentDataSend.showerPos.z,GetEntityHeading(PlayerPedId())),
				heading = GetEntityHeading(PlayerPedId()),
				animDict = "mp_safehouseshower@male@",
				animName = "male_shower_idle_b"
			}
		},
		label = 'Use showerStall'
	}
	if QBCore.Functions.HasItem('duv_wash', 1) then
		item = 'duv_wash'
		TriggerServerEvent('PlayerBiology:server:UseTOneWash', item)
		data.args.station.animDict = 'mp_safehouseshower@female@'
		data.args.station.animName = 'shower_idle_a'
	elseif QBCore.Functions.HasItem('puntune_wash', 1) then
		item = 'puntune_wash'
		TriggerServerEvent('PlayerBiology:server:UseTOneWash', item)
		data.args.station.animDict = 'mp_safehouseshower@female@'
		data.args.station.animName = 'shower_idle_a'
	elseif QBCore.Functions.HasItem('hudandshudders_wash', 1) then
		item = 'hudandshudders_wash'
		TriggerServerEvent('PlayerBiology:server:UseTTwoWash', item)
		data.args.station.animDict = 'mp_safehouseshower@male@'
		data.args.station.animName = 'male_shower_idle_d'
	elseif QBCore.Functions.HasItem('suvmer_wash', 1) then
		item = 'suvmer_wash'
		TriggerServerEvent('PlayerBiology:server:UeTTwoWash', item)
		data.args.station.animDict = 'mp_safehouseshower@male@'
		data.args.station.animName = 'male_shower_idle_d'
	elseif QBCore.Functions.HasItem('ussi_wash', 1) then
		item = 'ussi_wash'
		TriggerServerEvent('PlayerBiology:server:UseTThreeWash', item)
		data.args.station.animDict = 'mp_safehouseshower@male@'
		data.args.station.animName = 'male_shower_idle_c'
	elseif QBCore.Functions.HasItem('trusumm_wash', 1) then
		item = 'trusumm_wash'
		TriggerServerEvent('PlayerBiology:server:UseTThreeWash', item)
		data.args.station.animDict = 'mp_safehouseshower@male@'
		data.args.station.animName = 'male_shower_idle_c'
	end
	useStation(data)

end)

RegisterNetEvent('PlayerBiology:useStation')
AddEventHandler('PlayerBiology:useStation', function(data)
    local playerPed = PlayerPedId()
	local armorValue = GetPedArmour(playerPed)
	local Player = QBCore.Functions.GetPlayerData()
	local src = Player.source
	-- print('started use')
	-- Force player to exact playerCoords
	-- FreezeEntityPosition(playerPed, true)
    SetEntityCoords(playerPed, data.args.station.playerCoords.x, data.args.station.playerCoords.y, data.args.station.playerCoords.z, true, true, true)
    SetEntityHeading(playerPed, data.args.station.heading)
	--FreezeEntityPosition(playerPed, true)
	SetEntityCollision(playerPed, false, false)
	SetEntityCompletelyDisableCollision(playerPed, true)
	
    -- Play animation locally
    playAnimation(playerPed, data.args.station.animDict, data.args.station.animName)

    -- Show Text UI
    -- lib.showTextUI(
	-- '[X] - leave',
		-- {
        -- position = 'top-center',
        -- style = {
            -- backgroundColor = '#000000',
            -- color = '#FFFFFF'
        -- }
    -- })
	local isNaked = false
    -- Optimized thread for key press
    CreateThread(function()
        while true do
            Wait(0)	
			if data.label == 'Use showerStall' or data.label == 'Use bathTub' then
				relief = 'shower'
				if not isNaked then
					GetNaked()
					isNaked = true
				end
			elseif data.label == 'Use public' then
				relief = 'all'
				SetEntityVisible(PlayerPedId(), false, 0)
			elseif data.label == 'Use urinalStand' then
				relief = 'urinal'
			elseif data.label == 'Use handSink' then
				relief = 'hands'
			elseif data.label == 'Use toiletChair' then
				relief = 'toilet'
				if not isNaked then
					GetNakedBottom()
					isNaked = true
				end
			end
			exports['qb-core']:DrawText('[X] - Leave', 'top')
            if IsControlJustReleased(0, 73) then -- 73 is the control index for 'X'
                -- Stop animation and clear tasks
                ClearPedTasksImmediately(playerPed)
				relief = nil
                -- Enable collision and unfreeze position
                FreezeEntityPosition(playerPed, false)
                SetEntityCollision(playerPed, true, true)
				SetEntityVisible(PlayerPedId(), true, 0)
                -- Return to original coordinates
                SetEntityCoords(playerPed,  data.args.station.returnCoords.x,  data.args.station.returnCoords.y,  data.args.station.returnCoords.z, false, false, false, true)
                SetEntityHeading(playerPed,  data.args.station.returnCoords.w)

                -- Hide Text UI
                exports['qb-core']:HideText()
				GetDressed(armorValue)
				notUsing = true
				isNaked = false
				if Config.Target ~= 'qb' then
					startDistWatcher()
				end
                break
            end
        end
    end)
end)

CreateThread(function()
    while true do
		while relief ~= nil do
			if relief == 'shower' then
				TriggerServerEvent('hud:server:RelieveHygiene', QBCore.Functions.GetPlayerData().metadata.hygiene + math.random(1,5))
				SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + math.random(2, 6))
				TriggerServerEvent('hud:server:RelieveStress', math.random(1, 10))
				QBCore.Functions.Notify('Showering...', 'success')
			elseif relief == 'all' then
			
				TriggerServerEvent('hud:server:RelieveHygiene', QBCore.Functions.GetPlayerData().metadata.hygiene + math.random(1,1))
				TriggerServerEvent('hud:server:RelieveBioOne', QBCore.Functions.GetPlayerData().metadata.bioone + math.random(1,2))
				TriggerServerEvent('hud:server:RelieveBioTwo', QBCore.Functions.GetPlayerData().metadata.biotwo + math.random(1,2))
				QBCore.Functions.Notify('Using Public Stall...', 'success')
			
			elseif relief == 'urinal' then
				TriggerServerEvent('hud:server:RelieveBioOne', QBCore.Functions.GetPlayerData().metadata.bioone + math.random(1,5)) 
				QBCore.Functions.Notify('Peeing...', 'success')
			elseif relief == 'hands' then
				QBCore.Functions.Notify('Washing Hands...', 'success')
				TriggerServerEvent('hud:server:RelieveHygiene', QBCore.Functions.GetPlayerData().metadata.hygiene + math.random(0,1))
			elseif relief == 'toilet' then
				QBCore.Functions.Notify('Pooping...', 'success')
				TriggerServerEvent('hud:server:RelieveBioOne', QBCore.Functions.GetPlayerData().metadata.bioone + math.random(1,3))
				TriggerServerEvent('hud:server:RelieveBioTwo', QBCore.Functions.GetPlayerData().metadata.biotwo + math.random(1,5))
			end
			Wait(3000)
		end
		Wait(0)
    end
end)

CreateThread(function()
    while true do
		local Player = QBCore.Functions.GetPlayerData()
		-- print(hygieneBuffer)
		if hygieneBuffer > 0 then
			-- QBCore.Functions.Notify('Hygiene buffer: '..tostring(hygieneBuffer), 'success', 1000)
			if (Player.metadata['hygiene'] <= 99) then
				local missing = 100 - Player.metadata['hygiene']
				if hygieneBuffer >= missing then
					hygieneBuffer = hygieneBuffer - missing
					if missing >= 10 then
						QBCore.Functions.Notify('Hygiene Buffer Remaining: '..tostring(hygieneBuffer), 'success')
					end
					if hygieneBuffer <= 15 then
						QBCore.Functions.Notify('Hygiene Buffer Remaining: '..tostring(hygieneBuffer), 'success')
					end
					TriggerServerEvent('hud:server:RelieveHygiene', QBCore.Functions.GetPlayerData().metadata.hygiene + missing)
				else
					hygieneBuffer = 0
					QBCore.Functions.Notify('Your have consumed your entire Hygiene Buffer', 'warning')
					TriggerServerEvent('hud:server:RelieveHygiene', QBCore.Functions.GetPlayerData().metadata.hygiene + hygieneBuffer)
				end
			end
            if not (Player.metadata['isdead'] or Player.metadata['inlaststand']) then
				local src = Player.source
				-- print('hygiene: '..tostring(src))
				local playersList = QBCore.Functions.GetPlayers()
				local srcPlayerData = QBCore.Functions.GetPlayerData()
				local srcPlayerCoords = GetEntityCoords(PlayerPedId())
				for _, v in pairs(playersList) do
					if GetPlayerServerId(v) == src then
                        TriggerServerEvent('hud:server:RelieveStressByHygiene', src, math.random(1, 5))
					elseif #(srcPlayerCoords - GetEntityCoords(PlayerPedId(GetPlayerServerId(v)))) < 20.0 then
						-- local targetPlayerData = QBCore.Functions.GetPlayerData(GetPlayerServerId(v))
                        TriggerServerEvent('hud:server:RelieveStressByHygiene', GetPlayerServerId(v), math.random(1, 5))
					end
				end
            end
		end
		if hygieneBuffer < 0 then
			hygieneBuffer = 0
		end
		Wait(1000*Config.bufferInterval) -- 1 second * X
    end
end)

CreateThread(function()
	while true do
		if IsPedRunning(PlayerPedId()) then
			running = not running
		end
		while running do
			TriggerServerEvent('hud:server:ReduceHygiene', math.random(0,1))
			QBCore.Functions.Notify('Sweating...', 'warning')
			-- print("running:"..tostring(IsPedRunning(PlayerPedId())))
			Wait(math.random(10000,15000))
			if IsPedWalking(PlayerPedId()) or IsPedStopped(PlayerPedId()) then
				running = not running
			elseif not IsPedRunning(PlayerPedId()) then
				running = not running
			end
		end
		if IsPedSwimming(PlayerPedId()) or IsPedSwimmingUnderWater(PlayerPedId()) then
			swimming = not swimming
		end
		while swimming do
			Wait(math.random(2000,5000))
			TriggerServerEvent('hud:server:RelieveHygiene', math.random(3,9))
			QBCore.Functions.Notify('Swimming...', 'success')
			if IsPedWalking(PlayerPedId()) then
				swimming = not swimming
			elseif not IsPedSwimming(PlayerPedId()) and not IsPedSwimmingUnderWater(PlayerPedId()) then
				swimming = not swimming
			end
		end
		Wait(0)
	end
end)

CreateThread(function()
    while true do
		local Player = QBCore.Functions.GetPlayerData()
		if Player then
			while not Player.metadata do 
				Wait(5000) 
				Player = QBCore.Functions.GetPlayerData() 
			end
            if (Player.metadata['bioone'] <= 0) and not (Player.metadata['isdead'] or Player.metadata['inlaststand']) then
				local src = Player.source
				-- print('bioone src:'..tostring(src))
				if not Player then return end
				local newHygiene = Player.metadata['hygiene'] - math.random(3, 15)
				if newHygiene <= 0 then
					newHygiene = 0
				end
				-- print('bioone Player.metadata[hygiene]: '..tostring(Player.metadata['hygiene']))
				-- print('bioone newHygiene: '..tostring(newHygiene))
				newBioOne = Player.metadata['bioone'] + math.random(1,3)
				newBioTwo = Player.metadata['biotwo']
				QBCore.Functions.Notify('You have peed a little', 'warning')
                TriggerServerEvent('hud:server:GainStressByHygiene', src, math.random(1, 5))
				TriggerServerEvent('hud:server:UpdateNeedsBiology', newHygiene, newBioOne, newBioTwo)
				Player = QBCore.Functions.GetPlayerData() 
            end
        end
        Wait(Config.StatusInterval)
    end
end)

CreateThread(function()
    while true do
		local Player = QBCore.Functions.GetPlayerData()
		if Player then
			while not Player.metadata do 
				Wait(5000) 
				Player = QBCore.Functions.GetPlayerData() 
			end
            if (Player.metadata['biotwo'] <= 0) and not (Player.metadata['isdead'] or Player.metadata['inlaststand']) then
				local src = Player.source
				-- print('biotwo: '..tostring(src))
				local ped = PlayerPedId()
                local currentHealth = GetEntityHealth(ped)
                local decreaseThreshold = math.random(1, 5)
				if not Player then return end
				local newHygiene = Player.metadata['hygiene'] - math.random(3, 15)
				if newHygiene <= 0 then
					newHygiene = 0
				end
				newBioOne = Player.metadata['bioone']
				newBioTwo = Player.metadata['biotwo'] + math.random(1,3)
				-- Player.Functions.SetMetaData('hygiene', newHygiene)
				-- Player.Functions.SetMetaData('bioone', newBioOne)
				-- Player.Functions.SetMetaData('biotwo', newBioTwo)
                SetEntityHealth(ped, currentHealth - decreaseThreshold)
                TriggerServerEvent('hud:server:GainStressByHygiene', src, math.random(1, 5))
				QBCore.Functions.Notify('You are beginning to turtle', 'warning')
				TriggerServerEvent('hud:server:UpdateNeedsBiology', newHygiene, newBioOne, newBioTwo)
				Player = QBCore.Functions.GetPlayerData() 
            end
        end
        Wait(Config.StatusInterval)
    end
end)

CreateThread(function()
    while true do
		local Player = QBCore.Functions.GetPlayerData()
		if Player then
			while not Player.metadata do 
				Wait(5000) 
				Player = QBCore.Functions.GetPlayerData()
			end
            if (Player.metadata['hygiene'] <= 0) and not (Player.metadata['isdead'] or Player.metadata['inlaststand']) then
				local src = Player.source
				-- print('hygiene: '..tostring(src))
				local playersList = QBCore.Functions.GetPlayers()
				local srcPlayerData = QBCore.Functions.GetPlayerData()
				local srcPlayerCoords = GetEntityCoords(PlayerPedId())
				for _, v in pairs(playersList) do
					if GetPlayerServerId(v) == src then
                        TriggerServerEvent('hud:server:GainStressByHygiene', src, math.random(1, 5))
					elseif #(srcPlayerCoords - GetEntityCoords(PlayerPedId(GetPlayerServerId(v)))) < 20.0 then
						-- local targetPlayerData = QBCore.Functions.GetPlayerData(GetPlayerServerId(v))
                        TriggerServerEvent('hud:server:GainStressByHygiene', GetPlayerServerId(v), math.random(1, 5))
					end
				end
				Player = QBCore.Functions.GetPlayerData() 
            end
        end
        Wait(Config.StatusInterval)
    end
end)




RegisterNetEvent('PlayerBiology:client:UseTOneSpray', function(item)
	local Player = QBCore.Functions.GetPlayerData() 
	if Player.metadata.hygiene >= 75 then
		QBCore.Functions.Notify('Your hygiene is not low enough for this', 'warning')
		return
	else
		local newHygiene = Player.metadata['hygiene'] + 25
		if newHygiene >= 100 then
			newHygiene = 100
		end
		newBioOne = Player.metadata['bioone']
		newBioTwo = Player.metadata['biotwo']
		QBCore.Functions.Progressbar('Spritzing', 'Spritzing', 5000, false, true, {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		}, {
			animDict = 'heartselfiemirror@queensisters',
			anim = 'heartselfie_clip'
		}, {
		}, {}, function() -- Done
			TriggerServerEvent('PlayerBiology:server:UseTOneSpray', item)
			TriggerServerEvent('hud:server:UpdateNeedsBiology', newHygiene, newBioOne, newBioTwo)
			TriggerServerEvent('hud:server:RelieveStressByHygiene', Player.source, 25)
		end)
	end
end)

RegisterNetEvent('PlayerBiology:client:UseTTwoSpray', function(item)
	local Player = QBCore.Functions.GetPlayerData() 
	if Player.metadata.hygiene >= 50 then
		QBCore.Functions.Notify('Your hygiene is not low enough for this', 'warning')
		return
	else
		local newHygiene = Player.metadata['hygiene'] + 50
		if newHygiene >= 100 then
			newHygiene = 100
		end
		newBioOne = Player.metadata['bioone']
		newBioTwo = Player.metadata['biotwo']
		
		QBCore.Functions.Progressbar('Spritzing', 'Spritzing', 5000, false, true, {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		}, {
			animDict = 'heartselfiemirror@queensisters',
			anim = 'heartselfie_clip'
		}, {}, {}, function() -- Done
			TriggerServerEvent('PlayerBiology:server:UseTTwoSpray', item)
			TriggerServerEvent('hud:server:UpdateNeedsBiology', newHygiene, newBioOne, newBioTwo)
			TriggerServerEvent('hud:server:RelieveStressByHygiene', Player.source, 50)
		end)
	end
end)

RegisterNetEvent('PlayerBiology:client:UseTThreeSpray', function(item)
	local Player = QBCore.Functions.GetPlayerData() 
	if Player.metadata.hygiene >= 25 then
		QBCore.Functions.Notify('Your hygiene is not low enough for this', 'warning')
		return
	else
		local newHygiene = Player.metadata['hygiene'] + 75
		if newHygiene >= 100 then
			newHygiene = 100
		end
		newBioOne = Player.metadata['bioone']
		newBioTwo = Player.metadata['biotwo']
		
		QBCore.Functions.Progressbar('Spritzing', 'Spritzing', 5000, false, true, {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		}, {
			animDict = 'heartselfiemirror@queensisters',
			anim = 'heartselfie_clip'
		}, {}, {}, function() -- Done
			TriggerServerEvent('PlayerBiology:server:UseTThreeSpray', item)
			TriggerServerEvent('hud:server:UpdateNeedsBiology', newHygiene, newBioOne, newBioTwo)
			TriggerServerEvent('hud:server:RelieveStressByHygiene', Player.source, 100)
		end)
	end
end)
RegisterNetEvent('PlayerBiology:client:UseTOneWash', function(item)
	
	local Player = QBCore.Functions.GetPlayerData() 
    QBCore.Functions.Progressbar('Washing', 'Washing', 15000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
		AddToBuffer(50)
        -- TriggerServerEvent('PlayerBiology:server:UseTOneWash', item)
    end)
end)

RegisterNetEvent('PlayerBiology:client:UseTTwoWash', function(item)
	local Player = QBCore.Functions.GetPlayerData() 
    QBCore.Functions.Progressbar('Washing', 'Washing', 30000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
		AddToBuffer(75)
        -- TriggerServerEvent('PlayerBiology:server:UseTTwoWash', item)
    end)
end)

RegisterNetEvent('PlayerBiology:client:UseTThreeWash', function(item)
	local Player = QBCore.Functions.GetPlayerData() 
    QBCore.Functions.Progressbar('Washing', 'Washing', 60000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
		AddToBuffer(100)
        -- TriggerServerEvent('PlayerBiology:server:UseTThreeWash', item)
    end)
end)

RegisterNetEvent('PlayerBiology:client:UseTOneWashJob', function()
	
	local Player = QBCore.Functions.GetPlayerData() 
    QBCore.Functions.Progressbar('Washing', 'Being Washed', 15000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
		AddToBuffer(50)
        -- TriggerServerEvent('PlayerBiology:server:UseTOneWash', item)
    end)
end)

RegisterNetEvent('PlayerBiology:client:UseTTwoWashJob', function()
	local Player = QBCore.Functions.GetPlayerData() 
    QBCore.Functions.Progressbar('Washing', 'Being Washed', 30000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
		AddToBuffer(75)
        -- TriggerServerEvent('PlayerBiology:server:UseTTwoWash', item)
    end)
end)

RegisterNetEvent('PlayerBiology:client:UseTThreeWashJob', function()
	local Player = QBCore.Functions.GetPlayerData() 
    QBCore.Functions.Progressbar('Washing', 'Being Washed', 60000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
		AddToBuffer(100)
        -- TriggerServerEvent('PlayerBiology:server:UseTThreeWash', item)
    end)
end)


RegisterNetEvent('PlayerBiology:client:addToBuffer', function(amount)
	local Player = QBCore.Functions.GetPlayerData() 
	AddToBuffer(amount)
end)

