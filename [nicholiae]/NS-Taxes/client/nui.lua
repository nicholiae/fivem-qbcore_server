local QBCore = exports['qb-core']:GetCoreObject()
local taxUIOpen = false

-- Open Tax UI
function OpenTaxUI()
    if taxUIOpen then return end
    
    taxUIOpen = true
    SetNuiFocus(true, true)
    
    -- Request tax data from server
    QBCore.Functions.TriggerCallback('NS-Taxes:server:getTaxData', function(taxData)
        SendNUIMessage({
            action = 'openTaxUI',
            taxData = taxData
        })
    end)
end

-- Close Tax UI
function CloseTaxUI()
    if not taxUIOpen then return end
    
    taxUIOpen = false
    SetNuiFocus(false, false)
    
    SendNUIMessage({
        action = 'closeTaxUI'
    })
end

-- NUI Callbacks
RegisterNUICallback('closeTaxUI', function(data, cb)
    CloseTaxUI()
    cb('ok')
end)

RegisterNUICallback('payTaxes', function(data, cb)
    QBCore.Functions.TriggerCallback('NS-Taxes:server:payTaxes', function(success, message)
        if success then
            QBCore.Functions.Notify(message, 'success', 5000)
            
            -- Refresh tax data
            QBCore.Functions.TriggerCallback('NS-Taxes:server:getTaxData', function(taxData)
                SendNUIMessage({
                    action = 'updateTaxData',
                    taxData = taxData
                })
            end)
        else
            QBCore.Functions.Notify(message, 'error', 5000)
        end
        
        cb({success = success})
    end)
end)

RegisterNUICallback('getTaxData', function(data, cb)
    QBCore.Functions.TriggerCallback('NS-Taxes:server:getTaxData', function(taxData)
        cb(taxData)
    end)
end)

-- Command to open tax UI
RegisterCommand('taxes', function()
    OpenTaxUI()
end, false)

-- Export for phone integration
exports('OpenTaxUI', OpenTaxUI)
exports('CloseTaxUI', CloseTaxUI)

-- Event handler for phone integration
RegisterNetEvent('NS-Taxes:Client:OpenTaxUI', function()
    OpenTaxUI()
end)

-- Register keybind
RegisterKeyMapping('taxes', 'Open Tax Information', 'keyboard', '')