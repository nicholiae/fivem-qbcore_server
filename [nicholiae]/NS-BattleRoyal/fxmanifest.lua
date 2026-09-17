fx_version 'cerulean'
games { 'gta5' }
author 'nicholiae'
client_scripts {
    "client/client.lua",
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/CircleZone.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    "server/server.lua"
}

shared_script {
	'config.lua',
	'@qb-core/shared/locale.lua',
	'locales/en.lua',
	'locales/*.lua'
	
}