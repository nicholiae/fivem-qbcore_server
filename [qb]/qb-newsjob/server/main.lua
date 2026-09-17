local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-newsjob:server:addVehicleItems', function(plate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player or Player.PlayerData.job.name ~= 'reporter' then return end
    if not exports['qb-vehiclekeys']:HasKeys(src, plate) then return end

    for slot, item in pairs(Config.VehicleItems) do
        exports['qb-inventory']:AddItem('trunk-'..tostring(plate), item.name, item.amount, slot, item.info, 'qb-newsjob:vehicleItems')
    end
end)

if Config.UseableItems then
    QBCore.Functions.CreateUseableItem('newscam', function(source)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player or Player.PlayerData.job.name ~= 'reporter' then return end
		-- local src = source
		-- local targetped = GetPlayerPed(player.id)
		-- local coords = GetEntityCoords(targetped)
		-- TriggerClientEvent('qb-admin:client:spectate', src, player.id, coords)  --- this is used to spectate other players by way of admin powers... maybe use it for players to "tune" in to a newsbroadcast
        TriggerClientEvent('Cam:ToggleCam', source)
    end)

    QBCore.Functions.CreateUseableItem('newsmic', function(source)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player or Player.PlayerData.job.name ~= 'reporter' then return end
            
        TriggerClientEvent('Mic:ToggleMic', source)
    end)

    QBCore.Functions.CreateUseableItem('newsbmic', function(source)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player or Player.PlayerData.job.name ~= 'reporter' then return end
            
        TriggerClientEvent('Mic:ToggleBMic', source)
    end)

else
    QBCore.Commands.Add('newscam', 'Grab a news camera', {}, false, function(source, _)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player or Player.PlayerData.job.name ~= 'reporter' then return end

        TriggerClientEvent('Cam:ToggleCam', source)
    end)

    QBCore.Commands.Add('newsmic', 'Grab a news microphone', {}, false, function(source, _)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player or Player.PlayerData.job.name ~= 'reporter' then return end
                
        TriggerClientEvent('Mic:ToggleMic', source)
    end)

    QBCore.Commands.Add('newsbmic', 'Grab a Boom microphone', {}, false, function(source, _)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player or Player.PlayerData.job.name ~= 'reporter' then return end
                
        TriggerClientEvent('Mic:ToggleBMic', source)
    end)
end
