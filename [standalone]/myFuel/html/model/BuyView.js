function BuyView(locale){
	this.Locale = locale;
	this.Price = 0;
	this.PlayerMoney = 0;
	this.GasStationId = -1;
	this.NumberFormatter = new NumberFormat(locale);

	$("#buy_view_headline").html(Translations["buyview_headline"]);
	$("#gas_Station_buy_cancel").html(Translations["buyview_cancel"]);
	$("#gas_Station_buy").html(Translations["buyview_buy"]);
	$("#buy_view_missing_money").html(Translations["not_enought_money"]);

}



BuyView.prototype.show = function(){
	$("#buy_view").show();
}
BuyView.prototype.hide = function(){
	$("#buy_view").hide();
}

BuyView.prototype.SetGasStationID = function(value){
	this.GasStationId = value;
}

BuyView.prototype.SetPlayerMoney = function(value){
	this.PlayerMoney = value;
	$("#gas_Station_buy").prop("disabled", this.PlayerMoney < this.Price);

	if(this.PlayerMoney < this.Price){
		$("#buy_view_missing_money").show();
	}
	else{
		$("#buy_view_missing_money").hide();
	}
	


}

BuyView.prototype.SetPrice = function(value){
	this.Price = value;
	$("#gas_Station_buy").prop("disabled", this.PlayerMoney < this.Price)
	$("#buy_view_infotext").html(Translations["buyview_text_line01"] + "<br>" + Translations["buyview_text_line02"] + " " + this.NumberFormatter.getFormatted(value,0));

	if(this.PlayerMoney < this.Price){
		$("#buy_view_missing_money").show();
	}
	else{
		$("#buy_view_missing_money").hide();
	}
}


BuyView.prototype.Buy = function(value){
	$.post('https://myFuel/BuyGasStation', JSON.stringify({
		amount_to_pay: this.Price,
		gas_station_id: this.GasStationId
	})); 
}
