fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Nicholiae'
description 'Allows players to craft items and earn experience without the need for benches... utilizes jobs/gangs and radial dial from QB core'
version '2.0.0'

shared_scripts {
    -- '@qb-core/shared/locale.lua',
    -- 'locales/en.lua',
    -- 'locales/*.lua',
    'config.lua'
}

client_scripts 
	{
	  '@PolyZone/client.lua',
	  '@PolyZone/BoxZone.lua',
	  '@PolyZone/EntityZone.lua',
	  '@PolyZone/CircleZone.lua',
	  '@PolyZone/ComboZone.lua',
		'client/crafting.lua'
	}
    
server_scripts
	{
		'server/crafting.lua',
		'@oxmysql/lib/MySQL.lua'
	}

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/css/style.css',
	'html/js/crafting.js',
	'html/js/ui.js'
}