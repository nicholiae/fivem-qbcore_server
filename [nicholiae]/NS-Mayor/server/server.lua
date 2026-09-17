
local QBCore = exports['qb-core']:GetCoreObject()

-- Events

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        CreateThread(function()
            MySQL.query("DELETE FROM inventories WHERE identifier = 'mayortrash'")
        end)
    end
end)

RegisterNetEvent('NS-mayorjob:server:stash', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if Player.PlayerData.job.name ~= 'mayor' then return end
    local citizenId = Player.PlayerData.citizenid
    local stashName = 'mayorstash_' .. citizenId
    exports['qb-inventory']:OpenInventory(src, stashName)
end)

RegisterNetEvent('NS-mayorjob:server:trash', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if Player.PlayerData.job.name ~= 'mayor' then return end
    exports['qb-inventory']:OpenInventory(src, 'mayortrash', {
        maxweight = 4000000,
        slots = 300,
    })
end)
