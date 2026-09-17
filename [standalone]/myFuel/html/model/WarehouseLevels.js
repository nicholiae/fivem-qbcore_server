function WarehouseLevels(){
	this.PossibleLevels = [
		{capacity : 1000, upgradePrice : 0} //this is the default, do not delete!
		,{capacity : 1500, upgradePrice : 8000}
		,{capacity : 1750, upgradePrice : 10000}
		,{capacity : 2000, upgradePrice : 12000}
		,{capacity : 2500, upgradePrice : 15000}
		,{capacity : 4000, upgradePrice : 20000}
	]
}


WarehouseLevels.prototype.GetMaxStock = function(level){
	this.PossibleLevels[level].capacity;
}