fx_version 'cerulean'
game 'gta5'

description 'taxes for qb core'
version '0.2.0'
author 'Nicholiae'

ui_page 'html/taxes.html'

files {
    'html/taxes.html',
    'html/taxes.css',
    'html/taxes.js'
}

client_scripts {
    'client/client.lua',
    'client/nui.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua',
    'server/callbacks.lua'
}

shared_scripts {
    'shared/config.lua'
} 
