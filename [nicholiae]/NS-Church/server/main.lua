local QBCore = exports['qb-core']:GetCoreObject()
local ActiveMission = 0
local counter = 0
local priest

-- Server Seat Locales
local GetPlayerSeated = 1
local Seat1Taken = false
local Seat2Taken = false
local Seat3Taken = false
local Seat4Taken = false
local Seat5Taken = false
local Seat6Taken = false
local Seat7Taken = false

function resetTimerOver() -- redo timing logic to by sychronized with players
	if Config.Debug == true then
		print("Reset Timer Over Entered")
	end
	counter = 0
	ActiveMission = 0
	TriggerClientEvent('NS-Church:client:CleanUp', -1)
end


function resetTimer(_source) -- redo timing logic to by sychronized with players
	if Seat7Taken then
		ActiveMission = 1
	end
	if counter < 0 then
		counter = 0
	end
	while counter ~= 0 do
		if Config.Debug == true then
			print("Reset Counter: "..tostring(counter))
		end
		TriggerClientEvent('QBCore:Notify', _source, 'Church will be Over in: '..tostring(counter)..' minute(s)')
		Wait(60000)
		counter = counter - 1 
		if counter < 0 then
			counter = 0
		end
	end
	ActiveMission = 0
	TriggerClientEvent('NS-Church:client:CleanUp', -1)
end

AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
		return
	end
		priest = CreatePed(26, "cs_priest", Config.PriestSpawn.x, Config.PriestSpawn.y, Config.PriestSpawn.z, Config.PriestSpawn.w, true, true)
		FreezeEntityPosition(priest)
end)

RegisterServerEvent('NS-Church:server:dancePriest', function(source, priestlib, pranim)

	local _source = source
	if not DoesEntityExist(priest) then
		priest = CreatePed(26, "cs_priest", Config.PriestSpawn.x, Config.PriestSpawn.y, Config.PriestSpawn.z, Config.PriestSpawn.w, true, true)
	end
	ClearPedTasks(priest)
	TaskPlayAnim(priest, priestlib, pranim, 3.0, 3.0, 3000, 1, 0.15, 0, 0, 0)
	FreezeEntityPosition(priest)
	
end)

RegisterServerEvent('NS-Church:server:resetWanted', function(source, level)
	local _source = source
	local level = level
	SetPlayerWantedLevel(_source,level)
	TriggerClientEvent('QBCore:Notify', _source, 'Your new wantedlevel is: '..tostring(level))
	
end)

RegisterServerEvent('NS-Church:server:accept', function()
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	if ActiveMission == 0 then
	
		TriggerClientEvent('NS-Church:client:started', _source)
		counter = GetPlayerWantedLevel(_source)*Config.ResetTime
	
		if Config.Debug == true then
			print("Calculated Counter: "..tostring(counter))
			print("Wantedlevel: "..tostring(GetPlayerWantedLevel(_source)))
		end
		if counter == 0 then
			counter = Config.MinutesToRunMass
		end
		resetTimer(_source)
	else
		TriggerClientEvent('QBCore:Notify', _source, 'It seems the Church is occupied at the moment.')
	end
end)

RegisterServerEvent('NS-Church:server:donation', function(donation)
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local cashMoney = xPlayer.PlayerData.money['cash']
	local donation = donation
	if cashMoney < donation then
		TriggerClientEvent('QBCore:Notify', _source, 'You need ' .. Config.Currency .. '' .. donation .. ' in cash to leave early')
	else
		TriggerClientEvent('NS-Church:client:Paid', _source)
		xPlayer.Functions.RemoveMoney('cash', donation, 'Church')
		exports['qb-banking']:AddMoney('police', donation, 'Church')
		resetTimerOver()
	end
end)

RegisterServerEvent('NS-Church:GetPlayerSeated')
AddEventHandler('NS-Church:GetPlayerSeated', function()
    local src = source

    if Seat1Taken then
        GetPlayerSeated = GetPlayerSeated + 1
    end
    if Seat2Taken then
        GetPlayerSeated = GetPlayerSeated + 1
    end
    if Seat3Taken then
        GetPlayerSeated = GetPlayerSeated + 1
    end
    if Seat4Taken then
        GetPlayerSeated = GetPlayerSeated + 1
    end
    if Seat5Taken then
        GetPlayerSeated = GetPlayerSeated + 1
    end
    if Seat6Taken then
        GetPlayerSeated = GetPlayerSeated + 1
    end
    if Seat7Taken then
        GetPlayerSeated = GetPlayerSeated + 1
    end
    if not Seat1Taken and not Seat2Taken and not Seat3Taken and not Seat4Taken and not Seat5Taken and not Seat6Taken and not Seat7Taken then
        GetPlayerSeated = 1
    end

    if Config.Debug then
        print("Server: ", "Seat1: ", Seat1Taken, "Seat2: ", Seat2Taken, "Seat3: ", Seat3Taken, "Seat4: ", Seat4Taken, "Seat5: ", Seat5Taken, "Seat6: ", Seat6Taken, "Seat7: ", Seat7Taken, " ", GetPlayerSeated)
    end
    TriggerClientEvent("NS-Church:SetPlayerSeated", src, GetPlayerSeated, Seat1Taken,  Seat2Taken, Seat3Taken, Seat4Taken, Seat5Taken, Seat6Taken, Seat7Taken)
    GetPlayerSeated = 1

end)



RegisterServerEvent('NS-Church:Seat1')
AddEventHandler('NS-Church:Seat1', function(seat)
    Seat1Taken = true
end)

RegisterServerEvent('NS-Church:Seat2')
AddEventHandler('NS-Church:Seat2', function(seat)
    Seat2Taken = true
end)

RegisterServerEvent('NS-Church:Seat3')
AddEventHandler('NS-Church:Seat3', function(seat)
    Seat3Taken = true
end)

RegisterServerEvent('NS-Church:Seat4')
AddEventHandler('NS-Church:Seat4', function(seat)
    Seat4Taken = true
end)

RegisterServerEvent('NS-Church:Seat5')
AddEventHandler('NS-Church:Seat5', function(seat)
    Seat5Taken = true
end)

RegisterServerEvent('NS-Church:Seat6')
AddEventHandler('NS-Church:Seat6', function(seat)
    Seat6Taken = true
end)

RegisterServerEvent('NS-Church:Seat7')
AddEventHandler('NS-Church:Seat7', function(seat)
    Seat7Taken = true
end)

RegisterServerEvent('NS-Church:RemoveSeat1')
AddEventHandler('NS-Church:RemoveSeat1', function(seat)
    Seat1Taken = false
end)

RegisterServerEvent('NS-Church:RemoveSeat2')
AddEventHandler('NS-Church:RemoveSeat2', function(seat)
    Seat2Taken = false
end)

RegisterServerEvent('NS-Church:RemoveSeat3')
AddEventHandler('NS-Church:RemoveSeat3', function(seat)
    Seat3Taken = false
end)

RegisterServerEvent('NS-Church:RemoveSeat4')
AddEventHandler('NS-Church:RemoveSeat4', function(seat)
    Seat4Taken = false
end)

RegisterServerEvent('NS-Church:RemoveSeat5')
AddEventHandler('NS-Church:RemoveSeat5', function(seat)
    Seat5Taken = false
end)

RegisterServerEvent('NS-Church:RemoveSeat6')
AddEventHandler('NS-Church:RemoveSeat6', function(seat)
    Seat6Taken = false
end)

RegisterServerEvent('NS-Church:RemoveSeat7')
AddEventHandler('NS-Church:RemoveSeat7', function(seat)
    Seat7Taken = false
end)
