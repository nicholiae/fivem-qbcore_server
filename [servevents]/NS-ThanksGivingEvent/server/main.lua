local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('NS-ThanksGiving:moneyloot')
AddEventHandler('NS-ThanksGiving:moneyloot', function()
    local Player = QBCore.Functions.GetPlayer(source)
	local random = math.random(10, 1000)
    Player.Functions.AddMoney("cash",random,"ThanksGiving-loot")
    TriggerClientEvent("QBCore:Notify", source, 'You received $' .. random .. ' dollars','success')
    TriggerClientEvent("QBCore:Notify", source, Config.theMessage,'success')
end)

RegisterServerEvent('NS-ThanksGiving:itemloot')
AddEventHandler('NS-ThanksGiving:itemloot', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Config.ItemAmount = math.random(1,5) 
    local item = math.random(1, #Config.PresentItems)
    for k,v in pairs(Config.PresentItems) do
        if item == k then
			Player.Functions.AddItem(v, Config.ItemAmount)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[v], 'add')
			TriggerClientEvent("QBCore:Notify", source, 'You received ' .. Config.ItemAmount .. ' ' .. v .. '(s)','success')
			TriggerClientEvent("QBCore:Notify", source, Config.theMessage,'success')
        end
    end
	
end)
