fx_version 'cerulean'
games { 'gta5' }

lua54 'yes'

version      '1.2.2'

files {
    'locales/*.json',
    'config/*.lua'
}

shared_script {
    '@ox_lib/init.lua',
    'init.lua',
    'bridge/bridge.lua'
}

client_scripts {
    'client/*.lua',
    'bridge/client/*.lua'
}

server_scripts {
    'server/*.lua',
    'bridge/server/*.lua'
}

escrow_ignore {
    "**/*",
}

dependency '/assetpacks'