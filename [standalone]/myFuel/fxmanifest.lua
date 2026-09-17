fx_version 'cerulean'
game 'gta5'

name 'myFuel'
author 'DaBurnerGermany'
version '1.2.3'

lua54 'yes'

ui_page 'html/ui.html'

escrow_ignore {
	'config.lua',
	'config-vehicle.lua',
	'client/client.lua',
	'server/server.lua',
	'server/fw_wrapper.lua',
}

client_scripts{
	'config.lua',
	'config-vehicle.lua',
	'client/functions.lua',
	'client/client.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server/fw_wrapper.lua',
	'server/server.lua'
}

exports {
	'GetFuel',
	'SetFuel',
	'GetFuelUnit',
	'GetMaxFuelInUnit',
	'GetFuelInUnit',
	'GetFuelType',
}

files {
	'html/ui.html',
	'html/ui.js',
	'html/js/*',
	'html/gfx/*',
	'html/css/*',
	'html/model/*'
}              


provide 'LegacyFuel'
dependency '/assetpacks'