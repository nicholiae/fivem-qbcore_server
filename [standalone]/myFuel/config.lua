Config = {}

Config.Locale = 'en'
Config.PrintVehicleNotNetworked = false

Config.useQB_Target = false
Config.useOX_Target = false
Config.NPCModel = "a_m_y_business_03" --only used if qb or ox_target

Config.MinFuelLevelForRefuelViaPump = 95
Config.MinFuelLevelForRefuelViaPetrolCan = 95
Config.NearestVehicleSearchMeters = 3.0

Config.BuyStuffDirectlyFromPlayer = false --buys fuel and updates for gas station direktly from user
Config.RemoveMoneyFromAccount = "bank" -- money or bank
Config.MinStockNoOwner = 0
Config.StockToSetIfLowerMin = 0
Config.ImportPriceFromAveragePercentage = 130; --X percent from AVG Price 
Config.CashbookAmountRows = 20

-- amount of money to pay when you get fuel from a mission (in percent)
Config.MissionPricePerLiter = 45

--if set to true you can add the society in config-vehicle.lua -> Vehicle.ModelsSociety
Config.UseSocietyMoney = false

--- Also enable this when your petrol can should be an item...regardless whether you use OX Inventory..for most custom inventories.
Config.OxInventory = { Enabled = false, Itemname = "WEAPON_PETROLCAN", isUseableItem = false, itemIsWeaponInInventory = false}

Config.SellPetrolStationMultiplier = 0.5 -- buy price * X = sell price for the petrol station
Config.AllowPetrolCans = false --set to false if you dont want petrol cans at all
Config.QuestionCanCarryItem = true

Config.HotkeytoActions = 51
Config.HotkeytoActionsName =  "~INPUT_PICKUP~"

Config.HotkeytoFillUpByPetrolCan = 18
Config.HotkeytoFillUpByPetrolCanName = "~INPUT_SKIP_CUTSCENE~"


Config.MissionVehicle = "hauler"


Config.PetrolCanPrice = 500
Config.PetrolCanRemoveLiters = 5

Config.MaxAmountGasStationsPerPlayer = 3

--default logo name... config in database for specific gas station myfuel_gas_stations
Config.LogoName = "xero"

--prevent the fivem bug that cars drive backwards when fuel level < 5%
--if not wanted set this to 0.
Config.ShuttingDownEngineAtFuelLevel = 0

-- if this config is set to true you first have to attach the fuel nozzle! If false filling-up menu appears directly
Config.UseFuelNozzle = true

--allow players to move x meters from fuelpump with nozzle in hand
Config.NozzleMaxDistanceInHand = 10.0

--set here the interval for 1 liter (f.e. 1 liter per 500 ms or 1 Liter per 250ms) 
-- increase or decreate the fueling time...
-- all inputs must be milliseconds
Config.FuelRefillInterval = 500


Config.GasStationBlip = {
	Scale = 0.8, --change the size for your gas station blips..
	Color = 4, --set color for gas station blips (for colors see https://docs.fivem.net/docs/game-references/hud-colors/)
	ColorSold = 10, --set color for gas station blips who has owner (for colors see https://docs.fivem.net/docs/game-references/hud-colors/)
	ColorMine = 15, --set color for gas station blips who has owner (for colors see https://docs.fivem.net/docs/game-references/hud-colors/)
	Sprite = 361, --set the sprite for gas station blips (for sprites see https://docs.fivem.net/docs/game-references/blips/)
	Name = "Gas Station", -- set name of blip (shown in map )
	NameSold = "Gas Station (Sold)", -- set name of blip (shown in map )
	NameMine = "Gas Station (Mine)", -- set name of blip (shown in map )
	Group = 120
}

Config.WarehouseLevels = {
	{capacity = 1500, upgradePrice = 0}, --this is the default level (therefor there is no price!)
	{capacity = 3000, upgradePrice = 750000},
	{capacity = 6000, upgradePrice = 1250000},
	{capacity = 12000, upgradePrice = 2500000},
	{capacity = 24000, upgradePrice = 5000000},
	{capacity = 48000, upgradePrice = 10000000}
}


Config.FillingUpJobs = {
	Enabled = false
	,JobList = { 
		--here jobs that are allowed to fill up not owned gas_stations!
		--add your jobs here example "unempleyed", "myJob2345"		
		
	}
	--[[ 
		here items for the allowed jobs for filling gas station up
		fuel_types: * (fills up all), diesel, gasoline...	
	--]]
	,ItemList = { 
		--{item = "oil" , label = "Oil", fillupAmountPerItem = 50, paymentForFillup = 50, fuel_to_fillup = "*", Waittime = 2000}, just an example!
	}
}


Config.FuelTypes = {
	["gasoline"] = {
		allowImport = true
		, defaultSalesPriceMin = 5.00 
		, defaultSalesPriceMax = 9.00
		, allowMission = true
		, allowFillUpByItem = false
		, fillupItems = { --max 3 items are supported 
			--{item = "oil" , label = "Oil", fillupAmountPerItem = 50},
		}
	}
	,["diesel"] = {
		allowImport = true
		, defaultSalesPriceMin = 4.00 
		, defaultSalesPriceMax = 8.00
		, allowMission = true
		, allowFillUpByItem = false
		, fillupItems = { --max 3 items are supported
			--{item = "oil" , label = "Oil", fillupAmountPerItem = 50},
		}
	}
	,["paraffin"] = {
		allowImport = true
		, defaultSalesPriceMin = 12.50 
		, defaultSalesPriceMax = 16.25
		, allowMission = true
		, allowFillUpByItem = false
		, fillupItems = { --max 3 items are supported
			--{item = "oil" , label = "Oil", fillupAmountPerItem = 50},
		}
	}
	,["electricity"] = {
		allowImport = true
		, defaultSalesPriceMin = 0.25 
		, defaultSalesPriceMax = 3.25
		, allowMission = true
		, allowFillUpByItem = false
		, fillupItems = { --max 3 items are supported
			--{item = "battery" , label = "Batterypack", fillupAmountPerItem = 50},
		}
	}
}



-- Places at the oil fields where the tanker trailer could spawn
Config.MissionLocations = {
	{1683.7000732422,-1545.9649658203,112.69757080078,72.69429779052734},
	{1735.0178222656,-1559.9553222656,112.65517425537,267.4895629882813},
	{1738.7967529297,-1536.458984375,112.6710357666,250.71902465820312},
	{1586.7941894531,-1726.4708251953,87.992599487305,160.98040771484375},
	{1485.73828125,-1956.2260742188,70.741729736328,272.0686950683594},
	{1539.5606689453,-2092.8427734375,77.090377807617,2.03402185440063},
	{1538.9689941406,-2171.5095214844,77.437973022461,173.4105224609375},
	{1386.4505615234,-2062.033203125,51.998519897461,34.9443473815918},
	{1360.4348144531,-2077.3386230469,51.998519897461,311.1263122558594},

}

-- Fuel decor - No need to change this, just leave it.
Config.FuelVariable = "_FUEL_LEVEL"

-- Want to use the HUD? Turn this to true. (just good for testing)
Config.EnableHUD = false

Config.EnableUIHUD = false
Config.ShowSpeed = false
Config.ShowFuelLevel = false
Config.SpeedUnit = "mph"
Config.ShowFuelInPercentage = false
Config.HudLocation = {
	vertical = "right" --left, middle, right
	,horizontal = "bottom" --bottom top middle
}

--move object in %
Config.HUDextraMargins = {
	top = 0 
	,left = 0 
	,bottom = 0
	,right = 0 
}
Config.HUDFuelCritical = 15 --percentage
Config.HUDFuelWarning = 30
Config.HUDRemoveBackground = false
	

-- Configure blips here. Turn both to false to disable blips all together.
Config.ShowGasStationsOnMap = true
Config.ShowNearestGasStationOnly = false
Config.MarkerDrawDistance = 30
Config.MarkerActiveDistance = 1


Config.PumpModels = {
	[-2007231801] = true, --xero gas pump
	[1339433404] = true, --ron
	[1694452750] = true,--globe_oil
	[1933174915] = true, --ltd
	[-462817101] = true,--globe_oil vintage
	[-469694731] = true,--xero vintage
	[-164877493] = true, --ltd vintage
	[-46303329]  = true --gas tank
}

Config.CustomPumpLocations = {
	{model = -462817101, location={-1604.4313 ,5256.9824 ,2.0755 ,198.0}}, --boat location..
	{model = -462817101, location={3851.252 ,4458.5635 ,1.8498 ,90.0}}, --boat location..
	{model = -46303329, location={-901.12, -3038.86, 13.41, 59.74}}, --boat location..
	{model = -462817101, location={-800.86, -1513.12, 1.6, 115.44}}, --boat location..
}

-- The left part is at percentage RPM, and the right is how much fuel (divided by 10) you want to remove from the tank every second
Config.FuelUsage = {
	[1.0] = 1.8,
	[0.9] = 1.6,
	[0.8] = 1.4,
	[0.7] = 1.2,
	[0.6] = 1.0,
	[0.5] = 0.8,
	[0.4] = 0.6,
	[0.3] = 0.4,
	[0.2] = 0.3,
	[0.1] = 0.2,
	[0.0] = 0.1,
}



Config.notifications = {
	DefaultFiveM = true,
	BtwLouis = false,
	Custom = false
}

Config.Marker = {
    colour      = {r = 221, g = 121, b = 7, a = 100},
    radius      = 2.0,
}

-- find more at https://wiki.gtanet.work/index.php?title=Notification_Pictures
Config.NotificationPicturePay = 'CHAR_MP_MEX_DOCKS'

Translations = {
	["de"] = {
		["notification_fuelpump_fill_car"] = "Drücke " .. Config.HotkeytoActionsName .. " um zu ~y~Tanken."
		,["notification_fuelpump_nozzle_put_back"] = "Drücke " .. Config.HotkeytoActionsName .. " um ~y~abzubrechen."
		,["notification_fuelpump_nozzle_put_in_vehicle"] = "Drücke " .. Config.HotkeytoActionsName .. " das Fahrzeug zu ~y~Tanken."
		,["notification_interact_with_gas_station"] = "Drücke " .. Config.HotkeytoActionsName .. " um mit der Tankstelle zu interagieren"
		,["notification_moved_to_far_away"] = "Du hast dich zu weit entfernt!"
		,["notification_too_less_money"] = "~r~Du hast zu wenig Geld!"
		,["notification_not_for_sell"] = "Diese Tankstelle steht aktuell nicht zum Verkauf!"
		,["sold_For"] = "Tankstelle verkauft. Deinem Konto wurde hinzugefüht: ~g~$"
		,["fuel_title"] = "Tankstelle"
		,["fuel_pay"] =  " ~s~getankt\nPreis pro l:~o~ "
		,["fuel_pay_2"] = "$\n~s~Gesamt: ~y~"
		,["notification_fueled_by_can"] = "~g~Das Fahrzeug wurde betankt..."
		,["notification_fill_by_can"] = "Drücke " .. Config.HotkeytoFillUpByPetrolCanName .. ", um das Fahrzeug zu tanken"
		,["notification_buy_can"] = "Drücke " .. Config.HotkeytoActionsName .. ", um einen Kanister zu kaufen"
		,["notification_no_can"] = "Du hast keinen Kanister."
		,["notification_too_many_gasstations"] = '~r~Du kannst nicht mehr Tankstellen besitzen!'
		,["tanker"] = "Treibstoff Anhänger"
		,["notification_mission_complete"] = "~g~Die Mission wurde erfolgreich beendet. Das Lager mit ~w~"
		,["notification_mission_complete2"] = " ~g~ist nun wieder voll!"
		,["notification_mission_no_tanker"] = "~r~Der Anhänger wurde nicht erkannt. Fahre näher an die markierte Position!"
		,["mission_murrieta"] = "Murrieta Oil Fields"
		,["mission_subtitle"] = "Tankstellenmission"
		,["mission_start"] = "Hänge den ~y~Anhänger ~s~nun an und bring den Treibstoff ~y~zurück zur Tankstelle~s~!"
		,["mission_info_attach"] = "Drücke ~INPUT_PICKUP~, um den Anhänger abzuhängen"
		,["mission_info_end"] = "Drücke ~INPUT_PICKUP~, um die Mission zu beenden"
		,["mission_already_started"] = "~r~Die Mission wurde bereits gestartet!"
		,["mission_begin"] = "Ein ~y~Anhänger ~s~mit Treibstoff steht an der ~y~markierten Position ~s~zur Abholung bereit!"
		,["mission_blocked"] = "~r~Der Ausparkpunkt ist versperrt!"
		,["not_enough_items"] = "Zu wenig Items!"
		,["gas_station_filled_up"] = "Tankstelle wurden hinzugefügt:"
		,["gas_station_filled_up_2"] = "Liter.~n~Du erhälst ~g~$"
		,["gas_station_filled_up_2_electric"] = "Kilowatt.~n~Du erhälst ~g~$"
		,["gas_station_cannot_fillup"] = "Die Tankstelle kann nicht weiter aufgefüllt werden!"
		,["gas_station_cannot_fillup_owner"] = "Diese Tankstelle hat einen Besitzer!~n~Du kannst hier nicht auffüllen!"
		,["gasoline_unit_short"] = "L"
		,["diesel_unit_short"] = "L"
		,["paraffin_unit_short"] = "L"
		,["electricity_unit_short"] = "KW"
		,["gasoline"] = "Benzin"
		,["diesel"] = "Diesel"
		,["paraffin"] = "Kerosin"
		,["electricity"] = "Strom"
		,["paid_for_mission"] = 'Für die Lieferung wurde bezahlt: ~r~$'
		,["target_fill_vehicle"] = "Fahrzeug Tanken"
		,["target_fill_vehicle_petrolcan"] = "Fahrzeug befüllen"
		,["target_fuelpump_nozzle_put_back"] = "Tanken abbrechen"
		,["target_buy_jerry_can"] = "Kanister kaufen ($" .. Config.PetrolCanPrice .. ")"
		,["target_owner_menu"] = "Mit Tankstelle interagieren"
		,["no_car_nearby"] = "Es ist kein Fahrzeug in der Nähe."
		,["cannot_carry_item"] = "Du kannst nichts mehr Tragen."
	}
	,["en"] = {
		["notification_fuelpump_fill_car"] = "Press " .. Config.HotkeytoActionsName .. " to ~y~fuel"
		,["notification_fuelpump_nozzle_put_back"] = "Press " .. Config.HotkeytoActionsName .. " to put nozzle ~y~back."
		,["notification_fuelpump_nozzle_put_in_vehicle"] = "Press " .. Config.HotkeytoActionsName .. " to ~y~attach."
		,["notification_interact_with_gas_station"] = "Press " .. Config.HotkeytoActionsName .. " to interact with the petrol station"
		,["notification_moved_to_far_away"] = "You have moved too far away!"
		,["notification_too_less_money"] = "~r~You don't have enough money!"
		,["notification_not_for_sell"] = "This petrol station is currently not for sale!"
		,["sold_For"] = "Petrol station sold. Added to your account: ~g~$"
		,["fuel_title"] = "Petrol Station"
		,["fuel_pay"] =  " ~s~fueled\nPrice per l:~o~ "
		,["fuel_pay_2"] = "$\n~s~Total: ~y~"
		,["notification_fueled_by_can"] = "~g~The vehicle was fueled..."
		,["notification_fill_by_can"] = "Press ".. Config.HotkeytoFillUpByPetrolCanName ..", to fuel the vehicle"
		,["notification_buy_can"] = "Press " .. Config.HotkeytoActionsName .. ", to buy a petrol can"
		,["notification_no_can"] = "You don't have a petrol can!"
		,["notification_too_many_gasstations"] = '~r~You can not own more gas stations!'
		,["tanker"] = "Tanker"
		,["notification_mission_complete"] = "~g~The mission was completed. Your storage of ~w~"
		,["notification_mission_complete2"] = " ~g~is now full!"
		,["notification_mission_no_tanker"] = "~r~The tanker was not found. Bring the trailer closer!"
		,["mission_murrieta"] = "Murrieta Oil Fields"
		,["mission_subtitle"] = "Fuel mission"
		,["mission_start"] = "Attach the ~y~trailer ~s~now and bring the fuel ~y~back to the gas station~s~!"
		,["mission_info_attach"] = "Press ~INPUT_PICKUP~, to detach the trailer"
		,["mission_info_end"] = "Press ~INPUT_PICKUP~, to abort the mission"
		,["mission_already_started"] = "~r~The mission was already started!"
		,["mission_begin"] = "A ~y~trailer ~s~with fuel is now ready for pickup at the ~y~marked position~s~!"
		,["mission_blocked"] = "~r~The spawn point is blocked!"
		,["not_enough_items"] = "Too few items!"
		,["gas_station_filled_up"] = "petrol station were added:"
		,["gas_station_filled_up_2"] = "Litre.~n~You get ~g~$"
		,["gas_station_filled_up_2_electric"] = "Kilowatt.~n~You get ~g~$"
		,["gas_station_cannot_fillup"] = "The filling station cannot be refilled any further!"
		,["gas_station_cannot_fillup_owner"] = "This petrol station has an owner!~n~You can't fill up here!"
		,["gasoline_unit_short"] = "L"
		,["diesel_unit_short"] = "L"
		,["paraffin_unit_short"] = "L"
		,["electricity_unit_short"] = "KW"
		,["gasoline"] = "Gasoline"
		,["diesel"] = "Diesel"
		,["paraffin"] = "Paraffin"
		,["electricity"] = "Electricity"
		,["paid_for_mission"] = 'For the fuel was paid: ~r~$'
		,["target_fill_vehicle"] = "Refuel vehicle"
		,["target_fill_vehicle_petrolcan"] = "Fill vehicle"
		,["target_fuelpump_nozzle_put_back"] = "Cancel refueling"
		,["target_buy_jerry_can"] = "Buy petrol can ($" .. Config.PetrolCanPrice .. ")"
		,["target_owner_menu"] = "interact with the petrol station"
		,["no_car_nearby"] = "There is no vehicle nearby."
		,["cannot_carry_item"] = "You can no longer carry anything."

	}
	,["fr"] = {
		["notification_fuelpump_fill_car"] = "Appuyez sur " .. Config.HotkeytoActionsName .. " pour ~y~fuel"
		,["notification_fuelpump_nozzle_put_back"] = "Appuyez sur " .. Config.HotkeytoActionsName .. " pour remettre la buse en place."
		,["notification_fuelpump_nozzle_put_in_vehicle"] = "Appuyez sur " .. Config.HotkeytoActionsName .. " pour ~y~attacher."
		,["notification_interact_with_gas_station"] = "Appuyez sur " .. Config.HotkeytoActionsName .. " pour interagir avec la station d'essence."
		,["notification_moved_to_far_away"] = "Vous avez déménagé trop loin!"
		,["notification_too_less_money"] = "~r~Tu n'as pas assez d'argent!"
		,["notification_not_for_sell"] = "Cette station d'essence n'est actuellement pas à vendre!"
		,["sold_For"] = "Station d'essence vendue. Ajouté à votre compte : ~g~$"
		,["fuel_title"] = "Station d'essence"
		,["fuel_pay"] =  " ~s~fuelled\nPrix par l:~o~ "
		,["fuel_pay_2"] = "$\n~s~Total: ~y~"
		,["notification_fueled_by_can"] = "~g~Le véhicule a été alimenté en carburant..."
		,["notification_fill_by_can"] = "Appuyez sur ~INPUT_SKIP_CUTSCENE~, pour faire le plein du véhicule."
		,["notification_buy_can"] = "Appuyez sur " .. Config.HotkeytoActionsName .. ", pour acheter un bidon d'essence."
		,["notification_no_can"] = "Vous n'avez pas de bidon d'essence!"
		,["notification_too_many_gasstations"] = "~r~Vous ne pouvez pas posséder plus de stations d'essence!"
		,["tanker"] = "Tanker"
		,["notification_mission_complete"] = "~g~La mission est terminée. Votre stockage de~w~"
		,["notification_mission_complete2"] = " ~g~est maintenant complet!"
		,["notification_mission_no_tanker"] = "~r~Le Tanker n'a pas été trouvé. Rapprochez la remorque !"
		,["mission_murrieta"] = "Murrieta Oil Fields"
		,["mission_subtitle"] = "Mission carburant"
		,["mission_start"] = "Attachez la remorque maintenant et ramenez l'essence à la station d'essence~s~!"
		,["mission_info_attach"] = "Appuyez sur ~INPUT_PICKUP~, pour détacher la remorque."
		,["mission_info_end"] = "Appuyez sur ~INPUT_PICKUP~, pour abandonner la mission."
		,["mission_already_started"] = "~r~La mission a déjà commencé!"
		,["mission_begin"] = "Un ~y~semi-remorque ~s~avec du carburant est maintenant prêt à être ramassé à la ~y~position indiquée~s~!"
		,["mission_blocked"] = "~r~Le point d'ancrage est bloqué!"
		,["not_enough_items"] = "Trop peu d'objets!"		
		,["gas_station_filled_up"] = "station d'essence ont été ajoutés :"
		,["gas_station_filled_up_2"] = "Litre.~n~Vous obtenez ~g~$"
		,["gas_station_filled_up_2_electric"] = "Kilowatt. ~n~Vous obtenez ~g~$"
		,["gas_station_cannot_fillup"] = "La station-service ne peut plus être remplie!"
		,["gas_station_cannot_fillup_owner"] = "Cette station d'essence a un propriétaire!~n~Tu ne peux pas faire le plein ici !"
		,["gasoline_unit_short"] = "L"
		,["diesel_unit_short"] = "L"
		,["paraffin_unit_short"] = "L"
		,["electricity_unit_short"] = "KW"
		,["gasoline"] = "Essence"
        ,["diesel"] = "Diesel"
        ,["paraffin"] = "Paraffine"
        ,["electricity"] = "Électricité"
		,["paid_for_mission"] = 'For the fuel was paid: ~r~$'
		,["target_fill_vehicle"] = "Faire le plein du véhicule"
		,["target_fill_vehicle_petrolcan"] = "Remplir le véhicule"
		,["target_fuelpump_nozzle_put_back"] = "Annuler le ravitaillement"
		,["target_buy_jerry_can"] = "Acheter un bidon d'essence ($" .. Config.PetrolCanPrice .. ")"
		,["target_owner_menu"] = "interagir avec la station-service"
		,["no_car_nearby"] = "Il n'y a pas de véhicule à proximité."
		,["cannot_carry_item"] = "Vous ne pouvez plus rien porter."
	}
}


UI_Translations = {
	["de"] = {
		["fuel_type"] = "Kraftstoff"
		,["fill_up_vehicle"] = "Fahrzeug tanken"
		,["fill_up_to_price"] = "Bis Preis X tanken"
		,["btn_fill_up_to_price"] = "Bis Preis tanken"
		,["btn_fill_up_to_max"] = "Volltanken"
		,["stop_filling"] = "Tanken beenden"
		,["close"] = "Abbrechen"
		,["gasoline"] = "Benzin"
		,["diesel"] = "Diesel"
		,["paraffin"] = "Kerosin"
		,["electricity"] = "Strom"
		,["gasoline_unit"] = "Liter"
		,["diesel_unit"] = "Liter"
		,["paraffin_unit"] = "Liter"
		,["electricity_unit"] = "Kilowatt"
		,["in_stock"] = "im Lager"
		,["out_of_stock"] = "Ausverkauft"
		,["capacity"] = "Kapazität"
		,["level"] = "Level"
		,["warehouse"] = "Lager"
		,["upgrade"] = "Upgrade"
		,["upgrades"] = "Upgrades"
		,["overview"] = "&Uuml;bersicht"
		,["balance"] = "Bilanz"
		,["income"] = "Einnahmen"
		,["expenses"] = "Ausgaben"
		,["checkout"] = "Kasse"
		,["cashbook"] = "Kassenbuch"
		,["currentprice"] = "Aktueller Preis"
		,["newprice"] = "Neuer Preis"
		,["save"] = "Speichern"
		,["amount_import"] = "Importmenge"
		,["price"] = "Preis"
		,["doorder"] = "Kaufen"
		,["deposit"] = "Einzahlen"
		,["payout"] = "Auszahlen"
		,["checkout_amount"] = "Betrag"
		,["amount"] = "Menge"
		,["petrolcan"] = "Kanister"
		,["type"] = "Art"
		,["detail"] = "Details"
		,["competitor_min_price"] = "Min. Konkurrenz"
		,["competitor_max_price"] = "Max. Konkurrenz"
		,["competitor_avarage_price"] = "Durchschnitt Konkurrenz"
		,["note"] = "Hinweis"
		,["only_x_records"] = "Es werden maximal @@amountrecords@@ Zeilen angezeigt."
		,["fueloverview_do_mission"] = "Tankstelle auffüllen (Selbstabholung)"
		,["headlne_adminview"] = "Meine Tankstelle"
		,["ownerview_levelup"] = "Upgrade"
		,["ownerview_save"] = "Speichern.."
		,["buyview_headline"] = "Bist du dir sicher?"
		,["sale_view_infotext"] = "Willst du diese Tankstelle wirklich verkaufen?<br>Du erhälst einen Teil des Kaufpreis verrechnet mit dem Kassenbestand."
		,["buyview_text_line01"] = "Willst du diese Tankstelle wirklich kaufen?"
		,["buyview_text_line02"] = "Preis: $"
		,["buyview_buy"] = "Kaufen"
		,["buyview_cancel"] = "Abbrechen"
		,["sale_view_headline"] = "Verkaufen"
		,["sale_view_cancel"] = "Abbrechen"
		,["sale_view_sell"] = "Verkaufen"
		,["bank_money"] = "Bankkarte"
		,["cash_money"] = "Bar"	
		,["no_fuel_view_infotext"] = "Leider bieten wir diesen Kraftstoff nicht an."	
		,["not_enought_money"] = "Du hast zu wenig Geld!"	
		,["kmh"] = "KM/h"
		,["mph"] = "mp/h"
		,["use_item"] = "Items benutzen"
		,["cancel"] = "Abbrechen"
		,["society_pays"] = "Arbeitgeber zahlt"
		,["Mission"] = "Mission"
	}
	,["en"] = {
		["fuel_type"] = "Fuel"
		,["fill_up_vehicle"] = "Refuel vehicle"
		,["fill_up_to_price"] = "Fill up to price X"
		,["btn_fill_up_to_price"] = "Fill up to price"
		,["btn_fill_up_to_max"] = "Fill up the tank"
		,["stop_filling"] = "End refuelling"
		,["close"] = "Cancel"
		,["gasoline"] = "Gasoline"
		,["diesel"] = "Diesel"
		,["paraffin"] = "Paraffin"
		,["electricity"] = "Electricity"
		,["gasoline_unit"] = "Litres"
		,["diesel_unit"] = "Litres"
		,["paraffin_unit"] = "Litres"
		,["electricity_unit"] = "Kilowatts"
		,["in_stock"] = "In stock"
		,["out_of_stock"] = "Sold out"
		,["capacity"] = "Capacity"
		,["level"] = "Level"
		,["warehouse"] = "Warehouse"
		,["upgrade"] = "Upgrade"
		,["upgrades"] = "Upgrades"
		,["overview"] = "Overview"
		,["balance"] = "Balance"
		,["income"] = "Income"
		,["expenses"] = "Expenses"
		,["checkout"] = "Checkout"
		,["cashbook"] = "Cashbook"
		,["currentprice"] = "Current price"
		,["newprice"] = "New price"
		,["save"] = "Save"
		,["amount_import"] = "Import quantity"
		,["price"] = "Price"
		,["doorder"] = "Buy"
		,["deposit"] = "Deposit"
		,["payout"] = "Pay out"
		,["checkout_amount"] = "Amount"
		,["amount"] = "Quantity"
		,["petrolcan"] = "Jerrycan"
		,["type"] = "Type"
		,["detail"] = "Details"
		,["competitor_min_price"] = "Min. competitors"
		,["competitor_max_price"] = "Max. competitors"
		,["competitor_avarage_price"] = "Average competitors"
		,["note"] = "Note"
		,["only_x_records"] = "A maximum of @@amountrecords@@ lines are displayed."
		,["fueloverview_do_mission"] = "Fill up petrol station (self collection)"
		,["headlne_adminview"] = "My Petrol Station"
		,["ownerview_levelup"] = "Upgrade"
		,["ownerview_save"] = "Save.."
		,["buyview_headline"] = "Are you sure?"
		,["sale_view_infotext"] = "Do you really want to sell this petrol station?<br>You will receive the partly purchase price offset against the cash in hand."
		,["buyview_text_line01"] = "Do you really want to buy this petrol station?"
		,["buyview_text_line02"] = "Price: $"
		,["buyview_buy"] = "Buy"
		,["buyview_cancel"] = "Cancel"
		,["sale_view_headline"] = "Sell"
		,["sale_view_cancel"] = "Cancel"
		,["sale_view_sell"] = "Sell"
		,["bank_money"] = "Bankcard"
		,["cash_money"] = "Cash"	
		,["no_fuel_view_infotext"] = "Unfortunately, we do not offer this fuel."
		,["kmh"] = "km/h"
		,["mph"] = "mp/h"
		,["not_enought_money"] = "You have too little money!"			
		,["use_item"] = "Use item"
		,["cancel"] = "Cancel"
		,["society_pays"] = "Society pays"
		,["Mission"] = "Mission"
	},
	["fr"] = {
        ["fuel_type"] = "Carburant"
        ,["fill_up_vehicle"] = "Faire le plein du véhicule"
        ,["fill_up_to_price"] = "Remplir jusqu'au prix X"
        ,["btn_fill_up_to_price"] = "Remplir jusqu'au prix"
        ,["btn_fill_up_to_max"] = "Remplir le réservoir"
        ,["stop_filling"] = "Fin du ravitaillement"
        ,["close"] = "Annuler"
        ,["gasoline"] = "Essence"
        ,["diesel"] = "Diesel"
        ,["paraffin"] = "Paraffine"
        ,["electricity"] = "Électricité"
        ,["gasoline_unit"] = "Litres"
        ,["diesel_unit"] = "Litres"
        ,["paraffin_unit"] = "Litres"
        ,["electricity_unit"] = "Kilowatts"
        ,["in_stock"] = "En stock"
        ,["out_of_stock"] = "Stock épuisé"
        ,["capacity"] = "Capacité"
        ,["level"] = "Niveau"
        ,["warehouse"] = "Entrepôt"
        ,["upgrade"] = "Améliorer"
        ,["upgrades"] = "Améliorer"
        ,["overview"] = "Aperçu"
        ,["balance"] = "Solde"
        ,["income"] = "Revenu"
        ,["expenses"] = "Dépenses"
        ,["checkout"] = "Coffre"
        ,["cashbook"] = "Livre de caisse"
        ,["currentprice"] = "Prix ​​actuel"
        ,["newprice"] = "Nouveau prix"
        ,["save"] = "Sauvegarder"
        ,["amount_import"] = "Quantité d'importation"
        ,["price"] = "Prix"
        ,["doorder"] = "Acheter"
        ,["deposit"] = "Deposer"
        ,["payout"] = "Retirer"
        ,["checkout_amount"] = "Montant"
        ,["amount"] = "Quantité"
        ,["petrolcan"] = "Jerrycan"
        ,["type"] = "Type"
        ,["detail"] = "Détails"
        ,["competitor_min_price"] = "Min. concurrents"
        ,["competitor_max_price"] = "Max. concurrents"
        ,["competitor_avarage_price"] = "Concurrents moyens"
        ,["note"] = "Note"
        ,["only_x_records"] = "Un maximum de @@amountrecords@@ lignes sont affichées."
        ,["fueloverview_do_mission"] = "Faire le plein de la station-service (auto-collecte)"
        ,["headlne_adminview"] = "Ma station essence"
        ,["ownerview_levelup"] = "Améliorer"
        ,["ownerview_save"] = "Sauvegarde.."
        ,["buyview_headline"] = "Êtes-vous sûr?"
        ,["sale_view_infotext"] = "Voulez-vous vraiment vendre cette station-service ?<br>Vous recevrez le prix d'achat en partie compensé par l'argent en caisse."
        ,["buyview_text_line01"] = "Voulez-vous vraiment acheter cette station-service ?"
        ,["buyview_text_line02"] = "Prix: $"
        ,["buyview_buy"] = "Acheter"
        ,["buyview_cancel"] = "Annuler"
        ,["sale_view_headline"] = "Vendre"
        ,["sale_view_cancel"] = "Annuler"
        ,["sale_view_sell"] = "Vendre"
        ,["bank_money"] = "Carte bancaire"
        ,["cash_money"] = "Cash"    
        ,["no_fuel_view_infotext"] = "Malheureusement, nous ne proposons pas ce carburant."
        ,["kmh"] = "km/h"
        ,["mph"] = "mp/h"
		,["not_enought_money"] = "Tu n'as pas assez d'argent!"	
		,["use_item"] = "Utiliser l'objet"
		,["cancel"] = "Annuler"	
		,["society_pays"] = "Employeur paie"
		,["Mission"] = "Mission"
    }

}