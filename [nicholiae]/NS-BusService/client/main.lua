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
local vehicleHash = Config.vehicleHash
local ped = nil
local BusBlip = false
local globalBus = nil
local customer = nil
local onTour = false
local driveFinish = nil
local CarBlip = nil
local targetX, targetY, targetZ = nil, nil, nil
local parkingDone = false
local BusArrived = false
local onWayBack = false
local cancelBus = false
local currentLocation = nil
local currentDestination = nil
local isInBus = false
local waitingForPlayer = false

-- Multi-player variables
local isTripHost = false
local currentTripId = nil
local isWaitingForInvitation = false

-- Function to get nearby players
function GetNearbyPlayers(radius)
    if not Config.MultiPlayerEnabled then return {} end
    
    local playerCoords = GetEntityCoords(PlayerPedId())
    local nearbyPlayers = {}
    
    for _, player in ipairs(GetActivePlayers()) do
        local targetPed = GetPlayerPed(player)
        if targetPed ~= PlayerPedId() then
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(playerCoords - targetCoords)
            
            if distance <= radius then
                table.insert(nearbyPlayers, {
                    id = GetPlayerServerId(player),
                    ped = targetPed,
                    coords = targetCoords,
                    distance = distance
                })
            end
        end
    end
    
    return nearbyPlayers
end

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

-- Function to cleanup all Bus resources
function cleanupBus()
    -- Delete ped if it exists
    if ped and DoesEntityExist(ped) then
        DeletePed(ped)
    end
    
    -- Delete vehicle if it exists (only if host)
    if globalBus and DoesEntityExist(globalBus) and isTripHost then
        QBCore.Functions.DeleteVehicle(globalBus)
    end
    
    -- Remove blip if it exists
    if CarBlip and DoesBlipExist(CarBlip) then
        RemoveBlip(CarBlip)
    end
    
    -- Reset all variables
    ped = nil
    globalBus = nil
    customer = nil
    targetX, targetY, targetZ = nil, nil, nil
    BusBlip = false
    parkingDone = false
    BusArrived = false
    onTour = false
    onWayBack = false
    cancelBus = false
    CarBlip = nil
    currentLocation = nil
    currentDestination = nil
    isInBus = false
    waitingForPlayer = false
    isTripHost = false
    currentTripId = nil
    isWaitingForInvitation = false
    
    if Config.Debug then 
        print("^0[^5Debug^7][^3Information^0]: ^2Bus service has been cleaned up")
    end
end

-- Function to detect if player is at a bus stop
function isAtBusStop()
    local playerCoords = GetEntityCoords(PlayerPedId())
    
    for locationName, locationData in pairs(Config.Locations) do
        local distance = #(playerCoords - vector3(locationData.callSpot.x, locationData.callSpot.y, locationData.callSpot.z))
        if distance < 3.0 then -- 3 meters radius
            return locationName
        end
    end
    
    return false
end

-- Function to create destination menu
function createDestinationMenu(currentLocation)
    local menu = {
        {
            header = "Select Destination",
            isMenuHeader = true,
        }
    }
    
    -- Add all locations except current one
    for locationName, locationData in pairs(Config.Locations) do
        if locationName ~= currentLocation then
            table.insert(menu, {
                header = locationName,
                params = {
                    event = "NS-BusService:Bus:SelectDestination",
                    args = {
                        location = currentLocation,
                        destination = locationName
                    }
                }
            })
        end
    end
    
    -- Add cancel option
    table.insert(menu, {
        header = "Cancel",
        params = {
            event = "NS-BusService:Bus:CancelMenu"
        }
    })
    
    exports['qb-menu']:openMenu(menu)
end

-- Shared boarding prompt for all passengers
function createBoardingPrompt()
    Citizen.CreateThread(function()
        while onTour and not isInBus do
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            
            if globalBus and DoesEntityExist(globalBus) then
                local busCoords = GetEntityCoords(globalBus)
                local distance = #(playerCoords - busCoords)
                
                if distance < 10.0 then
                    DrawText3D(busCoords.x, busCoords.y, busCoords.z + 1.5, "~g~[E]~w~ Board Bus")
                    
                    if IsControlJustPressed(0, 38) then -- E key
                        if not IsPedInVehicle(playerPed, globalBus, false) then
                            -- Find available seat
                            local seatIndex = 1
                            for i = 1, GetVehicleModelNumberOfSeats(GetEntityModel(globalBus)) - 1 do
                                if IsVehicleSeatFree(globalBus, i) then
                                    seatIndex = i
                                    break
                                end
                            end
                            
                            SetPedIntoVehicle(playerPed, globalBus, seatIndex)
                            isInBus = true
                            
                            -- Notify server that player boarded
                            TriggerServerEvent('NS-BusService:Server:PlayerEnteredBus', currentTripId)
                            
                            QBCore.Functions.Notify('Welcome aboard!', 'success')
                        end
                    end
                end
            end
            
            Citizen.Wait(0)
        end
    end)
end

-- Function to wait for player to enter bus
function waitForPlayerToEnter()
    waitingForPlayer = true
    
    Citizen.CreateThread(function()
        while waitingForPlayer and onTour do
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local busCoords = GetEntityCoords(globalBus)
            local distance = #(playerCoords - busCoords)
            if Config.Debug then
				print("waitForPlayerToEnter")
				print(distance)
				print("waitForPlayerToEnter")
			end
            -- Check if player is close enough to bus and presses E
            if distance < 10.0 then
                DrawText3D(playerCoords.x, playerCoords.y, playerCoords.z + 1.0, "~g~[E]~w~ Enter Bus")
                
                if IsControlJustPressed(0, 38) then -- E key
                    -- Check if player is already in the bus
                    if IsPedInVehicle(playerPed, globalBus, false) then
                        waitingForPlayer = false
                        isInBus = true
                        QBCore.Functions.Notify('Welcome aboard! Driving to your destination...', 'success')
                        
                        -- Start driving to destination
                        TriggerEvent('NS-BusService:Bus:DriveToDestination')
                    else
                        -- Warp player into bus
                        local seatIndex = 1 -- First passenger seat
                        for i = 1, GetVehicleModelNumberOfSeats(GetEntityModel(globalBus)) - 1 do
                            if IsVehicleSeatFree(globalBus, i) then
                                seatIndex = i
                                break
                            end
                        end
                        
                        SetPedIntoVehicle(playerPed, globalBus, seatIndex)
                        waitingForPlayer = false
                        isInBus = true
                        QBCore.Functions.Notify('Welcome aboard! Driving to your destination...', 'success')
                        
                        -- Start driving to destination
                        TriggerEvent('NS-BusService:Bus:DriveToDestination')
                    end
                end
            end
            
            Citizen.Wait(0)
        end
    end)
end

-- Function to drive bus to destination
function driveToDestination()
    if not currentDestination or not globalBus or not ped then return end
    
    local destinationCoords = Config.Locations[currentDestination].parkSpot
    
    -- Remove pickup blip and add destination blip
    if CarBlip and DoesBlipExist(CarBlip) then
        RemoveBlip(CarBlip)
        CarBlip = nil
    end
    TriggerEvent('NS-BusService:setBlip', destinationCoords)
    
    -- Drive to destination
    drive(destinationCoords.x, destinationCoords.y, destinationCoords.z, false, 'destination')
    
    -- Wait for arrival
    Citizen.CreateThread(function()
        local arrived = false
        local attempts = 0
        local maxAttempts = 6000 -- 600 = 1 minute :: default 10 minutes
        
        while not arrived and attempts < maxAttempts and onTour do
            local busPos = GetEntityCoords(globalBus)
            local distance = #(busPos - vector3(destinationCoords.x, destinationCoords.y, destinationCoords.z))
            
            if distance < 20.0 then
                arrived = true
                parking(destinationCoords) -- Park at destination
                QBCore.Functions.Notify('We have arrived at ' .. currentDestination .. '! Please exit the bus.', 'info')
                
                -- Start waiting for player to exit
                Citizen.Wait(2000)
                TriggerEvent('NS-BusService:Bus:WaitForPlayerToExit')
            end
            
            attempts = attempts + 1
            Citizen.Wait(100)
        end
        
        if not arrived and onTour then
            QBCore.Functions.Notify('Bus failed to arrive at destination. Please try again.', 'error')
            cleanupBus()
        end
    end)
end

-- Function to wait for player to exit bus
function waitForPlayerToExit()
    Citizen.CreateThread(function()
        local playerExited = false
        local attempts = 0
        local maxAttempts = 600 -- 60 seconds timeout
        
        while not playerExited and attempts < maxAttempts and onTour do
            local playerPed = PlayerPedId()
            
            if not IsPedInVehicle(playerPed, globalBus, false) then
                playerExited = true
                QBCore.Functions.Notify('Thank you for riding with us!', 'success')
                
                -- Calculate payment and process
                local distance = 15.0 -- Default distance for payment
                local price = distance * Config.Price
                
                if price > 0 then
                    TriggerServerEvent('NS-BusService:NPCBus:pay', price)
                end
                
                -- Notify server that player exited
                TriggerServerEvent('NS-BusService:Server:PlayerExitedBus', currentTripId)
                
                -- If host, end the trip after delay
                if isTripHost then
                    Citizen.Wait(3000)
                    TriggerServerEvent('NS-BusService:Server:EndTrip', currentTripId)
					cleanupBus()
                else
                    -- If passenger, just cleanup locally
                    Citizen.Wait(3000)
                    cleanupBus()
                end
            else
                DrawText3D(GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z + 1.0, "~r~Exit the bus to complete your journey")
            end
            
            attempts = attempts + 1
            Citizen.Wait(1000)
        end
        
        if not playerExited and onTour then
            QBCore.Functions.Notify('Please exit the bus to complete your journey.', 'warning')
        end
    end)
end

-- 3D Text drawing function
function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end

RegisterNetEvent('NS-BusService:Bus:killBusBlip')
AddEventHandler('NS-BusService:Bus:killBusBlip', function()
    if CarBlip and DoesBlipExist(CarBlip) then
        RemoveBlip(CarBlip)
        CarBlip = nil
    end
end)

RegisterNetEvent('NS-BusService:Bus:synchTheBus')
AddEventHandler('NS-BusService:Bus:synchTheBus', function(data)

	-- the logic here is to allow other players nearby the one who called the bus to get the prompt to enter and take the ride as well.

end)

-- Receive invitation to join trip
RegisterNetEvent('NS-BusService:Client:InviteToTrip')
AddEventHandler('NS-BusService:Client:InviteToTrip', function(tripData)
    if onTour then return end -- Player is already on a trip
    
    -- Create notification with option to join
    local menu = {
        {
            header = "Bus Trip Invitation",
            isMenuHeader = true,
        },
        {
            header = "Join trip to " .. tripData.destination,
            params = {
                event = "NS-BusService:Client:AcceptTripInvite",
                args = tripData
            }
        },
        {
            header = "Decline",
            params = {
                event = "NS-BusService:Client:DeclineTripInvite"
            }
        }
    }
    
    exports['qb-menu']:openMenu(menu)
end)

-- Accept trip invitation
RegisterNetEvent('NS-BusService:Client:AcceptTripInvite')
AddEventHandler('NS-BusService:Client:AcceptTripInvite', function(tripData)
    TriggerServerEvent('NS-BusService:Server:PlayerJoinTrip', tripData.tripId)
    QBCore.Functions.Notify('Joining bus trip...', 'info')
end)

-- Decline trip invitation
RegisterNetEvent('NS-BusService:Client:DeclineTripInvite')
AddEventHandler('NS-BusService:Client:DeclineTripInvite', function()
    QBCore.Functions.Notify('You declined the bus trip invitation', 'info')
end)

-- Receive synced bus data from host (no longer needed)
RegisterNetEvent('NS-BusService:Client:ReceiveSyncedBus')
AddEventHandler('NS-BusService:Client:ReceiveSyncedBus', function(busData)
    -- This function is deprecated in the fixed version
    -- We now use coordinate-based synchronization instead of network IDs
    if Config.Debug then
        print("^3[^5NS-BusService^7]: ^3ReceiveSyncedBus called but using coordinate-based sync instead")
    end
end)

-- Function to get bus data for syncing (no longer needed)
RegisterNetEvent('NS-BusService:Client:GetBusDataForSync')
AddEventHandler('NS-BusService:Client:GetBusDataForSync', function(targetPlayer)
    -- This function is deprecated in the fixed version
    -- We now use coordinate-based synchronization instead of network IDs
    if Config.Debug then
        print("^3[^5NS-BusService^7]: ^3GetBusDataForSync called but using coordinate-based sync instead")
    end
end)

-- Trip ended notification
RegisterNetEvent('NS-BusService:Client:TripEnded')
AddEventHandler('NS-BusService:Client:TripEnded', function()
    if not isTripHost then -- Only cleanup for passengers
        cleanupBus()
        QBCore.Functions.Notify('The bus trip has ended', 'info')
    end
end)

RegisterNetEvent('NS-BusService:Bus:cancelBus')
AddEventHandler('NS-BusService:Bus:cancelBus', function(cancel)
    cleanupBus()
end)

RegisterNetEvent('NS-BusService:Bus:reset')
AddEventHandler('NS-BusService:Bus:reset', function()
    cleanupBus()
    QBCore.Functions.Notify('Bus service has been reset!', 'success')
end)

RegisterNetEvent('NS-BusService:NpcBus:call') -- call the bus service.
AddEventHandler('NS-BusService:NpcBus:call', function(location, destination)
    -- Start the bus service process
    onTour = true
    currentLocation = location
    currentDestination = destination
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    
    -- Multi-player: Get nearby players
    local nearbyPlayerIds = {}
    if Config.MultiPlayerEnabled then
        local nearbyPlayers = GetNearbyPlayers(Config.ProximityRadius)
        for _, player in ipairs(nearbyPlayers) do
            table.insert(nearbyPlayerIds, player.id)
        end
        
        -- Show nearby players notification
        if #nearbyPlayerIds > 0 then
            QBCore.Functions.Notify('Found ' .. #nearbyPlayerIds .. ' nearby players who can join your trip!', 'info')
        end
        
        isTripHost = true
        currentTripId = "bus_" .. GetPlayerServerId(PlayerId()) .. "_" .. GetGameTimer()
    end
	
    -- Spawn bus nearby
	
    local playerCoords = GetEntityCoords(PlayerPedId())
    local found, spawnPos, spawnHeading = GetClosestVehicleNodeWithHeading(playerCoords.x + Config.BusSpawnRadius, playerCoords.y + Config.BusSpawnRadius, playerCoords.z, 0, 3, 0)
    local found2 = nil
	if not found then
		found2, spawnPos, spawnHeading = GetClosestVehicleNodeWithHeading(playerCoords.x - Config.BusSpawnRadius, playerCoords.y - Config.BusSpawnRadius, playerCoords.z, 0, 3, 0)
		if not found2 then
			QBCore.Functions.Notify('Could not find a suitable spawn location for the taxi!', 'error')
			return
		else
			found = found2
		end
    end
    
    -- local busCoords = spawnPos
	print(currentLocation)
    local busCoords = Config.Locations[currentLocation].spawnSpot
    
    -- Load vehicle model
    if not loadModelWithTimeout(Config.vehicleHash, 10000) then
        QBCore.Functions.Notify('Failed to load bus vehicle!', 'error')
        onTour = false
        return
    end
    
    -- Spawn the bus
    globalBus = CreateVehicle(Config.vehicleHash, busCoords.x, busCoords.y, busCoords.z, busCoords.w, true, false)
    exports[Config.FuelScript]:SetFuel(globalBus, 100.0)
    
    -- Load driver model
    if not loadModelWithTimeout(Config.driver, 10000) then
        QBCore.Functions.Notify('Failed to load bus driver!', 'error')
        QBCore.Functions.DeleteVehicle(globalBus)
        globalBus = nil
        onTour = false
        return
    end
    
    -- Spawn the driver ped
    ped = CreatePed(4, Config.driver, busCoords.x, busCoords.y, busCoords.z, busCoords.w, true, false)
    SetPedIntoVehicle(ped, globalBus, -1) -- Put ped in driver seat
    
    -- Set driver behavior
    SetPedFleeAttributes(ped, 0, 0)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedKeepTask(ped, true)
    
    -- Multi-player: Create shared trip on server (delayed to ensure networking is ready)
    if Config.MultiPlayerEnabled and isTripHost then
        Citizen.SetTimeout(1000, function()
            if globalBus and ped and DoesEntityExist(globalBus) and DoesEntityExist(ped) then
                -- Try to get network IDs with error handling
                local success = false
                local busNetId, driverNetId = 0, 0
                
                -- Attempt to get network IDs
                if NetworkGetNetworkIdOfEntity then
                    busNetId = NetworkGetNetworkIdOfEntity(globalBus)
                    driverNetId = NetworkGetNetworkIdOfEntity(ped)
                    
                    if busNetId and busNetId > 0 and driverNetId and driverNetId > 0 then
                        -- Set network synchronization if available
                        if SetNetworkIdCanMigrate then
                            SetNetworkIdCanMigrate(busNetId, true)
                            SetNetworkIdCanMigrate(driverNetId, true)
                        end
                        success = true
                    end
                end
                
                if success then
                    TriggerServerEvent('NS-BusService:Server:CreateSharedTrip', {
                        destination = destination,
                        pickupLocation = location,
                        nearbyPlayers = nearbyPlayerIds,
                        busNetId = busNetId,
                        driverNetId = driverNetId
                    })
                else
                    -- Fall back to single player mode if networking fails
                    if Config.Debug then
                        print("^1[^5NS-BusService^7]: ^1Failed to get network IDs, falling back to single player mode")
                    end
                end
            end
        end)
    end
    
    -- Add bus blip
    TriggerEvent('NS-BusService:setBlip', busCoords)
    
    -- Drive bus to pickup location
    local pickupCoords = Config.Locations[location].parkSpot
    drive(pickupCoords.x, pickupCoords.y, pickupCoords.z, false, 'start')
    
    -- Wait for bus to arrive at pickup location
    Citizen.CreateThread(function()
        local arrived = false
        local attempts = 0
        local maxAttempts = 1200 -- 2 minute timeout
        
        while not arrived and attempts < maxAttempts and onTour do
            local busPos = GetEntityCoords(globalBus)
            local distance = #(busPos - vector3(pickupCoords.x, pickupCoords.y, pickupCoords.z))
            if Config.Debug then
				print("PICK UP")
				print(distance)
				print("PICK UP")
			end
            if distance < 20.0 then
				
                QBCore.Functions.Notify('Bus has arrived! Press [E] to enter the bus.', 'info')
                arrived = true
                BusArrived = true
                parking(pickupCoords) -- Park the bus
                
                -- Start boarding detection
                Citizen.Wait(2000) -- Wait for parking animation
                
                if isTripHost then
                    waitForPlayerToEnter()
                else
                    createBoardingPrompt()
                end
            end
            
            attempts = attempts + 1
            Citizen.Wait(100)
        end
        if arrived then
			
            parking(pickupCoords) -- Park the bus
			QBCore.Functions.Notify('Bus has arrived! Press [E] to enter the bus.', 'info')
			if isTripHost then
                waitForPlayerToEnter()
            else
                createBoardingPrompt()
            end
			
		end
        if not arrived and onTour then
            QBCore.Functions.Notify('Bus failed to arrive. Please try again.', 'error')
            cleanupBus()
        end
    end)
end)

RegisterNetEvent('NS-BusService:setBlip')
AddEventHandler('NS-BusService:setBlip', function(coords) -- set destination blip for passenger (player)
	local coords = coords
	while onTour do
		if CarBlip and DoesBlipExist(CarBlip) then
			RemoveBlip(CarBlip)
			CarBlip = nil
		end
		
		if not CarBlip then
			CarBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
			SetBlipSprite(CarBlip, 56)
			SetBlipScale(CarBlip, 0.8)
			SetBlipColour(CarBlip, 5)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Bus')
			EndTextCommandSetBlipName(CarBlip)
		end
		Wait(1000)
		coords = GetEntityCoords(globalBus)
	end
end)

RegisterNetEvent('NS-BusService:Bus:SelectDestination')
AddEventHandler('NS-BusService:Bus:SelectDestination', function(data)
    if onTour then
        QBCore.Functions.Notify('You are already on a bus tour!', 'error')
        return
    end
    
    TriggerEvent('NS-BusService:NpcBus:call', data.location, data.destination)
end)

RegisterNetEvent('NS-BusService:Bus:CancelMenu')
AddEventHandler('NS-BusService:Bus:CancelMenu', function()
    QBCore.Functions.Notify('Bus service cancelled.', 'info')
end)

RegisterNetEvent('NS-BusService:Bus:WaitForPlayer')
AddEventHandler('NS-BusService:Bus:WaitForPlayer', function()
    -- This event is triggered when bus arrives for pickup
end)

RegisterNetEvent('NS-BusService:Bus:DriveToDestination')
AddEventHandler('NS-BusService:Bus:DriveToDestination', function()
    driveToDestination()
end)

RegisterNetEvent('NS-BusService:Bus:WaitForPlayerToExit')
AddEventHandler('NS-BusService:Bus:WaitForPlayerToExit', function()
    waitForPlayerToExit()
end)

function parking(destination) -- use this to task the ped and bus to park at the destination 
    if globalBus and ped then
        TaskVehiclePark(ped, globalBus, destination.x, destination.y, destination.z, 0.0, 0, 30.0, false)
        parkingDone = true
    end
end

function drive(x, y, z, delete, status) -- use this to task the driver and bus to drive to a location or pass delete to end, status should be passed with each call notifying the player
    if status == 'start' then
        Citizen.Wait(math.random(1000,3000))
        QBCore.Functions.Notify('A driver is on his way to you!', 'success')
    elseif status == 'destination' then
        QBCore.Functions.Notify('Driving to your destination...', 'success')
    elseif status == 'end' then
        QBCore.Functions.Notify('Thank you for your trust!', 'success')
    end
    
    if globalBus and ped then
        TaskVehicleDriveToCoordLongrange(ped, globalBus, x, y, z, Config.Speed, Config.DriveMode, 20.0)
    end
    
    if delete then
        Citizen.Wait(15000)
        cleanupBus()
    end
end

-- Main loop for detecting bus stop locations
Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        
        if not onTour then
            local location = isAtBusStop()
            if location then
                sleep = 0
                DrawText3D(Config.Locations[location].callSpot.x, Config.Locations[location].callSpot.y, Config.Locations[location].callSpot.z + 1.0, "~g~[E]~w~ Call Bus Service")
                
                if IsControlJustPressed(0, 38) then -- E key
                    createDestinationMenu(location)
                end
            end
        end
        
        Citizen.Wait(sleep)
    end
end)