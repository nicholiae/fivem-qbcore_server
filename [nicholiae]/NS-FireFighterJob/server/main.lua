local QBCore = exports['qb-core']:GetCoreObject()
local firefighterCount = 0
local firefighterCalled = false
local FireFighters = {}
local randomFireTriggered = false

-- Events

RegisterNetEvent('firefighter:server:stash', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if Player.PlayerData.job.name ~= 'firefighter' then return end
    local citizenId = Player.PlayerData.citizenid
    local stashName = 'firefighterstash'
    exports['qb-inventory']:OpenInventory(src, stashName)
end)

	
QBCore.Functions.CreateCallback('firefighter:GetFireFighters', function(_, cb)
	local amount = 0
	local players = QBCore.Functions.GetQBPlayers()
	for _, v in pairs(players) do
		if v.PlayerData.job.name == 'firefighter' and v.PlayerData.job.onduty then
			amount = amount + 1
		end
	end
	cb(amount)
end)

QBCore.Functions.CreateCallback('firefighter:GetAllPlayers', function(_, cb)
	local playersList = QBCore.Functions.GetQBPlayers()
	-- print(playersList)
	cb(playersList)
end)
	
RegisterNetEvent('firefighter:StartServerFire',function(coords, maxChildren, isGasFire)
	local src = source
	-- local players = QBCore.Functions.GetQBPlayers()
	-- for k,v in pairs(players) do
		-- if v.PlayerData.job.name == 'firefighter' or  v.PlayerData.job.name == 'police' or v.PlayerData.job.name == 'ambulance' or v.PlayerData.job.name == 'reporter' and v.PlayerData.job.onduty then
			-- TriggerClientEvent('firefighter:queFireForFireFighters', v.PlayerData.source, coords, maxChildren, isGasFire)
	TriggerClientEvent('firefighter:StartFire', -1, coords, maxChildren, isGasFire)
		-- end
	-- end
end)

RegisterNetEvent('firefighter:StopFires', function()
	local src = source
	local players = QBCore.Functions.GetPlayers()
	-- for k,v in pairs(players) do
	TriggerClientEvent('firefighter:StopFires', -1)
	-- end
end)

RegisterNetEvent('firefighter:server:fireAlert', function(text, fireLocation)
	local src = source
    local ped = GetPlayerPed(src)
    local coords = fireLocation
    local players = QBCore.Functions.GetQBPlayers()
	randomFireTriggered = true
	if not firefighterCalled and coords then
		-- print('FireAlert:'..tostring(coords))
		firefighterCalled = true
		for _, v in pairs(players) do
			if v.PlayerData.job.name == 'firefighter' or  v.PlayerData.job.name == 'police' or v.PlayerData.job.name == 'ambulance' or v.PlayerData.job.name == 'reporter' and v.PlayerData.job.onduty then
				firefighterCalled = true
				TriggerClientEvent('firefighter:client:fireAlert', v.PlayerData.source, coords, text)
			end
		end
		Wait(Config.FireCallCooldown * 60000)
		firefighterCalled = false
	-- else
		-- TriggerClientEvent('QBCore:Notify', src, 'FireFighter has already been notified', 'warning')
	end
end)

RegisterNetEvent("firefighter:server:PayFireService", function()
	local src = source
	exports['qb-banking']:AddMoney('firefighter', Config.PayAmount, 'Fire Extinguished')
    local players = QBCore.Functions.GetQBPlayers()
	for _, v in pairs(players) do
		if v.PlayerData.job.name == 'firefighter' or  v.PlayerData.job.name == 'police' or v.PlayerData.job.name == 'ambulance' or v.PlayerData.job.name == 'reporter' and v.PlayerData.job.onduty then
			TriggerClientEvent('QBCore:Notify', v.PlayerData.source, 'You Successfully put out the fire!', 'success')
		end
	end
	randomFireTriggered = false
	
end)

RegisterNetEvent('firefighter:server:SetFireFighterCount', function(amount)
		local src = source
		firefighterCount = amount or 0
		if firefighterCount < 0 then
			firefighterCount = 0
		end
		TriggerClientEvent('firefighter:client:SetFireFighterCount', -1, firefighterCount)
		FireFighters[src] = true
end)

RegisterNetEvent('firefighter:server:AddFireFighter', function(job)
	if job == 'firefighter' then
		local src = source
		firefighterCount = firefighterCount + 1
		TriggerClientEvent('firefighter:client:SetFireFighterCount', -1, firefighterCount)
		FireFighters[src] = true
	end
end)

RegisterNetEvent('firefighter:server:RemoveFireFighter', function(job)
	if job == 'firefighter' then
		local src = source
		firefighterCount = firefighterCount - 1
		if firefighterCount < 0 then
			firefighterCount = 0
		end

		TriggerClientEvent('firefighter:client:SetFireFighterCount', -1, firefighterCount)
		FireFighters[src] = nil
	end
end)

AddEventHandler('playerDropped', function()
	local src = source
	if FireFighters[src] then
		firefighterCount = firefighterCount - 1
		if firefighterCount < 0 then
			firefighterCount = 0
		end

		TriggerClientEvent('firefighter:client:SetFireFighterCount', -1, firefighterCount)
		FireFighters[src] = nil
	end
end)

-- Callbacks

-- Commands

QBCore.Commands.Add('911f', 'Fire Report', {{name='message', help='Message to be sent'}}, false, function(source, args)
	local src = source
	if args[1] then message = table.concat(args, " ") else message = 'Civilian Call' end
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local players = QBCore.Functions.GetQBPlayers()
    for k,v in pairs(players) do
        if v.PlayerData.job.name == 'firefighter' or v.PlayerData.job.name == 'police' and v.PlayerData.job.onduty then
            TriggerClientEvent('firefighter:client:fireAlert', v.PlayerData.source, coords, message)
        end
    end
end)

QBCore.Commands.Add('firestarter', 'Start a fire', {}, false, function(source, args)
	local src = source
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local players = QBCore.Functions.GetQBPlayers()
	local luck = 1
	local chosenLoc = math.random(#Config.RandomFireLocations)
	local fireLocation = Config.RandomFireLocations[chosenLoc]['location']
	local elapsedTimeofFire = 30
	local childrenofFire = 25
    -- for k,v in pairs(players) do
        -- if v.PlayerData.job.name == 'firefighter' or v.PlayerData.job.name == 'police' and v.PlayerData.job.onduty then
	TriggerClientEvent('firefighter:client:sendLuck', -1, luck)
	TriggerClientEvent('firefighter:StartFire', -1, fireLocation, maxChildren, isGasFire)
        -- end
    -- end
end, 'admin')

QBCore.Commands.Add('firestopper', 'Stop all fires', {}, false, function(source, args)
	local src = source
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local players = QBCore.Functions.GetQBPlayers()
    -- for k,v in pairs(players) do
		-- print('v.PlayerData.source:'..tostring(v.PlayerData.source))
	TriggerClientEvent('firefighter:StopFires', -1)
    -- end
end, 'admin')

CreateThread(function()
	while true do
		local luck = math.random(1,100)
		if Config.Debug then
			print('Luck:'..tostring(luck))
		end
		local players = QBCore.Functions.GetQBPlayers()
		for k,v in pairs(players) do
			if v.PlayerData.job.name == 'firefighter' and v.PlayerData.job.onduty and not randomFireTriggered then
				if Config.Debug then
					print('name:'..tostring(v.PlayerData.name))
					print('source:'..tostring(v.PlayerData.source))
				end
				TriggerClientEvent('firefighter:client:sendLuck', v.PlayerData.source, luck)
			end
		end
		Wait(Config.Frequency*60000) -- x minutes
	end
end)