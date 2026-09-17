local QBCore = exports['qb-core']:GetCoreObject()

-- Events

RegisterNetEvent('NS-RestockTequilala:server:getItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local Job = Player.PlayerData.job.name
    for _ = 1, math.random(1, Config_Tequilala.MaxItemsReceived), 1 do
		if Job == 'tequilala' then
			local randItem = Config_Tequilala.ItemTableTequi[math.random(1, #Config_Tequilala.ItemTableTequi)]
			local amount = math.random(Config_Tequilala.MinItemReceivedQty, Config_Tequilala.MaxItemReceivedQty)
			exports['qb-inventory']:AddItem(src, randItem, amount, false, false, 'NS-RestockTequilala:server:getItem')
			TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add')
		elseif Job == 'pulse' then
			local randItem = Config_Tequilala.ItemTablePulse[math.random(1, #Config_Tequilala.ItemTablePulse)]
			local amount = math.random(Config_Tequilala.MinItemReceivedQty, Config_Tequilala.MaxItemReceivedQty)
			exports['qb-inventory']:AddItem(src, randItem, amount, false, false, 'NS-RestockTequilala:server:getItem')
			TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add')
		else
			TriggerClientEvent('QBCore:Notify', src, 'There was an issue giving you your items, please open a ticket!', 'error')
		end
        Wait(500)
    end

    local chance = math.random(1, 100)
    if chance < 7 then
        exports['qb-inventory']:AddItem(src, Config_Tequilala.ChanceItem, 1, false, false, 'NS-RestockTequilala:server:getItem')
        TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[Config_Tequilala.ChanceItem], 'add')
    end

    local luck = math.random(1, 10)
    local odd = math.random(1, 10)
    if luck == odd then
        local random = math.random(1, 3)
        exports['qb-inventory']:AddItem(src, Config_Tequilala.LuckyItem, random, false, false, 'NS-RestockTequilala:server:getItem')
        TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[Config_Tequilala.LuckyItem], 'add')
    end
end)
