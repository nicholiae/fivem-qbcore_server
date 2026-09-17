fx_version 'cerulean'
game 'gta5'

author 'NinjaTech AI / Your Server'
description 'QB-Core Police NPC Control System - Taser Only + Proximity Arrest'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua',
    'client/arrest.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

dependencies {
    'qb-core',
    'qb-smallresources'
}