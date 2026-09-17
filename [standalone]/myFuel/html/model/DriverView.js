function DriverView(locale){
	this.Locale = locale;
	this.FuelCritical = 0;
	this.FuelWarning = 0;
	this.CurrentFuelLevel = 0;
	this.FuelInUnitText = ""
	this.ShowFuelLevelInPercentage = false
	this.LastProgressColor = undefined;
	this.DefaultMargin = 1.5;

	this.location = undefined;
	
}



DriverView.prototype.show = function(){
	$("#car_div").show();
}
DriverView.prototype.hide = function(){
	$("#car_div").hide();
}

DriverView.prototype.SetShowSpeed = function(value){

	if(value){
		$("#car_div_speed_info").show();
	}
	else{
		$("#car_div_speed_info").hide();
	}
}


DriverView.prototype.SetShowFuelInPercentage = function(value){
	this.ShowFuelLevelInPercentage = value
}

DriverView.prototype.SetRemoveHudBackground = function(value){
	let el = document.getElementById("car_div");

	if(value){
		if(el.classList.contains("driverViewBg")){
			el.classList.remove("driverViewBg");
		}
	}
	else{
		if(!el.classList.contains("driverViewBg")){
			el.classList.remove("driverViewBg");
		}
	}

}


DriverView.prototype.SetShowFuelLevel = function(value){
	if(value){
		$("#car_div_fuelinfo").show();
		if(document.getElementById("car_div").classList.contains("nofuellevel")){
			document.getElementById("car_div").classList.remove("nofuellevel");
		}
	}
	else{
		$("#car_div_fuelinfo").hide();

		if(!document.getElementById("car_div").classList.contains("nofuellevel")){
			document.getElementById("car_div").classList.add("nofuellevel");
		}
	}
}

DriverView.prototype.SetSpeedUnit = function(value){
	$("#car_div_unit").html(Translations[value])
}

DriverView.prototype.SetLocation = function(value){
	this.location = value;
	if(value.vertical == "left"){
		$("#car_div").css({"left" : "0"});
	}
	else if(value.vertical == "middle"){
		$("#car_div").css({"right":"0", "left":"0","margin-left":"auto","margin-right":"auto"});
	}
	else{
		$("#car_div").css({"right":"0"});
	}

	if(value.horizontal == "top"){
		$("#car_div").css({"top" : "0"});
	}
	else if(value.horizontal == "middle"){
		$("#car_div").css({"top":"0", "bottom":"0","margin-top":"auto","margin-bottom":"auto"});
	}
	else{
		$("#car_div").css({"bottom":"0"});
	}
}
DriverView.prototype.SetExtraMargins = function(value){	
	
	if(this.location.vertical != "middle"){
		$("#car_div").css({"margin-left" : value.left + this.DefaultMargin+ "%"});
		$("#car_div").css({"margin-right" : value.right + this.DefaultMargin+ "%"});
	}
	if(this.location.horizontal != "middle"){
		$("#car_div").css({"margin-top" : value.top + this.DefaultMargin + "%"});
		$("#car_div").css({"margin-bottom" : value.bottom + this.DefaultMargin + "%"});
	}
	
}
DriverView.prototype.SetFuelCritical = function(value){
	this.FuelCritical = value;
}
DriverView.prototype.SetFuelWarning = function(value){
	this.FuelWarning = value;
}
DriverView.prototype.SetCurrentSpeed = function(value){
	$("#car_div_currentspeed").html(value)
}
DriverView.prototype.SetCurrentFuellevel = function(value, real_fuel_level){
	
	$("#car_div_current_fuel_percentage_view").css({"width" : value + "%", "color":"black", "font-weight":"bold", "font-size":"1.3vh"});

	if(value <= this.FuelCritical){
		$("#car_div_current_fuel_percentage_view").html("");
	}
	else{
		if(this.ShowFuelLevelInPercentage){
			$("#car_div_current_fuel_percentage_view").html(value + "%");
		}
		else{
			$("#car_div_current_fuel_percentage_view").html(real_fuel_level);
		}
	}

	if(this.CurrentFuelLevel != value){
		this.CurrentFuelLevel = value;

		let color = this.GetColor(value);

		if(this.LastProgressColor != color){
			this.RemoveColors()
			$("#car_div_current_fuel_percentage_view").addClass(color);
		}

		if(value <= this.FuelCritical){
			if(!$("#car_div_gas_pump_icon").hasClass("warnLamp")){
				$("#car_div_gas_pump_icon").addClass("warnLamp")
			}
		}
		else{
			if($("#car_div_gas_pump_icon").hasClass("warnLamp")){
				$("#car_div_gas_pump_icon").removeClass("warnLamp")
			}
		}
	}
}


DriverView.prototype.GetColor = function(newFuelLevel){
	let color = "bg-success";

	if(newFuelLevel <= this.FuelWarning && newFuelLevel > this.FuelCritical){
		color = "bg-warning";

	}
	else if(newFuelLevel <= this.FuelCritical){
		color = "bg-danger";
	}

	return color;
}

DriverView.prototype.RemoveColors = function(){
	
	let colors = [
		"bg-danger"
		,"bg-warning"
		,"bg-success"
	];
	
	for(let i=0; i < colors.length; i++){
		if($("#car_div_current_fuel_percentage_view").hasClass(colors[i])){
			$("#car_div_current_fuel_percentage_view").removeClass(colors[i])
		}
	}
}
