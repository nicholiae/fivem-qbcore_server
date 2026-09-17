fx_version 'cerulean'
game 'gta5'

author 'Custom Development'
description 'QBCore Container Inventory System - Wallets, Backpacks, and Furniture Storage'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'config/config.lua'
}

client_scripts {
    'client/main.lua',
    'client/furniture.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
    'server/furniture.lua'
}

lua54 'yes'

dependencies {
    'qb-core',
    'qb-inventory',
    'oxmysql'
}