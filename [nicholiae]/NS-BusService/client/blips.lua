-- Create blips for all configured bus stop locations
Citizen.CreateThread(function()
    for locationName, locationData in pairs(Config.Locations) do
        local blip = AddBlipForCoord(locationData.callSpot.x, locationData.callSpot.y, locationData.callSpot.z)
        SetBlipSprite(blip, 198) -- Bus station sprite
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 5) -- Yellow color
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Bus Stop")
        EndTextCommandSetBlipName(blip)
        
        if Config.Debug then 
            print("^0[^5Debug^7][^3Information^0]: ^2Added blip for bus stop: " .. locationName)
        end
    end
end)