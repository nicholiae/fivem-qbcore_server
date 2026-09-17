fx_version "adamant"
lua54 'yes'
game "gta5"

author '_G[S]cripts'
description 'Trailers [https://discord.gg/glitchianna]'
version '1.0.8'

files {
    'locales/*.json'
}

shared_scripts {
    '@ox_lib/init.lua',
    'shared/config.lua',
    'shared/utils.lua'
}

client_scripts {
    'client/**.lua'
}

dependency 'ox_lib'

escrow_ignore {
    'shared/config.lua',
    'client/edit.lua',
    'locales/*.json',
}
dependency '/assetpacks'