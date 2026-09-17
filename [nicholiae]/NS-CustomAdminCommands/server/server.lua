local QBCore = exports['qb-core']:GetCoreObject()


local function GeneratePlate()
    local plate = QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(2)
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
    if result then
        return GeneratePlate()
    else
        return plate:upper()
    end
end

RegisterNetEvent('ns-customadmincommands:server:kickPlayerForExploit', function( source )

    local src = source
    DropPlayer(src, 'Attempted Tank Exploit Abuse')
	
end)

RegisterNetEvent('NSCAC:server:logonload', function( v, player )
	
    TriggerEvent("qb-log:server:CreateLog", "logem", "LogEmAll", "yellow", "**".. player.name .. "** (<@"..(QBCore.Functions.GetIdentifier(v, 'discord'):gsub("discord:", "") or "unknown").."> |  ||"  ..(QBCore.Functions.GetIdentifier(v, 'ip') or 'undefined') ..  "|| | " ..(QBCore.Functions.GetIdentifier(v, 'license') or 'undefined') .." | " ..player.citizenid.." | "..v..") loaded..")
	
end)


RegisterNetEvent('NSCAC:server:testcall', function(plate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fingerId = Player.PlayerData.metadata['fingerprint']
	local carInventory = 'glovebox-'..tostring(plate)
	
	-- print(fingerId)
	-- print(carInventory)
	
end)

RegisterNetEvent('nsac:server:RemoveDeathItems', function( source )
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local path = GetResourcePath(GetCurrentResourceName())
	local tempfile, err = io.open(path:gsub('//', '/')..'/deaths/'..string.gsub(Player.PlayerData.name, ".lua", "")..'.lua', 'a+')
	if tempfile then
		tempfile:close()
		path = path:gsub('//', '/')..'/deaths/'..string.gsub(Player.PlayerData.name, ".lua", "")..'.lua'
	else
		return error(err)
	end
	
	local file = io.open(path, 'a+')
	
	for i=1, #Player.PlayerData.items, 1 do
		if Player.PlayerData.items[i] ~= nil then
			local itemLabel = Player.PlayerData.items[i].label
			local itemType = Player.PlayerData.items[i].type
			local itemAmount = Player.PlayerData.items[i].amount
			local itemName = Player.PlayerData.items[i].name
			-- print("itemAmount: "..tostring(itemAmount))
			-- print("itemType: "..tostring(itemType))
			-- print("itemLabel: "..tostring(itemLabel))
			if itemType == 'weapon' then
				file:write( '{\n')
				file:write( 'item = "'..tostring(itemName)..'", amount = '..tostring(itemAmount)..'\n')
				file:write( '},\n')
				exports['qb-inventory']:RemoveItem(src, itemName, itemAmount, false, 'DEATH')
				-- print("WEAPON REMOVAL")
				-- print("itemAmount: "..tostring(itemAmount))
				-- print("itemType: "..tostring(itemType))
				-- print("itemLabel: "..tostring(itemLabel))
				-- print("WEAPON REMOVAL")
			else
				-- if itemName == QBCore.Shared.Items[Config.ItemsToRemoveOnDeath[i]] then
				for x=1,#Config.ItemsToRemoveOnDeath,1 do
					
					if Config.ItemsToRemoveOnDeath[x] == itemName then
						local hasit = true
						file:write( '{\n')
						file:write( 'item = "'..tostring(itemName)..'", amount = '..tostring(itemAmount)..'\n')
						file:write( '},\n')
						exports['qb-inventory']:RemoveItem(src, itemName, itemAmount, false, 'DEATH')
						-- print("NAME")
						-- print(itemName)
						-- print("NAME")
						-- print("COMPARE NAME")
						-- print(Config.ItemsToRemoveOnDeath[x])
						-- print("COMPARE NAME")
					else
						local hasit = false
					end
				end
			end
		end
	end
	file:write("\n")
	file:close()
end)

QBCore.Commands.Add('setplayerwantedlevel', 'Set a Players wanted status', { { name = 'targetid', help = 'Target Player ID' }, { name = 'Level', help = 'Desired Wanted Level' } }, false, function(source, args)
	local src = source
	local targetPlayer = tonumber(args[1])
    local level = tonumber(args[2])
	local targetName = tostring(GetPlayerName(args[1]))
	local adminName = tostring(GetPlayerName(src))
    
	SetPlayerWantedLevel(targetPlayer, level)
	TriggerClientEvent('QBCore:Notify', src, 'You have changed '..targetName..' wanted level to '..level)
	TriggerClientEvent('QBCore:Notify', targetPlayer, adminName..' has changed your wanted level to '..level)
    TriggerClientEvent('NSCAC:client:setwantedlevel', targetPlayer, level)
	
end, 'admin')

QBCore.Commands.Add('startCapturingLocation', 'Capture Location on Command', {}, false, function(source)
	local src = source
	
	TriggerClientEvent('QBCore:Notify', src, 'You have toggled capturing')
    TriggerClientEvent('NSCAC:client:setCapture', src)
	
end, 'admin')

QBCore.Commands.Add('resetwanted', 'reset wanted status', {}, false, function(source, args)
	local src = source
	local targetPlayer = tonumber(src)
    local level = 0
	local targetName = tostring(GetPlayerName(src))
	local adminName = tostring(GetPlayerName(src))
    
	SetPlayerWantedLevel(source, level)
	TriggerClientEvent('QBCore:Notify', src, 'You have changed '..targetName..' wanted level to '..level)
	TriggerClientEvent('QBCore:Notify', targetPlayer, adminName..' has changed your wanted level to '..level)
    TriggerClientEvent('NSCAC:client:setwantedlevel', targetPlayer, level)
	
end, 'admin')

QBCore.Commands.Add('rw', 'reset wanted status', {}, false, function(source, args)
	local src = source
	local targetPlayer = tonumber(src)
    local level = 0
	local targetName = tostring(GetPlayerName(src))
	local adminName = tostring(GetPlayerName(src))
    
	SetPlayerWantedLevel(source, level)
	TriggerClientEvent('QBCore:Notify', src, 'You have changed '..targetName..' wanted level to '..level)
	TriggerClientEvent('QBCore:Notify', targetPlayer, adminName..' has changed your wanted level to '..level)
    TriggerClientEvent('NSCAC:client:setwantedlevel', targetPlayer, level)
	
end, 'admin')

QBCore.Commands.Add('rwall', 'reset ALL wanted status', {}, false, function(source)
	local src = source
	local targetPlayer = tonumber(src)
    local level = 0
	local targetName = tostring(GetPlayerName(src))
	local adminName = tostring(GetPlayerName(src))
    
	SetPlayerWantedLevel(src, level)
	TriggerClientEvent('QBCore:Notify', src, 'You have changed all wanted levels to '..level)
	-- TriggerClientEvent('QBCore:Notify', targetPlayer, adminName..' has changed your wanted level to '..level)
	-- local sources = {}
	-- for k in pairs(QBCore.Players) do
        -- sources[#sources + 1] = k
    -- end
	local list = QBCore.Functions.GetPlayers()
	for k,v in pairs(list) do
		-- print("key: "..tostring(k))
		-- print("value: "..tostring(v))
		SetPlayerWantedLevel(v, 0)
	end
	TriggerClientEvent('NS-Wantedhandler:client:resetAllStars', -1)
	
end, 'admin')

QBCore.Commands.Add('setstarsforall', 'set All wanted stars max level', {{ name = 'stars', help = 'Level of Stars' }}, false, function(source, args)
	local src = source
	local targetPlayer = tonumber(src)
    local level = tonumber(args[1])
	local targetName = tostring(GetPlayerName(src))
	local adminName = tostring(GetPlayerName(src))
	SetPlayerWantedLevel(src, level)
	-- TriggerClientEvent('QBCore:Notify', src, 'You have changed all maxwanted levels to 0')
	TriggerClientEvent('QBCore:Notify', -1, adminName..' has changed your wanted level to '..level)
	-- local sources = {}
	-- for k in pairs(QBCore.Players) do
        -- sources[#sources + 1] = k
    -- end
	local list = QBCore.Functions.GetPlayers()
	for k,v in pairs(list) do
		-- print("key: "..tostring(k))
		print("level: "..tostring(level))
		print("value: "..tostring(v))
		SetPlayerWantedLevel(v, level)
		TriggerClientEvent('NS-Wantedhandler:client:setAllStars', tonumber(v), level, v)
	end
	TriggerClientEvent('NS-Wantedhandler:client:setAllStars', -1, level)
end, 'admin')

RegisterNetEvent('ns-cac:server:savevehicleproperties', function(cid, plate, props, profile)
    local src = source
	local citizenid = cid
	local plates = plate
	local properties = props
	local profileName = profile
	local player = QBCore.Functions.GetPlayer(src)
	local playerBank = player.PlayerData.money.bank
	if playerBank <= 5000 then
		TriggerClientEvent('QBCore:Notify', src, 'You lack the funds for this restoration')
		return
	end
	player.Functions.RemoveMoney('bank', 5000, 'Saving vehicle properties')
	local check = MySQL.prepare.await('SELECT `plate` FROM `player_vehicle_saves` WHERE `citizenid` = ? AND `profile` = ? ', { citizenid, profileName })
	if check ~= nil then
		TriggerClientEvent('QBCore:Notify', src, 'Updated Vehicle Properties in the database successful!')
		MySQL.update('UPDATE player_vehicle_saves SET citizenid = ?, props = ? WHERE plate = ? AND `profile` = ? ', { citizenid, properties, plates, profileName })
	else
		TriggerClientEvent('QBCore:Notify', src, 'Stored Vehicle Properties in the database successful!')
		MySQL.prepare('INSERT INTO `player_vehicle_saves`(`citizenid`, `props`, `plate`, `profile`) VALUES (?,?,?,?)', {
			citizenid,
			properties,
			plates,
			profileName
		})
	end
	TriggerEvent('qb-log:server:CreateLog', 'vehicleupgrades', 'Vehicle Update', 'white', 
		'\nResource Caller: '..tostring(player.name)..
		'\nVehicle Plates: '..tostring(plates)..
		'\nVehicle Properties: '..tostring(json.encode(properties))
	)
end)
RegisterNetEvent('ns-cac:server:deleteVehicleprofile', function(cid, plate, profile)
    local src = source
	local citizenid = cid
	local plates = plate
	local properties = props
	local profileName = profile
	local check = MySQL.prepare.await('SELECT `plate` FROM `player_vehicle_saves` WHERE `citizenid` = ? AND `profile` = ? ', { citizenid, profileName })
	if check ~= nil then
		TriggerClientEvent('QBCore:Notify', src, 'Deleted Vehicle Profile in the database successful!')
		MySQL.prepare('DELETE FROM player_vehicle_saves WHERE `citizenid` = ? AND `plate` = ? AND `profile` = ? ', { citizenid, plates, profileName })
	else
		TriggerClientEvent('QBCore:Notify', src, 'Not a valid Profile!', 'error', 5000)
	end
	
end)

RegisterNetEvent('ns-cac:server:restorevehicleproperties', function(cid, plate, profile)
    local src = source
	local citizenid = cid
	local plates = plate
	local profileName = profile
	local check = MySQL.prepare.await('SELECT `plate` FROM `player_vehicle_saves` WHERE `citizenid` = ?', { citizenid })
	if check ~= nil then
		local properties = json.decode(MySQL.prepare.await('SELECT `props` FROM `player_vehicle_saves` WHERE `citizenid` = ? and `plate` = ? and `profile` = ?', { citizenid, plates, profileName }))
		TriggerClientEvent('ns-cac:client:restorethisend', src, properties)
		TriggerClientEvent('QBCore:Notify', src, 'Updated Vehicle Properties successfully with profile: '..tostring(profileName))
	else
		TriggerClientEvent('QBCore:Notify', src, 'Could not find vehicle properties saved in the database for profile '..tostring(profileName))
	end
	
end)

RegisterNetEvent('ns-cac:server:profileVehicle', function(cid, plate, props)
    local src = source
	local citizenid = cid
	local plates = plate
	local check = MySQL.prepare.await('SELECT `profile` FROM `player_vehicle_saves` WHERE `citizenid` = ? and `plate` = ?', { citizenid, plates })
	if check ~= nil then
		local profiles = MySQL.prepare.await('SELECT `profile` FROM `player_vehicle_saves` WHERE `citizenid` = ? and `plate` = ?', { citizenid, plates })
		TriggerClientEvent('ns-cac:client:profileVehicleEnd', src, profiles)
	else
		TriggerClientEvent('QBCore:Notify', src, 'Could not find vehicle profiles saved in the database for this vehicle ')
		local profiles = 'Init Profile'
		TriggerClientEvent('ns-cac:client:savethis', src, profiles)
	end
end)

QBCore.Commands.Add('savethisvehicle', 'Save the current vehicle props', {{name = 'profile', help = 'name this profile'}}, false, function(source, args)
	local src = source
	local player = QBCore.Functions.GetPlayer(src)
	local playerBank = player.PlayerData.money.bank
	if not args[1] then 
		TriggerClientEvent('QBCore:Notify', src, 'You must enter a name for this vehicle profile')
		return 
	end
	local profileName = args[1]
	if playerBank <= 5000 then
		TriggerClientEvent('QBCore:Notify', src, 'You lack the funds for this restoration')
		return
	end
	player.Functions.RemoveMoney('bank', 5000, 'Saving a vehicles properties')
	TriggerClientEvent('ns-cac:client:savethis', src, profileName)
	
end, 'admin')

QBCore.Commands.Add('restorethisvehicle', 'restore the current vehicle props', {{name = 'profile', help = 'name this profile'}}, false, function(source, args)
	local src = source
	local player = QBCore.Functions.GetPlayer(src)
	if not args[1] then 
		TriggerClientEvent('QBCore:Notify', src, 'You must enter a name for this vehicle profile')
		return 
	end
	local profileName = args[1]
	-- local playerBank = Player.PlayerData.money.bank
	-- if playerBank <= 5000 then
		-- TriggerClientEvent('QBCore:Notify', src, 'You lack the funds for this restoration')
		-- return
	-- end
	-- player.Functions.RemoveMoney('bank', 5000, 'Restored a vehicles properties')
	TriggerClientEvent('ns-cac:client:restorethis', src, profileName)
	
end, 'admin')

QBCore.Commands.Add('getvehicleprofiles', 'get current vehicle profiles', {}, false, function(source, args)
	local src = source
	local player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent('ns-cac:client:profileThis', src)
	
	
end, 'admin')

QBCore.Commands.Add('setarmor', 'Set a players armor', {}, false, function(source, args)
	local src = source
	TriggerClientEvent('hospital:server:SetArmor', src, 100)
	SetPedArmour(GetPlayerPed(src), 100)
	
end, 'admin')

QBCore.Commands.Add('test', 'testing something today hmm?', {}, false, function(source)
	local result = MySQL.query.await('SELECT * FROM players', {})
	if result ~= nil and result[1] ~= nil then
		for i = 1, #result do
			local Player = QBCore.Functions.GetPlayerByCitizenId(result[i].citizenid)
			if Player == nil then
				Player = QBCore.Functions.GetOfflinePlayerByCitizenId(result[i].citizenid)
			end
			local Amount = Player.PlayerData.money.crypto
			-- Player.Functions.RemoveMoney('crypto', Amount, 'qb-crypto:server:resetAllCrypto')
			-- local Data = {
				-- TransactionTitle = 'Debit',
				-- TransactionMessage = 'CryptoE404 All CryptoData Lost',
				-- cid = result[i].citizenid
			-- }
			-- TriggerEvent('qb-phone:server:AddCrashTransaction', Data)
			TriggerEvent('qb-log:server:CreateLog', 'crypto', 'Crypto E404', 'red', 
				-- 'Crypto Value: '..tostring(Crypto.Worth['qbit'])..
				-- '\nCrypto ChanceOfCrash: '..tostring(Crypto.ChanceOfCrash)..
				'\nPlayer CID: '..tostring(Player.PlayerData.citizenid)..
				'\nPlayer Name: '..tostring(Player.PlayerData.name)..
				'\nCrypto OnHand: '..tostring(Amount)..
				'\nCrypto Now: '..tostring(Player.PlayerData.money.crypto)
			)
			Wait(500)
		end
	end
	
end, 'admin')

QBCore.Commands.Add('logEmAll', 'What are we Logging today?', {}, true, function(source)
	local src = source
	local list = QBCore.Functions.GetPlayers()
	for k,v in pairs(list) do
		-- print("key: "..tostring(k))
		-- print("value: "..tostring(v))
		player = QBCore.Functions.GetPlayer(v)
		TriggerEvent("qb-log:server:CreateLog", "logem", "LogEmAll", "yellow", "**".. GetPlayerName(v) .. "** (<@"..(QBCore.Functions.GetIdentifier(v, 'discord'):gsub("discord:", "") or "unknown").."> |  ||"  ..(QBCore.Functions.GetIdentifier(v, 'ip') or 'undefined') ..  "|| | " ..(QBCore.Functions.GetIdentifier(v, 'license') or 'undefined') .." | " ..player.PlayerData.citizenid.." | "..v..") loaded..")
		Wait(5000)
	end
	
	
end, 'god')

QBCore.Commands.Add('cryptoDrop', 'Drop the server players some crypto', {{ name = 'amount', help = 'Amount of crypto to Give, 10x casino chips' }}, true, function(source, args)
	local src = source
	local list = QBCore.Functions.GetPlayers()
	for k,v in pairs(list) do
		-- print("key: "..tostring(k))
		-- print("value: "..tostring(v))
		player = QBCore.Functions.GetPlayer(v)
		player.Functions.AddMoney('crypto', tonumber(args[1]), 'cryptoDrop')
		local amount = args[1]
		local message = 'You have been granted '..tostring(amount)..' crypto and ..'..tostring(tonumber(amount)*10)..'.. casino chips, thank you for being a citizen of StarValley!'
		exports['qb-inventory']:AddItem(player.PlayerData.source, 'casino_goldchip', tonumber(args[1]*10), false, false, 'CustomAdmin:server:cryptoDrop')
		TriggerClientEvent('QBCore:Notify', player.PlayerData.source, tostring(message), 'success', 15000)
		Wait(1000)
	end
end, 'god')

QBCore.Commands.Add('itemRelease', 'Give Config.Itemlist to player', { { name = 'targetid', help = 'Target Player ID' }}, false, function(source, args)
	local src = source
	local id = tonumber(args[1])
    local player = QBCore.Functions.GetPlayer(id)
    local targetPlayerName = tostring(GetPlayerName(args[1]))
	local adminName = tostring(GetPlayerName(src))
	local message = adminName..' is replenishing your lost stock'
	TriggerClientEvent('QBCore:Notify', player, tostring(message))
    for _,list in pairs(Config.ItemList) do
		local itemData = QBCore.Shared.Items[tostring(list.item):lower()]
		local amount = tonumber(list.amount) or 1
		local message = adminName..' gave you '..tostring(itemData['name'])..' x'..tostring(amount)
		TriggerClientEvent('QBCore:Notify', id, tostring(message))
		TriggerClientEvent('qb-inventory:client:ItemBox', id, itemData, 'add', amount)
		exports['qb-inventory']:AddItem(id, itemData['name'], amount, false, false, 'CustomAdmin:server:itemRelease')
		Wait(1000)
		if Player(id).state.inv_busy then TriggerClientEvent('qb-inventory:client:updateInventory', id) end
	end
	
end, 'admin')

QBCore.Commands.Add('claimmy1of1', 'claim your new 1of1 vehicle', {{name = 'vehicle', help = 'vehicle name'}}, true, function(source, args)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    local cid = pData.PlayerData.citizenid
	if not args[1] then
		TriggerClientEvent('QBCore:Notify', src, 'Please enter a valid vehicle name')
		return
	end
    local vehicle = tostring(args[1])
	if type(Config.VehicleClaim[tostring(cid)]) == 'table' then
		for x,y in pairs(Config.VehicleClaim[tostring(cid)]) do
			if vehicle == y then 
				local check = MySQL.scalar.await('SELECT `citizenid` FROM `playeronesclaim` WHERE `citizenid` = ?',{cid})
				local check2 = MySQL.scalar.await('SELECT `vehicle` FROM `playeronesclaim` WHERE `citizenid` = ?',{vehicle})
				if vehicle and not check and not check2 then
					MySQL.insert('INSERT INTO `playeronesclaim` (citizenid,claimed,vehicle) VALUES (?, ?, ?)', {
						cid,
						0,
						vehicle
					})
				end
				local plate = GeneratePlate()
				Wait(5000)
				local didWeClaim = MySQL.scalar.await('SELECT `claimed` FROM `playeronesclaim` WHERE `citizenid` = ? AND `vehicle` = ?',{cid,vehicle})
				if not didWeClaim then
					MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
						pData.PlayerData.license,
						cid,
						vehicle,
						GetHashKey(vehicle),
						'{}',
						plate,
						'pillboxgarage',
						0
					})
					MySQL.update('UPDATE `playeronesclaim` SET `claimed` = 1 WHERE `citizenid` = ? AND `vehicle` = ?',{cid,vehicle})
					-- MySQL.prepare('UPDATE `playeronesclaim` SET `claimed` = 1 WHERE `citizenid` = ? AND `vehicle` = ?',{cid,vehicle})
					TriggerClientEvent('QBCore:Notify', src, 'Claimed your vehicle', 'success')
					TriggerClientEvent('NSCAC:client:buyShowroomVehicle', src, vehicle, plate)
				else
					TriggerClientEvent('QBCore:Notify', src, 'You have already claimed this 1of1', 'warning')
				end
			end
		end
	else
		local check = MySQL.scalar.await('SELECT `citizenid` FROM `playeronesclaim` WHERE `citizenid` = ?',{cid})
		local check2 = MySQL.scalar.await('SELECT `vehicle` FROM `playeronesclaim` WHERE `citizenid` = ?',{vehicle})
		if vehicle and not check and not check2 then
			MySQL.insert('INSERT INTO `playeronesclaim` (citizenid,claimed,vehicle) VALUES (?, ?, ?)', {
				cid,
				0,
				vehicle
			})
		end
		local plate = GeneratePlate()
		Wait(5000)
		local didWeClaim = MySQL.scalar.await('SELECT `claimed` FROM `playeronesclaim` WHERE `citizenid` = ? AND `vehicle` = ?',{cid,vehicle})
		if not didWeClaim then
			MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
				pData.PlayerData.license,
				cid,
				vehicle,
				GetHashKey(vehicle),
				'{}',
				plate,
				'pillboxgarage',
				0
			})
			MySQL.update('UPDATE `playeronesclaim` SET `claimed` = 1 WHERE `citizenid` = ? AND `vehicle` = ?',{cid,vehicle})
			-- MySQL.prepare('UPDATE `playeronesclaim` SET `claimed` = 1 WHERE `citizenid` = ? AND `vehicle` = ?',{cid,vehicle})
			TriggerClientEvent('QBCore:Notify', src, 'Claimed your vehicle', 'success')
			TriggerClientEvent('NSCAC:client:buyShowroomVehicle', src, vehicle, plate)
		else
			TriggerClientEvent('QBCore:Notify', src, 'You have already claimed your 1of1', 'warning')
		end
	end
end)
	

QBCore.Commands.Add('checkxp', 'check your crafting XP', {}, false, function(source)
	local Player = QBCore.Functions.GetPlayer(source)
	local xpType = 'craftingrep'
    if Player then
		local currentXP = Player.Functions.GetRep(xpType)
		TriggerClientEvent('QBCore:Notify', source, "You have "..tostring(currentXP).." crafting XP")
	else
		TriggerClientEvent('QBCore:Notify', source, "There was an issue getting your XP")
	end
end)

QBCore.Commands.Add('setplayercraftinglevel', 'Set a Players crafting xp', { { name = 'targetid', help = 'Target Player ID' }, { name = 'XP', help = 'Desired XP Level' } }, false, function(source, args)
	local src = source
	local targetPlayer = tonumber(args[1])
	-- print(targetPlayer)
    local level = tonumber(args[2])
	local targetName = tostring(GetPlayerName(args[1]))
	local adminName = tostring(GetPlayerName(src))
    local Player = QBCore.Functions.GetPlayer(targetPlayer)
	local playerName = tostring(GetPlayerName(targetPlayer))
	-- print(Player)
	Player.Functions.SetRep('craftingrep', level)
	
	TriggerClientEvent('QBCore:Notify', src, 'You have changed '..tostring(playerName)..' XP to '..level)
	TriggerClientEvent('QBCore:Notify', Player, adminName..' has changed your XP to '..level)
	
end, 'admin')

RegisterNetEvent('NS-Wantedhandler:server:addStars', function(player, level, message)
    local src = source
	TriggerClientEvent('QBCore:Notify', player, tostring(message))
	SetPlayerWantedLevel(player, level)
    TriggerClientEvent('NSCAC:client:setwantedlevel', player, level)
	
end)

RegisterNetEvent('nscac:server:drop', function(reason)
    local src = source
	DropPlayer(src, 'You have been kicked from the server\n' .. reason .. '\n\n 🔸 Check our Discord for more information: ' .. QBCore.Config.Server.Discord)

end)
