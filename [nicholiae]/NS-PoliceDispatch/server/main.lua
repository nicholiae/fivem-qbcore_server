local QBCore = exports['qb-core']:GetCoreObject()
local ActiveMission = 0

discord = {
    ['webhook'] = 'https://discord.com/api/webhooks/1272349985974780007/zIO_6X8EZBBpUSU3PjUH2zNMJi7eUrWJ4MdA0YTRt021B6V2TMl0V4vP0k7RmRK6M358',
    ['name'] = 'Police Dispatch Logs',
    ['image'] = 'https://cdn.discordapp.com/attachments/774536621802389544/899986988386623498/logo.png'
}

function sendtodiscordaslog(name, message)
    local data = {
        {
            ["color"] = '3553600',
            ["title"] = "**".. name .."**",
            ["description"] = message,
        }
    }
    PerformHttpRequest(discord['webhook'], function(err, text, headers) end, 'POST', json.encode({username = discord['name'], embeds = data, avatar_url = discord['image']}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('NS-PoliceDispatch:Accept', function()
	local copsOnDuty = 0
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local accountMoney = xPlayer.PlayerData.money['bank']
	if ActiveMission == 0 then
		if accountMoney < Config.ActivationCost then
			TriggerClientEvent('QBCore:Notify', _source, 'You need ' .. Config.Currency .. '' .. Config.ActivationCost .. ' in the bank to accept the mission')
		else
			TriggerClientEvent('NS-PoliceDispatch:SpawnMissionAssets', _source)
			xPlayer.Functions.RemoveMoney('bank', Config.ActivationCost, 'armored-truck')
			OdpalTimer()
		end
	else
		TriggerClientEvent('QBCore:Notify', _source, 'Someone is already carrying out this mission')
	end
end)

function OdpalTimer()
	ActiveMission = 1
	Wait(Config.ResetTimer * 1000)
	ActiveMission = 0
	TriggerClientEvent('NS-PoliceDispatch:CleanUp', -1)
end


RegisterServerEvent('NS-PoliceDispatch:GiveLoot', function()
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local bags = math.random(Config.LowBag, Config.HighBag)
	local info = {
		worth = math.random(Config.Payout.Min, Config.Payout.Max)
	}
	
	exports['qb-inventory']:AddItem(_source, 'markedbills', bags, false, info, 'NS-PoliceDispatch:GiveLoot')
	TriggerClientEvent('qb-inventory:client:ItemBox', _source, QBCore.Shared.Items['markedbills'], 'add')
	TriggerClientEvent('QBCore:Notify', _source, 'You got ' .. bags .. ' bags of dirty money from the criminal.')
	local chance = math.random(1, 100)
	if chance > 79 then
		exports['qb-inventory']:AddItem(_source, 'police_stormram', bags, false, info, 'NS-PoliceDispatch:BonusLoot')
		TriggerClientEvent('qb-inventory:client:ItemBox', _source, QBCore.Shared.Items['police_stormram'], 'add')
		TriggerClientEvent('QBCore:Notify', _source, 'A promotion is in order, heres a stormram!')
	end
	Wait(2500)
end)


RegisterServerEvent('NS-PoliceDispatch:Reward')
AddEventHandler('NS-PoliceDispatch:Reward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('markedbills') ~= nil then
		local globalWorth = math.random(Config.Payout.Min, Config.Payout.Max)
        Player.Functions.RemoveItem('markedbills',1)
        Player.Functions.AddMoney('cash', globalWorth)
        TriggerClientEvent('QBCore:Notify', src, 'You have successfully completed the Mission and you have earned your reward', 'success')
        sendtodiscordaslog(Player.PlayerData.name ..  ' - ' .. Player.PlayerData.license .. ' - ' .. Player.PlayerData.job.name, 'Claimed his/her reward From the Dispatch Mission')
    end
end)