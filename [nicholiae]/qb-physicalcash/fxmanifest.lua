fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Nicholiae'
description 'Physical Cash System - Convert digital cash to physical items for hand-to-hand transactions'
version '1.0.0'


ui_page 'html/index.html'


shared_scripts {
    'config.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/reset.css'
}