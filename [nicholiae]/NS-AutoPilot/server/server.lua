QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add('toggleautopilot', 'Toggle AutoPilot for your Vehicle', {}, false, function(source)
	TriggerClientEvent('AutoPilot:client:toggleAutoPilot', source)
end)

-- Phone App Events
RegisterNetEvent('NS-AutoPilot:server:SpeedUp', function()
    TriggerClientEvent('NS-AutoPilot:client:SpeedUp', source)
end)

RegisterNetEvent('NS-AutoPilot:server:SpeedDown', function()
    TriggerClientEvent('NS-AutoPilot:client:SpeedDown', source)
end)

RegisterNetEvent('NS-AutoPilot:server:SetGPSMode', function()
    TriggerClientEvent('NS-AutoPilot:client:SetGPSMode', source)
end)

RegisterNetEvent('NS-AutoPilot:server:SetWanderMode', function()
    TriggerClientEvent('NS-AutoPilot:client:SetWanderMode', source)
end)

RegisterNetEvent('NS-AutoPilot:server:SetGPSDestination', function()
    TriggerClientEvent('NS-AutoPilot:client:SetGPSDestination', source)
end)

RegisterNetEvent('NS-AutoPilot:server:StopAutoPilot', function()
    TriggerClientEvent('NS-AutoPilot:client:StopAutoPilot', source)
end)

RegisterNetEvent('NS-AutoPilot:server:ToggleErrr44', function()
    TriggerClientEvent('NS-AutoPilot:client:ToggleErrr44', source)
end)