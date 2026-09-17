QBCore = exports['qb-core']:GetCoreObject()
local StolenDrugs = {}


-- Functions

local function getPlayerAndCitizenId(playerId)
    local Player = QBCore.Functions.GetPlayer(playerId)
    if not Player then return nil, nil end
    return Player, Player.PlayerData.citizenid
end

RegisterNetEvent('NS-StreetTricks:server:sellCornerTrick', function( price )
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, Lang:t('success.offer_accepted'), 'success')
    Player.Functions.AddMoney('cash', price, 'NS-StreetTricks:server:sellCornerTrick')
    TriggerClientEvent('NS-StreetTricks:client:refreshTricks', src)
end)

RegisterNetEvent('NS-StreetTricks:server:robTheHoe', function( moneyrobbed )
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveMoney('cash', moneyrobbed, 'NS-StreetTricks:server:robTheHoe')
    TriggerClientEvent('NS-StreetTricks:client:refreshTricks', src)
end)

RegisterNetEvent('NS-StreetTricks:server:giveStolenMoney', function( money )
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local robbedAmount = money
    Player.Functions.AddMoney('cash', robbedAmount, 'NS-StreetTricks:server:giveStolenMoney')
    TriggerClientEvent('NS-StreetTricks:client:refreshTricks', src)
end)


QBCore.Functions.CreateCallback('NS-StreetTricks:server:checkcash', function(source, cb)
    local src = source
    local Player, citizenid = getPlayerAndCitizenId(src)
	playercash = Player.PlayerData.money.cash
	return cb(playercash) 
	
end)


--- deprecated 
-- QBCore.Functions.CreateCallback('NS-StreetTricks:server:canWeCrime', function(source, cb)
    -- local src = source
    -- local Player, citizenid = getPlayerAndCitizenId(src)
	-- local owner = exports['sayer-gangs']:GetZoneOwnerWithCID(citizenid, cb)
	-- if owner == nil then
		-- Wait(3000)
		-- owner = exports['sayer-gangs']:GetZoneOwnerWithCID(citizenid, cb)
	-- end
	
	-- return cb(owner)
	
-- end)
