let locale = 'en' //just fallback...
let Translations;

let fuelview = undefined;
let ownerview = undefined;
let buyview = undefined;
let saleview = undefined;
let driverview = undefined;


$(document).ready(function(){

	

	$( "#item-amount-modal-cancel" ).click(function() {
		$("#item-amount-modal").modal("hide");

		let btnId = $("#item-amount-modal").attr("data-clickedbtn");

		$("#"+btnId).prop("disabled",false);

	});
	$( "#item-amount-modal-save" ).click(function() {
		let btnId = $("#item-amount-modal").attr("data-clickedbtn");
		FillUpByItem($("#"+btnId));

	});
	$( "#substract_one" ).click(function() {
		fuelview.SubOneFillToPrice();
	});
	$( "#add_one" ).click(function() {
		fuelview.AddOneFillToPrice();
	});

	$( "#amount_max" ).keyup(function() {
		fuelview.SetFillToPrice(1 * $(this).val());
	});

	$( "#btn_fill_up_to_price" ).click(function() {
		fuelview.StartFilling("toprice");
	});

	$( "#btn_fill_up_to_max" ).click(function() {
		fuelview.StartFilling("max");
	});

	$( "#stop_filling" ).click(function() {
		fuelview.StopFilling();
	});

	$( "#gas_Station_buy_cancel" ).click(function() {
		$.post('https://myFuel/close', JSON.stringify({})); 
	});

	$( "#closewindow" ).click(function() {
		$.post('https://myFuel/close', JSON.stringify({})); 
	});


	$( "#no_fuel_view_ok" ).click(function() {
		$.post('https://myFuel/close', JSON.stringify({})); 
	});

	$( "#gas_Station_buy" ).click(function() {
		buyview.Buy();
	});

	$("#warehouse_updates_levelup").click(function() {
		ownerview.WarehouseLevelUp();
	});
	$("#fueloverview_price_newprice").keydown(function(e) {
		if(e.key == "+" || e.key == "-" || e.key == ","){
			e.preventDefault();
		}
	});
	$("#fueloverview_price_newprice").keyup(function() {
		ownerview.handlePriceChange();
	});

	$("#fueloverview_stock_tobuy").keydown(function(e) {
		if(e.key == "+" || e.key == "-" || e.key == "." || e.key == ","){
			e.preventDefault();
		}
	});

	$("#fueloverview_stock_tobuy").keyup(function() {
		ownerview.handleImportAmount();
	});

	
	$("#overview_checkout_amount").keydown(function(e) {
		if(e.key == "+" || e.key == "-" || e.key == "." || e.key == ","){
			e.preventDefault();
		}
	});
	$("#overview_checkout_amount").keyup(function() {
		ownerview.handleCheckoutAmount();
	});

	$("#list_overview").on("click", function(){
		ownerview.OpenPageOverview($(this));
	});

	$("#list_upgrades").click(function(){
		ownerview.openUpgradePage($(this));
	});

	$("#list_checkout").click(function(){
		ownerview.openCheckoutPage($(this));
	});

	$("#list_cashbook").click(function(){
		ownerview.openCashbookPage($(this));
	});

	$("#fueloverview_price_save").click(function(){
		ownerview.SaveFuelPrice();
	});

	$("#fueloverview_do_order").click(function(){
		ownerview.BuyFuel();
	});

	$("#overview_checkout_deposit").click(function(){
		ownerview.Deposit();
	});

	$("#overview_checkout_payout").click(function(){
		ownerview.Payout();
	});

	$("#fueloverview_do_mission").click(function(){
		ownerview.StartMission();
	});

	$("#admin_view_sale").click(function(){
		ownerview.hide();
		saleview.show();
	});

	$("#gas_Station_sell_cancel").click(function(){
		saleview.hide();
		ownerview.show();
	});

	$("#gas_Station_sell").click(function(){
		saleview.Sell();
	});


	$("#cash_money").click(function(){
		fuelview.SetPaymenttype("cash_money")
	});

	$("#bank_money").click(function(){		
		fuelview.SetPaymenttype("bank_money")
	});

	$("#element_fueloverview_importitems_0").click(function(){		
		showItemAmountInput($(this))
	});
	$("#element_fueloverview_importitems_1").click(function(){		
		showItemAmountInput($(this))
	});
	$("#element_fueloverview_importitems_2").click(function(){		
		showItemAmountInput($(this))
	});

	

	$("#item-amount-modal-amount").keydown(function(e) {
		if(e.key == "+" || e.key == "-" || e.key == "." || e.key == ","){
			e.preventDefault();
		}
	});

	$("#item-amount-modal-amount").keyup(function() {
		let btnid = $("#item-amount-modal").attr("data-clickedbtn");

		let maxAmount = ownerview.GetMaxAmountItemsToUse($("#"+btnid));
		let curAmount = $(this).val();

		if(curAmount > maxAmount){
			$(this).val(maxAmount);
		}
	});




	window.addEventListener('message', function( event ) {

		

		if(event.data.message == "show_driverview" || event.data.message == "show_fillup_menu" || event.data.message == "show_buy_menu" || event.data.message == "show_owner_menu"){
			hideAllModules();
			HandleEvents(event);			
		}
		else if(event.data.message == "hide_driverview"){
			if(driverview !== undefined){
				driverview.hide();
			}
		}
		else if(event.data.message == "updateOwnerView"){
			if(event.data.updateDetails == "warehouselevel"){
				ownerview.SetAvailableMoney(event.data.data.availableMoney);
				ownerview.SetWarehouseLevel(event.data.data.warehouselevel);
				ownerview.SetIncome(event.data.data.info[0].income);
				ownerview.SetExpenses(event.data.data.info[0].expenses);
				ownerview.SetCashBookData(event.data.data.cashbook);
				ownerview.SetPlayerMoney(event.data.data.playermoney);
			}
			else if(event.data.updateDetails == "fuel_price"){
				ownerview.SetAvailableMoney(event.data.data.availableMoney);
				ownerview.SetFuelPrice(event.data.data.fuel_type, event.data.data.new_price);
				ownerview.SetPlayerMoney(event.data.data.playermoney);
			}
			else if(event.data.updateDetails == "boughtFuel"){
				
				ownerview.SetAvailableMoney(event.data.data.availableMoney);
				ownerview.SetIncome(event.data.data.info[0].income);
				ownerview.SetExpenses(event.data.data.info[0].expenses);
				ownerview.SetCashBookData(event.data.data.cashbook);
				ownerview.SetPlayerMoney(event.data.data.playermoney);
				
				ownerview.SetFuelStock(event.data.data.fuel_type, event.data.data.new_current_stock);
			}
			else if(event.data.updateDetails == "TransferedMoney"){
				ownerview.SetAvailableMoney(event.data.data.availableMoney);
				ownerview.SetIncome(event.data.data.info[0].income);
				ownerview.SetExpenses(event.data.data.info[0].expenses);
				ownerview.SetCashBookData(event.data.data.cashbook);
				ownerview.SetPlayerMoney(event.data.data.playermoney);
			}
			else if(event.data.updateDetails == "itemButtonUpdate"){

				$("#item-amount-modal").modal("hide")

				ownerview.HandleItemButton(event.data.data)
			}
		}

		else{
			hideAllModules();

			if($("#maindiv").is(":visible")){
				$("#maindiv").fadeOut();
			}
			if($("body").is(":visible")){
				$("body").fadeOut();
			}
		}
	});
});


function HandleEvents(event){
	if(Translations === undefined){
		fetch(`https://myFuel/getTranslations`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json; charset=UTF-8',
			},
			body: JSON.stringify({	
			})
		}).then((response) => {
			response.json().then(function(obj){
				HandleEventsResponses(obj.translations, obj.locale, event);
			});
		});
	}
	else{
		HandleEventsResponses(undefined, undefined, event);
	}


	
}


function HandleEventsResponses(translations, in_locale, event){
	if(translations !== undefined){
		Translations = translations;
	}
	if(in_locale !== undefined){
		locale = in_locale;
	}

	if(event.data.message == "show_driverview"){
		if(driverview === undefined){
			driverview = new DriverView();
			driverview.SetShowFuelInPercentage(event.data.ShowFuelInPercentage);
			driverview.SetRemoveHudBackground(event.data.HUDRemoveBackground);
			driverview.SetLocation(event.data.HudLocation);
			driverview.SetExtraMargins(event.data.HUDextraMargins);
			driverview.SetShowSpeed(event.data.ShowSpeed);
			driverview.SetSpeedUnit(event.data.SpeedUnit);
			driverview.SetFuelCritical(event.data.HUDFuelCritical);
			driverview.SetFuelWarning(event.data.HUDFuelWarning);	
		}

		
		driverview.SetShowFuelLevel(event.data.ShowFuelLevel);
		driverview.SetCurrentSpeed(event.data.speed);
		driverview.SetCurrentFuellevel(event.data.fuel_level, event.data.fuel_in_unit);	

		if($("#car_div").is(":hidden")){
			driverview.show();
		}
		if($("body").is(":hidden")){
			$("body").fadeIn();
		}
	}
	else if(event.data.message == "show_buy_menu"){
		if(buyview === undefined){
			buyview = new BuyView(in_locale);
		}
		
		setLogo(event.data.logo_name)
		buyview.SetPrice(event.data.price);
		buyview.SetPlayerMoney(event.data.playermoney);
		buyview.SetGasStationID(event.data.gas_station_id);
		buyview.show();

		if($("#maindiv").is(":hidden")){
			$("#maindiv").fadeIn();
		}
		if($("body").is(":hidden")){
			$("body").fadeIn();
		}
	}
	else if(event.data.message == "show_owner_menu"){
		if(saleview === undefined){
			saleview = new SaleView(locale);
		}
		ownerview = new OwnerView(locale);
		setLogo(event.data.data.info[0].logo_name)	
		saleview.SetGasStationID(event.data.data.gas_station_id);
		ownerview.SetGasStationID(event.data.data.gas_station_id);
		ownerview.SetPossibleWareHouseLevels(event.data.data.possible_warehouse_levels);
		ownerview.SetWarehouseLevel(event.data.data.info[0].warehouse_level);
		ownerview.SetImportPercentage(event.data.data.import_percentage);
		ownerview.SetMissionPercentage(event.data.data.mission_percentage);
		ownerview.SetAvailableMoney(event.data.data.availableMoney);
		ownerview.SetPlayerMoney(event.data.data.playermoney);
		ownerview.SetIncome(event.data.data.info[0].income);
		ownerview.SetExpenses(event.data.data.info[0].expenses);
		ownerview.SetCashBookMaxAmountRecords(event.data.data.cashbook_max_rows);
		ownerview.SetCashBookData(event.data.data.cashbook);		

		for(let i=0; i<event.data.data.self_fuel_info.length; i++){
			ownerview.AddFuelType(
				event.data.data.self_fuel_info[i].fuel_type,
				event.data.data.self_fuel_info[i].stock,
				event.data.data.self_fuel_info[i].price_per_liter,
				event.data.data.self_fuel_info[i].competitor_min_price,
				event.data.data.self_fuel_info[i].competitor_max_price,
				event.data.data.self_fuel_info[i].competitor_avg_price,
				event.data.data.self_fuel_info[i].allowImport,
				event.data.data.self_fuel_info[i].allowMission,
				event.data.data.self_fuel_info[i].allowFillUpByItem,
				event.data.data.self_fuel_info[i].fillUpitems
			)
		}
		ownerview.show();
		if($("#maindiv").is(":hidden")){
			$("#maindiv").fadeIn();
		}
		if($("body").is(":hidden")){
			$("body").fadeIn();
		}
	}
	else if(event.data.message == "show_fillup_menu"){

		setLogo(event.data.data.logoname)

		fuelview = new FuelView();

		if(event.data.data.database.length > 0){
			fuelview.SetTypeValue(event.data.data.database[0].fuel_type);
			fuelview.SetPriceValue(event.data.data.database[0].price_per_liter);
			fuelview.SetStockValue(event.data.data.database[0].stock);
			fuelview.SetMaxFuel(event.data.maxCapacity);
			fuelview.SetCurrentFuel((event.data.maxCapacity/100) * event.data.currentLiter);

			fuelview.SetPlayerBankMoney(event.data.data.bank_money);
			fuelview.SetPlayerCashMoney(event.data.data.cash_money);
			fuelview.SetFuelTickInterval(event.data.fuel_tick_interval);
			fuelview.SetPaymenttype("bank_money");
			fuelview.SetSocietyData(event.data.is_society_veh, event.data.society_name);
			
			fuelview.show();

			if($("#maindiv").is(":hidden")){
				$("#maindiv").fadeIn();
			}
			if($("body").is(":hidden")){
				$("body").fadeIn();
			}
		}
		else{
			$("#no_fuel_view_headline").html(Translations[event.data.data.wanted_fuel_type]);
			$("#no_fuel_view_infotext").html(Translations.no_fuel_view_infotext);
			
			if($("#no_fuel_view").is(":hidden")){
				$("#no_fuel_view").show();
			}
			if($("#maindiv").is(":hidden")){
				$("#maindiv").fadeIn();
			}
			if($("body").is(":hidden")){
				$("body").fadeIn();
			}
		}
	}
}


function setLogo(logoname){
	$("#companylogo_fillview").attr("src", "./gfx/" + logoname + ".png")
	$("#companylogo_adminview").attr("src", "./gfx/" + logoname + ".png")
	$("#companylogo_buyview").attr("src", "./gfx/" + logoname + ".png")
	$("#companylogo_saleview").attr("src", "./gfx/" + logoname + ".png")
	$("#no_fuel_view_infotext").attr("src", "./gfx/" + logoname + ".png")
}

function hideAllModules(){
	if($("#buy_view").is(":visible")){
		$("#buy_view").hide();
	}
	if($("#filling_up_view").is(":visible")){
		$("#filling_up_view").hide();
	}
	if($("#admin_view").is(":visible")){
		$("#admin_view").hide();
	}
	if($("#sale_view").is(":visible")){
		$("#sale_view").hide();
	}
	if($("#no_fuel_view").is(":visible")){
		$("#no_fuel_view").hide();
	}
}

function FillUpByItem(obj){
	obj.html(obj.attr("data-item-label") + " (" + obj.attr("data-item-amount") + "x) ...");

	$("#item-amount-modal-cancel").prop("disabled", true);
	$("#item-amount-modal-save").prop("disabled", true);

	$.post('https://myFuel/OwnerFillUpByItem', JSON.stringify({ 
		gas_station_id: obj.attr("data-gas-station-id")
		,fuel_type: obj.attr("data-fuel-type")
		,itemname: obj.attr("data-item-name")
		,itemlabel: obj.attr("data-item-label")
		,fillup_amount: obj.attr("data-item-fillup-liters")
		,element_id: obj.attr("id")
		,amount: 1*$("#item-amount-modal-amount").val()
	}));
}

function showItemAmountInput(obj){
	$("#item-amount-modal-cancel").prop("disabled", false);
	$("#item-amount-modal-save").prop("disabled", false);


	$("#item-amount-modal").modal("show");

	$("#item-amount-modal").attr("data-clickedbtn", obj.attr("id"));

	let maxVal = ownerview.GetMaxAmountItemsToUse(obj);
	if(maxVal > 1*obj.attr("data-item-amount")){
		maxVal = 1*obj.attr("data-item-amount");
	}

	$("#item-amount-modal-amount").val(maxVal);

	let itemlabel = obj.attr("data-item-label");

	$("#item-amount-modal-title").html(itemlabel);

	$("#item-amount-modal-cancel").html(Translations.cancel);
	$("#item-amount-modal-save").html(Translations.use_item);


	obj.prop("disabled", true);
	//obj.html(obj.attr("data-item-label") + " (" + obj.attr("data-item-amount") + "x)");
}

