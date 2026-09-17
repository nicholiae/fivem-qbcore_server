-- NS-PlayerBiology Dynamic Location Management
-- Simple client-side implementation
-- Receives new locations and updates Config.Sections

-- print('[NS-PlayerBiology] locations.lua is loading...')
-- print('[NS-PlayerBiology] Config.Sections exists:', Config.Sections ~= nil)
-- print('[NS-PlayerBiology] toiletChair stations count:', #Config.Sections.toiletChair.stations)

local QBCore = exports['qb-core']:GetCoreObject()


local function DrawAdvancedNativeText(x,y,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end


-- Client event: Add new location to Config.Sections
RegisterNetEvent('PlayerBiology:client:addLocation', function(locationType, index, locationData)
    -- Simply add the new location to Config.Sections
    Config.Sections[locationType].stations[index] = locationData


print(('[NS-PlayerBiology] Added new %s location at index %d'):format(locationType, index))
QBCore.Functions.Notify(string.format('New %s location added', locationType), 'success')

end)



-- Client event: synch all bathroom locations
RegisterNetEvent('PlayerBiology:client:synchLocations', function(DynamicLocations)
    print('[NS-PlayerBiology] Receiving dynamic locations sync...')
    
    -- Process each location type separately
    for locationType, locations in pairs(DynamicLocations) do
        if locations and #locations > 0 then
            print(('[NS-PlayerBiology] Processing %d %s locations'):format(#locations, locationType))
            
            -- Find the next available index for this location type
            local nextIndex = #Config.Sections[locationType].stations + 1
            
            -- Process each location in this type
            for _, location in ipairs(locations) do
                -- Convert JSON format to Config format
                local configLocation = {
                    targetCoords = vector3(location.targetCoords.x, location.targetCoords.y, location.targetCoords.z),
                    playerCoords = vector3(location.playerCoords.x, location.playerCoords.y, location.playerCoords.z),
                    heading = location.heading,
                    animDict = location.animDict,
                    animName = location.animName,
                    returnCoords = vector3(location.returnCoords.x, location.returnCoords.y, location.returnCoords.z),
                    id = location.id,
                    isDynamic = true
                }
                
                -- Add to Config.Sections at the correct index
                Config.Sections[locationType].stations[nextIndex] = configLocation
                nextIndex = nextIndex + 1
            end
        end
    end
    
    -- Recreate the target system with all locations (static + dynamic)
    blipps()
    setupBio()
    QBCore.Functions.Notify("Synchronized Bathroom Data", 'success')
    print('[NS-PlayerBiology] Dynamic locations integrated successfully')
	
end)



-- Override the setupbiology command to save instead of copy to clipboard
RegisterNetEvent('PlayerBiology:client:setupbiology', function()
    print('Beginning setup helper')


	local toiletanimDict = "timetable@michael@on_sofabase"
	local toiletanimName = "sit_sofa_base"

	local urinalanimDict = "misscarsteal2peeing"
	local urinalanimName = "peeing_loop"

	local showeranimDict = "mp_safehouseshower@male@"
	local showeranimName = "male_shower_idle_b"

	local tubanimDict = "rcm_barry3"
	local tubanimName = "barry_3_sit_loop"

	local sinkanimDict = "missheist_agency3aig_23"
	local sinkanimName = "urinal_sink_loop"

	print("Started helper")

	while true do
		DrawAdvancedNativeText(0.25, 0.20, 0.005, 0.0028, 0.35, "Press [H] - Capture Current Location", 100, 0, 255, 255, 0, 0)
		DrawAdvancedNativeText(0.25, 0.25, 0.005, 0.0028, 0.35, "Press [E] - Quit Helper", 100, 0, 255, 255, 0, 0)
    
		if IsControlJustReleased(0, 101) then -- H key
			Wait(1000)
			local location = GetEntityCoords(PlayerPedId())
			local heading = GetEntityHeading(PlayerPedId())
			
			while location ~= nil and heading ~= nil do
				DrawAdvancedNativeText(0.30, 0.45, 0.005, 0.0028, 0.35, "Press a Button below", 100, 0, 255, 255, 0, 0)
				DrawAdvancedNativeText(0.30, 0.50, 0.005, 0.0028, 0.35, "[E] = Toilet", 155, 155, 155, 255, 0, 0)
				DrawAdvancedNativeText(0.30, 0.55, 0.005, 0.0028, 0.35, "[Y] = Urinal", 155, 155, 155, 255, 0, 0)
				DrawAdvancedNativeText(0.30, 0.60, 0.005, 0.0028, 0.35, "[Z] = Shower", 155, 155, 155, 255, 0, 0)
				DrawAdvancedNativeText(0.30, 0.65, 0.005, 0.0028, 0.35, "[X] = Tub", 155, 155, 155, 255, 0, 0)
				DrawAdvancedNativeText(0.30, 0.70, 0.005, 0.0028, 0.35, "[H] = Sink", 155, 155, 155, 255, 0, 0)
				DrawAdvancedNativeText(0.30, 0.75, 0.005, 0.0028, 0.35, "[C] = Public", 155, 155, 155, 255, 0, 0)
				
				local locationType = nil
				local animDict = nil
				local animName = nil
				
				if IsControlJustReleased(0, 73) then -- X = Tub
					locationType = "bathTub"
					animDict = tubanimDict
					animName = tubanimName
				elseif IsControlJustReleased(0, 246) then -- Y = Urinal
					locationType = "urinalStand"
					animDict = urinalanimDict
					animName = urinalanimName
				elseif IsControlJustPressed(0, 20) then -- Z = Shower
					locationType = "showerStall"
					animDict = showeranimDict
					animName = showeranimName
				elseif IsControlJustReleased(0, 101) then -- H = Sink
					locationType = "handSink"
					animDict = sinkanimDict
					animName = sinkanimName
				elseif IsControlJustReleased(0, 103) then -- E = Toilet
					locationType = "toiletChair"
					animDict = toiletanimDict
					animName = toiletanimName
				elseif IsControlJustReleased(0, 26) then -- C = Public
					locationType = "public"
					animDict = toiletanimDict
					animName = toiletanimName
				end
				
				if locationType then
					-- Send to server instead of copying to clipboard
					TriggerServerEvent('PlayerBiology:server:saveLocation', {
						locationType = locationType,
						location = location,
						heading = heading,
						animDict = animDict,
						animName = animName
					})
					
					location = nil
					heading = nil
					break
				end
				
				Wait(0)
			end
		end
		
		if IsControlJustReleased(0, 103) then -- E key to quit
			break
		end
		
		Wait(0)
	end

end)
