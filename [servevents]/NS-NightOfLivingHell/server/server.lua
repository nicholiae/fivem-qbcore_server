local QBCore = exports['qb-core']:GetCoreObject()
local optedin = false



QBCore.Commands.Add('NightOfLivingHell', 'Toggles night of living hell event for all players', {}, false, function(source)
	local src = source
	local adminName = GetPlayerName(src)
	if optedin == false then
		optedin = true
	else
		optedin = false
	end	
	for _, playerId in ipairs(GetPlayers()) do
		local targetPlayerName = GetPlayerName(playerId)
		TriggerClientEvent('QBCore:Notify', playerId, adminName..' has toggled Night of Living Hell Event')
		
		TriggerClientEvent('NOLH:client:toggleEvent', playerId)
	end

	
end, 'admin')

QBCore.Commands.Add('NOLHOUT', 'Removes you from the event Night of Living Hell, CANNOT BE OPTED BACK IN', {}, false, function(source)
	local src = source
	TriggerClientEvent('NOLH:client:toggleEventForSolo', src)
end)


RegisterServerEvent('NOLH:server:pay')
AddEventHandler('NOLH:server:pay', function(payout)

	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	
	Player.Functions.AddMoney("cash", payout)

end)

RegisterServerEvent('NOLH:server:died')
AddEventHandler('NOLH:server:died', function(payout)

	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	
	Player.Functions.RemoveMoney("cash", payout)

end)

QBCore.Functions.CreateCallback('NOLH:server:getoption', function(_, cb)
	local check = optedin
	cb(check)
end)