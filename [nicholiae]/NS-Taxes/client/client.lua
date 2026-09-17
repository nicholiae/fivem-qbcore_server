local QBCore = exports['qb-core']:GetCoreObject()


AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	local PlayerData =  QBCore.Functions.GetPlayerData()
    local src = PlayerData.source
	
	TriggerServerEvent('NS-Taxes:server:tellThem', src)
end)
