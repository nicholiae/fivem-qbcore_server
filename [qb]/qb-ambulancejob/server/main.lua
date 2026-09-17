local PlayerInjuries = {}
local PlayerWeaponWounds = {}
local QBCore = exports['qb-core']:GetCoreObject()
local doctorCount = 0
local doctorCalled = false
local Doctors = {}

-- Events

-- Compatibility with txAdmin Menu's heal options.
-- This is an admin only server side event that will pass the target player id or -1.
AddEventHandler('txAdmin:events:healedPlayer', function(eventData)
	if GetInvokingResource() ~= 'monitor' or type(eventData) ~= 'table' or type(eventData.id) ~= 'number' then
		return
	end

	TriggerClientEvent('hospital:client:Revive', eventData.id)
	TriggerClientEvent('hospital:client:HealInjuries', eventData.id, 'full')
end)

RegisterNetEvent('hospital:server:SendToBed', function(bedId, isRevive, hospitalIndex)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent('hospital:client:SendToBed', src, bedId, Config.Locations['hospital'][hospitalIndex]['beds'][bedId], isRevive)
	TriggerClientEvent('hospital:client:SetBed', -1, bedId, true, hospitalIndex)
	Player.Functions.RemoveMoney('bank', Config.BillCost, 'respawned-at-hospital')
	exports['qb-banking']:AddMoney('ambulance', Config.BillCost, 'Player treatment')
	TriggerClientEvent('hospital:client:SendBillEmail', src, Config.BillCost, Config.Locations['hospital'][hospitalIndex]['name'])
end)

RegisterNetEvent('hospital:server:RemoveDeathItems', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if not Player then return end

	-- Collect every item that will be removed for this death event.
	-- We snapshot full slot data (info/slot/type/label) so a future restore is lossless
	-- (weapon serials, ammo, attachments, etc. survive the round-trip).
	local removed = {}

	for i = 1, #Player.PlayerData.items do
		local itm = Player.PlayerData.items[i]
		if itm ~= nil then
			local itemName   = itm.name
			local itemAmount = itm.amount
			local itemType   = itm.type
			local itemLabel  = itm.label
			local itemInfo   = itm.info
			local itemSlot   = itm.slot

			local shouldRemove = false

			if itemType == 'weapon' then
				shouldRemove = true
			else
				for x = 1, #Config.ItemsToRemoveOnDeath do
					if Config.ItemsToRemoveOnDeath[x] == itemName then
						shouldRemove = true
						break
					end
				end
			end

			if shouldRemove then
				removed[#removed + 1] = {
					name   = itemName,
					label  = itemLabel,
					amount = itemAmount,
					type   = itemType,
					info   = itemInfo,
					slot   = itemSlot,
				}
				exports['qb-inventory']:RemoveItem(src, itemName, itemAmount, false, 'DEATH')
			end
		end
	end

	-- If the player died with no eligible items, don't bother writing a file.
	if #removed == 0 then return end

	-- Build a JSON record with metadata for the admin menu / restore flow.
	local citizenid = Player.PlayerData.citizenid or 'unknown'
	local accountName = Player.PlayerData.name or ('player_' .. tostring(src))
	local charinfo = Player.PlayerData.charinfo or {}
	local charname = ((charinfo.firstname or '') .. ' ' .. (charinfo.lastname or '')):gsub('^%s+', ''):gsub('%s+$', '')
	if charname == '' then charname = accountName end

	local now = os.time()
	local datetime = os.date('%Y-%m-%d %H:%M:%S', now)
	local fileStamp = os.date('%Y-%m-%d_%H-%M-%S', now)

	local record = {
		citizenid = citizenid,
		name      = accountName,
		charname  = charname,
		source    = src,
		timestamp = now,
		datetime  = datetime,
		items     = removed,
	}

	-- Sanitize citizenid for use as a directory name (defense in depth).
	local safeCid = tostring(citizenid):gsub('[^%w%-_]', '_')

	local resPath = GetResourcePath(GetCurrentResourceName()):gsub('//', '/')
	local dir = resPath .. '/deaths/' .. safeCid
	-- Best-effort directory creation. mkdir -p is idempotent and works on Linux servers;
	-- on Windows hosts admins can pre-create the deaths/ folder. Fallback below also handles it.
	os.execute('mkdir -p "' .. dir .. '" 2>/dev/null')

	local filePath = dir .. '/' .. fileStamp .. '.json'
	local file, err = io.open(filePath, 'w')
	if not file then
		-- Fallback: try Windows-style mkdir, then retry once.
		os.execute('mkdir "' .. dir:gsub('/', '\\') .. '" 2>nul')
		file, err = io.open(filePath, 'w')
		if not file then
			print(('[qb-ambulancejob] Failed to write death file %s: %s'):format(filePath, tostring(err)))
			return
		end
	end

	file:write(json.encode(record))
	file:close()
end)

RegisterNetEvent('hospital:server:RespawnAtHospital', function(hospitalIndex)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.metadata['injail'] > 0 then
		for i = 1, #Config.Locations['jailbeds'] do
			local v = Config.Locations['jailbeds'][i]
			if not v.taken then
				TriggerClientEvent('hospital:client:SendToBed', src, i, v, true)
				TriggerClientEvent('hospital:client:SetBed2', -1, i, true)
				if Config.WipeInventoryOnRespawn then
					Player.Functions.ClearInventory()
					MySQL.Async.execute('UPDATE players SET inventory = ? WHERE citizenid = ?', { json.encode({}), Player.PlayerData.citizenid })
					TriggerClientEvent('QBCore:Notify', src, Lang:t('error.possessions_taken'), 'error')
				end
				Player.Functions.RemoveMoney('bank', Config.BillCost, 'respawned-at-hospital')
				exports['qb-banking']:AddMoney('ambulance', Config.BillCost, 'Player treatment')
				TriggerClientEvent('hospital:client:SendBillEmail', src, Config.BillCost)
				return
			end
		end

		TriggerClientEvent('hospital:client:SendToBed', src, 1, Config.Locations['jailbeds'][1], true)
		TriggerClientEvent('hospital:client:SetBed', -1, 1, true)
		if Config.WipeInventoryOnRespawn then
			Player.Functions.ClearInventory()
			MySQL.Async.execute('UPDATE players SET inventory = ? WHERE citizenid = ?', { json.encode({}), Player.PlayerData.citizenid })
			TriggerClientEvent('QBCore:Notify', src, Lang:t('error.possessions_taken'), 'error')
		end
		Player.Functions.RemoveMoney('bank', Config.BillCost, 'respawned-at-hospital')
		exports['qb-banking']:AddMoney('ambulance', Config.BillCost, 'Player treatment')
		TriggerClientEvent('hospital:client:SendBillEmail', src, Config.BillCost)
	else
		for i = 1, #Config.Locations['hospital'][hospitalIndex]['beds'] do
			local v = Config.Locations['hospital'][hospitalIndex]['beds'][i]
			if not v.taken then
				TriggerClientEvent('hospital:client:SendToBed', src, i, v, true)
				TriggerClientEvent('hospital:client:SetBed', -1, i, true, hospitalIndex)
				if Config.WipeInventoryOnRespawn then
					Player.Functions.ClearInventory()
					MySQL.update('UPDATE players SET inventory = ? WHERE citizenid = ?', { json.encode({}), Player.PlayerData.citizenid })
					TriggerClientEvent('QBCore:Notify', src, Lang:t('error.possessions_taken'), 'error')
				end
				Player.Functions.RemoveMoney('bank', Config.BillCost, 'respawned-at-hospital')
				exports['qb-banking']:AddMoney('ambulance', Config.BillCost, 'Player treatment')
				TriggerClientEvent('hospital:client:SendBillEmail', src, Config.BillCost, Config.Locations['hospital'][hospitalIndex]['name'])
				return
			end
		end
		-- All beds were full, placing in first bed as fallback
		TriggerClientEvent('hospital:client:SendToBed', src, 1, Config.Locations['hospital'][hospitalIndex]['beds'][1], true)
		TriggerClientEvent('hospital:client:SetBed', -1, 1, true, hospitalIndex)
		if Config.WipeInventoryOnRespawn then
			Player.Functions.ClearInventory()
			MySQL.update('UPDATE players SET inventory = ? WHERE citizenid = ?', { json.encode({}), Player.PlayerData.citizenid })
			TriggerClientEvent('QBCore:Notify', src, Lang:t('error.possessions_taken'), 'error')
		end
		Player.Functions.RemoveMoney('bank', Config.BillCost, 'respawned-at-hospital')
		exports['qb-banking']:AddMoney('ambulance', Config.BillCost, 'Player treatment')
		TriggerClientEvent('hospital:client:SendBillEmail', src, Config.BillCost, Config.Locations['hospital'][hospitalIndex]['name'])
	end
end)

RegisterNetEvent('hospital:server:ambulanceAlert', function(text)
	local src = source
	local ped = GetPlayerPed(src)
	local coords = GetEntityCoords(ped)
	local players = QBCore.Functions.GetQBPlayers()
	for _, v in pairs(players) do
		if v.PlayerData.job.name == 'ambulance' and v.PlayerData.job.onduty then
			TriggerClientEvent('hospital:client:ambulanceAlert', v.PlayerData.source, coords, text)
		end
	end
end)

RegisterNetEvent('hospital:server:LeaveBed', function(id, hospitalIndex)
	TriggerClientEvent('hospital:client:SetBed', -1, id, false, hospitalIndex)
end)

RegisterNetEvent('hospital:server:SyncInjuries', function(data)
	local src = source
	PlayerInjuries[src] = data
end)

RegisterNetEvent('hospital:server:SetWeaponDamage', function(data)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player then
		PlayerWeaponWounds[Player.PlayerData.source] = data
	end
end)

RegisterNetEvent('hospital:server:RestoreWeaponDamage', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	PlayerWeaponWounds[Player.PlayerData.source] = nil
end)

RegisterNetEvent('hospital:server:SetDeathStatus', function(isDead)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player then
		Player.Functions.SetMetaData('isdead', isDead)
		if isDead then
			TriggerEvent('qb-log:server:CreateLog', 'death', 'Player is Dead', 'red', string.format('%s is now dead %s', (GetPlayerName(src)), isDead, 'qb-ambulancejob'), true)
		end
	end
end)

RegisterNetEvent('hospital:server:SetLaststandStatus', function(bool)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player then
		Player.Functions.SetMetaData('inlaststand', bool)
		if bool then
			TriggerEvent('qb-log:server:CreateLog', 'death', 'Player last Stand', 'red', string.format('%s is now in last stand %s', (GetPlayerName(src)), bool, 'qb-ambulancejob'), true)
		end
	end
end)

RegisterNetEvent('hospital:server:SetArmor', function(amount)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player then
		Player.Functions.SetMetaData('armor', amount)
	end
end)

RegisterNetEvent('hospital:server:TreatWounds', function(playerId)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local Patient = QBCore.Functions.GetPlayer(playerId)
	if Patient then
		if Player.PlayerData.job.name == 'ambulance' then
			exports['qb-inventory']:RemoveItem(src, 'bandage', 1, false, 'hospital:server:TreatWounds')
			TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['bandage'], 'remove')
			TriggerClientEvent('hospital:client:HealInjuries', Patient.PlayerData.source, 'full')
		end
	end
end)

RegisterNetEvent('hospital:server:AddDoctor', function(job)
	if job == 'ambulance' then
		local src = source
		doctorCount = doctorCount + 1
		TriggerClientEvent('hospital:client:SetDoctorCount', -1, doctorCount)
		Doctors[src] = true
	end
end)

RegisterNetEvent('hospital:server:RemoveDoctor', function(job)
	if job == 'ambulance' then
		local src = source
		doctorCount = doctorCount - 1
		TriggerClientEvent('hospital:client:SetDoctorCount', -1, doctorCount)
		Doctors[src] = nil
	end
end)

AddEventHandler('playerDropped', function()
	local src = source
	if Doctors[src] then
		doctorCount = doctorCount - 1
		TriggerClientEvent('hospital:client:SetDoctorCount', -1, doctorCount)
		Doctors[src] = nil
	end
end)

RegisterNetEvent('hospital:server:RevivePlayer', function(playerId, isOldMan)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local Patient = QBCore.Functions.GetPlayer(playerId)
	local oldMan = isOldMan or false
	if Patient then
		if Player.PlayerData.job.name == 'ambulance' or QBCore.Functions.HasItem(src, 'firstaid', 1) then
			if oldMan then
				if Player.Functions.RemoveMoney('cash', 5000, 'revived-player') then
					exports['qb-inventory']:RemoveItem(src, 'firstaid', 1, false, 'hospital:server:RevivePlayer')
					TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['firstaid'], 'remove')
					TriggerClientEvent('hospital:client:Revive', Patient.PlayerData.source)
				else
					TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_enough_money'), 'error')
				end
			else
				exports['qb-inventory']:RemoveItem(src, 'firstaid', 1, false, 'hospital:server:RevivePlayer')
				TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['firstaid'], 'remove')
				TriggerClientEvent('hospital:client:Revive', Patient.PlayerData.source)
			end
		else
			MySQL.insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)', {
				GetPlayerName(src),
				QBCore.Functions.GetIdentifier(src, 'license'),
				QBCore.Functions.GetIdentifier(src, 'discord'),
				QBCore.Functions.GetIdentifier(src, 'ip'),
				'Trying to revive theirselves or other players',
				2147483647,
				'qb-ambulancejob'
			})
			TriggerEvent('qb-log:server:CreateLog', 'bans', 'Player Banned', 'red', string.format('%s was banned by %s for %s', GetPlayerName(src), 'qb-ambulancejob', 'Trying to revive theirselves or other players'), true)
			DropPlayer(src, 'You were permanently banned by the server for: Exploiting')
		end
	end
end)

RegisterNetEvent('hospital:server:SendDoctorAlert', function(hospitalName)
	local src = source
	if not doctorCalled then
		doctorCalled = true
		local players = QBCore.Functions.GetQBPlayers()
		for _, v in pairs(players) do
			if v.PlayerData.job.name == 'ambulance' and v.PlayerData.job.onduty then
				TriggerClientEvent('QBCore:Notify', v.PlayerData.source, Lang:t('info.dr_needed', { hospital = hospitalName }), 'ambulance')
			end
		end
		SetTimeout(Config.DocCooldown * 60000, function()
			doctorCalled = false
		end)
	else
		TriggerClientEvent('QBCore:Notify', src, 'Doctor has already been notified', 'error')
	end
end)

RegisterNetEvent('hospital:server:UseFirstAid', function(targetId)
	local src = source
	local Target = QBCore.Functions.GetPlayer(targetId)
	if Target then
		TriggerClientEvent('hospital:client:CanHelp', targetId, src)
	end
end)

RegisterNetEvent('hospital:server:CanHelp', function(helperId, canHelp)
	local src = source
	if canHelp then
		TriggerClientEvent('hospital:client:HelpPerson', helperId, src)
	else
		TriggerClientEvent('QBCore:Notify', helperId, Lang:t('error.cant_help'), 'error')
	end
end)

RegisterNetEvent('hospital:server:RemoveBagItem', function()
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player then return end
	exports['qb-inventory']:RemoveItem(source, 'freebag', 1, false, 'hospital:server:RemoveBagItem')
end)
RegisterNetEvent('hospital:server:removeAmoxixillin', function()
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player then return end
	exports['qb-inventory']:RemoveItem(source, 'amoxixillin', 1, false, 'hospital:server:removeAmoxixillin')
end)
RegisterNetEvent('hospital:server:removeMorphine', function()
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player then return end
	exports['qb-inventory']:RemoveItem(source, 'morphine', 1, false, 'hospital:server:removeMorphine')
end)
RegisterNetEvent('hospital:server:removeIbuprofen', function()
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player then return end
	exports['qb-inventory']:RemoveItem(source, 'ibuprofen', 1, false, 'hospital:server:removeIbuprofen')
end)
RegisterNetEvent('hospital:server:removeOxycodone', function()
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player then return end
	exports['qb-inventory']:RemoveItem(source, 'oxycodone', 1, false, 'hospital:server:removeOxycodone')
end)
RegisterNetEvent('hospital:server:removeXanax', function()
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player then return end
	exports['qb-inventory']:RemoveItem(source, 'xanax', 1, false, 'hospital:server:removeXanax')
end)

RegisterNetEvent('hospital:server:removeBandage', function()
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player then return end
	exports['qb-inventory']:RemoveItem(source, 'bandage', 1, false, 'hospital:server:removeBandage')
end)

RegisterNetEvent('hospital:server:removeIfaks', function()
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player then return end
	exports['qb-inventory']:RemoveItem(source, 'ifaks', 1, false, 'hospital:server:removeIfaks')
end)

RegisterNetEvent('hospital:server:removePainkillers', function()
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player then return end
	exports['qb-inventory']:RemoveItem(source, 'painkillers', 1, false, 'hospital:server:removePainkillers')
end)

RegisterNetEvent('hospital:server:resetHungerThirst', function()
	local Player = QBCore.Functions.GetPlayer(source)

	if not Player then return end

	Player.Functions.SetMetaData('hunger', 100)
	Player.Functions.SetMetaData('thirst', 100)

	TriggerClientEvent('hud:client:UpdateNeeds', source, 100, 100)
end)

RegisterNetEvent('qb-ambulancejob:server:stash', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if not Player then return end
	local citizenId = Player.PlayerData.citizenid
	local stashName = 'ambulancestash_' .. citizenId
	exports['qb-inventory']:OpenInventory(src, stashName)
end)

-- Callbacks

QBCore.Functions.CreateCallback('hospital:GetDoctors', function(_, cb)
	local amount = 0
	local players = QBCore.Functions.GetQBPlayers()
	for _, v in pairs(players) do
		if v.PlayerData.job.name == 'ambulance' and v.PlayerData.job.onduty then
			amount = amount + 1
		end
	end
	cb(amount)
end)

QBCore.Functions.CreateCallback('hospital:GetPlayerStatus', function(_, cb, playerId)
	local Player = QBCore.Functions.GetPlayer(playerId)
	local injuries = {}
	injuries['WEAPONWOUNDS'] = {}
	if Player then
		if PlayerInjuries[Player.PlayerData.source] then
			if (PlayerInjuries[Player.PlayerData.source].isBleeding > 0) then
				injuries['BLEED'] = PlayerInjuries[Player.PlayerData.source].isBleeding
			end
			for k, _ in pairs(PlayerInjuries[Player.PlayerData.source].limbs) do
				if PlayerInjuries[Player.PlayerData.source].limbs[k].isDamaged then
					injuries[k] = PlayerInjuries[Player.PlayerData.source].limbs[k]
				end
			end
		end
		if PlayerWeaponWounds[Player.PlayerData.source] then
			for k, v in pairs(PlayerWeaponWounds[Player.PlayerData.source]) do
				injuries['WEAPONWOUNDS'][k] = v
			end
		end
	end
	TriggerEvent('qb-log:server:CreateLog', 'death', 'Player Status Change', 'yellow', string.format('%s status was set to %s', tostring(GetPlayerName(playerId)), injuries, 'qb-ambulancejob'), true)
	cb(injuries)
end)

QBCore.Functions.CreateCallback('hospital:GetPlayerBleeding', function(source, cb)
	local src = source
	if PlayerInjuries[src] and PlayerInjuries[src].isBleeding then
		cb(PlayerInjuries[src].isBleeding)
	else
		cb(nil)
	end
end)

-- Commands

QBCore.Commands.Add('911e', Lang:t('info.ems_report'), { { name = 'message', help = Lang:t('info.message_sent') } }, false, function(source, args)
	local src = source
	local message
	if args[1] then message = table.concat(args, ' ') else message = Lang:t('info.civ_call') end
	local ped = GetPlayerPed(src)
	local coords = GetEntityCoords(ped)
	local players = QBCore.Functions.GetQBPlayers()
	for _, v in pairs(players) do
		if v.PlayerData.job.name == 'ambulance' and v.PlayerData.job.onduty then
			TriggerClientEvent('hospital:client:ambulanceAlert', v.PlayerData.source, coords, message)
		end
	end
end)

QBCore.Commands.Add('status', Lang:t('info.check_health'), {}, false, function(source, _)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.job.name == 'ambulance' then
		TriggerClientEvent('hospital:client:CheckStatus', src)
	else
		TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_ems'), 'error')
	end
end)

QBCore.Commands.Add('heal', Lang:t('info.heal_player'), {}, false, function(source, _)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.job.name == 'ambulance' then
		TriggerClientEvent('hospital:client:TreatWounds', src)
	else
		TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_ems'), 'error')
	end
end)

QBCore.Commands.Add('revivep', Lang:t('info.revive_player'), {}, false, function(source, _)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.job.name == 'ambulance' then
		TriggerClientEvent('hospital:client:RevivePlayer', src)
	else
		TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_ems'), 'error')
	end
end)

-- Commands

QBCore.Commands.Add('givedose', 'Give the player a Morphine dose', {{ name = 'id', help = 'Target Player ID' }}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == 'ambulance' or Player.PlayerData.job.name == 'mayor' and Player.PlayerData.job.grade.level >= Config.LicenseRank then
		local SearchedPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
		if not SearchedPlayer then return end
		exports['qb-inventory']:AddItem(tonumber(args[1]), 'morphine', 1, false, info, 'qb-ambulance:givedose')
		TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['morphine'], 'add')
		TriggerClientEvent('QBCore:Notify', src, 'Morphine givin to '..tostring(SearchedPlayer.PlayerData.charinfo.firstname), 'success')
		TriggerEvent('qb-log:server:CreateLog', 'scriptjobs', 'Give Dose', 'red', string.format('%s wrote a %s for %s', GetPlayerName(src), 'dose of morphine', SearchedPlayer.PlayerData.name), true)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You are not allowed to give morphine', 'error')
    end
end)

QBCore.Commands.Add('writescript', 'Write a perscription for some drugs', { { name = 'id', help = 'Target Player ID' }, { name = 'license', help = 'Script Name or Type' } }, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == 'ambulance' or Player.PlayerData.job.name == 'mayor' and Player.PlayerData.job.grade.level >= Config.LicenseRank then
        if args[2] == 'xscript' or args[2] == 'mscript' or args[2] == 'oscript' or args[2] == 'ascript' or args[2] == 'iscript' then
            local SearchedPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
            if not SearchedPlayer then return end
            local licenseTable = SearchedPlayer.PlayerData.metadata['licences']
            if licenseTable[args[2]] then
                TriggerClientEvent('QBCore:Notify', src, 'Player already has this license', 'error')
                return
            end
            licenseTable[args[2]] = true
            SearchedPlayer.Functions.SetMetaData('licences', licenseTable)
            TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, 'License Granted', 'success')
            TriggerClientEvent('QBCore:Notify', src, 'License Granted', 'success')
			local info = {}
			local month = os.date('%m')+1
			local day = os.date('%d')
			local year = os.date('%Y')
			if month > 12 then
				month = 1
				year = year + 1
			end
			local dateTime = month..'/'..day..'/'..year
			if args[2] then
				info.citizenid = SearchedPlayer.PlayerData.citizenid
				info.firstname = SearchedPlayer.PlayerData.charinfo.firstname
				info.lastname = SearchedPlayer.PlayerData.charinfo.lastname
				info.birthdate = SearchedPlayer.PlayerData.charinfo.birthdate
				info.gender = SearchedPlayer.PlayerData.charinfo.gender
				info.nationality = SearchedPlayer.PlayerData.charinfo.nationality
				info.type = tostring(args[2])
				info.date = tostring('Prescription Expires: '.. dateTime)
				exports['qb-inventory']:AddItem(tonumber(args[1]), args[2], 1, false, info, 'qb-ambulance:writescript')
				TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[args[2]], 'add')
				TriggerEvent('qb-log:server:CreateLog', 'scriptjobs', 'Write Scripts', 'red', string.format('%s wrote a %s for %s', GetPlayerName(src), args[2], info.citizenid), true)
			end
        else
            TriggerClientEvent('QBCore:Notify', src, 'License Type does not exist', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'You are not allowed to write scripts', 'error')
    end
end)

QBCore.Commands.Add('revokescript', 'Revoke a perscription for some drugs', { { name = 'id', help = 'Target Player ID' }, { name = 'license', help = 'Script Name or Type' } }, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == 'ambulance' or Player.PlayerData.job.name == 'mayor' and Player.PlayerData.job.grade.level >= Config.LicenseRank then
        if args[2] == 'xscript' or args[2] == 'mscript' or args[2] == 'oscript' or args[2] == 'ascript' or args[2] == 'iscript' then
            local SearchedPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
            if not SearchedPlayer then return end
            local licenseTable = SearchedPlayer.PlayerData.metadata['licences']
            if not licenseTable[args[2]] then
                TriggerClientEvent('QBCore:Notify', src, 'Player does not have this license', 'error')
                return
            end
            licenseTable[args[2]] = false
            SearchedPlayer.Functions.SetMetaData('licences', licenseTable)
            TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, 'License Revoked', 'success')
            TriggerClientEvent('QBCore:Notify', src, 'License Revoked', 'success')
			
			exports['qb-inventory']:RemoveItem(tonumber(args[1]), args[2], 1, false, 'qb-ambulance:writescript')
			TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[args[2]], 'remove')
        else
            TriggerClientEvent('QBCore:Notify', src, 'License Type does not exist', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'You are not allowed to write scripts', 'error')
    end
end)

QBCore.Commands.Add('revive', Lang:t('info.revive_player_a'), { { name = 'id', help = Lang:t('info.player_id') } }, false, function(source, args)
	local src = source
	if args[1] then
		local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
		if Player then
			TriggerClientEvent('hospital:client:Revive', Player.PlayerData.source)
		else
			TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_online'), 'error')
		end
	else
		TriggerClientEvent('hospital:client:Revive', src)
	end
end, 'admin')

QBCore.Commands.Add('setpain', Lang:t('info.pain_level'), { { name = 'id', help = Lang:t('info.player_id') } }, false, function(source, args)
	local src = source
	if args[1] then
		local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
		if Player then
			TriggerClientEvent('hospital:client:SetPain', Player.PlayerData.source)
		else
			TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_online'), 'error')
		end
	else
		TriggerClientEvent('hospital:client:SetPain', src)
	end
end, 'admin')

QBCore.Commands.Add('kill', Lang:t('info.kill'), { { name = 'id', help = Lang:t('info.player_id') } }, false, function(source, args)
	local src = source
	if args[1] then
		local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
		if Player then
			TriggerClientEvent('hospital:client:KillPlayer', Player.PlayerData.source)
		else
			TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_online'), 'error')
		end
	else
		TriggerClientEvent('hospital:client:KillPlayer', src)
	end
end, 'admin')

QBCore.Commands.Add('aheal', Lang:t('info.heal_player_a'), { { name = 'id', help = Lang:t('info.player_id') } }, false, function(source, args)
	local src = source
	if args[1] then
		local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
		if Player then
			TriggerClientEvent('hospital:client:adminHeal', Player.PlayerData.source)
		else
			TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_online'), 'error')
		end
	else
		TriggerClientEvent('hospital:client:adminHeal', src)
	end
end, 'admin')

-- Items


QBCore.Functions.CreateUseableItem('ibuprofen', function(source, item)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
		TriggerClientEvent('hospital:client:UseIbuprofen', src)
	end
end)
QBCore.Functions.CreateUseableItem('xanax', function(source, item)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
		TriggerClientEvent('hospital:client:UseXanax', src)
	end
end)
QBCore.Functions.CreateUseableItem('morphine', function(source, item)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
		TriggerClientEvent('hospital:client:UseMorphine', src)
	end
end)
QBCore.Functions.CreateUseableItem('oxycodone', function(source, item)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
		TriggerClientEvent('hospital:client:UseOxycodone', src)
	end
end)
QBCore.Functions.CreateUseableItem('amoxixillin', function(source, item)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
		TriggerClientEvent('hospital:client:UseAmoxixillin', src)
	end
end)


QBCore.Functions.CreateUseableItem('ifaks', function(source, item)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
		TriggerClientEvent('hospital:client:UseIfaks', src)
	end
end)

QBCore.Functions.CreateUseableItem('bandage', function(source, item)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
		TriggerClientEvent('hospital:client:UseBandage', src)
	end
end)

QBCore.Functions.CreateUseableItem('painkillers', function(source, item)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
		TriggerClientEvent('hospital:client:UsePainkillers', src)
	end
end)

QBCore.Functions.CreateUseableItem('firstaid', function(source, item)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
		TriggerClientEvent('hospital:client:UseFirstAid', src)
	end
end)

exports('GetDoctorCount', function() return doctorCount end)


-- CreateThread(function()
    -- while true do
        -- Wait(5000)
        -- UpdateBlips()
    -- end
-- end)
