-------------------- Strez Tsunami --------------------
local QBCore = exports['qb-core']:GetCoreObject()

-------------------- Gloabl Player Emails --------------------

QBCore.Functions.CreateCallback('tsunami:server:getValues', function(source, cb)

	
	local maxFloodHeight = math.random(150, 330) -- Change this value to set the maximum flood height
	-- local maxFloodHeight = 1 -- Change this value to set the maximum flood height
	
	local increaseRate = math.random(1.0,3.0) -- Change this value to increase/decrease the rate at which the water height changes
	-- local increaseRate = 1 -- Change this value to increase/decrease the rate at which the water height changes

	local threadWait = math.random(2000,10000) -- Change this value to increase/decrease the time it takes to reach maxFloodHeight.
	-- local threadWait = 1 -- Change this value to increase/decrease the time it takes to reach maxFloodHeight.

	
    cb(maxFloodHeight,increaseRate,threadWait)
end)
-- Emergency Email
QBCore.Commands.Add('emergencyemail', 'Send emergency email to everyone', {{name = 'Email', help = 'Text of Email'}}, true, function(source, args)
    local msg = table.concat(args, ' ')
    local len = tonumber(string.len(msg))
    if len <= 255 then
        TriggerClientEvent('strez:client:SendEmergencyEmail', -1, msg)
    else
        TriggerClientEvent('QBCore:Notify', source, 'Exceeds maximum characters!', 'error')
    end
end, 'god')

-- Announcement Email
QBCore.Commands.Add('announcementemail', 'Send announcement email to everyone', {{name = 'Email', help = 'Text of Email'}}, true, function(source, args)
    local msg = table.concat(args, ' ')
    local len = tonumber(string.len(msg))
    if len <= 255 then
        TriggerClientEvent('strez:client:SendAnnouncementEmail', -1, msg)
    else
        TriggerClientEvent('QBCore:Notify', source, 'Exceeds maximum characters!', 'error')
    end
end, 'god')

-------------------- Manual Tsunami Restart --------------------

-- Manual 15 Minute Tsunami Warning
QBCore.Commands.Add('tsunamimanual', '15 minute tsuanami warning', {}, true, function(source, args)
    TriggerClientEvent('strez:client:TsunamiManual', -1)
end, 'god')

-------------------- Tsunami Showcase --------------------

-- Tsunami Showcase
QBCore.Commands.Add('tsunamishowcase', 'Tsunami Showcase Command', {}, true, function(source, args)
    TriggerClientEvent('strez:client:TsunamiShowcase', -1)
end, 'god')

-------------------- TxAdmin Auto Restart Tsunami --------------------

-- 30 minutes Reminder
AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 1800 then
        TriggerClientEvent('strez:client:SendMailTsunamiAuto30', -1)
    end
end)

-- 15 Minutes Reminder
AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 900 then
        TriggerClientEvent('strez:client:SendMailTsunamiAuto15', -1)
    end
end)

-- 5 Minutes Reminder
AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 300 then
        TriggerClientEvent('strez:client:SendMailTsunamiAuto5', -1)
    end
end)

-- 1 Minutes Reminder
AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 60 then
        TriggerClientEvent('strez:client:SendMailTsunamiAuto1', -1)
    end
end)