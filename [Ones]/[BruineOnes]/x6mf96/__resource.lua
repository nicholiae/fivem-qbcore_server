-- Manifest
resource_manifest_version 'f15e72ec-3972-4fe4-9c7d-afc5394ae207'

files {
    --'data/vehiclelayouts.meta',
	'vehicles.meta',
	'carcols.meta',
	'carvariations.meta',
	'handling.meta',
    --'data/contentunlocks.meta',
    --'data/shop_vehicle.meta',
}





--data_file 'VEHICLE_LAYOUTS_FILE' 'data/vehiclelayouts.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'CARCOLS_FILE' 'carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'
data_file 'HANDLING_FILE' 'handling.meta'
--data_file 'CONTENT_UNLOCKING_META_FILE' 'data/autobiocontentunlocks.meta'
--data_file 'VEHICLE_SHOP_DLC_FILE' 'data/shop_vehicle.meta'



