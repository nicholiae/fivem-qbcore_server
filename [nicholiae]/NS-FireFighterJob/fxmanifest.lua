fx_version 'cerulean'
game 'gta5'

description 'NS-FireFighterJob'
version '1.0.0'
author 'Nicholiae'

shared_script 'config.lua'

client_scripts {
	'client/main.lua',
	'client/job.lua',
}

server_script 'server/main.lua'

lua54 'yes'