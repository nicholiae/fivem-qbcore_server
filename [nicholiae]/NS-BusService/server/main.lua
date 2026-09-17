local QBCore = exports['qb-core']:GetCoreObject()

-- Multi-player state management
local activeBusTrips = {} -- Stores all active bus trips

-- Structure:
-- {
--     [tripId] = {
--         hostPlayer = source,
--         destination = locationName,
--         pickupLocation = locationName,
--         passengers = {playerId1, playerId2, ...},
--         busNetId = netId,
--         driverNetId = netId,
--         status = "boarding" | "traveling" | "arrived",
--         createdAt = timestamp
--     }
-- }

RegisterServerEvent('NS-BusService:NPCBus:pay')
AddEventHandler('NS-BusService:NPCBus:pay', function(price)
	if Config.Price == 0 then return end -- skipp payment if Config.Price is set to 0 -- free service 
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    
    -- Validate price parameter
    if type(price) ~= "number" or price <= 0 then
        TriggerClientEvent('QBCore:Notify', source, 'Invalid Bus fare!', "error")
        if Config.Debug then 
            print("^0[^5Debug^7][^1Error^0]: ^1Invalid price parameter received from Player-ID: ".._source)
        end
        return
    end
    
    -- Round price to 2 decimal places
    price = math.floor(price * 100 + 0.5) / 100
    
    local playerCash = xPlayer.PlayerData.money.cash
    local playerBank = xPlayer.PlayerData.money.bank
    
    -- Corrected logic: remove from cash first, then bank if needed
    if playerCash >= price then
        xPlayer.Functions.RemoveMoney('cash', price)
        if Config.Debug then 
            print("^0[^5Debug^7][^3Information^0]: ^2Successfully removed $"..price.." from cash for Bus ride from Player-ID: ".._source)
        end
    elseif playerBank >= price then
        xPlayer.Functions.RemoveMoney('bank', price)
        if Config.Debug then 
            print("^0[^5Debug^7][^3Information^0]: ^2Successfully removed $"..price.." from bank for Bus ride from Player-ID: ".._source)
        end
    else
        -- Player doesn't have enough money
        TriggerClientEvent('QBCore:Notify', source, 'You do not have enough money for the Bus ride! Fare: $'..price, "error")
        if Config.Debug then 
            print("^0[^5Debug^7][^1Error^0]: ^1Player-ID: ".._source.." does not have enough money for Bus fare $"..price)
        end
        return
    end
    
    TriggerClientEvent('QBCore:Notify', source, 'You paid total of $'..price..' for the Bus journey!', "success")
end)

-- Create shared bus trip
RegisterServerEvent('NS-BusService:Server:CreateSharedTrip')
AddEventHandler('NS-BusService:Server:CreateSharedTrip', function(data)
    if not Config.MultiPlayerEnabled then return end
    
    local source = source
    local tripId = "bus_" .. source .. "_" .. GetGameTimer()
    
    activeBusTrips[tripId] = {
        hostPlayer = source,
        destination = data.destination,
        pickupLocation = data.pickupLocation,
        passengers = {source}, -- Host is first passenger
        busCoords = data.busCoords, -- Store bus coordinates for passenger sync
        status = "boarding",
        createdAt = os.time()
    }
    
    -- Notify all nearby players about the trip
    if data.nearbyPlayers then
        for _, playerId in ipairs(data.nearbyPlayers) do
            if playerId ~= source then
                TriggerClientEvent('NS-BusService:Client:InviteToTrip', playerId, {
                    tripId = tripId,
                    hostPlayer = source,
                    destination = data.destination,
                    pickupLocation = data.pickupLocation
                })
            end
        end
    end
    
    if Config.Debug then
        print("^2[^5NS-BusService^7]: Created shared trip " .. tripId .. " for player " .. GetPlayerName(source))
    end
end)

-- Player joins existing trip
RegisterServerEvent('NS-BusService:Server:PlayerJoinTrip')
AddEventHandler('NS-BusService:Server:PlayerJoinTrip', function(tripId)
    local source = source
    
    if activeBusTrips[tripId] then
        -- Check if trip is at capacity
        if #activeBusTrips[tripId].passengers >= Config.MaxPassengers then
            TriggerClientEvent('QBCore:Notify', source, 'This bus is already full!', 'error')
            return
        end
        
        -- Add player to passengers list
        table.insert(activeBusTrips[tripId].passengers, source)
        
        -- Confirm trip join to passenger (without network ID sync)
        TriggerClientEvent('NS-BusService:Client:ConfirmTripJoin', source, {
            tripId = tripId,
            pickupLocation = activeBusTrips[tripId].pickupLocation,
            destination = activeBusTrips[tripId].destination
        })
        
        if Config.Debug then
            print("^2[^5NS-BusService^7]: Player " .. GetPlayerName(source) .. " joined trip " .. tripId)
        end
    end
end)

-- Sync bus data to joining player (no longer needed with coordinate-based system)
RegisterServerEvent('NS-BusService:Server:SyncBusDataToPlayer')
AddEventHandler('NS-BusService:Server:SyncBusDataToPlayer', function(targetPlayer, busData)
    -- This function is deprecated in the fixed version
    -- We now use coordinate-based synchronization instead of network IDs
    if Config.Debug then
        print("^3[^5NS-BusService^7]: ^3SyncBusDataToPlayer called but using coordinate-based sync instead")
    end
end)

-- Player entered bus
RegisterServerEvent('NS-BusService:Server:PlayerEnteredBus')
AddEventHandler('NS-BusService:Server:PlayerEnteredBus', function(tripId)
    if Config.Debug then
        print("^2[^5NS-BusService^7]: Player " .. GetPlayerName(source) .. " entered bus for trip " .. tripId)
    end
end)

-- Player exited bus
RegisterServerEvent('NS-BusService:Server:PlayerExitedBus')
AddEventHandler('NS-BusService:Server:PlayerExitedBus', function(tripId)
    if Config.Debug then
        print("^2[^5NS-BusService^7]: Player " .. GetPlayerName(source) .. " exited bus for trip " .. tripId)
    end
end)

-- End trip and clean up
RegisterServerEvent('NS-BusService:Server:EndTrip')
AddEventHandler('NS-BusService:Server:EndTrip', function(tripId)
    if activeBusTrips[tripId] then
        -- Notify all passengers that trip is ending
        for _, playerId in ipairs(activeBusTrips[tripId].passengers) do
            TriggerClientEvent('NS-BusService:Client:TripEnded', playerId)
        end
        
        -- Clean up trip data
        activeBusTrips[tripId] = nil
        
        if Config.Debug then
            print("^2[^5NS-BusService^7]: Ended trip " .. tripId)
        end
    end
end)

-- Handle player disconnecting during trip
AddEventHandler('playerDropped', function(reason)
    local source = source
    
    -- Remove player from any active trips
    for tripId, tripData in pairs(activeBusTrips) do
        for i, playerId in ipairs(tripData.passengers) do
            if playerId == source then
                table.remove(tripData.passengers, i)
                
                -- If host disconnected, end the trip
                if tripData.hostPlayer == source then
                    TriggerServerEvent('NS-BusService:Server:EndTrip', tripId)
                    break
                end
                
                if Config.Debug then
                    print("^2[^5NS-BusService^7]: Player " .. GetPlayerName(source) .. " removed from trip " .. tripId .. " due to disconnect")
                end
            end
        end
    end
end)

RegisterServerEvent('NS-BusService:NPCBus:SynchToSurroundingPlayers')
AddEventHandler('NS-BusService:NPCBus:SynchToSurroundingPlayers', function(players, data)
	
	-- the logic here is for the server to receive a list of players from the player who called the bus trip then send all necessary data to the players in the list.
	
	if not players then return end
	
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local playersList = players
	
	-- This event is now handled by the new multi-player system
	
end)