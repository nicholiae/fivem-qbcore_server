local QBCore = exports['qb-core']:GetCoreObject()
local houseowneridentifier = {}
local houseownercid = {}
local housekeyholders = {}
local createdHousesCount = 0
local createdHousesPlayers = {}
local housesLoaded = false


local function triggerTheCount(player)
	local p = player
	if createdHousesPlayers[p] then
		createdHousesCount = createdHousesPlayers[p] + 1
	else
		createdHousesCount += 1
	end
	createdHousesPlayers[p] = createdHousesCount
	createdHousesCount = 0
	if createdHousesPlayers[p] > 3 then
		local reason = 'Realestate Housing Spam'
		TriggerEvent('qb-log:server:CreateLog', 'bans', 'Player Kicked', 'red', string.format('%s was kicked by %s for %s', GetPlayerName(p), 'ACS', reason), true)
		DropPlayer(src, 'You have been kicked from the server\n' .. reason .. '\n\n 🔸 Check our Discord for more information: ' .. QBCore.Config.Server.Discord)
		createdHousesPlayers[p] = 0
	end
end

CreateThread(function()
	while true do
		if #createdHousesPlayers < 0 then
			for _,v in pairs(createdHousesPlayers) do
				local k = 0
				k = v - 1
				createdHousesPlayers[_] = k
				-- print(_)
				-- print(createdHousesPlayers[_])
				-- print(v)
				-- print(k)
			end
			Wait(1800000) -- 30 minutes
		else
			Wait(10000)
		end
	end
end)


-- Threads

CreateThread(function()
    local HouseGarages = {}
    local result = MySQL.query.await('SELECT * FROM houselocations', {})
    if result[1] then
        for _, v in pairs(result) do
            local owned = false
            if tonumber(v.owned) == 1 then
                owned = true
            end
            local garage = json.decode(v.garage) or {}
            Config.Houses[v.name] = {
                coords = json.decode(v.coords),
                owned = owned,
                price = v.price,
                locked = true,
                adress = v.label,
                tier = v.tier,
                garage = garage,
                decorations = {}
            }
            HouseGarages[v.name] = {
                label = v.label,
                takeVehicle = garage
            }
        end
    end
    TriggerClientEvent('qb-garages:client:houseGarageConfig', -1, HouseGarages)
    TriggerClientEvent('qb-houses:client:setHouseConfig', -1, Config.Houses)
end)

CreateThread(function()
    while true do
        if not housesLoaded then
            MySQL.query('SELECT * FROM player_houses', {}, function(houses)
                if houses then
                    for _, house in pairs(houses) do
                        houseowneridentifier[house.house] = house.identifier
                        houseownercid[house.house] = house.citizenid
                        housekeyholders[house.house] = json.decode(house.keyholders)
                    end
                end
            end)
            housesLoaded = true
        end
        Wait(7)
    end
end)

-- Commands

-- QBCore.Commands.Add('decorate', Lang:t('info.decorate_interior'), {}, false, function(source)
    -- local src = source
    -- TriggerClientEvent('qb-houses:client:decorate', src)
-- end)
QBCore.Commands.Add('refreshplayerhousing', 'Refresh Player Housing', {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-houses:client:setupHouseBlips2', src)
end)

QBCore.Commands.Add('createhouse', Lang:t('info.create_house'), { { name = 'price', help = Lang:t('info.price_of_house') }, { name = 'tier', help = Lang:t('info.tier_number') } }, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = tonumber(args[1])
    local tier = tonumber(args[2])
    if Player.PlayerData.job.name == 'realestate' then
		triggerTheCount(Player)
		TriggerEvent('qb-log:server:CreateLog', 'realestate', 'Player Created a House', 'green', string.format('%s setup a house[%s] for $%s', (GetPlayerName(src)), tier, price), true)
        TriggerClientEvent('qb-houses:client:createHouses', src, price, tier)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.realestate_only'), 'error')
    end
end)

QBCore.Commands.Add('addgarage', Lang:t('info.add_garage'), {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == 'realestate' then
        TriggerClientEvent('qb-houses:client:addGarage', src)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.realestate_only'), 'error')
    end
end)

QBCore.Commands.Add('ring', Lang:t('info.ring_doorbell'), {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-houses:client:RequestRing', src)
end)

-- Item

QBCore.Functions.CreateUseableItem('police_stormram', function(source, _)
    local Player = QBCore.Functions.GetPlayer(source)
    if (Player.PlayerData.job.name == 'police' and Player.PlayerData.job.onduty) then
        TriggerClientEvent('qb-houses:client:HomeInvasion', source)
    else
        TriggerClientEvent('QBCore:Notify', source, Lang:t('error.emergency_services'), 'error')
    end
end)

-- Functions
local function isHouseOwner(identifier, cid, house)
    if houseowneridentifier[house] and houseownercid[house] then
        if houseowneridentifier[house] == identifier and houseownercid[house] == cid then
            return true
        end
    end
    return false
end

local function hasKey(identifier, cid, house)
    if houseowneridentifier[house] and houseownercid[house] then
        if houseowneridentifier[house] == identifier and houseownercid[house] == cid then
            return true
        else
            if housekeyholders[house] then
                for i = 1, #housekeyholders[house], 1 do
                    if housekeyholders[house][i] == cid then
                        return true
                    end
                end
            end
        end
    end
    return false
end

exports('hasKey', hasKey)

local function GetHouseStreetCount(street)
    local count = 0
    local query = '%' .. street .. '%'
    local result = MySQL.Sync.fetchSingle('SELECT * FROM houselocations WHERE name LIKE ? ORDER BY LENGTH(`name`) desc, `name` DESC', { query })
    if result then
        local houseAddress = result.name
        count = tonumber(string.match(houseAddress, '%d[%d.,]*'))
    end
    return (count + 1)
end

local function isHouseOwned(house)
    local result = MySQL.query.await('SELECT owned FROM houselocations WHERE name = ?', { house })
    if result[1] then
        if result[1].owned == 1 then
            return true
        end
    end
    return false
end

local function escape_sqli(source)
    local replacements = {
        ['"'] = '\\"',
        ["'"] = "\\'"
    }
    return source:gsub("['\"]", replacements)
end

-- Events

RegisterNetEvent('qb-houses:server:setHouses', function()
    local src = source
    TriggerClientEvent('qb-houses:client:setHouseConfig', src, Config.Houses)
end)

RegisterNetEvent('qb-houses:server:sellHouseKey', function(ClosestHouse)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    local houseprice = Config.Houses[ClosestHouse].price * (Config.HouseRelinquish / 100)
    local result = MySQL.query.await('SELECT citizenid FROM player_houses WHERE `house` = ? AND `citizenid` = ?', { ClosestHouse, pData.PlayerData.citizenid })
	-- print('res:'..tostring(result[1].citizenid))
	-- print('ClosestHouse:'..tostring(ClosestHouse))
	-- print('houseprice:'..tostring(houseprice))
	-- print('pname:'..tostring(GetPlayerName(src)))
	-- print('pcid:'..tostring(pData.PlayerData.citizenid))
	if result[1].citizenid == pData.PlayerData.citizenid then
		MySQL.rawExecute.await('DELETE FROM `player_houses` WHERE `house` = ? AND `citizenid` = ?', { ClosestHouse, pData.PlayerData.citizenid })
		MySQL.update('UPDATE houselocations SET owned = ? WHERE name = ?', { 0, ClosestHouse })
		TriggerClientEvent('qb-houses:client:SetClosestHouse', src)
		TriggerClientEvent('qb-house:client:RefreshHouseTargets', src)
		pData.Functions.AddMoney('bank', houseprice, 'sold-house') -- 21% Extra house costs
		TriggerEvent('qb-log:server:CreateLog', 'realestate', 'House Sold', 'blue', Lang:t('log.house_sold_by', { house = ClosestHouse:upper(), price = houseprice, firstname = pData.PlayerData.charinfo.firstname, lastname = pData.PlayerData.charinfo.lastname }))
		TriggerClientEvent('QBCore:Notify', src, Lang:t('success.house_purchased'), 'success', 5000)
	else
		TriggerClientEvent('QBCore:Notify', src, 'You do not own this house', 'warning', 5000)
		Wait(5000)
		local reason = 'Realestate - Attempting to sell house they dont own'
		TriggerEvent('qb-log:server:CreateLog', 'bans', 'Player Kicked Realestate Fraud', 'red', string.format('%s was kicked by %s for %s', GetPlayerName(src), 'ACS', reason), true)
		DropPlayer(src, 'You have been kicked from the server\n' .. reason .. '\n\n 🔸 Check our Discord for more information: ' .. QBCore.Config.Server.Discord)
	end
end)

RegisterNetEvent('qb-houses:server:createBlip', function()
    local src = source
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    TriggerClientEvent('qb-houses:client:createBlip', -1, coords)
end)

RegisterNetEvent('qb-houses:server:addNewHouse', function(street, coords, price, tier)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    street = street:gsub("%'", '')
    price = tonumber(price)
    tier = tonumber(tier)
    local houseCount = GetHouseStreetCount(street)
    local name = street:lower() .. tostring(houseCount)
    local label = street .. ' ' .. tostring(houseCount)
    MySQL.insert('INSERT INTO houselocations (name, label, coords, owned, price, tier) VALUES (?, ?, ?, ?, ?, ?)',
        { name, label, json.encode(coords), 0, price, tier })
    Config.Houses[name] = {
        coords = coords,
        owned = false,
        price = price,
        locked = true,
        adress = label,
        tier = tier,
        garage = {},
        decorations = {}
    }
    local brokerfee = (math.floor(price / 100 * 5))
    TriggerClientEvent('qb-houses:client:setHouseConfig', -1, Config.Houses)
    pData.Functions.AddMoney('bank', brokerfee, 'House-Created')
    TriggerClientEvent('QBCore:Notify', src, Lang:t('info.added_house', { value = label }))
    TriggerEvent('qb-log:server:CreateLog', 'realestate', Lang:t('log.house_created'), 'green', Lang:t('log.house_address', { label = label, price = price, tier = tier, agent = GetPlayerName(src) }))
end)

RegisterNetEvent('qb-houses:server:addGarage', function(house, coords)
    local src = source
    MySQL.update('UPDATE houselocations SET garage = ? WHERE name = ?', { json.encode(coords), house })
    local garageInfo = {
        label = Config.Houses[house].adress,
        takeVehicle = coords
    }
    TriggerClientEvent('qb-garages:client:addHouseGarage', -1, house, garageInfo)
    TriggerClientEvent('QBCore:Notify', src, Lang:t('info.added_garage', { value = garageInfo.label }))
end)

RegisterNetEvent('qb-houses:server:viewHouse', function(house)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    local houseprice = Config.Houses[house].price
    local brokerfee = (houseprice / 100 * 5)
    local bankfee = (houseprice / 100 * 10)
    local taxes = (houseprice / 100 * 6)
    TriggerClientEvent('qb-houses:client:viewHouse', src, houseprice, brokerfee, bankfee, taxes, pData.PlayerData.charinfo.firstname, pData.PlayerData.charinfo.lastname)
end)

RegisterNetEvent('qb-houses:server:openStash', function(CurrentHouse)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local houseData = Config.Houses[CurrentHouse]
    if not houseData then return end
    local houseTier = houseData.tier
    local stashSlots = Config.StashWeights[houseTier].slots
    local stashWeight = Config.StashWeights[houseTier].maxweight
    if stashSlots and stashWeight then
        exports['qb-inventory']:OpenInventory(src, CurrentHouse, {
            maxweight = stashWeight,
            slots = stashSlots,
            label = houseData.adress
        })
    else
        exports['qb-inventory']:OpenInventory(src, CurrentHouse)
		local logMessage = string.format('**%s (citizenid: %s | id: %s)** InvName:%s items in: %s', GetPlayerName(source), Player.PlayerData.citizenid, src, CurrentHouse, "cant display items here")
		TriggerEvent('qb-log:server:CreateLog', 'openinventory', 'Open Stash', 'blue', logMessage)
    end
end)

RegisterNetEvent('qb-houses:server:buyHouse', function(house)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    local price = Config.Houses[house].price
    local HousePrice = math.ceil(price * 1.21)
    local bankBalance = pData.PlayerData.money['bank']
    local isOwned = isHouseOwned(house)
	
    if isOwned then
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.already_owned'), 'error')
        CancelEvent()
        return
    end

    if (bankBalance >= HousePrice) then
        houseowneridentifier[house] = pData.PlayerData.license
        houseownercid[house] = pData.PlayerData.citizenid
        housekeyholders[house] = {
            [1] = pData.PlayerData.citizenid
        }
        MySQL.insert('INSERT INTO player_houses (house, identifier, citizenid, keyholders) VALUES (?, ?, ?, ?)', { house, pData.PlayerData.license, pData.PlayerData.citizenid, json.encode(housekeyholders[house]) })
        MySQL.update('UPDATE houselocations SET owned = ? WHERE name = ?', { 1, house })
        TriggerClientEvent('qb-houses:client:SetClosestHouse', src)
        TriggerClientEvent('qb-house:client:RefreshHouseTargets', src)
        pData.Functions.RemoveMoney('bank', HousePrice, 'bought-house') -- 21% Extra house costs
        exports['qb-banking']:AddMoney('realestate', (HousePrice / 100) * math.random(18, 25), 'House purchase')
        TriggerEvent('qb-log:server:CreateLog', 'realestate', Lang:t('log.house_purchased'), 'green', Lang:t('log.house_purchased_by', { house = house:upper(), price = HousePrice, firstname = pData.PlayerData.charinfo.firstname, lastname = pData.PlayerData.charinfo.lastname }))
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.house_purchased'), 'success', 5000)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_enough_money'), 'error')
    end
end)

RegisterNetEvent('qb-houses:server:lockHouse', function(bool, house)
    TriggerClientEvent('qb-houses:client:lockHouse', -1, bool, house)
end)

RegisterNetEvent('qb-houses:server:SetRamState', function(bool, house)
    Config.Houses[house].IsRaming = bool
    TriggerClientEvent('qb-houses:server:SetRamState', -1, bool, house)
end)

RegisterNetEvent('qb-houses:server:giveKey', function(house, target)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local pData = QBCore.Functions.GetPlayer(target)
    if not Player or not pData then return end
    if not isHouseOwner(Player.PlayerData.license, Player.PlayerData.citizenid, house) then
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_owner'), 'error')
        return
    end
    housekeyholders[house][#housekeyholders[house] + 1] = pData.PlayerData.citizenid
    MySQL.update('UPDATE player_houses SET keyholders = ? WHERE house = ?',
        { json.encode(housekeyholders[house]), house })
end)

RegisterNetEvent('qb-houses:server:removeHouseKey', function(house, citizenData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if not isHouseOwner(Player.PlayerData.license, Player.PlayerData.citizenid, house) then
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_owner'), 'error')
        return
    end
    local newHolders = {}
    if housekeyholders[house] then
        for k, _ in pairs(housekeyholders[house]) do
            if housekeyholders[house][k] ~= citizenData.citizenid then
                newHolders[#newHolders + 1] = housekeyholders[house][k]
            end
        end
    end
    housekeyholders[house] = newHolders
    TriggerClientEvent('QBCore:Notify', src, Lang:t('error.remove_key_from', { firstname = citizenData.firstname, lastname = citizenData.lastname }), 'error')
    MySQL.update('UPDATE player_houses SET keyholders = ? WHERE house = ?', { json.encode(housekeyholders[house]), house })
end)

RegisterNetEvent('qb-houses:server:OpenDoor', function(target, house)
    local OtherPlayer = QBCore.Functions.GetPlayer(target)
    if OtherPlayer then
        TriggerClientEvent('qb-houses:client:SpawnInApartment', OtherPlayer.PlayerData.source, house)
    end
end)

RegisterNetEvent('qb-houses:server:RingDoor', function(house)
    local src = source
    TriggerClientEvent('qb-houses:client:RingDoor', -1, src, house)
end)

RegisterNetEvent('qb-houses:server:savedecorations', function(house, decorations)
    MySQL.update('UPDATE player_houses SET decorations = ? WHERE house = ?', { json.encode(decorations), house })
    TriggerClientEvent('qb-houses:server:sethousedecorations', -1, house, decorations)
end)

RegisterNetEvent('qb-houses:server:LogoutLocation', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local MyItems = Player.PlayerData.items
    MySQL.update('UPDATE players SET inventory = ? WHERE citizenid = ?',
        { json.encode(MyItems), Player.PlayerData.citizenid })
    QBCore.Player.Logout(src)
    TriggerClientEvent('qb-multicharacter:client:chooseChar', src)
end)

RegisterNetEvent('qb-houses:server:giveHouseKey', function(target, house)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local tPlayer = QBCore.Functions.GetPlayer(target)
    if not tPlayer or not Player then return end
    if not isHouseOwner(Player.PlayerData.license, Player.PlayerData.citizenid, house) then
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_owner'), 'error')
        return
    end
    if housekeyholders[house] then
        for _, cid in pairs(housekeyholders[house]) do
            if cid == tPlayer.PlayerData.citizenid then
                TriggerClientEvent('QBCore:Notify', src, Lang:t('error.already_keys'), 'error', 3500)
                return
            end
        end
        housekeyholders[house][#housekeyholders[house] + 1] = tPlayer.PlayerData.citizenid
        MySQL.update('UPDATE player_houses SET keyholders = ? WHERE house = ?', { json.encode(housekeyholders[house]), house })
        TriggerClientEvent('qb-houses:client:refreshHouse', tPlayer.PlayerData.source)

        TriggerClientEvent('QBCore:Notify', tPlayer.PlayerData.source, Lang:t('success.recieved_key', { value = Config.Houses[house].adress }), 'success', 2500)
    else
        local sourceTarget = QBCore.Functions.GetPlayer(src)
        housekeyholders[house] = {
            [1] = sourceTarget.PlayerData.citizenid
        }
        housekeyholders[house][#housekeyholders[house] + 1] = tPlayer.PlayerData.citizenid
        MySQL.update('UPDATE player_houses SET keyholders = ? WHERE house = ?', { json.encode(housekeyholders[house]), house })
        TriggerClientEvent('qb-houses:client:refreshHouse', tPlayer.PlayerData.source)
        TriggerClientEvent('QBCore:Notify', tPlayer.PlayerData.source, Lang:t('success.recieved_key', { value = Config.Houses[house].adress }), 'success', 2500)
    end
end)

RegisterNetEvent('qb-houses:server:setLocation', function(coords, house, type)
    if type == 1 then
        MySQL.update('UPDATE player_houses SET stash = ? WHERE house = ?', { json.encode(coords), house })
    elseif type == 2 then
        MySQL.update('UPDATE player_houses SET outfit = ? WHERE house = ?', { json.encode(coords), house })
    elseif type == 3 then
        MySQL.update('UPDATE player_houses SET logout = ? WHERE house = ?', { json.encode(coords), house })
    end
    TriggerClientEvent('qb-houses:client:refreshLocations', -1, house, json.encode(coords), type)
end)

RegisterNetEvent('qb-houses:server:SetHouseRammed', function(bool, house)
    Config.Houses[house].IsRammed = bool
    TriggerClientEvent('qb-houses:client:SetHouseRammed', -1, bool, house)
end)

RegisterNetEvent('qb-houses:server:SetInsideMeta', function(insideId, bool)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local insideMeta = Player.PlayerData.metadata['inside']
    if bool then
        insideMeta.apartment.apartmentType = nil
        insideMeta.apartment.apartmentId = nil
        insideMeta.house = insideId
        Player.Functions.SetMetaData('inside', insideMeta)
    else
        insideMeta.apartment.apartmentType = nil
        insideMeta.apartment.apartmentId = nil
        insideMeta.house = nil
        Player.Functions.SetMetaData('inside', insideMeta)
    end
end)

-- Callbacks

QBCore.Functions.CreateCallback('qb-houses:server:buyFurniture', function(source, cb, price)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    local bankBalance = pData.PlayerData.money['bank']

    if bankBalance >= price then
        pData.Functions.RemoveMoney('bank', price, 'bought-furniture')
        cb(true)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_enough_money'), 'error')
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-houses:server:ProximityKO', function(source, cb, house)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local retvalK = false
    local retvalO

    if Player then
        local identifier = Player.PlayerData.license
        local CharId = Player.PlayerData.citizenid
        if hasKey(identifier, CharId, house) then
            retvalK = true
        -- elseif Player.PlayerData.job.name == 'realestate' then
            -- retvalK = true
        else
            retvalK = false
        end
    end

    if houseowneridentifier[house] and houseownercid[house] then
        retvalO = true
    else
        retvalO = false
    end

    cb(retvalK, retvalO)
end)

QBCore.Functions.CreateCallback('qb-houses:server:hasKey', function(source, cb, house)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local retval = false
    if Player then
        local identifier = Player.PlayerData.license
        local CharId = Player.PlayerData.citizenid
        if hasKey(identifier, CharId, house) then
            retval = true
        -- elseif Player.PlayerData.job.name == 'realestate' then
            -- retval = true
        else
            retval = false
        end
    end

    cb(retval)
end)

QBCore.Functions.CreateCallback('qb-houses:server:isOwned', function(source, cb, house)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    -- if Player and Player.PlayerData and Player.PlayerData.job and Player.PlayerData.job.name == 'realestate' then
        -- cb(true)
    if houseowneridentifier[house] and houseownercid[house] then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-houses:server:getHouseOwner', function(_, cb, house)
    cb(houseownercid[house])
end)

QBCore.Functions.CreateCallback('qb-houses:server:getHouseKeyHolders', function(source, cb, house)
    local retval = {}
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if housekeyholders[house] then
        for i = 1, #housekeyholders[house], 1 do
            if Player.PlayerData.citizenid ~= housekeyholders[house][i] then
                local result = MySQL.query.await('SELECT charinfo FROM players WHERE citizenid = ?', { housekeyholders[house][i] })
                if result[1] then
                    local charinfo = json.decode(result[1].charinfo)
                    retval[#retval + 1] = {
                        firstname = charinfo.firstname,
                        lastname = charinfo.lastname,
                        citizenid = housekeyholders[house][i]
                    }
                end
            end
        end
        cb(retval)
    else
        cb(nil)
    end
end)

QBCore.Functions.CreateCallback('qb-phone:server:TransferCid', function(_, cb, NewCid, house)
    local result = MySQL.query.await('SELECT * FROM players WHERE citizenid = ?', { NewCid })
    if result[1] then
        local HouseName = house.name
        housekeyholders[HouseName] = {}
        housekeyholders[HouseName][1] = NewCid
        houseownercid[HouseName] = NewCid
        houseowneridentifier[HouseName] = result[1].license
        MySQL.update(
            'UPDATE player_houses SET citizenid = ?, keyholders = ?, identifier = ? WHERE house = ?',
            { NewCid, json.encode(housekeyholders[HouseName]), result[1].license, HouseName })
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-houses:server:getHouseDecorations', function(_, cb, house)
    local retval = nil
    local result = MySQL.query.await('SELECT * FROM player_houses WHERE house = ?', { house })
    if result[1] then
        if result[1].decorations then
            retval = json.decode(result[1].decorations)
        end
    end
    cb(retval)
end)

QBCore.Functions.CreateCallback('qb-houses:server:getHouseLocations', function(_, cb, house)
    local retval = nil
    local result = MySQL.query.await('SELECT * FROM player_houses WHERE house = ?', { house })
    if result[1] then
        retval = result[1]
    end
    cb(retval)
end)

QBCore.Functions.CreateCallback('qb-houses:server:getOwnedHouses', function(source, cb)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    if pData then
        MySQL.query('SELECT * FROM player_houses WHERE identifier = ? AND citizenid = ?', { pData.PlayerData.license, pData.PlayerData.citizenid }, function(houses)
            local ownedHouses = {}
            for i = 1, #houses, 1 do
                ownedHouses[#ownedHouses + 1] = houses[i].house
            end
            if houses then
                cb(ownedHouses)
            else
                cb(nil)
            end
        end)
    end
end)

QBCore.Functions.CreateCallback('qb-houses:server:getUnownedHouses', function(source, cb)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    if pData then
        MySQL.query('SELECT * FROM houselocations WHERE owned = ? ', { 0 }, function(houses)
            local unownedHouses = {}
            for i = 1, #houses, 1 do
                unownedHouses[#unownedHouses + 1] = houses[i]
            end
            if houses then
                cb(unownedHouses)
            else
                cb(nil)
            end
        end)
    end
end)

QBCore.Functions.CreateCallback('qb-houses:server:getSavedOutfits', function(source, cb)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)

    if pData then
        MySQL.query('SELECT * FROM player_outfits WHERE citizenid = ?', { pData.PlayerData.citizenid },
            function(result)
                if result[1] then
                    cb(result)
                else
                    cb(nil)
                end
            end)
    end
end)

QBCore.Functions.CreateCallback('qb-phone:server:GetPlayerHouses', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local MyHouses = {}
    local result = MySQL.query.await('SELECT * FROM player_houses WHERE citizenid = ?',
        { Player.PlayerData.citizenid })
    if result and result[1] then
        for k, v in pairs(result) do
            MyHouses[#MyHouses + 1] = {
                name = v.house,
                keyholders = {},
                owner = Player.PlayerData.citizenid,
                price = Config.Houses[v.house].price,
                label = Config.Houses[v.house].adress,
                tier = Config.Houses[v.house].tier,
                garage = Config.Houses[v.house].garage
            }

            if v.keyholders ~= 'null' then
                v.keyholders = json.decode(v.keyholders)
                if v.keyholders then
                    for _, data in pairs(v.keyholders) do
                        local keyholderdata = MySQL.query.await('SELECT * FROM players WHERE citizenid = ?',
                            { data })
                        if keyholderdata[1] then
                            keyholderdata[1].charinfo = json.decode(keyholderdata[1].charinfo)

                            local userKeyHolderData = {
                                charinfo = {
                                    firstname = keyholderdata[1].charinfo.firstname,
                                    lastname = keyholderdata[1].charinfo.lastname
                                },
                                citizenid = keyholderdata[1].citizenid,
                                name = keyholderdata[1].name
                            }
                            MyHouses[k].keyholders[#MyHouses[k].keyholders + 1] = userKeyHolderData
                        end
                    end
                else
                    MyHouses[k].keyholders[1] = {
                        charinfo = {
                            firstname = Player.PlayerData.charinfo.firstname,
                            lastname = Player.PlayerData.charinfo.lastname
                        },
                        citizenid = Player.PlayerData.citizenid,
                        name = Player.PlayerData.name
                    }
                end
            else
                MyHouses[k].keyholders[1] = {
                    charinfo = {
                        firstname = Player.PlayerData.charinfo.firstname,
                        lastname = Player.PlayerData.charinfo.lastname
                    },
                    citizenid = Player.PlayerData.citizenid,
                    name = Player.PlayerData.name
                }
            end
        end

        SetTimeout(100, function()
            cb(MyHouses)
        end)
    else
        cb({})
    end
end)

QBCore.Functions.CreateCallback('qb-phone:server:GetHouseKeys', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local MyKeys = {}

    local result = MySQL.query.await('SELECT * FROM player_houses', {})
    for _, v in pairs(result) do
        if v.keyholders ~= 'null' then
            v.keyholders = json.decode(v.keyholders)
            for _, p in pairs(v.keyholders) do
                if p == Player.PlayerData.citizenid and (v.citizenid ~= Player.PlayerData.citizenid) then
                    MyKeys[#MyKeys + 1] = {
                        HouseData = Config.Houses[v.house]
                    }
                end
            end
        end

        if v.citizenid == Player.PlayerData.citizenid then
            MyKeys[#MyKeys + 1] = {
                HouseData = Config.Houses[v.house]
            }
        end
    end
    cb(MyKeys)
end)

QBCore.Functions.CreateCallback('qb-phone:server:MeosGetPlayerHouses', function(_, cb, input)
    if input then
        local search = escape_sqli(input)
        local searchData = {}
        local query = '%' .. search .. '%'
        local result = MySQL.query.await('SELECT * FROM players WHERE citizenid = ? OR charinfo LIKE ?',
            { search, query })
        if result[1] then
            local houses = MySQL.query.await('SELECT * FROM player_houses WHERE citizenid = ?',
                { result[1].citizenid })
            if houses[1] then
                for _, v in pairs(houses) do
                    searchData[#searchData + 1] = {
                        name = v.house,
                        keyholders = v.keyholders,
                        owner = v.citizenid,
                        price = Config.Houses[v.house].price,
                        label = Config.Houses[v.house].adress,
                        tier = Config.Houses[v.house].tier,
                        garage = Config.Houses[v.house].garage,
                        charinfo = json.decode(result[1].charinfo),
                        coords = {
                            x = Config.Houses[v.house].coords.enter.x,
                            y = Config.Houses[v.house].coords.enter.y,
                            z = Config.Houses[v.house].coords.enter.z
                        }
                    }
                end
                cb(searchData)
            end
        else
            cb(nil)
        end
    else
        cb(nil)
    end
end)

local function getKeyHolderData()
    return housekeyholders
end

exports('getKeyHolderData', getKeyHolderData)


-- Preview System Variables
local activePreviewSessions = {}  -- Stores active preview sessions with return locations

-- Admin command to open showroom menu (not restricted to real estate)
QBCore.Commands.Add('showroom', 'Open real estate showroom (Admin Only)', {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    -- Check if player is admin
    if not QBCore.Functions.HasPermission(src, 'admin') then
        TriggerClientEvent('QBCore:Notify', src, 'You do not have permission to use this command', 'error')
        return
    end
    
    TriggerClientEvent('qb-houses:client:openShowroomMenu', src)
end)

-- Check if player is real estate agent (for location trigger)
QBCore.Functions.CreateCallback('qb-houses:server:isRealEstateAgent', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player and Player.PlayerData.job.name == 'realestate' then
        cb(true)
    else
        cb(false)
    end
end)

-- Start preview session with selected client - FIXED VERSION
RegisterNetEvent('qb-houses:server:startPreviewWithClient', function(tier, targetId, agentCoords, clientCoords)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Target = QBCore.Functions.GetPlayer(targetId)
    
    print('[DEBUG] Preview request received:')
    print('  Source:', src)
    print('  Tier:', tier)
    print('  Target ID:', targetId)
    print('  Agent Coords:', json.encode(agentCoords))
    print('  Client Coords:', json.encode(clientCoords))
    
    if not Player then 
        print('[ERROR] Player not found:', src)
        return 
    end
    
    if not Target then 
        print('[ERROR] Target player not found:', targetId)
        TriggerClientEvent('QBCore:Notify', src, 'Target player not found', 'error')
        return 
    end
    
    -- Check if player is real estate agent OR admin
    local isRealEstate = Player.PlayerData.job.name == 'realestate'
    local isAdmin = QBCore.Functions.HasPermission(src, 'admin')
    
    if not isRealEstate and not isAdmin then
        TriggerClientEvent('QBCore:Notify', src, 'You must be a real estate agent to use this', 'error')
        return
    end
    
    -- Ensure coordinates are in correct format
    if type(agentCoords) ~= 'table' or not agentCoords.x then
        print('[ERROR] Invalid agent coordinates format')
        TriggerClientEvent('QBCore:Notify', src, 'Error: Invalid coordinates', 'error')
        return
    end
    
    if type(clientCoords) ~= 'table' or not clientCoords.x then
        print('[ERROR] Invalid client coordinates format')
        TriggerClientEvent('QBCore:Notify', src, 'Error: Invalid coordinates', 'error')
        return
    end
    
    -- Store preview session with return coordinates
    local sessionId = src .. '_' .. targetId .. '_' .. os.time()
    activePreviewSessions[sessionId] = {
        agent = src,
        client = targetId,
        tier = tier,
        agentReturnCoords = agentCoords,
        clientReturnCoords = clientCoords,
        active = true
    }
    
    print('[SUCCESS] Preview session created:', sessionId)
    
    -- Teleport both players and spawn interior
    TriggerClientEvent('qb-houses:client:enterPreview', src, tier, agentCoords, sessionId)
    TriggerClientEvent('qb-houses:client:enterPreview', targetId, tier, clientCoords, sessionId)
    
    -- Notifications
    TriggerClientEvent('QBCore:Notify', src, 'Preview started with ' .. Target.PlayerData.charinfo.firstname .. ' ' .. Target.PlayerData.charinfo.lastname, 'success')
    TriggerClientEvent('QBCore:Notify', targetId, 'Real estate agent is showing you a property', 'success')
    
    -- Logging
    TriggerEvent('qb-log:server:CreateLog', 'realestate', 'Preview Started', 'blue', 
        string.format('%s [%s] started preview of tier %s interior with %s [%s]', 
            Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname,
            Player.PlayerData.citizenid,
            tier,
            Target.PlayerData.charinfo.firstname .. ' ' .. Target.PlayerData.charinfo.lastname,
            Target.PlayerData.citizenid
        )
    )
end)

-- End preview session
RegisterNetEvent('qb-houses:server:endPreview', function(sessionId)
    local src = source
    
    -- Find the session
    local session = nil
    if sessionId and activePreviewSessions[sessionId] then
        session = activePreviewSessions[sessionId]
    else
        -- Find session by player ID
        for id, sess in pairs(activePreviewSessions) do
            if sess.agent == src or sess.client == src then
                session = sess
                sessionId = id
                break
            end
        end
    end
    
    if not session then return end
    
    -- Return both players to original locations
    TriggerClientEvent('qb-houses:client:exitPreview', session.agent, session.agentReturnCoords)
    TriggerClientEvent('qb-houses:client:exitPreview', session.client, session.clientReturnCoords)
    
    -- Clean up session
    activePreviewSessions[sessionId] = nil
    
    -- Notifications
    TriggerClientEvent('QBCore:Notify', session.agent, 'Preview ended', 'success')
    TriggerClientEvent('QBCore:Notify', session.client, 'Preview ended', 'success')
end)

-- Handle player disconnect during preview
AddEventHandler('playerDropped', function()
    local src = source
    
    -- Check if player was in a preview session
    for sessionId, session in pairs(activePreviewSessions) do
        if session.agent == src or session.client == src then
            -- End the preview for the other player
            local otherPlayer = (session.agent == src) and session.client or session.agent
            local returnCoords = (session.agent == src) and session.clientReturnCoords or session.agentReturnCoords
            
            TriggerClientEvent('qb-houses:client:exitPreview', otherPlayer, returnCoords)
            TriggerClientEvent('QBCore:Notify', otherPlayer, 'Preview ended - other player disconnected', 'error')
            
            activePreviewSessions[sessionId] = nil
            break
        end
    end
end)

-- Delete House (Real Estate Only) - Enhanced Version
RegisterNetEvent('qb-houses:server:deleteHouse', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local house = data.house
    
    if not Player then return end
    
    -- Check if player is real estate agent
    if Player.PlayerData.job.name ~= 'realestate' then
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.realestate_only'), 'error')
        TriggerEvent('qb-log:server:CreateLog', 'anticheat', 'Unauthorized House Delete Attempt', 'red',
            string.format('%s attempted to delete house without real estate job', GetPlayerName(src))
        )
        return
    end
    
    -- Check if house exists
    if not Config.Houses[house] then
        TriggerClientEvent('QBCore:Notify', src, 'House not found', 'error')
        return
    end
    
    -- Check if house is owned
    if Config.Houses[house].owned or isHouseOwned(house) then
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.cannot_delete_owned'), 'error')
        return
    end
    
    -- Additional check: Verify no player_houses entries exist
    MySQL.query('SELECT * FROM player_houses WHERE house = ?', { house }, function(playerHouses)
        if playerHouses and #playerHouses > 0 then
            TriggerClientEvent('QBCore:Notify', src, 'Cannot delete: House has ownership records', 'error')
            return
        end
        
        -- Delete from houselocations table
        MySQL.query('DELETE FROM houselocations WHERE name = ?', { house }, function(result)
            if result and result.affectedRows > 0 then
                -- Remove from server config
                Config.Houses[house] = nil
                
                -- Clean up any related data
                if houseowneridentifier[house] then
                    houseowneridentifier[house] = nil
                end
                if houseownercid[house] then
                    houseownercid[house] = nil
                end
                if housekeyholders[house] then
                    housekeyholders[house] = nil
                end
                
                -- Notify all clients to remove the house
                TriggerClientEvent('qb-houses:client:houseDeleted', -1, house)
                
                -- Update house config for all clients
                TriggerClientEvent('qb-houses:client:setHouseConfig', -1, Config.Houses)
                
                -- Log the deletion
                TriggerEvent('qb-log:server:CreateLog', 'realestate', 'House Deleted', 'red', 
                    string.format('%s [%s] deleted house: %s (Address: %s)', 
                        Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname,
                        Player.PlayerData.citizenid,
                        house,
                        data.address or 'Unknown'
                    )
                )
                
                TriggerClientEvent('QBCore:Notify', src, Lang:t('success.house_deleted'), 'success')
            else
                TriggerClientEvent('QBCore:Notify', src, 'Failed to delete house from database', 'error')
            end
        end)
    end)
end)