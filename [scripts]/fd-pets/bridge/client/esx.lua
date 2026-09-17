local resourceName = 'es_extended'
if not GetResourceState(resourceName):find('start') then return end

SetTimeout(0, function()
    function bridge.isDead()
        return false
    end

    function bridge.notify(msg, type)
        lib.notify({
            description = msg,
            type = type
        })
    end
end)
