--[[
	deathitems.lua
	--------------------------------------------------------------------------
	Admin tooling for browsing & restoring items removed from players on death.

	Storage layout (written by hospital:server:RemoveDeathItems in main.lua):
		<resource>/deaths/<citizenid>/<YYYY-MM-DD_HH-MM-SS>.json
		<resource>/deaths/<citizenid>/restored/<YYYY-MM-DD_HH-MM-SS>.json

	Public surface:
		Command:   /deathitems  (admin)
		Callbacks: qb-ambulancejob:server:deathitems:listPlayers
				   qb-ambulancejob:server:deathitems:listDeaths
				   qb-ambulancejob:server:deathitems:readDeath
		Events:    qb-ambulancejob:server:deathitems:restoreToPlayer  (admin)
				   qb-ambulancejob:server:deathitems:restoreToAdmin   (admin)
				   qb-ambulancejob:server:deathitems:delete           (god)
]]

local QBCore = exports['qb-core']:GetCoreObject()

-- ============================================================================
-- Helpers
-- ============================================================================

local function getDeathsRoot()
	return GetResourcePath(GetCurrentResourceName()):gsub('//', '/') .. '/deaths'
end

-- Cross-platform-ish directory listing using `ls` (Linux) with a Windows fallback (`dir /b`).
-- Returns a sorted array of names.
local function listDir(path, onlyDirs)
	local cmd
	if onlyDirs then
		cmd = ('ls -1 "%s" 2>/dev/null'):format(path)
	else
		cmd = ('ls -1 "%s" 2>/dev/null'):format(path)
	end
	local p = io.popen(cmd)
	if not p then return {} end
	local names = {}
	for line in p:lines() do
		if line and line ~= '' then names[#names + 1] = line end
	end
	p:close()

	-- Windows fallback if `ls` produced nothing AND the path actually exists with content.
	if #names == 0 then
		local winCmd = ('dir /b "%s" 2>nul'):format(path:gsub('/', '\\'))
		local p2 = io.popen(winCmd)
		if p2 then
			for line in p2:lines() do
				line = line:gsub('\r$', '')
				if line and line ~= '' then names[#names + 1] = line end
			end
			p2:close()
		end
	end

	table.sort(names)
	return names
end

local function isDir(path)
	-- Best effort: try to open path as a file. If it fails with "is a directory" or similar,
	-- we infer it's a directory. Simplest portable check: try to list it.
	local p = io.popen(('ls -1 "%s" 2>/dev/null | head -1; echo __MARKER__'):format(path))
	if not p then return false end
	local out = p:read('*a') or ''
	p:close()
	-- If `ls` errored on the path entirely we'd get just the marker.
	-- For our purposes anything we built ourselves under deaths/ is a directory; this guard is for safety.
	return out ~= '' and out:find('__MARKER__') ~= nil
end

local function fileExists(path)
	local f = io.open(path, 'r')
	if f then f:close(); return true end
	return false
end

local function readJsonFile(path)
	local f = io.open(path, 'r')
	if not f then return nil, 'open failed' end
	local content = f:read('*a')
	f:close()
	if not content or content == '' then return nil, 'empty' end
	local ok, decoded = pcall(json.decode, content)
	if not ok or type(decoded) ~= 'table' then return nil, 'decode failed' end
	return decoded
end

local function ensureDir(path)
	os.execute(('mkdir -p "%s" 2>/dev/null'):format(path))
	-- Windows fallback
	os.execute(('mkdir "%s" 2>nul'):format(path:gsub('/', '\\')))
end

local function moveFile(srcPath, dstPath)
	-- Try rename first; if it fails (e.g. cross-device), fall back to copy+delete.
	local ok = os.rename(srcPath, dstPath)
	if ok then return true end

	local f = io.open(srcPath, 'rb')
	if not f then return false, 'cannot read source' end
	local data = f:read('*a')
	f:close()

	local out = io.open(dstPath, 'wb')
	if not out then return false, 'cannot write destination' end
	out:write(data or '')
	out:close()

	os.remove(srcPath)
	return true
end

-- Sanitize file/dir names coming back from the filesystem for safe re-use in paths.
-- We never trust user-supplied identifiers; we only accept names that match a strict pattern
-- AND exist on disk in the expected location.
local function isSafeIdentifier(s)
	return type(s) == 'string' and s ~= '' and s:match('^[%w%-_]+$') ~= nil
end

local function isSafeDeathFilename(s)
	-- Format: YYYY-MM-DD_HH-MM-SS.json
	return type(s) == 'string' and s:match('^%d%d%d%d%-%d%d%-%d%d_%d%d%-%d%d%-%d%d%.json$') ~= nil
end

local function hasAdmin(src)
	return QBCore.Functions.HasPermission(src, 'admin') or QBCore.Functions.HasPermission(src, 'god')
end

local function hasGod(src)
	return QBCore.Functions.HasPermission(src, 'god')
end

local function notify(src, msg, type_)
	TriggerClientEvent('QBCore:Notify', src, msg, type_ or 'primary')
end

local function logAction(action, adminSrc, targetCid, fileName, extra)
	local adminName = GetPlayerName(adminSrc) or ('src_' .. tostring(adminSrc))
	local detail = ('[%s] admin=%s(%s) target_cid=%s file=%s%s'):format(
		action, adminName, tostring(adminSrc), tostring(targetCid), tostring(fileName), extra and (' ' .. extra) or ''
	)
	print('[qb-ambulancejob/deathitems] ' .. detail)
	-- qb-log is already used by this resource for death events; reuse the 'death' tag.
	TriggerEvent('qb-log:server:CreateLog', 'death', 'DeathItems ' .. action, 'orange', detail, false)
end

-- ============================================================================
-- Listing
-- ============================================================================

-- Returns an array of { citizenid, name, charname, deathCount, lastTimestamp }
-- by scanning every <deaths>/<citizenid>/ directory and peeking at the most recent file
-- for display metadata.
local function listPlayersWithDeaths()
	local root = getDeathsRoot()
	local entries = listDir(root, true)
	local players = {}

	for _, entry in ipairs(entries) do
		if isSafeIdentifier(entry) then
			local pdir = root .. '/' .. entry
			local files = listDir(pdir, false)
			-- Filter to active death files only (exclude the 'restored' subdir & anything that doesn't match).
			local deathFiles = {}
			for _, fn in ipairs(files) do
				if isSafeDeathFilename(fn) then
					deathFiles[#deathFiles + 1] = fn
				end
			end

			if #deathFiles > 0 then
				-- Peek the newest file (sorted ascending => last = newest because of ISO date format).
				local newest = deathFiles[#deathFiles]
				local rec = readJsonFile(pdir .. '/' .. newest)
				local displayName = (rec and (rec.charname or rec.name)) or entry
				local accountName = (rec and rec.name) or entry
				local lastTs = (rec and rec.timestamp) or 0
				players[#players + 1] = {
					citizenid    = entry,
					name         = accountName,
					charname     = displayName,
					deathCount   = #deathFiles,
					lastTimestamp = lastTs,
				}
			end
		end
	end

	-- Sort newest-death-first for the menu.
	table.sort(players, function(a, b) return (a.lastTimestamp or 0) > (b.lastTimestamp or 0) end)
	return players
end

local function listDeathsForPlayer(citizenid)
	if not isSafeIdentifier(citizenid) then return {} end
	local pdir = getDeathsRoot() .. '/' .. citizenid
	local files = listDir(pdir, false)
	local out = {}
	for _, fn in ipairs(files) do
		if isSafeDeathFilename(fn) then
			local rec = readJsonFile(pdir .. '/' .. fn)
			out[#out + 1] = {
				file      = fn,
				datetime  = rec and rec.datetime or fn:gsub('%.json$', ''),
				timestamp = rec and rec.timestamp or 0,
				itemCount = (rec and rec.items and #rec.items) or 0,
				charname  = rec and rec.charname or '',
				name      = rec and rec.name or '',
			}
		end
	end
	-- Newest first.
	table.sort(out, function(a, b) return (a.timestamp or 0) > (b.timestamp or 0) end)
	return out
end

local function readDeath(citizenid, fileName)
	if not isSafeIdentifier(citizenid) or not isSafeDeathFilename(fileName) then return nil end
	local path = getDeathsRoot() .. '/' .. citizenid .. '/' .. fileName
	if not fileExists(path) then return nil end
	return readJsonFile(path), path
end

-- ============================================================================
-- Callbacks (used by the client menu to fetch data)
-- ============================================================================

QBCore.Functions.CreateCallback('qb-ambulancejob:server:deathitems:listPlayers', function(source, cb)
	if not hasAdmin(source) then cb({}) return end
	cb(listPlayersWithDeaths())
end)

QBCore.Functions.CreateCallback('qb-ambulancejob:server:deathitems:listDeaths', function(source, cb, citizenid)
	if not hasAdmin(source) then cb({}) return end
	cb(listDeathsForPlayer(citizenid))
end)

QBCore.Functions.CreateCallback('qb-ambulancejob:server:deathitems:readDeath', function(source, cb, citizenid, fileName)
	if not hasAdmin(source) then cb(nil) return end
	local rec = readDeath(citizenid, fileName)
	cb(rec)
end)

-- ============================================================================
-- Restore / Delete
-- ============================================================================

local function giveItemsTo(targetSrc, items, sourceTag)
	local Target = QBCore.Functions.GetPlayer(targetSrc)
	if not Target then return false, 'target not online' end

	for i = 1, #items do
		local it = items[i]
		if it and it.name and it.amount and it.amount > 0 then
			-- info is preserved verbatim so weapon serial/ammo/attachments survive.
			local ok = exports['qb-inventory']:AddItem(targetSrc, it.name, it.amount, false, it.info, sourceTag)
			if ok then
				local shared = QBCore.Shared.Items[it.name]
				if shared then
					TriggerClientEvent('qb-inventory:client:ItemBox', targetSrc, shared, 'add', it.amount)
				end
			else
				-- Don't abort the whole restore on a single failure; log it and continue.
				print(('[qb-ambulancejob/deathitems] AddItem failed for %s x%s -> src %s (likely inventory full)')
					:format(tostring(it.name), tostring(it.amount), tostring(targetSrc)))
			end
		end
	end
	-- Refresh inventory UI if it's open.
	if Player(targetSrc).state.inv_busy then
		TriggerClientEvent('qb-inventory:client:updateInventory', targetSrc)
	end
	return true
end

local function archiveDeathFile(citizenid, fileName)
	local root = getDeathsRoot()
	local src = root .. '/' .. citizenid .. '/' .. fileName
	local dstDir = root .. '/' .. citizenid .. '/restored'
	ensureDir(dstDir)
	local dst = dstDir .. '/' .. fileName
	-- If a restored file with the same name already exists (extremely unlikely), suffix it.
	if fileExists(dst) then
		dst = dstDir .. '/' .. fileName:gsub('%.json$', '') .. ('_%d.json'):format(os.time())
	end
	return moveFile(src, dst)
end

RegisterNetEvent('qb-ambulancejob:server:deathitems:restoreToPlayer', function(citizenid, fileName)
	local src = source
	if not hasAdmin(src) then return end
	if not isSafeIdentifier(citizenid) or not isSafeDeathFilename(fileName) then return end

	local rec, path = readDeath(citizenid, fileName)
	if not rec then
		notify(src, 'Death file not found.', 'error')
		return
	end

	-- Find the target player by citizenid (must be online to receive).
	local Target = QBCore.Functions.GetPlayerByCitizenId(citizenid)
	if not Target then
		notify(src, 'Target player is offline. Use "Restore to me" instead.', 'error')
		return
	end

	local ok = giveItemsTo(Target.PlayerData.source, rec.items or {}, 'admin-deathitems-restore')
	if not ok then
		notify(src, 'Failed to restore items.', 'error')
		return
	end

	archiveDeathFile(citizenid, fileName)
	notify(src, ('Restored %d item(s) to %s.'):format(#(rec.items or {}), rec.charname or rec.name or citizenid), 'success')
	notify(Target.PlayerData.source, ('An admin restored your items lost on death (%s).'):format(rec.datetime or ''), 'success')
	logAction('RESTORE_TO_PLAYER', src, citizenid, fileName, ('items=%d'):format(#(rec.items or {})))
end)

RegisterNetEvent('qb-ambulancejob:server:deathitems:restoreToAdmin', function(citizenid, fileName)
	local src = source
	if not hasAdmin(src) then return end
	if not isSafeIdentifier(citizenid) or not isSafeDeathFilename(fileName) then return end

	local rec = readDeath(citizenid, fileName)
	if not rec then
		notify(src, 'Death file not found.', 'error')
		return
	end

	local ok = giveItemsTo(src, rec.items or {}, 'admin-deathitems-restore-self')
	if not ok then
		notify(src, 'Failed to restore items.', 'error')
		return
	end

	archiveDeathFile(citizenid, fileName)
	notify(src, ('Restored %d item(s) to yourself (from %s).'):format(#(rec.items or {}), rec.charname or rec.name or citizenid), 'success')
	logAction('RESTORE_TO_ADMIN', src, citizenid, fileName, ('items=%d'):format(#(rec.items or {})))
end)

RegisterNetEvent('qb-ambulancejob:server:deathitems:delete', function(citizenid, fileName)
	local src = source
	if not hasGod(src) then
		notify(src, 'Delete requires god permission.', 'error')
		return
	end
	if not isSafeIdentifier(citizenid) or not isSafeDeathFilename(fileName) then return end

	local path = getDeathsRoot() .. '/' .. citizenid .. '/' .. fileName
	if not fileExists(path) then
		notify(src, 'Death file not found.', 'error')
		return
	end

	local ok, err = os.remove(path)
	if not ok then
		notify(src, 'Delete failed: ' .. tostring(err), 'error')
		return
	end

	notify(src, 'Death file deleted.', 'success')
	logAction('DELETE', src, citizenid, fileName)
end)

-- ============================================================================
-- Command entrypoint
-- ============================================================================

QBCore.Commands.Add(
	'deathitems',
	'Browse and restore items lost on death (admin)',
	{},
	false,
	function(source)
		TriggerClientEvent('qb-ambulancejob:client:deathitems:open', source)
	end,
	'admin'
)
