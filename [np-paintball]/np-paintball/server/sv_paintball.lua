local QBCore = exports['qb-core']:GetCoreObject()

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent("np-paintball:getArenaType")
AddEventHandler("np-paintball:getArenaType", function()
    TriggerClientEvent("np-paintball:changeArenaType", source, "wasteland")
end)

QBCore.Functions.CreateCallback("np-paintball:setArenaType", function(source, cb)
    local pSource = source
    TriggerClientEvent("np-paintball:changeArenaType", pSource, "wasteland")
end)


RegisterServerEvent('np-paintball:clearinventory:client')
AddEventHandler('np-paintball:clearinventory:client', function()
	local src = source
    exports['qb-inventory']:RemoveItem(source, 'weapon_paintball', 1, false, 'leaving paintball')
    exports['qb-inventory']:RemoveItem(source, 'weapon_snspistol_mk2', 1, false, 'leaving paintball')
    exports['qb-inventory']:RemoveItem(source, 'paintball_ammo', 'all', false, 'leaving paintball')

end)