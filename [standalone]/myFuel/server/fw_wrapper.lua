
function getIdentifier(isESX, FWObject, _source)
    if isESX then 
        local xPlayer = FWObject.GetPlayerFromId(_source)
        return xPlayer.identifier
    else    
        local xPlayer = FWObject.Functions.GetPlayer(_source)
	    return xPlayer.PlayerData.citizenid
    end 
end 

function addPlayerMoney(isESX, FWObject, _source, amount, payment_type)
	if isESX then 
        local xPlayer = FWObject.GetPlayerFromId(_source)

        if payment_type == "bank" then 
            xPlayer.addAccountMoney('bank', amount)
        else
            xPlayer.addAccountMoney('money', amount)
        end 
    else    
        local xPlayer = FWObject.Functions.GetPlayer(_source)

        if payment_type == "bank" then 
            xPlayer.Functions.AddMoney('bank', amount)
        else
            xPlayer.Functions.AddMoney('cash', amount)
        end 
    end 
end 


function getPlayerMoney(isESX, FWObject, _source)
    if Config.RemoveMoneyFromAccount == "bank" then 
        return getPlayerBankMoney(isESX, FWObject, _source)
    else
        return getPlayerCashMoney(isESX, FWObject, _source)
    end 
end 

function getPlayerBankMoney(isESX, FWObject, _source)
    if isESX then 
        local xPlayer = FWObject.GetPlayerFromId(_source)
        return xPlayer.getAccount("bank").money
    else    
        local xPlayer = FWObject.Functions.GetPlayer(_source)
	    return xPlayer.Functions.GetMoney('bank')
    end 
end


function getPlayerCashMoney(isESX, FWObject, _source)
    if isESX then 
        local xPlayer = FWObject.GetPlayerFromId(_source)
        return xPlayer.getAccount("money").money
    else   
        local xPlayer = FWObject.Functions.GetPlayer(_source)
	    return xPlayer.Functions.GetMoney('cash') 
    end 


end 

function getPlayerItemCount(isESX, FWObject, _source, itemname)
    if isESX then 
        local xPlayer = FWObject.GetPlayerFromId(_source)
        if xPlayer.getInventoryItem(itemname) ~= nil then 
            return xPlayer.getInventoryItem(itemname).count or 0 
        else
            return 0
        end 
    else    
        
        local xPlayer = FWObject.Functions.GetPlayer(_source)

        if xPlayer.Functions.GetItemByName(itemname) ~= nil then 
            return xPlayer.Functions.GetItemByName(itemname).amount or 0
        else
            return 0
        end 
    end 


	
end 

function removeItemFromPlayer(isESX, FWObject, _source, itemname, amount)
    if isESX then 
        local xPlayer = FWObject.GetPlayerFromId(_source)
        xPlayer.removeInventoryItem(itemname, amount)
    else
        local xPlayer = FWObject.Functions.GetPlayer(_source)
	    xPlayer.Functions.RemoveItem(itemname, amount)    
    end 
end 

function canPlayerCarryItem(isESX, FWObject, _source, itemname, amount)
    if Config.QuestionCanCarryItem == false or isESX == false then
        return true
    else
        if isESX then 
            local xPlayer = FWObject.GetPlayerFromId(_source)
            return xPlayer.canCarryItem(itemname, amount)
        end 
        
    end
end 

function addItemToPlayer(isESX, FWObject, _source, itemname, amount)
    if isESX then 
        local xPlayer = FWObject.GetPlayerFromId(_source)
        xPlayer.addInventoryItem(itemname, amount)
        return true
    else  
        local xPlayer = FWObject.Functions.GetPlayer(_source)
	    return xPlayer.Functions.AddItem(itemname, amount)     
    end 

	
end 

function removePlayerMoney(isESX, FWObject, _source, amount, payment_type, isSociety, SocietyName)
    if isESX then 
        local xPlayer = FWObject.GetPlayerFromId(_source)

        if isSociety == false then 
            if payment_type == "bank" then 
                xPlayer.removeAccountMoney('bank', amount)
            else
                xPlayer.removeMoney(amount)
            end 
        else
            TriggerEvent('esx_addonaccount:getSharedAccount', SocietyName, function(account)
                account.removeMoney(amount)	
            end)
        end 
    else    
        local xPlayer = QBCore.Functions.GetPlayer(_source)
        if isSociety == false then 
            if payment_type == "bank" then 
                xPlayer.Functions.RemoveMoney('bank', amount)
            else
                xPlayer.Functions.RemoveMoney('cash', amount)
            end 
        else
            exports['qb-management']:RemoveMoney(SocietyName:gsub("society_",""), amount)
        end
    end 
end 
