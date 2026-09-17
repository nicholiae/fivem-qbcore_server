QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('hhfw:docOnline', function(source, cb)
	local src = source
	local Ply = QBCore.Functions.GetPlayer(src)
	local xPlayers = QBCore.Functions.GetPlayers()
	local doctor = 0
	local canpay = false
	if Ply.PlayerData.money["cash"] >= Config.Price then
		canpay = true
	else
		if Ply.PlayerData.money["bank"] >= Config.Price then
			canpay = true
		end
	end

	for i=1, #xPlayers, 1 do
		local xPlayer = QBCore.Functions.GetPlayer(xPlayers[i])
		if xPlayer.PlayerData.job.name == 'ambulance' and xPlayer.PlayerData.job.onduty then
			doctor = doctor + 1
		end
	end

	cb(doctor, canpay)
end)



RegisterServerEvent('hhfw:charge')
AddEventHandler('hhfw:charge', function()
	local src = source
	local xPlayer = QBCore.Functions.GetPlayer(src)
	if xPlayer.PlayerData.money["cash"] >= Config.Price then
		xPlayer.Functions.RemoveMoney("cash", Config.Price, 'AIDoc')
		exports['qb-banking']:AddMoney('ambulance', Config.Price, 'AIDoc')
	else
		xPlayer.Functions.RemoveMoney("bank", Config.Price, 'AIDoc')
		exports['qb-banking']:AddMoney('ambulance', Config.Price, 'AIDoc')
	end
    TriggerEvent('qb-log:server:CreateLog', 'docAI', xPlayer.PlayerData.name..' used the doc', 'blue', 
		'👨🏻Player: '..tostring(xPlayer.PlayerData.name)..
		'\n🎫CivID: '..tostring(xPlayer.PlayerData.citizenid)..
		'\n🎫FirstName: '..tostring(xPlayer.PlayerData.charinfo.firstname)..
		'\n🎫LastName: '..tostring(xPlayer.PlayerData.charinfo.lastname)..
		'\n🎫BirthDate: '..tostring(xPlayer.PlayerData.charinfo.birthdate)..
		'\n🎫Gender: '..tostring(xPlayer.PlayerData.charinfo.gender)..
		'\n🎫Nationality: '..tostring(xPlayer.PlayerData.charinfo.nationality)..
		'\n🏘Current Job: '..tostring(xPlayer.PlayerData.job.name)
	)
	
	-- TriggerEvent("qb-bossmenu:server:addAccountMoney", 'ambulance', Config.Price)
end)
