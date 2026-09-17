-- Version information for NS-BusService Multi-Player
local version = '2.0.0'

RegisterServerEvent('NS-BusService:Server:GetVersion')
AddEventHandler('NS-BusService:Server:GetVersion', function()
    TriggerClientEvent('NS-BusService:Client:ReceiveVersion', source, version)
end)

if Config.Debug then 
    print('^0[^5Debug^7][^3Information^0]: ^2NS-BusService Multi-Player v' .. version .. ' loaded successfully')
end