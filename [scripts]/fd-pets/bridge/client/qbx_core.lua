local resourceName = 'qbx_core'
if not GetResourceState(resourceName):find('start') then return end

SetTimeout(0, function()
    function bridge.isDead()
        return false
    end

    function bridge.notify(msg, type)
        exports.qbx_core:Notify(msg, type or 'info')
    end
end)
