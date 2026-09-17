local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('qb-weed:server:getBuildingPlants', function(_, cb, building)
    local buildingPlants = {}

    MySQL.query('SELECT * FROM house_plants WHERE building = ?', { building }, function(plants)
        for i = 1, #plants, 1 do
            buildingPlants[#buildingPlants + 1] = plants[i]
        end

        cb(buildingPlants)
    end)
end)

RegisterNetEvent('qb-weed:server:placePlant', function(coords, sort, currentHouse)
    local random = math.random(1, 2)
    local gender = (random == 1) and 'man' or 'woman'

    MySQL.insert('INSERT INTO house_plants (building, coords, gender, sort, plantid) VALUES (?, ?, ?, ?, ?)',
        { currentHouse, coords, gender, sort, math.random(111111, 999999) })
    TriggerClientEvent('qb-weed:client:refreshHousePlants', -1, currentHouse)
end)

RegisterNetEvent('qb-weed:server:removeDeathPlant', function(building, plantId)
    MySQL.query('DELETE FROM house_plants WHERE plantid = ? AND building = ?', { plantId, building })
    TriggerClientEvent('qb-weed:client:refreshHousePlants', -1, building)
end)

RegisterServerEvent('qb-weed:server:removeSeed', function(itemslot, seed)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	seed = "weed_"..seed.."_seed"
    -- TriggerClientEvent('QBCore:Notify', src, 'should remove seeds', 'success', 3500)
    exports['qb-inventory']:RemoveItem(src, seed, 1, itemslot, 'qb-weed:server:removeSeed')
end)

-- NEW: Calculate yield multiplier based on plant health
local function CalculateYieldMultiplier(health)
    if not QBWeed.YieldSystem.enabled then
        return 1.0  -- 100% yield if system disabled
    end
    
    if health >= QBWeed.YieldSystem.perfectHealthThreshold then
        return 1.0  -- 100% yield
    elseif health >= QBWeed.YieldSystem.minimumHealthThreshold then
        -- Linear scale from minimum% at minimumHealthThreshold to 100% at perfectHealthThreshold
        local healthRange = QBWeed.YieldSystem.perfectHealthThreshold - QBWeed.YieldSystem.minimumHealthThreshold
        local yieldRange = 1.0 - (QBWeed.YieldSystem.minimumYieldPercent / 100)
        local multiplier = ((health - QBWeed.YieldSystem.minimumHealthThreshold) / healthRange) * yieldRange + (QBWeed.YieldSystem.minimumYieldPercent / 100)
        return multiplier
    else
        return QBWeed.YieldSystem.minimumYieldPercent / 100  -- Minimum yield
    end
end

RegisterNetEvent('qb-weed:server:harvestPlant', function(house, amount, plantName, plantId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if house ~= nil then
        local result = MySQL.query.await('SELECT * FROM house_plants WHERE plantid = ? AND building = ?', { plantId, house })
        if result[1] ~= nil then
            -- Get plant health for yield calculation
            local plantHealth = result[1].health
            local yieldMultiplier = CalculateYieldMultiplier(plantHealth)
            
            -- Calculate base amounts
            local baseProductAmount = math.random(QBWeed.MinYield, QBWeed.MaxYield)
            
            -- Apply yield multiplier to product (not seeds)
            local finalProductAmount = math.floor(baseProductAmount * yieldMultiplier)
            
            -- Ensure minimum of 1 unit if plant is alive
            if finalProductAmount < 1 and plantHealth > 0 then
                finalProductAmount = 1
            end
            
            -- Add items to inventory
			if amount > 0 then 
				exports['qb-inventory']:AddItem(src, 'weed_' .. plantName .. '_seed', amount, false, false, 'qb-weed:server:harvestPlant')
			else
				TriggerClientEvent('QBCore:Notify', src, 'No seeds from this one!', 'warning', 1000)
			end
            if finalProductAmount > 0 then 
				exports['qb-inventory']:AddItem(src, 'weed_' .. plantName, finalProductAmount, false, false, 'qb-weed:server:harvestPlant') 
			else
				TriggerClientEvent('QBCore:Notify', src, 'No buds from this one!', 'warning', 1000)
			end
            
            -- Delete plant
            MySQL.query('DELETE FROM house_plants WHERE plantid = ? AND building = ?', { plantId, house })
            
            -- Notify player with yield information
            local yieldPercent = math.floor(yieldMultiplier * 100)
            TriggerClientEvent('QBCore:Notify', src, 
                Lang:t('text.the_plant_has_been_harvested') .. ' | Health: ' .. plantHealth .. '% | Yield: ' .. yieldPercent .. '% (' .. finalProductAmount .. ' units)', 
                'success', 5000)
            
            TriggerClientEvent('qb-weed:client:refreshHousePlants', -1, house)
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t('error.this_plant_no_longer_exists'), 'error', 3500)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.house_not_found'), 'error', 3500)
    end
end)

RegisterNetEvent('qb-weed:server:foodPlant', function(house, amount, plantName, plantId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local plantStats = MySQL.query.await('SELECT * FROM house_plants WHERE building = ? AND sort = ? AND plantid = ?',{ house, plantName, tostring(plantId) })
    local updatedFood = math.min(100, plantStats[1].food + amount)
    TriggerClientEvent('QBCore:Notify', src, QBWeed.Plants[plantName]['label'] ..' | Nutrition: ' .. plantStats[1].food .. '% + ' .. updatedFood - plantStats[1].food .. '% (' ..updatedFood .. '%)', 'success', 3500)
    MySQL.update('UPDATE house_plants SET food = ? WHERE building = ? AND plantid = ?',{ updatedFood, house, plantId })
    exports['qb-inventory']:RemoveItem(src, 'weed_nutrition', 1, false, 'qb-weed:server:foodPlant')
    TriggerClientEvent('qb-weed:client:refreshHousePlants', -1, house)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    for plantName, _ in pairs(QBWeed.Plants) do
        QBCore.Functions.CreateUseableItem('weed_' .. plantName .. '_seed', function(source, item)
            TriggerClientEvent('qb-weed:client:placePlant', source, plantName, item)
        end)
    end
    QBCore.Functions.CreateUseableItem('weed_nutrition', function(source, item)
        TriggerClientEvent('qb-weed:client:foodPlant', source, item)
    end)
end)

CreateThread(function()
    local healthTick = false
    while true do
        local housePlants = MySQL.query.await('SELECT * FROM house_plants', {})
        for k, plant in pairs(housePlants) do
            -- CHANGED: Growth now depends on nutrition instead of health
            local growthRequirement = (QBWeed.GrowthRequirement == 'nutrition') and (housePlants[k].food >= 50) or (housePlants[k].health > 50)
            
            if growthRequirement then
                local Grow = math.random(QBWeed.Progress.min, QBWeed.Progress.max)
                if housePlants[k].progress + Grow < 100 then
                    MySQL.update('UPDATE house_plants SET progress = ? WHERE plantid = ?',
                        { (housePlants[k].progress + Grow), housePlants[k].plantid })
                elseif housePlants[k].progress + Grow >= 100 then
                    if housePlants[k].stage ~= QBWeed.Plants[housePlants[k].sort]['highestStage'] then
                        MySQL.update('UPDATE house_plants SET stage = ?, progress = 0 WHERE plantid = ?',
                            { housePlants[k].stage + 1, housePlants[k].plantid })
                    end
                end
            end
            if healthTick then
                local plantFood = math.max(0, plant.food - QBWeed.FoodUsage)
                local plantHealth = (plantFood >= 50) and math.min(100, plant.health + 1) or math.max(0, plant.health - 1)

                MySQL.update('UPDATE house_plants SET food = ?, health = ? WHERE plantid = ?',
                    { plantFood, plantHealth, plant.plantid })
            end
        end

        TriggerClientEvent('qb-weed:client:refreshHousePlants', -1)
        healthTick = not healthTick
        Wait((60 * 1000) * QBWeed.GrowthTick)
    end
end)


QBCore.Commands.Add('foodEmAll', 'Everyone gotta food', {}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    local src = source
    TriggerClientEvent('qb-weed:client:FoodEmAll', src)
end, 'admin')


QBCore.Commands.Add('harvEmAll', 'Everyone gotta eat', {}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    local src = source
    TriggerClientEvent('qb-weed:client:harvEmAll', src)
end, 'admin')


RegisterNetEvent('qb-weed:server:queitup', function(house)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local plantStats = MySQL.query.await('SELECT * FROM house_plants WHERE building = ?',{ house })
    local updatedFood = 100
    TriggerClientEvent('QBCore:Notify', src, 'Success', 'success', 3500)
    MySQL.update('UPDATE house_plants SET food = ? WHERE building = ?',{ updatedFood, house })
    TriggerClientEvent('qb-weed:client:refreshHousePlants', -1, house)
end)

RegisterNetEvent('qb-weed:server:haritup', function(house)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if house ~= nil then
        local result = MySQL.query.await('SELECT * FROM house_plants WHERE building = ?', { house })
        if result ~= nil then
			for k,v in pairs(result) do
                -- Calculate yield based on health
                local plantHealth = v.health
                local yieldMultiplier = CalculateYieldMultiplier(plantHealth)
                local baseProductAmount = math.random(12, 24)
                local finalProductAmount = math.floor(baseProductAmount * yieldMultiplier)
                
                if finalProductAmount < 1 and plantHealth > 0 then
                    finalProductAmount = 1
                end
                
				exports['qb-inventory']:AddItem(src, 'weed_' .. v.sort .. '_seed', 1, false, false, 'qb-weed:server:harvestPlant')
				exports['qb-inventory']:AddItem(src, 'weed_' .. v.sort, finalProductAmount, false, false, 'qb-weed:server:harvestPlant')
				MySQL.query('DELETE FROM house_plants WHERE plantid = ? AND building = ?', { v.plantid, house })
                
                local yieldPercent = math.floor(yieldMultiplier * 100)
				TriggerClientEvent('QBCore:Notify', src, 
                    Lang:t('text.the_plant_has_been_harvested') .. ' | Yield: ' .. yieldPercent .. '%', 
                    'success', 3500)
				TriggerClientEvent('qb-weed:client:refreshHousePlants', -1, house)
			end
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t('error.this_plant_no_longer_exists'), 'error', 3500)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.house_not_found'), 'error', 3500)
    end
end)