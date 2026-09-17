QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-fishing:server:RemoveBait', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if exports['qb-inventory']:RemoveItem(Player.PlayerData.source, 'fishingbait', 1, false) then
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['fishingbait'], 'remove', 1)
    end
end)

RegisterNetEvent('qb-fishing:server:ReceiveFish', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local random = math.random(100) -- Random number from 1 to 100
    local item

    if random >= 1 and random <= 30 then -- 30%
        item = 'fish'
    elseif random >= 30 and random <= 50 then -- 20%
        item = 'fish2'
    elseif random >= 50 and random <= 58 then -- 8%
        item = 'catfish'
    elseif random >= 58 and random <= 64 then -- 6%
        item = 'goldfish'
    elseif random >= 64 and random <= 70 then -- 6%
        item = 'largemouthbass'
    elseif random >= 70 and random <= 76 then -- 6%
        item = 'redfish'
    elseif random >= 76 and random <= 82 then -- 6%
        item = 'salmon'
    elseif random >= 82 and random <= 88 then -- 6%
        item = 'stingray'
    elseif random >= 88 and random <= 94 then -- 6%
        item = 'stripedbass'
    elseif random >= 94 and random <= 97 then -- 3%
        item = 'whale'
    elseif random >= 97 and random <= 100 then -- 3%
        item = 'whale2'
    end

    if exports['qb-inventory']:AddItem(Player.PlayerData.source, item, 1, false) then
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items[item], 'add', 1)
        TriggerEvent('qb-log:server:CreateLog', 'fishing', 'Received Fish', 'blue', "**"..Player.PlayerData.name .. " (citizenid: "..Player.PlayerData.citizenid.." | id: "..Player.PlayerData.source..")** received 1x "..QBCore.Shared.Items[item].label)
    else
        TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, 'Your inventory is full already..', 'error', 2500)
    end
end)

QBCore.Functions.CreateUseableItem('fishingrod', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if not Player.Functions.GetItemByName('fishingrod') then return end
    TriggerClientEvent('qb-fishing:client:FishingRod', src)
end)
