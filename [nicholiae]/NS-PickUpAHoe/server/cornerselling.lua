local QBCore = exports['qb-core']:GetCoreObject()

-- Helper Functions
local function round(number, digit_position) 
    local precision = math.pow(10, digit_position)
    number = number + (precision / 2)
    return math.floor(number / precision) * precision
end

local function GetProstituteData(model)
    return Config.Prostitutes[model]
end

local function CalculateTierFromReputation(reputation)
    for tierNum, tierData in pairs(Config.ReputationTiers) do
        if reputation >= tierData.min and reputation <= tierData.max then
            return tierNum, tierData.status, tierData.bonus
        end
    end
    return 1, "Stranger", 0.0
end

-- Relationship Management Functions
local function GetOrCreateRelationship(citizenid, prostituteModel)
    local relationship = MySQL.query.await(
        'SELECT * FROM pimp_relationships WHERE citizenid = ? AND prostitute_model = ?',
        {citizenid, prostituteModel}
    )
    
    if relationship and relationship[1] then
        return relationship[1]
    else
        -- Create new relationship
        local prostituteData = GetProstituteData(prostituteModel)
        if not prostituteData then return nil end
        
        local insertId = MySQL.insert.await(
            'INSERT INTO pimp_relationships (citizenid, prostitute_model, prostitute_name, reputation, tier, relationship_status, bonus_multiplier) VALUES (?, ?, ?, ?, ?, ?, ?)',
            {citizenid, prostituteModel, prostituteData.name, 0, 1, 'Stranger', 0.0}
        )
        
        if insertId then
            return MySQL.query.await(
                'SELECT * FROM pimp_relationships WHERE id = ?',
                {insertId}
            )[1]
        end
    end
    
    return nil
end

local function UpdateRelationship(citizenid, prostituteModel, repChange, wasSuccessful)
    local relationship = GetOrCreateRelationship(citizenid, prostituteModel)
    if not relationship then return nil end
    
    -- Calculate new reputation
    local newRep = math.max(Config.DecaySettings.min_reputation, math.min(100, relationship.reputation + repChange))
    
    -- Calculate new tier and bonus
    local newTier, newStatus, newBonus = CalculateTierFromReputation(newRep)
    
    -- Update interaction counts
    local newTotalInteractions = relationship.total_interactions + 1
    local newSuccessfulInteractions = relationship.successful_interactions + (wasSuccessful and 1 or 0)
    
    -- Update database
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

local function CheckReputationDecay(citizenid, prostituteModel)
    local relationship = MySQL.query.await(
        'SELECT * FROM pimp_relationships WHERE citizenid = ? AND prostitute_model = ?',
        {citizenid, prostituteModel}
    )
    
    if relationship and relationship[1] then
        local lastInteraction = relationship[1].last_interaction
        if not lastInteraction then return 0 end
        
        local currentTime = os.time()
        local lastInteractionTime = os.time({
            year = tonumber(os.date("%Y", os.time())),
            month = tonumber(os.date("%m", os.time())),
            day = tonumber(os.date("%d", os.time())),
            hour = tonumber(string.sub(lastInteraction, 12, 13)),
            min = tonumber(string.sub(lastInteraction, 15, 16)),
            sec = tonumber(string.sub(lastInteraction, 18, 19))
        })
        
        local hoursSinceLastInteraction = (currentTime - lastInteractionTime) / 3600
        
        if Config.DecaySettings.enabled and hoursSinceLastInteraction >= Config.DecaySettings.decay_start_hours then
            local decayAmount = math.floor(
                (hoursSinceLastInteraction - Config.DecaySettings.decay_start_hours) * 
                Config.DecaySettings.decay_rate_per_hour
            )
            
            decayAmount = math.min(decayAmount, Config.DecaySettings.max_decay_per_session)
            
            if decayAmount > 0 then
                local newRep = math.max(
                    relationship[1].reputation - decayAmount,
                    Config.DecaySettings.min_reputation
                )
                
                local newTier, newStatus, newBonus = CalculateTierFromReputation(newRep)
                
                MySQL.update.await(
                    'UPDATE pimp_relationships SET reputation = ?, tier = ?, relationship_status = ?, bonus_multiplier = ?, updated_at = NOW() WHERE id = ?',
                    {newRep, newTier, newStatus, newBonus, relationship[1].id}
                )
                
                return decayAmount
            end
        end
    end
    
    return 0
end

local function CalculateTotalRelationshipBonus(citizenid)
    local relationships = MySQL.query.await(
        'SELECT bonus_multiplier FROM pimp_relationships WHERE citizenid = ?',
        {citizenid}
    )
    
    local totalBonus = 0.0
    if relationships then
        for _, rel in ipairs(relationships) do
            totalBonus = totalBonus + (rel.bonus_multiplier or 0.0)
        end
    end
    
    return totalBonus
end

-- Statistics Management
local function GetOrCreateStatistics(citizenid)
    local stats = MySQL.query.await(
        'SELECT * FROM pimp_statistics WHERE citizenid = ?',
        {citizenid}
    )
    
    if stats and stats[1] then
        return stats[1]
    else
        MySQL.insert.await(
            'INSERT INTO pimp_statistics (citizenid) VALUES (?)',
            {citizenid}
        )
        return MySQL.query.await('SELECT * FROM pimp_statistics WHERE citizenid = ?', {citizenid})[1]
    end
end

local function UpdateStatistics(citizenid, statType, value)
    local stats = GetOrCreateStatistics(citizenid)
    if not stats then return end
    
    local updateQuery = ''
    local params = {}
    
    if statType == 'solicitation_started' then
        updateQuery = 'UPDATE pimp_statistics SET total_solicitations = total_solicitations + 1, total_spent = total_spent + ?, last_activity = NOW() WHERE citizenid = ?'
        params = {value or 0, citizenid}
    elseif statType == 'solicitation_success' then
        updateQuery = 'UPDATE pimp_statistics SET successful_solicitations = successful_solicitations + 1 WHERE citizenid = ?'
        params = {citizenid}
    elseif statType == 'solicitation_failed' then
        updateQuery = 'UPDATE pimp_statistics SET failed_solicitations = failed_solicitations + 1 WHERE citizenid = ?'
        params = {citizenid}
    elseif statType == 'perfect_match' then
        updateQuery = 'UPDATE pimp_statistics SET perfect_matches = perfect_matches + 1 WHERE citizenid = ?'
        params = {citizenid}
    elseif statType == 'robbed' then
        updateQuery = 'UPDATE pimp_statistics SET times_robbed = times_robbed + 1 WHERE citizenid = ?'
        params = {citizenid}
    elseif statType == 'update_multiplier' then
        updateQuery = 'UPDATE pimp_statistics SET current_multiplier = ?, highest_multiplier = GREATEST(highest_multiplier, ?) WHERE citizenid = ?'
        params = {value, value, citizenid}
    end
    
    if updateQuery ~= '' then
        MySQL.update.await(updateQuery, params)
    end
    
    -- Update total reputation and active relationships
    local relationships = MySQL.query.await(
        'SELECT COUNT(*) as count, SUM(reputation) as total_rep FROM pimp_relationships WHERE citizenid = ? AND reputation > 0',
        {citizenid}
    )
    
    if relationships and relationships[1] then
        MySQL.update.await(
            'UPDATE pimp_statistics SET active_relationships = ?, total_reputation = ? WHERE citizenid = ?',
            {relationships[1].count or 0, relationships[1].total_rep or 0, citizenid}
        )
    end
end

-- Callbacks
QBCore.Functions.CreateCallback('NS-PickUp:server:checkcash', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local playercash = Player.PlayerData.money.cash
    return cb(playercash) 
end)

QBCore.Functions.CreateCallback('NS-PickUp:server:GetRelationshipData', function(source, cb, prostituteModel)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return cb(nil) end
    
    local relationship = GetOrCreateRelationship(Player.PlayerData.citizenid, prostituteModel)
    
    if relationship then
        -- Check for decay
        local decayAmount = CheckReputationDecay(Player.PlayerData.citizenid, prostituteModel)
        
        if decayAmount > 0 then
            -- Refresh relationship data after decay
            relationship = MySQL.query.await(
                'SELECT * FROM pimp_relationships WHERE citizenid = ? AND prostitute_model = ?',
                {Player.PlayerData.citizenid, prostituteModel}
            )[1]
        end
        
        local prostituteData = GetProstituteData(prostituteModel)
        
        cb({
            relationship = relationship,
            prostitute = prostituteData,
            decayAmount = decayAmount
        })
    else
        cb(nil)
    end
end)

QBCore.Functions.CreateCallback('NS-PickUp:server:GetPimpAppData', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return cb(nil) end
    
    local citizenid = Player.PlayerData.citizenid
    
    -- Get all relationships
    local relationships = MySQL.query.await(
        'SELECT * FROM pimp_relationships WHERE citizenid = ? ORDER BY reputation DESC',
        {citizenid}
    )
    
    -- Get statistics
    local statistics = GetOrCreateStatistics(citizenid)
    
    -- Get leaderboard
    local leaderboard = MySQL.query.await(
        'SELECT ps.citizenid, ps.current_multiplier, ps.active_relationships FROM pimp_statistics ps ORDER BY ps.current_multiplier DESC LIMIT 10',
        {}
    )
    
    -- Enrich leaderboard with player names
    if leaderboard then
        for i, entry in ipairs(leaderboard) do
            local targetPlayer = QBCore.Functions.GetPlayerByCitizenId(entry.citizenid)
            if targetPlayer then
                entry.name = targetPlayer.PlayerData.charinfo.firstname .. ' ' .. targetPlayer.PlayerData.charinfo.lastname
            else
                local offlinePlayer = QBCore.Functions.GetOfflinePlayerByCitizenId(entry.citizenid)
                if offlinePlayer then
                    entry.name = offlinePlayer.PlayerData.charinfo.firstname .. ' ' .. offlinePlayer.PlayerData.charinfo.lastname
                else
                    entry.name = 'Unknown'
                end
            end
            entry.isYou = (entry.citizenid == citizenid)
        end
    end
    
    -- Enrich relationships with prostitute data
    if relationships then
        for i, rel in ipairs(relationships) do
            local prostituteData = GetProstituteData(rel.prostitute_model)
            if prostituteData then
                rel.nickname = prostituteData.nickname
                rel.personality = prostituteData.personality
            end
        end
    end
    
    -- Calculate total multiplier
    local baseMultiplier = Player.PlayerData.metadata.pimpmultiplier or 1.0
    local relationshipBonus = CalculateTotalRelationshipBonus(citizenid)
    local totalMultiplier = baseMultiplier + relationshipBonus
    
    cb({
        multiplier = totalMultiplier,
        baseMultiplier = baseMultiplier,
        relationshipBonus = relationshipBonus,
        maxMultiplier = Config.MaxTotalMultiplier,
        relationships = relationships or {},
        statistics = statistics,
        leaderboard = leaderboard or {}
    })
end)

-- Events
RegisterNetEvent('NS-PickUp:server:giveStolenMoney', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local robbedAmount = amount
    Player.Functions.AddMoney('cash', robbedAmount, 'NS-PickUp:server:giveStolenMoney')
    TriggerClientEvent('NS-PickUp:client:refreshSolicitation', src)
end)

RegisterNetEvent('NS-PickUp:server:setMyData', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        if Config.Debug then
            print(Player.PlayerData.metadata['pimpmultiplier'])
        end
        
        local success = MySQL.prepare.await('SELECT `multiplier` FROM `pimp_multipliers` where `citizenid` = ?', { Player.PlayerData.citizenid })
        if success then
            Player.PlayerData.metadata['pimpmultiplier'] = round(success,-2)
            Player.Functions.SetMetaData('pimpmultiplier', round(success,-2))
        else
            Player.PlayerData.metadata['pimpmultiplier'] = 1.0
            Player.Functions.SetMetaData('pimpmultiplier', 1.0)
        end
        
        -- Initialize statistics
        GetOrCreateStatistics(Player.PlayerData.citizenid)
        
        -- Calculate total multiplier with relationships
        local relationshipBonus = CalculateTotalRelationshipBonus(Player.PlayerData.citizenid)
        local totalMultiplier = Player.PlayerData.metadata['pimpmultiplier'] + relationshipBonus
        
        TriggerClientEvent('QBCore:Notify', src, 'Total Multiplier: '..string.format("%.2f", totalMultiplier)..'x (Base: '..string.format("%.2f", Player.PlayerData.metadata['pimpmultiplier'])..'x + Relationships: '..string.format("%.2f", relationshipBonus)..'x)', 'success')
        TriggerClientEvent('NS-PickUp:client:setMyMultiplier', src, Player.PlayerData.metadata['pimpmultiplier'])
    else
        return
    end
end)

RegisterNetEvent('NS-PickUp:server:Solicit', function(price, pedModel)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player.PlayerData.money.cash > price then
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.offer_accepted'), 'success')
        Player.Functions.RemoveMoney('cash', price, 'NS-PickUp:server:Solicit')
        
        -- Update statistics
        UpdateStatistics(Player.PlayerData.citizenid, 'solicitation_started', price)
        
        -- Check for decay if pedModel is provided
        if pedModel then
            local decayAmount = CheckReputationDecay(Player.PlayerData.citizenid, pedModel)
            if decayAmount > 0 then
                local prostituteData = GetProstituteData(pedModel)
                local prostituteName = prostituteData and prostituteData.name or "Unknown"
                TriggerClientEvent('QBCore:Notify', src, 
                    'Your relationship with ' .. prostituteName .. ' has degraded by ' .. decayAmount .. ' points', 
                    'error')
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'Not enough Money', 'error')
        TriggerClientEvent('NS-PickUp:client:refreshSolicitation', src)
    end
end)

RegisterNetEvent('NS-PickUp:server:ProcessInteraction', function(pedModel, matchResults, price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
    local citizenid = Player.PlayerData.citizenid
    local prostituteData = GetProstituteData(pedModel)
    
    if not prostituteData then
        if Config.Debug then
            print('Invalid prostitute model: ' .. tostring(pedModel))
        end
        return
    end
    
    -- Calculate reputation gain
    local repGain = 0
    local matchCount = 0
    local perfectMatch = true
    
    for i = 1, #matchResults do
        if matchResults[i].matched then
            repGain = repGain + Config.ReputationGain.successful_interaction
            matchCount = matchCount + 1
        else
            perfectMatch = false
            repGain = repGain + Config.ReputationLoss.failed_interaction
        end
    end
    
    if perfectMatch then
        repGain = repGain + Config.ReputationGain.perfect_match
        UpdateStatistics(citizenid, 'perfect_match')
    end
    
    if price >= Config.MaximumSalePrice * 0.8 then
        repGain = repGain + Config.ReputationGain.expensive_service
    end
    
    -- Update relationship
    local wasSuccessful = matchCount >= 2
    local relationshipUpdate = UpdateRelationship(citizenid, pedModel, repGain, wasSuccessful)
    
    if wasSuccessful then
        UpdateStatistics(citizenid, 'solicitation_success')
    else
        UpdateStatistics(citizenid, 'solicitation_failed')
    end
    
    -- Update base multiplier (existing system)
    local baseMultiplierGain = matchCount * 0.1
    local currentBaseMultiplier = Player.PlayerData.metadata.pimpmultiplier or 1.0
    local newBaseMultiplier = math.min(currentBaseMultiplier + baseMultiplierGain, Config.MaxMultiplier)
    
    Player.Functions.SetMetaData('pimpmultiplier', newBaseMultiplier)
    
    -- Update multiplier in database
    local PlayerDatas = MySQL.prepare.await('SELECT * FROM `pimp_multipliers` where `citizenid` = ?', { citizenid })
    if not PlayerDatas then
        MySQL.insert.await('INSERT INTO `pimp_multipliers` (citizenid,multiplier,iscop) VALUES (?,?,?)', { citizenid, newBaseMultiplier, false })
    else
        MySQL.update.await('UPDATE `pimp_multipliers` SET `multiplier` = ? WHERE citizenid = ?', { newBaseMultiplier, citizenid })
    end
    
    -- Calculate total multiplier
    local relationshipBonus = CalculateTotalRelationshipBonus(citizenid)
    local totalMultiplier = newBaseMultiplier + relationshipBonus
    
    -- Update statistics with new multiplier
    UpdateStatistics(citizenid, 'update_multiplier', totalMultiplier)
    
    -- Send detailed notification
    if relationshipUpdate then
        local tierChanged = relationshipUpdate.tier ~= relationshipUpdate.oldTier
        
        TriggerClientEvent('QBCore:Notify', src, 
            prostituteData.name .. ': ' .. (repGain >= 0 and '+' or '') .. repGain .. ' rep | ' ..
            relationshipUpdate.status .. ' (Tier ' .. relationshipUpdate.tier .. ')', 
            repGain >= 0 and 'success' or 'error')
        
        Wait(1000)
        
        TriggerClientEvent('QBCore:Notify', src, 
            'Base Multiplier: ' .. string.format("%.2f", newBaseMultiplier) .. 'x (+' .. string.format("%.2f", baseMultiplierGain) .. 'x) | ' ..
            'Relationship Bonus: +' .. string.format("%.2f", relationshipBonus) .. 'x', 
            'success')
        
        Wait(1000)
        
        TriggerClientEvent('QBCore:Notify', src, 
            'Total Multiplier: ' .. string.format("%.2f", totalMultiplier) .. 'x / ' .. Config.MaxTotalMultiplier .. 'x', 
            'success')
    end
end)

RegisterNetEvent('NS-PickUp:server:robSolicitor', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveMoney('cash', amount, 'NS-PickUp:server:robSolicitor')
    UpdateStatistics(Player.PlayerData.citizenid, 'robbed')
    TriggerClientEvent('NS-PickUp:client:refreshSolicitation', src)
end)

RegisterNetEvent('NS-PickUp:server:addMultiplier', function(amount, isCop, reward)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetMetaData('pimpmultiplier', amount)
    
    if isCop then
        exports['sayer-gangs']:AddZoneRep(src,'investigating')
        local PlayerDatas = MySQL.prepare.await('SELECT * FROM `pimp_multipliers` where `citizenid` = ?', { Player.PlayerData.citizenid })
        if not PlayerDatas then
            MySQL.insert.await('INSERT INTO `pimp_multipliers` (citizenid,multiplier,iscop) VALUES (?,?,?)', { Player.PlayerData.citizenid, amount, isCop })
        else
            MySQL.update.await('UPDATE `pimp_multipliers` SET `multiplier` = ? WHERE citizenid = ?', { amount, Player.PlayerData.citizenid })
        end
        
        local CrimPlayers = MySQL.query.await('SELECT `citizenid` FROM `pimp_multipliers` where `iscop` = ?', { not isCop })
        
        if CrimPlayers and reward >= 2 then
            local caughtPlayer = CrimPlayers[math.random(#CrimPlayers)]
            if caughtPlayer == nil then
                caughtPlayer = CrimPlayers
            end
            local thisPlayer = QBCore.Functions.GetOfflinePlayerByCitizenId(caughtPlayer)
            if thisPlayer == nil then
                thisPlayer = QBCore.Functions.GetPlayerByCitizenId(caughtPlayer)
            end
            
            if thisPlayer then
                local reasons = 'Pimping and Pandering'
                local warrantType = 'Arrest&Jail'
                local licenseTable = thisPlayer.PlayerData.metadata['licences']
                if licenseTable['warrant'] then
                    TriggerClientEvent('QBCore:Notify', src, 'Player already has a warrant', 'error')
                    return
                end
                thisPlayer.PlayerData.metadata['licences']['warrant'] = true
                
                TriggerClientEvent('QBCore:Notify', src, 'Warrant Granted', 'success')
                local info = {}
                if thisPlayer.PlayerData.citizenid then 
                    info.citizenid = thisPlayer.PlayerData.citizenid
                    info.firstname = thisPlayer.PlayerData.charinfo.firstname
                    info.lastname = thisPlayer.PlayerData.charinfo.lastname
                    info.birthdate = thisPlayer.PlayerData.charinfo.birthdate
                    info.gender = thisPlayer.PlayerData.charinfo.gender
                    info.nationality = thisPlayer.PlayerData.charinfo.nationality
                    info.type = tostring(warrantType)..' Warrant'
                    info.reason = tostring(reasons)
                    exports['qb-inventory']:AddItem(src, 'warrant', 1, false, info, 'qb-police:writeWarrant')
                    TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['warrant'], 'add')
                end
                thisPlayer.PlayerData.metadata['pimpmultiplier'] = 1.0
                MySQL.update.await('UPDATE `pimp_multipliers` SET `multiplier` = ? WHERE citizenid = ?', { 1.0, thisPlayer.PlayerData.citizenid })
                Wait(5000)
                MySQL.rawExecute.await('DELETE FROM `pimp_multipliers` WHERE citizenid = ?', { thisPlayer.PlayerData.citizenid })
                TriggerClientEvent('QBCore:Notify', src, thisPlayer.PlayerData.citizenid..' was reset to '.. thisPlayer.PlayerData.metadata['pimpmultiplier'] , 'success')
            else
                print("An error occurred getting the playerdata")
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'There are no pimps in this city', 'warning')
        end
    else
        exports['sayer-gangs']:AddZoneRep(src,'pimping')
        local PlayerDatas = MySQL.prepare.await('SELECT * FROM `pimp_multipliers` where `citizenid` = ?', { Player.PlayerData.citizenid })
        if not PlayerDatas then
            MySQL.insert.await('INSERT INTO `pimp_multipliers` (citizenid,multiplier,iscop) VALUES (?,?,?)', { Player.PlayerData.citizenid, amount, isCop })
        else
            MySQL.update.await('UPDATE `pimp_multipliers` SET `multiplier` = ? WHERE citizenid = ?', { amount, Player.PlayerData.citizenid })
        end
        
        local CopPlayers = MySQL.query.await('SELECT `citizenid` FROM `pimp_multipliers` where `iscop` = ?', { not isCop })
        
        if CopPlayers and reward >= 2 then
            local caughtPlayer = CopPlayers[math.random(#CopPlayers)]
            if caughtPlayer == nil then
                caughtPlayer = CopPlayers
            end
            local thisPlayer = QBCore.Functions.GetOfflinePlayerByCitizenId(caughtPlayer)
            if thisPlayer == nil then
                thisPlayer = QBCore.Functions.GetPlayerByCitizenId(caughtPlayer)
            end
            
            if thisPlayer then
                thisPlayer.PlayerData.metadata['pimpmultiplier'] = 1.0
                MySQL.update.await('UPDATE `pimp_multipliers` SET `multiplier` = ? WHERE citizenid = ?', { 1.0, thisPlayer.PlayerData.citizenid })
                Wait(5000)
                TriggerClientEvent('QBCore:Notify', src, thisPlayer.PlayerData.citizenid..' was reset to '.. thisPlayer.PlayerData.metadata['pimpmultiplier'] , 'success')
                MySQL.rawExecute.await('DELETE FROM `pimp_multipliers` WHERE citizenid = ?', { thisPlayer.PlayerData.citizenid })
            else
                print("An error occurred getting the playerdata")
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'There are no investigators active in this city', 'warning')
        end
    end
end)

-- Commands
QBCore.Commands.Add('resetCornerBuying', 'Attempt to fix your Solicitation problem', {}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        TriggerClientEvent('NS-PickUp:client:refreshSolicitation', src)
        TriggerClientEvent('QBCore:Notify', src, 'Successfully Reset Solicitation', 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'Failed to reset Solicitation', 'error')
    end
end)

QBCore.Commands.Add('whatsMyMultiplier', 'Check your pay Multiplier', {}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        local baseMultiplier = Player.PlayerData.metadata['pimpmultiplier'] or 1.0
        local relationshipBonus = CalculateTotalRelationshipBonus(Player.PlayerData.citizenid)
        local totalMultiplier = baseMultiplier + relationshipBonus
        
        TriggerClientEvent('QBCore:Notify', src, 
            'Total: '..string.format("%.2f", totalMultiplier)..'x | Base: '..string.format("%.2f", baseMultiplier)..'x | Relationships: +'..string.format("%.2f", relationshipBonus)..'x', 
            'success')
    else
        return
    end
end)

QBCore.Commands.Add('setplayermultiplier', 'set a pay Multiplier', {{ name = 'targetid', help = 'Target Player CivID' }, { name = 'XP', help = 'Desired Level: [1.0] [1.1] [1.2] [1.3]' }}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        local thisPlayer = QBCore.Functions.GetOfflinePlayerByCitizenId(args[1])
        if thisPlayer == nil then
            thisPlayer = QBCore.Functions.GetPlayerByCitizenId(args[1])
        end
        
        if thisPlayer then
            thisPlayer.PlayerData.metadata['pimpmultiplier'] = tonumber(args[2])
            MySQL.update.await('UPDATE `pimp_multipliers` SET `multiplier` = ? WHERE citizenid = ?', { tonumber(args[2]), thisPlayer.PlayerData.citizenid })
            Wait(5000)
            TriggerClientEvent('QBCore:Notify', src, thisPlayer.PlayerData.citizenid..' was set to '.. thisPlayer.PlayerData.metadata['pimpmultiplier'] , 'success')
        else
            print("An error occurred getting the playerdata")
        end
    else
        return
    end
end, 'admin')