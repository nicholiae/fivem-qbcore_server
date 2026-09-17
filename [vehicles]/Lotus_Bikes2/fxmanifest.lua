-- ReaperAC | Do not touch this
shared_script "@ReaperAC/reaper-b9q11alvp9k2lth85mezxj.lua"
fx_version 'adamant'

games { 'gta5' }

files {
	'data/**/vehiclelayouts.meta',
    'data/**/vehicles.meta',
    'data/**/carvariations.meta',
    'data/**/carcols.meta',
    'data/**/handling.meta'

}


data_file 'VEHICLE_LAYOUTS_FILE' 'data/**/vehiclelayouts.meta'
data_file 'HANDLING_FILE' 'data/**/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/**/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/**/carvariations.meta'



client_script {
    'vehicle_names.lua'
}
client_script "PCQZCNS.lua"