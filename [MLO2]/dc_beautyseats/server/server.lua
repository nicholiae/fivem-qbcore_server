local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('salon:server:getPlayer', function(_, cb, playerId)
	
    local Player = QBCore.Functions.GetPlayer(playerId)
    cb(Player)
end)