local YourWebhook = 'https://discord.com/api/webhooks/1264831215844724900/9cxlTlcZRye-OzVqBka06WRD5L61SJ_8z4yejVG3gJ4wDtB331NNQqJqBXhdOBXRseHn'  -- help: https://docs.brutalscripts.com/site/others/discord-webhook

function GetWebhook()
    return YourWebhook
end

-- Buy here: (4€+VAT) https://store.brutalscripts.com
function notification(source, title, text, time, type)
    if Config.BrutalNotify then
        TriggerClientEvent('brutal_notify:SendAlert', source, title, text, time, type)
    else
        TriggerClientEvent('brutal_ambulancejob:client:DefaultNotify', text)
    end
end

function ClearPlayerInventory(source)
    if Config.Inventory:lower() == 'ox_inventory' then
        exports.ox_inventory:ClearInventory(source)
    elseif Config.Inventory:lower() == 'quasar_inventory' then
        local saveItems = {
            'id_card', -- Add here the items that you do NOT want to be deleted
            'phone',
        }
        exports['qs-inventory']:ClearInventory(source, saveItems)
        local weapons = exports['qs-inventory']:GetWeaponList()
        for k,v in pairs(weapons) do
            RemoveItem(source, v.name, 1)
        end
    elseif Config.Inventory:lower() == 'chezza_inventory' then
        local xPlayer = GETPFI(source)
        exports.inventory:clearInventory(xPlayer, true)
    elseif Config.Inventory:lower() == 'qb_inventory' then
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)
		for i=1, #Player.PlayerData.items, 1 do
			local itemLabel = Player.PlayerData.items[i].label
			local itemType = Player.PlayerData.items[i].type
			local itemAmount = Player.PlayerData.items[i].amount
			local itemName = Player.PlayerData.items[i].name
			-- print("itemAmount: "..tostring(itemAmount))
			-- print("itemType: "..tostring(itemType))
			-- print("itemLabel: "..tostring(itemLabel))
			if itemType == 'weapon' then
				exports['qb-inventory']:RemoveItem(src, itemName, itemAmount, false, 'DEATH')
				-- print("WEAPON REMOVAL")
				-- print("itemAmount: "..tostring(itemAmount))
				-- print("itemType: "..tostring(itemType))
				-- print("itemLabel: "..tostring(itemLabel))
				-- print("WEAPON REMOVAL")
			else
				-- if itemName == QBCore.Shared.Items[Config.ItemsToRemoveOnDeath[i]] then
				for x=1,#Config.ItemsToRemoveOnDeath,1 do
					
					if Config.ItemsToRemoveOnDeath[x] == itemName then
						local hasit = true
						exports['qb-inventory']:RemoveItem(src, itemName, itemAmount, false, 'DEATH')
						-- print("NAME")
						-- print(itemName)
						-- print("NAME")
						-- print("COMPARE NAME")
						-- print(Config.ItemsToRemoveOnDeath[x])
						-- print("COMPARE NAME")
					else
						local hasit = false
					end
				end
			end
		end
        -- exports['qb-inventory']:ClearInventory(source)
    elseif Config['Core']:upper() == 'ESX' then
        local ESX = Core
        local xPlayer = ESX.GetPlayerFromId(source)
        for i=1, #xPlayer.inventory, 1 do
            if xPlayer.inventory[i].count > 0 then
                xPlayer.setInventoryItem(xPlayer.inventory[i].name, 0)
            end
        end
    end
	
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Stamina', -1)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Running', -1)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Driving', -1)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Strength', -1)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Swimming', -1)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Shooting', -1)
	
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Stamina', -2)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Running', -2)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Driving', -2)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Strength', -2)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Swimming', -2)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Shooting', -2)
	
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Stamina', -3)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Running', -3)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Driving', -3)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Strength', -3)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Swimming', -3)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Shooting', -3)
	
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Stamina', -5)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Running', -5)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Driving', -5)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Strength', -5)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Swimming', -5)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Shooting', -5)
	
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Stamina', -10)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Running', -10)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Driving', -10)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Strength', -10)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Swimming', -10)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Shooting', -10)
	
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Stamina', -20)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Running', -20)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Driving', -20)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Strength', -20)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Swimming', -20)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Shooting', -20)
	
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Stamina', -25)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Running', -25)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Driving', -25)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Strength', -25)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Swimming', -25)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Shooting', -25)
	
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Stamina', -50)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Running', -50)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Driving', -50)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Strength', -50)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Swimming', -50)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Shooting', -50)
	
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Stamina', -100)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Running', -100)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Driving', -100)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Strength', -100)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Swimming', -100)
    TriggerClientEvent('brutal_skills:client:AddSkill', 'Shooting', -100)
	
end

function SocietyAddMoney(job, price)
    if Config['Core']:upper() == 'ESX' then
        local society = exports['esx_society']:GetSociety(job)
        TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
            account.addMoney(price)
        end)
    else
        exports['qb-banking']:AddMoney(job, price)
    end
end

ESX = Core
QBCore = Core

if Config.Core:upper() == 'QBCORE' then
    RegisterNetEvent('hospital:server:resetHungerThirst', function()
        local Player = QBCore.Functions.GetPlayer(source)
    
        if not Player then return end
    
        Player.Functions.SetMetaData('hunger', 100)
        Player.Functions.SetMetaData('thirst', 100)
    
        TriggerClientEvent('hud:client:UpdateNeeds', source, 100, 100)
    end)
end

function StaffCheck(source, AdminGroups)
    local staff = false

    if Config.Core:upper() == 'ESX'then
        local player = Core.GetPlayerFromId(source)
        local playerGroup = player.getGroup()

        for i, Group in ipairs(AdminGroups) do
            if playerGroup == Group then
                staff = true
                break
            end
        end
    elseif Config.Core:upper() == 'QBCORE' then
        local player = Core.Functions.GetPlayer(source)

        for i, Group in ipairs(AdminGroups) do
            if Core.Functions.HasPermission(source, Group) or IsPlayerAceAllowed(source, Group) then
                staff = true
                break
            end
        end
    end

    return staff
end