function FuelView(locale){
	this.Type;
	this.Price;
	this.Stock;
	this.CurrentFuel = 0;
	this.MaxFuel = 0;
	this.fillToPrice = 0;
    this.Locale = locale;
    this.PlayerMoney = 0;
    this.PlayerBankMoney = 0;
    this.PlayerCashMoney = 0;
    this.FuelTickInterval = 500;

    this.isSociety = false;
    this.SocietyName = "";

    this.Interval = undefined;
    this.LitersToFillUp = 0;
    this.LitersFilledUp = 0;

    this.Progressbar = new Progress($("#filling_progress"));
    this.NumFormat = new NumberFormat(this.Locale);

	this.SetHeader(Translations["fill_up_vehicle"]);
	$("#label_bank_money").html(Translations["bank_money"]);
	$("#label_cash_money").html(Translations["cash_money"]);
	this.SetLabels();
	this.SetTypeLabel(Translations["fuel_type"]);
	this.SetPriceLabel(Translations["price"]);
	this.SetStockLabel(Translations["in_stock"]);

    
    document.getElementById("fillingview_paymentmethod_info_society").innerHTML = Translations["society_pays"];

}

FuelView.prototype.show = function(){
    $("#filling_up_view").show();
}
FuelView.prototype.hide = function(){
    $("#filling_up_view").hide();
}

FuelView.prototype.SetHeader = function(value){
    $("#right_headline").html(value);
}
FuelView.prototype.SetLabels = function(){
    $("#label_fill_up_to_price").html(Translations["fill_up_to_price"]);
    $("#btn_fill_up_to_price").html(Translations["btn_fill_up_to_price"]);
    $("#btn_fill_up_to_max").html(Translations["btn_fill_up_to_max"]);
    $("#stop_filling").html(Translations["close"]); //close | stop_filling


}

FuelView.prototype.SetTypeLabel = function(value){
    $("#filling_up_view_label_fueltype").html(value);
}

FuelView.prototype.SetTypeValue = function(value){
    this.Type = value;
    $("#filling_up_view_value_fueltype").html(Translations[value]);
    $("#filling_up_view_fuel_type").html(Translations[value]);

    this.SetUnitLabel(Translations[value + "_unit"]);

    if(value == "electricity"){
        $("#id_fuelicon").html('<i class="fas fa-charging-station"></i>');
    }
    else{
        $("#id_fuelicon").html('<i class="fas fa-gas-pump"></i>');
    }

}

FuelView.prototype.SetUnitLabel = function(value){
    $("#current_liter_unit").html(value);
}
FuelView.prototype.GetUnit = function(value){
	this.Unit = value;
}
FuelView.prototype.SetPriceLabel = function(value){
	$("#filling_up_view_label_price").html(value);
}
FuelView.prototype.SetPriceValue = function(value){
	this.Price = value;
	$("#filling_up_view_value_price").html("$" + this.NumFormat.getFormatted(value,2));
}
FuelView.prototype.GetPrice = function(value){
	this.Price = value;
}
FuelView.prototype.SetStockLabel = function(value){
	this.Stock = value;
    $("#filling_up_view_label_stock").html(value);
}
FuelView.prototype.SetStockValue = function(value){
	this.Stock = value;

    if(this.Stock > 0){
        $("#filling_up_view_value_stock").html(this.NumFormat.getFormatted(value,0) + " " + Translations[this.Type + "_unit"]);
        this.SetInputsDisabled(false);
    }
    else{
        $("#filling_up_view_value_stock").html(Translations.out_of_stock);
        this.SetInputsDisabled(true);
    }
}

FuelView.prototype.SetInputsDisabled = function(value){
    $("#substract_one").prop("disabled", value);
    $("#amount_max").prop("disabled", value);
    $("#add_one").prop("disabled", value);
    $("#bank_money").prop("disabled", value);
    $("#cash_money").prop("disabled", value);
}

FuelView.prototype.GetStock = function(){
	return this.Stock;
}
FuelView.prototype.SetCurrentFuel = function(value){
	this.CurrentFuel = Math.floor(value);

    if(this.CurrentFuel > this.MaxFuel){
        this.CurrentFuel = this.MaxFuel;
    }

    $("#current_liter_from").html(this.CurrentFuel);

    if(this.CurrentFuel < this.MaxFuel){
        let tempprice = Math.ceil((this.MaxFuel-this.CurrentFuel) * this.Price);
        
        $("#btn_fill_up_to_max").html(Translations["btn_fill_up_to_max"] + " (" + tempprice + " $)");
    }
    else{
        $("#btn_fill_up_to_max").html(Translations["btn_fill_up_to_max"]);
    }


    this.UpdateFuelPercentage();
}
FuelView.prototype.GetCurrentFuel = function(){
	return this.CurrentFuel;
}
FuelView.prototype.SetMaxFuel = function(value){
	this.MaxFuel = value;
    $("#current_liter_to").html(value);
    this.UpdateFuelPercentage();

    if(this.CurrentFuel < this.MaxFuel){
        let tempprice = Math.ceil((this.MaxFuel-this.CurrentFuel) * this.Price);
        
        $("#btn_fill_up_to_max").prop("disabled", tempprice > this.PlayerMoney || this.Stock <= 0);
        $("#btn_fill_up_to_max").html(Translations["btn_fill_up_to_max"] + " (" + tempprice + " $)");
    }
    else{
        $("#btn_fill_up_to_max").html(Translations["btn_fill_up_to_max"]);
    }
}
FuelView.prototype.GetMaxFuel = function(){
	return this.MaxFuel;
}
FuelView.prototype.SetFuelTickInterval = function(value){
	this.FuelTickInterval = value;
}
FuelView.prototype.SetFillToPrice = function(value){
	this.fillToPrice = value;    

    


    $("#substract_one").prop('disabled', this.fillToPrice <=0 );
    //$("#btn_fill_up_to_price").prop('disabled', this.fillToPrice <= 0 || this.fillToPrice>this.PlayerMoney);

    $("#amount_max").val(this.fillToPrice <= 0 ? "" : this.fillToPrice);

    if(this.fillToPrice > 0){
        this.fillToPriceLiters = Math.round(this.fillToPrice / this.Price);

        //$("#btn_fill_up_to_price").prop('disabled', this.fillToPriceLiters < 1);
        $("#btn_fill_up_to_price").html(Translations["btn_fill_up_to_price"] + " (" + this.fillToPriceLiters + " " + Translations[this.Type + "_unit"] + ")");
    }
    else{
        this.fillToPriceLiters = 0;
        $("#btn_fill_up_to_price").html(Translations["btn_fill_up_to_price"]);
    }

    this.handleButtons();

}
FuelView.prototype.SubOneFillToPrice = function(value){
    if(this.fillToPrice > 0){
        this.SetFillToPrice(this.fillToPrice - 1);
    }
}
FuelView.prototype.AddOneFillToPrice = function(value){
	this.SetFillToPrice(this.fillToPrice + 1);
}
FuelView.prototype.GetFillUpPrice = function(value){
	this.fillToPrice = value;
}

FuelView.prototype.UpdateFuelPercentage = function(){
    let percentage = 0;

    if(this.MaxFuel > 0){
        percentage = Math.round(100 / this.MaxFuel * this.CurrentFuel);
    }

    this.Progressbar.SetPercentage(percentage);

	
}

FuelView.prototype.handleButtons = function(){
    $("#btn_fill_up_to_price").prop('disabled', this.fillToPrice == "" || this.PlayerMoney == 0 || this.fillToPrice>this.PlayerMoney || this.fillToPriceLiters < 1);

    this.SetMaxFuel(this.GetMaxFuel());

}

FuelView.prototype.GetFillUpToPriceEnabled = function(){
	return this.fillToPrice > 0 && typeof(this.fillToPrice) == "number";
}
FuelView.prototype.SetPlayerMoney = function(value){
    this.PlayerMoney = value;
    this.handleButtons();
}
FuelView.prototype.SetPlayerBankMoney = function(value){
    this.PlayerBankMoney = value;
}
FuelView.prototype.SetPlayerCashMoney = function(value){
    this.PlayerCashMoney = value;
}
FuelView.prototype.SetSocietyData = function(isSociety, SocietyName){
    this.isSociety = isSociety;
    this.SocietyName = SocietyName;

    document.getElementById("bank_money").style.display = (this.isSociety ? "none" : "")
    document.getElementById("cash_money").style.display = (this.isSociety ? "none" : "")
    document.getElementById("fillingview_paymentmethod_info_society").style.display = (!this.isSociety ? "none" : "")

}
FuelView.prototype.SetPaymenttype = function(value){

    let obj_active = $("#bank_money");
    let obj_inactive = $("#cash_money");

    if(value !== "bank_money"){
        obj_active = $("#cash_money");
        obj_inactive = $("#bank_money");
    }


    
    if(!obj_active.hasClass("active")){
        obj_active.addClass("active");
    }
    if(!obj_active.hasClass("btn-primary")){
        obj_active.addClass("btn-primary");
    }
    if(obj_active.hasClass("btn-secondary")){
        obj_active.removeClass("btn-secondary");
    }
    if(obj_inactive.hasClass("active")){
        obj_inactive.removeClass("active");
    }
    if(!obj_inactive.hasClass("btn-secondary")){
        obj_inactive.addClass("btn-secondary");
    }
    if(obj_inactive.hasClass("btn-primary")){
        obj_inactive.removeClass("btn-primary");
    }

    if(value !== "bank_money"){
        this.SetPlayerMoney(this.PlayerCashMoney);
        this.PaymentType = "cash";
    }
    else{
        this.SetPlayerMoney(this.PlayerBankMoney);
        this.PaymentType = "bank";
    }
}


FuelView.prototype.StartFilling = function(type){
    $("#bank_money").prop("disabled", true);
    $("#cash_money").prop("disabled", true);

    $.post('https://myFuel/startAnimation', JSON.stringify({}));

    $("#stop_filling").html(Translations["stop_filling"]);

    $("#btn_fill_up_to_price").hide();
    $("#btn_fill_up_to_max").hide();

    if(type == "max"){
        this.LitersToFillUp = this.MaxFuel - this.CurrentFuel;
        
    }
    else{
        this.LitersToFillUp = this.fillToPriceLiters;
        this.PriceToCalc = this.fillToPrice;
    }

    if (this.Interval == undefined) {
        this.Interval = setInterval(this.FillUpTick.bind(this),this.FuelTickInterval); 


    }
}
FuelView.prototype.StopFilling = function(){
    
    $("#bank_money").prop("disabled", false);
    $("#cash_money").prop("disabled", false);

    $("#btn_fill_up_to_price").show();
    $("#btn_fill_up_to_max").show();
    $("#stop_filling").html(Translations["close"]);

    if (this.Interval !== undefined) { 
        clearInterval(this.Interval); 
        this.Interval = undefined; 

        $.post('https://myFuel/fillUpVehicle', JSON.stringify(
            { 
                new_fuel_percentage: this.Progressbar.GetPercentage()
                ,amounttopay: this.PriceToCalc
                ,liters_filled_up: this.LitersFilledUp
                ,fuel_type: this.Type
                ,single_price: this.Price
                ,payment_method: this.PaymentType
                ,isSociety: this.isSociety
                ,SocietyName: this.SocietyName
            }
        ));

        this.LitersToFillUp = 0;
        this.LitersFilledUp = 0;
        this.PriceToCalc = 0;
    }
    else{
        $.post('https://myFuel/close', JSON.stringify({})); 
    }
}

FuelView.prototype.FillUpTick = function(){
    if(this.LitersToFillUp > 0){
        this.LitersFilledUp++;
        this.LitersToFillUp--;
        this.SetCurrentFuel(this.GetCurrentFuel() + 1);

        if(this.MaxFuel <= this.CurrentFuel){
            this.StopFilling();
        }

        this.PriceToCalc = Math.ceil((this.LitersFilledUp) * this.Price);
    }
    else{
        this.StopFilling();
    }
}