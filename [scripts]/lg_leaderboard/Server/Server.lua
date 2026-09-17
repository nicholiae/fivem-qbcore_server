players = {}

RegisterCommand(Config.command_open, function(source, args)
	local identifier = getIdentifier(source)
	local found = false
	local player = {}
	
	for i,k in pairs(players) do
		if(k.identifier == identifier) then
			player = k
			player.position = getPosition(player.score)
			found = true
			break
		end
	end

	if not found then
		player = {
			name = getName(source),
			kills = 0,
			deaths = 0,
			score = 0,
			position = #players + 1
		}
	end

	TriggerClientEvent('lg_leaderboard:Open', source, player, players)
end)

RegisterNetEvent('lg_leaderboard:UpdateBoard')
AddEventHandler('lg_leaderboard:UpdateBoard', function(sourceKiller)
	local sourceVictim = source
	local identifierVictim = getIdentifier(sourceVictim)
	local identifierKiller = getIdentifier(sourceKiller)

	if(identifierKiller == identifierVictim) then
		return
	end

    if not isDead(sourceVictim) then
        return
    end    

	local foundKiller = false
	local foundVictim = false

	for i,k in pairs(players) do
		if k.identifier == identifierKiller then
			k.kills = tonumber(k.kills) + 1

			if canUpdateScore(tonumber(k.score)) then
				k.score = tonumber(k.score) + Config.kill_score
			else
				k.score = getMaxScore()
			end

			updateBoard(identifierKiller, k.kills, k.deaths, k.score)

			foundKiller = true
		elseif k.identifier == identifierVictim then
			k.deaths = tonumber(k.deaths) + 1
			
			if(k.score - Config.death_score >= 0) then
				k.score = tonumber(k.score) - Config.death_score
			end

			updateBoard(identifierVictim, k.kills, k.deaths, k.score)

			foundVictim = true
		end
	end

	if not foundKiller then
		table.insert(players, {
			identifier = identifierKiller,
			name = getName(sourceKiller),
			kills = 1,
			deaths = 0,
			score = Config.kill_score,
		})

		insertBoard(identifierKiller, getName(sourceKiller), 1, 0, Config.kill_score)
	end

	if not foundVictim then
		table.insert(players, {
			identifier = identifierVictim,
			name = getName(sourceVictim),
			kills = 0,
			deaths = 1,
			score = 0,
		})

		insertBoard(identifierVictim, getName(sourceVictim), 0, 1, 0)
	end
	

end)

function getPosition(score)
	local position = 1
	for i,k in pairs(players) do
		if score < k.score then
			position = position + 1
		end
	end

	return position
end

function canUpdateScore(score)
	for i,k in pairs(ranks) do
		if (score + Config.kill_score) < k.max_score then
			return true
		end
	end

	return false
end

function getMaxScore()
	local max = 0
	for i,k in pairs(ranks) do
		if k.max_score > max then
			max = k.max_score
		end
	end

	return max
end