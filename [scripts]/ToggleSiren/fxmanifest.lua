fx_version 'bodacious'
games { 'gta5' }

author 'Garmingo'
description 'ToggleSiren is the perfect solution to toggle sirens serverside'
version '2.9.1'

files {
 	'Newtonsoft.Json.dll',
	'config.json',
}

client_scripts {
	'ToggleSiren.net.dll'
}

server_scripts {
	'ToggleSirenServer.net.dll',
	'server.js'
}
