local QBCore = exports['qb-core']:GetCoreObject()
local ActiveMission = 0

	
RegisterServerEvent('NS-CallGirl:accept', function()
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local accountMoney = xPlayer.PlayerData.money['bank']
	if ActiveMission == 0 then
		if accountMoney < Config.ActivationCost then
			TriggerClientEvent('QBCore:Notify', _source, 'You need ' .. Config.Currency .. '' .. Config.ActivationCost .. ' in the bank to accept the mission')
		else
			TriggerClientEvent('NS-CallGirl:Paid', _source)
			xPlayer.Functions.RemoveMoney('bank', Config.ActivationCost, 'CallGirl')
			exports['qb-banking']:AddMoney('ambulance', Config.ActivationCost, 'CallGirl')
			OdpalTimer()
		end
	else
		TriggerClientEvent('QBCore:Notify', _source, 'It seems the callgirl is occupied at the moment.')
	end
end)


function OdpalTimer()
	ActiveMission = 1
	local counter = 0
	while counter ~= Config.ResetTimer do
		print("Reset Counter: "..tostring(counter).." compared to ResetTimer: "..tostring(Config.ResetTimer))
		Wait(60000)
		counter = counter + 1 
	end
	ActiveMission = 0
	TriggerClientEvent('NS-CallGirl:CleanUp', -1)
end



QBCore.Functions.CreateCallback('NS-CallGirl:server:activeStatus', function(source, cb)
    cb(ActiveMission)
end)
