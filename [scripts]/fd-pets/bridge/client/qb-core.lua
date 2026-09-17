local resourceName = 'qb-core'
if not GetResourceState(resourceName):find('start') then return end
if GetResourceState('qb_core'):find('start') then return end

SetTimeout(0, function()
    local QBCore = exports[resourceName]:GetCoreObject()

    function bridge.isDead()
        return false
    end

    function bridge.notify(msg, type)
        QBCore.Functions.Notify(msg, type or 'info')
    end
end)
