local QBCore = exports['qb-core']:GetCoreObject()
local inArena = false
local isDead = false
local lastHitByPaintball = false
local notified = 0

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function TeleportPlayer(pCoords, pHeading)
    local heading = pHeading * 1.0
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local teleportCoords = vector3(pCoords.x, pCoords.y, pCoords.z)

    local time = math.floor((#(teleportCoords - playerCoords) / 50) * 100)
    local entity = IsPedInAnyVehicle(playerPed) and GetVehiclePedIsIn(playerPed) or playerPed

    DoScreenFadeOut(400)

    while IsScreenFadingOut() do
        Citizen.Wait(0)
    end

    NetworkFadeOutEntity(playerPed, true, true)
    SetPedCoordsKeepVehicle(playerPed, teleportCoords)
    SetEntityHeading(entity, heading)
    SetGameplayCamRelativeHeading(0.0)
    Citizen.Wait(time)
    NetworkFadeInEntity(playerPed, true)
    DoScreenFadeIn(400)
end

Citizen.CreateThread(function()
    while true do
        local inRange = false
        local pos = GetEntityCoords(PlayerPedId())
        local enterArena = GetDistanceBetweenCoords(pos, -282.42, -2031.59, true)
        local exitArena = GetDistanceBetweenCoords(pos, 5504.9, 5979.94, 590.01, true)
        local paintballVendor = GetDistanceBetweenCoords(pos, 5517.92, 5992.95, 590.01, true)
        local paintballItems = GetDistanceBetweenCoords(pos, 5509.89, 5996.51, 590.01, true)

        if enterArena < 10 then
            inRange = true
            DrawMarker(2, -282.42, -2031.59, 30.15, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

            if enterArena < 1 then
                DrawText3Ds(-282.42, -2031.59, 30.15, "[E] Enter Stadium")
				-- if notified <= 3 then
					-- QBCore.Functions.Notify("PLEASE GO EMPTY YOUR INVENTORY BEFORE PROCEEDING INTO THE ARENA!", 'error')
					-- notified = notified + 1
					-- Wait(1000)
					-- if notified > 20 then
						-- notified = 0
					-- end
				-- end
                if IsControlJustReleased(0, 38) then
                    TeleportPlayer(vector3(5504.9, 5979.94, 590.01),0)
					notified = 0
					inArena = true
                    TriggerEvent("np-paintball:enterStadium")
                end
            end
        end

        if exitArena < 10 then
            inRange = true

            DrawMarker(2, 5504.9, 5979.94, 590.01, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

            if exitArena < 1 then
				-- if notified <= 3 then
					-- QBCore.Functions.Notify("Your Inventory will be Wiped upon leaving, Thanks for coming to the event!!", 'error')
					-- notified = notified + 1
					-- Wait(1000)
					-- if notified > 20 then
						-- notified = 0
					-- end
				-- end
                DrawText3Ds(5504.9, 5979.94, 590.01, "[E] Exit Stadium")
                if IsControlJustReleased(0, 38) then
					TriggerServerEvent('np-paintball:clearinventory:client')
                    TeleportPlayer(vector3(-282.42, -2031.59, 30.15), 292.64)
					inArena = false
					notified = 0
					SetPedArmour(PlayerPedId(),0)
                    TriggerEvent("np-paintball:leaveStadium")
                end
            end
        end

        if paintballVendor < 10 then
            inRange = true

            DrawMarker(2, 5517.92, 5992.95, 590.01, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

            if paintballVendor < 1 then
                DrawText3Ds(5517.92, 5992.95, 590.01 , "[E] Paintball Vendor")
                if IsControlJustReleased(0, 38) then
                    TriggerEvent("np-paintball:getVendor")
                end
            end
        end

        if paintballItems < 10 then
            inRange = true

            DrawMarker(2, 5509.89, 5996.51, 590.01, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

            if paintballItems < 1 then
                DrawText3Ds(5509.89, 5996.51, 590.01 , "[E] Paintball Items")
                if IsControlJustReleased(0, 38) then
                    TriggerEvent("np-paintball:getItems")
                end
            end
        end

        if not inRange then
            Citizen.Wait(1500)
        end

        Citizen.Wait(5)
    end
end)

local paintballItems = {
    ['weapon_snspistol_mk2'] = {
        name = 'Paintball Gun',
        txt = "1x",
        event = "np-paintball:getPaintballGun"
    },
    ['paintball-ammo'] = {
        name = 'Paintball Ammo',
        txt = "5x",
        event = "np-paintball:getPaintballAmmo"
    },
    ['wasteland'] = {
        name = 'Enabled Wasteland',
        txt = "Map",
        event = "np-paintball:setArenaType"
    }
}

RegisterNetEvent('np-paintball:getItems', function()
    local dataMenu = {}
    for _, pData in pairs(paintballItems) do
        table.insert(dataMenu, {
            id = #dataMenu + 1,
            header = pData.name,
            txt = pData.txt,
            params = {
                event = pData.event
            }
        })
    end
    TriggerEvent('nh-context:sendMenu', dataMenu)
end)

RegisterNetEvent("np-paintball:getPaintballGun", function()
    TriggerServerEvent("np-paintball:getPaintballGuns")
end)

RegisterNetEvent("np-paintball:getPaintballAmmo", function()
    TriggerServerEvent("np-paintball:getPaintballAmmos")
end)

RegisterNetEvent("np-paintball:getPaintballSmoke", function()
    TriggerServerEvent("np-paintball:getPaintballSmokes")
end)

AddEventHandler("np-polyzone:enter", function(zone)
    if zone ~= "paintball_arena" then return end
    inArena = true
end)

AddEventHandler("np-polyzone:exit", function(zone)
    if zone ~= "paintball_arena" then return end
    inArena = false
    lastHitByPaintball = false
end)


AddEventHandler("pd:deathcheck", function()
    isDead = not isDead
end)

local arenaVariations = {
    ["set_arena_dirt"] = {
      ["wasteland"] = true,
    },
    ["set_npa"] = {
      ["wasteland"] = true,
    },
}

AddEventHandler("np-paintball:setArenaType", function(pArgs)
    QBCore.Functions.TriggerCallback("np-paintball:setArenaType")
end)
  
RegisterNetEvent("np-paintball:changeArenaType", function(pType)
    local cInteriorId = GetInteriorAtCoords(5505.03, 5997.68, 590.0)
    for k, v in pairs(arenaVariations) do
        DeactivateInteriorEntitySet(cInteriorId, k)
    end
    for k, v in pairs(arenaVariations) do
        if v[pType] then
        ActivateInteriorEntitySet(cInteriorId, k)
        end
    end
    RefreshInterior(cInteriorId)
end)

Citizen.CreateThread(function()
    Citizen.Wait(60000)
    TriggerServerEvent("np-paintball:getArenaType")
end)

Enabled = {
    ['Playground_1'] = true,
    ['Terrain_1'] = true,
    ['Vegetation_1'] = true,
}

IPLs = {
    Playground_1 = {
        "gabz_npa_hyperpipe",
    },
    Terrain_1 = {
        "gabz_npa_terrain1",
    },
    Vegetation_1 = {
        "gabz_npa_fern_proc",
        "gabz_npa_grass_mix_proc",
        "gabz_npa_grass_proc",
        "gabz_npa_grass_sm_proc",
        "gabz_npa_grass_xs_proc",
        "gabz_npa_log_proc",
        "gabz_npa_stones_proc",
        "gabz_npa_trees"
    },
}
 
RegisterNetEvent("np-paintball:startDeadCheck", function(inArena)
	local inArena = inArena
	Citizen.CreateThread(function()
		
		while true do 
			-- print('Arena:'..tostring(inArena))
			-- print('Dead:'..tostring(isDead))
			
			if (QBCore.Functions.GetPlayerData().metadata["isdead"]) or (QBCore.Functions.GetPlayerData().metadata["inlaststand"]) then
				isDead = true
			else
				isDead = false
			end
			if inArena and isDead then
				local spot = vector4(5493.07, 6007.91, 590.0, 346.36)
				Wait(5000)
				QBCore.Functions.Notify("You died! Dont call for help. You will be revived shortly!", 'error')
				TriggerEvent("hospital:client:Revive")
				Wait(5000)
				SetPedArmour(PlayerPedId(),100)
				DoScreenFadeOut(500)
				Wait(5000)
				SetEntityCoords(PlayerPedId(), spot.x, spot.y, spot.z+1)
				Wait(5000)
				TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING_POT_CLUBHOUSE", 0, false)
				QBCore.Functions.Notify("You died! Enjoy the rest of the game by watching, DO NOT RE-ENTER THE FIGHTING!", 'primary')
				DoScreenFadeIn(500)
				Wait(5000)
				TriggerEvent("hospital:client:Revive")
				isDead = false
				TriggerEvent('np-paintball:leaveTeam')
				-- print("revived in arena")
			end
			Wait(1000)
		end
	end)
end)
-- do not touch
Citizen.CreateThread(function()
    Citizen.Wait(60000)
    for category, iplName in pairs(IPLs) do
        if Enabled[category] then
        for k,v in pairs(iplName) do 
            RequestIpl(v)
        end
        end
    end
end)