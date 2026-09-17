local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("qb-clothing:server:chargeforsurgeon", function()

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	
	if Player.Functions.RemoveMoney('cash', 25000, 'Surgeon') then
		exports['qb-banking']:AddMoney('beauty', 25000, 'Surgeon')
		TriggerClientEvent('QBCore:Notify', src, 'Paid with Cash', 'primary')
	elseif Player.Functions.RemoveMoney('bank', 25000, 'Surgeon') then
		exports['qb-banking']:AddMoney('beauty', 25000, 'Surgeon')
		TriggerClientEvent('QBCore:Notify', src, 'Paid with Bank', 'primary')
	else
		TriggerClientEvent('QBCore:Notify', src, 'Not Enough Funds', 'error')
	end
	
end)

RegisterServerEvent("qb-clothing:saveSkin", function(model, skin)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if model ~= nil and skin ~= nil then
        MySQL.query('DELETE FROM playerskins WHERE citizenid = ?', { Player.PlayerData.citizenid }, function()
            MySQL.insert('INSERT INTO playerskins (citizenid, model, skin, active) VALUES (?, ?, ?, ?)', {
                Player.PlayerData.citizenid,
                model,
                skin,
                1
            })
        end)
        
        -- Broadcast the clothing change to nearby players
        -- TriggerEvent("qb-clothing:server:syncOutfitToNearby", model, skin)
    end
end)

RegisterServerEvent("qb-clothes:loadPlayerSkin", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local result = MySQL.query.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', { Player.PlayerData.citizenid, 1 })
    
    if result[1] ~= nil then
        -- Load skin for the spawning player
        TriggerClientEvent("qb-clothes:loadSkin", src, false, result[1].model, result[1].skin)
        
        -- Broadcast clothing to all nearby players
        local playerPed = GetPlayerPed(src)
        if playerPed and playerPed ~= 0 then
            local playerCoords = GetEntityCoords(playerPed)
            local players = QBCore.Functions.GetPlayers()
            
            for _, playerId in pairs(players) do
                if playerId ~= src then
                    local targetPed = GetPlayerPed(playerId)
                    if targetPed and targetPed ~= 0 then
                        local targetCoords = GetEntityCoords(targetPed)
                        local distance = #(playerCoords - targetCoords)
                        
                        -- Only sync to players within 100 units
                        -- if distance < 100.0 then
                            -- TriggerClientEvent("qb-clothing:client:syncPlayerClothing", playerId, src, result[1].model, result[1].skin)
                        -- end
                    end
                end
            end
        end
    else
        TriggerClientEvent("qb-clothes:loadSkin", src, true)
    end
end)

RegisterServerEvent("qb-clothes:saveOutfit", function(outfitName, model, skinData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	
	if Player.Functions.RemoveMoney('cash', 500, 'Clothes') then
		exports['qb-banking']:AddMoney('beauty', 500, 'Clothes')
		TriggerClientEvent('QBCore:Notify', src, 'Paid with Cash', 'primary')
	elseif Player.Functions.RemoveMoney('bank', 500, 'Clothes') then
		exports['qb-banking']:AddMoney('beauty', 500, 'Clothes')
		TriggerClientEvent('QBCore:Notify', src, 'Paid with Bank', 'primary')
	else
		TriggerClientEvent('QBCore:Notify', src, 'Not Enough Funds', 'error')
	end
	
    if model ~= nil and skinData ~= nil then
        local outfitId = "outfit-"..math.random(1, 10).."-"..math.random(1111, 9999)
        MySQL.insert('INSERT INTO player_outfits (citizenid, outfitname, model, skin, outfitId) VALUES (?, ?, ?, ?, ?)', {
            Player.PlayerData.citizenid,
            outfitName,
            model,
            json.encode(skinData),
            outfitId
        }, function()
            local result = MySQL.query.await('SELECT * FROM player_outfits WHERE citizenid = ?', { Player.PlayerData.citizenid })
            if result[1] ~= nil then
                TriggerClientEvent('qb-clothing:client:reloadOutfits', src, result)
            else
                TriggerClientEvent('qb-clothing:client:reloadOutfits', src, nil)
            end
        end)
    end
end)

RegisterServerEvent("qb-clothing:server:removeOutfit", function(outfitName, outfitId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    MySQL.query('DELETE FROM player_outfits WHERE citizenid = ? AND outfitname = ? AND outfitId = ?', {
        Player.PlayerData.citizenid,
        outfitName,
        outfitId
    }, function()
        local result = MySQL.query.await('SELECT * FROM player_outfits WHERE citizenid = ?', { Player.PlayerData.citizenid })
        if result[1] ~= nil then
            TriggerClientEvent('qb-clothing:client:reloadOutfits', src, result)
        else
            TriggerClientEvent('qb-clothing:client:reloadOutfits', src, nil)
        end
    end)
end)

QBCore.Functions.CreateCallback('qb-clothing:server:getOutfits', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local anusVal = {}

    local result = MySQL.query.await('SELECT * FROM player_outfits WHERE citizenid = ?', { Player.PlayerData.citizenid })
    if result[1] ~= nil then
        for k, v in pairs(result) do
            result[k].skin = json.decode(result[k].skin)
            anusVal[k] = v
        end
        cb(anusVal)
    end
    cb(anusVal)
end)

-- Sync outfit changes to nearby players
RegisterServerEvent("qb-clothing:server:syncOutfitToNearby", function(model, skinData)
    local src = source
    local playerPed = GetPlayerPed(src)
    
    if not playerPed or playerPed == 0 then return end
    
    local playerCoords = GetEntityCoords(playerPed)
    local players = QBCore.Functions.GetPlayers()
    
   
end)

-- Handle clothing refresh requests
RegisterServerEvent('qb-clothing:server:requestPlayerClothing', function(targetSource)
    local src = source
    local Player = QBCore.Functions.GetPlayer(targetSource)
    
    if not Player then return end
    
    local result = MySQL.query.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', { Player.PlayerData.citizenid, 1 })
    
    if result[1] ~= nil then
        -- TriggerClientEvent("qb-clothing:client:syncPlayerClothing", src, targetSource, result[1].model, result[1].skin)
    end
end)