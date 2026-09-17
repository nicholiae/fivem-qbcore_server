function NumberFormat(locale){
	this.Locale = locale;
}


NumberFormat.prototype.getFormatted = function(number, decimals){
	if(this.Locale == 'de'){

		if(decimals){
			return (1*number).toLocaleString('de-DE', {
				minimumFractionDigits: decimals,
				maximumFractionDigits: decimals
			})
		}
		else{	
			return (1*number).toLocaleString('de-DE')
		}
	}
	else{
		if(decimals){
			return (1*number).toLocaleString('en-EN', {
				minimumFractionDigits: decimals,
				maximumFractionDigits: decimals
			})
		}
		else{
			
			return (1*number).toLocaleString('en-EN')
		}
	}
}


NumberFormat.prototype.getHTMLMoney = function(number, decimals){
	
	let value = number
	let color = ""
	let fontWeight = "";

	if(value == -0){
		value = 0;
	}

	if(value < 0){
		color = "red";
		value = value * -1
		value = "-$" + this.getFormatted(value,decimals);
	}
	else{
		color = "green"
		fontWeight = "font-weight:bold;";
		value = "$" + this.getFormatted(value,decimals);
	}

	return '<span style = "color:'+ color + ';'+fontWeight+'">' + value + '</span';
	
}

