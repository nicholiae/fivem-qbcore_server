QBCore = exports['qb-core']:GetCoreObject()

-- This function will return the player's identifier (identifier or id)
function getIdentifier(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)
	
    if xPlayer then
        return xPlayer.PlayerData.citizenid
    end
end

-- Here you define the function that takes the name of the player
function getName(source)
	local xPlayer = QBCore.Functions.GetPlayer(source)
    if xPlayer then
        name = xPlayer.PlayerData.charinfo.firstname .. ' ' .. xPlayer.PlayerData.charinfo.lastname
    end

    return name
end

function isDead(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        isdead = Player.PlayerData.metadata['isdead']
    end

    return isdead
end

-- MYSQL FUNCTIONS ------
CreateThread(function()
	MySQL.Async.execute("CREATE TABLE IF NOT EXISTS leaderboard (id int AUTO_INCREMENT, identifier text, name varchar(100), kills int, deaths int, score int, PRIMARY KEY(id))", {},
	function()
		MySQL.Async.fetchAll("SELECT * FROM leaderboard", {}, function(result) players = result end)
	end)
end)

function updateBoard(identifier, kills, deaths, score)
    MySQL.Async.execute("UPDATE leaderboard SET kills = :kills, deaths = :deaths, score = :score WHERE identifier = :identifier", {
        kills = kills,
        deaths = deaths,
        score = score,
        identifier = identifier,
    }, function() end)
end

function insertBoard(identifier, name, kills, deaths, score)
    MySQL.Async.execute("INSERT INTO leaderboard (identifier, name, kills, deaths, score) VALUES (:identifier, :name, :kills, :deaths, :score)", {
        identifier = identifier,
        name = name,
        kills = kills,
        deaths = deaths,
        score = score,
    }, function() end)
end