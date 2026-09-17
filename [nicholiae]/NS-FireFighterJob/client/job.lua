local QBCore = exports['qb-core']:GetCoreObject()
local PlayerJob = {}
local onDuty = false
local currentGarage = 1

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
	-- print(PlayerJob.name)
    if PlayerJob.name == 'firefighter' then
        onDuty = PlayerJob.onduty
        if PlayerJob.onduty then
            TriggerServerEvent('firefighter:server:AddFireFighter', PlayerJob.name)
        else
            TriggerServerEvent('firefighter:server:RemoveFireFighter', PlayerJob.name)
        end
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    exports.spawnmanager:setAutoSpawn(false)
    local ped = PlayerPedId()
    local player = PlayerId()
    CreateThread(function()
        Wait(1000)
        QBCore.Functions.GetPlayerData(function(PlayerData)
            PlayerJob = PlayerData.job
            onDuty = PlayerData.job.onduty
            SetPedArmour(PlayerPedId(), PlayerData.metadata['armor'])
            if (not PlayerData.metadata['inlaststand'] and PlayerData.metadata['isdead']) then
                deathTime = Config.ReviveInterval
                OnDeath()
                DeathTimer()
            elseif (PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead']) then
                SetLaststand(true)
            else
                TriggerServerEvent('hospital:server:SetDeathStatus', false)
                TriggerServerEvent('hospital:server:SetLaststandStatus', false)
            end
            if PlayerJob.name == 'firefighter' and onDuty then
                TriggerServerEvent('firefighter:server:AddFireFighter', PlayerJob.name)
            end
        end)
    end)
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    exports.spawnmanager:setAutoSpawn(false)
    local ped = PlayerPedId()
    local player = PlayerId()
    CreateThread(function()
        Wait(1000)
        QBCore.Functions.GetPlayerData(function(PlayerData)
            PlayerJob = PlayerData.job
            onDuty = PlayerData.job.onduty
            SetPedArmour(PlayerPedId(), PlayerData.metadata['armor'])
            if (not PlayerData.metadata['inlaststand'] and PlayerData.metadata['isdead']) then
                deathTime = Config.ReviveInterval
                OnDeath()
                DeathTimer()
            elseif (PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead']) then
                SetLaststand(true)
            else
                TriggerServerEvent('hospital:server:SetDeathStatus', false)
                TriggerServerEvent('hospital:server:SetLaststandStatus', false)
            end
            if PlayerJob.name == 'firefighter' and onDuty then
                TriggerServerEvent('firefighter:server:AddFireFighter', PlayerJob.name)
            end
        end)
    end)
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    if PlayerJob.name == 'firefighter' and onDuty then
        TriggerServerEvent('firefighter:server:RemoveFireFighter', PlayerJob.name)
    end
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    if PlayerJob.name == 'firefighter' and duty ~= onDuty then
        if duty then
            TriggerServerEvent('firefighter:server:AddFireFighter', PlayerJob.name)
        else
            TriggerServerEvent('firefighter:server:RemoveFireFighter', PlayerJob.name)
        end
    end

    onDuty = duty
end)
-- Functions

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

local function GetClosestPlayer()
    local closestPlayers = QBCore.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(PlayerPedId())

    for i=1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = #(pos - coords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
	end
	return closestPlayer, closestDistance
end

local function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function TakeOutVehicle(vehicleInfo)
    local coords = Config.Locations["vehicle"][currentGarage]
    QBCore.Functions.SpawnVehicle(vehicleInfo, function(veh)
        SetVehicleNumberPlateText(veh, "FIRE"..tostring(math.random(1000, 9999)))
        SetEntityHeading(veh, coords.w)
        exports['myFuel']:SetFuel(veh, 100.0)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        if Config.VehicleSettings[vehicleInfo] ~= nil then
            QBCore.Shared.SetDefaultVehicleExtras(veh, Config.VehicleSettings[vehicleInfo].extras)
        end
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        SetVehicleEngineOn(veh, true, true)
    end, coords, true)
end

function MenuGarage()
    local vehicleMenu = {
        {
            header = "Fire Vehicles",
            isMenuHeader = true
        }
    }

    local authorizedVehicles = Config.AuthorizedVehicles[QBCore.Functions.GetPlayerData().job.grade.level]
    for veh, label in pairs(authorizedVehicles) do
        vehicleMenu[#vehicleMenu+1] = {
            header = label,
            txt = "",
            params = {
                event = "firefighter:client:TakeOutVehicle",
                args = {
                    vehicle = veh
                }
            }
        }
    end
    vehicleMenu[#vehicleMenu+1] = {
        header = "⬅ Close Menu",
        txt = "",
        params = {
            event = "qb-menu:client:closeMenu"
        }

    }
    exports['qb-menu']:openMenu(vehicleMenu)
end

-- Events

RegisterNetEvent('firefighter:Duty', function()
    onDuty = not onDuty
    TriggerServerEvent('QBCore:ToggleDuty')
    TriggerServerEvent('police:server:UpdateBlips')
end)

RegisterNetEvent('firefighter:client:TakeOutVehicle', function(data)
    local vehicle = data.vehicle
    TakeOutVehicle(vehicle)
end)

-- Threads

-- Personal Stash
CreateThread(function()
    Wait(1000)
    while true do
        local sleep = 2000
        if LocalPlayer.state.isLoggedIn and PlayerJob.name == "firefighter" then
            local pos = GetEntityCoords(PlayerPedId())
            for k, v in pairs(Config.Locations["stash"]) do
                if #(pos - v) < 4.5 then
                    if onDuty then
                        sleep = 5
                        if #(pos - v) < 1.5 then
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ - FireFighter stash")
                            if IsControlJustReleased(0, 38) then
								TriggerServerEvent('firefighter:server:stash')

                                -- TriggerServerEvent("inventory:server:OpenInventory", "stash", "firefighterstash_"..QBCore.Functions.GetPlayerData().citizenid)
                                -- TriggerEvent("inventory:client:SetCurrentStash", "firefighterstash_"..QBCore.Functions.GetPlayerData().citizenid)
                            end
                        elseif #(pos - v) < 2.5 then
                            DrawText3D(v.x, v.y, v.z, "FireFighter stash")
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    while true do
        sleep = 1000
        if LocalPlayer.state.isLoggedIn then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            if PlayerJob.name =="firefighter" then
                for k, v in pairs(Config.Locations["duty"]) do
                    local dist = #(pos - v)
                    if dist < 5 then
                        sleep = 0
                        if dist < 1.5 then
                            if onDuty then
                                DrawText3D(v.x, v.y, v.z, "~r~E~w~ - Go Off Duty")
                            else
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Go On Duty")
                            end
                            if IsControlJustReleased(0, 38) then
								TriggerEvent('firefighter:Duty')
                            end
                        elseif dist < 4.5 then
                            DrawText3D(v.x, v.y, v.z, "On/Off Duty")
                        end
                    end
                end

                for k, v in pairs(Config.Locations["armory"]) do
                    local dist = #(pos - v)
                    if dist < 4.5 then
                        if onDuty then
                            if dist < 1.5 then
                                sleep = 0
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Armory")
                                if IsControlJustReleased(0, 38) then
								
									local Player = QBCore.Functions.GetPlayerData()
									if not Player then return end
									local citizenId = Player.citizenid
									local shopName = 'firefighter'
									-- exports['qb-inventory']:OpenShop(src, shopName)
									TriggerServerEvent('qb-shops:server:openShop', { shop = shopName })
                                    -- TriggerServerEvent("inventory:server:OpenInventory", "shop", "hospital", Config.Items)
                                end
                            elseif dist < 2.5 then
                                DrawText3D(v.x, v.y, v.z, "Armory")
                            end
                        end
                    end
                end

                for k, v in pairs(Config.Locations["vehicle"]) do
                    local dist = #(pos - vector3(v.x, v.y, v.z))
                    if dist < 4.5 then
                        sleep = 0
                        DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                        if dist < 1.5 then
                            if IsPedInAnyVehicle(ped, false) then
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Store vehicle")
                            else
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Vehicles")
                            end
                            if IsControlJustReleased(0, 38) then
                                if IsPedInAnyVehicle(ped, false) then
                                    QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(ped))
                                else
                                    MenuGarage()
                                    currentGarage = k
                                end
                            end
                        end
                    end
                end

                for k, v in pairs(Config.Locations["helicopter"]) do
                    local dist = #(pos - vector3(v.x, v.y, v.z))
                    if dist < 7.5 then
                        if onDuty then
                            sleep = 5
                            DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                            if dist < 1.5 then
                                if IsPedInAnyVehicle(ped, false) then
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Store helicopter")
                                else
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Take a helicopter")
                                end
                                if IsControlJustReleased(0, 38) then
                                    if IsPedInAnyVehicle(ped, false) then
                                        QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(ped))
                                    else
                                        local coords = Config.Locations["helicopter"][k]
                                        QBCore.Functions.SpawnVehicle(Config.Helicopter, function(veh)
                                            SetVehicleNumberPlateText(veh, "LIFE"..tostring(math.random(1000, 9999)))
                                            SetEntityHeading(veh, coords.w)
                                            SetVehicleLivery(veh, 1) -- Firefighter Livery
                                            exports['myFuel']:SetFuel(veh, 100.0)
                                            TaskWarpPedIntoVehicle(ped, veh, -1)
                                            TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
                                            SetVehicleEngineOn(veh, true, true)
                                        end, coords, true)
                                    end
                                end
                            end
                        end
                    end
                end
                for k, v in pairs(Config.Locations["boat"]) do
                    local dist = #(pos - vector3(v.x, v.y, v.z))
                    if dist < 10.5 then
                        if onDuty then
                            sleep = 5
                            DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                            if dist < 5.5 then
                                if IsPedInAnyVehicle(ped, false) then
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Store boat")
                                else
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Take a boat")
                                end
                                if IsControlJustReleased(0, 38) then
                                    if IsPedInAnyVehicle(ped, false) then
                                        QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(ped))
                                    else
                                        local coords = Config.Locations["boat"][k]
                                        QBCore.Functions.SpawnVehicle(Config.Boat, function(veh)
                                            SetVehicleNumberPlateText(veh, "LIFE"..tostring(math.random(1000, 9999)))
                                            SetEntityHeading(veh, coords.w)
                                            SetVehicleLivery(veh, 1) -- Firefighter Livery
                                            exports['LegacyFuel']:SetFuel(veh, 100.0)
                                            TaskWarpPedIntoVehicle(ped, veh, -1)
                                            TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
                                            SetVehicleEngineOn(veh, true, true)
                                        end, coords, true)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)
