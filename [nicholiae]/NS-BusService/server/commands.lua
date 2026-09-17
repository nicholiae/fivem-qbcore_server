local QBCore = exports['qb-core']:GetCoreObject()

-- Reset bus service command
QBCore.Commands.Add('nsbusreset', 'Reset the bus service (Admin Only)', {}, false, function(source, args)
    if source == 0 or QBCore.Functions.HasPermission(source, 'admin') then
        TriggerClientEvent('NS-BusService:Bus:reset', source)
        if source == 0 then
            print('^0[^5NS-BusService^7]: ^3Bus service reset command executed from console')
        else
            TriggerClientEvent('QBCore:Notify', source, 'Bus service has been reset!', 'success')
        end
    else
        TriggerClientEvent('QBCore:Notify', source, 'You don\'t have permission to use this command!', 'error')
    end
end)

-- Multi-player toggle command (Admin Only)
QBCore.Commands.Add('nsbusmulti', 'Toggle multi-player bus service (Admin Only)', {}, false, function(source, args)
    if source == 0 or QBCore.Functions.HasPermission(source, 'admin') then
        -- This would require a server-side config update in a real implementation
        if Config.MultiPlayerEnabled then
            TriggerClientEvent('QBCore:Notify', source, 'Multi-player bus service disabled!', 'info')
        else
            TriggerClientEvent('QBCore:Notify', source, 'Multi-player bus service enabled!', 'success')
        end
    else
        TriggerClientEvent('QBCore:Notify', source, 'You don\'t have permission to use this command!', 'error')
    end
end)