function Progress(object){
	this.currentPercentage = 0;
	this.currentObject = object;
}

Progress.prototype.SetCurrentObject = function(value){
	this.currentObject = value;
}

Progress.prototype.CalcPercentage = function(value1, value2){
	this.SetPercentage((100/value1) * value2 );
}

Progress.prototype.SetPercentage = function(value){
	this.currentPercentage = Math.ceil(value);
	this.RemoveColor();
	this.SetColor();
	if(this.currentObject !== undefined){
		this.currentObject.css({"width" : this.currentPercentage + "%"});
		
	}
}

Progress.prototype.GetPercentage = function(value){
	return this.currentPercentage;
}


Progress.prototype.RemoveColor = function(){
	if(this.currentObject !== undefined){
		let colors = [
			"bg-danger"
			,"bg-warning"
			,"bg-success"
		];
	
		for(let i=0; i < colors.length; i++){
			if(this.currentObject.hasClass(colors[i])){
				this.currentObject.removeClass(colors[i])
			}
		}
	}
}

Progress.prototype.SetColor = function(){
	if(this.currentObject !== undefined){
		color = this.GetColor();

		if(!this.currentObject.hasClass(color)){
			this.currentObject.addClass(color);
		}
	}
}

Progress.prototype.GetColor = function(){
	let color = "bg-danger";

	if(this.currentPercentage >= 30.00 && this.currentPercentage < 80.00){
		color = "bg-warning";

	}
	else if(this.currentPercentage >= 80.00){
		color = "bg-success";
	}

	return color;
}