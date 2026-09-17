local QBCore = exports['qb-core']:GetCoreObject()
local isMenuOpen = false
local conversionCount = 0
local lastConversionReset = GetGameTimer()

SetNuiFocus(false, false)

-- Reset conversion counter every minute
CreateThread(function()
    while true do
        Wait(60000) -- 1 minute
        conversionCount = 0
        lastConversionReset = GetGameTimer()
    end
end)

-- Open the cash conversion menu
local function OpenCashMenu()
    if isMenuOpen then return end
    
    -- Check cooldown
    if GetGameTimer() - lastConversionReset < Config.ConversionCooldown then
        QBCore.Functions.Notify('Please wait before converting again', 'error')
        return
    end
    
    -- Check conversion limit
    if conversionCount >= Config.MaxConversionsPerMinute then
        QBCore.Functions.Notify('You have reached the conversion limit. Please wait.', 'error')
        return
    end
    
    isMenuOpen = true
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openMenu',
        config = {
            minAmount = Config.MinAmount,
            maxAmount = Config.MaxAmount
        }
    })
end

-- Close the menu
RegisterNUICallback('closeMenu', function(data, cb)
    SetNuiFocus(false, false)
	isMenuOpen = false
    cb('ok')
end)

-- Convert digital cash to physical item
RegisterNUICallback('convertToPhysical', function(data, cb)
    local amount = tonumber(data.amount)
    
    if not amount or amount < Config.MinAmount or amount > Config.MaxAmount then
        cb({success = false, message = 'Invalid amount'})
        return
    end
    
    -- Close UI
    isMenuOpen = false
    SetNuiFocus(false, false)
    
    -- Play animation
    if Config.UseAnimation then
        local playerPed = PlayerPedId()
        RequestAnimDict(Config.AnimationDict)
        while not HasAnimDictLoaded(Config.AnimationDict) do
            Wait(10)
        end
        TaskPlayAnim(playerPed, Config.AnimationDict, Config.AnimationName, 8.0, 8.0, Config.AnimationDuration, 48, 0, false, false, false)
        Wait(Config.AnimationDuration)
        ClearPedTasks(playerPed)
    end
    
    -- Request server to convert
    QBCore.Functions.TriggerCallback('qb-physicalcash:server:convertToPhysical', function(success, message)
        if success then
            conversionCount = conversionCount + 1
            if Config.EnableNotifications then
                QBCore.Functions.Notify('Converted $' .. amount .. ' to physical cash', 'success')
            end
        else
            if Config.EnableNotifications then
                QBCore.Functions.Notify(message or 'Conversion failed', 'error')
            end
        end
        cb({success = success, message = message})
    end, amount)
end)

-- Convert physical item back to digital cash
RegisterNUICallback('convertToDigital', function(data, cb)
    -- Close UI
    isMenuOpen = false
    SetNuiFocus(false, false)
    
    -- Play animation
    if Config.UseAnimation then
        local playerPed = PlayerPedId()
        RequestAnimDict(Config.AnimationDict)
        while not HasAnimDictLoaded(Config.AnimationDict) do
            Wait(10)
        end
        TaskPlayAnim(playerPed, Config.AnimationDict, Config.AnimationName, 8.0, 8.0, Config.AnimationDuration, 48, 0, false, false, false)
        Wait(Config.AnimationDuration)
        ClearPedTasks(playerPed)
    end
    
    -- This is handled by the useable item on server side
    cb({success = true})
end)

-- Command to open menu
RegisterCommand('cashconvert', function()
    OpenCashMenu()
end, false)

-- Key mapping
RegisterKeyMapping('cashconvert', 'Open Cash Conversion Menu', 'keyboard', '')

-- Export for other resources
exports('OpenCashMenu', OpenCashMenu)

-- Event to open menu from other resources
RegisterNetEvent('qb-physicalcash:client:openMenu', function()
    OpenCashMenu()
end)

-- Handle NUI messages
RegisterNUICallback('playSound', function(data, cb)
    -- Play UI sound
    PlaySoundFrontend(-1, 'CLICK_BACK', 'WEB_NAVIGATION_SOUNDS_PHONE', true)
    cb('ok')
end)