fx_version 'cerulean'
lua54 'yes'
game 'gta5'

name         'diables_scripts'
version      '1.1.0'
description  'Script for Diables MLO Hospital'
author       'Le Diable and ClownPEACE'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'config-escrow.lua',
    'locale.lua',
    'locales/*.lua'
}

client_scripts {
    'client/*.lua',
    'client/target/*.lua',
    'client/framework/*.lua',
}

escrow_ignore {
    'config.lua',
    'client/target/*.lua',
    'locales/*.lua',
    'client/framework/*.lua',
}

ui_page 'html/index.html'

files {
  'html/index.html',    
  'html/styles.css',
  'html/script.js'
}
dependency '/assetpacks'