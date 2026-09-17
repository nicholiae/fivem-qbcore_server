local QBCore = exports['qb-core']:GetCoreObject()

-- Track conversion attempts for anti-exploit
local conversionAttempts = {}

-- Clean up old attempts every 5 minutes
CreateThread(function()
    while true do
        Wait(300000) -- 5 minutes
        local currentTime = os.time()
        for identifier, data in pairs(conversionAttempts) do
            if currentTime - data.lastReset > 60 then
                conversionAttempts[identifier] = nil
            end
        end
    end
end)

-- Generate unique serial number
local function GenerateSerial()
    local charset = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    local serial = ''
    for i = 1, 3 do
        local rand = math.random(1, #charset)
        serial = serial .. charset:sub(rand, rand)
    end
    serial = serial .. '-'
    for i = 1, 4 do
        serial = serial .. math.random(0, 9)
    end
    serial = serial .. '-'
    for i = 1, 2 do
        local rand = math.random(1, #charset)
        serial = serial .. charset:sub(rand, rand)
    end
    return serial
end

-- Anti-exploit check
local function CheckExploitAttempt(src)
    local identifier = QBCore.Functions.GetIdentifier(src, 'license')
    local currentTime = os.time()
    
    if not conversionAttempts[identifier] then
        conversionAttempts[identifier] = {
            count = 0,
            lastReset = currentTime
        }
    end
    
    local data = conversionAttempts[identifier]
    
    -- Reset counter if more than 1 minute has passed
    if currentTime - data.lastReset > 60 then
        data.count = 0
        data.lastReset = currentTime
    end
    
    -- Check if exceeded limit
    if data.count >= Config.MaxConversionsPerMinute then
        return false, 'Too many conversion attempts. Please wait.'
    end
    
    data.count = data.count + 1
    return true, nil
end

-- Callback: Convert digital cash to physical item
QBCore.Functions.CreateCallback('qb-physicalcash:server:convertToPhysical', function(source, cb, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then
        cb(false, 'Player not found')
        return
    end
    
    -- Validate amount
    amount = tonumber(amount)
    if not amount or amount < Config.MinAmount or amount > Config.MaxAmount then
        cb(false, 'Invalid amount')
        return
    end
    
    -- Anti-exploit check
    if Config.EnableAntiDupe then
        local canConvert, errorMsg = CheckExploitAttempt(src)
        if not canConvert then
            cb(false, errorMsg)
            
            -- Log suspicious activity
            if Config.EnableLogging then
                TriggerEvent('qb-log:server:CreateLog', 'physicalcash', 'Exploit Attempt', 'red',
                    '**Player:** ' .. GetPlayerName(src) .. ' (' .. Player.PlayerData.citizenid .. ')\n' ..
                    '**Reason:** Too many conversion attempts\n' ..
                    '**Amount Attempted:** $' .. amount
                )
            end
            return
        end
    end
    
    -- Check if player has enough cash
    local playerCash = Player.PlayerData.money['cash']
    if playerCash < amount then
        cb(false, 'Insufficient funds. You have $' .. playerCash)
        return
    end
    
    -- Generate unique info for this cash bundle
    local serial = GenerateSerial()
    local info = {
        worth = amount,
        serial = serial,
        createdBy = Player.PlayerData.citizenid,
        createdByName = Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname,
        createdDate = os.date('%Y-%m-%d %H:%M:%S'),
        timestamp = os.time()
    }
    
    -- Remove digital cash first (prevent duplication)
    if not Player.Functions.RemoveMoney('cash', amount, 'physical-cash-conversion') then
        cb(false, 'Failed to remove cash')
        return
    end
    
    -- Add physical cash item
    if exports['qb-inventory']:AddItem(src, Config.ItemName, 1, false, info, 'physical-cash-conversion') then
        -- Success
        TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ItemName], 'add')
        
        -- Log conversion
        if Config.EnableLogging then
            TriggerEvent('qb-log:server:CreateLog', 'physicalcash', 'Cash Converted to Physical', 'green',
                '**Player:** ' .. GetPlayerName(src) .. ' (' .. Player.PlayerData.citizenid .. ')\n' ..
                '**Amount:** $' .. amount .. '\n' ..
                '**Serial:** ' .. serial .. '\n' ..
                '**Remaining Cash:** $' .. Player.PlayerData.money['cash']
            )
        end
        
        cb(true, 'Successfully converted $' .. amount .. ' to physical cash')
    else
        -- Failed to add item, refund the money
        Player.Functions.AddMoney('cash', amount, 'physical-cash-conversion-refund')
        cb(false, 'Inventory full or item could not be added')
        
        -- Log failed attempt
        if Config.EnableLogging then
            TriggerEvent('qb-log:server:CreateLog', 'physicalcash', 'Conversion Failed - Refunded', 'orange',
                '**Player:** ' .. GetPlayerName(src) .. ' (' .. Player.PlayerData.citizenid .. ')\n' ..
                '**Amount:** $' .. amount .. '\n' ..
                '**Reason:** Inventory full or item add failed'
            )
        end
    end
end)

-- Useable item: Convert physical cash back to digital
QBCore.Functions.CreateUseableItem(Config.ItemName, function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    -- Validate item info
    if not item.info or not item.info.worth then
        TriggerClientEvent('QBCore:Notify', src, 'Invalid cash item', 'error')
        return
    end
    
    local worth = tonumber(item.info.worth)
    if not worth or worth <= 0 then
        TriggerClientEvent('QBCore:Notify', src, 'Invalid cash value', 'error')
        return
    end
    
    -- Remove the physical item first (prevent duplication)
    if exports['qb-inventory']:RemoveItem(src, Config.ItemName, 1, item.slot, 'physical-cash-to-digital') then
        -- Add digital cash
        Player.Functions.AddMoney('cash', worth, 'physical-cash-to-digital')
        
        TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ItemName], 'remove')
        TriggerClientEvent('QBCore:Notify', src, 'Converted physical cash to $' .. worth, 'success')
        
        -- Log conversion
        if Config.EnableLogging then
            TriggerEvent('qb-log:server:CreateLog', 'physicalcash', 'Physical Cash Converted to Digital', 'green',
                '**Player:** ' .. GetPlayerName(src) .. ' (' .. Player.PlayerData.citizenid .. ')\n' ..
                '**Amount:** $' .. worth .. '\n' ..
                '**Serial:** ' .. (item.info.serial or 'N/A') .. '\n' ..
                '**Original Creator:** ' .. (item.info.createdByName or 'Unknown') .. '\n' ..
                '**Created Date:** ' .. (item.info.createdDate or 'Unknown')
            )
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'Failed to convert cash', 'error')
    end
end)

-- Admin command to check physical cash info
QBCore.Commands.Add('checkcash', 'Check physical cash item info (Admin Only)', {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    -- Get all physical cash items in inventory
    local items = Player.PlayerData.items
    local cashItems = {}
    
    for slot, item in pairs(items) do
        if item and item.name == Config.ItemName then
            table.insert(cashItems, {
                slot = slot,
                worth = item.info.worth or 0,
                serial = item.info.serial or 'N/A',
                creator = item.info.createdByName or 'Unknown',
                date = item.info.createdDate or 'Unknown'
            })
        end
    end
    
    if #cashItems == 0 then
        TriggerClientEvent('QBCore:Notify', src, 'No physical cash found in inventory', 'error')
        return
    end
    
    -- Send info to client
    TriggerClientEvent('chat:addMessage', src, {
        color = {0, 255, 0},
        multiline = true,
        args = {'Physical Cash Info', 'Found ' .. #cashItems .. ' cash item(s)'}
    })
    
    for i, cash in ipairs(cashItems) do
        TriggerClientEvent('chat:addMessage', src, {
            color = {255, 255, 255},
            multiline = true,
            args = {'Cash #' .. i, 'Slot: ' .. cash.slot .. ' | Worth: $' .. cash.worth .. ' | Serial: ' .. cash.serial}
        })
    end
end, 'admin')

-- Event for other resources to convert cash
RegisterNetEvent('qb-physicalcash:server:convertToPhysical', function(amount)
    local src = source
    QBCore.Functions.CreateCallback('qb-physicalcash:server:convertToPhysical', function(success, message)
        -- Callback handled in main function
    end, src, amount)
end)

print('^2[qb-physicalcash]^7 Physical Cash System loaded successfully!')