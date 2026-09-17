local QBCore = exports['qb-core']:GetCoreObject()
local chosenPed
local sleep = 1
local dict
local anim
local anim2
local timeForThanks = 0
local playerDist


function resetAll()
	DeleteEntity(chosenPed)
	dict = nil
	anim = nil
	anim2 = nil
	ClearPedSecondaryTask(GetPlayerPed(-1))
	ClearPedTasks(PlayerPedId())
	playerDist = nil
	timeForThanks = 30
end


CreateThread(function()
	while true do
		sleep = 1000
		while timeForThanks ~= 0 do
		
			if Config.Debug then
				print('timeForThanks: '..tostring(timeForThanks))
			end
			sleep = 60000 --one minute
			Wait(sleep)
			timeForThanks = timeForThanks - 1
			if timeForThanks < 0 then
				sleep = 1000
				timeForThanks = 0
			end
		end
		Wait(sleep)
	end
end)



CreateThread(function()
    while true do
		if timeForThanks == 0 then
			if Config.Debug then
				print('Timer: '..tostring(timeForThanks))
			end
			Wait(sleep)
			local pedPool = GetGamePool('CPed')
			for i = 1, #pedPool do
				local isPed = IsEntityAPed(pedPool[i])
				if isPed then
					local playerLoc = GetEntityCoords(PlayerPedId())
					local pedLoc = GetEntityCoords(pedPool[i])
					local pedDist = #(playerLoc - pedLoc)
					if pedDist > Config.MinDistance and pedDist < Config.MaxDistance then
						chosenPed = pedPool[i]
						FreezeEntityPosition(chosenPed, true)
						-- SetEntityAsNoLongerNeeded(chosenPed)
						ClearPedTasks(chosenPed)
						TaskSetBlockingOfNonTemporaryEvents(chosenPed)
						while chosenPed do
							local playerLoc = GetEntityCoords(PlayerPedId())
							local pedLoc = GetEntityCoords(pedPool[i])
							local pedDist = #(playerLoc - pedLoc)
							playerDist = #(playerLoc - pedLoc)
							
							if Config.Debug then
								print('chosenPed: '..tostring(chosenPed))
								print('pedLoc: '..tostring(pedLoc))
							end
							sleep = 30
							Wait(1000)
							TaskTurnPedToFaceEntity(chosenPed, PlayerPedId(), 5500)
							Wait(1000)
							-- dict = 'gestures@m@standing@casual'
							dict = 'friends@frj@ig_1'
							anim = 'wave_b'
							RequestAnimDict(dict)
							while not HasAnimDictLoaded(dict) do
								Wait(1)
							end
							blendIn = 1.0
							blendOut = 1.0
							duration = 30
							flag = 1 -- this is for the anim to loop
							playback = 1.0 
							Wait(3000)
							ClearPedTasks(chosenPed)
							ClearPedTasks(PlayerPedId())
							Wait(500)
							-- TaskPlayAnim(chosenPed, dict, anim, blendIn, blendOut, duration, flag, playback, 0,0,0)
							TaskPlayAnim(chosenPed, 'friends@frj@ig_1', 'wave_b', 8.0, 8.0, -1, 1, 0.0, false, false, false)

							Wait(sleep)
							if Config.Debug then
								DrawMarker(2, pedLoc.x, pedLoc.y, pedLoc.z, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 1.0, 237, 197, 66, 255, true, true)
							end
							if Config.Debug then
								print('IsPedInAnyVehicle '..tostring(IsPedInAnyVehicle(PlayerPedId(), false)))
								print('IsPedDeadOrDying '..tostring(IsPedDeadOrDying(chosenPed)))
								print('playerDist: '..tostring(playerDist))
							end
							if not IsPedDeadOrDying(chosenPed) then
								if not IsPedInAnyVehicle(PlayerPedId(), false) then
									while (playerDist < 4.0) do
										Wait(1)
										QBCore.Functions.DrawText3D(pedLoc.x, pedLoc.y, pedLoc.z + 0.2, 'Hug Friend - [~g~E~w~]')
										ClearPedTasks(chosenPed)
										TaskTurnPedToFaceEntity(chosenPed, PlayerPedId(), 5500)
										if IsControlJustReleased(1, 51) then
											if DoesEntityExist(GetPlayerPed(-1)) then
												sleep = 5
												ClearPedTasks(chosenPed)
												ClearPedTasks(PlayerPedId())
												Wait(500)
												dict = 'mp_ped_interaction'
												anim = 'kisses_guy_a'
												anim2 = 'kisses_guy_b'
												RequestAnimDict(dict)
												while not HasAnimDictLoaded(dict) do
													Wait(1)
												end
												-- blendIn = 1.0
												-- blendOut = 1.0
												-- duration = 30
												-- flag = 1 -- this is for the anim to loop
												-- playback = 1.0 
												-- Wait(3000)
												ClearPedTasks(chosenPed)
												ClearPedTasks(PlayerPedId())
												Wait(500)
												-- TaskPlayAnim(chosenPed, dict, anim2, blendIn, blendOut, duration, flag, playback, 0,0,0)
												-- TaskPlayAnim(PlayerPedId(), dict, anim, blendIn, blendOut, duration, flag, playback, 0,0,0)
												TaskPlayAnim(chosenPed, 'mp_ped_interaction', 'kisses_guy_a', 8.0, 8.0, -1, 1, 0.0, false, false, false)
												TaskPlayAnim(PlayerPedId(), 'mp_ped_interaction', 'kisses_guy_b', 8.0, 8.0, -1, 1, 0.0, false, false, false)
																	
												Wait(5000)
												print("after wait")
												randomChance = math.random(1, 100)
													
												if randomChance < Config.ProbabilityMoneyLoot then
													TriggerServerEvent('NS-ThanksGiving:moneyloot')
												end
												if randomChance < Config.ProbabilityItemLoot then
													TriggerServerEvent('NS-ThanksGiving:itemloot')
												end
												if randomChance > Config.ProbabilityItemLoot and randomChance < 100 then
													TriggerServerEvent('NS-ThanksGiving:moneyloot')
													TriggerServerEvent('NS-ThanksGiving:itemloot')
												end
												
												resetAll()
											end
										end
									end
								end
							end
							Wait(1)
						end
					end
				end
			end
		else
			Wait(1)
		end
    end
end)

CreateThread(function()
    while true do
        Wait(1)
		if chosenPed then
			local pedLoc = GetEntityCoords(chosenPed)
			local playerLoc = GetEntityCoords(PlayerPedId())
			local pedDist = #(playerLoc - pedLoc)
			if Config.Debug then
				DrawMarker(2, pedLoc.x, pedLoc.y, pedLoc.z, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 1.0, 237, 197, 66, 255, true, true)
			end
			if pedDist > Config.MaxDistance then
				chosenPed = nil
			end
		end
	end
end)
