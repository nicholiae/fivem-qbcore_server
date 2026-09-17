fx_version 'cerulean'
game 'gta5'

author 'Nicholiae'
description 'NC Drug Addiction System'
version '1.0.0'

lua54 'yes'

shared_scripts {
    'config.lua',
    'locales/*.lua',
    'shared/*.lua'
}

server_scripts {
    'server/main.lua',
    'server/addiction.lua',
    'server/withdrawal.lua',
    'server/exports.lua'
}

client_scripts {
    'client/main.lua',
    'client/effects.lua',
    'client/healthcap.lua'
}

dependencies {
    'qb-core',
}