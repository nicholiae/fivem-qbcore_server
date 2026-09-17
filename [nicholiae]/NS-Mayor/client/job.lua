local QBCore = exports['qb-core']:GetCoreObject()

-- Variables
local currentGarage = 0
local inStash = false
local inTrash = false
local inArmoury = false
local inHelicopter = false
local inHelicopterArmed = false
local inGarage = false
local PlayerJob = {}


AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    local player = QBCore.Functions.GetPlayerData()
    PlayerJob = player.job
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerJob = {}
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

-- Events

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        local player = QBCore.Functions.GetPlayerData()
        PlayerJob = player.job
    end
end)

local function loadAnimDict(dict) -- interactions, job,
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(10)
    end
end


local dutylisten = false
local function dutylistener()
    dutylisten = true
    CreateThread(function()
        while dutylisten do
            if PlayerJob.name == 'mayor' then
                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent('QBCore:ToggleDuty')
                    dutylisten = false
                    break
                end
            else
                break
            end
            Wait(0)
        end
    end)
end

local function SetCarItemsInfo()
    local items = {}
    for _, item in pairs(Config.CarItems) do
        local itemInfo = QBCore.Shared.Items[item.name:lower()]
        if itemInfo then
            items[#items + 1] = {
                name = itemInfo.name,
                amount = tonumber(item.amount),
                info = item.info or {},
                label = itemInfo.label,
                description = itemInfo.description or '',
                weight = itemInfo.weight,
                type = itemInfo.type,
                unique = itemInfo.unique,
                useable = itemInfo.useable,
                image = itemInfo.image,
                slot = #items + 1,
            }
        end
    end
    Config.CarItems = items
end

local function doCarDamage(currentVehicle, veh)
    local smash = false
    local damageOutside = false
    local damageOutside2 = false
    local engine = veh.engine + 0.0
    local body = veh.body + 0.0

    if engine < 200.0 then engine = 200.0 end
    if engine > 1000.0 then engine = 950.0 end
    if body < 150.0 then body = 150.0 end
    if body < 950.0 then smash = true end
    if body < 920.0 then damageOutside = true end
    if body < 920.0 then damageOutside2 = true end

    Wait(100)
    SetVehicleEngineHealth(currentVehicle, engine)

    if smash then
        SmashVehicleWindow(currentVehicle, 0)
        SmashVehicleWindow(currentVehicle, 1)
        SmashVehicleWindow(currentVehicle, 2)
        SmashVehicleWindow(currentVehicle, 3)
        SmashVehicleWindow(currentVehicle, 4)
    end

    if damageOutside then
        SetVehicleDoorBroken(currentVehicle, 1, true)
        SetVehicleDoorBroken(currentVehicle, 6, true)
        SetVehicleDoorBroken(currentVehicle, 4, true)
    end

    if damageOutside2 then
        SetVehicleTyreBurst(currentVehicle, 1, false, 990.0)
        SetVehicleTyreBurst(currentVehicle, 2, false, 990.0)
        SetVehicleTyreBurst(currentVehicle, 3, false, 990.0)
        SetVehicleTyreBurst(currentVehicle, 4, false, 990.0)
    end

    if body < 1000 then
        SetVehicleBodyHealth(currentVehicle, 985.1)
    end
end

function TakeOutVehicle(vehicleInfo)
    local coords = Config.Locations['vehicle'][currentGarage]
    if coords then
        QBCore.Functions.TriggerCallback('QBCore:Server:SpawnVehicle', function(netId)
            local veh = NetToVeh(netId)
            SetCarItemsInfo()
            SetVehicleNumberPlateText(veh, 'MAYR' .. tostring(math.random(1000, 9999)))
            SetEntityHeading(veh, coords.w)
            exports[Config.FuelResource]:SetFuel(veh, 100.0)
            closeMenuFull()
            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
            TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(veh))
			TriggerEvent('qb-vehiclekeys:client:AddKeys', PlayerPedId(), QBCore.Functions.GetPlate(veh))
            SetVehicleEngineOn(veh, true, true)
        end, vehicleInfo, coords, true)
    end
end

function MenuGarage(currentSelection)
    local vehicleMenu = {
        {
            header = 'Mayor Garage',
            isMenuHeader = true
        }
    }

    local playerGrade = QBCore.Functions.GetPlayerData().job.grade.level
    for grade = 0, playerGrade do
        local authorizedVehicles = Config.AuthorizedVehicles[grade]
        if authorizedVehicles then
            for veh, label in pairs(authorizedVehicles) do
                vehicleMenu[#vehicleMenu + 1] = {
                    header = label,
                    txt = '',
                    params = {
                        event = 'mayor:client:TakeOutVehicle',
                        args = {
                            vehicle = veh,
                            currentSelection = currentSelection
                        }
                    }
                }
            end
        end
    end

    vehicleMenu[#vehicleMenu + 1] = {
        header = 'Mayors Garage',
        txt = '',
        params = {
            event = 'qb-menu:client:closeMenu'
        }

    }
    exports['qb-menu']:openMenu(vehicleMenu)
end

function closeMenuFull()
    exports['qb-menu']:closeMenu()
end

RegisterNetEvent('mayor:client:VehicleMenuHeader', function(data)
    MenuGarage(data.currentSelection)
    currentGarage = data.currentSelection
end)


RegisterNetEvent('mayor:client:TakeOutVehicle', function(data)
    if inGarage then
        local vehicle = data.vehicle
        TakeOutVehicle(vehicle)
    end
end)

RegisterNetEvent('NS-mayorjob:ToggleDuty', function()
    TriggerServerEvent('QBCore:ToggleDuty')
end)

RegisterNetEvent('NS-mayor:client:spawnHelicopter', function(k)
    if IsPedInAnyVehicle(PlayerPedId(), false) then
        QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
    else
        local coords = Config.Locations['helicopter'][k]
        if not coords then coords = GetEntityCoords(PlayerPedId()) end
        QBCore.Functions.TriggerCallback('QBCore:Server:SpawnVehicle', function(netId)
            local veh = NetToVeh(netId)
            SetVehicleLivery(veh, 0)
            SetVehicleMod(veh, 0, 48)
            SetVehicleNumberPlateText(veh, 'MAYR' .. tostring(math.random(1000, 9999)))
            SetEntityHeading(veh, coords.w)
            exports[Config.FuelResource]:SetFuel(veh, 100.0)
            closeMenuFull()
            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
            TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(veh))
            SetVehicleEngineOn(veh, true, true)
        end, Config.MayorHelicopter, coords, true)
    end
end)

--##### Threads #####--


-- Personal Stash Thread
local function stash()
    CreateThread(function()
        while true do
            Wait(0)
            if inStash and PlayerJob.name == 'mayor' then
                if PlayerJob.onduty then sleep = 5 end
                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent('NS-mayorjob:server:stash')
                    break
                end
            else
                break
            end
        end
    end)
end

--  Trash Thread
local function trash()
    CreateThread(function()
        while true do
            Wait(0)
            if inTrash and PlayerJob.name == 'mayor' then
                if PlayerJob.onduty then sleep = 5 end
                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent('NS-mayorjob:server:trash')
                    break
                end
            else
                break
            end
        end
    end)
end

-- Helicopter Thread
local function heli()
    CreateThread(function()
        while true do
            Wait(0)
            if inHelicopter and PlayerJob.name == 'mayor' then
                if PlayerJob.onduty then sleep = 5 end
                if IsControlJustReleased(0, 38) then
                    TriggerEvent('NS-mayor:client:spawnHelicopter')
                    break
                end
            else
                break
            end
        end
    end)
end



-- Police Garage Thread
local function garage()
    CreateThread(function()
        while true do
            Wait(0)
            if inGarage and PlayerJob.name == 'mayor' then
                if IsPedInAnyVehicle(PlayerPedId(), false) then
					if PlayerJob.onduty then sleep = 5 end
                    if IsControlJustReleased(0, 38) then
                        QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                        break
                    end
                end
            else
                break
            end
        end
    end)
end

if Config.UseTarget then
    CreateThread(function()
        -- Toggle Duty
        for i = 1, #Config.Locations['duty'] do
            local v = Config.Locations['duty'][i]
            exports['NS-target']:AddCircleZone('MayorDuty_' .. i, vector3(v.x, v.y, v.z), 0.5, {
                name = 'MayorDuty_' .. i,
                useZ = true,
                debugPoly = false,
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'NS-mayorjob:ToggleDuty',
                        icon = 'fas fa-sign-in-alt',
                        label = 'Clock In',
                        jobType = 'leo',
                    },
                },
                distance = 1.5
            })
        end

        -- Personal Stash
        for i = 1, #Config.Locations['stash'] do
            local v = Config.Locations['stash'][i]
            exports['NS-target']:AddCircleZone('MayorStash_' .. i, vector3(v.x, v.y, v.z), 1.0, {
                name = 'MayorStash_' .. i,
                useZ = true,
                debugPoly = false,
            }, {
                options = {
                    {
                        type = 'server',
                        event = 'NS-mayorjob:server:stash',
                        icon = 'fas fa-dungeon',
                        label = 'Open Stash',
                        jobType = 'leo',
                    },
                },
                distance = 1.5
            })
        end

        -- Mayor Trash
        for i = 1, #Config.Locations['trash'] do
            local v = Config.Locations['trash'][i]
            exports['NS-target']:AddCircleZone('MayorTrash_' .. i, vector3(v.x, v.y, v.z), 0.5, {
                name = 'MayorTrash_' .. i,
                useZ = true,
                debugPoly = false,
            }, {
                options = {
                    {
                        type = 'server',
                        event = 'NS-mayorjob:server:trash',
                        icon = 'fas fa-trash',
                        label = 'Open Trash',
                        jobType = 'leo',
                    },
                },
                distance = 1.5
            })
        end

    end)
else
    -- Toggle Duty
    local dutyZones = {}
    for i = 1, #Config.Locations['duty'] do
        local v = Config.Locations['duty'][i]
        dutyZones[#dutyZones + 1] = BoxZone:Create(
            vector3(v.x, v.y, v.z), 1.75, 1, {
                name = 'box_zone',
                debugPoly = false,
                minZ = v.z - 1,
                maxZ = v.z + 1,
            })
    end

    local dutyCombo = ComboZone:Create(dutyZones, { name = 'dutyCombo', debugPoly = false })
    dutyCombo:onPlayerInOut(function(isPointInside)
        if isPointInside then
            dutylisten = true
            if not PlayerJob.onduty then
                exports['qb-core']:DrawText('On Duty', 'left')
                dutylistener()
            else
                exports['qb-core']:DrawText('Off Duty', 'left')
                dutylistener()
            end
        else
            dutylisten = false
            exports['qb-core']:HideText()
        end
    end)

    -- Personal Stash
    local stashZones = {}
    for i = 1, #Config.Locations['stash'] do
        local v = Config.Locations['stash'][i]
        stashZones[#stashZones + 1] = BoxZone:Create(
            vector3(v.x, v.y, v.z), 1.5, 1.5, {
                name = 'box_zone',
                debugPoly = false,
                minZ = v.z - 1,
                maxZ = v.z + 1,
            })
    end

    local stashCombo = ComboZone:Create(stashZones, { name = 'stashCombo', debugPoly = false })
    stashCombo:onPlayerInOut(function(isPointInside, _, _)
        if isPointInside then
            inStash = true
            if PlayerJob.name == 'mayor' and PlayerJob.onduty then
                exports['qb-core']:DrawText('Enter Stash', 'left')
                stash()
            end
        else
            inStash = false
            exports['qb-core']:HideText()
        end
    end)

    --  Trash
    local trashZones = {}
    for i = 1, #Config.Locations['trash'] do
        local v = Config.Locations['trash'][i]
        trashZones[#trashZones + 1] = BoxZone:Create(
            vector3(v.x, v.y, v.z), 1, 1.75, {
                name = 'box_zone',
                debugPoly = false,
                minZ = v.z - 1,
                maxZ = v.z + 1,
            })
    end

    local trashCombo = ComboZone:Create(trashZones, { name = 'trashCombo', debugPoly = false })
    trashCombo:onPlayerInOut(function(isPointInside)
        if isPointInside then
            inTrash = true
            if PlayerJob.name == 'mayor' and PlayerJob.onduty then
                exports['qb-core']:DrawText('Enter Trash', 'left')
                trash()
            end
        else
            inTrash = false
            exports['qb-core']:HideText()
        end
    end)
end

CreateThread(function()
    -- Helicopter
    local helicopterZones = {}
    for i = 1, #Config.Locations['helicopter'] do
        local v = Config.Locations['helicopter'][i]
        helicopterZones[#helicopterZones + 1] = BoxZone:Create(
            vector3(v.x, v.y, v.z), 5, 5, {
                name = 'box_zone',
                debugPoly = false,
                minZ = v.z - 1,
                maxZ = v.z + 1,
            })
    end
	

    local helicopterCombo = ComboZone:Create(helicopterZones, { name = 'helicopterCombo', debugPoly = false })
    helicopterCombo:onPlayerInOut(function(isPointInside)
        if isPointInside then
            inHelicopter = true
            if PlayerJob.name == 'mayor' and PlayerJob.onduty then
                if IsPedInAnyVehicle(PlayerPedId(), false) then
                    exports['qb-core']:HideText()
                    exports['qb-core']:DrawText('Store Heli', 'left')
                    heli()
                else
                    exports['qb-core']:DrawText('Take Heli', 'left')
                    heli()
                end
            end
        else
            inHelicopter = false
            exports['qb-core']:HideText()
        end
    end)

	

    -- Police Garage
    local garageZones = {}
    for i = 1, #Config.Locations['vehicle'] do
        local v = Config.Locations['vehicle'][i]
        garageZones[#garageZones + 1] = BoxZone:Create(
            vector3(v.x, v.y, v.z), 3, 3, {
                name = 'box_zone',
                debugPoly = false,
                minZ = v.z - 1,
                maxZ = v.z + 1,
            })
    end

    local garageCombo = ComboZone:Create(garageZones, { name = 'garageCombo', debugPoly = false })
    garageCombo:onPlayerInOut(function(isPointInside, point)
        if isPointInside then
            inGarage = true
            if PlayerJob.name == 'mayor' and PlayerJob.onduty then
                if IsPedInAnyVehicle(PlayerPedId(), false) then
                    exports['qb-core']:DrawText('Store Veh', 'left')
                    garage()
                else
                    local currentSelection = 0

                    for i = 1, #Config.Locations['vehicle'] do
                        local v = Config.Locations['vehicle'][i]
                        if #(point - vector3(v.x, v.y, v.z)) < 4 then
                            currentSelection = i
                        end
                    end
                    exports['qb-menu']:showHeader({
                        {
                            header = 'Garage',
                            params = {
                                event = 'mayor:client:VehicleMenuHeader',
                                args = {
                                    currentSelection = currentSelection,
                                }
                            }
                        }
                    })
                end
            end
        else
            inGarage = false
            exports['qb-menu']:closeMenu()
            exports['qb-core']:HideText()
        end
    end)
end)
