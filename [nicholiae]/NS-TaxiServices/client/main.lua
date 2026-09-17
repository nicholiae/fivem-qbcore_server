local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local QBCore = exports['qb-core']:GetCoreObject()
local hash = Config.hash
local vehicleHash = Config.vehicleHash
local ped = nil
local taxiBlip = false
local globalTaxi = nil
local customer = nil
local onTour = false
local driveFinish = nil
local CarBlip = nil
local targetX, targetY, targetZ = nil, nil, nil
local parkingDone = false
local taxiArrived = false
local onWayBack = false
local cancelTaxi = false

-- Function to load model with timeout
function loadModelWithTimeout(modelHash, timeout)
    local counter = 0
    RequestModel(modelHash)
    
    while not HasModelLoaded(modelHash) do
        counter = counter + 1
        if counter >= (timeout / 50) then
            -- Timeout reached
            return false
        end
        Wait(50)
    end
    
    return true
end

-- Function to cleanup all taxi resources
function cleanupTaxi()
    -- Delete ped if it exists
    if ped and DoesEntityExist(ped) then
        DeletePed(ped)
    end
    
    -- Delete vehicle if it exists
    if globalTaxi and DoesEntityExist(globalTaxi) then
        QBCore.Functions.DeleteVehicle(globalTaxi)
    end
    
    -- Remove blip if it exists
    if CarBlip and DoesBlipExist(CarBlip) then
        RemoveBlip(CarBlip)
    end
    
    -- Reset all variables
    ped = nil
    globalTaxi = nil
    customer = nil
    targetX, targetY, targetZ = nil, nil, nil
    taxiBlip = false
    parkingDone = false
    taxiArrived = false
    onTour = false
    onWayBack = false
    cancelTaxi = false
    CarBlip = nil
    
    if Config.Debug then 
        print("^0[^5Debug^7][^3Information^0]: ^2Taxi service has been cleaned up")
    end
end

RegisterNetEvent('CxC:Taxi:killTaxiBlip')
AddEventHandler('CxC:Taxi:killTaxiBlip', function()
    if CarBlip and DoesBlipExist(CarBlip) then
        RemoveBlip(CarBlip)
        CarBlip = nil
    end
end)

RegisterNetEvent('CxC:Taxi:cancelTaxi')
AddEventHandler('CxC:Taxi:cancelTaxi', function(cancel)
    atTarget(cancel)
end)

RegisterNetEvent('CxC:Taxi:reset')
AddEventHandler('CxC:Taxi:reset', function()
    cleanupTaxi()
    QBCore.Functions.Notify('Taxi service has been reset!', 'success')
end)

RegisterNetEvent('CxC:NpcTaxi:call')
AddEventHandler('CxC:NpcTaxi:call', function(coords)
    if customer then
        QBCore.Functions.Notify('Taxi is already coming to you!', 'error')
        return
    end
    
    local playerCoords = GetEntityCoords(PlayerPedId())
    local found, spawnPos, spawnHeading = GetClosestVehicleNodeWithHeading(playerCoords.x + math.random(-Config.TaxiSpawnRadius, Config.TaxiSpawnRadius), playerCoords.y + math.random(-Config.TaxiSpawnRadius, Config.TaxiSpawnRadius), playerCoords.z, 0, 3, 0)
    
    if not found then
        QBCore.Functions.Notify('Could not find a suitable spawn location for the taxi!', 'error')
        return
    end
    
    local coordinates = {x=spawnPos.x, y=spawnPos.y, z=spawnPos.z, spawnHeading}
    local playerPed = GetPlayerPed(-1)
    customer = playerCoords
    local myCoords = playerCoords
    local realSpawnPoint = spawnPos
    local heading = spawnHeading
    
    -- Load ped model with timeout
    if not loadModelWithTimeout(hash, 5000) then
        QBCore.Functions.Notify('Failed to load taxi driver model!', 'error')
        if Config.Debug then 
            print("^0[^5Debug^7][^1Error^0]: ^1Failed to load ped model with hash: "..hash)
        end
        return
    end
    
    -- Load vehicle model with timeout
    if not loadModelWithTimeout(vehicleHash, 5000) then
        QBCore.Functions.Notify('Failed to load taxi vehicle model!', 'error')
        SetModelAsNoLongerNeeded(hash)
        if Config.Debug then 
            print("^0[^5Debug^7][^1Error^0]: ^1Failed to load vehicle model with hash: "..vehicleHash)
        end
        return
    end
    
    -- Create ped
    ped = CreatePed(4, hash, realSpawnPoint.x, realSpawnPoint.y, realSpawnPoint.z + 2, 0.0, true, true)
    
    -- Delete existing taxi if it exists
    if globalTaxi and DoesEntityExist(globalTaxi) then
        QBCore.Functions.DeleteVehicle(globalTaxi)
    end
    
    QBCore.Functions.Notify('When the taxi comes, press [E] to enter!', 'primary')
    
    -- Spawn vehicle
    QBCore.Functions.SpawnVehicle(vehicleHash, function(callback_vehicle)
        SetEntityHeading(callback_vehicle, heading)
        TaskWarpPedIntoVehicle(ped, callback_vehicle, -1)
        SetVehicleHasBeenOwnedByPlayer(callback_vehicle, true)
        
        -- Set fuel if fuel script is properly configured
        if Config.FuelScript and Config.FuelScript ~= "myFuel" then
            exports[Config.FuelScript]:SetFuel(callback_vehicle, 100.0)
        end
        
        taxiBlip = true
        globalTaxi = callback_vehicle
        SetEntityAsMissionEntity(globalTaxi, true, true)
        drive(customer.x, customer.y, customer.z, false, 'start')
    end, realSpawnPoint, true)
    
    SetModelAsNoLongerNeeded(hash)
    SetModelAsNoLongerNeeded(vehicleHash)
end)

RegisterNetEvent('CxC:setBlip')
AddEventHandler('CxC:setBlip', function(coords)
    if CarBlip and DoesBlipExist(CarBlip) then
        RemoveBlip(CarBlip)
        CarBlip = nil
    end
    
    if not onWayBack then
        CarBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(CarBlip, 56)
        SetBlipScale(CarBlip, 0.8)
        SetBlipColour(CarBlip, 5)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('TAXI')
        EndTextCommandSetBlipName(CarBlip)
    end
end)

-- Optimized main taxi control thread
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100) -- Increased from 0 to reduce performance impact
        
        if customer ~= nil then
            local playerPed = GetPlayerPed(-1)
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            
            if vehicle == globalTaxi then
                local waypoint = GetFirstBlipInfoId(8)
                
                if not DoesBlipExist(waypoint) and not onTour then
                    QBCore.Functions.Notify('Where do you want to go?', 'primary')
                    Citizen.Wait(2000)
                else
                    local tx, ty, tz = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09, waypoint, Citizen.ResultAsVector()))
                    
                    if not onTour then
                        if not targetX then
                            targetX = tx
                            targetY = ty
                            targetZ = tz
                        end
                        drive(tx, ty, tz, false, false)
                        onTour = true
                    end
                end
            end
        end
    end
end)

-- Optimized distance checking thread
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500) -- Increased from 0 to reduce performance impact
        
        if customer ~= nil and ped ~= nil then
            local playerPed = GetPlayerPed(-1)
            local myCoords = GetEntityCoords(playerPed)
            local taxiCoords = GetEntityCoords(ped)
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            
            if vehicle == globalTaxi then
                -- Check distance between player and the destination
                if targetX and targetY and targetZ and GetDistanceBetweenCoords(myCoords, targetX, targetY, targetZ) < 20 then
                    atTarget()
                end
            end
            
            -- Check distance between player and taxi
            local distanceMeTaxi = GetDistanceBetweenCoords(customer.x, customer.y, customer.z, taxiCoords.x, taxiCoords.y, taxiCoords.z, true)
            if distanceMeTaxi <= 40 then
                if not parkingDone then
                    parking(customer.x, customer.y, customer.z)
                    QBCore.Functions.Notify('Your Taxi is here!', 'success')
                end
                
                if distanceMeTaxi <= 3 then
                    taxiArrived = true
                end
            end
        end
    end
end)

-- Optimized taxi entry thread
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) -- Keep this at 0 as it needs to respond immediately to key presses
        
        if customer ~= nil then
            if taxiArrived and not inCar and not onWayBack then
                if IsControlJustReleased(0, Keys['E']) and GetLastInputMethod(2) then
                    local playerPed = GetPlayerPed(-1)
                    local vehicle = GetVehiclePedIsIn(playerPed, false)
                    
                    if vehicle ~= globalTaxi then
                        TaskEnterVehicle(playerPed, globalTaxi, 1000, math.random(0,2), 2.0, 1, 0)
                    end
                end
            end
        end
    end
end)

-- Optimized blip update thread
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) -- Increased from 450 to reduce performance impact
        
        if taxiBlip and ped ~= nil then
            local coords = GetEntityCoords(ped)
            TriggerEvent('CxC:setBlip', coords)
        end
    end
end)

-- Optimized marker drawing thread
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        if ped ~= nil and globalTaxi ~= nil and not onWayBack then
            local markerCoords = GetEntityCoords(globalTaxi)
            local playerPed = GetPlayerPed(-1)
            local myCoords = GetEntityCoords(playerPed)
            
            if GetDistanceBetweenCoords(markerCoords, myCoords) > 2 then
                DrawMarker(0, markerCoords.x, markerCoords.y, markerCoords.z+3, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.0, 3.0, 2.0, 244, 123, 23, 100, true, true, 2, true, false, false, false)
            end
        else
            Citizen.Wait(1000) -- If no taxi is active, wait longer to reduce performance impact
        end
    end
end)

function atTarget(cancel)
    cancelTaxi = false
    
    if cancel then
        local playerPed = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        
        if vehicle ~= globalTaxi then
            QBCore.Functions.Notify('Taxi was canceled!', 'success')
            cancelTaxi = true
        else
            QBCore.Functions.Notify('Taxi can no longer be canceled!', 'error')
            return
        end
    end
    
    if not cancelTaxi then
        QBCore.Functions.Notify('We have arrived at the destination!', 'success')
        
        if targetX and targetY and targetZ and customer then
            local route2 = CalculateTravelDistanceBetweenPoints(customer.x, customer.y, customer.z, targetX, targetY, targetZ)
            local price = (route2/1000) * Config.Price
            TriggerServerEvent('CxC:NPCTaxi:pay', price)
        end
        
        TaskLeaveVehicle(GetPlayerPed(-1), globalTaxi, 1)
        Citizen.Wait(5000)
    end
    
    onWayBack = true
    customer = nil
    targetX = nil
    taxiBlip = nil
    
    if CarBlip and DoesBlipExist(CarBlip) then
        RemoveBlip(CarBlip)
        CarBlip = nil
    end
    
    parkingDone = false
    taxiArrived = false
    onTour = false
    onWayBack = false
    
    -- Drive taxi to end location
    drive(Config.EndLocation.x, Config.EndLocation.y, Config.EndLocation.z, true, 'end')
    
    -- Cleanup will be done in the drive function when delete=true
end

function parking(x, y, z)
    if globalTaxi and ped then
        TaskVehiclePark(ped, globalTaxi, x, y, z, 0.0, 0, 30.0, false)
        parkingDone = true
    end
end

function drive(x, y, z, delete, status)
    if status == 'start' then
        Citizen.Wait(math.random(1000,3000))
        QBCore.Functions.Notify('A driver is on his way to you!', 'success')
    elseif status == 'end' then
        QBCore.Functions.Notify('Thank you for your trust!', 'success')
    end
    
    if globalTaxi and ped then
        TaskVehicleDriveToCoordLongrange(ped, globalTaxi, x, y, z, Config.Speed, Config.DriveMode, 20.0)
    end
    
    if delete then
        Citizen.Wait(15000)
        cleanupTaxi()
    end
end