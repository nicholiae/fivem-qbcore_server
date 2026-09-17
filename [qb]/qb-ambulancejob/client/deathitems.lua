--[[
	deathitems.lua (client)
	--------------------------------------------------------------------------
	qb-menu front-end for the /deathitems admin tool.

	Flow:
		1. Players list   (one row per citizenid that has stored deaths)
		2. Death sessions (one row per stored death file for that player)
		3. Detail view    (item summary + Restore-to-Player / Restore-to-Me / Delete / Back)
]]

local QBCore = exports['qb-core']:GetCoreObject()

local function fmtTimeAgo(ts)
	if not ts or ts == 0 then return '' end
	local now = os.time()
	local diff = now - ts
	if diff < 0 then return '' end
	if diff < 60 then return diff .. 's ago' end
	if diff < 3600 then return math.floor(diff / 60) .. 'm ago' end
	if diff < 86400 then return math.floor(diff / 3600) .. 'h ago' end
	return math.floor(diff / 86400) .. 'd ago'
end

local function openMenu(menu)
	exports['qb-menu']:openMenu(menu)
end

local function closeMenu()
	exports['qb-menu']:closeMenu()
end

-- ---------------------------------------------------------------------------
-- Step 3: Detail view + actions
-- ---------------------------------------------------------------------------
local function showDetail(citizenid, fileName, charname)
	QBCore.Functions.TriggerCallback('qb-ambulancejob:server:deathitems:readDeath', function(rec)
		if not rec then
			QBCore.Functions.Notify('Could not read death file.', 'error')
			return
		end

		local menu = {
			{
				header = 'Death — ' .. (rec.charname or rec.name or citizenid),
				txt    = (rec.datetime or '') .. '  |  ' .. (#(rec.items or {})) .. ' item(s)',
				isMenuHeader = true,
			},
		}

		-- One row per item (read-only display).
		for _, it in ipairs(rec.items or {}) do
			local label = it.label or it.name or 'unknown'
			menu[#menu + 1] = {
				header = ('• %s'):format(label),
				txt    = ('%s  ×%s%s'):format(tostring(it.name), tostring(it.amount), it.type == 'weapon' and '  [weapon]' or ''),
				isMenuHeader = true,
			}
		end

		menu[#menu + 1] = {
			header = '🔄 Restore to player',
			txt    = 'Give these items back to ' .. (rec.charname or rec.name or citizenid) .. ' (must be online)',
			params = {
				event = 'qb-ambulancejob:client:deathitems:confirmRestoreToPlayer',
				args  = { citizenid = citizenid, file = fileName, charname = (rec.charname or rec.name or citizenid) },
			},
		}
		menu[#menu + 1] = {
			header = '🎒 Restore to me',
			txt    = 'Give these items to your own inventory',
			params = {
				event = 'qb-ambulancejob:client:deathitems:confirmRestoreToAdmin',
				args  = { citizenid = citizenid, file = fileName, charname = (rec.charname or rec.name or citizenid) },
			},
		}
		menu[#menu + 1] = {
			header = '🗑 Delete (god only)',
			txt    = 'Permanently delete this death record',
			params = {
				event = 'qb-ambulancejob:client:deathitems:confirmDelete',
				args  = { citizenid = citizenid, file = fileName, charname = (rec.charname or rec.name or citizenid) },
			},
		}
		menu[#menu + 1] = {
			header = '⬅ Back',
			params = {
				event = 'qb-ambulancejob:client:deathitems:openDeathsList',
				args  = { citizenid = citizenid, charname = charname },
			},
		}

		openMenu(menu)
	end, citizenid, fileName)
end

-- Generic confirmation menu used by all three destructive actions.
local function confirm(headerText, txtText, confirmEvent, confirmArgs, backEvent, backArgs)
	openMenu({
		{ header = headerText, txt = txtText, isMenuHeader = true },
		{
			header = '✅ Confirm',
			params = { event = confirmEvent, args = confirmArgs },
		},
		{
			header = '⬅ Cancel',
			params = { event = backEvent, args = backArgs },
		},
	})
end

-- ---------------------------------------------------------------------------
-- Step 2: Death sessions list for a single player
-- ---------------------------------------------------------------------------
local function showDeathsList(citizenid, charname)
	QBCore.Functions.TriggerCallback('qb-ambulancejob:server:deathitems:listDeaths', function(deaths)
		local menu = {
			{
				header = 'Deaths — ' .. (charname or citizenid),
				txt    = (#deaths) .. ' stored death file(s)',
				isMenuHeader = true,
			},
		}

		if #deaths == 0 then
			menu[#menu + 1] = { header = 'No death files for this player.', isMenuHeader = true }
		else
			for _, d in ipairs(deaths) do
				menu[#menu + 1] = {
					header = '💀 ' .. (d.datetime or d.file),
					txt    = ('%d item(s)  |  %s'):format(d.itemCount or 0, fmtTimeAgo(d.timestamp)),
					params = {
						event = 'qb-ambulancejob:client:deathitems:openDetail',
						args  = { citizenid = citizenid, file = d.file, charname = charname },
					},
				}
			end
		end

		menu[#menu + 1] = {
			header = '⬅ Back to player list',
			params = { event = 'qb-ambulancejob:client:deathitems:openPlayersList' },
		}

		openMenu(menu)
	end, citizenid)
end

-- ---------------------------------------------------------------------------
-- Step 1: Players list
-- ---------------------------------------------------------------------------
local function showPlayersList()
	QBCore.Functions.TriggerCallback('qb-ambulancejob:server:deathitems:listPlayers', function(players)
		local menu = {
			{
				header = 'Death Items — Players',
				txt    = (#players) .. ' player(s) with stored deaths',
				isMenuHeader = true,
			},
		}

		if #players == 0 then
			menu[#menu + 1] = { header = 'No stored death records found.', isMenuHeader = true }
		else
			for _, p in ipairs(players) do
				menu[#menu + 1] = {
					header = '👤 ' .. (p.charname ~= '' and p.charname or p.name),
					txt    = ('%d death(s)  |  last: %s  |  cid: %s'):format(
						p.deathCount or 0,
						fmtTimeAgo(p.lastTimestamp),
						p.citizenid
					),
					params = {
						event = 'qb-ambulancejob:client:deathitems:openDeathsList',
						args  = { citizenid = p.citizenid, charname = p.charname ~= '' and p.charname or p.name },
					},
				}
			end
		end

		menu[#menu + 1] = {
			header = '✖ Close',
			params = { event = 'qb-menu:client:closeMenu' },
		}

		openMenu(menu)
	end)
end

-- ---------------------------------------------------------------------------
-- Event wiring (qb-menu items only carry an event name + args, so we route here)
-- ---------------------------------------------------------------------------

RegisterNetEvent('qb-ambulancejob:client:deathitems:open', function()
	showPlayersList()
end)

RegisterNetEvent('qb-ambulancejob:client:deathitems:openPlayersList', function()
	showPlayersList()
end)

RegisterNetEvent('qb-ambulancejob:client:deathitems:openDeathsList', function(data)
	if not data or not data.citizenid then return end
	showDeathsList(data.citizenid, data.charname)
end)

RegisterNetEvent('qb-ambulancejob:client:deathitems:openDetail', function(data)
	if not data or not data.citizenid or not data.file then return end
	showDetail(data.citizenid, data.file, data.charname)
end)

RegisterNetEvent('qb-ambulancejob:client:deathitems:confirmRestoreToPlayer', function(data)
	confirm(
		'Confirm: Restore to player',
		'Give items back to ' .. (data.charname or data.citizenid) .. '?',
		'qb-ambulancejob:client:deathitems:doRestoreToPlayer', data,
		'qb-ambulancejob:client:deathitems:openDetail', data
	)
end)

RegisterNetEvent('qb-ambulancejob:client:deathitems:confirmRestoreToAdmin', function(data)
	confirm(
		'Confirm: Restore to me',
		'Give the items from ' .. (data.charname or data.citizenid) .. '\'s death to YOUR inventory?',
		'qb-ambulancejob:client:deathitems:doRestoreToAdmin', data,
		'qb-ambulancejob:client:deathitems:openDetail', data
	)
end)

RegisterNetEvent('qb-ambulancejob:client:deathitems:confirmDelete', function(data)
	confirm(
		'Confirm: Delete (god only)',
		'Permanently delete this death record for ' .. (data.charname or data.citizenid) .. '?',
		'qb-ambulancejob:client:deathitems:doDelete', data,
		'qb-ambulancejob:client:deathitems:openDetail', data
	)
end)

RegisterNetEvent('qb-ambulancejob:client:deathitems:doRestoreToPlayer', function(data)
	closeMenu()
	TriggerServerEvent('qb-ambulancejob:server:deathitems:restoreToPlayer', data.citizenid, data.file)
end)

RegisterNetEvent('qb-ambulancejob:client:deathitems:doRestoreToAdmin', function(data)
	closeMenu()
	TriggerServerEvent('qb-ambulancejob:server:deathitems:restoreToAdmin', data.citizenid, data.file)
end)

RegisterNetEvent('qb-ambulancejob:client:deathitems:doDelete', function(data)
	closeMenu()
	TriggerServerEvent('qb-ambulancejob:server:deathitems:delete', data.citizenid, data.file)
end)
