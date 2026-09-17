fx_version "cerulean"
games { "gta5" }
this_is_a_map "yes"

author 'DC Customz'
description 'DC Customz Beauty Salon/Supply Store MLO'
version '1.0.0'

files {
	'stream/dcbeauty_ityp2.ytyp'
}

data_file 'DLC_ITYP_REQUEST' 'stream/dcbeauty_ityp2.ytyp'

escrow_ignore {
	'stream/vanilla/*.ydr',
	'stream/vanilla/*.ybn',
	'stream/vanilla/*.ymap',
	'stream/vanilla/*.ytd',
}

dependency '/assetpacks'