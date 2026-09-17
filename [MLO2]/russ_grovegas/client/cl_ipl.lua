local iplConfig = {
    {
        iplName = '',
        interiorCoords = vector3(-50.8688354, -1751.03833, 28.4209366),
        entitySets = {
            'ballas',
        }
    }
}

AddEventHandler('onClientResourceStart', function (resourceName)
    if(GetCurrentResourceName() ~= resourceName) then
        return
    end

    SetupIPL()
end)

function SetupIPL()
    Citizen.CreateThread(function()
        for k,v in pairs(iplConfig) do
            if not IsIplActive(v.iplName) then
                RequestIpl(v.iplName)
            elseif IsIplActive(v.iplName) then
                RemoveIpl(v.iplName)
            end
            
            local interiorID = GetInteriorAtCoords(v.interiorCoords)
            if not interiorID == 0 then
                return
            end
            for n,m in pairs(v.entitySets) do
                if not IsInteriorEntitySetActive(interiorID, m) then
                    ActivateInteriorEntitySet(interiorID, m)
                end
            end

            RefreshInterior(interiorID)
        end
    end)
end