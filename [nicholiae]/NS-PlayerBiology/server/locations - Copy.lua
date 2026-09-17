-- NS-PlayerBiology Dynamic Location Management
-- Server-side implementation using JSON files (like qb-doorlock doorstates.json)
-- Saves locations to separate JSON files per type

local QBCore = exports['qb-core']:GetCoreObject()

-- Dynamic locations storage (loaded from JSON files)
local DynamicLocations = {
    toiletChair = {},
    urinalStand = {},
    showerStall = {},
    bathTub = {},
    handSink = {},
    public = {}
}

-- File paths for each location type
local LocationFiles = {
    toiletChair = './locations/toiletChair.json',
    urinalStand = './locations/urinalStand.json',
    showerStall = './locations/showerStall.json',
    bathTub = './locations/bathTub.json',
    handSink = './locations/handSink.json',
    public = './locations/public.json'
}

-- Load locations from JSON file using FiveM native (NON-BLOCKING)
local function LoadLocationsFromFile(locationType)
    local fileData = LoadResourceFile(GetCurrentResourceName(), LocationFiles[locationType])
    
    if fileData then
        local success, data = pcall(json.decode, fileData)
        if success and data then
            DynamicLocations[locationType] = data
            print(('[NS-PlayerBiology] Loaded %d dynamic %s locations'):format(#data, locationType))
        else
            print(('[NS-PlayerBiology] Error decoding JSON for %s, using empty array'):format(locationType))
            DynamicLocations[locationType] = {}
        end
    else
        -- File doesn't exist, create it with empty array
        SaveResourceFile(GetCurrentResourceName(), LocationFiles[locationType], '[]', -1)
        DynamicLocations[locationType] = {}
        print(('[NS-PlayerBiology] Created new location file: %s'):format(locationType))
    end
end

-- Save locations to JSON file using FiveM native (NON-BLOCKING)
local function SaveLocationsToFile(locationType)
    local success, jsonData = pcall(json.encode, DynamicLocations[locationType], {indent = true})
    if success then
        SaveResourceFile(GetCurrentResourceName(), LocationFiles[locationType], jsonData, -1)
        print(('[NS-PlayerBiology] Saved %d locations to %s'):format(#DynamicLocations[locationType], locationType))
        return true
    else
        print(('[NS-PlayerBiology] Error encoding JSON for %s'):format(locationType))
        return false
    end
end

-- Load all location files on resource start
local function LoadAllLocations()
    print('[NS-PlayerBiology] Loading dynamic locations from JSON files...')
    for locationType, _ in pairs(LocationFiles) do
        LoadLocationsFromFile(locationType)
    end
    print('[NS-PlayerBiology] Dynamic locations loaded successfully')
end

-- Get next available ID for a location type
local function GetNextLocationId(locationType)
    local maxId = 0
    for _, location in ipairs(DynamicLocations[locationType]) do
        if location.id and location.id > maxId then
            maxId = location.id
        end
    end
    return maxId + 1
end

-- Convert vector3 to table for JSON serialization
local function Vector3ToTable(vec)
    return {x = vec.x, y = vec.y, z = vec.z}
end

RegisterNetEvent('PlayerBiology:server:synchLocations', function()
	
	TriggerClientEvent('PlayerBiology:client:synchLocations', -1, DynamicLocations)
		
end)

-- Server event: Save new bathroom location
RegisterNetEvent('PlayerBiology:server:saveLocation', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    -- Verify admin permission
    if not QBCore.Functions.HasPermission(src, 'admin') then
        TriggerClientEvent('QBCore:Notify', src, 'You do not have permission to use this command', 'error')
        return
    end
    
    local locationType = data.locationType
    local location = data.location
    local heading = data.heading
    local animDict = data.animDict
    local animName = data.animName
    
    -- Get next ID for this location type
    local nextId = GetNextLocationId(locationType)
    
    -- Get next index for Config.Sections (for backward compatibility)
    local nextIndex = #Config.Sections[locationType].stations + 1
    
    -- Create new location entry for JSON
    local newLocationJSON = {
        id = nextId,
        targetCoords = Vector3ToTable(location),
        playerCoords = Vector3ToTable(location),
        heading = heading,
        animDict = animDict,
        animName = animName,
        returnCoords = Vector3ToTable(location),
        createdBy = Player.PlayerData.name,
        createdAt = os.date('%Y-%m-%d %H:%M:%S')
    }
    
    -- Create new location entry for Config (in-memory)
    local newLocationConfig = {
        targetCoords = location,
        playerCoords = location,
        heading = heading,
        animDict = animDict,
        animName = animName,
        returnCoords = location,
        id = nextId,
        isDynamic = true
    }
    
    -- Add to dynamic locations array
    table.insert(DynamicLocations[locationType], newLocationJSON)
    
    -- Save to JSON file
    if SaveLocationsToFile(locationType) then
        -- Update Config in memory on server
        Config.Sections[locationType].stations[nextIndex] = newLocationConfig
        
        -- Sync to all clients
        TriggerClientEvent('PlayerBiology:client:addLocation', -1, locationType, nextIndex, newLocationConfig)
        
        -- Notify admin
        TriggerClientEvent('QBCore:Notify', src, string.format('New %s location added (ID: %d)', locationType, nextId), 'success')
        print(('[NS-PlayerBiology] %s added new %s location (ID: %d, Index: %d)'):format(Player.PlayerData.name, locationType, nextId, nextIndex))
    else
        TriggerClientEvent('QBCore:Notify', src, 'Error saving location to file', 'error')
    end
end)

-- Load locations on resource start
AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() == resource then
        LoadAllLocations()
        
        -- Add dynamic locations to Config.Sections
        for locationType, locations in pairs(DynamicLocations) do
            for _, location in ipairs(locations) do
                local configLocation = {
                    targetCoords = vector3(location.targetCoords.x, location.targetCoords.y, location.targetCoords.z),
                    playerCoords = vector3(location.playerCoords.x, location.playerCoords.y, location.playerCoords.z),
                    heading = location.heading,
                    animDict = location.animDict,
                    animName = location.animName,
                    returnCoords = vector3(location.returnCoords.x, location.returnCoords.y, location.returnCoords.z),
                    id = location.id,
                    isDynamic = true
                }
                table.insert(Config.Sections[locationType].stations, configLocation)
            end
        end
        
        print('[NS-PlayerBiology] Dynamic locations added to Config.Sections')
    end
end)

print('[NS-PlayerBiology] Dynamic location system loaded (Server - JSON Mode)')