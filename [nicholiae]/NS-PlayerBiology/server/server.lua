local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('PlayerBiology:server:restart', function()
    local src = source
	TriggerClientEvent('PlayerBiology:client:restartWatcher', src)

end)

RegisterNetEvent('PlayerBiology:server:UseTOneSpray', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player then return end
    if not exports['qb-inventory']:RemoveItem(source, item, 1, false, 'PlayerBiology:server:UseTOneSpray') then return end
    TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'remove')
end)

RegisterNetEvent('PlayerBiology:server:UseTTwoSpray', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player then return end
    if not exports['qb-inventory']:RemoveItem(source, item, 1, false, 'PlayerBiology:server:UseTTwoSpray') then return end
    TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'remove')
end)

RegisterNetEvent('PlayerBiology:server:UseTThreeSpray', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player then return end
    if not exports['qb-inventory']:RemoveItem(source, item, 1, false, 'PlayerBiology:server:UseTThreeSpray') then return end
    TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'remove')
end)

RegisterNetEvent('PlayerBiology:server:UseTOneWash', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player then return end
    if not exports['qb-inventory']:RemoveItem(source, item, 1, false, 'PlayerBiology:server:UseTOneWash') then return end
    TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'remove')
    TriggerClientEvent('PlayerBiology:client:UseTOneWash', src, item)
end)

RegisterNetEvent('PlayerBiology:server:UseTTwoWash', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player then return end
    if not exports['qb-inventory']:RemoveItem(source, item, 1, false, 'PlayerBiology:server:UseTTwoWash') then return end
    TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'remove')
    TriggerClientEvent('PlayerBiology:client:UseTTwoWash', src, item)
end)

RegisterNetEvent('PlayerBiology:server:UseTThreeWash', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player then return end
    if not exports['qb-inventory']:RemoveItem(source, item, 1, false, 'PlayerBiology:server:UseTThreeWash') then return end
    TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'remove')
    TriggerClientEvent('PlayerBiology:client:UseTThreeWash', src, item)
end)

QBCore.Commands.Add('setplayerbiology', 'Set players hygiene/bioone/biotwo', {{name = 'bioType', help = 'What type of bio are we altering'},{name = 'amount', help = 'Amount of bio to Set to 0-100'},{name = 'player', help = 'Player ID to change'}}, false, function(source, args)
	local src = source
	local bioType = tostring(args[1])
    local amount = tonumber(args[2])	
	local playerTarget = QBCore.Functions.GetPlayer(tonumber(args[3]))
	playerTarget.Functions.SetMetaData(bioType, amount)
	if bioType == 'hygiene' then
		TriggerClientEvent('hud:client:UpdateHygiene', tonumber(args[3]), amount)
	elseif bioType == 'bioone' then
		TriggerClientEvent('hud:client:UpdateBioOne', tonumber(args[3]), amount)
	elseif bioType == 'biotwo' then
		TriggerClientEvent('hud:client:UpdateBioTwo', tonumber(args[3]), amount)
	end
end, 'admin')

QBCore.Commands.Add('resetplayerbiology', 'Reset players hygiene/bioone/biotwo', {{name = 'player', help = 'Player ID to change'}}, false, function(source, args)
	local src = source
    local amount = 100	
	local playerTarget = QBCore.Functions.GetPlayer(tonumber(args[1]))
	playerTarget.Functions.SetMetaData('hygiene', amount)
	playerTarget.Functions.SetMetaData('bioone', amount)
	playerTarget.Functions.SetMetaData('biotwo', amount)
	TriggerClientEvent('hud:client:UpdateHygiene', tonumber(args[1]), amount)
	TriggerClientEvent('hud:client:UpdateBioOne', tonumber(args[1]), amount)
	TriggerClientEvent('hud:client:UpdateBioTwo', tonumber(args[1]), amount)
end, 'admin')

QBCore.Commands.Add('resetallbiology', 'Reset all hygiene/bioone/biotwo', {}, false, function(source, args)
	local src = source
    local amount = 100	
	local playerList = QBCore.Functions.GetPlayers()
	for k,v in pairs(playerList) do
		local playerTarget = QBCore.Functions.GetPlayer(tonumber(v))
		playerTarget.Functions.SetMetaData('hygiene', amount)
		playerTarget.Functions.SetMetaData('bioone', amount)
		playerTarget.Functions.SetMetaData('biotwo', amount)
		TriggerClientEvent('hud:client:UpdateHygiene', tonumber(v), amount)
		TriggerClientEvent('hud:client:UpdateBioOne', tonumber(v), amount)
		TriggerClientEvent('hud:client:UpdateBioTwo', tonumber(v), amount)
	end
end, 'admin')

QBCore.Commands.Add('setupbiology', 'setup helper for biology', {}, false, function(source, args)
	local src = source
	TriggerClientEvent('PlayerBiology:client:setupbiology', src)
end, 'admin')

-- usable items

-- sprays 1
QBCore.Functions.CreateUseableItem('cucu_spray', function(source)
    TriggerClientEvent('PlayerBiology:client:UseTOneSpray', source, 'cucu_spray')
end)
QBCore.Functions.CreateUseableItem('copid_spray', function(source)
    TriggerClientEvent('PlayerBiology:client:UseTOneSpray', source, 'copid_spray')
end)

-- sprays 2
QBCore.Functions.CreateUseableItem('guudgurl_spray', function(source)
    TriggerClientEvent('PlayerBiology:client:UseTTwoSpray', source, 'guudgurl_spray')
end)
QBCore.Functions.CreateUseableItem('duor_spray', function(source)
    TriggerClientEvent('PlayerBiology:client:UseTTwoSpray', source, 'duor_spray')
end)

-- sprays 3
QBCore.Functions.CreateUseableItem('missduor_spray', function(source)
    TriggerClientEvent('PlayerBiology:client:UseTThreeSpray', source, 'missduor_spray')
end)
QBCore.Functions.CreateUseableItem('uros_spray', function(source)
    TriggerClientEvent('PlayerBiology:client:UseTThreeSpray', source, 'uros_spray')
end)


-- washes 1
QBCore.Functions.CreateUseableItem('duv_wash', function(source)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.job.name == 'beauty' then
		local targetPlayer, distance = QBCore.Functions.GetClosestPlayer(source)
		if distance <= 2.5 and targetPlayer then
			local item = 'duv_wash'
			if not exports['qb-inventory']:RemoveItem(source, item, 1, false, 'PlayerBiology:server:UseTOneWashJob') then return end
			TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'remove')
			TriggerClientEvent('PlayerBiology:client:UseTOneWashJob', targetPlayer.source)
		else
			TriggerClientEvent('QBCore:Notify', source, 'No one nearby', 'error')
		end
	else
        TriggerClientEvent('QBCore:Notify', source, 'This can only be used in a shower or tub', 'error')
	end
end)
QBCore.Functions.CreateUseableItem('puntune_wash', function(source)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.job.name == 'beauty' then
		local targetPlayer, distance = QBCore.Functions.GetClosestPlayer(source)
		if distance <= 2.5 and targetPlayer then
			local item = 'puntune_wash'
			if not exports['qb-inventory']:RemoveItem(source, item, 1, false, 'PlayerBiology:server:UseTOneWashJob') then return end
			TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'remove')
			TriggerClientEvent('PlayerBiology:client:UseTOneWashJob', targetPlayer.source)
		else
			TriggerClientEvent('QBCore:Notify', source, 'No one nearby', 'error')
		end
	else
        TriggerClientEvent('QBCore:Notify', source, 'This can only be used in a shower or tub', 'error')
	end
end)

-- washes 2
QBCore.Functions.CreateUseableItem('hudandshudders_wash', function(source)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.job.name == 'beauty' then
			local item = 'hudandshudders_wash'
		local targetPlayer, distance = QBCore.Functions.GetClosestPlayer(source)
		if distance <= 2.5 and targetPlayer then
			if not exports['qb-inventory']:RemoveItem(source, item, 1, false, 'PlayerBiology:server:UseTTwoWashJob') then return end
			TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'remove')
			TriggerClientEvent('PlayerBiology:client:UseTTwoWashJob', targetPlayer.source)
		else
			TriggerClientEvent('QBCore:Notify', source, 'No one nearby', 'error')
		end
	else
        TriggerClientEvent('QBCore:Notify', source, 'This can only be used in a shower or tub', 'error')
	end
end)
QBCore.Functions.CreateUseableItem('suvmer_wash', function(source)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.job.name == 'beauty' then
		local targetPlayer, distance = QBCore.Functions.GetClosestPlayer(source)
		if distance <= 2.5 and targetPlayer then
			local item = 'suvmer_wash'
			if not exports['qb-inventory']:RemoveItem(source, item, 1, false, 'PlayerBiology:server:UseTTwoWashJob') then return end
			TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'remove')
			TriggerClientEvent('PlayerBiology:client:UseTTwoWashJob', targetPlayer.source)
		else
			TriggerClientEvent('QBCore:Notify', source, 'No one nearby', 'error')
		end
	else
        TriggerClientEvent('QBCore:Notify', source, 'This can only be used in a shower or tub', 'error')
	end
end)

-- washes 3
QBCore.Functions.CreateUseableItem('ussi_wash', function(source)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.job.name == 'beauty' then
		local targetPlayer, distance = QBCore.Functions.GetClosestPlayer(source)
		if distance <= 2.5 and targetPlayer then
			local item = 'ussi_wash'
			if not exports['qb-inventory']:RemoveItem(source, item, 1, false, 'PlayerBiology:server:UseTThreeWashJob') then return end
			TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'remove')
			TriggerClientEvent('PlayerBiology:client:UseTThreeWashJob', targetPlayer.source)
		else
			TriggerClientEvent('QBCore:Notify', source, 'No one nearby', 'error')
		end
	else
        TriggerClientEvent('QBCore:Notify', source, 'This can only be used in a shower or tub', 'error')
	end
end)
QBCore.Functions.CreateUseableItem('trusumm_wash', function(source)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.job.name == 'beauty' then
		local targetPlayer, distance = QBCore.Functions.GetClosestPlayer(source)
		if distance <= 2.5 and targetPlayer then
			local item = 'trusumm_wash'
			if not exports['qb-inventory']:RemoveItem(source, item, 1, false, 'PlayerBiology:server:UseTThreeWashJob') then return end
			TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'remove')
			TriggerClientEvent('PlayerBiology:client:UseTThreeWashJob', targetPlayer.source)
		else
			TriggerClientEvent('QBCore:Notify', source, 'No one nearby', 'error')
		end
	else
        TriggerClientEvent('QBCore:Notify', source, 'This can only be used in a shower or tub', 'error')
	end
end)
