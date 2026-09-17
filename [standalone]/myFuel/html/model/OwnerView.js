function OwnerView(locale){
	this.isInit = true;
    this.Locale = locale;
    this.warehouselevel = 0;
    this.GasStationID = 0;
    this.AvailableMoney = 0;
    this.PlayerMoney = 0;

    this.fuel_types = [];
    this.warehouselevels = [];
    this.NumberFormatter = new NumberFormat(this.Locale);

    this.Income = 0;
    this.Expenses = 0;
    this.CashBookMaxAmountRecords = 0;
    this.ImportPercentage = 100;
    this.MissionPercentage = 100;
    this.BuyFuelDirectlyFromPlayer = false;

    this.CashbookData = [];

    //this.warehouselevels = new WarehouseLevels();
    this.SetWarehouseLevel(0);

    $("#fuel_type_entries").children().remove();

    $("#admin_view_sale").html(Translations["sale_view_headline"]);
    $("#warehouse_updates_headline").html(Translations["warehouse"]);

    $("#list_overview").html('<i class="fas fa-database"></i> ' + Translations["overview"]);
    $("#list_upgrades").html('<i class="fas fa-level-up-alt"></i> ' + Translations["upgrades"]);
    $("#list_checkout").html('<i class="fas fa-dollar-sign"></i> ' + Translations["checkout"]);
    $("#list_cashbook").html('<i class="fas fa-exchange-alt"></i> ' + Translations["cashbook"]);
    $("#headlne_adminview").html(Translations["headlne_adminview"]);

}

OwnerView.prototype.SetGasStationID = function(value){
    this.GasStationID = value;
}
OwnerView.prototype.SetCashBookMaxAmountRecords = function(value){
    this.CashBookMaxAmountRecords = value;
}
OwnerView.prototype.SetCashBookData = function(value){
    this.CashbookData = value;
}
OwnerView.prototype.SetIncome = function(value){
    this.Income = value;
    $("#overview_checkout_currentcash").html(this.NumberFormatter.getHTMLMoney(this.Income - this.Expenses));
}
OwnerView.prototype.SetExpenses = function(value){
    this.Expenses = value;
    $("#overview_checkout_currentcash").html(this.NumberFormatter.getHTMLMoney(this.Income - this.Expenses));
}
OwnerView.prototype.SetImportPercentage = function(value){
    this.ImportPercentage = value;
}
OwnerView.prototype.SetMissionPercentage = function(value){
    this.MissionPercentage = value;
}

OwnerView.prototype.SetPossibleWareHouseLevels = function(value){
    this.warehouselevels = value;
}
OwnerView.prototype.SetAvailableMoney = function(value){
    this.AvailableMoney = value;
    this.HandleWarehouseupdateButton();
}
OwnerView.prototype.SetPlayerMoney = function(value){
    this.PlayerMoney = value;
    this.HandleWarehouseupdateButton();
}
OwnerView.prototype.SetWarehouseLevel = function(value){
    this.warehouselevel = value;

    $("#warehouse_updates_currentlevel").children().remove();
    $("#warehouse_updates_information").children().remove();
    $("#warehouse_updates_information").html("");

    

    for(let i=0; i<Object.keys(this.warehouselevels).length;i++){
        if(i > 0){
            if(this.warehouselevel >= i){

                $("#warehouse_updates_currentlevel").append('<i class="fas fa-star"></i>');
            }
            else{
                $("#warehouse_updates_currentlevel").append('<i class="far fa-star"></i>');
            }

            $("#warehouse_updates_information").append(
                (this.warehouselevel >= i ? "<s>" : "")+
                "Level " + i + " - " + this.warehouselevels[i].capacity + " ($" + this.NumberFormatter.getFormatted(this.warehouselevels[i].upgradePrice,0) + ")" + 
                (this.warehouselevel >= i ? "</s>" : "") + 
                "<br>"
            )
        }
    }

    this.HandleWarehouseupdateButton();
}

OwnerView.prototype.HandleWarehouseupdateButton = function(){
    let price = this.GetWarehouseUpdatePrice();

    if(price !== undefined){
        price = " ($"+ this.NumberFormatter.getFormatted(price,0)+")";
    }
    else{
        price = "";
    }

    $("#warehouse_updates_levelup").html(
        Translations["upgrade"] + price
    );
    let updateDisabled = this.warehouselevel >= Object.keys(this.warehouselevels).length -1;
    if(updateDisabled == false){
        updateDisabled = this.AvailableMoney < this.GetWarehouseUpdatePrice();
    }

    $("#warehouse_updates_levelup").prop("disabled", updateDisabled);
}


OwnerView.prototype.GetWarehouseUpdatePrice = function(){
    let nextupdateprice = undefined;

    if(this.warehouselevel < Object.keys(this.warehouselevels).length -1 ){
        nextupdateprice = this.warehouselevels[this.warehouselevel+1].upgradePrice;
    }
    return nextupdateprice;
}


OwnerView.prototype.WarehouseLevelUp = function(){
    $("#warehouse_updates_levelup").html(
        Translations["ownerview_save"]
    );
    $("#warehouse_updates_levelup").prop("disabled", true);

    $.post('https://myFuel/LevelupWarehouse', JSON.stringify(
        { 
            gas_station_id: this.GasStationID
            ,amounttopay: this.GetWarehouseUpdatePrice()
            ,new_level: this.warehouselevel+1
        }
    ));
}

OwnerView.prototype.show = function(){
    $("#admin_view").show();
    $("#maindiv").fadeIn();
    $("body").fadeIn();
    
    this.hideSubpages();

    if(this.isInit){
        this.OpenPageOverview($("#list_overview"));
        //fillNavbar();
        //setObjectSelected($("#list_overview"));
        //openOverviewPage();
    }
}
OwnerView.prototype.hide = function(){
    $("#admin_view").hide();
}

OwnerView.prototype.hideSubpages = function(){
    $("#adminpanel_right").children().hide();
}

/**/
OwnerView.prototype.getMaxStock = function(values){
    

    if(this.warehouselevels[this.warehouselevel] !== undefined){
        return this.warehouselevels[this.warehouselevel].capacity;
    }
    else{
        return this.warehouselevels[Object.keys(this.warehouselevels).length-1].capacity;
    }
}

OwnerView.prototype.AddFuelType = function(fuel_type, in_stock, in_price,competitor_min_price, competitor_max_price, competitor_avg_price, allowImport, allowMission, allowFillUpByItem, fillupItems){
    this.fuel_types.push(new Owner_FuelType(
        this.Locale,
        this.GasStationID,
        fuel_type,
        in_stock,
        this.getMaxStock(),
        in_price,
        competitor_min_price,
        competitor_max_price,
        competitor_avg_price,
        this.ImportPercentage,
        allowImport,
        allowMission,
        allowFillUpByItem,
        fillupItems,
        this.MissionPercentage
    ))
}


OwnerView.prototype.openCashbookPage = function(objectToSelect){
    this.hideSubpages();
    this.setObjectSelected(objectToSelect);
    
    $("#overview_cashbook_table > tbody").children().remove();
	$("#overview_cashbook_th_type").html(Translations["type"])
	$("#overview_cashbook_th_detail").html(Translations["detail"])
	$("#overview_cashbook_th_amount").html(Translations["amount"])
	$("#overview_cashbook_th_money").html(Translations["checkout_amount"])


    $("#cashbook_note").html(
        "<b>" + Translations["note"] + ":</b> " + Translations["only_x_records"].replace("@@amountrecords@@",this.CashBookMaxAmountRecords)
    );

	for(let i=0; i < Object.keys(this.CashbookData).length; i++){
		let color = "green";
		let fontweight = "font-weight:bold;"
		let prefix = "+$";

		if(this.CashbookData[i].costtype == "expenses" || this.CashbookData[i].costtype == "payout" || this.CashbookData[i].costtype == "Upgrade"){
			color = "red"
			fontweight = ""
			prefix = "-$"
		} 

		let tablerow = "<tr>";

		tablerow += "<td style = \"color:"+color+";"+fontweight+"\">"
		tablerow += Translations[this.CashbookData[i].costtype]
		tablerow += "</td>"

		tablerow += "<td>"
		tablerow += Translations[this.CashbookData[i].fuel_type]
		tablerow += "</td>"

		tablerow += "<td style = \"color:text-align:right;\">"
		tablerow += this.NumberFormatter.getFormatted(this.CashbookData[i].fuel_amount)
		tablerow += "</td>"

		tablerow += "<td style = \"color:"+color+";"+fontweight+";text-align:right;\">"
		tablerow += prefix + this.NumberFormatter.getFormatted(this.CashbookData[i].totalprice)
		tablerow += "</td>"

		tablerow += "</tr>";

		$("#overview_cashbook_table > tbody").append(tablerow);
	}
	
	$("#overview_cashbook").show();
	$("#id_admin_footer").show();
}
OwnerView.prototype.OpenPageOverview = function(objectToSelect){
    this.hideSubpages();

    this.setObjectSelected(objectToSelect);

	$("#overview_fuel_types").children().remove();

	$("#overview_balance_name").html(Translations["balance"]);
	$("#overview_income_name").html(Translations["income"]);
	$("#overview_expenses_name").html(Translations["expenses"]);

	$("#overview_balance_value").html(this.NumberFormatter.getHTMLMoney(this.Income - this.Expenses));

	$("#overview_income_value").html(this.NumberFormatter.getHTMLMoney(this.Income));
	$("#overview_expenses_value").html(this.NumberFormatter.getHTMLMoney(-1*this.Expenses));	

    for(let i=0; i<this.fuel_types.length; i++){
        this.fuel_types[i].SetMaxStock(this.getMaxStock()); 
        this.fuel_types[i].CreateOverViewField();
    }

	$("#div_overview").show();
}
OwnerView.prototype.openUpgradePage = function(objectToSelect){
    this.hideSubpages();
    this.setObjectSelected(objectToSelect);
    $("#overview_upgrades").show();
}

OwnerView.prototype.openFuelOverviewPage = function(object, fuel_type){
	this.hideSubpages();
	this.setObjectSelected($("#" + object.id));

	$("#overview_fuel").show();

	//here start set translations
	$("#fueloverview_do_mission").html(Translations["fueloverview_do_mission"])
	$("#fueloverview_headline").html(Translations[fuel_type])
	$("#fueloverview_price_labelcurrentprice").html(Translations["currentprice"]);
	$("#fueloverview_price_labelnewprice").html(Translations["newprice"]);
	$("#fueloverview_price_save").html(Translations["save"]);
	$("#overview_fuel_competitor_min_name").html(Translations["competitor_min_price"]);
	$("#overview_fuel_competitor_max_name").html(Translations["competitor_max_price"]);
	$("#overview_fuel_competitor_avarage_name").html(Translations["competitor_avarage_price"]);
	$("#fueloverview_stock_labeltobuy").html(Translations["amount_import"]);
	$("#fueloverview_stock_labeltobuy_price").html(Translations["price"]);
	$("#fueloverview_do_order").html(Translations["doorder"]);

    
    $("#fueloverview_price_save").prop("disabled", )

    this.CurrentFuelSelected = undefined;


    for(let i=0; i<this.fuel_types.length; i++){
        this.fuel_types[i].SetMaxStock(this.getMaxStock());         
        if(this.fuel_types[i].Type == fuel_type){

            this.CurrentFuelSelected = this.fuel_types[i];

            this.fuel_types[i].handleDetailsPage();

            
            this.fuel_types[i].handleMissionButton(this.AvailableMoney)

        }
    }

    this.handlePriceChange();
    this.handleImportAmount();
	
	//$("#fueloverview_currentpercentage").html(GasStationData[fuel_information][fuel_type].stock)
	
}

OwnerView.prototype.handlePriceChange = function(){

    $("#fueloverview_price_save").prop("disabled", $("#fueloverview_price_newprice").val() == "" || Math.round( $("#fueloverview_price_currentprice").val()*100) == Math.round($("#fueloverview_price_newprice").val()*100));
}

OwnerView.prototype.handleImportAmount = function(){

    this.CurrentFuelSelected.handleImportAmount();

    $("#fueloverview_do_order").prop("disabled", 
        $("#fueloverview_stock_tobuy").val() == 0 || $("#fueloverview_stock_tobuy").val() == "" || $("#fueloverview_stock_tobuy_price").val() > this.AvailableMoney
    );
}
OwnerView.prototype.handleMission = function(){

    this.CurrentFuelSelected.handleImportAmount();

    $("#fueloverview_do_order").prop("disabled", 
        $("#fueloverview_stock_tobuy").val() == 0 || $("#fueloverview_stock_tobuy").val() == "" || $("#fueloverview_stock_tobuy_price").val() > this.AvailableMoney
    );
}
OwnerView.prototype.GetMaxAmountItemsToUse = function(button){
    return this.CurrentFuelSelected.GetMaxAmountItemsToUse(button);
}


OwnerView.prototype.openCheckoutPage = function(objectToSelect){
	this.hideSubpages();
    this.setObjectSelected(objectToSelect);
	
	$("#overview_checkout").show();
	
    $("#overview_checkout_currentcash").html(this.NumberFormatter.getHTMLMoney(this.Income - this.Expenses));

	$("#overview_checkout_amount_label").html(Translations["checkout_amount"]);
	$("#overview_checkout_deposit").html(Translations["deposit"]);
	$("#overview_checkout_payout").html(Translations["payout"]);
	$("#overview_checkout_amount").val("");

    this.handleCheckoutAmount();


}

OwnerView.prototype.handleCheckoutAmount = function(){
	$("#overview_checkout_deposit").prop("disabled", 
        $("#overview_checkout_amount").val() > this.PlayerMoney || $("#overview_checkout_amount").val() == ""
    );
	$("#overview_checkout_payout").prop("disabled", 
        $("#overview_checkout_amount").val() > this.Income-this.Expenses || $("#overview_checkout_amount").val() == ""
    );
}




OwnerView.prototype.setObjectSelected = function(obj){
	this.resetSelectedClass();
	obj.addClass("listselected")
}

OwnerView.prototype.SetFuelPrice = function(fuel_type, new_price){
    for(let i=0; i<this.fuel_types.length; i++){
        if(this.fuel_types[i].Type == fuel_type){
            this.fuel_types[i].SetCurrentPrice(new_price);
        }
    }
}

OwnerView.prototype.SetFuelStock = function(fuel_type, new_stock){
    for(let i=0; i<this.fuel_types.length; i++){
        if(this.fuel_types[i].Type == fuel_type){
            this.fuel_types[i].SetCurrentStock(new_stock);
            $("#fueloverview_stock_tobuy").val("");
            this.fuel_types[i].handleImportAmount();
        }
    }
}

OwnerView.prototype.resetSelectedClass = function(){
	$("#static_admin_entries").children().removeClass("listselected");
	$("#fuel_type_entries").children().removeClass("listselected");
}
OwnerView.prototype.SaveFuelPrice = function(){
    $.post('https://myFuel/SaveFuelPrice', JSON.stringify(
        { 
            gas_station_id: this.GasStationID
            ,fuel_type: this.CurrentFuelSelected.Type
            ,new_price: (1*$("#fueloverview_price_newprice").val()).toFixed(2)
        }
    ));
}
OwnerView.prototype.BuyFuel = function(){
    $.post('https://myFuel/BuyFuel', JSON.stringify(
        { 
            gas_station_id: this.GasStationID
            ,fuel_type: this.CurrentFuelSelected.Type
            ,fuel_singleprice: this.CurrentFuelSelected.getImportPrice()
            ,fuel_price: $("#fueloverview_stock_tobuy_price").val()
            ,fuel_amount: $("#fueloverview_stock_tobuy").val()
        }
    ));
}

OwnerView.prototype.DepositMoney = function(){
    $.post('https://myFuel/BuyFuel', JSON.stringify(
        { 
            gas_station_id: this.GasStationID
            ,fuel_type: this.CurrentFuelSelected.Type
            ,fuel_singleprice: this.CurrentFuelSelected.getImportPrice()
            ,fuel_price: $("#fueloverview_stock_tobuy_price").val()
            ,fuel_amount: $("#fueloverview_stock_tobuy").val()
        }
    ));
}


OwnerView.prototype.Deposit = function(){
    $.post('https://myFuel/MoneyTransfer', JSON.stringify(
        { 
            gas_station_id: this.GasStationID
            ,money_amount: $("#overview_checkout_amount").val()
            ,tranfer_type: "deposit"
        }
    ));
	$("#overview_checkout_amount").val("");
    this.handleCheckoutAmount();
}

OwnerView.prototype.Payout = function(){	
    $.post('https://myFuel/MoneyTransfer', JSON.stringify(
        { 
            gas_station_id: this.GasStationID
            ,money_amount: $("#overview_checkout_amount").val()
            ,tranfer_type: "payout"
        }
    ));
	$("#overview_checkout_amount").val("");
    this.handleCheckoutAmount();
}

OwnerView.prototype.StartMission = function(){	
    $.post('https://myFuel/StartMission', JSON.stringify(
        { 
            gas_station_id: this.GasStationID
            ,fuel_type: this.CurrentFuelSelected.Type
            ,stock_to_set: this.getMaxStock()
            ,price: this.CurrentFuelSelected.getMissionPrice()
        }
    ));
	$("#overview_checkout_amount").val("");
    this.handleCheckoutAmount();
}

OwnerView.prototype.HandleItemButton = function(data){	
    
    if(data.fuel_type == this.CurrentFuelSelected.Type){
        if(data.stock !== undefined){
            this.CurrentFuelSelected.SetCurrentStock(data.stock);
            this.CurrentFuelSelected.HandleItemButton(data.ui_element_id, data.amount_items_remain, false);
        }
    }
    
}