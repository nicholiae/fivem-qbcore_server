function SaleView(locale){
	this.Locale = locale;
	this.GasStationId = -1;
	this.NumberFormatter = new NumberFormat(locale);

	$("#sale_view_headline").html(Translations["sale_view_headline"]);
	$("#gas_Station_sell_cancel").html(Translations["sale_view_cancel"]);
	$("#gas_Station_sell").html(Translations["sale_view_sell"]);
	$("#sale_view_infotext").html(Translations["sale_view_infotext"]);
}


SaleView.prototype.show = function(){
	$("#sale_view").show();
}
SaleView.prototype.hide = function(){
	$("#sale_view").hide();
}

SaleView.prototype.SetGasStationID = function(value){
	this.GasStationId = value;
}

SaleView.prototype.Sell = function(value){
	$.post('https://myFuel/SellGasStation', JSON.stringify({
		gas_station_id: this.GasStationId
	})); 
}
