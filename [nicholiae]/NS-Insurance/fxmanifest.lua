fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Nicholiae'
description 'Players will be able to visit an NPC located in city hall and upon interaction a garage menu will appear on screen which will display all aerial and nautical vehicles the player owns; damages and fuel will be displayed. Upon selecting one vehicle from the list the player will be charged for the claim and the vehicle will be restored to full health, fuel, and be returned to the players garage to be taken out again.'
version '2.0.0'

shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/main.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
    'html/logo.png',
}
