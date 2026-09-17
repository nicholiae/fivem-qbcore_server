fx_version 'cerulean'
game 'gta5'

author 'Nicholiae'
name 'StripClub Script Enhanced'
description 'Bring life & interactions to the Unicorn Club - Now with CallGirl Integration & Multi-Dancer Support'

version '2.0-Enhanced'

shared_scripts {
	'locales/*.lua',
	'config.lua',
	'shared/*.lua',
}

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
	'client/*.lua'
}

server_script 'server/*.lua'


dependencies {
	'PolyZone'
}