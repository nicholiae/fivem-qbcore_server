function Owner_FuelType(locale, gas_station_id, type, current_stock, max_stock, current_price, competitor_min_price, competitor_max_price, competitor_avg_price, import_percentage, allowImport, allowMission, allowFillUpByItem, fillupItems, mission_percentage){
	this.GasStationID = gas_station_id;
	this.Locale = locale;
	this.Type = type;
	this.CurrentStock = current_stock;
	this.MaxStock = max_stock;
	this.CurrentPrice = current_price;
	this.CompetitorMin = competitor_min_price;
	this.CompetitorMax = competitor_max_price;
	this.CompetitorAvg = competitor_avg_price;
	this.ImportPercentage = import_percentage;
	this.AllowImport = allowImport;
	this.AllowMission = allowMission;
	this.AllowFillUpByItem = allowFillUpByItem;
	this.PossibleFillupItems = fillupItems;

    this.MissionPercentage = mission_percentage;

	this.NumberFormatter = new NumberFormat(this.Locale);


    //add entries at left part of window
    $("#fuel_type_entries").append(
        '<li id = "list_fuel_'+this.Type+'" onclick = "ownerview.openFuelOverviewPage(this, \'' + this.Type + '\')">'
        + '<i class="fas fa-gas-pump"></i> ' + Translations[this.Type]
        + '</li>'
    );

}


Owner_FuelType.prototype.SetCurrentStock = function(value){
    this.CurrentStock = value;

    $("#fueloverview_currentstock").html(this.NumberFormatter.getFormatted(this.CurrentStock,0) + " " + Translations[this.Type + "_unit"])
	$("#fueloverview_maxstock").html(this.NumberFormatter.getFormatted(this.MaxStock,0) + " " + Translations[this.Type + "_unit"])

    let progress = new Progress($("#fueloverview_currentpercentage"));
    progress.CalcPercentage(this.MaxStock, this.CurrentStock);

}

Owner_FuelType.prototype.SetMaxStock = function(value){
    this.MaxStock = value;
}
Owner_FuelType.prototype.SetCurrentPrice = function(value){
    value = (1*value).toFixed(2);
    this.CurrentPrice = value;

    $("#fueloverview_price_newprice").val(value);
    $("#fueloverview_price_currentprice").val(value);
}


Owner_FuelType.prototype.handleImportAmount = function(value){
    //$("#fueloverview_stock_tobuy").val($("#fueloverview_stock_tobuy").val().replace(/-/g,""));

    if(this.MaxStock < this.CurrentStock){
        $("#fueloverview_stock_tobuy").val("");
        $("#fueloverview_stock_tobuy_price").val("");
    }
    else{
        if($("#fueloverview_stock_tobuy").val() != ""){
            $("#fueloverview_stock_tobuy_price").val(
                Math.ceil($("#fueloverview_stock_tobuy").val() * this.getImportPrice())
            );
        }
        else{
            $("#fueloverview_stock_tobuy_price").val("");
        }
    
            
        if($("#fueloverview_stock_tobuy").val() > (this.MaxStock - this.CurrentStock)){
            $("#fueloverview_stock_tobuy").val(this.MaxStock - this.CurrentStock);
        }
    }
}


Owner_FuelType.prototype.handleMissionButton = function(currentBudget){
    

    if(this.MaxStock < this.CurrentStock){
        $("#fueloverview_stock_tobuy").val("");
        $("#fueloverview_stock_tobuy_price").val("");
    }
    else {

        let price = Math.ceil(this.getMissionPrice());

        if (price <= currentBudget && this.MaxStock>this.CurrentStock){
            document.getElementById("fueloverview_do_mission").disabled = false;
            $("#fueloverview_do_mission").html(Translations["fueloverview_do_mission"])
            if(price > 0 ){
                $("#fueloverview_do_mission").html($("#fueloverview_do_mission").html() + ' $' + price );
            }
        }
        else{
            document.getElementById("fueloverview_do_mission").disabled = true;
            $("#fueloverview_do_mission").html(Translations["fueloverview_do_mission"])
            if(price > 0 ){
                $("#fueloverview_do_mission").html($("#fueloverview_do_mission").html() + ' $' + price );
            }
        }
    }
}

Owner_FuelType.prototype.GetMaxAmountItemsToUse = function(button){
    //$("#fueloverview_stock_tobuy").val($("#fueloverview_stock_tobuy").val().replace(/-/g,""));

    if(this.MaxStock < this.CurrentStock){
        return 0;
    }
    else{
        let retval = Math.ceil((this.MaxStock - this.CurrentStock)/(1*button.attr("data-item-fillup-liters")));
        if(retval > 1*button.attr("data-item-amount")){
            retval = 1*button.attr("data-item-amount");
        }
        return retval;
    }
}

Owner_FuelType.prototype.getImportPrice = function(value){
    return this.CompetitorAvg * this.ImportPercentage;
}



Owner_FuelType.prototype.getMissionPrice = function(value){
    let amount = this.MaxStock - this.CurrentStock;

    if(amount <= 0){
        return 0;
    }

    return Math.ceil(amount * this.CompetitorAvg * this.MissionPercentage);
}



Owner_FuelType.prototype.handleDetailsPage = function(value){
    this.SetCurrentStock(this.CurrentStock);
    this.SetCurrentPrice(this.CurrentPrice);

	$("#fueloverview_stock_tobuy").val("");
    this.handleImportAmount();
	$("#overview_fuel_competitor_min_value").html("$" + this.NumberFormatter.getFormatted(this.CompetitorMin,2))
	$("#overview_fuel_competitor_max_value").html("$" + this.NumberFormatter.getFormatted(this.CompetitorMax,2))
	$("#overview_fuel_competitor_avarage_value").html("$" + this.NumberFormatter.getFormatted(this.CompetitorAvg,2))

    if(this.AllowImport){
        $("#element_fueloverview_import").show()
    }
    else{
        $("#element_fueloverview_import").hide()
    }


    if(this.AllowMission){
        $("#element_fueloverview_do_mission").show()
    }
    else{
        $("#element_fueloverview_do_mission").hide()
    }

    if(this.AllowFillUpByItem){
        $("#element_fueloverview_importitems").show()
    }
    else{
        $("#element_fueloverview_importitems").hide()
    }
    
    $("#fueloverview_do_mission").prop("disabled", this.MaxStock - this.CurrentStock == 0);
    if(Object.keys(this.PossibleFillupItems).length > 0){
        if(Object.keys(this.PossibleFillupItems).length == 1){
            $("#element_fueloverview_importitems_0").attr("data-index", "");
            $("#element_fueloverview_importitems_1").attr("data-index", 0);
            $("#element_fueloverview_importitems_2").attr("data-index", "");
        }
        else if(Object.keys(this.PossibleFillupItems).length == 2){           
            $("#element_fueloverview_importitems_0").attr("data-index", 0);
            $("#element_fueloverview_importitems_1").attr("data-index", "");
            $("#element_fueloverview_importitems_2").attr("data-index", 1);
        }
        else if(Object.keys(this.PossibleFillupItems).length == 3){           
            $("#element_fueloverview_importitems_0").attr("data-index", 0);
            $("#element_fueloverview_importitems_1").attr("data-index", 1);
            $("#element_fueloverview_importitems_2").attr("data-index", 2);

        }
        else{
            $("#element_fueloverview_importitems_0").attr("data-index", "");
            $("#element_fueloverview_importitems_1").attr("data-index", "");
            $("#element_fueloverview_importitems_2").attr("data-index", "");
        }
    }

    this.handleItemButtons();
}

Owner_FuelType.prototype.handleItemButtons = function(){

    for(let i=0; i<3;i++){
        let obj = $("#element_fueloverview_importitems_" + i );
        if(obj){
            let dataIdx = $("#element_fueloverview_importitems_" + i ).attr("data-index");
        
            if(dataIdx != ""){
                obj.attr("data-gas-station-id", this.GasStationID)
                obj.attr("data-fuel-type", this.Type)
                obj.attr("data-item-name", this.PossibleFillupItems[dataIdx].item)
                obj.attr("data-item-label", this.PossibleFillupItems[dataIdx].label)
                obj.attr("data-item-fillup-liters", this.PossibleFillupItems[dataIdx].fillupAmountPerItem)
                obj.attr("data-max-liters-allowed", this.MaxStock - this.CurrentStock);

                fetch(`https://myFuel/getItemCount`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: JSON.stringify({	
                        "itemname": obj.attr("data-item-name")
                    })
                }).then((response) => {
                    response.json().then(function(retobj){
                        obj.attr("data-item-amount", retobj.count)
                        obj.html(obj.attr("data-item-label") + " (" + obj.attr("data-item-amount") + "x)");

                        let disabled = false;

                        if(1*obj.attr("data-max-liters-allowed") < 1*obj.attr("data-item-fillup-liters")){
                            disabled = true;
                        }
                        else if(1*obj.attr("data-item-amount") == 0){
                            disabled = true;
                        }
                        
                        obj.prop("disabled" , disabled);
                        

                        if(obj.is(":hidden")){
                            obj.show();
                        }
                    });
                });

                
            }
            else{
                if(obj.is(":visible")){
                    obj.hide();
                }
                obj.attr("data-gas-station-id", this.GasStationID)
                obj.attr("data-fuel-type", this.Type)
                obj.attr("data-item-amount", 0)
                obj.attr("data-item-name", "")
                obj.attr("data-item-label", "")
                obj.attr("data-item-fillup-liters", "")
            }
        }
    }    
}


Owner_FuelType.prototype.CreateOverViewField = function(){

    let progress = new Progress();
    progress.CalcPercentage(this.MaxStock, this.CurrentStock);
    let progressPercentage = progress.GetPercentage();
    let color = progress.GetColor();

    $("#overview_fuel_types").append(
        '<div class="row rowCustom">'
            +'<div class = "col-md-12">'
                +'<div class = "card bg-dark card-portalview">'
                    +'<h5>'
                        +'<span>' + Translations[this.Type] + '</span>  '
                        +'<span style = "font-size: 0.70em; color : ' + color + '">($' + this.NumberFormatter.getFormatted(this.CurrentPrice,2) + ')</span>'
                    +'</h5>'
                    +'<div class="row">'
                        +'<div class="col-md-2" style = "padding-right:0px;">'
                            +'<div style = "text-align:right">' + this.NumberFormatter.getFormatted(this.CurrentStock,0) + " " + Translations[this.Type+"_unit"] + '</div>'
                        +'</div>'
                        +'<div class = "col-md-8">'
                            +'<div class="progress" style = "height:100%;">'
                            +'<div class="progress-bar ' + color + '" role="progressbar" style="width: ' + progressPercentage + '%" aria-valuenow="' + progressPercentage + '" aria-valuemin="0" aria-valuemax="100"></div>'
                        +'</div>'
                    +'</div>'
                    +'<div class="col-md-2" style = "padding-left: 0px;">' + this.NumberFormatter.getFormatted(this.MaxStock,0) +  " " +  Translations[this.Type+"_unit"] + '</div>'
                    +'</div>'		
                    +'<div>' + '</div>'
                +'</div>'
            +'</div>'
        +'</div>'
    );
}


Owner_FuelType.prototype.HandleItemButton = function(ui_element_id, amount_items_remain , doshow = false){	
    let obj= $("#"+ui_element_id)
    if(obj){
        obj.attr("data-item-amount", amount_items_remain)
        obj.html(obj.attr("data-item-label") + " (" + obj.attr("data-item-amount") + "x)");


        let disabled = false;

        if(this.CurrentStock + (1*obj.attr("data-item-fillup-liters")) > this.MaxStock){
            disabled = true;
        }
        else if(1*obj.attr("data-item-amount") == 0){
            disabled = true;
        }

        obj.prop("disabled" , disabled);
        if(doshow){
            if(obj.is(":hidden")){
                obj.show();
            }
        }
    }
    
}




