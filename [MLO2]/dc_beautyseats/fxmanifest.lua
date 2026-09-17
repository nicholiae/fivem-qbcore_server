fx_version 'cerulean'
game 'gta5'

lua54 'yes'

description 'DC Beauty Seats Animations'

dependencies {
    'ox_lib',
}

shared_script {
	'@ox_lib/init.lua',
	'config.lua'
}	

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

escrow_ignore {
	'config.lua',
	'alternateconfig.lua',
	'client/client.lua',
	'server/server.lua',
}

dependency '/assetpacks'
dependency '/assetpacks'