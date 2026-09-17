local QBCore = exports['qb-core']:GetCoreObject()

local CurrentCops = 0

RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)


RegisterServerEvent('NS-ForgeryHeist:server:removeGateCracker')
AddEventHandler('NS-ForgeryHeist:server:removeGateCracker', function()
	local src = source
	exports['qb-inventory']:RemoveItem(src, 'gatecrack', 1, false, 'Forgery Entry')
	TriggerClientEvent('qb-inventory:client:ItemBox', src, 'gatecrack', 'remove')
end)

RegisterServerEvent('NS-ForgeryHeist:server:removeBothEntranceFail')
AddEventHandler('NS-ForgeryHeist:server:removeBothEntranceFail', function()
	local src = source
	exports['qb-inventory']:RemoveItem(src, 'gatecrack', 1, false, 'Forgery Entry FAILURE')
	TriggerClientEvent('qb-inventory:client:ItemBox', src, 'gatecrack', 'remove')
	exports['qb-inventory']:RemoveItem(src, 'electronickit', 1, false, 'Forgery Entry FAILURE')
	TriggerClientEvent('qb-inventory:client:ItemBox', src, 'electronickit', 'remove')
end)

RegisterServerEvent('NS-ForgeryHeist:server:GivePlayerForgedDocuments')
AddEventHandler('NS-ForgeryHeist:server:GivePlayerForgedDocuments', function()

	local src = source
	exports['qb-inventory']:AddItem(src, 'certificate', 1, false, false, 'Forgery Document Grab')
	TriggerClientEvent('qb-inventory:client:ItemBox', src, 'certificate', 'add')
end)

RegisterServerEvent('NS-ForgeryHeist:server:GivePlayerThePrize')
AddEventHandler('NS-ForgeryHeist:server:GivePlayerThePrize', function()

	local src = source
	
	exports['qb-inventory']:RemoveItem(src, 'certificate', 1, false, 'Forgery End LootBody')
	TriggerClientEvent('qb-inventory:client:ItemBox', src, 'certificate', 'remove')
	if CurrentCops >= Config.PoliceOnDutyRequired then
		exports['qb-inventory']:AddItem(src, 'freebag', 1, false, false, 'Forgery End LootBody')
		TriggerClientEvent('qb-inventory:client:ItemBox', src, 'freebag', 'add')
	else
		TriggerClientEvent('QBCore:Notify', src, 'Not enough cops to get the free bag but enjoy the money!', 'error')
	end
end)

RegisterServerEvent('NS-ForgeryHeist:server:GiveMoney')
AddEventHandler('NS-ForgeryHeist:server:GiveMoney', function()

	local src = source
	local amount = 25
	amount = max(1, int(amount * min(CurrentCops / Config['RequiredCops'], 1.0)))
	exports['qb-inventory']:AddItem(src, 'printedcash', amount, false, false, 'Forgery End LootBody')
	TriggerClientEvent('qb-inventory:client:ItemBox', src, 'printedcash', 'add')
	
end)

RegisterServerEvent('NS-ForgeryHeist:server:GiveGold')
AddEventHandler('NS-ForgeryHeist:server:GiveGold', function()

	local src = source
	
	exports['qb-inventory']:RemoveItem(src, 'certificate', 1, false, 'Forgery End LootBody')
	TriggerClientEvent('qb-inventory:client:ItemBox', src, 'certificate', 'remove')
	exports['qb-inventory']:AddItem(src, 'goldbar', 10, false, false, 'Forgery End LootBody')
	TriggerClientEvent('qb-inventory:client:ItemBox', src, 'goldbar', 'add')
end)
