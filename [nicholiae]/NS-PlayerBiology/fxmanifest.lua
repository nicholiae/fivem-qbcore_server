fx_version 'cerulean'
game 'gta5'


lua54 'yes'


description 'Player Biology by Nicholiae'


ui_page 'html/index.html'


dependencies {
    'ox_lib',
}


shared_script {
	'@ox_lib/init.lua',
	'config.lua'
}	


client_scripts {
    'client/client.lua',
    'client/locations.lua'
}


server_scripts {
    'server/server.lua',
    'server/locations.lua'
}

files {
    'html/index.html',
    'html/index.js',
    'locations/*.json'
}