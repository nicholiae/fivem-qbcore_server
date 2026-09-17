-- =============================================
-- FIVEM WATERMARK MODULE - CLIENT SCRIPT
-- =============================================

local isOpen = false

-- =============================================
-- NUI CALLBACKS
-- =============================================

-- Callback to close the menu and release NUI focus
RegisterNUICallback('closeMenu', function(data, cb)
    print('^1[Watermark]^0 closeMenu callback received from NUI')
    
    if isOpen then
        isOpen = false
        SetNuiFocus(false, false)
        print('^2[Watermark]^0 NUI focus released')
    end
    
    cb('ok')
end)

-- =============================================
-- INITIALIZATION
-- =============================================

CreateThread(function()
    -- Ensure focus is released on resource start
    SetNuiFocus(false, false)
    Wait(1000)
    print('^2[Watermark]^0 Loaded - Press PageUp to open menu')
end)

-- =============================================
-- KEYBIND HANDLING
-- =============================================

CreateThread(function()
    while true do
        Wait(0)
        
        -- Open menu with num 6 (control 105)
        if IsControlJustPressed(0, 83) then
            if not isOpen then
                isOpen = true
                SetNuiFocus(true, true)
                SendNUIMessage({ action = 'openMenu' })
                print('^2[Watermark]^0 Menu opened, NUI focus set')
            end
        end
        
        -- Close menu with ESC key (control 322)
        if isOpen then
            if IsControlJustPressed(0, 322) or IsControlJustPressed(1, 322) then
                isOpen = false
                SetNuiFocus(false, false)
                SendNUIMessage({ action = 'closeMenu' })
                print('^2[Watermark]^0 Menu closed via ESC, NUI focus released')
            end
        end
    end
end)

-- =============================================
-- EXPORTS
-- =============================================

exports('showMenu', function()
    if not isOpen then
        isOpen = true
        SetNuiFocus(true, true)
        SendNUIMessage({ action = 'openMenu' })
    end
end)

exports('hideMenu', function()
    if isOpen then
        isOpen = false
        SetNuiFocus(false, false)
        SendNUIMessage({ action = 'closeMenu' })
    end
end)

-- =============================================
-- COMMAND (for testing)
-- =============================================

RegisterCommand('testmenu', function()
    if not isOpen then
        isOpen = true
        SetNuiFocus(true, true)
        SendNUIMessage({ action = 'openMenu' })
        print('^2[Watermark]^0 Menu opened via command')
    end
end, false)

RegisterCommand('closemenu', function()
    if isOpen then
        isOpen = false
        SetNuiFocus(false, false)
        SendNUIMessage({ action = 'closeMenu' })
        print('^2[Watermark]^0 Menu closed via command')
    end
end, false)