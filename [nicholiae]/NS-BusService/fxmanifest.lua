fx_version 'cerulean'
game 'gta5'

author 'Nicholiae (Enhanced for Multi-Player - Fixed)'
description 'City Bus Service Module for QB-Core with Multi-Player Support (Network ID Error Fixed)'
version '2.0.1'

shared_script {
    '@qb-core/shared/locale.lua',
    'config.lua'
}

server_scripts {
    'server/*.lua'
}

client_scripts {
    'client/*.lua'
}

lua54 'yes'