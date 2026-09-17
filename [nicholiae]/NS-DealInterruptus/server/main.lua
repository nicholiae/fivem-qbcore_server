local QBCore = exports['qb-core']:GetCoreObject()
local ActiveMission = 0
local bags = 5
local info = {
		worth = 20000
	}
	
RegisterServerEvent('NS-DealInterruptus:accept', function()
	local copsOnDuty = 0
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local accountMoney = xPlayer.PlayerData.money['bank']
	if ActiveMission == 0 then
		if accountMoney < Config.ActivationCost then
			TriggerClientEvent('QBCore:Notify', _source, 'You need ' .. Config.Currency .. '' .. Config.ActivationCost .. ' in the bank to accept the mission')
		else
			for _, v in pairs(QBCore.Functions.GetPlayers()) do
				local Player = QBCore.Functions.GetPlayer(v)
				if Player ~= nil then
					if (Player.PlayerData.job.name == 'police' or Player.PlayerData.job.type == 'leo') and Player.PlayerData.job.onduty then
						copsOnDuty = copsOnDuty + 1
					end
				end
			end
			if copsOnDuty >= Config.ActivePolice then
				TriggerClientEvent('NS-DealInterruptus:Pozwolwykonac', _source)
				xPlayer.Functions.RemoveMoney('bank', Config.ActivationCost, 'DealInterruptus')
				OdpalTimer()
			else
				TriggerClientEvent('QBCore:Notify', _source, 'Need at least ' .. Config.ActivePolice .. ' police to activate the mission.')
			end
		end
	else
		TriggerClientEvent('QBCore:Notify', _source, 'Someone is already carrying out this mission')
	end
end)

RegisterServerEvent('NS-DealInterruptus:server:callCops', function(streetLabel, coords)
	-- local place = "Armored Truck"
	-- local msg = "The Alarm has been activated from a "..place.. " at " ..streetLabel
	-- Why is this unused?
	TriggerClientEvent('NS-DealInterruptus:client:robberyCall', -1, streetLabel, coords)
end)

function OdpalTimer()
	ActiveMission = 1
	Wait(Config.ResetTimer * 1000)
	ActiveMission = 0
	TriggerClientEvent('NS-DealInterruptus:CleanUp', -1)
end

RegisterServerEvent('NS-DealInterruptus:zawiadompsy', function(x, y, z)
	TriggerClientEvent('NS-DealInterruptus:InfoForLspd', -1, x, y, z)
end)

RegisterServerEvent('NS-DealInterruptus:Server:DeathCleanUp', function(source)
	exports['qb-inventory']:RemoveItem(player, 'markedbills', bags, false, 'NS-DealInterruptus:playerDeath')
	TriggerClientEvent('qb-inventory:client:ItemBox', player, QBCore.Shared.Items['markedbills'], 'remove')
	TriggerClientEvent('NS-DealInterruptus:CleanUp')
end)


RegisterServerEvent('NS-DealInterruptus:ANTIgraczZrobilnapad', function()
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	
	local payout = info.worth*bags*Config.tax
	-- 
	exports['qb-inventory']:RemoveItem(_source, 'markedbills', bags, false, 'NS-DealInterruptus:ANTIgraczZrobilnapad')
	TriggerClientEvent('qb-inventory:client:ItemBox', _source, QBCore.Shared.Items['markedbills'], 'remove')
	xPlayer.Functions.AddMoney('cash', payout, 'washing money')
	TriggerClientEvent('QBCore:Notify', _source, 'You turned over ' .. bags .. ' bags of cash and received $'..payout)

	
	Wait(600)
end)

RegisterServerEvent('NS-DealInterruptus:graczZrobilnapad', function()
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	bags = math.random(Config.LowBag,Config.HighBag)
	info = {worth = math.random(Config.Payout.Min,Config.Payout.Max)}
	exports['qb-inventory']:AddItem(_source, 'markedbills', bags, false, info, 'NS-DealInterruptus:graczZrobilnapad')
	TriggerClientEvent('qb-inventory:client:ItemBox', _source, QBCore.Shared.Items['markedbills'], 'add')

	local chance = math.random(1, 100)
	TriggerClientEvent('QBCore:Notify', _source, 'You took ' .. bags .. ' bags of cash from the van')

	if chance >= 60 then
		exports['qb-inventory']:AddItem(_source, 'security_card_02', 1, false, false, 'NS-DealInterruptus:graczZrobilnapad')
		TriggerClientEvent('qb-inventory:client:ItemBox', _source, QBCore.Shared.Items['security_card_02'], 'add')
	end
	Wait(2500)
end)
