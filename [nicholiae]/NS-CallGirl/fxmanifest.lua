fx_version 'cerulean'
game 'gta5'

author 'Nicholiae - Enhanced by NinjaTech AI'
description 'NS-CallGirl - Enhanced with Prostitute Selection and Reputation System'
version '2.0.0'

shared_script 'config.lua'

client_scripts {
    'client/client.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua',
}

ui_page 'ui/selection-menu.html'

files {
    'ui/selection-menu.html',
    'ui/selection-menu.css',
    'ui/selection-menu.js',
}

lua54 'yes'