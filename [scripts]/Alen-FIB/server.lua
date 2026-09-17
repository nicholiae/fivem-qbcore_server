local QBCore = exports['qb-core']:GetCoreObject()
local FIBActiveMission = 0
local trapSet = false
local copsCount = 0

discord = {
    ['webhook'] = 'https://discord.com/api/webhooks/1272349985974780007/zIO_6X8EZBBpUSU3PjUH2zNMJi7eUrWJ4MdA0YTRt021B6V2TMl0V4vP0k7RmRK6M358',
    ['name'] = 'FIB Heist Logs',
    ['image'] = 'https://cdn.discordapp.com/attachments/774536621802389544/899986988386623498/logo.png'
}


QBCore.Functions.CreateCallback('AlenFIB:MathCops', function(source, cb)
    local Players = QBCore.Functions.GetPlayers()
    local cops = 0
    for i = 1, #Players do
        local Player = QBCore.Functions.GetPlayer(Players[i])
        if Player.PlayerData.job.name == 'police' then
            cops = cops + 1
        end
    end
	copsCount = cops
    cb(cops)
end)

RegisterServerEvent('Fib_SV:PlayOnSourceTest')
AddEventHandler('Fib_SV:PlayOnSourceTest', function(soundFile, soundVolume)
    TriggerClientEvent('Fib_CL:PlayOnOneTest', source, soundFile, soundVolume)
end)

RegisterServerEvent('FIB:MakeAReportOfPoliceEnteance')
AddEventHandler('FIB:MakeAReportOfPoliceEnteance', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    sendtodiscordaslog(Player.PlayerData.name ..  ' - ' .. Player.PlayerData.license .. ' - ' .. Player.PlayerData.job.name, ' entering through police entrance, @Nicholiae')
end)
RegisterServerEvent('FIB:SendAReport')
AddEventHandler('FIB:SendAReport', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    sendtodiscordaslog(Player.PlayerData.name ..  ' - ' .. Player.PlayerData.license .. ' - ' .. Player.PlayerData.job.name, ' TRIED TO ACCESS FIB HEIST FROM THE CRIM SIDE, @Nicholiae')
end)

RegisterServerEvent('FIB:StartServerFire')
AddEventHandler('FIB:StartServerFire', function(coords, maxChildren, isGasFire)
    TriggerClientEvent('FIB:StartFire', -1, coords, maxChildren, isGasFire)

end)

RegisterNetEvent('FIB:StopFires', function()
    TriggerClientEvent('FIB:StopFires', -1)
end)

RegisterServerEvent('AlenFIB:Done')
AddEventHandler('AlenFIB:Done', function(cash)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    sendtodiscordaslog(Player.PlayerData.name ..  ' - ' .. Player.PlayerData.license .. ' - ' .. Player.PlayerData.job.name, ' Is doing the FIB Heist')
	cash = max(1, int(cash * min(copsCount / Config['RequiredCops'], 1.0)))
    Player.Functions.AddItem('printedcash', cash)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['printedcash'], 'add')
end)

RegisterServerEvent('AlenFIB:Reward')
AddEventHandler('AlenFIB:Reward', function(cash)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if not cash then cash = Config['Reward'] end
    if Player.Functions.GetItemByName('printedcash') ~= nil then
        Player.Functions.RemoveItem('printedcash',1)
		local chance = math.random(1,100)
		if chance > 91 then
			Player.Functions.AddItem('gatecrack',1)
		end
		-- if chance > 92 then
			-- Player.Functions.AddItem('trojan_usb',1)
		-- end
		if copsCount < Config['RequiredCops'] then
			-- total = math.ceil(total / 4)
			cash = max(1000, int(cash * min(copsCount / Config['RequiredCops'], 1.0)))
		end
        Player.Functions.AddMoney('cash',cash)
        TriggerClientEvent('QBCore:Notify', src, 'You have successfully completed the Mission and you have earned your reward you can now go back to Los Santos', 'success')
        sendtodiscordaslog(Player.PlayerData.name ..  ' - ' .. Player.PlayerData.license .. ' - ' .. Player.PlayerData.job.name, ' Claimed his/her reward for the FIB Heist Mission')
    end
end)


RegisterServerEvent('AlenFIB:PoliceCall')
AddEventHandler('AlenFIB:PoliceCall', function()
	CoolDownTimer()
    local Players = QBCore.Functions.GetPlayers()
    for i = 1, #Players do
        local Player = QBCore.Functions.GetPlayer(Players[i])
        if Player.PlayerData.job.name == 'police' then
            TriggerClientEvent('AlenFIB:Test', Players[i])
        end
    end
end)


QBCore.Functions.CreateCallback('AlenFIB:checkFirst', function(source, cb)
	if FIBActiveMission == 1 then
		cb(false)
	else
		cb(true)
	end
end)

QBCore.Functions.CreateCallback('AlenFIB:check', function(source, cb)
	cb(true)
end)

QBCore.Functions.CreateCallback('AlenFIB:JustLock', function(source, cb)
	cb(locked)
end)

QBCore.Functions.CreateCallback('AlenFIB:BoobyCheck', function(source, cb)
	cb(trapSet)
end)

RegisterServerEvent('AlenFIB:boobyTrap')
AddEventHandler('AlenFIB:boobyTrap', function(boobyStatus)
	local boobyStatus = boobyStatus
	trapSet = boobyStatus
end)

RegisterServerEvent('AlenFIB:RemoveThermite')
AddEventHandler('AlenFIB:RemoveThermite', function()
	local src = source
	exports['qb-inventory']:RemoveItem(src, 'thermite', 1, false, 'Trap Set FIB')
end)

RegisterServerEvent('AlenFIB:RemoveBreakThroughItems')
AddEventHandler('AlenFIB:RemoveThermite', function()
	local src = source
	exports['qb-inventory']:RemoveItem(src, 'gatecrack', 1, false, 'Bypass FIB Door')
	exports['qb-inventory']:RemoveItem(src, 'trojan_usb', 1, false, 'Bypass FIB Door')
	exports['qb-inventory']:RemoveItem(src, 'drill', 1, false, 'Bypass FIB Door')
end)


RegisterServerEvent('AlenFIB:FreezeIt')
AddEventHandler('AlenFIB:FreezeIt', function(status)
	xd = status
	TriggerClientEvent('AlenFIB:OnDoorUpdate', -1, xd)
end)

RegisterServerEvent('AlenFIB:OpenDoor')
AddEventHandler('AlenFIB:OpenDoor', function()
	locked = false
	TriggerClientEvent('AlenFIB:LockStatus', -1, locked)
end)

RegisterServerEvent('AlenFIB:PoliceLock')
AddEventHandler('AlenFIB:PoliceLock', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.job.name == 'police' then
		locked = true
		TriggerClientEvent('AlenFIB:LockStatus', -1, locked)
	end
end)

QBCore.Commands.Add("lockfib", "Lock The FIB Door", {}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then 
        if (Player.PlayerData.job.name == "police") then
  		locked = true
		TriggerClientEvent('AlenFIB:LockStatus', -1, locked)
        end
    end
end)

QBCore.Commands.Add("travelny", "Travel to North Yankton and get those criminals", {}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then 
        if (Player.PlayerData.job.name == "police") then
          TriggerClientEvent('flypolice', source)
          sendtodiscordaslog(Player.PlayerData.name ..  ' - ' .. Player.PlayerData.license .. ' - ' .. Player.PlayerData.job.name, ' Officer Reached North Yankton')
        end
    end
end)

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


function CoolDownTimer()
	Wait(60 * 1000) -- 60 seconds and it will trigger the cooldown blocker
	FIBActiveMission = 1
	Wait(Config.ResetTimer * 1000)
	FIBActiveMission = 0
end