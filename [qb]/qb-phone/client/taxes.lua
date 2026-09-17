local QBCore = exports['qb-core']:GetCoreObject()

-- NUI Callbacks for Tax App
RegisterNUICallback('GetTaxData', function(data, cb)
    QBCore.Functions.TriggerCallback('qb-phone:server:GetTaxData', function(taxData)
        cb(taxData)
    end)
end)

RegisterNUICallback('PayTaxes', function(data, cb)
    QBCore.Functions.TriggerCallback('qb-phone:server:PayTaxes', function(result)
        if result.success then
            QBCore.Functions.Notify(result.message, 'success', 5000)
        else
            QBCore.Functions.Notify(result.message, 'error', 5000)
        end
        cb(result)
    end)
end)