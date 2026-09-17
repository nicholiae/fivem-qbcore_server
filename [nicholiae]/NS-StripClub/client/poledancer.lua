-- Pole Dancer Client-Side Management for NS-StripClub Enhanced
-- Handles creation and appearance application for pole dancers

local initializedPoleDancers = {}
poleDancers = {}

-- Create pole dancer on client side
RegisterNetEvent('NS-StripClub:client:CreatePoleDancer')
AddEventHandler('NS-StripClub:client:CreatePoleDancer', function(poleId, stripperId)
    if not Config.MultiDancerPoles.enabled then return end
    if not Cache.inuniPoly then return end
	
    local poleConfig = Config.MultiDancerPoles.poleLocations[poleId]
    local stripperConfig = Config.Strippers[stripperId]
    
    if not poleConfig or not stripperConfig then 
        if Config.Debug then
            print(string.format("Failed to create pole dancer - Missing config for pole %d or stripper %d", poleId, stripperId))
        end
        return 
    end
    
    -- Remove existing dancer for this pole if exists
    if poleDancers[poleId] and DoesEntityExist(poleDancers[poleId].ped) then
        DeleteEntity(poleDancers[poleId].ped)
        poleDancers[poleId] = nil
        if Config.Debug then
            print(string.format("Removed existing dancer from pole %d before creating new one", poleId))
        end
    end
    
    -- Create the ped
    local model = stripperConfig.Model
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(20)
    end
    
    local ped = CreatePed(4, model, poleConfig.coords.x, poleConfig.coords.y, poleConfig.coords.z, poleConfig.heading, true, false)
    
    -- Store dancer info with enhanced dance data
    poleDancers[poleId] = {
        ped = ped,
        poleId = poleId,
        stripperId = stripperId,
        coords = poleConfig.coords,
        heading = poleConfig.heading,
        -- Assign different dance styles to each pole for variety
        pedNumber = (poleId == 1 and 1) or (poleId == 2 and 2) or 1,
        currentDance = 1,
        isActive = true,
        danceTimer = 0
    }
    
    -- Apply stripper appearance
    if Config.Strippers[stripperId] then
        ApplyFullProstituteAppearance(ped, stripperId)
        if Config.Debug then
            print(string.format("Applied full appearance for stripper %s (%s)", stripperConfig.Name, stripperConfig.Nickname))
        end
    end
    
    TriggerServerEvent('NS-StripClub:bounceThePoles', ped, stripperId, poleId)
	
    -- Set ped to not be affected by player actions
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, false)
    
    -- Make ped stay in place during dance
    TaskSetBlockingOfNonTemporaryEvents(ped, true)
    -- Start the enhanced pole dance routine
    Citizen.CreateThread(function()
        StartEnhancedPoleDance(ped, poleDancers[poleId])
    end)
    
    if Config.Debug then
        print(string.format("✅ Successfully created pole dancer: %s at %s (Pole %d, Dance Style %d)", 
            stripperConfig.Name, poleConfig.name, poleId, poleDancers[poleId].pedNumber))
        
        -- Log all active dancers
        local activeCount = 0
        for id, _ in pairs(poleDancers) do
            activeCount = activeCount + 1
        end
        print(string.format("📊 Total active pole dancers: %d", activeCount))
    end
end)

-- Remove pole dancer
RegisterNetEvent('NS-StripClub:client:RemovePoleDancer')
AddEventHandler('NS-StripClub:client:RemovePoleDancer', function(poleId)
    if poleDancers[poleId] and DoesEntityExist(poleDancers[poleId].ped) then
        DeleteEntity(poleDancers[poleId].ped)
        poleDancers[poleId] = nil
        if Config.Debug then
            print(string.format("Removed pole dancer from pole %d", poleId))
        end
    end
end)

-- synchronized pole dancer appearance
RegisterNetEvent('NS-StripClub:client:SynchPoleDancer')
AddEventHandler('NS-StripClub:client:SynchPoleDancer', function(ped, stripperId, poleId)

	-- print(ped)
	-- print(stripperId)
	-- print(poleId)
	
	
	if not Config.MultiDancerPoles.enabled then return end
    if not Cache.inuniPoly then return end
	
	local ped = ped
	local stripperId = stripperId
	local poleId = poleId
	
	
    local poleConfig = Config.MultiDancerPoles.poleLocations[poleId]
    local stripperConfig = Config.Strippers[stripperId]
    
    if not poleConfig or not stripperConfig then 
        if Config.Debug then
            print(string.format("Failed to create pole dancer - Missing config for pole %d or stripper %d", poleId, stripperId))
        end
        return 
    end
    
    -- Store dancer info with enhanced dance data
    poleDancers[poleId] = {
        ped = ped,
        poleId = poleId,
        stripperId = stripperId,
        coords = poleConfig.coords,
        heading = poleConfig.heading,
        -- Assign different dance styles to each pole for variety
        pedNumber = (poleId == 1 and 1) or (poleId == 2 and 2) or 1,
        currentDance = 1,
        isActive = true,
        danceTimer = 0
    }
    
    -- Apply stripper appearance
    if Config.Strippers[stripperId] then
		SynchAllPoleDancersAppearance("Lingerie", ped)
        -- ApplyFullProstituteAppearance(ped, stripperId)
        if Config.Debug then
            print(string.format("Applied full appearance for stripper %s (%s)", stripperConfig.Name, stripperConfig.Nickname))
        end
    end
    
    -- Set ped to not be affected by player actions
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, false)
    
    -- Make ped stay in place during dance
    TaskSetBlockingOfNonTemporaryEvents(ped, true)
    
    -- Start the enhanced pole dance routine
    Citizen.CreateThread(function()
        StartEnhancedPoleDance(ped, poleDancers[poleId])
    end)
    
    if Config.Debug then
        print(string.format("✅ Successfully created pole dancer: %s at %s (Pole %d, Dance Style %d)", 
            stripperConfig.Name, poleConfig.name, poleId, poleDancers[poleId].pedNumber))
        
        -- Log all active dancers
        local activeCount = 0
        for id, _ in pairs(poleDancers) do
            activeCount = activeCount + 1
        end
        print(string.format("📊 Total active pole dancers: %d", activeCount))
    end
	
end)

-- Enhanced pole dance animation system
function StartEnhancedPoleDance(ped, dancerInfo)
    if not DoesEntityExist(ped) or not dancerInfo then return end
    
    local poleConfig = Config.MultiDancerPoles.poleLocations[dancerInfo.poleId]
    if not poleConfig then return end
    
    -- Dance animation sequences for variety
    local danceSequences = {
        [1] = { 
            anim = "pd_dance_01", 
            dict = "mini@strip_club@pole_dance@pole_dance1",
            duration = 45000 
        },
        [2] = { 
            anim = "pd_dance_02", 
            dict = "mini@strip_club@pole_dance@pole_dance2", 
            duration = 30000 
        },
        [3] = { 
            anim = "pd_dance_03", 
            dict = "mini@strip_club@pole_dance@pole_dance3", 
            duration = 65000 
        }
    }
    
    -- Ensure ped is at correct position
    SetEntityCoords(ped, poleConfig.coords.x, poleConfig.coords.y, poleConfig.coords.z, false, false, false, true)
    SetEntityHeading(ped, poleConfig.heading)
    
    if Config.Debug then
        print(string.format("Starting enhanced pole dance for pole %d with ped %s", dancerInfo.poleId, dancerInfo.pedNumber or 1))
    end
    
    while dancerInfo and dancerInfo.isActive do
        -- Check if ped is near pole
        local pedCoords = GetEntityCoords(ped)
        local distance = #(pedCoords - poleConfig.coords)
        
        if distance > 2.0 then
            if Config.Debug then
                print(string.format("Ped is too far from pole (%.2f), moving back", distance))
            end
            -- Move back to pole position
            TaskGoToCoordAnyMeans(ped, poleConfig.coords.x, poleConfig.coords.y, poleConfig.coords.z, 1.0, 0, 0, 0, 0xbf800000)
            Citizen.Wait(2000)
            
            -- Reset position and heading
            SetEntityCoords(ped, poleConfig.coords.x, poleConfig.coords.y, poleConfig.coords.z, false, false, false, true)
            SetEntityHeading(ped, poleConfig.heading)
            Citizen.Wait(1000)
        else
            -- Perform pole dance animation
			local thisOne = math.random(#danceSequences)
            local danceSeq = danceSequences[thisOne]
            -- local danceSeq = danceSequences[dancerInfo.pedNumber] or danceSequences[1]
            
            if Config.Debug then
                print(string.format("Playing dance animation %s from dict %s", danceSeq.anim, danceSeq.dict))
            end
            
            -- Request animation dictionary
            RequestAnimDict(danceSeq.dict)
            while not HasAnimDictLoaded(danceSeq.dict) do
                Wait(100)
            end
            
            -- Create synchronized scene for pole dance
            local scene = NetworkCreateSynchronisedScene(
                poleConfig.coords, 
                vector3(0.0, 0.0, 0.0), 
                2, 
                false, 
                false, 
                1065353216, 
                0, 
                1.3
            )
            
            NetworkAddPedToSynchronisedScene(
                ped, 
                scene, 
                danceSeq.dict, 
                danceSeq.anim, 
                1.5, 
                -4.0, 
                1, 
                1, 
                1148846080, 
                0
            )
            
            NetworkStartSynchronisedScene(scene)
            
            if Config.Debug then
                print(string.format("Started pole dance scene for ped at pole %d", dancerInfo.poleId))
            end
            
            -- Wait for dance to complete
            Citizen.Wait(danceSeq.duration)
            
            -- Rotate through dance styles for variety
            dancerInfo.currentDance = (dancerInfo.currentDance % #danceSequences) + 1
            dancerInfo.pedNumber = dancerInfo.currentDance
            
            if Config.Debug then
                print(string.format("Dance completed, switching to style %d", dancerInfo.pedNumber))
            end
            
            -- Brief pause between dances
            Citizen.Wait(100)
        end
        
        Citizen.Wait(100)
    end
    
    if Config.Debug then
        print(string.format("Pole dance routine ended for pole %d", dancerInfo.poleId))
    end
end

-- Fallback function for original dance system (for backward compatibility)
function StartPoleDance(ped, danceNumber)
    if not DoesEntityExist(ped) then return end
    
    local dancerInfo = nil
    for _, info in pairs(poleDancers) do
        if info.ped == ped then
            dancerInfo = info
            break
        end
    end
    
    if dancerInfo then
        StartEnhancedPoleDance(ped, dancerInfo)
    else
        if Config.Debug then
            print("Warning: StartPoleDance called but no dancer info found - this should not happen with enhanced system")
        end
    end
end

-- Refresh all pole dancers (useful for debugging or updates)
RegisterNetEvent('NS-StripClub:client:RefreshPoleDancers')
AddEventHandler('NS-StripClub:client:RefreshPoleDancers', function()
    if Config.Debug then
        print("Refreshing all pole dancers...")
    end
    
    -- Remove all existing dancers
    for poleId, _ in pairs(poleDancers) do
        if poleDancers[poleId] and DoesEntityExist(poleDancers[poleId].ped) then
            DeleteEntity(poleDancers[poleId].ped)
        end
    end
    poleDancers = {}
    
    -- Request server to recreate dancers
    TriggerServerEvent('NS-StripClub:client:RequestDancerRefresh')
end)

-- Clean up when resource stops
AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    
    -- Clean up all pole dancers
    for poleId, dancerInfo in pairs(poleDancers) do
        if DoesEntityExist(dancerInfo.ped) then
            DeleteEntity(dancerInfo.ped)
        end
    end
    
    poleDancers = {}
    initializedPoleDancers = {}
    
    if Config.Debug then
        print("Cleaned up all pole dancers")
    end
end)

-- Enhanced debugging function
function DebugPoleDancerStatus()
    if not Config.Debug then return end
    
    print("=== POLE DANCER DEBUG STATUS ===")
    print(string.format("Multi-dancer enabled: %s", tostring(Config.MultiDancerPoles.enabled)))
    print(string.format("Max dancers: %d", Config.MultiDancerPoles.maxDancers))
    print(string.format("Active dancers: %d", table_length(poleDancers)))
    
    for poleId, dancerInfo in pairs(poleDancers) do
        if DoesEntityExist(dancerInfo.ped) then
            local pedCoords = GetEntityCoords(dancerInfo.ped)
            local stripperConfig = Config.Strippers[dancerInfo.stripperId]
            local stripperName = stripperConfig and stripperConfig.Name or "Unknown"
            
            print(string.format("Pole %d: %s (%s) - Active: %s", 
                poleId, stripperName, stripperConfig.Nickname or "No Nickname", tostring(dancerInfo.isActive)))
            print(string.format("  Position: %.2f, %.2f, %.2f", pedCoords.x, pedCoords.y, pedCoords.z))
            print(string.format("  Dance Style: %d", dancerInfo.pedNumber or 1))
        else
            print(string.format("Pole %d: Ped does not exist!", poleId))
        end
    end
    print("=== END DEBUG STATUS ===")
end

-- Helper function to get table length
function table_length(t)
    local count = 0
    for _ in pairs(t) do count = count + 1 end
    return count
end

-- Export functions for external use
exports('GetPoleDancerInfo', function(poleId)
    return poleDancers[poleId]
end)

exports('GetAllPoleDancers', function()
    return poleDancers
end)

exports('DebugPoleDancerStatus', function()
    DebugPoleDancerStatus()
end)