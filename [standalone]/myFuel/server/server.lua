QBCore = nil
ESX = nil 

while ESX == nil and QBCore == nil do
	if GetResourceState('es_extended') == 'started' then
		ESX = exports["es_extended"]:getSharedObject()
	elseif GetResourceState('qb-core') == 'started' then 
		QBCore = exports["qb-core"]:GetCoreObject()	
	end
end 


function resetUpdated()
	Query = "UPDATE myfuel_stocks SET updated = 0 where gas_station_id>0 and fuel_type>''"
	MySQL.Sync.execute(Query)
end 

function deleteNoneUpdated()
	local Query = "SELECT * FROM myfuel_stocks WHERE updated = 0"
	local data = MySQL.Sync.fetchAll(Query, {
	})

	if #data > 0 then 
		Query = "DELETE FROM myfuel_stocks WHERE updated = 0 AND gas_station_id>'' AND fuel_type>''"
		MySQL.Sync.execute(Query)
	end 
end 

function createNoneExistingData()
	local toInsertStations = {} 
	local toInsertStocks = {}

	local Query = "SELECT myfuel_gas_stations.uid as gas_station_id , myfuel_classes.fueltype FROM myfuel_gas_stations " ..
		" left join myfuel_classes on myfuel_classes.classname = myfuel_gas_stations.vehicleClass" ..
    	" left join myfuel_stocks on myfuel_stocks.gas_station_id = myfuel_gas_stations.uid" ..
			" and myfuel_stocks.fuel_type = myfuel_classes.fueltype" ..
		" where myfuel_stocks.fuel_type is null"
	toInsertStocks = MySQL.Sync.fetchAll(Query, {
	})

	local insertDataStock = ""
	for key, row in pairs(toInsertStocks) do
		
		if insertDataStock ~= "" then 
			insertDataStock = insertDataStock .. ","
		end 
		insertDataStock = insertDataStock .. "('" .. row.gas_station_id .. "', '" .. row.fueltype .. "', '" .. Config.FuelTypes[row.fueltype].defaultSalesPriceMax  .. "', '" .. Config.WarehouseLevels[1].capacity .. "', 1 )"
	end 

	if insertDataStock~= "" then 
		Query = "INSERT INTO myfuel_stocks(gas_station_id, fuel_type, price_per_liter, stock, updated) VALUES " .. insertDataStock
		MySQL.Sync.execute(Query)
	end 
end 


function randomizePrices()
	local Query = "" .. 

		" SELECT"..
			"  myfuel_stocks.*"..
			" ,(myfuel_gas_stations.`owner` = '' or myfuel_gas_stations.`owner` is null) as noOwner"..
		" FROM myfuel_gas_stations "..
			" left join myfuel_stocks on myfuel_stocks.gas_station_id = myfuel_gas_stations.uid"..
			" LEFT JOIN myfuel_classes on myfuel_classes.fueltype = myfuel_stocks.fuel_type"..
				" and myfuel_classes.classname = myfuel_gas_stations.vehicleClass"..
		" WHERE myfuel_classes.uid is not null"
		--[[
		" SELECT" ..
			"*" .. 
			",(select count(*)>0 from myfuel_gas_stations where uid = gas_station_id and (`owner` = '' or `owner` is null)) as noOwner" .. 
		" FROM myfuel_stocks" 
		--]]
		
	local stocksToUpdate = MySQL.Sync.fetchAll(Query, {})

	for key, data in pairs(stocksToUpdate) do 
		if data.noOwner == 1 then 
			local min = math.floor(tonumber(Config.FuelTypes[data.fuel_type].defaultSalesPriceMin*100))
			local max = math.floor(tonumber(Config.FuelTypes[data.fuel_type].defaultSalesPriceMax*100))
			
			local rdmPrice = math.random(min ,max )
			
			rdmPrice = rdmPrice / 100

			local updateQuery = "UPDATE myfuel_stocks SET price_per_liter = @price, updated = 1 WHERE gas_station_id = @gas_station_id AND fuel_type = @fuel_type"

			MySQL.Sync.execute(updateQuery,
			{					
				['@price'] = rdmPrice
				,['@gas_station_id'] = data.gas_station_id
				,['@fuel_type'] = data.fuel_type	
			})
		else
			local updateQuery = "UPDATE myfuel_stocks SET updated = 1 WHERE gas_station_id = @gas_station_id AND fuel_type = @fuel_type"

			MySQL.Sync.execute(updateQuery,
			{					
				['@gas_station_id'] = data.gas_station_id
				,['@fuel_type'] = data.fuel_type	
			})
		end 
	end 	
end 

function refillNecessaryGasStations()
	local Query = "UPDATE myfuel_stocks SET stock = @stock WHERE stock <= @minstock and gas_station_id>0 and fuel_type<>'' and (select count(*) from myfuel_gas_stations where uid = myfuel_stocks.gas_station_id and (`owner`<>'' and owner is not null)) = 0"	
	MySQL.Sync.execute(Query, {
		["@stock"] = Config.StockToSetIfLowerMin
		,["@minstock"] = Config.MinStockNoOwner
	})
end 





MySQL.ready(function()
	resetUpdated()
	createNoneExistingData()
	randomizePrices()
	deleteNoneUpdated()
	refillNecessaryGasStations()

	print("all startup-functions done!")

end)


--here register usable items!!
if Config.FillingUpJobs.Enabled then 
	if #Config.FillingUpJobs.ItemList > 0 then 
		for i=1, #Config.FillingUpJobs.ItemList do

			if ESX ~= nil then 
				ESX.RegisterUsableItem(Config.FillingUpJobs.ItemList[i].item , function(source)
					TriggerClientEvent("myfuel:useitem", source, Config.FillingUpJobs.ItemList[i])
				end)
			elseif QBCore ~= nil then 
				QBCore.Functions.CreateUseableItem(Config.FillingUpJobs.ItemList[i].item , function(source)
					TriggerClientEvent("myfuel:useitem", source, Config.FillingUpJobs.ItemList[i])
				end)
			end 
		end
	end
end 



if Config.OxInventory.Enabled and Config.OxInventory.isUseableItem then 
	if ESX ~= nil then 
		ESX.RegisterUsableItem(Config.OxInventory.Itemname , function(source)
			TriggerClientEvent("myFuel:fillUpVehicleByItem", source)
		end)
	elseif QBCore ~= nil then 
		QBCore.Functions.CreateUseableItem(string.lower(Config.OxInventory.Itemname) , function(source)
			TriggerClientEvent("myFuel:fillUpVehicleByItem", source)
		end)
	end 
	
	
end 

RegisterServerEvent('myFuel:payForMission')
AddEventHandler('myFuel:payForMission', function(amount, gas_station_id)
    local _source = source

	if Config.BuyStuffDirectlyFromPlayer == false then 
		Query = " UPDATE myfuel_income_expenses SET total_expenses = ifnull(total_expenses,0) + @amount_to_pay, last_update=now() where gas_station_id = @gas_station_id"
		MySQL.Sync.execute(Query,{					
			['@amount_to_pay'] = amount,
			['@gas_station_id'] = gas_station_id
		})
	

		local Query = "" .. 
			"INSERT INTO myfuel_balance(" ..
				"gas_station_id" .. 
				", costtype" .. 
				", fuel_type" .. 
				", fuel_amount" .. 
				", fuel_singleprice" .. 
				", totalprice " ..
			") VALUES (" .. 
				"@gas_station_id" .. 
				", @costtype" .. 
				", @fuel_type" .. 
				", @fuel_amount" .. 
				", @fuel_singleprice" .. 
				", @totalprice " ..
			")" 

		MySQL.Sync.execute(Query,{					
			['@gas_station_id'] = gas_station_id
			,['@costtype'] = "expenses"
			,['@fuel_type'] = "Mission"
			,['@fuel_amount'] = 1
			,['@fuel_singleprice'] = amount
			,['@totalprice'] = amount
		})

		deleteUnnessaryBalances(gas_station_id)
	else
		removePlayerMoney(ESX~=nil, ESX~=nil and ESX or QBCore, _source, amount, Config.RemoveMoneyFromAccount, false, nil)
	end
end)

RegisterServerEvent('myFuel:LevelupWarehouse')
AddEventHandler('myFuel:LevelupWarehouse',function(amount_to_pay, gas_station_id, new_level)
	local _source = source
	local Query = "UPDATE myfuel_gas_stations SET warehouse_level = @warehouselevel where uid = @gas_station_id" 
	MySQL.Sync.execute(Query,{					
		['@warehouselevel'] = new_level,
		['@gas_station_id'] = gas_station_id
	})

	if Config.BuyStuffDirectlyFromPlayer == false then 
		Query = " UPDATE myfuel_income_expenses SET total_expenses = ifnull(total_expenses,0) + @amount_to_pay, last_update=now() where gas_station_id = @gas_station_id"
		MySQL.Sync.execute(Query,{					
			['@amount_to_pay'] = amount_to_pay,
			['@gas_station_id'] = gas_station_id
		})
	

		local Query = "" .. 
			"INSERT INTO myfuel_balance(" ..
				"gas_station_id" .. 
				", costtype" .. 
				", fuel_type" .. 
				", fuel_amount" .. 
				", fuel_singleprice" .. 
				", totalprice " ..
			") VALUES (" .. 
				"@gas_station_id" .. 
				", @costtype" .. 
				", @fuel_type" .. 
				", @fuel_amount" .. 
				", @fuel_singleprice" .. 
				", @totalprice " ..
			")" 

		MySQL.Sync.execute(Query,{					
			['@gas_station_id'] = gas_station_id
			,['@costtype'] = "expenses"
			,['@fuel_type'] = "upgrade"
			,['@fuel_amount'] = 1
			,['@fuel_singleprice'] = amount_to_pay
			,['@totalprice'] = amount_to_pay
		})

		deleteUnnessaryBalances(gas_station_id)

	else
		removePlayerMoney(ESX~=nil, ESX~=nil and ESX or QBCore, _source, amount_to_pay, Config.RemoveMoneyFromAccount, false, nil)
	end

	Query = "SELECT warehouse_level FROM myfuel_gas_stations WHERE uid = @gas_station_id" 
	local data = MySQL.Sync.fetchAll(Query,{					
		['@gas_station_id'] = gas_station_id
	})

	local returndata = {
		warehouselevel = 0
		,cashbook = {}
		,info = {}
		,availableMoney = getAvailableMoney(Config.BuyStuffDirectlyFromPlayer, gas_station_id, _source)
		,playermoney = getPlayerMoney(ESX~=nil, ESX~=nil and ESX or QBCore, _source)
	};
	if(#data > 0) then 
		returndata.warehouselevel = data[1].warehouse_level
	end 

	Query = "select costtype,fuel_type,fuel_amount,totalprice from myfuel_balance where gas_Station_id = @gas_station_id order by createddate desc limit " .. Config.CashbookAmountRows
	returndata.cashbook = MySQL.Sync.fetchAll(Query, {
		["@gas_station_id"] = gas_station_id
	})

	Query = " SELECT" ..
	" warehouse_level" ..
	" ,myfuel_income_expenses.total_income as income" ..
	" ,myfuel_income_expenses.total_expenses as expenses" ..
	" FROM myfuel_gas_stations" ..
		" LEFT JOIN myfuel_income_expenses on myfuel_income_expenses.gas_station_id = myfuel_gas_stations.uid" ..
	" where myfuel_gas_stations.uid = @gas_station_id"
	returndata.info = MySQL.Sync.fetchAll(Query, {
		["@gas_station_id"] = gas_station_id
	})


	TriggerClientEvent("myFuel:updateNUI:levelup_warehouse", _source, returndata)
end)

RegisterServerEvent('myFuel:SaveFuelPrice')
AddEventHandler('myFuel:SaveFuelPrice',function(new_price, gas_station_id, fuel_type)
	local _source = source

	local Query = "UPDATE myfuel_stocks SET price_per_liter = @price_per_liter where gas_station_id = @gas_station_id and fuel_type = @fuel_type" 
	MySQL.Sync.execute(Query,{					
		['@price_per_liter'] = new_price,
		['@gas_station_id'] = gas_station_id,
		['@fuel_type'] = fuel_type
	})

	Query = "SELECT price_per_liter FROM myfuel_stocks where gas_station_id = @gas_station_id and fuel_type = @fuel_type" 
	local data = MySQL.Sync.fetchAll(Query,{	
		['@gas_station_id'] = gas_station_id,
		['@fuel_type'] = fuel_type
	})

	local returndata = {
		new_price = new_price
		,fuel_type = fuel_type
		,availableMoney = getAvailableMoney(Config.BuyStuffDirectlyFromPlayer, gas_station_id, _source)
		,playermoney = getPlayerMoney(ESX~=nil, ESX~=nil and ESX or QBCore, _source)
	};
	if(#data > 0) then 
		returndata.new_price = data[1].price_per_liter
	end 

	TriggerClientEvent("myFuel:updateNUI:set_new_fuel_price", _source, returndata)
end)

RegisterServerEvent('myFuel:BuyFuel')
AddEventHandler('myFuel:BuyFuel',function(gas_station_id, fuel_type, fuel_price, fuel_amount, fuel_singleprice)
	local _source = source

	--to remove money from player!

	local Query = "UPDATE myfuel_stocks SET stock = stock + @stock where gas_station_id = @gas_station_id and fuel_type = @fuel_type" 
	MySQL.Sync.execute(Query,{					
		['@stock'] = fuel_amount,
		['@gas_station_id'] = gas_station_id,
		['@fuel_type'] = fuel_type
	})

	if Config.BuyStuffDirectlyFromPlayer == false then 

		local Query = " UPDATE myfuel_income_expenses SET total_expenses = total_expenses + @amount_to_pay, last_update=now() where gas_station_id = @gas_station_id"
		MySQL.Sync.execute(Query,{					
			['@amount_to_pay'] = fuel_price,
			['@gas_station_id'] = gas_station_id
		})

		local Query = "INSERT INTO myfuel_balance(gas_station_id, costtype, fuel_type, fuel_amount, totalprice, fuel_singleprice, createddate) VALUES (@gas_station_id, @costtype, @fuel_type, @fuel_amount, @totalprice, @fuel_singleprice, now())" 
		MySQL.Sync.execute(Query,{					
			['@gas_station_id'] = gas_station_id,
			['@costtype'] = "expenses",
			['@fuel_type'] = fuel_type,
			['@fuel_amount'] = fuel_amount,
			['@totalprice'] = fuel_price,
			['@fuel_singleprice'] = fuel_singleprice
		})
		deleteUnnessaryBalances(gas_station_id)

	else
		removePlayerMoney(ESX~=nil, ESX~=nil and ESX or QBCore, _source, fuel_price, Config.RemoveMoneyFromAccount, false, nil)
	end 

	Query = "SELECT stock FROM myfuel_stocks where gas_station_id = @gas_station_id and fuel_type = @fuel_type" 
	local data = MySQL.Sync.fetchAll(Query,{	
		['@gas_station_id'] = gas_station_id,
		['@fuel_type'] = fuel_type
	})

	local returndata = {
		new_current_stock = 0
		,availableMoney = getAvailableMoney(Config.BuyStuffDirectlyFromPlayer, gas_station_id, _source)
		,playermoney = getPlayerMoney(ESX~=nil, ESX~=nil and ESX or QBCore, _source)
		,fuel_type = fuel_type
		,cashbook = {}
		,info = {}
	};

	if(#data > 0) then 
		returndata.new_current_stock = data[1].stock
	end 



	Query = " SELECT" ..
			" warehouse_level" ..
			" ,myfuel_income_expenses.total_income as income" ..
			" ,myfuel_income_expenses.total_expenses as expenses" ..
		" FROM myfuel_gas_stations" ..
			" LEFT JOIN myfuel_income_expenses on myfuel_income_expenses.gas_station_id = myfuel_gas_stations.uid" ..
		" where myfuel_gas_stations.uid = @gas_station_id"
	returndata.info = MySQL.Sync.fetchAll(Query, {
		["@gas_station_id"] = gas_station_id
	})

	Query = "select costtype,fuel_type,fuel_amount,totalprice from myfuel_balance where gas_Station_id = @gas_station_id order by createddate desc limit " .. Config.CashbookAmountRows
	returndata.cashbook = MySQL.Sync.fetchAll(Query, {
		["@gas_station_id"] = gas_station_id
	})


	TriggerClientEvent("myFuel:updateNUI:bought_fuel", _source, returndata)
end)



RegisterServerEvent('myFuel:UpdateStock')
AddEventHandler('myFuel:UpdateStock',function(gas_station_id, fuel_type, itemname, itemlabel, amount_to_add, ui_element_id, ui_amount ,payment_for_player, called_from_ui)
	local _source = source
	local Query = ""
	
	if called_from_ui == false then 
		local data = {}

		if fuel_type == "*" then 
			Query = "SELECT * FROM myfuel_stocks where gas_station_id = @gas_station_id and fuel_type <> '' and stock <= @maxStock" 
			data = MySQL.Sync.fetchAll(Query,{					
				['@gas_station_id'] = gas_station_id,
				['@maxStock'] = 2500
			})
		else
			Query = "SELECT * FROM myfuel_stocks where gas_station_id = @gas_station_id and fuel_type = @fuel_type and stock <= @maxStock" 
			data = MySQL.Sync.fetchAll(Query,{			
				['@gas_station_id'] = gas_station_id,		
				['@fuel_type'] = fuel_type,
				['@maxStock'] = Config.WarehouseLevels[1].capacity
			})
		end 

		if #data > 0 then 
			if getPlayerItemCount(ESX~=nil, ESX~=nil and ESX or QBCore, _source, itemname) > 0 then 
				removeItemFromPlayer(ESX~=nil, ESX~=nil and ESX or QBCore, _source, itemname, 1)

				if fuel_type == "*" then 
					Query = "UPDATE myfuel_stocks SET stock = stock + @stock where gas_station_id = @gas_station_id and fuel_type <> '' and stock <= @maxStock" 
					data = MySQL.Sync.fetchAll(Query,{					
						['@stock'] = amount_to_add,
						['@gas_station_id'] = gas_station_id,
						['@maxStock'] = 2500
					})
				else
					Query = "UPDATE myfuel_stocks SET stock = stock + @stock where gas_station_id = @gas_station_id and fuel_type = @fuel_type" 
					data = MySQL.Sync.fetchAll(Query,{					
						['@stock'] = amount_to_add,	
						['@gas_station_id'] = gas_station_id,		
						['@fuel_type'] = fuel_type
					})
				end 

				if payment_for_player > 0 then 
					addPlayerMoney(ESX~=nil, ESX~=nil and ESX or QBCore, _source, payment_for_player, Config.RemoveMoneyFromAccount)
				end 

				if fuel_type ~= "electric" then 
					TriggerClientEvent("myFuel:notify", _source, Translations[Config.Locale].gas_station_filled_up .. " " ..amount_to_add .." ".. Translations[Config.Locale].gas_station_filled_up_2 .. payment_for_player)
				else	
					TriggerClientEvent("myFuel:notify", _source, Translations[Config.Locale].gas_station_filled_up .. " " ..amount_to_add .." " .. Translations[Config.Locale].gas_station_filled_up_2_electric .. payment_for_player)
				end 
			else
				TriggerClientEvent("myFuel:notify", _source, Translations[Config.Locale].not_enough_items .. " (".. itemlabel .. ")" )
			end 
		else
			TriggerClientEvent("myFuel:notify", _source, Translations[Config.Locale].gas_station_cannot_fillup)
		end 
		
	else
		if getPlayerItemCount(ESX~=nil, ESX~=nil and ESX or QBCore, _source, itemname) >= ui_amount then 
			removeItemFromPlayer(ESX~=nil, ESX~=nil and ESX or QBCore, _source, itemname, ui_amount)

			Query = "UPDATE myfuel_stocks SET stock = stock + @stock where gas_station_id = @gas_station_id and fuel_type = @fuel_type" 
			MySQL.Sync.execute(Query,{					
				['@stock'] = amount_to_add * ui_amount,
				['@gas_station_id'] = gas_station_id,
				['@fuel_type'] = fuel_type
			})	
	
	
			Query = "SELECT stock from myfuel_stocks where gas_station_id = @gas_station_id and fuel_type = @fuel_type"
			local data = MySQL.Sync.fetchAll(Query, {
				["@gas_station_id"] = gas_station_id,
				["@fuel_type"] = fuel_type
			})
	
			TriggerClientEvent("myfuel:handleItemFillupUI", _source, "",
				{
					stock = data[1].stock,
					ui_element_id = ui_element_id,
					amount_items_remain = getPlayerItemCount(ESX~=nil, ESX~=nil and ESX or QBCore, _source, itemname),
					fuel_type = fuel_type
				}
			)
		else
			TriggerClientEvent("myfuel:handleItemFillupUI", _source, Translations[Config.Locale].not_enough_items .. " (".. itemlabel .. ")", 
				{
					ui_element_id = ui_element_id,
					amount_items_remain = getPlayerItemCount(ESX~=nil, ESX~=nil and ESX or QBCore, _source, itemname),
					fuel_type = fuel_type
				}
			)
		end 
	end 
	
end)

RegisterServerEvent('myFuel:SetStockToMax')
AddEventHandler('myFuel:SetStockToMax',function(gas_station_id, fuel_type, stock_to_set)
	local _source = source
	
	local Query = "UPDATE myfuel_stocks SET stock = @stock where gas_station_id = @gas_station_id and fuel_type = @fuel_type" 
	MySQL.Sync.execute(Query,{					
		['@stock'] = stock_to_set,
		['@gas_station_id'] = gas_station_id,
		['@fuel_type'] = fuel_type
	})
end)


RegisterServerEvent('myFuel:TransferMoney')
AddEventHandler('myFuel:TransferMoney',function(gas_station_id, money_amount, transfer_type)
	local _source = source

	if transfer_type == "deposit" then 
		local Query = " UPDATE myfuel_income_expenses SET total_income = total_income + @amount_money, last_update=now() where gas_station_id = @gas_station_id"
		MySQL.Sync.execute(Query,{					
			['@amount_money'] = money_amount,
			['@gas_station_id'] = gas_station_id
		})
	else
		local Query = " UPDATE myfuel_income_expenses SET total_expenses = total_expenses + @amount_money, last_update=now() where gas_station_id = @gas_station_id"
		MySQL.Sync.execute(Query,{					
			['@amount_money'] = money_amount,
			['@gas_station_id'] = gas_station_id
		})
	end 
	


	local Query = "INSERT INTO myfuel_balance(gas_station_id, costtype, fuel_type, fuel_amount, totalprice, fuel_singleprice, createddate) VALUES (@gas_station_id, @costtype, @fuel_type, @fuel_amount, @totalprice, @fuel_singleprice, now())" 
	MySQL.Sync.execute(Query,{					
		['@gas_station_id'] = gas_station_id,
		['@costtype'] = transfer_type,
		['@fuel_type'] = transfer_type,
		['@fuel_amount'] = 0,
		['@totalprice'] = money_amount,
		['@fuel_singleprice'] = money_amount
	})
	deleteUnnessaryBalances(gas_station_id)

	if transfer_type == "deposit" then 
		removePlayerMoney(ESX~=nil, ESX~=nil and ESX or QBCore, _source, money_amount, Config.RemoveMoneyFromAccount, false, nil)
	else
		addPlayerMoney(ESX~=nil, ESX~=nil and ESX or QBCore, _source, money_amount, Config.RemoveMoneyFromAccount)
	end

	local returndata = {
		availableMoney = getAvailableMoney(Config.BuyStuffDirectlyFromPlayer, gas_station_id, _source)
		,playermoney = getPlayerMoney(ESX~=nil, ESX~=nil and ESX or QBCore, _source)
		,info = {}
		,cashbook = {}
	};



	Query = " SELECT" ..
			" myfuel_income_expenses.total_income as income" ..
			" ,myfuel_income_expenses.total_expenses as expenses" ..
		" FROM myfuel_gas_stations" ..
			" LEFT JOIN myfuel_income_expenses on myfuel_income_expenses.gas_station_id = myfuel_gas_stations.uid" ..
		" where myfuel_gas_stations.uid = @gas_station_id"
	returndata.info = MySQL.Sync.fetchAll(Query, {
		["@gas_station_id"] = gas_station_id
	})

	Query = "select costtype,fuel_type,fuel_amount,totalprice from myfuel_balance where gas_Station_id = @gas_station_id order by createddate desc limit " .. Config.CashbookAmountRows
	returndata.cashbook = MySQL.Sync.fetchAll(Query, {
		["@gas_station_id"] = gas_station_id
	})


	TriggerClientEvent("myFuel:updateNUI:TransferedMoney", _source, returndata)
end)


RegisterServerEvent("myFuel:pay")
AddEventHandler("myFuel:pay",function(new_fuel_percentage, vehicle, amounttopay, gas_station_id, fuel_type, fuel_amount,single_price, payment_type, isSociety, SocietyName)
	local _source = source

	local query = "UPDATE myfuel_stocks SET stock = stock - @fuel_amount WHERE gas_station_id = @gas_station_id AND fuel_type = @fuel_type"
	MySQL.Sync.execute(query, {
		['@fuel_amount'] = fuel_amount,
		['@gas_station_id'] = gas_station_id,
		['@fuel_type'] = fuel_type
	});

	
	local Query = " UPDATE myfuel_income_expenses SET total_income = total_income + @amount_money, last_update=now() where gas_station_id = @gas_station_id"
	MySQL.Sync.execute(Query,{					
		['@amount_money'] = amounttopay,
		['@gas_station_id'] = gas_station_id
	})


	local query = "INSERT INTO myfuel_balance(gas_station_id, costtype, fuel_type, fuel_amount, fuel_singleprice, totalprice, createddate) VALUES (@gas_station_id, @costtype, @fuel_type, @fuel_amount, @fuel_singleprice, @totalprice, now())"

	MySQL.Sync.execute(query, {
		['@gas_station_id'] = gas_station_id,
		['@costtype'] = "income",
		['@fuel_type'] = fuel_type,
		['@fuel_amount'] = fuel_amount,
		['@fuel_singleprice'] = single_price,
		['@totalprice'] = amounttopay
	});
	deleteUnnessaryBalances(gas_station_id)

	removePlayerMoney(ESX~=nil, ESX~=nil and ESX or QBCore, _source, amounttopay, payment_type, isSociety, SocietyName)
	TriggerEvent("myFuel:SyncFuel", vehicle, new_fuel_percentage)
	local icon = Config.NotificationPicturePay
	local title = Translations[Config.Locale]["fuel_title"]
	TriggerClientEvent('myFuel:picturenotify', _source, icon, '~o~' .. fuel_amount .. 'l ' ..  UI_Translations[Config.Locale][fuel_type] .. Translations[Config.Locale]["fuel_pay"] .. single_price .. Translations[Config.Locale]["fuel_pay_2"] .. amounttopay .. '$', title, nil)

	
	refillNecessaryGasStations()
end)


RegisterServerEvent('myFuel:SyncFuel')
AddEventHandler('myFuel:SyncFuel',function(vehicle, new_fuel_level)
	TriggerClientEvent("myFuel:SyncFuel", -1, vehicle, new_fuel_level)
end)

RegisterServerEvent("myFuel:removejerrycan")
AddEventHandler("myFuel:removejerrycan",function()
	local _source = source
	removeItemFromPlayer(ESX~=nil, ESX~=nil and ESX or QBCore, _source, Config.OxInventory.Itemname, 1)
end)

RegisterServerEvent("myFuel:buyJerryCan")
AddEventHandler("myFuel:buyJerryCan",function(gas_station_id, price, playerCoords)
	
	local _source = source
	local fuel_type = "gasoline"
	local addedPetrolCan = true
	

	if Config.OxInventory.Enabled then
		if canPlayerCarryItem(ESX~=nil, ESX~=nil and ESX or QBCore, _source, Config.OxInventory.Itemname, 1) then
			addedPetrolCan = addItemToPlayer(ESX~=nil, ESX~=nil and ESX or QBCore, _source, Config.OxInventory.Itemname, 1)	
		else 
			addedPetrolCan =  false
		end

		
	end

	if addedPetrolCan then 
		removePlayerMoney(ESX~=nil, ESX~=nil and ESX or QBCore, _source, price, Config.RemoveMoneyFromAccount, false, nil)

		if gas_station_id == nil then 
			print("[INFO] SOME PLAYER BOUGHT JERRY CAN WITHOUT PETROL STATION! COORDS = " .. playerCoords)
		else
				--check for fuel types... 1. gasoline, 2. diesel than the rest..
			local query = "SELECT fuel_type FROM myfuel_stocks where gas_station_id = @gas_station_id order by IF(fuel_type = 'gasoline',0, if(fuel_type='diesel',2,3)) limit 1"
			local data = MySQL.Sync.fetchAll(query, {
				['@gas_station_id'] = gas_station_id
			});
	
			if #data > 0 then 
				fuel_type = data[1].fuel_type
			end 
			
			local Query = " UPDATE myfuel_income_expenses SET total_income = total_income + @amount_money, last_update=now() where gas_station_id = @gas_station_id"
			MySQL.Sync.execute(Query,{					
				['@amount_money'] = price,
				['@gas_station_id'] = gas_station_id
			})
	
			local query = "UPDATE myfuel_stocks SET stock = stock - @fuel_amount WHERE gas_station_id = @gas_station_id AND fuel_type = @fuel_type"
			MySQL.Sync.execute(query, {
				['@fuel_amount'] = Config.PetrolCanRemoveLiters,
				['@gas_station_id'] = gas_station_id,
				['@fuel_type'] = fuel_type
			});
	
			local query = "INSERT INTO myfuel_balance(gas_station_id, costtype, fuel_type, fuel_amount, fuel_singleprice, totalprice, createddate) VALUES (@gas_station_id, @costtype, @fuel_type, @fuel_amount, @fuel_singleprice, @totalprice, now())"
	
			MySQL.Sync.execute(query, {
				['@gas_station_id'] = gas_station_id,
				['@costtype'] = "income",
				['@fuel_type'] = "petrolcan",
				['@fuel_amount'] = 1,
				['@fuel_singleprice'] = 0,
				['@totalprice'] = price
			});
	
			deleteUnnessaryBalances(gas_station_id)
			refillNecessaryGasStations()
		end 
	else
		TriggerClientEvent("myFuel:notify", _source, Translations[Config.Locale].cannot_carry_item)
	end 

	
end)

RegisterServerEvent("myFuel:SellGasStation")
AddEventHandler("myFuel:SellGasStation",function(gas_station_id)
	local _source = source

	local Query = " SELECT" ..
		" myfuel_gas_stations.price" .. 
		" ,myfuel_income_expenses.total_income as income" ..
		" ,myfuel_income_expenses.total_expenses as expenses" ..
		" FROM myfuel_gas_stations" ..
			" LEFT JOIN myfuel_income_expenses on myfuel_income_expenses.gas_station_id = myfuel_gas_stations.uid" ..
		" where myfuel_gas_stations.uid = @gas_station_id"
	local data = MySQL.Sync.fetchAll(Query, {
		["@gas_station_id"] = gas_station_id
	})


	if #data>0 then
		local money_to_add = (data[1].price * Config.SellPetrolStationMultiplier) + (data[1].income - data[1].expenses)

		Query = "UPDATE myfuel_gas_stations SET warehouse_level = 0, `owner` = '' where uid = @gas_station_id"
		MySQL.Sync.execute(Query, {
			['@gas_station_id'] = gas_station_id
		});
		
		addPlayerMoney(ESX~=nil, ESX~=nil and ESX or QBCore, _source, money_to_add, Config.RemoveMoneyFromAccount)
		TriggerClientEvent("myFuel:notify", _source, Translations[Config.Locale].sold_For .. money_to_add)

			
		local Query = "INSERT INTO myfuel_income_expenses(gas_station_id,total_income,total_expenses,last_update) VALUES (@gas_station_id, 0, 0, NOW()) on duplicate key update total_income=VALUES(`total_income`), `total_expenses`=VALUES(`total_expenses`), last_update = VALUES(`last_update`)"
		MySQL.Sync.execute(Query,{					
			['@gas_station_id'] = gas_station_id
		})



		local Query = "DELETE FROM myfuel_balance WHERE uid > 0 and gas_station_id = @gas_station_id"
		MySQL.Sync.execute(Query, {
			['@gas_station_id'] = gas_station_id
		});


		TriggerClientEvent("myFuel:UpdateBlip", -1 ,gas_station_id, false, nil)
		
	end
end)

RegisterServerEvent("myFuel:BuyGasStation")
AddEventHandler("myFuel:BuyGasStation",function(amount_to_pay, gas_station_id)
	local _source = source
	local identifier = getIdentifier(ESX~=nil, ESX~=nil and ESX or QBCore, _source)
	
	if getPlayerMoney(ESX~=nil, ESX~=nil and ESX or QBCore, _source) >= amount_to_pay then

		

		local playerGasStationCount = checkGasStationCount(identifier)

		if (playerGasStationCount + 1) <= Config.MaxAmountGasStationsPerPlayer then
		 	local Query = "INSERT INTO myfuel_income_expenses(gas_station_id,total_income,total_expenses,last_update) VALUES (@gas_station_id, 0, 0, NOW()) on duplicate key update total_income=VALUES(`total_income`), `total_expenses`=VALUES(`total_expenses`), last_update = VALUES(`last_update`)"
			MySQL.Sync.execute(Query, {
				["@gas_station_id"] = gas_station_id
			})

			local query = "DELETE FROM myfuel_balance WHERE uid > 0 and gas_station_id = @gas_station_id"
			MySQL.Sync.execute(query, {
				['@gas_station_id'] = gas_station_id
			});
	
			local query = "UPDATE myfuel_gas_stations SET `owner` = @owner where uid = @gas_station_id"
	
			MySQL.Sync.execute(query, {
				['@owner'] = identifier,
				['@gas_station_id'] = gas_station_id
			});

			removePlayerMoney(ESX~=nil, ESX~=nil and ESX or QBCore, _source, amount_to_pay, Config.RemoveMoneyFromAccount, false, nil)
	
			TriggerClientEvent('myFuel:GasStationBuy_Success', _source)

			TriggerClientEvent("myFuel:UpdateBlip", -1 , gas_station_id, true, _source)

		else
			TriggerClientEvent('myFuel:notify', _source, Translations[Config.Locale].notification_too_many_gasstations)
		end


	else
		TriggerClientEvent('myFuel:GasStationBuy_MissingMoney', _source)
	end 
end)

function checkGasStationCount(identifier)

	local results = MySQL.Sync.fetchScalar('SELECT COUNT(uid) FROM myfuel_gas_stations WHERE owner = @owner', 
	{
		['@owner'] = identifier,
	})
	return results

end


--functions for statebag
RegisterNetEvent('myFuel:initFuelForVehicle')
AddEventHandler('myFuel:initFuelForVehicle', function(vehicle)
	local veh = NetworkGetEntityFromNetworkId(vehicle)

	if veh ~= 0 then
		if Entity(veh).state.fuel == nil then 
			Entity(veh).state.fuel = math.random(20, 80)	
		end
		TriggerEvent("myFuel:SyncFuel", vehicle, Entity(veh).state.fuel)
	end
end)
-- end functions for statebag


--server callbacks

if ESX ~= nil then 
	ESX.RegisterServerCallback('myFuel:checkMoney', function(source, cb, amount)
		local _source = source
		if getPlayerMoney(ESX~=nil, ESX~=nil and ESX or QBCore, source) >= amount then
			cb(true)
		else
			cb(false)
		end
	end)

	ESX.RegisterServerCallback("myFuel:hasPetrolCan", function(source, cb)
		local _source = source
		if Config.OxInventory.Enabled ~= true or getPlayerItemCount(ESX~=nil, ESX~=nil and ESX or QBCore, _source, Config.OxInventory.Itemname) > 0 then
			cb(true)
		else
			cb(false)
		end
	end)

	ESX.RegisterServerCallback('myFuel:checkAndRemoveItem', function(source, cb, amount)
		local _source = source
		
		if getPlayerItemCount(ESX~=nil, ESX~=nil and ESX or QBCore, _source, Config.OxInventory.Itemname) > 0 then
			removeItemFromPlayer(ESX~=nil, ESX~=nil and ESX or QBCore, _source, Config.OxInventory.Itemname, 1)
			cb(true)
		else
			cb(false)
		end
	end)

	ESX.RegisterServerCallback('myFuel:GetOwnerInfo', function(source, cb, gas_station_id)
		local _source = source
		cb(GetOwnerInfo(_source, gas_station_id))
	end)

	ESX.RegisterServerCallback('myFuel:getItemCount', function(source, cb, itemname)
		cb(getPlayerItemCount(ESX~=nil, ESX~=nil and ESX or QBCore, source, itemname))
	end)

	ESX.RegisterServerCallback('myFuel:GetNecessaryFillupData', function(source, cb, gas_station_id, fuel_type)	
		local _source = source 
		cb(GetNecessaryFillupData(_source, gas_station_id, fuel_type))
	end)

	ESX.RegisterServerCallback('myFuel:CheckForGasStationOwner', function(source, cb, gas_station_id)
		local _source = source
		cb(CheckForGasStationOwner(_source, gas_station_id))
	end)

	ESX.RegisterServerCallback('myFuel:GetGasStationsCallback', function(source, cb)
		local _source = source
		cb(GetGasStationsCallback(_source))
	end)

	
elseif QBCore ~= nil then
	QBCore.Functions.CreateCallback('myFuel:checkMoney', function(source, cb, amount)
		if getPlayerMoney(ESX~=nil, ESX~=nil and ESX or QBCore, source) >= amount then
			cb(true)
		else
			cb(false)
		end
	end)

	QBCore.Functions.CreateCallback("myFuel:hasPetrolCan", function(source, cb, amount)
		local _source = source
		if Config.OxInventory.Enabled ~= true or getPlayerItemCount(ESX~=nil, ESX~=nil and ESX or QBCore, _source, Config.OxInventory.Itemname) > 0 then
			cb(true)
		else
			cb(false)
		end
	end)

	QBCore.Functions.CreateCallback('myFuel:checkAndRemoveItem', function(source, cb, amount)
		local _source = source
		
		if getPlayerItemCount(ESX~=nil, ESX~=nil and ESX or QBCore, _source, Config.OxInventory.Itemname) > 0 then
			removeItemFromPlayer(ESX~=nil, ESX~=nil and ESX or QBCore, _source, Config.OxInventory.Itemname, 1)
			cb(true)
		else
			cb(false)
		end
	end)

	QBCore.Functions.CreateCallback('myFuel:GetOwnerInfo', function(source, cb, gas_station_id)
		local _source = source
		cb(GetOwnerInfo(_source, gas_station_id))
	end)

	QBCore.Functions.CreateCallback('myFuel:getItemCount', function(source, cb, itemname)
		cb(getPlayerItemCount(ESX~=nil, ESX~=nil and ESX or QBCore, source, itemname))
	end)

	QBCore.Functions.CreateCallback('myFuel:GetNecessaryFillupData', function(source, cb, gas_station_id, fuel_type)	
		local _source = source 
		cb(GetNecessaryFillupData(_source, gas_station_id, fuel_type))
	end)

	QBCore.Functions.CreateCallback('myFuel:CheckForGasStationOwner', function(source, cb, gas_station_id)
		local _source = source
		cb(CheckForGasStationOwner(_source, gas_station_id))
	end)

	
	QBCore.Functions.CreateCallback('myFuel:GetGasStationsCallback', function(source, cb, amount)
		local _source = source
		cb(GetGasStationsCallback(_source))
	end)
	
end 





function GetOwnerInfo(_source, gas_station_id)
	local data = {
		self_fuel_info = {}
		,competitor_fuel_info = {}
		,cashbook = {}
		,info = {}
		,cashbook_max_rows = Config.CashbookAmountRows
		,possible_warehouse_levels = Config.WarehouseLevels
		,availableMoney = getAvailableMoney(Config.BuyStuffDirectlyFromPlayer, gas_station_id, _source)
		,playermoney = getPlayerMoney(ESX~=nil, ESX~=nil and ESX or QBCore, _source)
		,import_percentage = Config.ImportPriceFromAveragePercentage / 100
		,mission_percentage = Config.MissionPricePerLiter / 100
		,gas_station_id = gas_station_id
	};



	local query = " SELECT" ..
			" warehouse_level" ..
			" ,logo_name" ..
			" ,myfuel_income_expenses.total_income as income" ..
			" ,myfuel_income_expenses.total_expenses as expenses" ..
		" FROM myfuel_gas_stations" ..
			" LEFT JOIN myfuel_income_expenses on myfuel_income_expenses.gas_station_id = myfuel_gas_stations.uid" ..
		" where myfuel_gas_stations.uid = @gas_station_id"
	data.info = MySQL.Sync.fetchAll(query, {
		["@gas_station_id"] = gas_station_id
	})
	
	query = "SELECT" ..  
		" myfuel_gas_stations.uid as gas_station_id " .. 
		", myfuel_stocks.*" ..
		" ,(select min(mys.price_per_liter) from myfuel_stocks as mys where mys.fuel_type = myfuel_classes.fueltype and gas_station_id <> myfuel_gas_stations.uid) as competitor_min_price" ..
    	" ,(select max(mys.price_per_liter) from myfuel_stocks as mys where mys.fuel_type = myfuel_classes.fueltype and gas_station_id <> myfuel_gas_stations.uid) as competitor_max_price" ..
     	" ,(select avg(mys.price_per_liter) from myfuel_stocks as mys where mys.fuel_type = myfuel_classes.fueltype and gas_station_id <> myfuel_gas_stations.uid) as competitor_avg_price" ..

		" FROM myfuel_gas_stations " ..
		" left join myfuel_classes on myfuel_classes.classname = myfuel_gas_stations.vehicleClass" ..
    	" left join myfuel_stocks on myfuel_stocks.gas_station_id = myfuel_gas_stations.uid" ..
			" and myfuel_stocks.fuel_type = myfuel_classes.fueltype" ..
		" where myfuel_gas_stations.uid = @gas_station_id"
	data.self_fuel_info = MySQL.Sync.fetchAll(query, {
		["@gas_station_id"] = gas_station_id
	})

	for i=1, #data.self_fuel_info do
		if Config.FuelTypes[data.self_fuel_info[i].fuel_type] ~= nil then 
			data.self_fuel_info[i].allowImport = Config.FuelTypes[data.self_fuel_info[i].fuel_type].allowImport
			data.self_fuel_info[i].allowMission = Config.FuelTypes[data.self_fuel_info[i].fuel_type].allowMission
			data.self_fuel_info[i].allowFillUpByItem = Config.FuelTypes[data.self_fuel_info[i].fuel_type].allowFillUpByItem
			data.self_fuel_info[i].fillUpitems = {}
			
			if Config.FuelTypes[data.self_fuel_info[i].fuel_type].allowFillUpByItem then 
				if Config.FuelTypes[data.self_fuel_info[i].fuel_type].fillupItems ~= nil then 

					for j=1, 3 do
						local currententry = Config.FuelTypes[data.self_fuel_info[i].fuel_type].fillupItems[j]
						table.insert(data.self_fuel_info[i].fillUpitems, currententry)
					end
				end 
			end 
		end 

	end
	
	query = "select costtype,fuel_type,fuel_amount,totalprice from myfuel_balance where gas_Station_id = @gas_station_id order by createddate desc limit " .. Config.CashbookAmountRows
	data.cashbook = MySQL.Sync.fetchAll(query, {
		["@gas_station_id"] = gas_station_id
	})

	return data
end 


function GetNecessaryFillupData(_source, gas_station_id, fuel_type)
	local data = {
        bank_money = getPlayerBankMoney(ESX~=nil, ESX~=nil and ESX or QBCore, _source),
        cash_money = getPlayerCashMoney(ESX~=nil, ESX~=nil and ESX or QBCore, _source),
        database = {},
        logoname = Config.LogoName,
        wanted_fuel_type = fuel_type
    }
	
	local Query = "SELECT * FROM myfuel_gas_stations where uid = @gas_station_id"
	local temp = MySQL.Sync.fetchAll(Query, {
		["@gas_station_id"] = gas_station_id
		,["@fuel_type"] = fuel_type
	})

	if #temp > 0 then 
		data.logoname = temp[1].logo_name
	end 
	
	
	local Query = "SELECT * FROM myfuel_stocks where gas_station_id = @gas_station_id and fuel_type = @fuel_type"
	data.database = MySQL.Sync.fetchAll(Query, {
		["@gas_station_id"] = gas_station_id
		,["@fuel_type"] = fuel_type
	})

	return data
end 

function CheckForGasStationOwner(_source, gas_station_id)
	local xPlayer = nil 
	local jobname = ""
	
	if ESX ~= nil then 
		xPlayer = ESX.GetPlayerFromId(_source)
		jobname = xPlayer.job.name
	elseif QBCore ~= nil then 
		xPlayer = QBCore.Functions.GetPlayer(_source)
		jobname = xPlayer.PlayerData.job.name
	end 

	

	local returnvalues = {
		playermoney = getPlayerMoney(ESX~=nil, ESX~=nil and ESX or QBCore, _source),
		gas_station_has_owner = false,
		gas_station_owned_by_user = false,
		price = 0,
		logoname = Config.LogoName,
		playerjob = jobname
	}
	
	local Query = "SELECT *, ifnull(owner,'') as str_owner FROM myfuel_gas_stations where uid = @gas_station_id"
	local dbdata = MySQL.Sync.fetchAll(Query, {
		["@gas_station_id"] = gas_station_id
	})

	if #dbdata>0 then
		returnvalues.gas_station_has_owner = dbdata[1].str_owner ~= "" or dbdata[1].is_buyable == 0
		returnvalues.gas_station_owned_by_user = dbdata[1].str_owner == getIdentifier(ESX~=nil, ESX~=nil and ESX or QBCore, _source)
		returnvalues.price = dbdata[1].price
		returnvalues.logoname = dbdata[1].logo_name
	end
	return returnvalues
end 




function GetGasStationsCallback(_source)
	local xPlayer = nil 

	
	if ESX ~= nil then 
		xPlayer = ESX.GetPlayerFromId(_source)
	elseif QBCore ~= nil then 
		xPlayer = QBCore.Functions.GetPlayer(_source)
	end 

	local result = {}

	if xPlayer ~= nil then  
		local Query = "SELECT *, ifnull(`owner`,'') as _owner FROM myfuel_gas_stations"
		local data = MySQL.Sync.fetchAll(Query, {})
	
		
	
		for i=1, #data do
			table.insert(result,{
				pos = {x = data[i].posX, y = data[i].posY, z = data[i].posZ}
				,adminpos = {x = data[i].admin_posX, y = data[i].admin_posY, z = data[i].admin_posZ}
				,npc_heading = tonumber(data[i].npc_heading)
				,missionpos = {x = data[i].mission_spawn_poxX, y = data[i].mission_spawn_poxY, z = data[i].mission_spawn_poxZ, heading = tonumber(data[i].mission_spawn_heading)}
				,distance = 30.0
				,class = data[i].vehicleClass
				,price = data[i].price
				,db_id= data[i].uid
				,has_owner = data[i]._owner ~= "" or data[i].is_buyable == 0
				,playerisowner = data[i]._owner == getIdentifier(ESX~=nil, ESX~=nil and ESX or QBCore, _source)
			})
		end 
	end

	return result
end 


--functions

function getAvailableMoney(usePlayermoney, gas_station_id, _source)
	if usePlayermoney then 
		return getPlayerMoney(ESX~=nil, ESX~=nil and ESX or QBCore, _source)
	else 
		local Query = " SELECT" ..
				" myfuel_income_expenses.total_income as income" ..
				" ,myfuel_income_expenses.total_expenses as expenses" ..
				" ,IFNULL(myfuel_income_expenses.total_income - myfuel_income_expenses.total_expenses,0) as total_money" ..

			" FROM myfuel_gas_stations" ..
				" LEFT JOIN myfuel_income_expenses on myfuel_income_expenses.gas_station_id = myfuel_gas_stations.uid" ..
			" where myfuel_gas_stations.uid = @gas_station_id"
		local data = MySQL.Sync.fetchAll(Query, {
			["@gas_station_id"] = gas_station_id
		})

		if #data>0 then 
			if data[1].income == nil or data[1].expenses == nil then 
				Query = "INSERT INTO myfuel_income_expenses(gas_station_id,total_income,total_expenses,last_update) VALUES (@gas_station_id, 0, 0, NOW()) on duplicate key update total_income=VALUES(`total_income`), `total_expenses`=VALUES(`total_expenses`), last_update = VALUES(`last_update`)"
				MySQL.Sync.execute(Query, {
					["@gas_station_id"] = gas_station_id
				})
			end 

			return data[1].total_money
		else
			return 0			
		end
	end 
end 



function deleteUnnessaryBalances(gas_station_id)
	local query = "SELECT uid FROM myfuel_balance "..
		" where gas_station_id = @gas_station_id" .. 
		" order by uid DESC" .. 
		" limit " .. Config.CashbookAmountRows .. ",1000000" 
	local data = MySQL.Sync.fetchAll(query,{					
		['@gas_station_id'] = gas_station_id
	})

	if #data > 0 then 
		for i=1, #data do

			query = "DELETE FROM myfuel_balance where uid = @uid"
			MySQL.Sync.execute(query,{					
				['@uid'] = data[i].uid
			})
		end
	end 
end 