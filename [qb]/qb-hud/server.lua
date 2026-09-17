local QBCore = exports['qb-core']:GetCoreObject()
local ResetStress = false
local ResetHygiene = false
local ResetBioOne = false
local ResetBioTwo = false

QBCore.Commands.Add('cash', 'Check Cash Balance', {}, false, function(source, _)
    local Player = QBCore.Functions.GetPlayer(source)
    local cashamount = Player.PlayerData.money.cash
    TriggerClientEvent('hud:client:ShowAccounts', source, 'cash', cashamount)
end)

QBCore.Commands.Add('starbucks', 'Check StarBucks Balance', {}, false, function(source, _)
    local Player = QBCore.Functions.GetPlayer(source)
    local starbucksamount = Player.PlayerData.money.starbucks
    TriggerClientEvent('hud:client:ShowAccounts', source, 'starbucks', starbucksamount)
end)

QBCore.Commands.Add('bank', 'Check Bank Balance', {}, false, function(source, _)
    local Player = QBCore.Functions.GetPlayer(source)
    local bankamount = Player.PlayerData.money.bank
    TriggerClientEvent('hud:client:ShowAccounts', source, 'bank', bankamount)
end)

QBCore.Commands.Add('dev', 'Enable/Disable developer Mode', {}, false, function(source, _)
    TriggerClientEvent('qb-admin:client:ToggleDevmode', source)
end, 'admin')

RegisterNetEvent('hud:server:GainStress', function(amount)
    if Config.DisableStress then return end
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Job = Player.PlayerData.job.name
    local JobType = Player.PlayerData.job.type
    local newStress
    if not Player or Config.WhitelistedJobs[JobType] or Config.WhitelistedJobs[Job] then return end
    if not ResetStress then
        if not Player.PlayerData.metadata['stress'] then
            Player.PlayerData.metadata['stress'] = 0
        end
        newStress = Player.PlayerData.metadata['stress'] + amount
        if newStress <= 0 then newStress = 0 end
    else
        newStress = 0
    end
    if newStress > 100 then
        newStress = 100
    end
    Player.Functions.SetMetaData('stress', newStress)
    TriggerClientEvent('hud:client:UpdateStress', src, newStress)
    TriggerClientEvent('QBCore:Notify', src, Lang:t('notify.stress_gain'), 'error', 1500)
end)

RegisterNetEvent('hud:server:GainStressByHygiene', function(source, amount)
    if Config.DisableStress then return end
	-- print('gainstressbyhygiene: '..tostring(source))
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if not Player then return end
    local Job = Player.PlayerData.job.name
    local JobType = Player.PlayerData.job.type
    local newStress
    if not Player or Config.WhitelistedJobs[JobType] or Config.WhitelistedJobs[Job] then return end
    if not ResetStress then
        if not Player.PlayerData.metadata['stress'] then
            Player.PlayerData.metadata['stress'] = 0
        end
        newStress = Player.PlayerData.metadata['stress'] + amount
        if newStress <= 0 then newStress = 0 end
    else
        newStress = 0
    end
    if newStress > 100 then
        newStress = 100
    end
    Player.Functions.SetMetaData('stress', newStress)
    TriggerClientEvent('hud:client:UpdateStress', src, newStress)
    TriggerClientEvent('QBCore:Notify', src, 'Something Stinks', 'error', 5000)
    TriggerClientEvent('QBCore:Notify', src, Lang:t('notify.stress_gain'), 'error', 1500)
end)

RegisterNetEvent('hud:server:RelieveStressByHygiene', function(source, amount)
    if Config.DisableStress then return end
	-- print('RelieveStressByHygiene: '..tostring(source))
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if not Player then return end
    local Job = Player.PlayerData.job.name
    local JobType = Player.PlayerData.job.type
    local newStress
    if not Player or Config.WhitelistedJobs[JobType] or Config.WhitelistedJobs[Job] then return end
    if not ResetStress then
        if not Player.PlayerData.metadata['stress'] then
            Player.PlayerData.metadata['stress'] = 0
        end
        newStress = Player.PlayerData.metadata['stress'] - amount
        if newStress <= 0 then newStress = 0 end
    else
        newStress = 0
    end
    if newStress > 100 then
        newStress = 100
    end
    Player.Functions.SetMetaData('stress', newStress)
    TriggerClientEvent('hud:client:UpdateStress', src, newStress)
	if newStress ~= 0 then
		TriggerClientEvent('QBCore:Notify', src, 'Something Smells Wonderful', 'success', 500)
		TriggerClientEvent('QBCore:Notify', src, Lang:t('notify.stress_removed'), 'success', 500)
	end
end)

RegisterNetEvent('hud:server:RelieveStress', function(amount)
    if Config.DisableStress then return end
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local newStress
    if not Player then return end
    if not ResetStress then
        if not Player.PlayerData.metadata['stress'] then
            Player.PlayerData.metadata['stress'] = 0
        end
        newStress = Player.PlayerData.metadata['stress'] - amount
        if newStress <= 0 then newStress = 0 end
    else
        newStress = 0
    end
    if newStress > 100 then
        newStress = 100
    end
    Player.Functions.SetMetaData('stress', newStress)
    TriggerClientEvent('hud:client:UpdateStress', src, newStress)
    TriggerClientEvent('QBCore:Notify', src, Lang:t('notify.stress_removed'))
end)

RegisterNetEvent('hud:server:RelieveHygiene', function(amount)
    if Config.DisableStress then return end
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local newHygiene
    if not Player then return end
    if not ResetHygiene then
        if not Player.PlayerData.metadata['hygiene'] then
            Player.PlayerData.metadata['hygiene'] = 100
        end
        newHygiene = Player.PlayerData.metadata['hygiene'] + amount
        if newHygiene <= 0 then newHygiene = 0 end
    else
        newHygiene = 0
    end
    if newHygiene > 100 then
        newHygiene = 100
    end
    Player.Functions.SetMetaData('hygiene', newHygiene)
    TriggerClientEvent('hud:client:UpdateHygiene', src, newHygiene)
    -- TriggerClientEvent('QBCore:Notify', src, 'Hygiene Updated')
end)

RegisterNetEvent('hud:server:RelieveBioOne', function(amount)
    if Config.DisableStress then return end
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local newBioOne
    if not Player then return end
    if not ResetBioOne then
        if not Player.PlayerData.metadata['bioone'] then
            Player.PlayerData.metadata['bioone'] = 100
        end
        newBioOne = Player.PlayerData.metadata['bioone'] + amount
        if newBioOne <= 0 then newBioOne = 0 end
    else
        newBioOne = 0
    end
    if newBioOne > 100 then
        newBioOne = 100
    end
    Player.Functions.SetMetaData('bioone', newBioOne)
    TriggerClientEvent('hud:client:UpdateBioOne', src, newBioOne)
    -- TriggerClientEvent('QBCore:Notify', src, 'BioOne Updated')
end)

RegisterNetEvent('hud:server:RelieveBioTwo', function(amount)
    if Config.DisableStress then return end
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local newBioTwo
    if not Player then return end
    if not ResetBioTwo then
        if not Player.PlayerData.metadata['biotwo'] then
            Player.PlayerData.metadata['biotwo'] = 100
        end
        newBioTwo = Player.PlayerData.metadata['biotwo'] + amount
        if newBioTwo <= 0 then newBioTwo = 0 end
    else
        newBioTwo = 0
    end
    if newBioTwo > 100 then
        newBioTwo = 100
    end
    Player.Functions.SetMetaData('biotwo', newBioTwo)
    TriggerClientEvent('hud:client:UpdateBioTwo', src, newBioTwo)
    -- TriggerClientEvent('QBCore:Notify', src, 'BioTwo Updated')
end)

RegisterNetEvent('hud:server:ReduceHygiene', function(amount)
    if Config.DisableStress then return end
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local newHygiene
    if not Player then return end
    if not ResetHygiene then
        if not Player.PlayerData.metadata['hygiene'] then
            Player.PlayerData.metadata['hygiene'] = 100
        end
        newHygiene = Player.PlayerData.metadata['hygiene'] - amount
        if newHygiene <= 0 then newHygiene = 0 end
    else
        newHygiene = 0
    end
    if newHygiene > 100 then
        newHygiene = 100
    end
    Player.Functions.SetMetaData('hygiene', newHygiene)
    TriggerClientEvent('hud:client:UpdateHygiene', src, newHygiene)
    -- TriggerClientEvent('QBCore:Notify', src, 'Hygiene Updated')
end)

RegisterNetEvent('hud:server:ReduceBioOne', function(amount, sourceID)
    if Config.DisableStress then return end
	local src
	if sourceID == nil then
		src = source
	else
		src = sourceID
	end
	-- print('ReduceBioOne src: '..tostring(src))
	-- print('ReduceBioOne amount: '..tostring(amount))
    local Player = QBCore.Functions.GetPlayer(src)
    local newBioOne
    if not Player then return end
    if not ResetBioOne then
        if not Player.PlayerData.metadata['bioone'] then
            Player.PlayerData.metadata['bioone'] = 100
        end
        newBioOne = Player.PlayerData.metadata['bioone'] - amount
        if newBioOne <= 0 then newBioOne = 0 end
    else
        newBioOne = 0
    end
    if newBioOne > 100 then
        newBioOne = 100
    end
    Player.Functions.SetMetaData('bioone', newBioOne)
    TriggerClientEvent('hud:client:UpdateBioOne', src, newBioOne)
    -- TriggerClientEvent('QBCore:Notify', src, 'BioOne Updated')
end)

RegisterNetEvent('hud:server:ReduceBioTwo', function(amount, sourceID)
    if Config.DisableStress then return end
	local src
	if sourceID == nil then
		src = source
	else
		src = sourceID
	end
	-- print('ReduceBioTwo src: '..tostring(src))
	-- print('ReduceBioTwo amount: '..tostring(amount))
    local Player = QBCore.Functions.GetPlayer(src)
    local newBioTwo
    if not Player then return end
    if not ResetBioTwo then
        if not Player.PlayerData.metadata['biotwo'] then
            Player.PlayerData.metadata['biotwo'] = 100
        end
        newBioTwo = Player.PlayerData.metadata['biotwo'] - amount
        if newBioTwo <= 0 then newBioTwo = 0 end
    else
        newBioTwo = 0
    end
    if newBioTwo > 100 then
        newBioTwo = 100
    end
    Player.Functions.SetMetaData('biotwo', newBioTwo)
    TriggerClientEvent('hud:client:UpdateBioTwo', src, newBioTwo)
    -- TriggerClientEvent('QBCore:Notify', src, 'BioTwo Updated')
end)

RegisterNetEvent('hud:server:UpdateNeedsBiology', function(newHygiene, newBioOne, newBioTwo) -- Triggered in qb-core
	if Config.DisableStress then return end
	local src = source
	
	-- print('UpdateNeedsBiology src: '..tostring(src))
	-- print('UpdateNeedsBiology newHygiene: '..tostring(newHygiene))
	-- print('UpdateNeedsBiology newBioOne: '..tostring(newBioOne))
	-- print('UpdateNeedsBiology newBioTwo: '..tostring(newBioTwo))
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
	
	local hygiene = newHygiene
    local bioone = newBioOne
    local biotwo = newBioTwo
	
	if hygiene <= 0 then hygiene = 0 end
    if hygiene > 100 then hygiene = 100 end
	
	if bioone <= 0 then bioone = 0 end
    if bioone > 100 then bioone = 100 end
	
	if biotwo <= 0 then biotwo = 0 end
    if biotwo > 100 then biotwo = 100 end
	
    Player.Functions.SetMetaData('hygiene', hygiene)
    Player.Functions.SetMetaData('bioone', bioone)
    Player.Functions.SetMetaData('biotwo', biotwo)
    TriggerClientEvent('hud:client:UpdateNeedsBiology', src, hygiene, bioone, biotwo)
    -- TriggerClientEvent('QBCore:Notify', src, 'BioTwo Updated')
end)

QBCore.Functions.CreateCallback('hud:server:getMenu', function(_, cb)
    cb(Config.Menu)
end)
