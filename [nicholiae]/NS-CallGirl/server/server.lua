-- ============================================
-- NS-CallGirl Server - Enhanced with Custom Models
-- Database Integration & Payment Processing
-- ============================================

local QBCore = exports['qb-core']:GetCoreObject()
local ActiveMission = 0

-- Utility Functions
function CalculateTierFromReputation(reputation)
    for tierNum, tierData in pairs(Config.ReputationTiers) do
        if reputation >= tierData.min and reputation <= tierData.max then
            return tierNum, tierData
        end
    end
    return 1, Config.ReputationTiers[1]
end

-- Database Functions
function GetOrCreateRelationship(citizenid, prostituteIndex)
    local prostitute = Config.Prostitutes[prostituteIndex]
    if not prostitute then return nil end
    
    local modelNumber = prostitute.modelNumber  -- ✅ Get modelNumber for database
    
    local result = MySQL.Sync.fetchAll('SELECT * FROM pimp_relationships WHERE citizenid = ? AND prostitute_model = ?', {
        citizenid,
        modelNumber  -- ✅ Use modelNumber in database
    })
    
    if result and #result > 0 then
        return result[1]
    else
        -- Create new relationship
        MySQL.Async.execute('INSERT INTO pimp_relationships (citizenid, prostitute_model, prostitute_name, reputation, tier, relationship_status, bonus_multiplier) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            citizenid,
            modelNumber,  -- ✅ Use modelNumber in database
            prostitute.name,
            0,
            1,
            'Stranger',
            0.0
        })
        
        -- Return the newly created relationship
        local newResult = MySQL.Sync.fetchAll('SELECT * FROM pimp_relationships WHERE citizenid = ? AND prostitute_model = ?', {
            citizenid,
            modelNumber  -- ✅ Use modelNumber in database
        })
        
        return newResult[1]
    end
end

function UpdateRelationship(citizenid, prostituteIndex, repChange, wasSuccessful)
    local relationship = GetOrCreateRelationship(citizenid, prostituteIndex)
    if not relationship then return nil end
    
    -- Calculate new reputation (using Config.DecaySettings.min_reputation to match NS-PickUpAHoe)
    local newRep = math.max(Config.DecaySettings.min_reputation, math.min(100, relationship.reputation + repChange))
    
    -- Calculate new tier and bonus
    local newTier, tierData = CalculateTierFromReputation(newRep)
    local newStatus = tierData.status
    local newBonus = tierData.bonus
    
    -- Update interaction counts
    local newTotalInteractions = relationship.total_interactions + 1
    -- Only increment successful_interactions if wasSuccessful is true (matching NS-PickUpAHoe)
    local newSuccessfulInteractions = relationship.successful_interactions + (wasSuccessful and 1 or 0)
    
    -- Update database (using id for efficiency like NS-PickUpAHoe)
    MySQL.update.await(
        'UPDATE pimp_relationships SET reputation = ?, tier = ?, relationship_status = ?, bonus_multiplier = ?, total_interactions = ?, successful_interactions = ?, last_interaction = NOW(), updated_at = NOW() WHERE id = ?',
        {newRep, newTier, newStatus, newBonus, newTotalInteractions, newSuccessfulInteractions, relationship.id}
    )
    
    return {
        reputation = newRep,
        tier = newTier,
        status = newStatus,
        bonus = newBonus,
        repChange = repChange
    }
end


function OdpalTimer()
    ActiveMission = 1
    local counter = 0
    while counter ~= Config.ResetTimer do
        print("Reset Counter: "..tostring(counter).." compared to ResetTimer: "..tostring(Config.ResetTimer))
        Wait(60000)
        counter = counter + 1 
    end
    ActiveMission = 0
    TriggerClientEvent('NS-CallGirl:CleanUp', -1)
end

function GetAllRelationships(citizenid)
    local relationships = {}
    
    -- Get existing relationships
    local result = MySQL.Sync.fetchAll('SELECT * FROM pimp_relationships WHERE citizenid = ?', {
        citizenid
    })
    
    -- Create a map of existing relationships by modelNumber
    local existing = {}
    if result then
        for _, relationship in ipairs(result) do
            existing[relationship.prostitute_model] = relationship
        end
    end
    
    -- Ensure all 4 prostitutes have relationship records
    for index, prostituteData in pairs(Config.Prostitutes) do
        local modelNumber = prostituteData.modelNumber  -- ✅ Get modelNumber
        
        if not existing[modelNumber] then  -- ✅ Check by modelNumber
            -- Create relationship record if it doesn't exist
            MySQL.Async.execute([[
                INSERT INTO pimp_relationships 
                (citizenid, prostitute_model, prostitute_name, reputation, tier, relationship_status, bonus_multiplier, total_interactions, successful_interactions, created_at, updated_at) 
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())
            ]], {
                citizenid,
                modelNumber,  -- ✅ Use modelNumber in database
                prostituteData.name,
                0,
                1,
                'Stranger',
                0.0,
                0,
                0
            })
            
            -- Add default relationship data with BOTH index and modelNumber
            table.insert(relationships, {
                citizenid = citizenid,
                prostitute_model = modelNumber,  -- ✅ For database compatibility
                prostitute_index = index,         -- ✅ For UI image lookup
                prostitute_name = prostituteData.name,
                reputation = 0,
                tier = 1,
                relationship_status = 'Stranger',
                bonus_multiplier = 0.0,
                total_interactions = 0,
                successful_interactions = 0
            })
        else
            -- Add existing relationship data with index added
            local relationshipData = existing[modelNumber]
            relationshipData.prostitute_index = index  -- ✅ Add index for UI
            table.insert(relationships, relationshipData)
        end
    end
    
    return relationships
end

-- Server Events
RegisterServerEvent('NS-CallGirl:accept', function()
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local accountMoney = xPlayer.PlayerData.money['bank']
    if ActiveMission == 0 then
        if accountMoney < Config.BaseActivationCost then
            TriggerClientEvent('QBCore:Notify', _source, 'You need ' .. Config.Currency .. '' .. Config.BaseActivationCost .. ' in the bank to accept the mission')
        else
            TriggerClientEvent('NS-CallGirl:Paid', _source)
            xPlayer.Functions.RemoveMoney('bank', Config.BaseActivationCost, 'CallGirl')
            exports['qb-banking']:AddMoney('ambulance', Config.BaseActivationCost, 'CallGirl')
            OdpalTimer()
        end
    else
        TriggerClientEvent('QBCore:Notify', _source, 'It seems the callgirl is occupied at the moment.')
    end
end)

QBCore.Functions.CreateCallback('NS-CallGirl:server:activeStatus', function(source, cb)
    cb(ActiveMission)
end)

-- Enhanced Callbacks
QBCore.Functions.CreateCallback('ns-callgirl:server:getAllRelationships', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return cb({}) end
    
    local citizenid = Player.PlayerData.citizenid
    local relationships = GetAllRelationships(citizenid)
    
    cb(relationships)
end)

QBCore.Functions.CreateCallback('ns-callgirl:server:getRelationshipData', function(source, cb, prostituteIndex)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return cb(nil) end

    local citizenid = Player.PlayerData.citizenid
    local relationship = GetOrCreateRelationship(citizenid, prostituteIndex)

    cb(relationship)
end)

QBCore.Functions.CreateCallback('ns-callgirl:server:canAfford', function(source, cb, price)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return cb(false) end

    local bankBalance = Player.PlayerData.money.bank
    cb(bankBalance >= price)
end)

-- Enhanced Server Events
RegisterServerEvent('ns-callgirl:server:chargePlayer', function(price, prostituteIndex)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
	
	local src = source 
	if Config.Debug == true then
		print(src)
	end
    if Player.Functions.RemoveMoney('bank', price, 'CallGirl Service') then
        exports['qb-banking']:AddMoney('ambulance', price, 'CallGirl')
        TriggerClientEvent('QBCore:Notify', src, 'Charged $' .. price .. ' for the service', 'success')
        
        -- Start the timer
        if ActiveMission == 0 then
            OdpalTimer()
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'Insufficient funds', 'error')
    end
end)

RegisterServerEvent('ns-callgirl:server:updateReputation', function(prostituteIndex, repGain, wasSuccessful)
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player then return end
	local src = source
	if Config.Debug == true then
		print(src)
	end
	local citizenid = Player.PlayerData.citizenid
	-- Default wasSuccessful to true if not provided (for backward compatibility)
	if wasSuccessful == nil then wasSuccessful = true end

	local result = UpdateRelationship(citizenid, prostituteIndex, repGain, wasSuccessful)

	if result then
		TriggerClientEvent('ns-callgirl:client:reputationUpdated', src, {
		   model = prostituteIndex,
		   reputation = result.reputation,
		   tier = result.tier,
		   status = result.status
		})
	end
end)

RegisterServerEvent('ns-callgirl:server:incrementInteractions', function(prostituteIndex)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end

    local citizenid = Player.PlayerData.citizenid
    
    -- Interaction count is already updated in UpdateRelationship
    -- This event is just for tracking purposes
end)
-- ============================================
-- SERVER-DRIVEN REPUTATION DECAY SYSTEM
-- ============================================

local MAX_MULTIPLIER = 4.0
local DECAY_CHECK_INTERVAL = 3600000  -- 1 hour in milliseconds

-- Helper to parse MySQL datetime or Unix timestamp
local function ParseDateTime(dateStr)
    if not dateStr then return nil end
    
    -- If it's already a number (Unix timestamp), return it directly
    if type(dateStr) == 'number' then
        return dateStr
    end
    
    -- If it's a string, parse MySQL datetime format: YYYY-MM-DD HH:MM:SS
    if type(dateStr) == 'string' then
        local year, month, day, hour, min, sec = dateStr:match('(%d+)%-(%d+)%-(%d+) (%d+):(%d+):(%d+)')
        if year then
            return os.time({
                year = tonumber(year),
                month = tonumber(month),
                day = tonumber(day),
                hour = tonumber(hour) or 0,
                min = tonumber(min) or 0,
                sec = tonumber(sec) or 0
            })
        end
    end
    
    return nil
end

-- Calculate tier from reputation
local function GetTierFromReputation(reputation)
    for tierNum, tierData in pairs(Config.ReputationTiers) do
        if reputation >= tierData.min and reputation <= tierData.max then
            return tierNum, tierData.status, tierData.bonus
        end
    end
    return 1, 'Stranger', 0.0
end

-- Main decay function - processes ALL players
local function ProcessAllReputationDecay()
    if not Config.DecaySettings.enabled then 
        print('[NS-CallGirl] Decay is disabled in config')
        return 
    end
    
    local currentTime = os.time()
    local decayCount = 0
    
    -- Get all relationships with reputation > 0
    local allRelationships = MySQL.query.await(
        'SELECT id, citizenid, reputation, last_interaction FROM pimp_relationships WHERE reputation > 0',
        {}
    )
    
    if not allRelationships then 
        print('[NS-CallGirl] No relationships to process for decay')
        return 
    end
    
    for _, rel in ipairs(allRelationships) do
        local lastInteraction = ParseDateTime(rel.last_interaction)
        
        if lastInteraction then
            local hoursSinceInteraction = (currentTime - lastInteraction) / 3600
            
            if hoursSinceInteraction >= Config.DecaySettings.decay_start_hours then
                local decayHours = hoursSinceInteraction - Config.DecaySettings.decay_start_hours
                local decayAmount = math.min(
                    decayHours * Config.DecaySettings.decay_rate_per_hour,
                    Config.DecaySettings.max_decay_per_session
                )
                
                if decayAmount > 0 then
                    local newReputation = math.max(Config.DecaySettings.min_reputation, rel.reputation - decayAmount)
                    
                    -- Update reputation
                    MySQL.update.await(
                        'UPDATE pimp_relationships SET reputation = ?, updated_at = NOW() WHERE id = ?',
                        {newReputation, rel.id}
                    )
                    
                    -- Update tier and bonus based on new reputation
                    local newTier, newStatus, newBonus = GetTierFromReputation(newReputation)
                    
                    MySQL.update.await(
                        'UPDATE pimp_relationships SET tier = ?, relationship_status = ?, bonus_multiplier = ? WHERE id = ?',
                        {newTier, newStatus, newBonus, rel.id}
                    )
                    
                    decayCount = decayCount + 1
                end
            end
        end
    end
    
    -- Process base multiplier decay
    local allPlayers = MySQL.query.await(
        'SELECT citizenid, metadata FROM players WHERE metadata LIKE ?',
        {'%pimpmultiplier%'}
    )
    
    if allPlayers then
        for _, playerData in ipairs(allPlayers) do
            local metadata = json.decode(playerData.metadata)
            if metadata and metadata.pimpmultiplier and metadata.pimpmultiplier > 1.0 then
                local lastActivity = metadata.lastpimpactivity
                if lastActivity then
                    local lastActTime = ParseDateTime(lastActivity)
                    if lastActTime then
                        local hoursSinceActivity = (currentTime - lastActTime) / 3600
                        
                        if hoursSinceActivity >= Config.DecaySettings.base_multiplier_decay_start_hours then
                            local decayHours = hoursSinceActivity - Config.DecaySettings.base_multiplier_decay_start_hours
                            local decayAmount = decayHours * Config.DecaySettings.base_multiplier_decay_rate
                            local newBase = math.max(1.0, metadata.pimpmultiplier - decayAmount)
                            
                            if newBase < metadata.pimpmultiplier then
                                metadata.pimpmultiplier = newBase
                                MySQL.update.await(
                                    'UPDATE players SET metadata = ? WHERE citizenid = ?',
                                    {json.encode(metadata), playerData.citizenid}
                                )
                            end
                        end
                    end
                end
            end
        end
    end
    
    print('[NS-CallGirl] Processed decay for ' .. decayCount .. ' relationships')
end

-- Start decay thread (runs every hour)
CreateThread(function()
    Wait(60000) -- Wait 1 minute after server start
    ProcessAllReputationDecay() -- Run once on start
    
    while true do
        Wait(DECAY_CHECK_INTERVAL)
        ProcessAllReputationDecay()
    end
end)

-- ============================================
-- EXPORTS FOR OTHER RESOURCES (qb-phone)
-- ============================================

-- Export: Calculate player's current multiplier
exports('GetPlayerMultiplier', function(citizenid)
    local relationships = MySQL.query.await(
        'SELECT bonus_multiplier FROM pimp_relationships WHERE citizenid = ?',
        {citizenid}
    )
    
    local baseMultiplier = 1.0
    local offlinePlayer = QBCore.Functions.GetOfflinePlayerByCitizenId(citizenid)
    if offlinePlayer then
        baseMultiplier = offlinePlayer.PlayerData.metadata.pimpmultiplier or 1.0
    end
    
    local relationshipBonus = 0.0
    local activeCount = 0
    
    if relationships then
        for _, rel in ipairs(relationships) do
            if rel.bonus_multiplier and rel.bonus_multiplier > 0 then
                relationshipBonus = relationshipBonus + rel.bonus_multiplier
                activeCount = activeCount + 1
            end
        end
    end
    
    local totalMultiplier = math.min(baseMultiplier + relationshipBonus, MAX_MULTIPLIER)
    return totalMultiplier, activeCount, baseMultiplier, relationshipBonus
end)

-- Export: Get player name from citizenid
exports('GetPlayerName', function(citizenid)
    local targetPlayer = QBCore.Functions.GetPlayerByCitizenId(citizenid)
    if targetPlayer then
        return targetPlayer.PlayerData.charinfo.firstname .. ' ' .. targetPlayer.PlayerData.charinfo.lastname
    end
    
    local offlinePlayer = QBCore.Functions.GetOfflinePlayerByCitizenId(citizenid)
    if offlinePlayer then
        return offlinePlayer.PlayerData.charinfo.firstname .. ' ' .. offlinePlayer.PlayerData.charinfo.lastname
    end
    
    local result = MySQL.query.await('SELECT charinfo FROM players WHERE citizenid = ?', {citizenid})
    if result and result[1] then
        local charinfo = json.decode(result[1].charinfo)
        if charinfo then
            return (charinfo.firstname or 'Unknown') .. ' ' .. (charinfo.lastname or '')
        end
    end
    
    return 'Unknown'
end)

-- Export: Get all players with pimp relationships (for leaderboard)
exports('GetAllPimpPlayers', function()
    return MySQL.query.await(
        'SELECT DISTINCT citizenid FROM pimp_relationships',
        {}
    )
end)

-- Export: Get max multiplier constant
exports('GetMaxMultiplier', function()
    return MAX_MULTIPLIER
end)

-- Export: Manually trigger decay (for admin use)
exports('TriggerDecay', function()
    ProcessAllReputationDecay()
end)

print('[NS-CallGirl] Pimp system with decay initialized')
