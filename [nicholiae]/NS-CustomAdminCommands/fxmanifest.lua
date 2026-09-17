fx_version 'cerulean'
game 'gta5'

description 'Custom admin commands concerning wanted system'
version '0.1.0'
author 'Nicholiae'


dependencies {
    'PolyZone',
    'qb-target'
}


client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/CircleZone.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/ComboZone.lua',
    'client/client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

shared_scripts {
    'shared/config.lua'
} 

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
    'html/logo.png',
}
