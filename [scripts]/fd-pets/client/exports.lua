exports("SpawnPet", function(pet)
    if not pet then return end

    spawnPet(pet)
end)



exports("DoesPetExist", function()
    exists = NetworkDoesEntityExistWithNetworkId(Data.pet)

    if not exists then
        return false
    end

    if IsEntityDead(NetToPed(Data.pet)) then
        return false
    end

    return NetToPed(Data.pet)
end)

exports("OverrideMethod", function(name, cb)
    Utils[name] = cb
end)

exports("AddOrOverrideCustomMethod", function(name, cb)
    customActions[name] = cb
end)
