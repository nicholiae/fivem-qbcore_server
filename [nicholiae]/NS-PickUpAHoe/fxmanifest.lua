fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Nicholiae'
description 'Allows players '
version '1.3.0'

shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/cornerselling.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/cornerselling.lua'
}
