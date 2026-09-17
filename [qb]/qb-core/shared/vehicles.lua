QBShared = QBShared or {}
QBShared.Vehicles = QBShared.Vehicles or {}

local Vehicles = {

--- Compacts (0)		customs 
--- Sedans (1)			customs 
--- SUV (2)				PDM
--- Coupes (3)			customs 
--- Muscle (4)			customs 
--- Sports Classic (5)	Luxery 
--- Sports (6)			Luxery 
--- Super (7)			Luxery 
--- Motorcycles (8)		Bikes shop
--- Off-Road (9)		Truck shop 
--- Industrial (10)		Truck shop  
--- Utility (11)		Truck shop 
--- Vans (12)			PDM 
--- Cycles (13)			Bikes shop
--- Boats (14)
--- Helicopters (15)
--- Planes (16)
--- Service (17)
--- Emergency (18)
--- Military (19)
--- Commercial (20)
--- Trains (21)
--- Open Wheel (22)
--- Reserved (23)
--- Electric (24)
--- ReservedAir (25)
--- Trailers (26)
    {
        model = 'asbo',        -- This has to match the spawn code of the vehicle
        name = 'Asbo',         -- This is the display of the vehicle
        brand = 'Maxwell',     -- This is the vehicle's brand
        price = 4000,          -- The price that the vehicle sells for
        category = 'compacts', -- Catgegory of the vehilce, stick with GetVehicleClass() options https://docs.fivem.net/natives/?_0x29439776AAA00A62
        type = 'automobile',   -- Vehicle type, refer here https://docs.fivem.net/natives/?_0x6AE51D4B & here https://docs.fivem.net/natives/?_0xA273060E
        shop = 'pdm',          -- Can be a single shop or multiple shops. For multiple shops for example {'shopname1','shopname2','shopname3'}
	},
    { model = 'blista',          name = 'Blista',                        brand = 'Dinka',           price = 13000,   category = 'compacts',       type = 'automobile', shop = 'pdm'},
    { model = 'brioso',          name = 'Brioso R/A',                    brand = 'Grotti',          price = 20000,   category = 'compacts',       type = 'automobile', shop = 'pdm'},
    { model = 'club',            name = 'Club',                          brand = 'BF',              price = 8000,    category = 'compacts',       type = 'automobile', shop = 'pdm'},
    { model = 'dilettante',      name = 'Dilettante',                    brand = 'Karin',           price = 9000,    category = 'compacts',       type = 'automobile', shop = 'pdm'},
    { model = 'dilettante2',     name = 'Dilettante Patrol',             brand = 'Karin',           price = 12000,   category = 'compacts',       type = 'automobile', shop = 'pdm'},
    { model = 'kanjo',           name = 'Blista Kanjo',                  brand = 'Dinka',           price = 12000,   category = 'compacts',       type = 'automobile', shop = 'pdm'},
    { model = 'issi2',           name = 'Issi',                          brand = 'Weeny',           price = 7000,    category = 'compacts',       type = 'automobile', shop = 'pdm'},
    { model = 'issi3',           name = 'Issi Classic',                  brand = 'Weeny',           price = 5000,    category = 'compacts',       type = 'automobile', shop = 'pdm'},
    { model = 'issi4',           name = 'Issi Arena',                    brand = 'Weeny',           price = 80000,   category = 'compacts',       type = 'automobile', shop = 'pdm'},
    { model = 'issi5',           name = 'Issi Future Shock',             brand = 'Weeny',           price = 80000,   category = 'compacts',       type = 'automobile', shop = 'pdm'},
    { model = 'issi6',           name = 'Issi Nightmare',                brand = 'Weeny',           price = 80000,   category = 'compacts',       type = 'automobile', shop = 'pdm'},
    { model = 'panto',           name = 'Panto',                         brand = 'Benefactor',      price = 3200,    category = 'compacts',       type = 'automobile', shop = 'pdm'},
    { model = 'prairie',         name = 'Prairie',                       brand = 'Bollokan',        price = 30000,   category = 'compacts',       type = 'automobile', shop = 'pdm'},
    { model = 'rhapsody',        name = 'Rhapsody',                      brand = 'Declasse',        price = 10000,   category = 'compacts',       type = 'automobile', shop = 'pdm'},
    { model = 'brioso2',         name = 'Brioso 300',                    brand = 'Grotti',          price = 12000,   category = 'compacts',       type = 'automobile', shop = 'pdm'},
    { model = 'weevil',          name = 'Weevil',                        brand = 'BF',              price = 9000,    category = 'compacts',       type = 'automobile', shop = 'pdm'},
    { model = 'issi7',           name = 'Issi Sport',                    brand = 'Weeny',           price = 100000,  category = 'compacts',       type = 'automobile', shop = 'pdm'},
    { model = 'blista2',         name = 'Blista Compact',                brand = 'Dinka',           price = 18950,   category = 'compacts',       type = 'automobile', shop = 'pdm'},
    { model = 'blista3',         name = 'Blista Go Go Monkey',           brand = 'Dinka',           price = 15000,   category = 'compacts',       type = 'automobile', shop = 'pdm'},
    { model = 'brioso3',         name = 'Brioso 300 Widebody',           brand = 'Grotti',          price = 125000,  category = 'compacts',       type = 'automobile', shop = 'pdm'},
    { model = 'boor',            name = 'Boor',                          brand = 'Karin',           price = 23000,   category = 'compacts',       type = 'automobile', shop = 'pdm'},
    --- Sedans (1)
    { model = 'asea',            name = 'Asea',                          brand = 'Declasse',        price = 2500,    category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'asterope',        name = 'Asterope',                      brand = 'Karin',           price = 11000,   category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'cog55',           name = 'Cognoscenti 55',                brand = 'Enus',            price = 22000,   category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'cognoscenti',     name = 'Cognoscenti',                   brand = 'Enus',            price = 22500,   category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'emperor',         name = 'Emperor',                       brand = 'Albany',          price = 4250,    category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'fugitive',        name = 'Fugitive',                      brand = 'Cheval',          price = 20000,   category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'glendale',        name = 'Glendale',                      brand = 'Benefactor',      price = 3400,    category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'glendale2',       name = 'Glendale Custom',               brand = 'Benefactor',      price = 12000,   category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'ingot',           name = 'Ingot',                         brand = 'Vulcar',          price = 4999,    category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'intruder',        name = 'Intruder',                      brand = 'Karin',           price = 11250,   category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'premier',         name = 'Premier',                       brand = 'Declasse',        price = 12000,   category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'primo',           name = 'Primo',                         brand = 'Albany',          price = 5000,    category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'primo2',          name = 'Primo Custom',                  brand = 'Albany',          price = 14500,   category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'regina',          name = 'Regina',                        brand = 'Dundreary',       price = 7000,    category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'stafford',        name = 'Stafford',                      brand = 'Enus',            price = 30000,   category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'stanier',         name = 'Stanier',                       brand = 'Vapid',           price = 19000,   category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'stratum',         name = 'Stratum',                       brand = 'Zirconium',       price = 15000,   category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'stretch',         name = 'Stretch',                       brand = 'Dundreary',       price = 19000,   category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'superd',          name = 'Super Diamond',                 brand = 'Enus',            price = 17000,   category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'surge',           name = 'Surge',                         brand = 'Cheval',          price = 20000,   category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'tailgater',       name = 'Tailgater',                     brand = 'Obey',            price = 22000,   category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'warrener',        name = 'Warrener',                      brand = 'Vulcar',          price = 4000,    category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'washington',      name = 'Washington',                    brand = 'Albany',          price = 7000,    category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'tailgater2',      name = 'Tailgater S',                   brand = 'Obey',            price = 51000,   category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'cinquemila',      name = 'Lampadati',                     brand = 'Cinquemila',      price = 125000,  category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'iwagen',          name = 'Obey',                          brand = 'I-Wagen',         price = 225000,  category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'astron',          name = 'Astron',                        brand = 'Pfister',         price = 150000,  category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'baller7',         name = 'Baller ST',                     brand = 'Gallivanter',     price = 145000,  category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'comet7',          name = 'Comet',                         brand = 'S2 Cabrio',       price = 25000,   category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'deity',           name = 'Deity',                         brand = 'Enus',            price = 505000,  category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'jubilee',         name = 'Jubilee',                       brand = 'Enus',            price = 485000,  category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'oracle',          name = 'Oracle',                        brand = 'Übermacht',       price = 22000,   category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'schafter2',       name = 'Schafter',                      brand = 'Benefactor',      price = 16000,   category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'warrener2',       name = 'Warrener HKR',                  brand = 'Vulcar',          price = 30000,   category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'rhinehart',       name = 'Rhinehart',                     brand = 'Übermacht',       price = 105000,  category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'eudora',          name = 'Eudora',                        brand = 'Willard',         price = 17000,   category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'asterope2',       name = 'Asterope GZ',                   brand = 'Karin',           price = 459000,  category = 'sedans',         type = 'automobile', shop = 'pdm'},
    { model = 'impaler5',        name = 'Impaler SZ',                    brand = 'Declasse',        price = 768000,  category = 'sedans',         type = 'automobile', shop = 'pdm'},
    --- SUV (2)
    { model = 'baller',          name = 'Baller',                        brand = 'Gallivanter',     price = 22000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'baller2',         name = 'Baller II',                     brand = 'Gallivanter',     price = 15000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'baller3',         name = 'Baller LE',                     brand = 'Gallivanter',     price = 15000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'baller4',         name = 'Baller LE LWB',                 brand = 'Gallivanter',     price = 29000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'baller5',         name = 'Baller LE (Armored)',           brand = 'Gallivanter',     price = 78000,   category = 'suvs',           type = 'automobile', shop = 'none'},
    { model = 'baller6',         name = 'Baller LE LWB (Armored)',       brand = 'Gallivanter',     price = 82000,   category = 'suvs',           type = 'automobile', shop = 'none'},
    { model = 'bjxl',            name = 'BeeJay XL',                     brand = 'Karin',           price = 19000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'cavalcade',       name = 'Cavalcade',                     brand = 'Albany',          price = 14000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'cavalcade2',      name = 'Cavalcade II',                  brand = 'Albany',          price = 16500,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'contender',       name = 'Contender',                     brand = 'Vapid',           price = 35000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'dubsta',          name = 'Dubsta',                        brand = 'Benefactor',      price = 19000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'dubsta2',         name = 'Dubsta Luxury',                 brand = 'Benefactor',      price = 19500,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'fq2',             name = 'FQ2',                           brand = 'Fathom',          price = 18500,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'granger',         name = 'Granger',                       brand = 'Declasse',        price = 22000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'gresley',         name = 'Gresley',                       brand = 'Bravado',         price = 25000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'habanero',        name = 'Habanero',                      brand = 'Emperor',         price = 20000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'huntley',         name = 'Huntley S',                     brand = 'Enus',            price = 24500,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'landstalker',     name = 'Landstalker',                   brand = 'Dundreary',       price = 12000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'landstalker2',    name = 'Landstalker XL',                brand = 'Dundreary',       price = 26000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'novak',           name = 'Novak',                         brand = 'Lampadati',       price = 70000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'patriot',         name = 'Patriot',                       brand = 'Mammoth',         price = 21000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'patriot2',        name = 'Patriot Stretch',               brand = 'Mammoth',         price = 21000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'radi',            name = 'Radius',                        brand = 'Vapid',           price = 18000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'rebla',           name = 'Rebla GTS',                     brand = 'Übermacht',       price = 21000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'rocoto',          name = 'Rocoto',                        brand = 'Obey',            price = 13000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'seminole',        name = 'Seminole',                      brand = 'Canis',           price = 20000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'seminole2',       name = 'Seminole Frontier',             brand = 'Canis',           price = 13000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'serrano',         name = 'Serrano',                       brand = 'Benefactor',      price = 48000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'toros',           name = 'Toros',                         brand = 'Pegassi',         price = 65000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'xls',             name = 'XLS',                           brand = 'Benefactor',      price = 17000,   category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'granger2',        name = 'Granger 3600LX',                brand = 'Declasse',        price = 221000,  category = 'suvs',           type = 'automobile', shop = ''},
    { model = 'patriot3',        name = 'Patriot Military',              brand = 'Mil-Spec',        price = 270000,  category = 'suvs',           type = 'automobile', shop = ''},
    { model = 'aleutian',        name = 'Aleutian',                      brand = 'Vapid',           price = 183500,  category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'baller8',         name = 'Baller ST-D',                   brand = 'Gallivanter',     price = 171500,  category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'cavalcade3',      name = 'Cavalcade XL',                  brand = 'Albany',          price = 166500,  category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'dorado',          name = 'Dorado',                        brand = 'Bravado',         price = 137500,  category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'vivanite',        name = 'Vivanite',                      brand = 'Karin',           price = 160500,  category = 'suvs',           type = 'automobile', shop = 'pdm'},
    { model = 'castigator',      name = 'Castigator',                    brand = 'Canis',           price = 160500,  category = 'suvs',           type = 'automobile', shop = 'pdm'},
    --- Coupes (3)
    { model = 'cogcabrio',       name = 'Cognoscenti Cabrio',            brand = 'Enus',            price = 30000,   category = 'coupes',         type = 'automobile', shop = 'pdm'},
    { model = 'exemplar',        name = 'Exemplar',                      brand = 'Dewbauchee',      price = 40000,   category = 'coupes',         type = 'automobile', shop = 'pdm'},
    { model = 'f620',            name = 'F620',                          brand = 'Ocelot',          price = 32500,   category = 'coupes',         type = 'automobile', shop = 'pdm'},
    { model = 'felon',           name = 'Felon',                         brand = 'Lampadati',       price = 31000,   category = 'coupes',         type = 'automobile', shop = 'pdm'},
    { model = 'felon2',          name = 'Felon GT',                      brand = 'Lampadati',       price = 37000,   category = 'coupes',         type = 'automobile', shop = 'pdm'},
    { model = 'jackal',          name = 'Jackal',                        brand = 'Ocelot',          price = 19000,   category = 'coupes',         type = 'automobile', shop = 'pdm'},
    { model = 'oracle2',         name = 'Oracle XS',                     brand = 'Übermacht',       price = 28000,   category = 'coupes',         type = 'automobile', shop = 'pdm'},
    { model = 'sentinel',        name = 'Sentinel',                      brand = 'Übermacht',       price = 30000,   category = 'coupes',         type = 'automobile', shop = 'pdm'},
    { model = 'sentinel2',       name = 'Sentinel XS',                   brand = 'Übermacht',       price = 33000,   category = 'coupes',         type = 'automobile', shop = 'pdm'},
    { model = 'windsor',         name = 'Windsor',                       brand = 'Enus',            price = 27000,   category = 'coupes',         type = 'automobile', shop = 'pdm'},
    { model = 'windsor2',        name = 'Windsor Drop',                  brand = 'Enus',            price = 34000,   category = 'coupes',         type = 'automobile', shop = 'pdm'},
    { model = 'zion',            name = 'Zion',                          brand = 'Übermacht',       price = 22000,   category = 'coupes',         type = 'automobile', shop = 'pdm'},
    { model = 'zion2',           name = 'Zion Cabrio',                   brand = 'Übermacht',       price = 28000,   category = 'coupes',         type = 'automobile', shop = 'pdm'},
    { model = 'previon',         name = 'Previon',                       brand = 'Karin',           price = 149000,  category = 'coupes',         type = 'automobile', shop = 'pdm'},
    { model = 'champion',        name = 'Champion',                      brand = 'Dewbauchee',      price = 205000,  category = 'coupes',         type = 'automobile', shop = 'pdm'},
    { model = 'futo',            name = 'Futo',                          brand = 'Karin',           price = 17500,   category = 'coupes',         type = 'automobile', shop = 'pdm'},
    { model = 'sentinel3',       name = 'Sentinel Classic',              brand = 'Übermacht',       price = 70000,   category = 'coupes',         type = 'automobile', shop = 'pdm'},
    { model = 'kanjosj',         name = 'Kanjo SJ',                      brand = 'Dinka',           price = 143000,  category = 'coupes',         type = 'automobile', shop = 'pdm'},
    { model = 'postlude',        name = 'Postlude',                      brand = 'Dinka',           price = 90000,   category = 'coupes',         type = 'automobile', shop = 'pdm'},
    { model = 'tahoma',          name = 'Tahoma Coupe',                  brand = 'Declasse',        price = 12000,   category = 'coupes',         type = 'automobile', shop = 'pdm'},
    { model = 'broadway',        name = 'Broadway',                      brand = 'Classique',       price = 20000,   category = 'coupes',         type = 'automobile', shop = 'pdm'},
    { model = 'fr36',            name = 'FR36',                          brand = 'Fathom',          price = 161000,  category = 'coupes',         type = 'automobile', shop = 'pdm'},
    --- Muscle (4)
    { model = 'blade',           name = 'Blade',                         brand = 'Vapid',           price = 23500,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'buccaneer',       name = 'Buccaneer',                     brand = 'Albany',          price = 22500,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'buccaneer2',      name = 'Buccaneer Rider',               brand = 'Albany',          price = 24500,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'chino',           name = 'Chino',                         brand = 'Vapid',           price = 5000,    category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'chino2',          name = 'Chino Luxe',                    brand = 'Vapid',           price = 8000,    category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'clique',          name = 'Clique',                        brand = 'Vapid',           price = 20000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'coquette3',       name = 'Coquette BlackFin',             brand = 'Invetero',        price = 180000,  category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'deviant',         name = 'Deviant',                       brand = 'Schyster',        price = 70000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'dominator',       name = 'Dominator',                     brand = 'Vapid',           price = 62500,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'dominator2',      name = 'Pißwasser Dominator',           brand = 'Vapid',           price = 50000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'dominator3',      name = 'Dominator GTX',                 brand = 'Vapid',           price = 70000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'dominator4',      name = 'Dominator Arena',               brand = 'Vapid',           price = 200000,  category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'dominator7',      name = 'Dominator ASP',                 brand = 'Vapid',           price = 110000,  category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'dominator8',      name = 'Dominator GTT',                 brand = 'Vapid',           price = 80000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'dukes',           name = 'Dukes',                         brand = 'Imponte',         price = 23500,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'dukes2',          name = 'Duke O\'Death',                 brand = 'Imponte',         price = 60000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'dukes3',          name = 'Beater Dukes',                  brand = 'Imponte',         price = 45000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'faction',         name = 'Faction',                       brand = 'Willard',         price = 17000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'faction2',        name = 'Faction Rider',                 brand = 'Willard',         price = 19000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'faction3',        name = 'Faction Custom Donk',           brand = 'Willard',         price = 35000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'ellie',           name = 'Ellie',                         brand = 'Vapid',           price = 42250,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'gauntlet',        name = 'Gauntlet',                      brand = 'Bravado',         price = 28500,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'gauntlet2',       name = 'Redwood Gauntlet',              brand = 'Bravado',         price = 70000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'gauntlet3',       name = 'Classic Gauntlet',              brand = 'Bravado',         price = 75000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'gauntlet4',       name = 'Gauntlet Hellfire',             brand = 'Bravado',         price = 80000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'gauntlet5',       name = 'Gauntlet Classic Custom',       brand = 'Bravado',         price = 120000,  category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'hermes',          name = 'Hermes',                        brand = 'Albany',          price = 535000,  category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'hotknife',        name = 'Hotknife',                      brand = 'Vapid',           price = 90000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'hustler',         name = 'Hustler',                       brand = 'Vapid',           price = 95000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'impaler',         name = 'Impaler',                       brand = 'Vapid',           price = 95000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'impaler2',        name = 'Impaler Arena',                 brand = 'Vapid',           price = 95000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'impaler3',        name = 'Impaler Future Shock',          brand = 'Vapid',           price = 95000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'impaler4',        name = 'Impaler Nightmare',             brand = 'Vapid',           price = 95000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'imperator',       name = 'Imperator Arena',               brand = 'Vapid',           price = 95000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'imperator2',      name = 'imperator Future Shock',        brand = 'Vapid',           price = 95000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'imperator3',      name = 'Imperator Nightmare',           brand = 'Vapid',           price = 95000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'lurcher',         name = 'Lurcher',                       brand = 'Bravado',         price = 21000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'nightshade',      name = 'Nightshade',                    brand = 'Imponte',         price = 70000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'phoenix',         name = 'Phoenix',                       brand = 'Imponte',         price = 65000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'picador',         name = 'Picador',                       brand = 'Cheval',          price = 20000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'ratloader2',      name = 'Ratloader',                     brand = 'Ratloader2',      price = 20000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'ruiner',          name = 'Ruiner',                        brand = 'Imponte',         price = 29000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'ruiner2',         name = 'Ruiner 2000',                   brand = 'Imponte',         price = 50000,   category = 'muscle',         type = 'automobile', shop = 'blacklisted'},
    { model = 'sabregt',         name = 'Sabre GT Turbo',                brand = 'Declasse',        price = 23000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'sabregt2',        name = 'Sabre GT Turbo Custom',         brand = 'Declasse',        price = 26500,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'slamvan',         name = 'Slam Van',                      brand = 'Vapid',           price = 30000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'slamvan2',        name = 'Lost Slam Van',                 brand = 'Vapid',           price = 90000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'slamvan3',        name = 'Slam Van Custom',               brand = 'Vapid',           price = 17000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'stalion',         name = 'Stallion',                      brand = 'Declasse',        price = 33000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'stalion2',        name = 'Stallion Burgershot',           brand = 'Declasse',        price = 40000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'tampa',           name = 'Tampa',                         brand = 'Declasse',        price = 24500,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'tulip',           name = 'Tulip',                         brand = 'Declasse',        price = 80000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'vamos',           name = 'Vamos',                         brand = 'Declasse',        price = 30000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'vigero',          name = 'Vigero',                        brand = 'Declasse',        price = 39500,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'virgo',           name = 'Virgo',                         brand = 'Albany',          price = 22000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'virgo2',          name = 'Virgo Custom Classic',          brand = 'Dundreary',       price = 21000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'virgo3',          name = 'Virgo Classic',                 brand = 'Dundreary',       price = 21000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'voodoo',          name = 'Voodoo',                        brand = 'Declasse',        price = 13000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'yosemite',        name = 'Yosemite',                      brand = 'Declasse',        price = 19500,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'yosemite2',       name = 'Yosemite Drift',                brand = 'Declasse',        price = 55000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'buffalo4',        name = 'Buffalo STX',                   brand = 'Bravado',         price = 345000,  category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'manana',          name = 'Manana',                        brand = 'Albany',          price = 12800,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'manana2',         name = 'Manana Custom',                 brand = 'Albany',          price = 24000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'tampa2',          name = 'Drift Tampa',                   brand = 'Declasse',        price = 80000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'ruiner4',         name = 'Ruiner ZZ-8',                   brand = 'Imponte',         price = 85000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'vigero2',         name = 'Vigero ZX',                     brand = 'Declasse',        price = 105000,  category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'weevil2',         name = 'Weevil Custom',                 brand = 'BF',              price = 95000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'buffalo5',        name = 'Buffalo EVX',                   brand = 'Bravado',         price = 214000,  category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'tulip2',          name = 'Tulip M-100',                   brand = 'Declasse',        price = 80000,   category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'clique2',         name = 'Clique Wagon',                  brand = 'Vapid',           price = 102500,  category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'brigham',         name = 'Brigham',                       brand = 'Albany',          price = 149900,  category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'greenwood',       name = 'Greenwood',                     brand = 'Bravado',         price = 105000,  category = 'muscle',         type = 'automobile', shop = 'customs'},
    { model = 'dominator9',      name = 'Dominator GT',                  brand = 'Vapid',           price = 219500,  category = 'muscle',         type = 'automobile', shop = ''},
    { model = 'impaler6',        name = 'Impaler LX',                    brand = 'Declasse',        price = 146500,  category = 'muscle',         type = 'automobile', shop = ''},
    { model = 'vigero3',         name = 'Vigero ZX Convertible',         brand = 'Declasse',        price = 229500,  category = 'muscle',         type = 'automobile', shop = ''},
    --- Sports Classic (5)
    { model = 'ardent',          name = 'Ardent',                        brand = 'Ocelot',          price = 30000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'btype',           name = 'Roosevelt',                     brand = 'Albany',          price = 75000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'btype2',          name = 'Franken Stange',                brand = 'Albany',          price = 87000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'btype3',          name = 'Roosevelt Valor',               brand = 'Albany',          price = 63000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'casco',           name = 'Casco',                         brand = 'Lampadati',       price = 100000,  category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'deluxo',          name = 'Deluxo',                        brand = 'Imponte',         price = 55000,   category = 'sportsclassics', type = 'automobile', shop = 'blacklisted'},
    { model = 'dynasty',         name = 'Dynasty',                       brand = 'Weeny',           price = 25000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'fagaloa',         name = 'Fagaloa',                       brand = 'Vulcar',          price = 13000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'feltzer3',        name = 'Stirling GT',                   brand = 'Benefactor',      price = 115000,  category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'gt500',           name = 'GT500',                         brand = 'Grotti',          price = 130000,  category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'infernus2',       name = 'Infernus Classic',              brand = 'Pegassi',         price = 245000,  category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'jb700',           name = 'JB 700',                        brand = 'Dewbauchee',      price = 240000,  category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'jb7002',          name = 'JB 700W',                       brand = 'Dewbauchee',      price = 40000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'mamba',           name = 'Mamba',                         brand = 'Declasse',        price = 140000,  category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'michelli',        name = 'Michelli GT',                   brand = 'Lampadati',       price = 30000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'monroe',          name = 'Monroe',                        brand = 'Pegassi',         price = 115000,  category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'nebula',          name = 'Nebula',                        brand = 'Vulcar',          price = 22000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'peyote',          name = 'Peyote',                        brand = 'Vapid',           price = 23500,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'peyote3',         name = 'Peyote Custom',                 brand = 'Vapid',           price = 48000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'pigalle',         name = 'Pigalle',                       brand = 'Lampadati',       price = 92000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'rapidgt3',        name = 'Rapid GT Classic',              brand = 'Dewbauchee',      price = 90000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'retinue',         name = 'Retinue',                       brand = 'Vapid',           price = 32000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'retinue2',        name = 'Retinue MKII',                  brand = 'Vapid',           price = 38000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'savestra',        name = 'Savestra',                      brand = 'Annis',           price = 67000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'stinger',         name = 'Stinger',                       brand = 'Grotti',          price = 39500,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'stingergt',       name = 'Stinger GT',                    brand = 'Grotti',          price = 70000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'stromberg',       name = 'Stromberg',                     brand = 'Ocelot',          price = 80000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'swinger',         name = 'Swinger',                       brand = 'Ocelot',          price = 221000,  category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'torero',          name = 'Torero',                        brand = 'Pegassi',         price = 84000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'tornado',         name = 'Tornado',                       brand = 'Declasse',        price = 21000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'tornado2',        name = 'Tornado Convertible',           brand = 'Declasse',        price = 22000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'tornado5',        name = 'Tornado Custom',                brand = 'Declasse',        price = 22000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'turismo2',        name = 'Turismo Classic',               brand = 'Grotti',          price = 170000,  category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'viseris',         name = 'Viseris',                       brand = 'Lampadati',       price = 210000,  category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'z190',            name = '190Z',                          brand = 'Karin',           price = 78000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'ztype',           name = 'Z-Type',                        brand = 'Truffade',        price = 270000,  category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'zion3',           name = 'Zion Classic',                  brand = 'Übermacht',       price = 45000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'cheburek',        name = 'Cheburek',                      brand = 'Rune',            price = 7000,    category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'toreador',        name = 'Toreador',                      brand = 'Pegassi',         price = 50000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'peyote2',         name = 'Peyote Gasser',                 brand = 'Vapid',           price = 40000,   category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'coquette2',       name = 'Coquette Classic',              brand = 'Invetero',        price = 165000,  category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'envisage',        name = 'Envisage',                      brand = 'Bollokan',        price = 190000,  category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    { model = 'driftnebula',     name = 'Nebula Turbo',                  brand = 'Vulcar',          price = 100000,  category = 'sportsclassics', type = 'automobile', shop = 'pdm'},
    --- Sports (6)
    { model = 'alpha',           name = 'Alpha',                         brand = 'Albany',          price = 53000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'banshee',         name = 'Banshee',                       brand = 'Bravado',         price = 56000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'bestiagts',       name = 'Bestia GTS',                    brand = 'Grotti',          price = 37000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'buffalo',         name = 'Buffalo',                       brand = 'Bravado',         price = 18750,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'buffalo2',        name = 'Buffalo S',                     brand = 'Bravado',         price = 24500,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'carbonizzare',    name = 'Carbonizzare',                  brand = 'Grotti',          price = 155000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'comet2',          name = 'Comet',                         brand = 'Pfister',         price = 130000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'comet3',          name = 'Comet Retro Custom',            brand = 'Pfister',         price = 175000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'comet4',          name = 'Comet Safari',                  brand = 'Pfister',         price = 110000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'comet5',          name = 'Comet SR',                      brand = 'Pfister',         price = 155000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'coquette',        name = 'Coquette',                      brand = 'Invetero',        price = 145000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'coquette4',       name = 'Coquette D10',                  brand = 'Invetero',        price = 220000,  category = 'sports',         type = 'automobile', shop = ''},
    { model = 'drafter',         name = '8F Drafter',                    brand = 'Obey',            price = 80000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'elegy',           name = 'Elegy Retro Custom',            brand = 'Annis',           price = 145000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'elegy2',          name = 'Elegy RH8',                     brand = 'Annis',           price = 150000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'feltzer2',        name = 'Feltzer',                       brand = 'Benefactor',      price = 97000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'flashgt',         name = 'Flash GT',                      brand = 'Vapid',           price = 48000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'furoregt',        name = 'Furore GT',                     brand = 'Lampadati',       price = 78000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'gb200',           name = 'GB 200',                        brand = 'Vapid',           price = 140000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'komoda',          name = 'Komoda',                        brand = 'Lampadati',       price = 55000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'imorgon',         name = 'Imorgon',                       brand = 'Överflöd',        price = 120000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'italigto',        name = 'Itali GTO',                     brand = 'Progen',          price = 260000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'jugular',         name = 'Jugular',                       brand = 'Ocelot',          price = 80000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'jester',          name = 'Jester',                        brand = 'Dinka',           price = 132250,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'jester2',         name = 'Jester Racecar',                brand = 'Dinka',           price = 210000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'jester3',         name = 'Jester Classic',                brand = 'Dinka',           price = 85000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'khamelion',       name = 'Khamelion',                     brand = 'Hijak',           price = 90000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'kuruma',          name = 'Kuruma',                        brand = 'Karin',           price = 72000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'kuruma2',         name = 'kuruma2',                       brand = 'Karin2',          price = 72000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'locust',          name = 'Locust',                        brand = 'Ocelot',          price = 200000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'lynx',            name = 'Lynx',                          brand = 'Ocelot',          price = 150000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'massacro',        name = 'Massacro',                      brand = 'Dewbauchee',      price = 110000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'massacro2',       name = 'Massacro Racecar',              brand = 'Dewbauchee',      price = 80000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'neo',             name = 'Neo',                           brand = 'Vysser',          price = 230000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'neon',            name = 'Neon',                          brand = 'Pfister',         price = 220000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'ninef',           name = '9F',                            brand = 'Obey',            price = 95000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'ninef2',          name = '9F Cabrio',                     brand = 'Obey',            price = 105000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'omnis',           name = 'Omnis',                         brand = 'Wow',             price = 90000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'paragon',         name = 'Paragon',                       brand = 'Enus',            price = 60000,   category = 'sports',         type = 'automobile', shop = ''},
    { model = 'pariah',          name = 'Pariah',                        brand = 'Ocelot',          price = 90000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'penumbra',        name = 'Penumbra',                      brand = 'Maibatsu',        price = 22000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'penumbra2',       name = 'Penumbra FF',                   brand = 'Maibatsu',        price = 30000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'rapidgt',         name = 'Rapid GT',                      brand = 'Dewbauchee',      price = 86000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'rapidgt2',        name = 'Rapid GT Convertible',          brand = 'Dewbauchee',      price = 92000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'raptor',          name = 'Raptor',                        brand = 'BF',              price = 90000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'revolter',        name = 'Revolter',                      brand = 'Übermacht',       price = 95000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'ruston',          name = 'Ruston',                        brand = 'Hijak',           price = 130000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'schafter3',       name = 'Schafter V12',                  brand = 'Benefactor',      price = 35000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'schafter4',       name = 'Schafter LWB',                  brand = 'Benefactor',      price = 21000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'schlagen',        name = 'Schlagen GT',                   brand = 'Benefactor',      price = 160000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'schwarzer',       name = 'Schwartzer',                    brand = 'Benefactor',      price = 47000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'seven70',         name = 'Seven-70',                      brand = 'Dewbauchee',      price = 140000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'specter',         name = 'Specter',                       brand = 'Dewbauchee',      price = 160000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'streiter',        name = 'Streiter',                      brand = 'Benefactor',      price = 40000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'sugoi',           name = 'Sugoi',                         brand = 'Dinka',           price = 85000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'sultan',          name = 'Sultan',                        brand = 'Karin',           price = 50000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'sultan2',         name = 'Sultan Custom',                 brand = 'Karin',           price = 55000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'surano',          name = 'Surano',                        brand = 'Benefactor',      price = 80000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'tropos',          name = 'Tropos Rallye',                 brand = 'Lampadati',       price = 65000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'verlierer2',      name = 'Verlierer',                     brand = 'Bravado',         price = 90500,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'vstr',            name = 'V-STR',                         brand = 'Albany',          price = 80000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'italirsx',        name = 'Itali RSX',                     brand = 'Progen',          price = 260000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'zr350',           name = 'ZR350',                         brand = 'Annis',           price = 38000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'calico',          name = 'Calico GTF',                    brand = 'Karin',           price = 39000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'futo2',           name = 'Futo GTX',                      brand = 'Karin',           price = 39000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'euros',           name = 'Euros',                         brand = 'Annis',           price = 80000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'jester4',         name = 'Jester RR',                     brand = 'Dinka',           price = 240000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'remus',           name = 'Remus',                         brand = 'Annis',           price = 48000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'comet6',          name = 'Comet S2',                      brand = 'Pfister',         price = 230000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'growler',         name = 'Growler',                       brand = 'Pfister',         price = 205000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'vectre',          name = 'Vectre',                        brand = 'Emperor',         price = 80000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'cypher',          name = 'Cypher',                        brand = 'Übermacht',       price = 155000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'sultan3',         name = 'Sultan Classic Custom',         brand = 'Karin',           price = 56000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'rt3000',          name = 'RT3000',                        brand = 'Dinka',           price = 65000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'sultanrs',        name = 'Sultan RS',                     brand = 'Karin',           price = 76500,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'visione',         name = 'Visione',                       brand = 'Grotti',          price = 750000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'cheetah2',        name = 'Cheetah Classic',               brand = 'Grotti',          price = 195000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'stingertt',       name = 'Itali GTO Stinger TT',          brand = 'Maibatsu',        price = 238000,  category = 'sports',         type = 'automobile', shop = 'pdm'},
    { model = 'omnisegt',        name = 'Omnis e-GT',                    brand = 'Obey',            price = 185000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'sentinel4',       name = 'Sentinel Classic Widebody',     brand = 'Übermacht',       price = 140000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'sm722',           name = 'SM722',                         brand = 'Benefactor',      price = 125000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'tenf',            name = '10F',                           brand = 'Obey',            price = 185000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'tenf2',           name = '10F Widebody',                  brand = 'Obey',            price = 215000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'everon2',         name = 'Everon Hotring',                brand = 'Karin',           price = 80000,   category = 'sports',         type = 'automobile', shop = 'pdm'},
    { model = 'issi8',           name = 'Issi Rally',                    brand = 'Weeny',           price = 10000,   category = 'sports',         type = 'automobile', shop = 'pdm'},
    { model = 'corsita',         name = 'Corsita',                       brand = 'Lampadati',       price = 90000,   category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'gauntlet6',       name = 'Hotring Hellfire',              brand = 'Bravado',         price = 181000,  category = 'sports',         type = 'automobile', shop = 'pdm'},
    { model = 'coureur',         name = 'La Coureuse',                   brand = 'Penaud',          price = 199000,  category = 'sports',         type = 'automobile', shop = 'pdm'},
    { model = 'r300',            name = '300R',                          brand = 'Annis',           price = 56000,   category = 'sports',         type = 'automobile', shop = 'pdm'},
    { model = 'panthere',        name = 'Panthere',                      brand = 'Toundra',         price = 55000,   category = 'sports',         type = 'automobile', shop = 'pdm'},
    { model = 'driftsentinel',   name = 'Drift Sentinel Classic',        brand = 'Ubermacht',       price = 150000,  category = 'sports',         type = 'automobile', shop = ''},
    { model = 'paragon3',        name = 'Paragon S',                     brand = 'Enus',            price = 220000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'eurosX32',        name = 'Euros X32',                     brand = 'Annis',           price = 180000,  category = 'sports',         type = 'automobile', shop = ''},
    { model = 'vorschlaghammer', name = 'Vorschlaghammer',               brand = 'Pfister',         price = 250000,  category = 'sports',         type = 'automobile', shop = ''},
    { model = 'driftcypher',     name = 'Drift Cypher',                  brand = 'Ubermacht',       price = 160000,  category = 'sports',         type = 'automobile', shop = ''},
    { model = 'coquette5',       name = 'Coquette D1',                   brand = 'Invetero',        price = 220000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    { model = 'niobe',           name = 'Niobe',                         brand = 'Ubermacht',       price = 180000,  category = 'sports',         type = 'automobile', shop = ''},
    { model = 'driftvorschlag',  name = 'Vorschlaghammer',               brand = 'Pfister',         price = 250000,  category = 'sports',         type = 'automobile', shop = 'customs'},
    --- Super (7)
    { model = 'adder',           name = 'Adder',                         brand = 'Truffade',        price = 280000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'autarch',         name = 'Autarch',                       brand = 'Överflöd',        price = 224000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'banshee2',        name = 'Banshee 900R',                  brand = 'Bravado',         price = 120000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'bullet',          name = 'Bullet',                        brand = 'Vapid',           price = 120000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'cheetah',         name = 'Cheetah',                       brand = 'Grotti',          price = 214000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'cyclone',         name = 'Cyclone',                       brand = 'Coil',            price = 300000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'entity2',         name = 'Entity XXR',                    brand = 'Överflöd',        price = 164000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'entityxf',        name = 'Entity XF',                     brand = 'Överflöd',        price = 180000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'emerus',          name = 'Emerus',                        brand = 'Progen',          price = 220000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'fmj',             name = 'FMJ',                           brand = 'Vapid',           price = 125000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'furia',           name = 'Furia',                         brand = 'Grotti',          price = 230000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'gp1',             name = 'GP1',                           brand = 'Progen',          price = 110000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'infernus',        name = 'Infernus',                      brand = 'Pegassi',         price = 235000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'italigtb',        name = 'Itali GTB',                     brand = 'Progen',          price = 170000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'italigtb2',       name = 'Itali GTB Custom',              brand = 'Progen',          price = 250000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'krieger',         name = 'Krieger',                       brand = 'Benefactor',      price = 222000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'le7b',            name = 'RE-7B',                         brand = 'Annis',           price = 260000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'nero',            name = 'Nero',                          brand = 'Truffade',        price = 200000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'nero2',           name = 'Nero Custom',                   brand = 'Truffade',        price = 260000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'osiris',          name = 'Osiris',                        brand = 'Pegassi',         price = 220000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'penetrator',      name = 'Penetrator',                    brand = 'Ocelot',          price = 130000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'pfister811',      name = '811',                           brand = 'Pfister',         price = 220000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'prototipo',       name = 'X80 Proto',                     brand = 'Grotti',          price = 235000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'reaper',          name = 'Reaper',                        brand = 'Pegassi',         price = 100000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 's80',             name = 'S80RR',                         brand = 'Annis',           price = 205000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'sc1',             name = 'SC1',                           brand = 'Übermacht',       price = 90000,   category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'sheava',          name = 'ETR1',                          brand = 'Emperor',         price = 220000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 't20',             name = 'T20',                           brand = 'Progen',          price = 1650000, category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'taipan',          name = 'Taipan',                        brand = 'Cheval',          price = 1850000, category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'tempesta',        name = 'Tempesta',                      brand = 'Pegassi',         price = 120000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'tezeract',        name = 'Tezeract',                      brand = 'Pegassi',         price = 220000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'thrax',           name = 'Thrax',                         brand = 'Truffade',        price = 180000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'tigon',           name = 'Tigon',                         brand = 'Lampadati',       price = 240000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'turismor',        name = 'Turismo R',                     brand = 'Grotti',          price = 140000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'tyrant',          name = 'Tyrant',                        brand = 'Överflöd',        price = 2100000, category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'tyrus',           name = 'Tyrus',                         brand = 'Progen',          price = 230000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'vacca',           name = 'Vacca',                         brand = 'Pegassi',         price = 105000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'vagner',          name = 'Vagner',                        brand = 'Dewbauchee',      price = 1660000, category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'voltic',          name = 'Voltic',                        brand = 'Coil',            price = 120000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'voltic2',         name = 'Rocket Voltic',                 brand = 'Coil',            price = 9830400, category = 'super',          type = 'automobile', shop = 'blacklisted'},
    { model = 'xa21',            name = 'XA-21',                         brand = 'Ocelot',          price = 180000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'zentorno',        name = 'Zentorno',                      brand = 'Pegassi',         price = 340000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'zorrusso',        name = 'Zorrusso',                      brand = 'Pegassi',         price = 277000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'ignus',           name = 'Ignus',                         brand = 'Pegassi',         price = 1120000, category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'zeno',            name = 'Zeno',                          brand = 'Överflöd',        price = 1350000, category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'deveste',         name = 'Deveste',                       brand = 'Principe',        price = 234000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'lm87',            name = 'LM87',                          brand = 'Benefactor',      price = 155000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'torero2',         name = 'Torero XO',                     brand = 'Pegassi',         price = 245000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'entity3',         name = 'Entity MT',                     brand = 'Overflod',        price = 200000,  category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'virtue',          name = 'Virtue',                        brand = 'Ocelot',          price = 72000,   category = 'super',          type = 'automobile', shop = 'luxery'},
    { model = 'turismo3',        name = 'Turismo Omaggio',               brand = 'Grotti',          price = 284500,  category = 'super',          type = 'automobile', shop = 'luxery'},
    --- Motorcycles (8)
    { model = 'akuma',           name = 'Akuma',                         brand = 'Dinka',           price = 55000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'avarus',          name = 'Avarus',                        brand = 'LCC',             price = 20000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'bagger',          name = 'Bagger',                        brand = 'WMC',             price = 13500,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'bati',            name = 'Bati 801',                      brand = 'Pegassi',         price = 24000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'bati2',           name = 'Bati 801RR',                    brand = 'Pegassi',         price = 19000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'bf400',           name = 'BF400',                         brand = 'Nagasaki',        price = 22000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'carbonrs',        name = 'Carbon RS',                     brand = 'Nagasaki',        price = 22000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'chimera',         name = 'Chimera',                       brand = 'Nagasaki',        price = 21000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'cliffhanger',     name = 'Cliffhanger',                   brand = 'Western',         price = 28500,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'daemon',          name = 'Daemon',                        brand = 'WMC',             price = 14000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'daemon2',         name = 'Daemon Custom',                 brand = 'Western',         price = 23000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'defiler',         name = 'Defiler',                       brand = 'Shitzu',          price = 30000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'deathbike',       name = 'Deathbike Apocalypse',          brand = 'Deathbike',       price = 30000,   category = 'motorcycles',    type = 'bike',       shop = 'blacklisted'},
    { model = 'deathbike2',      name = 'Deathbike Future Shock',        brand = 'Deathbike',       price = 30000,   category = 'motorcycles',    type = 'bike',       shop = 'blacklisted'},
    { model = 'deathbike3',      name = 'Deathbike Nightmare',           brand = 'Deathbike',       price = 30000,   category = 'motorcycles',    type = 'bike',       shop = 'blacklisted'},
    { model = 'diablous',        name = 'Diablous',                      brand = 'Principe',        price = 30000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'diablous2',       name = 'Diablous Custom',               brand = 'Principe',        price = 38000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'double',          name = 'Double-T',                      brand = 'Dinka',           price = 28000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'enduro',          name = 'Enduro',                        brand = 'Dinka',           price = 5500,    category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'esskey',          name = 'Esskey',                        brand = 'Pegassi',         price = 12000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'faggio',          name = 'Faggio Sport',                  brand = 'Pegassi',         price = 2000,    category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'faggio2',         name = 'Faggio',                        brand = 'Pegassi',         price = 1900,    category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'faggio3',         name = 'Faggio Mod',                    brand = 'Pegassi',         price = 2500,    category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'fcr',             name = 'FCR 1000',                      brand = 'Pegassi',         price = 5000,    category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'fcr2',            name = 'FCR 1000 Custom',               brand = 'Pegassi',         price = 19000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'gargoyle',        name = 'Gargoyle',                      brand = 'Western',         price = 32000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'hakuchou',        name = 'Hakuchou',                      brand = 'Shitzu',          price = 17000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'hakuchou2',       name = 'Hakuchou Drag',                 brand = 'Shitzu',          price = 45000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'hexer',           name = 'Hexer',                         brand = 'LCC',             price = 16000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'innovation',      name = 'Innovation',                    brand = 'LLC',             price = 33500,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'lectro',          name = 'Lectro',                        brand = 'Principe',        price = 28000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'manchez',         name = 'Manchez',                       brand = 'Maibatsu',        price = 8300,    category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'nemesis',         name = 'Nemesis',                       brand = 'Principe',        price = 20000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'nightblade',      name = 'Nightblade',                    brand = 'WMC',             price = 23000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'oppressor',       name = 'Oppressor',                     brand = 'Pegassi',         price = 9999999, category = 'motorcycles',    type = 'bike',       shop = 'blacklisted'},
    { model = 'pcj',             name = 'PCJ-600',                       brand = 'Shitzu',          price = 15000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'ratbike',         name = 'Rat Bike',                      brand = 'Western',         price = 3000,    category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'ruffian',         name = 'Ruffian',                       brand = 'Pegassi',         price = 25000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'sanchez',         name = 'Sanchez Livery',                brand = 'Maibatsu',        price = 5300,    category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'sanchez2',        name = 'Sanchez',                       brand = 'Maibatsu',        price = 5300,    category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'sanctus',         name = 'Sanctus',                       brand = 'LCC',             price = 35000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'shotaro',         name = 'Shotaro',                       brand = 'Nagasaki',        price = 320000,  category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'sovereign',       name = 'Sovereign',                     brand = 'WMC',             price = 8000,    category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'stryder',         name = 'Stryder',                       brand = 'Nagasaki',        price = 50000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'thrust',          name = 'Thrust',                        brand = 'Dinka',           price = 22000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'vader',           name = 'Vader',                         brand = 'Shitzu',          price = 7200,    category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'vindicator',      name = 'Vindicator',                    brand = 'Dinka',           price = 19000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'vortex',          name = 'Vortex',                        brand = 'Pegassi',         price = 31000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'wolfsbane',       name = 'Wolfsbane',                     brand = 'Western',         price = 14000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'zombiea',         name = 'Zombie Bobber',                 brand = 'Western',         price = 28000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'zombieb',         name = 'Zombie Chopper',                brand = 'Western',         price = 27000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'manchez2',        name = 'Manchez Scout',                 brand = 'Maibatsu',        price = 14000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'shinobi',         name = 'Shinobi',                       brand = 'Nagasaki',        price = 25000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'reever',          name = 'Reever',                        brand = 'Western',         price = 25000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'manchez3',        name = 'Manchez Scout Classic',         brand = 'Maibatsu',        price = 15000,   category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'powersurge',      name = 'Powersurge',                    brand = 'Western',         price = 7000,    category = 'motorcycles',    type = 'bike',       shop = 'rbikes'},
    { model = 'pizzaboy',        name = 'Pizza Boy',                     brand = 'Pegassi',         price = 50000,   category = 'motorcycles',    type = 'bike',       shop = ''},
    --- Off-Road (9)
    { model = 'bfinjection',     name = 'Bf Injection',                  brand = 'Annis',           price = 9000,    category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'bifta',           name = 'Bifta',                         brand = 'Annis',           price = 15500,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'blazer',          name = 'Blazer',                        brand = 'Annis',           price = 7500,    category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'blazer2',         name = 'Blazer Lifeguard',              brand = 'Nagasaki',        price = 7000,    category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'blazer3',         name = 'Blazer Hot Rod',                brand = 'Nagasaki',        price = 7000,    category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'blazer4',         name = 'Blazer Sport',                  brand = 'Annis',           price = 9250,    category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'blazer5',         name = 'Blazer Aqua',                   brand = 'Nagasaki',        price = 40000,   category = 'offroad',        type = 'automobile', shop = 'none'},
    { model = 'brawler',         name = 'Brawler',                       brand = 'Annis',           price = 40000,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'caracara',        name = 'Caracara',                      brand = 'Vapid',           price = 60000,   category = 'offroad',        type = 'automobile', shop = 'blacklisted'},
    { model = 'caracara2',       name = 'Caracara 4x4',                  brand = 'Vapid',           price = 80000,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'dubsta3',         name = 'Dubsta 6x6',                    brand = 'Annis',           price = 34000,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'dune',            name = 'Dune Buggy',                    brand = 'Annis',           price = 14000,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'everon',          name = 'Everon',                        brand = 'Karin',           price = 60000,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'freecrawler',     name = 'Freecrawler',                   brand = 'Canis',           price = 24000,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'hellion',         name = 'Hellion',                       brand = 'Annis',           price = 38000,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'kalahari',        name = 'Kalahari',                      brand = 'Canis',           price = 14000,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'kamacho',         name = 'Kamacho',                       brand = 'Canis',           price = 50000,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'mesa3',           name = 'Mesa Merryweather',             brand = 'Canis',           price = 400000,  category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'outlaw',          name = 'Outlaw',                        brand = 'Nagasaki',        price = 15000,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'rancherxl',       name = 'Rancher XL',                    brand = 'Declasse',        price = 24000,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'rebel2',          name = 'Rebel',                         brand = 'Vapid',           price = 20000,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'riata',           name = 'Riata',                         brand = 'Vapid',           price = 380000,  category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'sandking',        name = 'Sandking XL',                   brand = 'Vapid',           price = 25000,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'sandking2',       name = 'Sandking SWB',                  brand = 'Vapid',           price = 38000,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'trophytruck',     name = 'Trophy Truck',                  brand = 'Vapid',           price = 60000,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'trophytruck2',    name = 'Desert Raid',                   brand = 'Vapid',           price = 80000,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'vagrant',         name = 'Vagrant',                       brand = 'Maxwell',         price = 50000,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'verus',           name = 'Verus',                         brand = 'Dinka',           price = 20000,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'winky',           name = 'Winky',                         brand = 'Vapid',           price = 10000,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'yosemite3',       name = 'Yosemite Rancher',              brand = 'Declasse',        price = 425000,  category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'mesa',            name = 'Mesa',                          brand = 'Canis',           price = 12000,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'ratel',           name = 'Ratel',                         brand = 'Vapid',           price = 199000,  category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'l35',             name = 'Walton L35',                    brand = 'Declasse',        price = 167000,  category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'monstrociti',     name = 'MonstroCiti',                   brand = 'Maibatsu',        price = 48000,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'draugur',         name = 'Draugur',                       brand = 'Declasse',        price = 99000,   category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'terminus',        name = 'Terminus',                      brand = 'Canis',           price = 187750,  category = 'offroad',        type = 'automobile', shop = 'pdm'},
    { model = 'yosemite4',       name = 'Yosemite 1500',                 brand = 'Declasse',        price = 187750,  category = 'offroad',        type = 'automobile', shop = 'pdm'},
    --- Industrial (10)
    { model = 'guardian',        name = 'Guardian',                      brand = 'Vapid',           price = 2530000,   category = 'industrial',     type = 'automobile', shop = 'truck'},
    { model = 'mixer2',          name = 'Mixer II',                      brand = 'HVY',             price = 2530000,   category = 'industrial',     type = 'automobile', shop = 'truck'},
    { model = 'tiptruck2',       name = 'Tipper II',                     brand = 'Brute',           price = 2530000,   category = 'industrial',     type = 'automobile', shop = 'truck'},
    { model = 'tiptruck',        name = 'Tipper',                        brand = 'Brute',           price = 2530000,   category = 'industrial',     type = 'automobile', shop = 'truck'},
    { model = 'rubble',          name = 'Rubble',                        brand = 'Jobuilt',         price = 2530000,   category = 'industrial',     type = 'automobile', shop = 'truck'},
    { model = 'mixer',           name = 'Mixer',                         brand = 'HVY',             price = 2530000,   category = 'industrial',     type = 'automobile', shop = 'truck'},
    { model = 'flatbed',         name = 'Flatbed Truck',                 brand = 'MTL',             price = 2530000,   category = 'trailers',     type = 'automobile', shop = 'trailersrus'},
    { model = 'dump',            name = 'Dump Truck',                    brand = 'HVY',             price = 2530000,   category = 'industrial',     type = 'automobile', shop = 'truck'},
    { model = 'bulldozer',       name = 'Dozer',                         brand = 'HVY',             price = 2530000,   category = 'industrial',     type = 'automobile', shop = 'truck'},
    { model = 'handler',         name = 'Dock Handler',                  brand = 'HVY',             price = 2530000,   category = 'industrial',     type = 'automobile', shop = 'truck'},
    { model = 'cutter',          name = 'Cutter',                        brand = 'HVY',             price = 2530000,   category = 'industrial',     type = 'automobile', shop = 'truck'},
    --- Utility (11)
    { model = 'slamtruck',       name = 'Slam Truck',                    brand = 'Vapid',           price = 2100000,  category = 'utility',        type = 'automobile', shop = ''},
    { model = 'caddy3',          name = 'Caddy (Bunker)',                brand = 'Nagasaki',        price = 2530000,   category = 'utility',        type = 'automobile', shop = 'truck'},
    { model = 'caddy2',          name = 'Caddy (Civilian)',              brand = 'Nagasaki',        price = 2530000,   category = 'utility',        type = 'automobile', shop = 'truck'},
    { model = 'caddy3',          name = 'Caddy (Golf)',                  brand = 'Nagasaki',        price = 2530000,   category = 'utility',        type = 'automobile', shop = 'truck'},
    { model = 'utillitruck',     name = 'Utility Truck (Cherry Picker)', brand = 'Brute',           price = 2530000,   category = 'utility',        type = 'automobile', shop = 'truck'},
    { model = 'utillitruck2',    name = 'Utility Truck (Van)',           brand = 'Brute',           price = 2530000,   category = 'utility',        type = 'automobile', shop = 'truck'},
    { model = 'utillitruck3',    name = 'Utility Truck (Contender)',     brand = 'Vapid',           price = 2530000,   category = 'utility',        type = 'automobile', shop = 'truck'},
    { model = 'tractor',         name = 'Tractor',                       brand = 'Stanley',         price = 2530000,   category = 'utility',        type = 'automobile', shop = 'truck'},
    { model = 'tractor2',        name = 'Fieldmaster',                   brand = 'Stanley',         price = 2530000,   category = 'utility',        type = 'automobile', shop = 'truck'},
    { model = 'tractor3',        name = 'Fieldmaster',                   brand = 'Stanley',         price = 2530000,   category = 'utility',        type = 'automobile', shop = 'truck'},
    { model = 'towtruck',        name = 'Tow Truck (Large)',             brand = 'Vapid',           price = 2530000,   category = 'utility',        type = 'automobile', shop = 'truck'},
    { model = 'towtruck2',       name = 'Tow Truck (Small)',             brand = 'Vapid',           price = 2530000,   category = 'utility',        type = 'automobile', shop = 'truck'},
    { model = 'scrap',           name = 'Scrap Truck',                   brand = 'Vapid',           price = 2530000,   category = 'utility',        type = 'automobile', shop = 'truck'},
    { model = 'sadler',          name = 'Sadler',                        brand = 'Vapid',           price = 2520000,   category = 'utility',        type = 'automobile', shop = 'truck'},
    { model = 'ripley',          name = 'Ripley',                        brand = 'HVY',             price = 2530000,   category = 'utility',        type = 'automobile', shop = 'truck'},
    { model = 'mower',           name = 'Lawn Mower',                    brand = 'Jacksheepe',      price = 230000,   category = 'utility',        type = 'automobile', shop = 'truck'},
    { model = 'forklift',        name = 'Forklift',                      brand = 'HVY',             price = 230000,   category = 'utility',        type = 'automobile', shop = 'blacklisted'},
    { model = 'docktug',         name = 'Docktug',                       brand = 'HVY',             price = 230000,   category = 'utility',        type = 'automobile', shop = 'blacklisted'},
    { model = 'airtug',          name = 'Airtug',                        brand = 'HVY',             price = 230000,   category = 'utility',        type = 'automobile', shop = 'blacklisted'},
    { model = 'trailers5',       name = 'Trailer (Christmas)',           brand = 'Unknown',         price = 230000,   category = 'utility',        type = 'automobile', shop = 'blacklisted'},
    
	{ model = 'tr2',      			name = 'Multi Car Stack',               brand = 'Unknown',         price = 900000,   category = 'trailers',        type = 'automobile', shop = ''},
    { model = 'boattrailer',      	name = 'Boat Trailer',                  brand = 'Unknown',         price = 90000,    category = 'trailers',        type = 'automobile', shop = ''},
    { model = 'trailersmall',      	name = 'Small Trailer',                 brand = 'Unknown',         price = 30000,    category = 'trailers',        type = 'automobile', shop = ''},
    { model = 'trailers3',      	name = 'Box Trailer LRG',               brand = 'Unknown',         price = 100000,   category = 'trailers',        type = 'automobile', shop = ''},
    { model = 'trflat',      		name = 'Flat Trailer',                  brand = 'Unknown',         price = 300000,   category = 'trailers',        type = 'automobile', shop = ''},
    --- Vans (12)
    { model = 'bison',           name = 'Bison',                         brand = 'Bravado',         price = 18000,   category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'bobcatxl',        name = 'Bobcat XL Open',                brand = 'Vapid',           price = 13500,   category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'burrito3',        name = 'Burrito',                       brand = 'Declasse',        price = 4000,    category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'gburrito2',       name = 'Burrito Custom',                brand = 'Declasse',        price = 11500,   category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'rumpo',           name = 'Rumpo',                         brand = 'Bravado',         price = 9000,    category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'journey',         name = 'Journey',                       brand = 'Zirconium',       price = 6500,    category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'minivan',         name = 'Minivan',                       brand = 'Vapid',           price = 7000,    category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'minivan2',        name = 'Minivan Custom',                brand = 'Vapid',           price = 10000,   category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'paradise',        name = 'Paradise',                      brand = 'Bravado',         price = 9000,    category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'rumpo3',          name = 'Rumpo Custom',                  brand = 'Bravado',         price = 19500,   category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'speedo',          name = 'Speedo',                        brand = 'Vapid',           price = 10000,   category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'speedo4',         name = 'Speedo Custom',                 brand = 'Vapid',           price = 15000,   category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'surfer',          name = 'Surfer',                        brand = 'BF',              price = 9000,    category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'youga3',          name = 'Youga Classic 4x4',             brand = 'Bravado',         price = 15000,   category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'youga',           name = 'Youga',                         brand = 'Bravado',         price = 8000,    category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'youga2',          name = 'Youga Classic',                 brand = 'Bravado',         price = 14500,   category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'youga4',          name = 'Youga Custom',                  brand = 'Bravado',         price = 85000,   category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'moonbeam',        name = 'Moonbeam',                      brand = 'Declasse',        price = 13000,   category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'moonbeam2',       name = 'Moonbeam Custom',               brand = 'Declasse',        price = 15000,   category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'boxville',        name = 'Boxville LSDWP',                brand = 'Brute',           price = 445000,   category = 'vans',           type = 'automobile', shop = 'truck'},
    { model = 'boxville2',       name = 'Boxville Go Postal',            brand = 'Brute',           price = 445000,   category = 'vans',           type = 'automobile', shop = 'truck'},
    { model = 'boxville3',       name = 'Boxville Humane Labs',          brand = 'Brute',           price = 445000,   category = 'vans',           type = 'automobile', shop = 'truck'},
    { model = 'boxville4',       name = 'Boxville Post OP',              brand = 'Brute',           price = 445000,   category = 'vans',           type = 'automobile', shop = 'truck'},
    { model = 'boxville5',       name = 'Armored Boxville',              brand = 'Brute',           price = 45000,   category = 'vans',           type = 'automobile', shop = 'none'},
    { model = 'pony',            name = 'Pony',                          brand = 'Brute',           price = 445000,   category = 'vans',           type = 'automobile', shop = 'truck'},
    { model = 'pony2',           name = 'Pony (Smoke on the water)',     brand = 'Brute',           price = 445000,   category = 'vans',           type = 'automobile', shop = 'truck'},
    { model = 'journey2',        name = 'Journey II',                    brand = 'Zirconium',       price = 7000,    category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'surfer3',         name = 'Surfer Custom',                 brand = 'BF',              price = 15000,   category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'speedo5',         name = 'Speedo Custom',                 brand = 'Vapid',           price = 238000,  category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'mule2',           name = 'Mule',                          brand = 'Maibatsu',        price = 40000,   category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'mule3',           name = 'Mule',                          brand = 'Maibatsu',        price = 40000,   category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'taco',            name = 'Taco Truck',                    brand = 'Brute',           price = 45000,   category = 'vans',           type = 'automobile', shop = 'pdm'},
    { model = 'boxville6',       name = 'Boxville (LSDS)',               brand = 'Brute',           price = 47500,   category = 'vans',           type = 'automobile', shop = 'pdm'},
    --- Cycles (13)
    { model = 'bmx',             name = 'BMX',                           brand = 'Bike',            price = 160,     category = 'cycles',         type = 'bike',       shop = 'pdm'},
    { model = 'cruiser',         name = 'Cruiser',                       brand = 'Bike',            price = 510,     category = 'cycles',         type = 'bike',       shop = 'pdm'},
    { model = 'fixter',          name = 'Fixter',                        brand = 'Bike',            price = 225,     category = 'cycles',         type = 'bike',       shop = 'pdm'},
    { model = 'scorcher',        name = 'Scorcher',                      brand = 'Bike',            price = 280,     category = 'cycles',         type = 'bike',       shop = 'pdm'},
    { model = 'tribike',         name = 'Whippet Race Bike',             brand = 'Bike',            price = 500,     category = 'cycles',         type = 'bike',       shop = 'pdm'},
    { model = 'tribike2',        name = 'Endurex Race Bike',             brand = 'Bike',            price = 700,     category = 'cycles',         type = 'bike',       shop = 'pdm'},
    { model = 'tribike3',        name = 'Tri-Cycles Race Bike',          brand = 'Bike',            price = 520,     category = 'cycles',         type = 'bike',       shop = 'pdm'},
    { model = 'inductor',        name = 'Inductor',                      brand = 'Coil',            price = 5000,    category = 'cycles',         type = 'bike',       shop = 'pdm'},
    { model = 'inductor2',       name = 'Junk Energy Inductor',          brand = 'Coil',            price = 5000,    category = 'cycles',         type = 'bike',       shop = 'pdm'},
    --- Boats (14)
    { model = 'avisa',           name = 'Avisa',                         brand = 'Kraken Subs',     price = 1200000,   category = 'boats',          type = 'boat',       shop = 'none'},
    { model = 'patrolboat',      name = 'Kurtz 31 Patrol Boat',          brand = 'Unknown',         price = 1200000,   category = 'boats',          type = 'boat',       shop = 'none'},
    { model = 'longfin',         name = 'Longfin',                       brand = 'Shitzu',          price = 1200000,   category = 'boats',          type = 'boat',       shop = 'boats'},
    { model = 'tug',             name = 'Tug',                           brand = 'Buckingham',      price = 1200000,   category = 'boats',          type = 'boat',       shop = 'none'},
    { model = 'toro',            name = 'Toro',                          brand = 'Lampadati',       price = 1200000,   category = 'boats',          type = 'boat',       shop = 'boats'},
    { model = 'toro2',           name = 'Toro Yacht',                    brand = 'Lampadati',       price = 1200000,   category = 'boats',          type = 'boat',       shop = 'boats'},
    { model = 'submersible2',    name = 'Kraken',                        brand = 'Kraken Subs',     price = 1200000,   category = 'boats',          type = 'boat',       shop = 'none'},
    { model = 'speeder',         name = 'Speeder',                       brand = 'Pegassi',         price = 1200000,   category = 'boats',          type = 'boat',       shop = 'boats'},
    { model = 'speeder2',        name = 'Speeder Yacht',                 brand = 'Pegassi',         price = 1200000,   category = 'boats',          type = 'boat',       shop = 'boats'},
    { model = 'tropic',          name = 'Tropic',                        brand = 'Shitzu',          price = 1200000,   category = 'boats',          type = 'boat',       shop = 'boats'},
    { model = 'tropic2',         name = 'Tropic Yacht',                  brand = 'Shitzu',          price = 1200000,   category = 'boats',          type = 'boat',       shop = 'boats'},
    { model = 'suntrap',         name = 'Suntrap',                       brand = 'Shitzu',          price = 1200000,   category = 'boats',          type = 'boat',       shop = 'boats'},
    { model = 'submersible',     name = 'Submersible',                   brand = 'Kraken Subs',     price = 1200000,   category = 'boats',          type = 'boat',       shop = 'none'},
    { model = 'squalo',          name = 'Squalo',                        brand = 'Shitzu',          price = 1200000,   category = 'boats',          type = 'boat',       shop = 'boats'},
    { model = 'seashark',        name = 'Seashark',                      brand = 'Speedophile',     price = 1200000,   category = 'boats',          type = 'boat',       shop = 'boats'},
    { model = 'seashark3',       name = 'Seashark Yacht',                brand = 'Speedophile',     price = 1200000,   category = 'boats',          type = 'boat',       shop = 'boats'},
    { model = 'marquis',         name = 'Marquis',                       brand = 'Dinka',           price = 1200000,   category = 'boats',          type = 'boat',       shop = 'boats'},
    { model = 'jetmax',          name = 'Jetmax',                        brand = 'Shitzu',          price = 1200000,   category = 'boats',          type = 'boat',       shop = 'boats'},
    { model = 'dinghy',          name = 'Dinghy 2-Seater',               brand = 'Nagasaki',        price = 1200000,   category = 'boats',          type = 'boat',       shop = 'boats'},
    { model = 'dinghy2',         name = 'Dinghy 4-Seater',               brand = 'Nagasaki',        price = 1200000,   category = 'boats',          type = 'boat',       shop = 'boats'},
    { model = 'dinghy3',         name = 'Dinghy (Heist)',                brand = 'Nagasaki',        price = 1200000,   category = 'boats',          type = 'boat',       shop = 'boats'},
    { model = 'dinghy4',         name = 'Dinghy Yacht',                  brand = 'Nagasaki',        price = 1200000,   category = 'boats',          type = 'boat',       shop = 'boats'},
    --- Helicopters (15)
    { model = 'conada2',         name = 'Weaponized Conada',             brand = 'Buckingham',      price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'none'},
    { model = 'conada',          name = 'Conada',                        brand = 'Buckingham',      price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'air'},
    { model = 'seasparrow2',     name = 'Sparrow',                       brand = 'Unknown',         price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'air'},
    { model = 'annihilator2',    name = 'Annihilator Stealth',           brand = 'Western Company', price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'none'},
    { model = 'seasparrow',      name = 'Sea Sparrow',                   brand = 'Unknown',         price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'air'},
    { model = 'akula',           name = 'Akula',                         brand = 'Unknown',         price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'blacklisted'},
    { model = 'hunter',          name = 'FH-1 Hunter',                   brand = 'Unknown',         price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'blacklisted'},
    { model = 'havok',           name = 'Havok',                         brand = 'Nagasaki',        price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'air'},
    { model = 'volatus',         name = 'Volatus',                       brand = 'Buckingham',      price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'air'},
    { model = 'supervolito2',    name = 'SuperVolito Carbon',            brand = 'Buckingham',      price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'air'},
    { model = 'supervolito',     name = 'SuperVolito',                   brand = 'Buckingham',      price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'air'},
    { model = 'swift2',          name = 'Swift Deluxe',                  brand = 'Buckingham',      price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'air'},
    { model = 'valkyrie',        name = 'Valkyrie',                      brand = 'Buckingham',      price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'none'},
    { model = 'savage',          name = 'Savage',                        brand = 'Unknown',         price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'blacklisted'},
    { model = 'swift',           name = 'Swift',                         brand = 'Buckingham',      price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'air'},
    { model = 'annihilator',     name = 'Annihilator',                   brand = 'Western Company', price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'blacklisted'},
    { model = 'cargobob2',       name = 'Cargobob Jetsam',               brand = 'Western Company', price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'none'},
    { model = 'skylift',         name = 'Skylift',                       brand = 'HVY',             price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'none'},
    { model = 'maverick',        name = 'Maverick',                      brand = 'Buckingham',      price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'blacklisted'},
    { model = 'frogger',         name = 'Frogger',                       brand = 'Maibatsu',        price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'air'},
    { model = 'frogger2',        name = 'Frogger',                       brand = 'Maibatsu',        price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'air'},
    { model = 'cargobob',        name = 'Cargobob',                      brand = 'Western Company', price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'none'},
    { model = 'cargobob3',       name = 'Cargobob',                      brand = 'Western Company', price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'none'},
    { model = 'seasparrow3',     name = 'Sparrow (Prop)',                brand = 'Unknown',         price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'none'},
    { model = 'buzzard',         name = 'Buzzard Attack Chopper',        brand = 'Nagasaki',        price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'blacklisted'},
    { model = 'buzzard2',        name = 'Buzzard',                       brand = 'Nagasaki',        price = 4520000,   category = 'helicopters',    type = 'heli',       shop = 'blacklisted'},
    --- Planes (16)
    { model = 'streamer216',     name = 'Streamer216',                   brand = 'Mammoth',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'none'},
    { model = 'raiju',           name = 'F-160 Raiju',                   brand = 'Mammoth',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'none'},
    { model = 'alkonost',        name = 'RO-86 Alkonost',                brand = 'Unknown',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'none'},
    { model = 'strikeforce',     name = 'B-11 Strikeforce',              brand = 'Unknown',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'blacklisted'},
    { model = 'blimp3',          name = 'Blimp',                         brand = 'Unknown',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'blacklisted'},
    { model = 'avenger',         name = 'Avenger',                       brand = 'Mammoth',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'none'},
    { model = 'avenger2',        name = 'Avenger',                       brand = 'Mammoth',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'none'},
    { model = 'volatol',         name = 'Volatol',                       brand = 'Unknown',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'none'},
    { model = 'nokota',          name = 'P-45 Nokota',                   brand = 'Unknown',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'none'},
    { model = 'seabreeze',       name = 'Seabreeze',                     brand = 'Western Company', price = 6520000,   category = 'planes',         type = 'plane',      shop = 'air'},
    { model = 'pyro',            name = 'Pyro',                          brand = 'Buckingham',      price = 6520000,   category = 'planes',         type = 'plane',      shop = 'none'},
    { model = 'mogul',           name = 'Mogul',                         brand = 'Mammoth',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'none'},
    { model = 'howard',          name = 'Howard NX-25',                  brand = 'Unknown',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'none'},
    { model = 'bombushka',       name = 'RM-10 Bombushka',               brand = 'Unknown',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'none'},
    { model = 'molotok',         name = 'V-65 Molotok',                  brand = 'Unknown',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'none'},
    { model = 'microlight',      name = 'Ultralight',                    brand = 'Unknown',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'air'},
    { model = 'tula',            name = 'Tula',                          brand = 'Mammoth',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'none'},
    { model = 'rogue',           name = 'Rogue',                         brand = 'Western Company', price = 6520000,   category = 'planes',         type = 'plane',      shop = 'none'},
    { model = 'starling',        name = 'LF-22 Starling',                brand = 'Unknown',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'none'},
    { model = 'alphaz1',         name = 'Alpha-Z1',                      brand = 'Buckingham',      price = 6520000,   category = 'planes',         type = 'plane',      shop = 'none'},
    { model = 'nimbus',          name = 'Nimbus',                        brand = 'Buckingham',      price = 6520000,   category = 'planes',         type = 'plane',      shop = 'air'},
    { model = 'luxor2',          name = 'Luxor Deluxe',                  brand = 'Buckingham',      price = 6520000,   category = 'planes',         type = 'plane',      shop = 'blacklisted'},
    { model = 'velum2',          name = 'Velum 5-seater',                brand = 'JoBuilt',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'air'},
    { model = 'hydra',           name = 'Hydra',                         brand = 'Mammoth',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'blacklisted'},
    { model = 'blimp2',          name = 'Xero Blimp',                    brand = 'Unknown',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'none'},
    { model = 'dodo',            name = 'Dodo',                          brand = 'Mammoth',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'air'},
    { model = 'miljet',          name = 'Miljet',                        brand = 'Buckingham',      price = 6520000,   category = 'planes',         type = 'plane',      shop = ''},
    { model = 'besra',           name = 'Besra',                         brand = 'Western Company', price = 6520000,   category = 'planes',         type = 'plane',      shop = 'none'},
    { model = 'vestra',          name = 'Vestra',                        brand = 'Buckingham',      price = 6520000,   category = 'planes',         type = 'plane',      shop = 'air'},
    { model = 'cargoplane',      name = 'Cargo Plane',                   brand = 'JoBuilt',         price = 6520000,   category = 'planes',         type = 'plane',      shop = ''},
    { model = 'velum',           name = 'Velum',                         brand = 'JoBuilt',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'air'},
    { model = 'titan',           name = 'Titan',                         brand = 'Unknown',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'blacklisted'},
    { model = 'shamal',          name = 'Shamal',                        brand = 'Buckingham',      price = 6520000,   category = 'planes',         type = 'plane',      shop = 'blacklisted'},
    { model = 'lazer',           name = 'P-996 Lazer',                   brand = 'JoBuilt',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'blacklisted'},
    { model = 'mammatus',        name = 'Mammatus',                      brand = 'JoBuilt',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'air'},
    { model = 'stunt',           name = 'Mallard',                       brand = 'Western Company', price = 6520000,   category = 'planes',         type = 'plane',      shop = 'air'},
    { model = 'luxor',           name = 'Luxor',                         brand = 'Buckingham',      price = 6520000,   category = 'planes',         type = 'plane',      shop = 'blacklisted'},
    { model = 'jet',             name = 'Jet',                           brand = 'Unknown',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'blacklisted'},
    { model = 'duster',          name = 'Duster',                        brand = 'Western Company', price = 6520000,   category = 'planes',         type = 'plane',      shop = 'air'},
    { model = 'cuban800',        name = 'Cuban 800',                     brand = 'Western Company', price = 6520000,   category = 'planes',         type = 'plane',      shop = 'air'},
    { model = 'blimp',           name = 'Atomic Blimp',                  brand = 'Unknown',         price = 6520000,   category = 'planes',         type = 'plane',      shop = 'none'},
    --- Service (17)
    { model = 'brickade',        name = 'Brickade',                      brand = 'MTL',             price = 100000,  category = 'service',        type = 'automobile', shop = 'none'},
    { model = 'brickade2',       name = 'Brickade 6x6',                  brand = 'MTL',             price = 100000,  category = 'service',        type = 'automobile', shop = 'none'},
    { model = 'pbus2',           name = 'Festival Bus',                  brand = 'Unknown',         price = 100000,  category = 'service',        type = 'automobile', shop = 'none'},
    { model = 'wastelander',     name = 'Wastelander',                   brand = 'MTL',             price = 100000,  category = 'service',        type = 'automobile', shop = 'none'},
    { model = 'rallytruck',      name = 'Dune',                          brand = 'MTL',             price = 100000,  category = 'service',        type = 'automobile', shop = 'none'},
    { model = 'metrotrain',      name = 'Metro Train',                   brand = 'Unknown',         price = 100000,  category = 'service',        type = 'automobile', shop = 'none'},
    { model = 'freight',         name = 'Freight Train',                 brand = 'Unknown',         price = 100000,  category = 'service',        type = 'automobile', shop = 'none'},
    { model = 'cablecar',        name = 'Cable Car',                     brand = 'Unknown',         price = 100000,  category = 'service',        type = 'automobile', shop = 'none'},
    { model = 'trash',           name = 'Trashmaster',                   brand = 'JoBuilt',         price = 100000,  category = 'service',        type = 'automobile', shop = 'none'},
    { model = 'trash2',          name = 'Trashmaster',                   brand = 'JoBuilt',         price = 100000,  category = 'service',        type = 'automobile', shop = 'none'},
    { model = 'tourbus',         name = 'Tour Bus',                      brand = 'Brute',           price = 100000,  category = 'service',        type = 'automobile', shop = 'none'},
    { model = 'taxi',            name = 'Taxi',                          brand = 'Vapid',           price = 100000,  category = 'service',        type = 'automobile', shop = 'none'},
    { model = 'rentalbus',       name = 'Rental Shuttle Bus',            brand = 'Brute',           price = 100000,  category = 'service',        type = 'automobile', shop = 'none'},
    { model = 'coach',           name = 'Dashound',                      brand = 'Brute',           price = 100000,  category = 'service',        type = 'automobile', shop = 'none'},
    { model = 'bus',             name = 'Bus',                           brand = 'Brute',           price = 100000,  category = 'service',        type = 'automobile', shop = 'none'},
    { model = 'airbus',          name = 'Airport Bus',                   brand = 'Brute',           price = 100000,  category = 'service',        type = 'automobile', shop = 'none'},
    --- Emergency (18)
    { model = 'riot',            name = 'Police Riot',                   brand = 'Brute',           price = 100000,  category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'riot2',           name = 'RCV',                           brand = 'Unknown',         price = 100000,  category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'pbus',            name = 'Police Prison Bus',             brand = 'Vapid',           price = 100000,  category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'police',          name = 'Police Cruiser',                brand = 'Vapid',           price = 100000,  category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'police2',         name = 'Police Buffalo',                brand = 'Vapid',           price = 100000,  category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'police3',         name = 'Police Interceptor',            brand = 'Vapid',           price = 100000,  category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'police4',         name = 'Unmarked Cruiser',              brand = 'Vapid',           price = 100000,  category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'sheriff',         name = 'Sheriff SUV',                   brand = 'Declasse',        price = 100000,  category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'sheriff2',        name = 'Sheriff Cruiser',               brand = 'Vapid',           price = 100000,  category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'policeold1',      name = 'Police Rancher',                brand = 'Declasse',        price = 110000,  category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'policeold2',      name = 'Police Roadcruiser',            brand = 'Albany',          price = 110000,  category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'policet',         name = 'Police Transporter',            brand = 'Vapid',           price = 110000,  category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'policeb',         name = 'Police Bike',                   brand = 'Vapid',           price = 110000,  category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'polmav',          name = 'Police Maverick',               brand = 'Buckingham',      price = 110000,  category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'ambulance',       name = 'Ambulance',                     brand = 'Brute',           price = 110000,  category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'firetruk',        name = 'Fire Truck',                    brand = 'MTL',             price = 110000,  category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'lguard',          name = 'Lifeguard',                     brand = 'Declasse',        price = 110000,  category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'seashark2',       name = 'Seashark Lifeguard',            brand = 'Speedophile',     price = 40000,   category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'pranger',         name = 'Park Ranger',                   brand = 'Declasse',        price = 40000,   category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'fbi',             name = 'FIB Buffalo',                   brand = 'Bravado',         price = 40000,   category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'fbi2',            name = 'FIB Granger',                   brand = 'Declasse',        price = 40000,   category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'predator',        name = 'Police Predator',               brand = 'Unknown',         price = 40000,   category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'polgauntlet',     name = 'Gauntlet Interceptor',          brand = 'Bravado',         price = 40000,   category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'police5',         name = 'Stanier LE Cruiser',            brand = 'Vapid',           price = 40000,   category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'polimpaler5',     name = 'Impaler SZ Cruiser',            brand = 'Declasse',        price = 80000,   category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'polimpaler6',     name = 'Impaler LX Cruiser',            brand = 'Declasse',        price = 90000,   category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'poldominator10',  name = 'Dominator FX Interceptor',      brand = 'Vapid',           price = 230000,  category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'policet3',        name = 'Burrito (Bail Enforcement)',    brand = 'Declasse',        price = 60000,   category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'polgreenwood',    name = 'Greenwood Cruiser',             brand = 'Bravado',         price = 80000,   category = 'emergency',      type = 'automobile', shop = 'none'},
    { model = 'poldorado',       name = 'Dorado Cruiser',                brand = 'Vapid',           price = 80000,   category = 'emergency',      type = 'automobile', shop = 'none'},
    --- Military (19)
    { model = 'vetir',           name = 'Vetir',                         brand = 'Unknown',         price = 100000,  category = 'military',       type = 'automobile', shop = 'none'},
    { model = 'kosatka',         name = 'Kosatka',                       brand = 'Rune',            price = 100000,  category = 'military',       type = 'automobile', shop = 'none'},
    { model = 'minitank',        name = 'RC Tank',                       brand = 'Unknown',         price = 100000,  category = 'military',       type = 'automobile', shop = 'none'},
    { model = 'scarab',          name = 'Scarab',                        brand = 'HVY',             price = 100000,  category = 'military',       type = 'automobile', shop = 'blacklisted'},
    { model = 'terbyte',         name = 'Terrorbyte',                    brand = 'Benefactor',      price = 100000,  category = 'military',       type = 'automobile', shop = 'none'},
    { model = 'thruster',        name = 'Thruster',                      brand = 'Mammoth',         price = 100000,  category = 'military',       type = 'automobile', shop = 'none'},
    { model = 'khanjali',        name = 'TM-02 Khanjali Tank',           brand = 'Unknown',         price = 100000,  category = 'military',       type = 'automobile', shop = 'blacklisted'},
    { model = 'chernobog',       name = 'Chernobog',                     brand = 'HVY',             price = 100000,  category = 'military',       type = 'automobile', shop = 'none'},
    { model = 'barrage',         name = 'Barrage',                       brand = 'HVY',             price = 100000,  category = 'military',       type = 'automobile', shop = 'blacklisted'},
    { model = 'trailerlarge',    name = 'Mobile Operations Center',      brand = 'Unknown',         price = 100000,  category = 'military',       type = 'automobile', shop = 'none'},
    { model = 'halftrack',       name = 'Half-track',                    brand = 'Bravado',         price = 100000,  category = 'military',       type = 'automobile', shop = 'blacklisted'},
    { model = 'apc',             name = 'APC Tank',                      brand = 'HVY',             price = 100000,  category = 'military',       type = 'automobile', shop = 'blacklisted'},
    { model = 'trailersmall2',   name = 'Anti-Aircraft Trailer',         brand = 'Vom Feuer',       price = 100000,  category = 'military',       type = 'automobile', shop = 'blacklisted'},
    { model = 'rhino',           name = 'Rhino Tank',                    brand = 'Unknown',         price = 100000,  category = 'military',       type = 'automobile', shop = 'blacklisted'},
    { model = 'crusader',        name = 'Crusader',                      brand = 'Canis',           price = 100000,  category = 'military',       type = 'automobile', shop = 'none'},
    { model = 'barracks',        name = 'Barracks',                      brand = 'HVY',             price = 100000,  category = 'military',       type = 'automobile', shop = 'none'},
    { model = 'barracks2',       name = 'Barracks Semi',                 brand = 'HVY',             price = 100000,  category = 'military',       type = 'automobile', shop = 'none'},
    { model = 'barracks3',       name = 'Barracks',                      brand = 'HVY',             price = 100000,  category = 'military',       type = 'automobile', shop = 'none'},
    --- Commercial (20)
    { model = 'cerberus',        name = 'Apocalypse Cerberus',           brand = 'MTL',             price = 100000,  category = 'commercial',     type = 'automobile', shop = 'blacklisted'},
    { model = 'pounder2',        name = 'Pounder Custom',                brand = 'MTL',             price = 455000,   category = 'commercial',     type = 'automobile', shop = 'truck'},
    { model = 'mule4',           name = 'Mule Custom',                   brand = 'Maibatsu',        price = 240000,   category = 'commercial',     type = 'automobile', shop = 'truck'},
    { model = 'phantom3',        name = 'Phantom Custom',                brand = 'Jobuilt',         price = 4100000,  category = 'commercial',     type = 'automobile', shop = 'truck'},
    { model = 'hauler2',         name = 'Hauler Custom',                 brand = 'Jobuilt',         price = 9100000,  category = 'commercial',     type = 'automobile', shop = 'blacklisted'},
    { model = 'phantom2',        name = 'Phantom Wedge',                 brand = 'Jobuilt',         price = 100000,  category = 'commercial',     type = 'automobile', shop = 'none'},
    { model = 'mule5',           name = 'Mule (Heist)',                  brand = 'Maibatsu',        price = 40000,   category = 'commercial',     type = 'automobile', shop = 'truck'},
    { model = 'stockade',        name = 'Stockade',                      brand = 'Brute',           price = 100000,  category = 'commercial',     type = 'automobile', shop = 'truck'},
    { model = 'pounder',         name = 'Pounder',                       brand = 'MTL',             price = 55000,   category = 'commercial',     type = 'automobile', shop = 'truck'},
    { model = 'phantom',         name = 'Phantom',                       brand = 'Jobuilt',         price = 100000,  category = 'commercial',     type = 'automobile', shop = 'truck'},
    { model = 'packer',          name = 'Packer',                        brand = 'MTL',             price = 100000,  category = 'commercial',     type = 'automobile', shop = 'truck'},
    { model = 'mule',            name = 'Mule',                          brand = 'Maibatsu',        price = 40000,   category = 'commercial',     type = 'automobile', shop = 'blacklisted'},
    { model = 'hauler',          name = 'Hauler',                        brand = 'Jobuilt',         price = 100000,  category = 'commercial',     type = 'automobile', shop = 'truck'},
    { model = 'biff',            name = 'Biff',                          brand = 'Brute',           price = 100000,  category = 'commercial',     type = 'automobile', shop = 'truck'},
    { model = 'benson',          name = 'Benson',                        brand = 'Vapid',           price = 55000,   category = 'commercial',     type = 'automobile', shop = 'truck'},
    { model = 'benson2',         name = 'Benson (Cluckin Bell)',         brand = 'Vapid',           price = 55000,   category = 'commercial',     type = 'automobile', shop = 'truck'},
    { model = 'phantom4',        name = 'Phantom (Christmas)',           brand = 'Vapid',           price = 100000,  category = 'commercial',     type = 'automobile', shop = 'truck'},
    --- Trains (21)
    --- Open Wheel (22)
    { model = 'openwheel2',      name = 'DR1',                           brand = 'Declasse',        price = 100000,  category = 'openwheel',      type = 'automobile', shop = 'none'},
    { model = 'openwheel1',      name = 'BR8',                           brand = 'Benefactor',      price = 100000,  category = 'openwheel',      type = 'automobile', shop = 'none'},
    { model = 'formula2',        name = 'R88',                           brand = 'Ocelot',          price = 100000,  category = 'openwheel',      type = 'automobile', shop = 'none'},
    { model = 'formula',         name = 'PR4',                           brand = 'Progen',          price = 100000,  category = 'openwheel',      type = 'automobile', shop = 'none'},
	

	 --RESERVED START   
	 
	 --sheriff START
    { 
		model = 'c3as350',       
		name = 'c3as350',               
		brand = 'c3as350', 
		price = 1818000,
		category = 'helicopters',    
		type = 'heli',       
		shop = 'none'
	},
    { 
		model = 'swatec135',       
		name = 'swatec135',               
		brand = 'swatec135', 
		price = 1368000,
		category = 'helicopters',    
		type = 'heli',       
		shop = 'none'
	},
    { 
		model = '909_seahawk',       
		name = '909_seahawk',               
		brand = '909_seahawk', 
		price = 1368000,
		category = 'helicopters',    
		type = 'heli',       
		shop = 'none'
	},
    { 
		model = 'mbu2rb',         
		name = 'mbu2rb',              
		brand = 'mbu2rb',        
		price = 1080000,
		category = 'reserved',          
		type = 'bike',       
		shop = 'none'
	},
    { 
		model = 'mbu3rb',         
		name = 'mbu3rb',              
		brand = 'mbu3rb',        
		price = 1080000,
		category = 'reserved',          
		type = 'bike',       
		shop = 'none'
	},
    { 
		model = 'policebikerb',         
		name = 'policebikerb',              
		brand = 'policebikerb',        
		price = 1080000,
		category = 'reserved',          
		type = 'bike',       
		shop = 'none'
	},
    { 
		model = 'policeatvrb',         
		name = 'policeatvrb',              
		brand = 'policeatvrb',        
		price = 1080000,
		category = 'reserved',          
		type = 'bike',       
		shop = 'none'
	},
    { 
		model = 'utvrb',         
		name = 'utvrb',              
		brand = 'utvrb',        
		price = 1080000,
		category = 'reserved',          
		type = 'bike',       
		shop = 'none'
	},
    { 
		model = 'mbu1rb',         
		name = 'mbu1rb',              
		brand = 'mbu1rb',        
		price = 1080000,
		category = 'reserved',          
		type = 'bike',       
		shop = 'none'
	},
    { 
		model = 'policeboatrb',         
		name = 'Pol Boat RB',              
		brand = 'Nagasaki',        
		price = 1080000,
		category = 'reserved',          
		type = 'boat',       
		shop = 'none'
	},
    { 
		model = 'airboatbb',         
		name = 'airboatbb',              
		brand = 'airboatbb',        
		price = 1080000,
		category = 'reserved',          
		type = 'boat',       
		shop = 'none'
	},
    { 
		model = 'airboatrb',         
		name = 'airboatrb',              
		brand = 'airboatrb',        
		price = 1080000,
		category = 'reserved',          
		type = 'boat',       
		shop = 'none'
	},
	--speed
	{-- JJ
		model = 'polar06seirra',
		name = 'polar06seirra',
		brand = 'polar06seirra',
		price = 243730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso17speedmustang',
		name = 'bcso17speedmustang',
		brand = 'bcso17speedmustang',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- king bones
		model = 'levante',
		name = 'levante',
		brand = 'levante',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- king bones
		model = 'amels200',
		name = 'amels200',
		brand = 'amels200',
		price = 1098730,
		category = 'boats',
		type = 'boat',
		shop = 'none'
	},
	{-- King Bones
		model = 'nsandstormmk',
		name = 'nsandstormmk',
		brand = 'nsandstormmk',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso16speedcamaro',
		name = 'bcso16speedcamaro',
		brand = 'bcso16speedcamaro',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso18speedcharger',
		name = 'bcso18speedcharger',
		brand = 'bcso18speedcharger',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso18speeddemom',
		name = 'bcso18speeddemom',
		brand = 'bcso18speeddemom',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso20speedc8',
		name = 'bcso20speedc8',
		brand = 'bcso20speedc8',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	--speed
	
	{-- Sheriff
		model = 'bcso21tahoe',
		name = 'bcso21tahoe',
		brand = 'bcso21tahoe',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso22gmc',
		name = 'bcso22gmc',
		brand = 'bcso22gmc',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso21k9tahoe',
		name = 'bcso21k9tahoe',
		brand = 'bcso21k9tahoe',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso21durango',
		name = 'bcso21durango',
		brand = 'bcso21durango',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso20tahoe',
		name = 'bcso20tahoe',
		brand = 'bcso20tahoe',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso20k9tahoe',
		name = 'bcso20k9tahoe',
		brand = 'bcso20k9tahoe',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso20k9exp',
		name = 'bcso20k9exp',
		brand = 'bcso20k9exp',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso20exp',
		name = 'bcso20exp',
		brand = 'bcso20exp',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso18taurus',
		name = 'bcso18taurus',
		brand = 'bcso18taurus',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso18f250',
		name = 'bcso18f250',
		brand = 'bcso18f250',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso18charger',
		name = 'bcso18charger',
		brand = 'bcso18charger',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso17k9silv',
		name = 'bcso17k9silv',
		brand = 'bcso17k9silv',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso16exp',
		name = 'bcso16exp',
		brand = 'bcso16exp',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso14tahoe',
		name = 'bcso14tahoe',
		brand = 'bcso14tahoe',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso14charger',
		name = 'bcso14charger',
		brand = 'bcso14charger',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso14caprice',
		name = 'bcso14caprice',
		brand = 'bcso14caprice',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso13impala',
		name = 'bcso13impala',
		brand = 'bcso13impala',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso13exp',
		name = 'bcso13exp',
		brand = 'bcso13exp',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'bcso11cvpi',
		name = 'bcso11cvpi',
		brand = 'bcso11cvpi',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = 'gofvrb',
		name = 'gofvrb',
		brand = 'gofvrb',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = '24gscrb',
		name = '24gscrb',
		brand = '24gscrb',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Sheriff
		model = '23gtruckrb',
		name = '23gtruckrb',
		brand = '23gtruckrb',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	{-- Juitsu
		model = 'durango',
		name = 'durango',
		brand = 'durango',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Juitsu
		model = 'UMRS3',
		name = 'UMRS3',
		brand = 'UMRS3',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- Juitsu
		model = 'porsche',
		name = 'porsche',
		brand = 'porsche',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	{-- 
		model = '17gscbb',
		name = '17gscbb',
		brand = '17gscbb',
		price = 198730,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	},
	{-- 
		model = '19chgr',
		name = '19chgr',
		brand = '19chgr',
		price = 198730,
		category = 'sports',
		type = 'automobile',
		shop = 'customs'
	},
	{-- 
		model = 'pd21ramtrx',
		name = 'pd21ramtrx',
		brand = 'pd21ramtrx',
		price = 198730,
		category = 'utility',
		type = 'automobile',
		shop = 'customs'
	},
	{-- 
		model = '909_sahara',
		name = '909_sahara',
		brand = '909_sahara',
		price = 198730,
		category = 'utility',
		type = 'automobile',
		shop = 'customs'
	},
	{-- 
		model = 'c3defender',
		name = 'c3defender',
		brand = 'c3defender',
		price = 198730,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	},
	
	{-- 
		model = 'miata3',
		name = 'miata3',
		brand = 'miata3',
		price = 198730,
		category = 'sedans',
		type = 'automobile',
		shop = 'tuner'
	},
	{-- 
		model = 'NisSkyR34RB',
		name = 'NisSkyR34RB',
		brand = 'NisSkyR34RB',
		price = 198730,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	},
	
	{-- manish
		model = 'rmodsf90xx',
		name = 'rmodsf90xx',
		brand = 'rmodsf90xx',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- manish
		model = 'rmodmi8lb',
		name = 'rmodmi8lb',
		brand = 'rmodmi8lb',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- manish
		model = 'ikx3_sabre21b',
		name = 'ikx3_sabre21b',
		brand = 'ikx3_sabre21b',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	},
	{-- 
		model = 'veyron08m',
		name = 'veyron08m',
		brand = 'veyron08m',
		price = 198730,
		category = 'sports',
		type = 'automobile',
		shop = 'customs'
	},
	{-- 
		model = 'vanzr34hycade',
		name = 'vanzr34hycade',
		brand = 'vanzr34hycade',
		price = 198730,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	},
	{-- 
		model = 'demonhawk',
		name = 'demonhawk',
		brand = 'demonhawk',
		price = 198730,
		category = 'suvs',
		type = 'automobile',
		shop = 'customs'
	},
	{-- 
		model = 'trx',
		name = 'trx',
		brand = 'trx',
		price = 198730,
		category = 'offroad',
		type = 'automobile',
		shop = 'customs'
	},
	{-- 
		model = 'korypror',
		name = 'korypror',
		brand = 'korypror',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	}, 
	{
		model = 'kawaii',
		name = 'kawaii',
		brand = 'kawaii',
		price = 288730,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	},  
	{-- 
		model = 'cls17novitec',
		name = 'cls17novitec',
		brand = 'cls17novitec',
		price = 378730,
		category = 'sports',
		type = 'automobile',
		shop = 'customs'
	}, 
	{-- 
		model = 'x7prior21custom',
		name = 'x7prior21custom',
		brand = 'x7prior21custom',
		price = 558730,
		category = 'suvs',
		type = 'automobile',
		shop = 'tuners'
	},
	{-- 
		model = 'x6mf96',
		name = 'x6mf96',
		brand = 'x6mf96',
		price = 378730,
		category = 'suvs',
		type = 'automobile',
		shop = 'tuners'
	},
	{--Sheriff 1of1
		model = 'HELI_LSMC',
		name = 'HELI_LSMC',
		brand = 'HELI_LSMC',
		price = 2178730,
		category = 'helicopters',
		type = 'heli',
		shop = 'none'
	},
	{--Sheriff
		model = 'PD150JYZS22',
		name = 'PD150JYZS22',
		brand = 'PD150JYZS22',
		price = 964987,
		category = 'helicopters',
		type = 'heli',
		shop = 'none'
	 },
	{--dlmclaren
		model = 'dlmclaren',
		name = 'dlmclaren',
		brand = 'dlmclaren',
		price = 964987,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--dloffroadchar
		model = 'dloffroadchar',
		name = 'dloffroadchar',
		brand = 'dloffroadchar',
		price = 964987,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--dlporsche
		model = 'dlporsche',
		name = 'dlporsche',
		brand = 'dlporsche',
		price = 964987,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--dlroadster
		model = 'dlroadster',
		name = 'dlroadster',
		brand = 'dlroadster',
		price = 964987,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--dlspeedc8
		model = 'dlspeedc8',
		name = 'dlspeedc8',
		brand = 'dlspeedc8',
		price = 964987,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },

	{--dlspeedgtr
		model = 'dlspeedgtr',
		name = 'dlspeedgtr',
		brand = 'dlspeedgtr',
		price = 964987,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--dlspeedmustang
		model = 'dlspeedmustang',
		name = 'dlspeedmustang',
		brand = 'dlspeedmustang',
		price = 964987,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--dlspeedtesla
		model = 'dlspeedtesla',
		name = 'dlspeedtesla',
		brand = 'dlspeedtesla',
		price = 964987,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--dlferrari
		model = 'dlferrari',
		name = 'dlferrari',
		brand = 'dlferrari',
		price = 964987,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--dlfordgt
		model = 'dlfordgt',
		name = 'dlfordgt',
		brand = 'dlfordgt',
		price = 964987,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--volva
		model = 'volva',
		name = 'volva',
		brand = 'volva',
		price = 964987,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 }, 
	 
	-- {--GooseeRanga
		-- model = 'GooseeRanga',
		-- name = 'GooseeRanga',
		-- brand = 'GooseeRanga',
		-- price = 321244,
		-- category = 'sports',
		-- type = 'automobile',
		-- shop = 'pdm'
	 -- },
	 
	-- {--gmc_yuk06
		-- model = 'gmc_yuk06',
		-- name = 'gmc_yuk06',
		-- brand = 'gmc_yuk06',
		-- price = 292108,
		-- category = 'sports',
		-- type = 'automobile',
		-- shop = 'pdm'
	 -- },
	 
	{--itsa92bro
		model = 'itsa92bro',
		name = 'itsa92bro',
		brand = 'itsa92bro',
		price = 293611,
		category = 'sports',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--expsport
		model = 'expsport',
		name = 'expsport',
		brand = 'expsport',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--scubieblob
		model = 'scubieblob',
		name = 'scubieblob',
		brand = 'scubieblob',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--GC_01INTEG
		model = 'GC_01INTEG',
		name = 'GC_01INTEG',
		brand = 'GC_01INTEG',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--d8
		model = 'd8',
		name = 'd8',
		brand = 'd8',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--chrcst
		model = 'chrcst',
		name = 'chrcst',
		brand = 'chrcst',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--pathfinder
		model = 'pathfinder',
		name = 'pathfinder',
		brand = 'pathfinder',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--eastwood
		model = 'eastwood',
		name = 'eastwood',
		brand = 'eastwood',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--Cherokee
		model = 'Cherokee',
		name = 'Cherokee',
		brand = 'Cherokee',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--gorda
		model = 'gorda',
		name = 'gorda',
		brand = 'gorda',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--delgado
		model = 'delgado',
		name = 'delgado',
		brand = 'delgado',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--204sLEO79Monte
		model = '204sLEO79Monte',
		name = '204sLEO79Monte',
		brand = '204sLEO79Monte',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--cyber
		model = 'cyber',
		name = 'cyber',
		brand = 'cyber',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--ssss
		model = 'ssss',
		name = 'ssss',
		brand = 'ssss',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--ikx3_she67b
		model = 'ikx3_she67b',
		name = 'ikx3_she67b',
		brand = 'ikx3_she67b',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--68firebird
		model = '68firebird',
		name = '68firebird',
		brand = '68firebird',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--69novass
		model = '69novass',
		name = '69novass',
		brand = '69novass',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--imp67brain
		model = 'imp67brain',
		name = 'imp67brain',
		brand = 'imp67brain',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--nocturnoII
		model = 'nocturnoII',
		name = 'nocturnoII',
		brand = 'nocturnoII',
		price = 123229,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--davidson22
		model = 'davidson22',
		name = 'davidson22',
		brand = 'davidson22',
		price = 123229,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--barracuda
		model = 'barracuda',
		name = 'barracuda',
		brand = 'barracuda',
		price = 123229,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--rrk30
		model = 'rrk30',
		name = 'rrk30',
		brand = 'rrk30',
		price = 123229,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--Roadkill
		model = 'Roadkill',
		name = 'Roadkill',
		brand = 'Roadkill',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	 {--esm1000rrr
		model = 'esm1000rrr',
		name = 'esm1000rrr',
		brand = 'esm1000rrr',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--2022B
		model = '2022B',
		name = '2022B',
		brand = '2022B',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--carbonbenz
		model = 'carbonbenz',
		name = 'carbonbenz',
		brand = 'carbonbenz',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--Hellephantct5v
		model = 'Hellephantct5v',
		name = 'Hellephantct5v',
		brand = 'Hellephantct5v',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--pnut20f350
		model = 'pnut20f350',
		name = 'pnut20f350',
		brand = 'pnut20f350',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--pnut20f350
		model = 'pnutgoldtrailer',
		name = 'pnutgoldtrailer',
		brand = 'pnutgoldtrailer',
		price = 179910,
		category = 'trailers',
		type = 'automobile',
		shop = 'trailersrus'
	 },
	{--sd1stffs
		model = 'sd1stffs',
		name = 'sd1stffs',
		brand = 'sd1stffs',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--sdairtahoe
		model = 'sdairtahoe',
		name = 'sdairtahoe',
		brand = 'sdairtahoe',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--sdcully
		model = 'sdcully',
		name = 'sdcully',
		brand = 'sdcully',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	{--sdcully
		model = 'cv98b',
		name = 'cv98b',
		brand = 'cv98b',
		price = 224046,
		category = 'reserved',
		type = 'automobile',
		shop = ''
	 },
	 
	 --RESERVED END
	 
	{-- 
		model = 'theramtrx21',
		name = 'theramtrx21',
		brand = 'theramtrx21',
		price = 198730,
		category = 'reserved',
		type = 'automobile',
		shop = 'tuners'
	},
	{--600-DebadgedCars
		model = 'vantage23',
		name = 'vantage23',
		brand = 'vantage23',
		price = 266758,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = '18rs7',
		name = '18rs7',
		brand = '18rs7',
		price = 232382,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = '21rsq8',
		name = '21rsq8',
		brand = '21rsq8',
		price = 154707,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'AAQ4',
		name = 'AAQ4',
		brand = 'AAQ4',
		price = 354168,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'audirs8',
		name = 'audirs8',
		brand = 'audirs8',
		price = 173295,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'CarsonsPriorRS3',
		name = 'CarsonsPriorRS3',
		brand = 'CarsonsPriorRS3',
		price = 145410,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'gcma4sedan2021',
		name = 'gcma4sedan2021',
		brand = 'gcma4sedan2021',
		price = 186683,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'Hycaders6',
		name = 'Hycaders6',
		brand = 'Hycaders6',
		price = 363430,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'ikx3abt20',
		name = 'ikx3abt20',
		brand = 'ikx3abt20',
		price = 340074,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'mansrs6',
		name = 'mansrs6',
		brand = 'mansrs6',
		price = 249135,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'ocnetrongt',
		name = 'ocnetrongt',
		brand = 'ocnetrongt',
		price = 172191,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'q8hycade',
		name = 'q8hycade',
		brand = 'q8hycade',
		price = 379508,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'q8prior',
		name = 'q8prior',
		brand = 'q8prior',
		price = 162810,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'r820',
		name = 'r820',
		brand = 'r820',
		price = 374463,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'r8beastedit',
		name = 'r8beastedit',
		brand = 'r8beastedit',
		price = 353691,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rmodr8alpil',
		name = 'rmodr8alpil',
		brand = 'rmodr8alpil',
		price = 398577,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rmodr8alpilx',
		name = 'rmodr8alpilx',
		brand = 'rmodr8alpilx',
		price = 367732,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rmodr8c',
		name = 'rmodr8c',
		brand = 'rmodr8c',
		price = 340400,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rs5mans',
		name = 'rs5mans',
		brand = 'rs5mans',
		price = 370440,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rs615',
		name = 'rs615',
		brand = 'rs615',
		price = 217832,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'rs666',
		name = 'rs666',
		brand = 'rs666',
		price = 296508,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rs6abt20',
		name = 'rs6abt20',
		brand = 'rs6abt20',
		price = 213306,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'rs6abtkit',
		name = 'rs6abtkit',
		brand = 'rs6abtkit',
		price = 227959,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rs6c8',
		name = 'rs6c8',
		brand = 'rs6c8',
		price = 242005,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rs6rabt20',
		name = 'rs6rabt20',
		brand = 'rs6rabt20',
		price = 312600,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rs7',
		name = 'rs7',
		brand = 'rs7',
		price = 209268,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'rs7beast',
		name = 'rs7beast',
		brand = 'rs7beast',
		price = 189160,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	-- {--600-DebadgedCars
		-- model = 'rs7c821',
		-- name = 'rs7c821',
		-- brand = 'rs7c821',
		-- price = 345609,
		-- category = 'sports',
		-- type = 'automobile',
		-- shop = 'tuners'
	 -- },
	{--600-DebadgedCars
		model = 'rs7c8beast',
		name = 'rs7c8beast',
		brand = 'rs7c8beast',
		price = 295153,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rs7wide',
		name = 'rs7wide',
		brand = 'rs7wide',
		price = 248147,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 's1',
		name = 's1',
		brand = 's1',
		price = 218554,
		category = 'compacts',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 's8d4',
		name = 's8d4',
		brand = 's8d4',
		price = 143946,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'ben17',
		name = 'ben17',
		brand = 'ben17',
		price = 142509,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'bentaygam',
		name = 'bentaygam',
		brand = 'bentaygam',
		price = 157815,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'contgt2011',
		name = 'contgt2011',
		brand = 'contgt2011',
		price = 158606,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'rmodbentley1',
		name = 'rmodbentley1',
		brand = 'rmodbentley1',
		price = 375820,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'aerox155',
		name = 'aerox155',
		brand = 'aerox155',
		price = 168229,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--600-DebadgedCars
		model = 'bati901',
		name = 'bati901',
		brand = 'bati901',
		price = 185136,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--600-DebadgedCars
		model = 'brkout',
		name = 'brkout',
		brand = 'brkout',
		price = 164619,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--600-DebadgedCars
		model = 'cb650r',
		name = 'cb650r',
		brand = 'cb650r',
		price = 162413,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--600-DebadgedCars
		model = 'ccb_1000cbr',
		name = 'ccb_1000cbr',
		brand = 'ccb_1000cbr',
		price = 177115,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--600-DebadgedCars
		model = 'claw',
		name = 'claw',
		brand = 'claw',
		price = 191794,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--600-DebadgedCars
		model = 'espiritu',
		name = 'espiritu',
		brand = 'espiritu',
		price = 165532,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--600-DebadgedCars
		model = 'esr1m',
		name = 'esr1m',
		brand = 'esr1m',
		price = 368047,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'esrmzo',
		name = 'esrmzo',
		brand = 'esrmzo',
		price = 187092,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--600-DebadgedCars
		model = 'fenrir',
		name = 'fenrir',
		brand = 'fenrir',
		price = 155703,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'none'
	 },
	-- {--600-DebadgedCars
		-- model = 'GODzBMWS1000RR',
		-- name = 'GODzBMWS1000RR',
		-- brand = 'GODzBMWS1000RR',
		-- price = 210471,
		-- category = 'motorcycles',
		-- type = 'automobile',
		-- shop = 'rbikes'
	 -- },
	-- {--600-DebadgedCars
		-- model = 'GODzNINJAH2',
		-- name = 'GODzNINJAH2',
		-- brand = 'GODzNINJAH2',
		-- price = 223879,
		-- category = 'motorcycles',
		-- type = 'automobile',
		-- shop = 'rbikes'
	 -- },
	-- {--600-DebadgedCars
		-- model = 'GODzYAMR1',
		-- name = 'GODzYAMR1',
		-- brand = 'GODzYAMR1',
		-- price = 182175,
		-- category = 'motorcycles',
		-- type = 'automobile',
		-- shop = 'rbikes'
	 -- },
	{--600-DebadgedCars
		model = 'kawagala',
		name = 'kawagala',
		brand = 'kawagala',
		price = 197489,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--600-DebadgedCars
		model = 'km1000rr',
		name = 'km1000rr',
		brand = 'km1000rr',
		price = 164032,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--600-DebadgedCars
		model = 'lpchopper2',
		name = 'lpchopper2',
		brand = 'lpchopper2',
		price = 140589,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--600-DebadgedCars
		model = 'mv2019',
		name = 'mv2019',
		brand = 'mv2019',
		price = 382024,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'r6d',
		name = 'r6d',
		brand = 'r6d',
		price = 145125,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--600-DebadgedCars
		model = 'rd',
		name = 'rd',
		brand = 'rd',
		price = 161352,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--600-DebadgedCars
		model = 'RoyalCustomKawasakiSH2',
		name = 'RoyalCustomKawasakiSH2',
		brand = 'RoyalCustomKawasakiSH2',
		price = 152522,
		category = 'motorcycles',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'rr01',
		name = 'rr01',
		brand = 'rr01',
		price = 217398,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--600-DebadgedCars
		model = 'vrodwidowape',
		name = 'vrodwidowape',
		brand = 'vrodwidowape',
		price = 201035,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--600-DebadgedCars
		model = 'yzfr6',
		name = 'yzfr6',
		brand = 'yzfr6',
		price = 145156,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--600-DebadgedCars
		model = 'yzfr7',
		name = 'yzfr7',
		brand = 'yzfr7',
		price = 204130,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--600-DebadgedCars
		model = 'z8r',
		name = 'z8r',
		brand = 'z8r',
		price = 151173,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--600-DebadgedCars
		model = 'zx6r',
		name = 'zx6r',
		brand = 'zx6r',
		price = 181723,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--600-DebadgedCars
		model = '17m760i',
		name = '17m760i',
		brand = '17m760i',
		price = 140293,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = '2019m5',
		name = '2019m5',
		brand = '2019m5',
		price = 245065,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = '20xb7',
		name = '20xb7',
		brand = '20xb7',
		price = 170968,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = '22m5',
		name = '22m5',
		brand = '22m5',
		price = 179529,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = '2ncsbmwm8',
		name = '2ncsbmwm8',
		brand = '2ncsbmwm8',
		price = 340447,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = '2ncsx7',
		name = '2ncsx7',
		brand = '2ncsx7',
		price = 229815,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'alpinab7',
		name = 'alpinab7',
		brand = 'alpinab7',
		price = 179925,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'alpinab7BLACKEDITION',
		name = 'alpinab7BLACKEDITION',
		brand = 'alpinab7BLACKEDITION',
		price = 172542,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'bmw8mm',
		name = 'bmw8mm',
		brand = 'bmw8mm',
		price = 175357,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'bmwe39',
		name = 'bmwe39',
		brand = 'bmwe39',
		price = 298477,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'bmwg07',
		name = 'bmwg07',
		brand = 'bmwg07',
		price = 348606,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'ckbmwm4offwhite',
		name = 'ckbmwm4offwhite',
		brand = 'ckbmwm4offwhite',
		price = 382867,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'e39touring',
		name = 'e39touring',
		brand = 'e39touring',
		price = 193569,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'e92bb',
		name = 'e92bb',
		brand = 'e92bb',
		price = 349199,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'g81hr',
		name = 'g81hr',
		brand = 'g81hr',
		price = 403880,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'giulia_2021',
		name = 'giulia_2021',
		brand = 'giulia_2021',
		price = 335603,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	-- {--600-DebadgedCars
		-- model = 'GODz95GSX',
		-- name = 'GODz95GSX',
		-- brand = 'GODz95GSX',
		-- price = 243627,
		-- category = 'coupes',
		-- type = 'automobile',
		-- shop = 'customs'
	 -- },
	{--600-DebadgedCars
		model = 'hpfm8',
		name = 'hpfm8',
		brand = 'hpfm8',
		price = 160350,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'm135iwb',
		name = 'm135iwb',
		brand = 'm135iwb',
		price = 298907,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'm3e36',
		name = 'm3e36',
		brand = 'm3e36',
		price = 315772,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'm3e46',
		name = 'm3e46',
		brand = 'm3e46',
		price = 173093,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'm3e92',
		name = 'm3e92',
		brand = 'm3e92',
		price = 282573,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'm3g80mp',
		name = 'm3g80mp',
		brand = 'm3g80mp',
		price = 156086,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'm3mafia',
		name = 'm3mafia',
		brand = 'm3mafia',
		price = 154594,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'm3s',
		name = 'm3s',
		brand = 'm3s',
		price = 137147,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'm4c',
		name = 'm4c',
		brand = 'm4c',
		price = 148705,
		category = 'coupes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'M4CC',
		name = 'M4CC',
		brand = 'M4CC',
		price = 218113,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'm4g82',
		name = 'm4g82',
		brand = 'm4g82',
		price = 205184,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'm4hr',
		name = 'm4hr',
		brand = 'm4hr',
		price = 246262,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'm4lb2',
		name = 'm4lb2',
		brand = 'm4lb2',
		price = 199015,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'm4speedhunter',
		name = 'm4speedhunter',
		brand = 'm4speedhunter',
		price = 286209,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	-- {--600-DebadgedCars
		-- model = 'm5cs22',
		-- name = 'm5cs22',
		-- brand = 'm5cs22',
		-- price = 380192,
		-- category = 'sports',
		-- type = 'automobile',
		-- shop = 'tuners'
	 -- },
	{--600-DebadgedCars
		model = 'm5csao22',
		name = 'm5csao22',
		brand = 'm5csao22',
		price = 307502,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'm5e60',
		name = 'm5e60',
		brand = 'm5e60',
		price = 316803,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'm5prime',
		name = 'm5prime',
		brand = 'm5prime',
		price = 377495,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'm6e24',
		name = 'm6e24',
		brand = 'm6e24',
		price = 175608,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'm8benzo',
		name = 'm8benzo',
		brand = 'm8benzo',
		price = 195960,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'm8hc',
		name = 'm8hc',
		brand = 'm8hc',
		price = 215795,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'manhartx7',
		name = 'manhartx7',
		brand = 'manhartx7',
		price = 158922,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'mi8',
		name = 'mi8',
		brand = 'mi8',
		price = 361388,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'mteche39',
		name = 'mteche39',
		brand = 'mteche39',
		price = 179808,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'rmodm3e36',
		name = 'rmodm3e36',
		brand = 'rmodm3e36',
		price = 305933,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rmodm4',
		name = 'rmodm4',
		brand = 'rmodm4',
		price = 364077,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rmodm4gts',
		name = 'rmodm4gts',
		brand = 'rmodm4gts',
		price = 392876,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rmodx6',
		name = 'rmodx6',
		brand = 'rmodx6',
		price = 159997,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'x6wz',
		name = 'x6wz',
		brand = 'x6wz',
		price = 174726,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = '2019chiron',
		name = '2019chiron',
		brand = '2019chiron',
		price = 318695,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'centuria',
		name = 'centuria',
		brand = 'centuria',
		price = 379470,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'chironspeedhunter',
		name = 'chironspeedhunter',
		brand = 'chironspeedhunter',
		price = 393445,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'chironsuper',
		name = 'chironsuper',
		brand = 'chironsuper',
		price = 357468,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'chironsupersport22',
		name = 'chironsupersport22',
		brand = 'chironsupersport22',
		price = 332534,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'dtdbolide',
		name = 'dtdbolide',
		brand = 'dtdbolide',
		price = 371619,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'gdivo',
		name = 'gdivo',
		brand = 'gdivo',
		price = 341073,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	-- {--600-DebadgedCars
		-- model = 'GODzMISTRALs',
		-- name = 'GODzMISTRALs',
		-- brand = 'GODzMISTRALs',
		-- price = 445222,
		-- category = 'super',
		-- type = 'automobile',
		-- shop = 'tuners'
	 -- },
	-- {--600-DebadgedCars
		-- model = 'GODzVEYRONSSWB',
		-- name = 'GODzVEYRONSSWB',
		-- brand = 'GODzVEYRONSSWB',
		-- price = 416610,
		-- category = 'super',
		-- type = 'automobile',
		-- shop = 'tuners'
	 -- },
	{--600-DebadgedCars
		model = 'escaladeprime',
		name = 'escaladeprime',
		brand = 'escaladeprime',
		price = 374949,
		category = 'vans',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'camaro68t',
		name = 'camaro68t',
		brand = 'camaro68t',
		price = 254088,
		category = 'muscle',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'rmodzl1',
		name = 'rmodzl1',
		brand = 'rmodzl1',
		price = 257993,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rr21camarowide',
		name = 'rr21camarowide',
		brand = 'rr21camarowide',
		price = 306578,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'zl1',
		name = 'zl1',
		brand = 'zl1',
		price = 245991,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'c8',
		name = 'c8',
		brand = 'c8',
		price = 325386,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'c8p1',
		name = 'c8p1',
		brand = 'c8p1',
		price = 187668,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'C8WidebodyLC',
		name = 'C8WidebodyLC',
		brand = 'C8WidebodyLC',
		price = 370368,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'camarodragmachine',
		name = 'camarodragmachine',
		brand = 'camarodragmachine',
		price = 235669,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'impalag',
		name = 'impalag',
		brand = 'impalag',
		price = 1752133,
		category = 'commercial',
		type = 'automobile',
		shop = 'commercial'
	 },
	-- {--600-DebadgedCars
		-- model = 'playaturbozr1',
		-- name = 'playaturbozr1',
		-- brand = 'playaturbozr1',
		-- price = 416841,
		-- category = 'sports',
		-- type = 'automobile',
		-- shop = 'tuners'
	 -- },
	{--600-DebadgedCars
		model = '16charger',
		name = '16charger',
		brand = '16charger',
		price = 359662,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'CHARGER21',
		name = 'CHARGER21',
		brand = 'CHARGER21',
		price = 332861,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'chargerf8',
		name = 'chargerf8',
		brand = 'chargerf8',
		price = 269452,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'chr20',
		name = 'chr20',
		brand = 'chr20',
		price = 291617,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'demon',
		name = 'demon',
		brand = 'demon',
		price = 317719,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'dzdaytona',
		name = 'dzdaytona',
		brand = 'dzdaytona',
		price = 219541,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	-- {--600-DebadgedCars
		-- model = 'GODzDEMONUTE',
		-- name = 'GODzDEMONUTE',
		-- brand = 'GODzDEMONUTE',
		-- price = 195268,
		-- category = 'sedans',
		-- type = 'automobile',
		-- shop = 'customs'
	 -- },
	-- {--600-DebadgedCars
		-- model = 'GODzDRIFTCAT',
		-- name = 'GODzDRIFTCAT',
		-- brand = 'GODzDRIFTCAT',
		-- price = 152134,
		-- category = 'sedans',
		-- type = 'automobile',
		-- shop = 'customs'
	 -- },
	{--600-DebadgedCars
		model = 'HELLCATF9',
		name = 'HELLCATF9',
		brand = 'HELLCATF9',
		price = 234559,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'hellcatlb',
		name = 'hellcatlb',
		brand = 'hellcatlb',
		price = 269377,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'HellcatMagnum21',
		name = 'HellcatMagnum21',
		brand = 'HellcatMagnum21',
		price = 256148,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	-- {--600-DebadgedCars
		-- model = 'HellstingerwbSC',
		-- name = 'HellstingerwbSC',
		-- brand = 'HellstingerwbSC',
		-- price = 263969,
		-- category = 'sports',
		-- type = 'automobile',
		-- shop = 'tuners'
	 -- },
	{--600-DebadgedCars
		model = 'HycadeHellcatDurango',
		name = 'HycadeHellcatDurango',
		brand = 'HycadeHellcatDurango',
		price = 379912,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'kgjoker',
		name = 'kgjoker',
		brand = 'kgjoker',
		price = 228670,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'raid',
		name = 'raid',
		brand = 'raid',
		price = 381571,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'redeye',
		name = 'redeye',
		brand = 'redeye',
		price = 242119,
		category = 'muscle',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'redeye2',
		name = 'redeye2',
		brand = 'redeye2',
		price = 276261,
		category = 'muscle',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'redeye3',
		name = 'redeye3',
		brand = 'redeye3',
		price = 299176,
		category = 'muscle',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'rmodcharger',
		name = 'rmodcharger',
		brand = 'rmodcharger',
		price = 259900,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'rmodcharger69',
		name = 'rmodcharger69',
		brand = 'rmodcharger69',
		price = 284854,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'ShakerAnniversarySC',
		name = 'ShakerAnniversarySC',
		brand = 'ShakerAnniversarySC',
		price = 295646,
		category = 'muscle',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'ShakerAnniversarySC2',
		name = 'ShakerAnniversarySC2',
		brand = 'ShakerAnniversarySC2',
		price = 308130,
		category = 'muscle',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'ShakerAnniversarySC3',
		name = 'ShakerAnniversarySC3',
		brand = 'ShakerAnniversarySC3',
		price = 306985,
		category = 'muscle',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'sjdodge',
		name = 'sjdodge',
		brand = 'sjdodge',
		price = 146199,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'ToraChargerLifted',
		name = 'ToraChargerLifted',
		brand = 'ToraChargerLifted',
		price = 385207,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = '488animated',
		name = '488animated',
		brand = '488animated',
		price = 272238,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = '488mishasp',
		name = '488mishasp',
		brand = '488mishasp',
		price = 392964,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = '488sp',
		name = '488sp',
		brand = '488sp',
		price = 390177,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = '488sp2',
		name = '488sp2',
		brand = '488sp2',
		price = 378748,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = '812mnsry',
		name = '812mnsry',
		brand = '812mnsry',
		price = 291408,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'daytonasp3',
		name = 'daytonasp3',
		brand = 'daytonasp3',
		price = 330131,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'f12rp',
		name = 'f12rp',
		brand = 'f12rp',
		price = 274780,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'f812',
		name = 'f812',
		brand = 'f812',
		price = 363340,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'f8kspider',
		name = 'f8kspider',
		brand = 'f8kspider',
		price = 334260,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'ferrari812super',
		name = 'ferrari812super',
		brand = 'ferrari812super',
		price = 207958,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	-- {--600-DebadgedCars
		-- model = 'fxxkevo',
		-- name = 'fxxkevo',
		-- brand = 'fxxkevo',
		-- price = 864736,
		-- category = 'super',
		-- type = 'automobile',
		-- shop = 'tuners'
	 -- },
	{--600-DebadgedCars
		model = 'gta5rp_veh_ferrari19',
		name = 'gta5rp_veh_ferrari19',
		brand = 'gta5rp_veh_ferrari19',
		price = 340129,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'ikx3sf90custom',
		name = 'ikx3sf90custom',
		brand = 'ikx3sf90custom',
		price = 348259,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'impronta4',
		name = 'impronta4',
		brand = 'impronta4',
		price = 375869,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'laferrariquadturbo',
		name = 'laferrariquadturbo',
		brand = 'laferrariquadturbo',
		price = 318428,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rmodf40',
		name = 'rmodf40',
		brand = 'rmodf40',
		price = 373980,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'sf90',
		name = 'sf90',
		brand = 'sf90',
		price = 349074,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rmodbiposto',
		name = 'rmodbiposto',
		brand = 'rmodbiposto',
		price = 336744,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	-- {--600-DebadgedCars
		-- model = 'rmodbiposto2',
		-- name = 'rmodbiposto2',
		-- brand = 'rmodbiposto2',
		-- price = 323646,
		-- category = 'sports',
		-- type = 'automobile',
		-- shop = 'tuners'
	 -- },
	{--600-DebadgedCars
		model = '24mss',
		name = '24mss',
		brand = '24mss',
		price = 300022,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'boss302',
		name = 'boss302',
		brand = 'boss302',
		price = 299030,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'BOSS429',
		name = 'BOSS429',
		brand = 'BOSS429',
		price = 226757,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'ELEANOR',
		name = 'ELEANOR',
		brand = 'ELEANOR',
		price = 245380,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'f450',
		name = 'f450',
		brand = 'f450',
		price = 348133,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'ffrs',
		name = 'ffrs',
		brand = 'ffrs',
		price = 280826,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	-- {--600-DebadgedCars
		-- model = 'GODz67ELGT500',
		-- name = 'GODz67ELGT500',
		-- brand = 'GODz67ELGT500',
		-- price = 441177,
		-- category = 'super',
		-- type = 'automobile',
		-- shop = 'tuners'
	 -- },
	-- {--600-DebadgedCars
		-- model = 'GODzOOF6x6',
		-- name = 'GODzOOF6x6',
		-- brand = 'GODzOOF6x6',
		-- price = 441177,
		-- category = 'vans',
		-- type = 'automobile',
		-- shop = 'tuners'
	 -- },
	{--600-DebadgedCars
		model = 'gt17',
		name = 'gt17',
		brand = 'gt17',
		price = 341252,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'lightningdually22',
		name = 'lightningdually22',
		brand = 'lightningdually22',
		price = 145927,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'mach1',
		name = 'mach1',
		brand = 'mach1',
		price = 240966,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'mache',
		name = 'mache',
		brand = 'mache',
		price = 279150,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'machewb',
		name = 'machewb',
		brand = 'machewb',
		price = 253875,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'manssupersnake',
		name = 'manssupersnake',
		brand = 'manssupersnake',
		price = 265095,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'MGT',
		name = 'MGT',
		brand = 'MGT',
		price = 375612,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'mustang65',
		name = 'mustang65',
		brand = 'mustang65',
		price = 249471,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'rapger19',
		name = 'rapger19',
		brand = 'rapger19',
		price = 249471,
		category = 'vans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'rmodfordgt',
		name = 'rmodfordgt',
		brand = 'rmodfordgt',
		price = 388901,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rmodmustang',
		name = 'rmodmustang',
		brand = 'rmodmustang',
		price = 243550,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'Shelbytacoma4x4',
		name = 'Shelbytacoma4x4',
		brand = 'Shelbytacoma4x4',
		price = 4743550,
		category = 'vans',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'ToraRTRShow',
		name = 'ToraRTRShow',
		brand = 'ToraRTRShow',
		price = 343503,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'ugcprime350',
		name = 'ugcprime350',
		brand = 'ugcprime350',
		price = 278825,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'fangle450',
		name = 'fangle450',
		brand = 'fangle450',
		price = 318735,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'fanpounder',
		name = 'fanpounder',
		brand = 'fanpounder',
		price = 1739394,
		category = 'commercial',
		type = 'automobile',
		shop = 'commercial'
	 },
	{--600-DebadgedCars
		model = 'haitun',
		name = 'haitun',
		brand = 'haitun',
		price = 1739394,
		category = 'helicopters',
		type = 'heli',
		shop = 'air'
	 },
	{--600-DebadgedCars
		model = 'hexerz2',
		name = 'hexerz2',
		brand = 'hexerz2',
		price = 157634,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--600-DebadgedCars
		model = 'lowrider_ballas',
		name = 'lowrider_ballas',
		brand = 'lowrider_ballas',
		price = 270751,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'lowrider_blacklions',
		name = 'lowrider_blacklions',
		brand = 'lowrider_blacklions',
		price = 303046,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'lowrider_bloods',
		name = 'lowrider_bloods',
		brand = 'lowrider_bloods',
		price = 268893,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'lowrider_crips',
		name = 'lowrider_crips',
		brand = 'lowrider_crips',
		price = 280532,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'lowrider_deparis',
		name = 'lowrider_deparis',
		brand = 'lowrider_deparis',
		price = 250604,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'lowrider_grove',
		name = 'lowrider_grove',
		brand = 'lowrider_grove',
		price = 300216,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'lowrider_hoover',
		name = 'lowrider_hoover',
		brand = 'lowrider_hoover',
		price = 283004,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'lowrider_mg13',
		name = 'lowrider_mg13',
		brand = 'lowrider_mg13',
		price = 302598,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'lowrider_st187',
		name = 'lowrider_st187',
		brand = 'lowrider_st187',
		price = 274307,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'lowrider_vagos',
		name = 'lowrider_vagos',
		brand = 'lowrider_vagos',
		price = 230063,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'lowrider_woo',
		name = 'lowrider_woo',
		brand = 'lowrider_woo',
		price = 258059,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'ospreyhmx',
		name = 'ospreyhmx',
		brand = 'ospreyhmx',
		price = 258059,
		category = 'planes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'rocket',
		name = 'rocket',
		brand = 'rocket',
		price = 350442,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'RoyalCustome39m5_wb',
		name = 'RoyalCustome39m5_wb',
		brand = 'RoyalCustome39m5_wb',
		price = 350442,
		category = 'sedans',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'rs6_cali',
		name = 'rs6_cali',
		brand = 'rs6_cali',
		price = 323476,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rs6_criminals',
		name = 'rs6_criminals',
		brand = 'rs6_criminals',
		price = 321332,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rs6_gonzales',
		name = 'rs6_gonzales',
		brand = 'rs6_gonzales',
		price = 358680,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rs6_kadir',
		name = 'rs6_kadir',
		brand = 'rs6_kadir',
		price = 404747,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rs6_lcn',
		name = 'rs6_lcn',
		brand = 'rs6_lcn',
		price = 346820,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rs6_santasofia',
		name = 'rs6_santasofia',
		brand = 'rs6_santasofia',
		price = 371605,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rs7bratwa',
		name = 'rs7bratwa',
		brand = 'rs7bratwa',
		price = 226823,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rs7mans',
		name = 'rs7mans',
		brand = 'rs7mans',
		price = 311513,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'specialtf',
		name = 'specialtf',
		brand = 'specialtf',
		price = 394501,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'suv_triaden',
		name = 'suv_triaden',
		brand = 'suv_triaden',
		price = 164445,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'taxipolmav',
		name = 'taxipolmav',
		brand = 'taxipolmav',
		price = 974445,
		category = 'helicopters',
		type = 'heli',
		shop = 'air'
	 },
	{--600-DebadgedCars
		model = 'van_acieecorps',
		name = 'van_acieecorps',
		brand = 'van_acieecorps',
		price = 240082,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'gaford30t',
		name = 'gaford30t',
		brand = 'gaford30t',
		price = 284967,
		category = 'muscle',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'gaford34r',
		name = 'gaford34r',
		brand = 'gaford34r',
		price = 249548,
		category = 'muscle',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'gaford36r',
		name = 'gaford36r',
		brand = 'gaford36r',
		price = 243812,
		category = 'muscle',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'gacord812',
		name = 'gacord812',
		brand = 'gacord812',
		price = 152448,
		category = 'sedans',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'sixtyone41',
		name = 'sixtyone41',
		brand = 'sixtyone41',
		price = 169526,
		category = 'sedans',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'fwoody48',
		name = 'fwoody48',
		brand = 'fwoody48',
		price = 204678,
		category = 'sedans',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'gadbiz49',
		name = 'gadbiz49',
		brand = 'gadbiz49',
		price = 141919,
		category = 'coupes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'gacfor49',
		name = 'gacfor49',
		brand = 'gacfor49',
		price = 162739,
		category = 'sedans',
		type = 'automobile',
		shop = ''
	 },
	-- {--600-DebadgedCars
		-- model = 'f-one49d',
		-- name = 'f-one49d',
		-- brand = 'f-one49d',
		-- price = 332966,
		-- category = 'utility',
		-- type = 'automobile',
		-- shop = 'truck'
	 -- },
	-- {--600-DebadgedCars
		-- model = 'f-one49db',
		-- name = 'f-one49db',
		-- brand = 'f-one49db',
		-- price = 414882,
		-- category = 'offroad',
		-- type = 'automobile',
		-- shop = 'truck'
	 -- },
	{--600-DebadgedCars
		model = 'f-one49s',
		name = 'f-one49s',
		brand = 'f-one49s',
		price = 366934,
		category = 'utility',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'f-one49sb',
		name = 'f-one49sb',
		brand = 'f-one49sb',
		price = 379423,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'f-two49d',
		name = 'f-two49d',
		brand = 'f-two49d',
		price = 313695,
		category = 'utility',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'f-two49s',
		name = 'f-two49s',
		brand = 'f-two49s',
		price = 412012,
		category = 'utility',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'f-six49',
		name = 'f-six49',
		brand = 'f-six49',
		price = 362834,
		category = 'utility',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'f-six49b',
		name = 'f-six49b',
		brand = 'f-six49b',
		price = 356611,
		category = 'utility',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'gaken49',
		name = 'gaken49',
		brand = 'gaken49',
		price = 1618154,
		category = 'commercial',
		type = 'automobile',
		shop = 'commercial'
	 },
	{--600-DebadgedCars
		model = 'gaken49f',
		name = 'gaken49f',
		brand = 'gaken49f',
		price = 2506570,
		category = 'commercial',
		type = 'automobile',
		shop = 'commercial'
	 },
	{--600-DebadgedCars
		model = '212expo51',
		name = '212expo51',
		brand = '212expo51',
		price = 404805,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'coe54t',
		name = 'coe54t',
		brand = 'coe54t',
		price = 1804035,
		category = 'commercial',
		type = 'automobile',
		shop = 'commercial'
	 },
	{--600-DebadgedCars
		model = 'ONEFIFTY55',
		name = 'ONEFIFTY55',
		brand = 'ONEFIFTY55',
		price = 220971,
		category = 'coupes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'WHITE55',
		name = 'WHITE55',
		brand = 'WHITE55',
		price = 2341876,
		category = 'commercial',
		type = 'automobile',
		shop = 'commercial'
	 },
	{--600-DebadgedCars
		model = 'GABELAIR56',
		name = 'GABELAIR56',
		brand = 'GABELAIR56',
		price = 219501,
		category = 'coupes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'GANOMAD56',
		name = 'GANOMAD56',
		brand = 'GANOMAD56',
		price = 175387,
		category = 'coupes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'citation58',
		name = 'citation58',
		brand = 'citation58',
		price = 170874,
		category = 'coupes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'gabmw507',
		name = 'gabmw507',
		brand = 'gabmw507',
		price = 256772,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'gaimpala59',
		name = 'gaimpala59',
		brand = 'gaimpala59',
		price = 139666,
		category = 'coupes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'gaimpala59c',
		name = 'gaimpala59c',
		brand = 'gaimpala59c',
		price = 139906,
		category = 'coupes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'metro59',
		name = 'metro59',
		brand = 'metro59',
		price = 168330,
		category = 'compacts',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'tbird64',
		name = 'tbird64',
		brand = 'tbird64',
		price = 159759,
		category = 'coupes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'gac10',
		name = 'gac10',
		brand = 'gac10',
		price = 159759,
		category = 'vans',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'eldorado68',
		name = 'eldorado68',
		brand = 'eldorado68',
		price = 160371,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'camaro68',
		name = 'camaro68',
		brand = 'camaro68',
		price = 181299,
		category = 'coupes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'camaro68b',
		name = 'camaro68b',
		brand = 'camaro68b',
		price = 173821,
		category = 'coupes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'camaro68c',
		name = 'camaro68c',
		brand = 'camaro68c',
		price = 187576,
		category = 'coupes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'fury69',
		name = 'fury69',
		brand = 'fury69',
		price = 214490,
		category = 'coupes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'camaro70',
		name = 'camaro70',
		brand = 'camaro70',
		price = 231192,
		category = 'muscle',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'impala72',
		name = 'impala72',
		brand = 'impala72',
		price = 211274,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'impala72b',
		name = 'impala72b',
		brand = 'impala72b',
		price = 153503,
		category = 'coupes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'beetle74',
		name = 'beetle74',
		brand = 'beetle74',
		price = 168876,
		category = 'compacts',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'newyorker75',
		name = 'newyorker75',
		brand = 'newyorker75',
		price = 196826,
		category = 'coupes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'gtorino76',
		name = 'gtorino76',
		brand = 'gtorino76',
		price = 176645,
		category = 'coupes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'bronco80',
		name = 'bronco80',
		brand = 'bronco80',
		price = 383934,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'bronco81',
		name = 'bronco81',
		brand = 'bronco81',
		price = 299438,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'bronco82',
		name = 'bronco82',
		brand = 'bronco82',
		price = 342896,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'e15082',
		name = 'e15082',
		brand = 'e15082',
		price = 186319,
		category = 'vans',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'silv86',
		name = 'silv86',
		brand = 'silv86',
		price = 186319,
		category = 'vans',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'astro88',
		name = 'astro88',
		brand = 'astro88',
		price = 186319,
		category = 'vans',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'type262',
		name = 'type262',
		brand = 'type262',
		price = 186319,
		category = 'vans',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'type263',
		name = 'type263',
		brand = 'type263',
		price = 186319,
		category = 'vans',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'type266',
		name = 'type266',
		brand = 'type266',
		price = 186319,
		category = 'vans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_anarchy',
		name = 'van_anarchy',
		brand = 'van_anarchy',
		price = 257566,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'gaford34',
		name = 'gaford34',
		brand = 'gaford34',
		price = 258320,
		category = 'muscle',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'fleetline48',
		name = 'fleetline48',
		brand = 'fleetline48',
		price = 163322,
		category = 'coupes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'gacclub49',
		name = 'gacclub49',
		brand = 'gacclub49',
		price = 221118,
		category = 'coupes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'gactud49',
		name = 'gactud49',
		brand = 'gactud49',
		price = 216470,
		category = 'coupes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'f-one49d',
		name = 'f-one49d',
		brand = 'f-one49d',
		price = 278237,
		category = 'utility',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'f-one49db',
		name = 'f-one49db',
		brand = 'f-one49db',
		price = 349443,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'granada81',
		name = 'granada81',
		brand = 'granada81',
		price = 210008,
		category = 'sedans',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'van_ballas',
		name = 'van_ballas',
		brand = 'van_ballas',
		price = 258377,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_blackjackets',
		name = 'van_blackjackets',
		brand = 'van_blackjackets',
		price = 292743,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_blacklions',
		name = 'van_blacklions',
		brand = 'van_blacklions',
		price = 299590,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_bloods',
		name = 'van_bloods',
		brand = 'van_bloods',
		price = 244719,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_bratwa',
		name = 'van_bratwa',
		brand = 'van_bratwa',
		price = 225250,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_brigada',
		name = 'van_brigada',
		brand = 'van_brigada',
		price = 254503,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_cali',
		name = 'van_cali',
		brand = 'van_cali',
		price = 244619,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_camorra',
		name = 'van_camorra',
		brand = 'van_camorra',
		price = 245387,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_club77',
		name = 'van_club77',
		brand = 'van_club77',
		price = 273064,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_criminals',
		name = 'van_criminals',
		brand = 'van_criminals',
		price = 226811,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_crips',
		name = 'van_crips',
		brand = 'van_crips',
		price = 272012,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_deparis',
		name = 'van_deparis',
		brand = 'van_deparis',
		price = 239431,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_galaxy',
		name = 'van_galaxy',
		brand = 'van_galaxy',
		price = 304812,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_gmbh',
		name = 'van_gmbh',
		brand = 'van_gmbh',
		price = 273235,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_gonzales',
		name = 'van_gonzales',
		brand = 'van_gonzales',
		price = 229527,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_grove',
		name = 'van_grove',
		brand = 'van_grove',
		price = 310495,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_hoover',
		name = 'van_hoover',
		brand = 'van_hoover',
		price = 271337,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_kadir',
		name = 'van_kadir',
		brand = 'van_kadir',
		price = 271101,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_lcn',
		name = 'van_lcn',
		brand = 'van_lcn',
		price = 247347,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_lostmc',
		name = 'van_lostmc',
		brand = 'van_lostmc',
		price = 307483,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_medelin',
		name = 'van_medelin',
		brand = 'van_medelin',
		price = 230583,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_mg13',
		name = 'van_mg13',
		brand = 'van_mg13',
		price = 229617,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_midnight',
		name = 'van_midnight',
		brand = 'van_midnight',
		price = 292975,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_narcos',
		name = 'van_narcos',
		brand = 'van_narcos',
		price = 291786,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_ogs',
		name = 'van_ogs',
		brand = 'van_ogs',
		price = 273801,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_orga',
		name = 'van_orga',
		brand = 'van_orga',
		price = 227825,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_osmanen',
		name = 'van_osmanen',
		brand = 'van_osmanen',
		price = 283058,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_peakyblinders',
		name = 'van_peakyblinders',
		brand = 'van_peakyblinders',
		price = 285685,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_redlight',
		name = 'van_redlight',
		brand = 'van_redlight',
		price = 288675,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_santasofia',
		name = 'van_santasofia',
		brand = 'van_santasofia',
		price = 266293,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_st187',
		name = 'van_st187',
		brand = 'van_st187',
		price = 305573,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_syndicate',
		name = 'van_syndicate',
		brand = 'van_syndicate',
		price = 305160,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_triaden',
		name = 'van_triaden',
		brand = 'van_triaden',
		price = 304054,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_tschetschenen',
		name = 'van_tschetschenen',
		brand = 'van_tschetschenen',
		price = 258983,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_vagos',
		name = 'van_vagos',
		brand = 'van_vagos',
		price = 230152,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_woo',
		name = 'van_woo',
		brand = 'van_woo',
		price = 296338,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'van_yakuza',
		name = 'van_yakuza',
		brand = 'van_yakuza',
		price = 294552,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'viron',
		name = 'viron',
		brand = 'viron',
		price = 355072,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'vironmichalski',
		name = 'vironmichalski',
		brand = 'vironmichalski',
		price = 378730,
		category = 'super',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'volatus2',
		name = 'volatus2',
		brand = 'volatus2',
		price = 1278730,
		category = 'helicopters',
		type = 'heli',
		shop = 'air'
	 },
	{--600-DebadgedCars
		model = 'x6_brigada',
		name = 'x6_brigada',
		brand = 'x6_brigada',
		price = 136841,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'x6_cali',
		name = 'x6_cali',
		brand = 'x6_cali',
		price = 160330,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'x6_camorra',
		name = 'x6_camorra',
		brand = 'x6_camorra',
		price = 157676,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'x6_midnight',
		name = 'x6_midnight',
		brand = 'x6_midnight',
		price = 158361,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'x6_narcos',
		name = 'x6_narcos',
		brand = 'x6_narcos',
		price = 167241,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'x6_orga',
		name = 'x6_orga',
		brand = 'x6_orga',
		price = 164952,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'x6_yakuza',
		name = 'x6_yakuza',
		brand = 'x6_yakuza',
		price = 148547,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'xc90',
		name = 'xc90',
		brand = 'xc90',
		price = 178250,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = '21sierra',
		name = '21sierra',
		brand = '21sierra',
		price = 178250,
		category = 'vans',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'gmcev',
		name = 'gmcev',
		brand = 'gmcev',
		price = 138339,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'gmcev2',
		name = 'gmcev2',
		brand = 'gmcev2',
		price = 174159,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	-- {--600-DebadgedCars
		-- model = 'GODzOOF6x6',
		-- name = 'GODzOOF6x6',
		-- brand = 'GODzOOF6x6',
		-- price = 193511,
		-- category = 'vans',
		-- type = 'automobile',
		-- shop = 'pdm'
	 -- },
	{--600-DebadgedCars
		model = 'animfk8hr',
		name = 'animfk8hr',
		brand = 'animfk8hr',
		price = 193691,
		category = 'compacts',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'civic2020',
		name = 'civic2020',
		brand = 'civic2020',
		price = 254934,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'cu2',
		name = 'cu2',
		brand = 'cu2',
		price = 213110,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'DC5',
		name = 'DC5',
		brand = 'DC5',
		price = 192104,
		category = 'compacts',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'EK9',
		name = 'EK9',
		brand = 'EK9',
		price = 175379,
		category = 'compacts',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'fk8',
		name = 'fk8',
		brand = 'fk8',
		price = 340613,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'nsx17',
		name = 'nsx17',
		brand = 'nsx17',
		price = 384336,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'ody18',
		name = 'ody18',
		brand = 'ody18',
		price = 384336,
		category = 'vans',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'h2m',
		name = 'h2m',
		brand = 'h2m',
		price = 173755,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'hyundaiveloster',
		name = 'hyundaiveloster',
		brand = 'hyundaiveloster',
		price = 303327,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'fpaceprior',
		name = 'fpaceprior',
		brand = 'fpaceprior',
		price = 141925,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'project8',
		name = 'project8',
		brand = 'project8',
		price = 246038,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'xkgt',
		name = 'xkgt',
		brand = 'xkgt',
		price = 357436,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{-- Nicholiae 1 of 1
		model = '2022jeep',
		name = '2022jeep',
		brand = '2022jeep',
		price = 363050,
		category = 'reserved',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'abhawk',
		name = 'abhawk',
		brand = 'abhawk',
		price = 159171,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'demonhawkk',
		name = 'demonhawkk',
		brand = 'demonhawkk',
		price = 150304,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'f22thawk',
		name = 'f22thawk',
		brand = 'f22thawk',
		price = 168618,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	-- {--600-DebadgedCars
		-- model = 'gjeep',
		-- name = 'gjeep',
		-- brand = 'gjeep',
		-- price = 344853,
		-- category = 'offroad',
		-- type = 'automobile',
		-- shop = 'truck'
	 -- },
	{--600-DebadgedCars
		model = 'hychawk',
		name = 'hychawk',
		brand = 'hychawk',
		price = 174932,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'KillerHwak',
		name = 'KillerHwak',
		brand = 'KillerHwak',
		price = 168796,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'rmodjeepg',
		name = 'rmodjeepg',
		brand = 'rmodjeepg',
		price = 365032,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'agerars',
		name = 'agerars',
		brand = 'agerars',
		price = 399206,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'gemera',
		name = 'gemera',
		brand = 'gemera',
		price = 365961,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'gxone',
		name = 'gxone',
		brand = 'gxone',
		price = 378453,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'jes21',
		name = 'jes21',
		brand = 'jes21',
		price = 215793,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = '1016rwdevo',
		name = '1016rwdevo',
		brand = '1016rwdevo',
		price = 393696,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = '1016urus',
		name = '1016urus',
		brand = '1016urus',
		price = 138715,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = '18performante',
		name = '18performante',
		brand = '18performante',
		price = 326545,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'amrevu23mg',
		name = 'amrevu23mg',
		brand = 'amrevu23mg',
		price = 356055,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'carboDRCustoM',
		name = 'carboDRCustoM',
		brand = 'carboDRCustoM',
		price = 403472,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'choilambo',
		name = 'choilambo',
		brand = 'choilambo',
		price = 338188,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'ftecnica',
		name = 'ftecnica',
		brand = 'ftecnica',
		price = 354665,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'gcmlamboultimae',
		name = 'gcmlamboultimae',
		brand = 'gcmlamboultimae',
		price = 223558,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'huracanpriorbeast',
		name = 'huracanpriorbeast',
		brand = 'huracanpriorbeast',
		price = 282265,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'hycadeurus',
		name = 'hycadeurus',
		brand = 'hycadeurus',
		price = 168339,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'lbperfs',
		name = 'lbperfs',
		brand = 'lbperfs',
		price = 404012,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'lbwkevo',
		name = 'lbwkevo',
		brand = 'lbwkevo',
		price = 330659,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'lpi80041',
		name = 'lpi80041',
		brand = 'lpi80041',
		price = 386232,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'manscountach',
		name = 'manscountach',
		brand = 'manscountach',
		price = 379691,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'mansurus',
		name = 'mansurus',
		brand = 'mansurus',
		price = 379340,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'revueltobeast',
		name = 'revueltobeast',
		brand = 'revueltobeast',
		price = 399587,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rmodsvj',
		name = 'rmodsvj',
		brand = 'rmodsvj',
		price = 364346,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'sex6',
		name = 'sex6',
		brand = 'sex6',
		price = 371592,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'sian',
		name = 'sian',
		brand = 'sian',
		price = 170729,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'sinacp',
		name = 'sinacp',
		brand = 'sinacp',
		price = 343221,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'terzo',
		name = 'terzo',
		brand = 'terzo',
		price = 334879,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'terzo1',
		name = 'terzo1',
		brand = 'terzo1',
		price = 395164,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'TTSTO',
		name = 'TTSTO',
		brand = 'TTSTO',
		price = 403279,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'urusbeastedit',
		name = 'urusbeastedit',
		brand = 'urusbeastedit',
		price = 351972,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'Urus_Stretch_6',
		name = 'Urus_Stretch_6',
		brand = 'Urus_Stretch_6',
		price = 169995,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'vanztt',
		name = 'vanztt',
		brand = 'vanztt',
		price = 365957,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'vanzur',
		name = 'vanzur',
		brand = 'vanzur',
		price = 159586,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'venatus',
		name = 'venatus',
		brand = 'venatus',
		price = 150144,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'zentenario',
		name = 'zentenario',
		brand = 'zentenario',
		price = 331777,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'oycdefender',
		name = 'oycdefender',
		brand = 'oycdefender',
		price = 163672,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'lc500',
		name = 'lc500',
		brand = 'lc500',
		price = 213652,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'ikx3mc2021',
		name = 'ikx3mc2021',
		brand = 'ikx3mc2021',
		price = 358443,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'mlnovitec',
		name = 'mlnovitec',
		brand = 'mlnovitec',
		price = 137965,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'cx30wz',
		name = 'cx30wz',
		brand = 'cx30wz',
		price = 150471,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'furai',
		name = 'furai',
		brand = 'furai',
		price = 358130,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	-- {--600-DebadgedCars
		-- model = 'GODzKRCRX7FD',
		-- name = 'GODzKRCRX7FD',
		-- brand = 'GODzKRCRX7FD',
		-- price = 435700,
		-- category = 'sports',
		-- type = 'automobile',
		-- shop = 'tuners'
	 -- },
	{--600-DebadgedCars
		model = 'mxpan',
		name = 'mxpan',
		brand = 'mxpan',
		price = 282983,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'na6',
		name = 'na6',
		brand = 'na6',
		price = 267462,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rx7',
		name = 'rx7',
		brand = 'rx7',
		price = 315771,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rx7veilside',
		name = 'rx7veilside',
		brand = 'rx7veilside',
		price = 361432,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = '600ltwb',
		name = '600ltwb',
		brand = '600ltwb',
		price = 358896,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = '675lt',
		name = '675lt',
		brand = '675lt',
		price = 263839,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = '720sdd',
		name = '720sdd',
		brand = '720sdd',
		price = 380816,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = '765LT1016sc',
		name = '765LT1016sc',
		brand = '765LT1016sc',
		price = 377064,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'mansgt',
		name = 'mansgt',
		brand = 'mansgt',
		price = 341345,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'neonp1',
		name = 'neonp1',
		brand = 'neonp1',
		price = 329646,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'p1lbwk',
		name = 'p1lbwk',
		brand = 'p1lbwk',
		price = 347189,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rmodp1gtr',
		name = 'rmodp1gtr',
		brand = 'rmodp1gtr',
		price = 344993,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{-- OTF 1of1
		model = 'senna',
		name = 'senna',
		brand = 'senna',
		price = 378875,
		category = 'reserved',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'ugc765lt',
		name = 'ugc765lt',
		brand = 'ugc765lt',
		price = 315674,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'f450c',
		name = 'f450c',
		brand = 'f450c',
		price = 1431128,
		category = 'utility',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'f550rbc',
		name = 'f550rbc',
		brand = 'f550rbc',
		price = 2680795,
		category = 'utility',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'ambulance1',
		name = 'ambulance1',
		brand = 'ambulance1',
		price = 1623672,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'Ambulance_Dodge_RAM',
		name = 'Ambulance_Dodge_RAM',
		brand = 'Ambulance_Dodge_RAM',
		price = 1603362,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'amrvan',
		name = 'amrvan',
		brand = 'amrvan',
		price = 1638109,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'audirs6emsfire',
		name = 'audirs6emsfire',
		brand = 'audirs6emsfire',
		price = 2222035,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'aw139',
		name = 'aw139',
		brand = 'aw139',
		price = 2222035,
		category = 'helicopters',
		type = 'heli',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'BMW-x5_medic',
		name = 'BMW-x5_medic',
		brand = 'BMW-x5_medic',
		price = 2132851,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'DC_RoyalCustom___RS7_EMS',
		name = 'DC_RoyalCustom___RS7_EMS',
		brand = 'DC_RoyalCustom___RS7_EMS',
		price = 2325108,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'emsbmwm7',
		name = 'emsbmwm7',
		brand = 'emsbmwm7',
		price = 1896366,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'RoyalCustom_RSQ8_EMS',
		name = 'RoyalCustom_RSQ8_EMS',
		brand = 'RoyalCustom_RSQ8_EMS',
		price = 2078600,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'RoyalDodgeRAMems',
		name = 'RoyalDodgeRAMems',
		brand = 'RoyalDodgeRAMems',
		price = 1568965,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'RoyalG30Medic',
		name = 'RoyalG30Medic',
		brand = 'RoyalG30Medic',
		price = 1475528,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'RoyalYamahaEMS_white',
		name = 'RoyalYamahaEMS_white',
		brand = 'RoyalYamahaEMS_white',
		price = 1616923,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = '2018s650p',
		name = '2018s650p',
		brand = '2018s650p',
		price = 209540,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = '2020CLA45s',
		name = '2020CLA45s',
		brand = '2020CLA45s',
		price = 273128,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = '6x6',
		name = '6x6',
		brand = '6x6',
		price = 436988,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'a45',
		name = 'a45',
		brand = 'a45',
		price = 202001,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'amggt16',
		name = 'amggt16',
		brand = 'amggt16',
		price = 328522,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'amggtbs',
		name = 'amggtbs',
		brand = 'amggtbs',
		price = 400240,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'AmgGtrLight',
		name = 'AmgGtrLight',
		brand = 'AmgGtrLight',
		price = 309839,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'amgone',
		name = 'amgone',
		brand = 'amgone',
		price = 302078,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'b63s',
		name = 'b63s',
		brand = 'b63s',
		price = 158625,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'benzc32',
		name = 'benzc32',
		brand = 'benzc32',
		price = 205621,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'benze55',
		name = 'benze55',
		brand = 'benze55',
		price = 332853,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'benzsl63',
		name = 'benzsl63',
		brand = 'benzsl63',
		price = 393393,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'bg700w',
		name = 'bg700w',
		brand = 'bg700w',
		price = 165201,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'brabusgt700',
		name = 'brabusgt700',
		brand = 'brabusgt700',
		price = 326987,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'c63hr',
		name = 'c63hr',
		brand = 'c63hr',
		price = 218768,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'C63SPD',
		name = 'C63SPD',
		brand = 'C63SPD',
		price = 217721,
		category = 'coupes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'c63scpd',
		name = 'c63scpd',
		brand = 'c63scpd',
		price = 173538,
		category = 'coupes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'cls19',
		name = 'cls19',
		brand = 'cls19',
		price = 189686,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'cls500w219',
		name = 'cls500w219',
		brand = 'cls500w219',
		price = 224523,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'DBb800',
		name = 'DBb800',
		brand = 'DBb800',
		price = 328103,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'ddcemperor',
		name = 'ddcemperor',
		brand = 'ddcemperor',
		price = 180148,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'DL_G900',
		name = 'DL_G900',
		brand = 'DL_G900',
		price = 174950,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'dvc63darwin',
		name = 'dvc63darwin',
		brand = 'dvc63darwin',
		price = 158217,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'e55',
		name = 'e55',
		brand = 'e55',
		price = 395523,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'e63s',
		name = 'e63s',
		brand = 'e63s',
		price = 380723,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'f190e',
		name = 'f190e',
		brand = 'f190e',
		price = 182159,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'g63',
		name = 'g63',
		brand = 'g63',
		price = 146176,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'W463AS',
		name = 'W463AS',
		brand = 'W463AS',
		price = 142068,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'W463A',
		name = 'W463A',
		brand = 'W463A',
		price = 174078,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'g5502019',
		name = 'g5502019',
		brand = 'g5502019',
		price = 173179,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'G632019',
		name = 'G632019',
		brand = 'G632019',
		price = 144470,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'G632019X',
		name = 'G632019X',
		brand = 'G632019X',
		price = 157241,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'G634X4',
		name = 'G634X4',
		brand = 'G634X4',
		price = 140361,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'g63amg6x6',
		name = 'g63amg6x6',
		brand = 'g63amg6x6',
		price = 434250,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'g63c',
		name = 'g63c',
		brand = 'g63c',
		price = 162323,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'g63g800bo',
		name = 'g63g800bo',
		brand = 'g63g800bo',
		price = 176968,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'G63Sam',
		name = 'G63Sam',
		brand = 'G63Sam',
		price = 418218,
		category = 'reserved',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'g65',
		name = 'g65',
		brand = 'g65',
		price = 155760,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'g700brabusretuned',
		name = 'g700brabusretuned',
		brand = 'g700brabusretuned',
		price = 177402,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'g900przemo6x6',
		name = 'g900przemo6x6',
		brand = 'g900przemo6x6',
		price = 146803,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'gl63',
		name = 'gl63',
		brand = 'gl63',
		price = 154166,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'GLK',
		name = 'GLK',
		brand = 'GLK',
		price = 136108,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	-- {--600-DebadgedCars
		-- model = 'GODzVIPS63AMG',
		-- name = 'GODzVIPS63AMG',
		-- brand = 'GODzVIPS63AMG',
		-- price = 209989,
		-- category = 'coupes',
		-- type = 'automobile',
		-- shop = 'customs'
	 -- },
	{--600-DebadgedCars
		model = 'gt63',
		name = 'gt63',
		brand = 'gt63',
		price = 307533,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'gt63mt',
		name = 'gt63mt',
		brand = 'gt63mt',
		price = 241996,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'gta5rp_veh_c63s',
		name = 'gta5rp_veh_c63s',
		brand = 'gta5rp_veh_c63s',
		price = 221669,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'gta5rp_veh_gle1',
		name = 'gta5rp_veh_gle1',
		brand = 'gta5rp_veh_gle1',
		price = 146022,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'mans65',
		name = 'mans65',
		brand = 'mans65',
		price = 221240,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'mansoryg63',
		name = 'mansoryg63',
		brand = 'mansoryg63',
		price = 136471,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'mayb900',
		name = 'mayb900',
		brand = 'mayb900',
		price = 221065,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'maybach',
		name = 'maybach',
		brand = 'maybach',
		price = 373356,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'MAYG600P',
		name = 'MAYG600P',
		brand = 'MAYG600P',
		price = 139137,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'MAYG600PX',
		name = 'MAYG600PX',
		brand = 'MAYG600PX',
		price = 171008,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'mercec63s',
		name = 'mercec63s',
		brand = 'mercec63s',
		price = 165919,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'merse63',
		name = 'merse63',
		brand = 'merse63',
		price = 230091,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'mlbrabus',
		name = 'mlbrabus',
		brand = 'mlbrabus',
		price = 175108,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'msls',
		name = 'msls',
		brand = 'msls',
		price = 160277,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'priorgt63s',
		name = 'priorgt63s',
		brand = 'priorgt63s',
		price = 172649,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'rmode63s',
		name = 'rmode63s',
		brand = 'rmode63s',
		price = 380390,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rmodg65',
		name = 'rmodg65',
		brand = 'rmodg65',
		price = 169330,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'rmodgt63',
		name = 'rmodgt63',
		brand = 'rmodgt63',
		price = 282773,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 's500w222',
		name = 's500w222',
		brand = 's500w222',
		price = 221587,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 's550kev',
		name = 's550kev',
		brand = 's550kev',
		price = 162956,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 's63coupe',
		name = 's63coupe',
		brand = 's63coupe',
		price = 157491,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 's63msc',
		name = 's63msc',
		brand = 's63msc',
		price = 229974,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'topcargt63',
		name = 'topcargt63',
		brand = 'topcargt63',
		price = 185046,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'w222wald',
		name = 'w222wald',
		brand = 'w222wald',
		price = 184667,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'waldw222',
		name = 'waldw222',
		brand = 'waldw222',
		price = 160469,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--RIP 1of1
		model = 'cooperworks',
		name = 'cooperworks',
		brand = 'cooperworks',
		price = 215177,
		category = 'compacts',
		type = 'automobile',
		shop = 'reserved'
	 },
	{-- Rip 1of1
		model = 'jcw',
		name = 'jcw',
		brand = 'jcw',
		price = 281233,
		category = 'reserved',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'jcwc',
		name = 'jcwc',
		brand = 'jcwc',
		price = 162169,
		category = 'compacts',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = '2f2fgts',
		name = '2f2fgts',
		brand = '2f2fgts',
		price = 336816,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'cp9a',
		name = 'cp9a',
		brand = 'cp9a',
		price = 212265,
		category = 'compacts',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'evo9',
		name = 'evo9',
		brand = 'evo9',
		price = 368577,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'evo9mr',
		name = 'evo9mr',
		brand = 'evo9mr',
		price = 235829,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'evoss',
		name = 'evoss',
		brand = 'evoss',
		price = 380430,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'evox',
		name = 'evox',
		brand = 'evox',
		price = 353584,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'fnfmits',
		name = 'fnfmits',
		brand = 'fnfmits',
		price = 247799,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'hycadeevo',
		name = 'hycadeevo',
		brand = 'hycadeevo',
		price = 232703,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = '350z',
		name = '350z',
		brand = '350z',
		price = 391320,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	-- {--600-DebadgedCars
		-- model = 'GODzHYCADER34',
		-- name = 'GODzHYCADER34',
		-- brand = 'GODzHYCADER34',
		-- price = 317173,
		-- category = 'sports',
		-- type = 'automobile',
		-- shop = 'tuners'
	 -- },
	{--600-DebadgedCars
		model = 'gta5rp_veh_gtr33',
		name = 'gta5rp_veh_gtr33',
		brand = 'gta5rp_veh_gtr33',
		price = 284747,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'gtr50',
		name = 'gtr50',
		brand = 'gtr50',
		price = 292336,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'gtrh',
		name = 'gtrh',
		brand = 'gtrh',
		price = 398954,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'gtz34be',
		name = 'gtz34be',
		brand = 'gtz34be',
		price = 330426,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'lbwk35',
		name = 'lbwk35',
		brand = 'lbwk35',
		price = 343474,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'nismo20',
		name = 'nismo20',
		brand = 'nismo20',
		price = 376157,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'nissanr36',
		name = 'nissanr36',
		brand = 'nissanr36',
		price = 352478,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'r33ptnc',
		name = 'r33ptnc',
		brand = 'r33ptnc',
		price = 276485,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'r355',
		name = 'r355',
		brand = 'r355',
		price = 364047,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'r35secret',
		name = 'r35secret',
		brand = 'r35secret',
		price = 379008,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rmod240sx',
		name = 'rmod240sx',
		brand = 'rmod240sx',
		price = 357417,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rmodgtr',
		name = 'rmodgtr',
		brand = 'rmodgtr',
		price = 256580,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rmodskyline34',
		name = 'rmodskyline34',
		brand = 'rmodskyline34',
		price = 265091,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 's15',
		name = 's15',
		brand = 's15',
		price = 300778,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'silviagd',
		name = 'silviagd',
		brand = 'silviagd',
		price = 347532,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'skyline',
		name = 'skyline',
		brand = 'skyline',
		price = 254893,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'ToraGTRWBMega',
		name = 'ToraGTRWBMega',
		brand = 'ToraGTRWBMega',
		price = 251018,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'vanzkrc',
		name = 'vanzkrc',
		brand = 'vanzkrc',
		price = 262575,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = '204sPetro',
		name = '204sPetro',
		brand = '204sPetro',
		price = 1914340,
		category = 'commercial',
		type = 'automobile',
		shop = 'commercial'
	 },
	{--600-DebadgedCars
		model = 'banana',
		name = 'banana',
		brand = 'banana',
		price = 307002,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'carsonswbc6',
		name = 'carsonswbc6',
		brand = 'carsonswbc6',
		price = 338373,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'f1',
		name = 'f1',
		brand = 'f1',
		price = 151237,
		category = 'openwheel',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'fbv60pole',
		name = 'fbv60pole',
		brand = 'fbv60pole',
		price = 374393,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'fcxl',
		name = 'fcxl',
		brand = 'fcxl',
		price = 440382,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'spyker',
		name = 'spyker',
		brand = 'spyker',
		price = 317970,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'moss',
		name = 'moss',
		brand = 'moss',
		price = 371972,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'charger',
		name = 'charger',
		brand = 'charger',
		price = 288509,
		category = 'muscle',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'cx75',
		name = 'cx75',
		brand = 'cx75',
		price = 346229,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'vulcan',
		name = 'vulcan',
		brand = 'vulcan',
		price = 346089,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'dbs',
		name = 'dbs',
		brand = 'dbs',
		price = 370361,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'firebirdwz',
		name = 'firebirdwz',
		brand = 'firebirdwz',
		price = 284217,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'fmagnum',
		name = 'fmagnum',
		brand = 'fmagnum',
		price = 204707,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'FORTWO17',
		name = 'FORTWO17',
		brand = 'FORTWO17',
		price = 183291,
		category = 'compacts',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'fprotozwb',
		name = 'fprotozwb',
		brand = 'fprotozwb',
		price = 433727,
		category = 'compacts',
		type = 'automobile',
		shop = 'customs'
	 },
	-- {--600-DebadgedCars
		-- model = 'GODz61BUS',
		-- name = 'GODz61BUS',
		-- brand = 'GODz61BUS',
		-- price = 169541,
		-- category = 'suvs',
		-- type = 'automobile',
		-- shop = 'pdm'
	 -- },
	-- {--600-DebadgedCars
		-- model = 'GODzKSTERZOTACHA',
		-- name = 'GODzKSTERZOTACHA',
		-- brand = 'GODzKSTERZOTACHA',
		-- price = 201805,
		-- category = 'coupes',
		-- type = 'automobile',
		-- shop = 'customs'
	 -- },
	-- {--600-DebadgedCars
		-- model = 'GODzRB26SUBI',
		-- name = 'GODzRB26SUBI',
		-- brand = 'GODzRB26SUBI',
		-- price = 170063,
		-- category = 'coupes',
		-- type = 'automobile',
		-- shop = 'customs'
	 -- },
	-- {--600-DebadgedCars
		-- model = 'GODzRZRPROLFTD',
		-- name = 'GODzRZRPROLFTD',
		-- brand = 'GODzRZRPROLFTD',
		-- price = 463310,
		-- category = 'offroad',
		-- type = 'automobile',
		-- shop = 'truck'
	 -- },
	{--600-DebadgedCars
		model = 'gstbird1',
		name = 'gstbird1',
		brand = 'gstbird1',
		price = 242104,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'gsthoonitruck1',
		name = 'gsthoonitruck1',
		brand = 'gsthoonitruck1',
		price = 315037,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'ikx3rebel22',
		name = 'ikx3rebel22',
		brand = 'ikx3rebel22',
		price = 397353,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'kart',
		name = 'kart',
		brand = 'kart',
		price = 319515,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'loweyezv',
		name = 'loweyezv',
		brand = 'loweyezv',
		price = 342592,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'owlbelair',
		name = 'owlbelair',
		brand = 'owlbelair',
		price = 140265,
		category = 'coupes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'owlbelair2',
		name = 'owlbelair2',
		brand = 'owlbelair2',
		price = 211938,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'rmodr50',
		name = 'rmodr50',
		brand = 'rmodr50',
		price = 148419,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'rr21shelbystreet',
		name = 'rr21shelbystreet',
		brand = 'rr21shelbystreet',
		price = 267624,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'rroctane',
		name = 'rroctane',
		brand = 'rroctane',
		price = 303531,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'rtruck',
		name = 'rtruck',
		brand = 'rtruck',
		price = 356013,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'RYGbus',
		name = 'RYGbus',
		brand = 'RYGbus',
		price = 356013,
		category = 'vans',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'mv7201',
		name = 'mv7201',
		brand = 'mv7201',
		price = 322559,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'SHEL',
		name = 'SHEL',
		brand = 'SHEL',
		price = 2671892,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'singer',
		name = 'singer',
		brand = 'singer',
		price = 252111,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'swl',
		name = 'swl',
		brand = 'swl',
		price = 252627,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'taycan',
		name = 'taycan',
		brand = 'taycan',
		price = 266792,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'thewolftruck',
		name = 'thewolftruck',
		brand = 'thewolftruck',
		price = 383184,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'tieens',
		name = 'tieens',
		brand = 'tieens',
		price = 394230,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'vanzwb06',
		name = 'vanzwb06',
		brand = 'vanzwb06',
		price = 186504,
		category = 'sedans',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'yoti',
		name = 'yoti',
		brand = 'yoti',
		price = 374472,
		category = 'super',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'pagani_zonda_cinque',
		name = 'pagani_zonda_cinque',
		brand = 'pagani_zonda_cinque',
		price = 354170,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rmodpagani',
		name = 'rmodpagani',
		brand = 'rmodpagani',
		price = 322027,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'TCZjc',
		name = 'TCZjc',
		brand = 'TCZjc',
		price = 334987,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'F22A',
		name = 'F22A',
		brand = 'F22A',
		price = 4384987,
		category = 'planes',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'mh47g',
		name = 'mh47g',
		brand = 'mh47g',
		price = 2764987,
		category = 'helicopters',
		type = 'heli',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'polestar1',
		name = 'polestar1',
		brand = 'polestar1',
		price = 270754,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = '22g63',
		name = '22g63',
		brand = '22g63',
		price = 1667375,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = '22M5SAL',
		name = '22M5SAL',
		brand = '22M5SAL',
		price = 2474565,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'ACTRPavant',
		name = 'ACTRPavant',
		brand = 'ACTRPavant',
		price = 2189915,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'ACTRPavantum',
		name = 'ACTRPavantum',
		brand = 'ACTRPavantum',
		price = 2504997,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'DL_a45',
		name = 'DL_a45',
		brand = 'DL_a45',
		price = 1968391,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'DL_rs6',
		name = 'DL_rs6',
		brand = 'DL_rs6',
		price = 1646596,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'DL_RS7',
		name = 'DL_RS7',
		brand = 'DL_RS7',
		price = 2457170,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'nm_ctsv',
		name = 'nm_ctsv',
		brand = 'nm_ctsv',
		price = 1463112,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'nm_hell',
		name = 'nm_hell',
		brand = 'nm_hell',
		price = 2012787,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'nm_z71',
		name = 'nm_z71',
		brand = 'nm_z71',
		price = 1831515,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'pd_escalader',
		name = 'pd_escalader',
		brand = 'pd_escalader',
		price = 1960929,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'polbike',
		name = 'polbike',
		brand = 'polbike',
		price = 2489487,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'polbmwm3',
		name = 'polbmwm3',
		brand = 'polbmwm3',
		price = 2514654,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'polbmwm7',
		name = 'polbmwm7',
		brand = 'polbmwm7',
		price = 2217293,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'polboat1',
		name = 'polboat1',
		brand = 'polboat1',
		price = 1760093,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'HILLBOATY',
		name = 'HILLBOATY',
		brand = 'HILLBOATY',
		price = 2494881,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'LARGEBOAT',
		name = 'LARGEBOAT',
		brand = 'LARGEBOAT',
		price = 1523016,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'polboat2',
		name = 'polboat2',
		brand = 'polboat2',
		price = 1876776,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'polcharger18',
		name = 'polcharger18',
		brand = 'polcharger18',
		price = 1492825,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'polcoach',
		name = 'polcoach',
		brand = 'polcoach',
		price = 2450250,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'USMSWashington',
		name = 'USMSWashington',
		brand = 'USMSWashington',
		price = 1771157,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'USMSRumpo',
		name = 'USMSRumpo',
		brand = 'USMSRumpo',
		price = 2234103,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'polcross',
		name = 'polcross',
		brand = 'polcross',
		price = 1836261,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'poldurango',
		name = 'poldurango',
		brand = 'poldurango',
		price = 1526885,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'polheli',
		name = 'polheli',
		brand = 'polheli',
		price = 1526885,
		category = 'helicopters',
		type = 'heli',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'polkawasaki',
		name = 'polkawasaki',
		brand = 'polkawasaki',
		price = 2556420,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'polmav',
		name = 'polmav',
		brand = 'polmav',
		price = 2556420,
		category = 'helicopters',
		type = 'heli',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'polmustang',
		name = 'polmustang',
		brand = 'polmustang',
		price = 2080555,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'polsilverado19',
		name = 'polsilverado19',
		brand = 'polsilverado19',
		price = 1536675,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'rmodgt63police',
		name = 'rmodgt63police',
		brand = 'rmodgt63police',
		price = 1826877,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'RoyalCustom_R34Marked',
		name = 'RoyalCustom_R34Marked',
		brand = 'RoyalCustom_R34Marked',
		price = 1729192,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'sw_bearcat',
		name = 'sw_bearcat',
		brand = 'sw_bearcat',
		price = 2284965,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'sw_sprinter',
		name = 'sw_sprinter',
		brand = 'sw_sprinter',
		price = 2214504,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'sw_subrb',
		name = 'sw_subrb',
		brand = 'sw_subrb',
		price = 2379164,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'trhawk',
		name = 'trhawk',
		brand = 'trhawk',
		price = 2081632,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'unmarkedjl',
		name = 'unmarkedjl',
		brand = 'unmarkedjl',
		price = 2631398,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'hwaybuffals2',
		name = 'hwaybuffals2',
		brand = 'hwaybuffals2',
		price = 1531599,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'polbuffals',
		name = 'polbuffals',
		brand = 'polbuffals',
		price = 2261207,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'umkbuffals',
		name = 'umkbuffals',
		brand = 'umkbuffals',
		price = 2046524,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'umkbuffals2',
		name = 'umkbuffals2',
		brand = 'umkbuffals2',
		price = 2424333,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'umkbuffals3',
		name = 'umkbuffals3',
		brand = 'umkbuffals3',
		price = 2190477,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'trubuffals',
		name = 'trubuffals',
		brand = 'trubuffals',
		price = 1368983,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'trubuffals2',
		name = 'trubuffals2',
		brand = 'trubuffals2',
		price = 2224637,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'zm_rocket900',
		name = 'zm_rocket900',
		brand = 'zm_rocket900',
		price = 2102587,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'zm_s500',
		name = 'zm_s500',
		brand = 'zm_s500',
		price = 2508208,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = '17mansorypnmr',
		name = '17mansorypnmr',
		brand = '17mansorypnmr',
		price = 190919,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = '911gtrs',
		name = '911gtrs',
		brand = '911gtrs',
		price = 332633,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = '911turbos',
		name = '911turbos',
		brand = '911turbos',
		price = 329595,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'carrera19',
		name = 'carrera19',
		brand = 'carrera19',
		price = 277057,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'cayen19',
		name = 'cayen19',
		brand = 'cayen19',
		price = 260945,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'cayennemecqq',
		name = 'cayennemecqq',
		brand = 'cayennemecqq',
		price = 144585,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	-- {--600-DebadgedCars
		-- model = 'GODzDUKESGT2RSV2',
		-- name = 'GODzDUKESGT2RSV2',
		-- brand = 'GODzDUKESGT2RSV2',
		-- price = 449232,
		-- category = 'sports',
		-- type = 'automobile',
		-- shop = 'tuners'
	 -- },
	{--600-DebadgedCars
		model = 'gt2rs',
		name = 'gt2rs',
		brand = 'gt2rs',
		price = 241261,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	-- {--600-DebadgedCars
		-- model = 'gt2rs2',
		-- name = 'gt2rs2',
		-- brand = 'gt2rs2',
		-- price = 256346,
		-- category = 'sports',
		-- type = 'automobile',
		-- shop = 'tuners'
	 -- },
	{--600-DebadgedCars
		model = 'gt3demon',
		name = 'gt3demon',
		brand = 'gt3demon',
		price = 371471,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'gt3hycade',
		name = 'gt3hycade',
		brand = 'gt3hycade',
		price = 257616,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'gt4hycade',
		name = 'gt4hycade',
		brand = 'gt4hycade',
		price = 341798,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'ikx3gt3rs23',
		name = 'ikx3gt3rs23',
		brand = 'ikx3gt3rs23',
		price = 363123,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'ikx3hn65',
		name = 'ikx3hn65',
		brand = 'ikx3hn65',
		price = 388930,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'manspana',
		name = 'manspana',
		brand = 'manspana',
		price = 187260,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'panamturs21',
		name = 'panamturs21',
		brand = 'panamturs21',
		price = 171635,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'por911gt3',
		name = 'por911gt3',
		brand = 'por911gt3',
		price = 343250,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'porche911speedhunter',
		name = 'porche911speedhunter',
		brand = 'porche911speedhunter',
		price = 359565,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'taycanani',
		name = 'taycanani',
		brand = 'taycanani',
		price = 292815,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'techart17',
		name = 'techart17',
		brand = 'techart17',
		price = 291993,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'venuum911',
		name = 'venuum911',
		brand = 'venuum911',
		price = 312883,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'duallybshack',
		name = 'duallybshack',
		brand = 'duallybshack',
		price = 297026,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'gcram1500',
		name = 'gcram1500',
		brand = 'gcram1500',
		price = 293238,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	-- {--600-DebadgedCars
		-- model = 'GODz22LIGHTNINGWB',
		-- name = 'GODz22LIGHTNINGWB',
		-- brand = 'GODz22LIGHTNINGWB',
		-- price = 197232,
		-- category = 'suvs',
		-- type = 'automobile',
		-- shop = 'pdm'
	 -- },
	-- {--600-DebadgedCars
		-- model = 'GODzRAMTRX6x6',
		-- name = 'GODzRAMTRX6x6',
		-- brand = 'GODzRAMTRX6x6',
		-- price = 197232,
		-- category = 'vans',
		-- type = 'automobile',
		-- shop = 'pdm'
	 -- },
	{--600-DebadgedCars
		model = 'ramtrx6x6',
		name = 'ramtrx6x6',
		brand = 'ramtrx6x6',
		price = 256868,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = '18Velar',
		name = '18Velar',
		brand = '18Velar',
		price = 176144,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'autobio',
		name = 'autobio',
		brand = 'autobio',
		price = 140922,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = '74civrswb',
		name = '74civrswb',
		brand = '74civrswb',
		price = 164373,
		category = 'compacts',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'ab300',
		name = 'ab300',
		brand = 'ab300',
		price = 339819,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'dawn',
		name = 'dawn',
		brand = 'dawn',
		price = 196846,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'dawnonyx',
		name = 'dawnonyx',
		brand = 'dawnonyx',
		price = 140171,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'kln',
		name = 'kln',
		brand = 'kln',
		price = 180365,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'rculi',
		name = 'rculi',
		brand = 'rculi',
		price = 148911,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--600-DebadgedCars
		model = 'Rolls6x6',
		name = 'Rolls6x6',
		brand = 'Rolls6x6',
		price = 307395,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--600-DebadgedCars
		model = 'rrphantom',
		name = 'rrphantom',
		brand = 'rrphantom',
		price = 199474,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'rrwraith',
		name = 'rrwraith',
		brand = 'rrwraith',
		price = 221475,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'wraith',
		name = 'wraith',
		brand = 'wraith',
		price = 214520,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = '17silvk9rb',
		name = '17silvk9rb',
		brand = '17silvk9rb',
		price = 1791639,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'eheli',
		name = 'eheli',
		brand = 'eheli',
		price = 1791639,
		category = 'helicopters',
		type = 'heli',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'gurkharb',
		name = 'gurkharb',
		brand = 'gurkharb',
		price = 2252831,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'policeboat',
		name = 'policeboat',
		brand = 'policeboat',
		price = 2252831,
		category = 'boats',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'Prisonvan2rb',
		name = 'Prisonvan2rb',
		brand = 'Prisonvan2rb',
		price = 1558421,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'speeddemonrb',
		name = 'speeddemonrb',
		brand = 'speeddemonrb',
		price = 1621224,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'valor10rb',
		name = 'valor10rb',
		brand = 'valor10rb',
		price = 1447387,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'valor12rb',
		name = 'valor12rb',
		brand = 'valor12rb',
		price = 2653029,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'valor13rb',
		name = 'valor13rb',
		brand = 'valor13rb',
		price = 2236115,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'valor15rb',
		name = 'valor15rb',
		brand = 'valor15rb',
		price = 1825249,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'valor1rb',
		name = 'valor1rb',
		brand = 'valor1rb',
		price = 1712060,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'valor3rb',
		name = 'valor3rb',
		brand = 'valor3rb',
		price = 2561630,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'valor5rb',
		name = 'valor5rb',
		brand = 'valor5rb',
		price = 2466495,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'valor6rb',
		name = 'valor6rb',
		brand = 'valor6rb',
		price = 2677004,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'valor9rb',
		name = 'valor9rb',
		brand = 'valor9rb',
		price = 2454427,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'valorharley',
		name = 'valorharley',
		brand = 'valorharley',
		price = 1566327,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--600-DebadgedCars
		model = 'hycadesti',
		name = 'hycadesti',
		brand = 'hycadesti',
		price = 307344,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'subisti08',
		name = 'subisti08',
		brand = 'subisti08',
		price = 326169,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'model3',
		name = 'model3',
		brand = 'model3',
		price = 246712,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'models',
		name = 'models',
		brand = 'models',
		price = 209517,
		category = 'compacts',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'modelx',
		name = 'modelx',
		brand = 'modelx',
		price = 198000,
		category = 'compacts',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'teslapd',
		name = 'teslapd',
		brand = 'teslapd',
		price = 139413,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--600-DebadgedCars
		model = 'teslaroad',
		name = 'teslaroad',
		brand = 'teslaroad',
		price = 385571,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = '2019tundrac',
		name = '2019tundrac',
		brand = '2019tundrac',
		price = 400408,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'a80',
		name = 'a80',
		brand = 'a80',
		price = 337378,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'a80vygasaleem',
		name = 'a80vygasaleem',
		brand = 'a80vygasaleem',
		price = 236508,
		category = 'sports',
		type = 'automobile',
		shop = ''
	 },
	{--600-DebadgedCars
		model = 'a90sh',
		name = 'a90sh',
		brand = 'a90sh',
		price = 334414,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'amarok',
		name = 'amarok',
		brand = 'amarok',
		price = 334414,
		category = 'vans',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'crownbp',
		name = 'crownbp',
		brand = 'crownbp',
		price = 232641,
		category = 'sports',
		type = 'automobile',
		shop = 'reserved'
	 },
	{--600-DebadgedCars
		model = 'gfuckedsupra',
		name = 'gfuckedsupra',
		brand = 'gfuckedsupra',
		price = 287550,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	-- {--600-DebadgedCars
		-- model = 'GODzHYCADEMK4V2',
		-- name = 'GODzHYCADEMK4V2',
		-- brand = 'GODzHYCADEMK4V2',
		-- price = 264302,
		-- category = 'sports',
		-- type = 'automobile',
		-- shop = 'tuners'
	 -- },
	{--600-DebadgedCars
		model = 'gt86trust',
		name = 'gt86trust',
		brand = 'gt86trust',
		price = 377940,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'mk4hycade',
		name = 'mk4hycade',
		brand = 'mk4hycade',
		price = 361267,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'mkivsupra',
		name = 'mkivsupra',
		brand = 'mkivsupra',
		price = 329926,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'suprapandem',
		name = 'suprapandem',
		brand = 'suprapandem',
		price = 355096,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'variszupra',
		name = 'variszupra',
		brand = 'variszupra',
		price = 336660,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'brz13varis',
		name = 'brz13varis',
		brand = 'brz13varis',
		price = 309034,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'v60hr',
		name = 'v60hr',
		brand = 'v60hr',
		price = 323711,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'golf1',
		name = 'golf1',
		brand = 'golf1',
		price = 235229,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'golf7',
		name = 'golf7',
		brand = 'golf7',
		price = 403034,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'golf75r',
		name = 'golf75r',
		brand = 'golf75r',
		price = 353725,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'golf8gti',
		name = 'golf8gti',
		brand = 'golf8gti',
		price = 293844,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'golf91wideprzemo',
		name = 'golf91wideprzemo',
		brand = 'golf91wideprzemo',
		price = 345421,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'passat',
		name = 'passat',
		brand = 'passat',
		price = 338173,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'polo2018',
		name = 'polo2018',
		brand = 'polo2018',
		price = 265358,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'rmodmk7',
		name = 'rmodmk7',
		brand = 'rmodmk7',
		price = 382184,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--600-DebadgedCars
		model = 'wmfenyr',
		name = 'wmfenyr',
		brand = 'wmfenyr',
		price = 335476,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--DLVanillaEMS
		model = 'dlamb',
		name = 'dlamb',
		brand = 'dlamb',
		price = 2332804,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--DLVanillaEMS
		model = 'dlbuffalo',
		name = 'dlbuffalo',
		brand = 'dlbuffalo',
		price = 1990833,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--DLVanillaEMS
		model = 'dlemsb',
		name = 'dlemsb',
		brand = 'dlemsb',
		price = 2408882,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--DLVanillaEMS
		model = 'dlgranger',
		name = 'dlgranger',
		brand = 'dlgranger',
		price = 2280205,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--DLVanillaEMS
		model = 'dlissiamb',
		name = 'dlissiamb',
		brand = 'dlissiamb',
		price = 2168621,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--DLVanillaEMS
		model = 'dlswift',
		name = 'dlswift',
		brand = 'dlswift',
		price = 2168621,
		category = 'helicopters',
		type = 'heli',
		shop = 'emergency'
	 },
	{--DLVanillaEMS
		model = 'dlwheelchair',
		name = 'dlwheelchair',
		brand = 'dlwheelchair',
		price = 357516,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--DLVanillaEMS
		model = 'emsnspeedo',
		name = 'emsnspeedo',
		brand = 'emsnspeedo',
		price = 1563462,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--fastfurious
		model = 'fnflan',
		name = 'fnflan',
		brand = 'fnflan',
		price = 136855,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--fastfurious
		model = '2f2fmk4',
		name = '2f2fmk4',
		brand = '2f2fmk4',
		price = 280292,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--fastfurious
		model = 'ff4wrx',
		name = 'ff4wrx',
		brand = 'ff4wrx',
		price = 136836,
		category = 'compacts',
		type = 'automobile',
		shop = 'customs'
	 },
	{--fastfurious
		model = 'fnfmk4',
		name = 'fnfmk4',
		brand = 'fnfmk4',
		price = 290333,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--fastfurious
		model = '2f2fmle7',
		name = '2f2fmle7',
		brand = '2f2fmle7',
		price = 284870,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--fastfurious
		model = 'fnf4r34',
		name = 'fnf4r34',
		brand = 'fnf4r34',
		price = 241536,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--fastfurious
		model = '2f2fgtr34',
		name = '2f2fgtr34',
		brand = '2f2fgtr34',
		price = 298966,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--fastfurious
		model = 'fnfrx7',
		name = 'fnfrx7',
		brand = 'fnfrx7',
		price = 246067,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--fastfurious
		model = '2f2frx7',
		name = '2f2frx7',
		brand = '2f2frx7',
		price = 398277,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--fastfurious
		model = '2f2fs2000',
		name = '2f2fs2000',
		brand = '2f2fs2000',
		price = 174427,
		category = 'compacts',
		type = 'automobile',
		shop = ''
	 },
	{--fastfurious
		model = 'fnfjetta',
		name = 'fnfjetta',
		brand = 'fnfjetta',
		price = 152967,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--fastfurious
		model = 'fnfrx7dom',
		name = 'fnfrx7dom',
		brand = 'fnfrx7dom',
		price = 311571,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--fastfurious
		model = '350zdk',
		name = '350zdk',
		brand = '350zdk',
		price = 201215,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--fastfurious
		model = '350zm',
		name = '350zm',
		brand = '350zm',
		price = 219430,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--fastfurious
		model = 'hcej1',
		name = 'hcej1',
		brand = 'hcej1',
		price = 136036,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--fastfurious
		model = 'silvias15',
		name = 'silvias15',
		brand = 'silvias15',
		price = 176847,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--fastfurious
		model = 'acura2f2f',
		name = 'acura2f2f',
		brand = 'acura2f2f',
		price = 162472,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--Lotus_Bikes2
		model = '390b21',
		name = '390b21',
		brand = '390b21',
		price = 198777,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--Lotus_Bikes2
		model = '748',
		name = '748',
		brand = '748',
		price = 159084,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--Lotus_Bikes2
		model = '999',
		name = '999',
		brand = '999',
		price = 177711,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--Lotus_Bikes2
		model = 'bs17',
		name = 'bs17',
		brand = 'bs17',
		price = 157359,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--Lotus_Bikes2
		model = 'cbr1000rrr',
		name = 'cbr1000rrr',
		brand = 'cbr1000rrr',
		price = 141931,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--Lotus_Bikes2
		model = 'crfsm',
		name = 'crfsm',
		brand = 'crfsm',
		price = 191981,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--Lotus_Bikes2
		model = 'exc530',
		name = 'exc530',
		brand = 'exc530',
		price = 173708,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--Lotus_Bikes2
		model = 'exc530sm',
		name = 'exc530sm',
		brand = 'exc530sm',
		price = 208621,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	-- {--Lotus_Bikes2
		-- model = 'GODz13HDSG32FLOAT',
		-- name = 'GODz13HDSG32FLOAT',
		-- brand = 'GODz13HDSG32FLOAT',
		-- price = 211604,
		-- category = 'motorcycles',
		-- type = 'automobile',
		-- shop = 'rbikes'
	 -- },
	-- {--Lotus_Bikes2
		-- model = 'GODz13HDSGBAGGER',
		-- name = 'GODz13HDSGBAGGER',
		-- brand = 'GODz13HDSGBAGGER',
		-- price = 229527,
		-- category = 'motorcycles',
		-- type = 'automobile',
		-- shop = 'rbikes'
	 -- },
	-- {--Lotus_Bikes2
		-- model = 'godz13hdsgbaggerv2',
		-- name = 'godz13hdsgbaggerv2',
		-- brand = 'godz13hdsgbaggerv2',
		-- price = 152288,
		-- category = 'motorcycles',
		-- type = 'automobile',
		-- shop = 'rbikes'
	 -- },
	-- {--Lotus_Bikes2
		-- model = 'GODz17HDSGBAGGER',
		-- name = 'GODz17HDSGBAGGER',
		-- brand = 'GODz17HDSGBAGGER',
		-- price = 221315,
		-- category = 'motorcycles',
		-- type = 'automobile',
		-- shop = 'rbikes'
	 -- },
	-- {--Lotus_Bikes2
		-- model = 'GODz17HDSGBAGGERM',
		-- name = 'GODz17HDSGBAGGERM',
		-- brand = 'GODz17HDSGBAGGERM',
		-- price = 317648,
		-- category = 'sports',
		-- type = 'automobile',
		-- shop = 'tuners'
	 -- },
	-- {--Lotus_Bikes2
		-- model = 'GODz17HDSGBAGGERTRIKE',
		-- name = 'GODz17HDSGBAGGERTRIKE',
		-- brand = 'GODz17HDSGBAGGERTRIKE',
		-- price = 244773,
		-- category = 'motorcycles',
		-- type = 'automobile',
		-- shop = 'rbikes'
	 -- },
	-- {--Lotus_Bikes2
		-- model = 'GODzHDSGTRIKE',
		-- name = 'GODzHDSGTRIKE',
		-- brand = 'GODzHDSGTRIKE',
		-- price = 155953,
		-- category = 'motorcycles',
		-- type = 'automobile',
		-- shop = 'rbikes'
	 -- },
	{--Lotus_Bikes2
		model = 'Honda50Tuned',
		name = 'Honda50Tuned',
		brand = 'Honda50Tuned',
		price = 201838,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--Lotus_Bikes2
		model = 'Kart20',
		name = 'Kart20',
		brand = 'Kart20',
		price = 319053,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--Lotus_Bikes2
		model = 'Kart26',
		name = 'Kart26',
		brand = 'Kart26',
		price = 320759,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--Lotus_Bikes2
		model = 'Kart3',
		name = 'Kart3',
		brand = 'Kart3',
		price = 372549,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--Lotus_Bikes2
		model = 'Kart65',
		name = 'Kart65',
		brand = 'Kart65',
		price = 305919,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--Lotus_Bikes2
		model = 'Kart73',
		name = 'Kart73',
		brand = 'Kart73',
		price = 394533,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--Lotus_Bikes2
		model = 'KartPolice',
		name = 'KartPolice',
		brand = 'KartPolice',
		price = 442628,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--Lotus_Bikes2
		model = 'LCbanshee',
		name = 'LCbanshee',
		brand = 'LCbanshee',
		price = 273824,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--Lotus_Bikes2
		model = 'mxv450sm',
		name = 'mxv450sm',
		brand = 'mxv450sm',
		price = 136438,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--Lotus_Bikes2
		model = 'saltflat',
		name = 'saltflat',
		brand = 'saltflat',
		price = 150219,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--Lotus_Bikes2
		model = 'slingshot',
		name = 'slingshot',
		brand = 'slingshot',
		price = 297718,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--Lotus_Bikes2
		model = 'yz450',
		name = 'yz450',
		brand = 'yz450',
		price = 412808,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--Lotus_Bikes2
		model = 'yz450f',
		name = 'yz450f',
		brand = 'yz450f',
		price = 149660,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--Lotus_Bikes2
		model = 'yzf',
		name = 'yzf',
		brand = 'yzf',
		price = 141136,
		category = 'motorcycles',
		type = 'automobile',
		shop = 'rbikes'
	 },
	{--Lotus_Bikes2
		model = 'rrmaybach',
		name = 'rrmaybach',
		brand = 'rrmaybach',
		price = 172841,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = '00excursion',
		name = '00excursion',
		brand = '00excursion',
		price = 433076,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--[FloridaCars]
		model = '19ramdonk',
		name = '19ramdonk',
		brand = '19ramdonk',
		price = 281035,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--[FloridaCars]
		model = '530xd',
		name = '530xd',
		brand = '530xd',
		price = 200823,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = '70coronet',
		name = '70coronet',
		brand = '70coronet',
		price = 218712,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = '73big',
		name = '73big',
		brand = '73big',
		price = 240296,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = '73hard',
		name = '73hard',
		brand = '73hard',
		price = 253825,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = '77aero',
		name = '77aero',
		brand = '77aero',
		price = 325606,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = '77Monte',
		name = '77Monte',
		brand = '77Monte',
		price = 299755,
		category = 'muscle',
		type = 'automobile',
		shop = ''
	 },
	{--[FloridaCars]
		model = '96blacksanta',
		name = '96blacksanta',
		brand = '96blacksanta',
		price = 238631,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'a6',
		name = 'a6',
		brand = 'a6',
		price = 137230,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'artura22wb',
		name = 'artura22wb',
		brand = 'artura22wb',
		price = 401118,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'bigboyelco',
		name = 'bigboyelco',
		brand = 'bigboyelco',
		price = 323653,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'blue88',
		name = 'blue88',
		brand = 'blue88',
		price = 330079,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'bmwe92bb10',
		name = 'bmwe92bb10',
		brand = 'bmwe92bb10',
		price = 382464,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'boonbox',
		name = 'boonbox',
		brand = 'boonbox',
		price = 2193383,
		category = 'commercial',
		type = 'automobile',
		shop = 'commercial'
	 },
	{--[FloridaCars]
		model = 'brainshack1',
		name = 'brainshack1',
		brand = 'brainshack1',
		price = 268452,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'brainshack10',
		name = 'brainshack10',
		brand = 'brainshack10',
		price = 373555,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'brainshack11',
		name = 'brainshack11',
		brand = 'brainshack11',
		price = 373555,
		category = 'vans',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'brainshack12',
		name = 'brainshack12',
		brand = 'brainshack12',
		price = 170793,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'brainshack2',
		name = 'brainshack2',
		brand = 'brainshack2',
		price = 331635,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'brainshackbox',
		name = 'brainshackbox',
		brand = 'brainshackbox',
		price = 154447,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'brainshack500',
		name = 'brainshack500',
		brand = 'brainshack500',
		price = 436904,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--[FloridaCars]
		model = 'brainshackrs6',
		name = 'brainshackrs6',
		brand = 'brainshackrs6',
		price = 374643,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'bshack4',
		name = 'bshack4',
		brand = 'bshack4',
		price = 215020,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'bshack5',
		name = 'bshack5',
		brand = 'bshack5',
		price = 186819,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'bshack71',
		name = 'bshack71',
		brand = 'bshack71',
		price = 305027,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'bshack72big',
		name = 'bshack72big',
		brand = 'bshack72big',
		price = 138374,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'bshack72race',
		name = 'bshack72race',
		brand = 'bshack72race',
		price = 393377,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'bshack75drop',
		name = 'bshack75drop',
		brand = 'bshack75drop',
		price = 150100,
		category = 'coupes',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'bshack89',
		name = 'bshack89',
		brand = 'bshack89',
		price = 383617,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'bshackforgibox',
		name = 'bshackforgibox',
		brand = 'bshackforgibox',
		price = 198912,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'chevy4d71',
		name = 'chevy4d71',
		brand = 'chevy4d71',
		price = 375467,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'classic21',
		name = 'classic21',
		brand = 'classic21',
		price = 261746,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'denali18lift',
		name = 'denali18lift',
		brand = 'denali18lift',
		price = 404868,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'drecj32redeye',
		name = 'drecj32redeye',
		brand = 'drecj32redeye',
		price = 197489,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'elva',
		name = 'elva',
		brand = 'elva',
		price = 338271,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'fgbox',
		name = 'fgbox',
		brand = 'fgbox',
		price = 1736544,
		category = 'commercial',
		type = 'automobile',
		shop = 'commercial'
	 },
	{--[FloridaCars]
		model = 'fgbox2',
		name = 'fgbox2',
		brand = 'fgbox2',
		price = 2691855,
		category = 'commercial',
		type = 'automobile',
		shop = 'commercial'
	 },
	{--[FloridaCars]
		model = 'vanzrolls',
		name = 'vanzrolls',
		brand = 'vanzrolls',
		price = 212041,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'kevinh1',
		name = 'kevinh1',
		brand = 'kevinh1',
		price = 174888,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--[FloridaCars]
		model = 'kountry84',
		name = 'kountry84',
		brand = 'kountry84',
		price = 294570,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'ncbox',
		name = 'ncbox',
		brand = 'ncbox',
		price = 262902,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'ncvelle69',
		name = 'ncvelle69',
		brand = 'ncvelle69',
		price = 395974,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'ncweed',
		name = 'ncweed',
		brand = 'ncweed',
		price = 296778,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'bmxP2',
		name = 'bmxP2',
		brand = 'bmxP2',
		price = 4278,
		category = 'cycles',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--[FloridaCars]
		model = 'elhoe',
		name = 'elhoe',
		brand = 'elhoe',
		price = 1460061,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--[FloridaCars]
		model = 'elhoe2',
		name = 'elhoe2',
		brand = 'elhoe2',
		price = 1554304,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--[FloridaCars]
		model = 'elsub',
		name = 'elsub',
		brand = 'elsub',
		price = 1724161,
		category = 'emergency',
		type = 'automobile',
		shop = 'emergency'
	 },
	{--[FloridaCars]
		model = 'ro650',
		name = 'ro650',
		brand = 'ro650',
		price = 2271483,
		category = 'commercial',
		type = 'automobile',
		shop = 'commercial'
	 },
	{--[FloridaCars]
		model = 'ro90',
		name = 'ro90',
		brand = 'ro90',
		price = 388172,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'roexp10',
		name = 'roexp10',
		brand = 'roexp10',
		price = 231761,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'romay',
		name = 'romay',
		brand = 'romay',
		price = 1350350,
		category = 'commercial',
		type = 'automobile',
		shop = 'commercial'
	 },
	{--[FloridaCars]
		model = 'romt',
		name = 'romt',
		brand = 'romt',
		price = 245004,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'rotesla',
		name = 'rotesla',
		brand = 'rotesla',
		price = 1357551,
		category = 'commercial',
		type = 'automobile',
		shop = 'commercial'
	 },
	{--[FloridaCars]
		model = 'rovip',
		name = 'rovip',
		brand = 'rovip',
		price = 294505,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'rox6',
		name = 'rox6',
		brand = 'rox6',
		price = 281493,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'rozoe',
		name = 'rozoe',
		brand = 'rozoe',
		price = 388670,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'ruck72',
		name = 'ruck72',
		brand = 'ruck72',
		price = 384514,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'sharkcam',
		name = 'sharkcam',
		brand = 'sharkcam',
		price = 148553,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'sharkdurango',
		name = 'sharkdurango',
		brand = 'sharkdurango',
		price = 218667,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'sjbbox',
		name = 'sjbbox',
		brand = 'sjbbox',
		price = 367239,
		category = 'super',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'srtday20',
		name = 'srtday20',
		brand = 'srtday20',
		price = 269010,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'stardust',
		name = 'stardust',
		brand = 'stardust',
		price = 289709,
		category = 'sports',
		type = 'automobile',
		shop = 'tuners'
	 },
	{--[FloridaCars]
		model = 'demonwide',
		name = 'demonwide',
		brand = 'demonwide',
		price = 141181,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'escalade21',
		name = 'escalade21',
		brand = 'escalade21',
		price = 143266,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--[FloridaCars]
		model = '21Charscat',
		name = '21Charscat',
		brand = '21Charscat',
		price = 216459,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'tahoeLTZ',
		name = 'tahoeLTZ',
		brand = 'tahoeLTZ',
		price = 142880,
		category = 'suvs',
		type = 'automobile',
		shop = 'pdm'
	 },
	{--[FloridaCars]
		model = 'twin69',
		name = 'twin69',
		brand = 'twin69',
		price = 228795,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'unk75',
		name = 'unk75',
		brand = 'unk75',
		price = 297781,
		category = 'muscle',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'vanz454ss',
		name = 'vanz454ss',
		brand = 'vanz454ss',
		price = 149283,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'vanzcamaro',
		name = 'vanzcamaro',
		brand = 'vanzcamaro',
		price = 395675,
		category = 'muscle',
		type = 'automobile',
		shop = ''
	 },
	{--[FloridaCars]
		model = 'vanzcrowndonk',
		name = 'vanzcrowndonk',
		brand = 'vanzcrowndonk',
		price = 153912,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'vanzimpala',
		name = 'vanzimpala',
		brand = 'vanzimpala',
		price = 281790,
		category = 'offroad',
		type = 'automobile',
		shop = 'truck'
	 },
	{--[FloridaCars]
		model = 'vanzm3',
		name = 'vanzm3',
		brand = 'vanzm3',
		price = 153925,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'vanzmache',
		name = 'vanzmache',
		brand = 'vanzmache',
		price = 202492,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'vanzredeye',
		name = 'vanzredeye',
		brand = 'vanzredeye',
		price = 195975,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'vanzurus',
		name = 'vanzurus',
		brand = 'vanzurus',
		price = 189544,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--[FloridaCars]
		model = 'z71high',
		name = 'z71high',
		brand = 'z71high',
		price = 291710,
		category = 'offroad',
		type = 'automobile',
		shop = 'customs'
	 },
	{--
		model = 'mc45',
		name = 'mc45',
		brand = 'mc45',
		price = 324703,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--
		model = 'DBgonzo_altima24',
		name = 'DBgonzo_altima24',
		brand = 'DBgonzo_altima24',
		price = 321805,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--
		model = 'pnprgrix',
		name = 'pnprgrix',
		brand = 'pnprgrix',
		price = 232354,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--
		model = 'DBgonzo_sq8',
		name = 'DBgonzo_sq8',
		brand = 'DBgonzo_sq8',
		price = 246710,
		category = 'sedans',
		type = 'automobile',
		shop = 'customs'
	 },
	{--
		model = 'pbr8suki',
		name = 'pbr8suki',
		brand = 'pbr8suki',
		price = 201710,
		category = 'sports',
		type = 'automobile',
		shop = ''
	 },
	{--manishways
		model = '2018transam',
		name = '2018transam',
		brand = '2018transam',
		price = 291710,
		category = 'reserved',
		type = 'automobile',
		shop = 'none'
	 },
	 -- fire rescue vehicle pack
	 {--.\data\arrowpack
		model = 'arroweng',
		name = 'arroweng',
		brand = 'arroweng',
		price = 1310526,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\arrowpack
		model = 'arrowladder',
		name = 'arrowladder',
		brand = 'arrowladder',
		price = 1038957,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\arrowpack
		model = 'arrowrescue',
		name = 'arrowrescue',
		brand = 'arrowrescue',
		price = 1257788,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\brush
		model = 'brush',
		name = 'brush',
		brand = 'brush',
		price = 733516,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\brushram
		model = 'brushram',
		name = 'brushram',
		brand = 'brushram',
		price = 911657,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\dagor
		model = 'dagor',
		name = 'dagor',
		brand = 'dagor',
		price = 776290,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\ec145med
		model = 'ec145med',
		name = 'ec145med',
		brand = 'ec145med',
		price = 12533152,
		category = 'helicopters',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\enforcer
		model = 'ENFORCER',
		name = 'ENFORCER',
		brand = 'ENFORCER',
		price = 1002897,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\enforcerf
		model = 'enforcerf',
		name = 'enforcerf',
		brand = 'enforcerf',
		price = 903100,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\enforcerta
		model = 'enforcerta',
		name = 'enforcerta',
		brand = 'enforcerta',
		price = 1092553,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\enladder
		model = 'ENLADDER',
		name = 'ENLADDER',
		brand = 'ENLADDER',
		price = 1190707,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\flycarpack
		model = 'fpispov',
		name = 'fpispov',
		brand = 'fpispov',
		price = 1295797,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\flycarpack
		model = 'fpiupov',
		name = 'fpiupov',
		brand = 'fpiupov',
		price = 791552,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\flycarpack
		model = 'rampov',
		name = 'rampov',
		brand = 'rampov',
		price = 1033378,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\flycarpack
		model = 'squad1',
		name = 'squad1',
		brand = 'squad1',
		price = 1187559,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\flycarpack
		model = 'squad2',
		name = 'squad2',
		brand = 'squad2',
		price = 1276736,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\flycarpack
		model = 'tahoepov',
		name = 'tahoepov',
		brand = 'tahoepov',
		price = 1031200,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\fpack
		model = 'fdzod',
		name = 'fdzod',
		brand = 'fdzod',
		price = 905255,
		category = 'boats',
		type = 'automobile',
		shop = 'boats'
	 },
	{--.\data\fpack
		model = 'frescue',
		name = 'frescue',
		brand = 'frescue',
		price = 967352,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\fpack
		model = 'rambrush2',
		name = 'rambrush2',
		brand = 'rambrush2',
		price = 1299713,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\fpack
		model = 'rambrush3',
		name = 'rambrush3',
		brand = 'rambrush3',
		price = 790528,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\fpack
		model = 'rambrush4',
		name = 'rambrush4',
		brand = 'rambrush4',
		price = 1261699,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\fpack
		model = 'f550brush2',
		name = 'f550brush2',
		brand = 'f550brush2',
		price = 1044485,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\fpack
		model = 'f550brush',
		name = 'f550brush',
		brand = 'f550brush',
		price = 1114127,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\fpack
		model = 'f550squad',
		name = 'f550squad',
		brand = 'f550squad',
		price = 907462,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\fpack
		model = 'f550watersquad',
		name = 'f550watersquad',
		brand = 'f550watersquad',
		price = 1321753,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\fpack
		model = 'f550watersquad2',
		name = 'f550watersquad2',
		brand = 'f550watersquad2',
		price = 767389,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\fpack
		model = 'ramsquad',
		name = 'ramsquad',
		brand = 'ramsquad',
		price = 1112323,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\fpack
		model = 'ramsquad2',
		name = 'ramsquad2',
		brand = 'ramsquad2',
		price = 690160,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\fpack
		model = 'ramsquad3',
		name = 'ramsquad3',
		brand = 'ramsquad3',
		price = 951616,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\fpack
		model = 'ramsquad4',
		name = 'ramsquad4',
		brand = 'ramsquad4',
		price = 809481,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\fpack
		model = 'f550squad2',
		name = 'f550squad2',
		brand = 'f550squad2',
		price = 735698,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\fpack
		model = 'fwild',
		name = 'fwild',
		brand = 'fwild',
		price = 800440,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\fpack
		model = 'fpump',
		name = 'fpump',
		brand = 'fpump',
		price = 1070224,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\fpack
		model = 'ftank',
		name = 'ftank',
		brand = 'ftank',
		price = 1133766,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\fpack
		model = 'ramwatersquad',
		name = 'ramwatersquad',
		brand = 'ramwatersquad',
		price = 752503,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\fpack
		model = 'ramwatersquad2',
		name = 'ramwatersquad2',
		brand = 'ramwatersquad2',
		price = 787066,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\fpack
		model = 'ramwatersquad3',
		name = 'ramwatersquad3',
		brand = 'ramwatersquad3',
		price = 1343579,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\fpack
		model = 'ramwatersquad4',
		name = 'ramwatersquad4',
		brand = 'ramwatersquad4',
		price = 1001086,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\ladder66
		model = 'ladder66',
		name = 'ladder66',
		brand = 'ladder66',
		price = 1224107,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\pierce1
		model = 'pierce1',
		name = 'pierce1',
		brand = 'pierce1',
		price = 1171373,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\redneck-boats
		model = 'SMALLBOAT',
		name = 'SMALLBOAT',
		brand = 'SMALLBOAT',
		price = 994229,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\redneck-boats
		model = 'rescue1',
		name = 'rescue1',
		brand = 'rescue1',
		price = 1059356,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\safr-b412
		model = 'safr412',
		name = 'safr412',
		brand = 'safr412',
		price = 7978904,
		category = 'helicopters',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\squadtruckpack
		model = 'fordambo',
		name = 'fordambo',
		brand = 'fordambo',
		price = 921611,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },
	{--.\data\squadtruckpack
		model = 'f250pov',
		name = 'f250pov',
		brand = 'f250pov',
		price = 786041,
		category = 'emergency',
		type = 'automobile',
		shop = 'none'
	 },


}

for i = 1, #Vehicles do
    QBShared.Vehicles[Vehicles[i].model] = {
        spawncode = Vehicles[i].model,
        name = Vehicles[i].name,
        brand = Vehicles[i].brand,
        model = Vehicles[i].model,
        price = Vehicles[i].price,
        category = Vehicles[i].category,
        hash = joaat(Vehicles[i].model),
        type = Vehicles[i].type,
        shop = Vehicles[i].shop
    }
end
