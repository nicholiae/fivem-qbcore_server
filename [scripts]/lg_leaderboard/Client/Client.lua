RegisterCommand("tstt", function()
	TriggerServerEvent('lg_leaderboard:UpdateBoard', 1)
end)

RegisterNetEvent('lg_leaderboard:Open')
AddEventHandler('lg_leaderboard:Open', function(player, players)
	SendNUIMessage({		
		open = true,
		player = player,
		players = players
	})

	SetNuiFocus(true, true)
end)

RegisterNUICallback('close', function(data, cb)
	SetNuiFocus(false, false)
	cb('ok')
end)

local alreadyDead = false
CreateThread(function()
	while true do
		local myPed = GetPlayerPed(-1)

		if IsEntityDead(myPed) and not alreadyDead then
			local killerPed = GetPedSourceOfDeath(myPed)

			if IsEntityAPed(killerPed) and IsPedAPlayer(killerPed) then
				local player = NetworkGetPlayerIndexFromPed(killerPed)
				local sourceKiller = GetPlayerServerId(player)
				
				TriggerServerEvent('lg_leaderboard:UpdateBoard', sourceKiller)
				alreadyDead = true				
			end
		end
		if not IsEntityDead(myPed) then
			alreadyDead = false
		end

		Wait(0)
	end
end)

CreateThread(function()
    while not NetworkIsSessionStarted() do Wait(0) end
	Wait(5000)
	
	SendNUIMessage({
        config = true,
        translate = translate,
		ranks = ranks,
        NameResource = {GetCurrentResourceName(),
		GetCurrentServerEndpoint()
		}
    })
end)