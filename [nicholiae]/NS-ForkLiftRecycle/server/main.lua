local QBCore = exports['qb-core']:GetCoreObject()

-- Events

RegisterNetEvent('NS-ForkLiftRecycling:server:attemptSpecialtyPickup', function(selectedItem)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    local cost = Config.SpecialtyPackageCost
    local cash = Player.PlayerData.money['cash'] or 0
    local bank = Player.PlayerData.money['bank'] or 0
    
    -- Check if player has enough money (cash + bank)
    if (cash + bank) < cost then
        TriggerClientEvent('NS-ForkLiftRecycling:client:specialtyPickupDenied', src)
        return
    end
    
    -- Deduct money (cash first, then bank)
    if cash >= cost then
        Player.Functions.RemoveMoney('cash', cost, 'specialty-package-purchase')
    elseif cash > 0 then
        local remaining = cost - cash
        Player.Functions.RemoveMoney('cash', cash, 'specialty-package-purchase')
        Player.Functions.RemoveMoney('bank', remaining, 'specialty-package-purchase')
    else
        Player.Functions.RemoveMoney('bank', cost, 'specialty-package-purchase')
    end
    
    TriggerClientEvent('QBCore:Notify', src, 'Specialty package purchased for $' .. cost, 'success')
    TriggerClientEvent('NS-ForkLiftRecycling:client:specialtyPickupApproved', src)
end)

RegisterNetEvent('NS-ForkLiftRecycling:server:getItem', function(isSpecialty, specialtyItem)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    print(isSpecialty)
    print(specialtyItem)
    if isSpecialty and specialtyItem then
        -- Specialty Package: Give only the selected item
        for _ = 1, math.random(1, Config.MaxItemsReceived), 1 do
            local amount = math.random(Config.MinItemReceivedQty, Config.MaxItemReceivedQty)
            exports['qb-inventory']:AddItem(src, specialtyItem, amount, false, false, 'NS-ForkLiftRecycling:server:getItem')
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[specialtyItem], 'add')
            Wait(500)
        end
        
        -- Increased bonus chances for specialty package
        local chanceBonus = Config.SpecialtyChanceBonus or 20
        local luckyBonus = Config.SpecialtyLuckyBonus or 20
        
        -- ChanceItem with increased probability (7% + 20% = 27%)
        local chance = math.random(1, 100)
        if chance < (7 + chanceBonus) then
            exports['qb-inventory']:AddItem(src, Config.ChanceItem, 1, false, false, 'NS-ForkLiftRecycling:server:getItem')
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ChanceItem], 'add')
        end
        
        -- LuckyItem with increased probability (10% + 20% = 30%)
        local luck = math.random(1, 100)
        if luck <= (10 + luckyBonus) then
            local random = math.random(1, 3)
            exports['qb-inventory']:AddItem(src, Config.LuckyItem, random, false, false, 'NS-ForkLiftRecycling:server:getItem')
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[Config.LuckyItem], 'add')
        end
    else
        -- Regular Package: Random items from ItemTable
        for _ = 1, math.random(1, Config.MaxItemsReceived), 1 do
            local randItem = Config.ItemTable[math.random(1, #Config.ItemTable)]
            local amount = math.random(Config.MinItemReceivedQty, Config.MaxItemReceivedQty)
            exports['qb-inventory']:AddItem(src, randItem, amount, false, false, 'NS-ForkLiftRecycling:server:getItem')
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add')
            Wait(500)
        end
        
        -- Standard bonus chances
        local chance = math.random(1, 100)
        if chance < 7 then
            exports['qb-inventory']:AddItem(src, Config.ChanceItem, 1, false, false, 'NS-ForkLiftRecycling:server:getItem')
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ChanceItem], 'add')
        end
        
        local luck = math.random(1, 10)
        local odd = math.random(1, 10)
        if luck == odd then
            local random = math.random(1, 3)
            exports['qb-inventory']:AddItem(src, Config.LuckyItem, random, false, false, 'NS-ForkLiftRecycling:server:getItem')
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[Config.LuckyItem], 'add')
        end
    end
end)