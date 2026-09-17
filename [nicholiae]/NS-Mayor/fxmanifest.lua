fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Nicholiae'
description ''
version '1.0.0'

shared_scripts {
	'config.lua',
}

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/ComboZone.lua',
	-- 'client/main.lua',
	-- 'client/camera.lua',
	-- 'client/interactions.lua',
	'client/job.lua'
	-- 'client/heli.lua',
	--'client/anpr.lua',
	-- 'client/evidence.lua',
	-- 'client/objects.lua',
	-- 'client/tracker.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/server.lua'
}

