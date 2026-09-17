local lastRadar = nil
local HasAlreadyEnteredMarker = false

local function IsInMarker(playerPos, speedCam)
	-- if #(playerPos - vector3(speedCam.x, speedCam.y, speedCam.z)) < 30.0 then
		-- print(#(playerPos - vector3(speedCam.x, speedCam.y, speedCam.z)))
	-- end
	return #(playerPos - vector3(speedCam.x, speedCam.y, speedCam.z)) < 30.0
end

local function HandleSpeedCam(speedCam, radarID)
	local playerPed = PlayerPedId()
	local playerPos = GetEntityCoords(playerPed)
	local isInMarker = IsInMarker(playerPos, speedCam)
	-- print(playerPed)
	-- print(playerPos)
	-- print(isInMarker)
	if isInMarker and not HasAlreadyEnteredMarker and lastRadar == nil then
		HasAlreadyEnteredMarker = true
		lastRadar = radarID

		local vehicle = GetPlayersLastVehicle()
		
		if IsPedInAnyVehicle(playerPed, false) and GetPedInVehicleSeat(vehicle, -1) == playerPed then
			local plate = QBCore.Functions.GetPlate(vehicle)
			QBCore.Functions.TriggerCallback('police:IsPlateFlagged', function(isFlagged)
				if isFlagged then
					local coords = GetEntityCoords(playerPed)
					local blipsettings = {
						x = coords.x,
						y = coords.y,
						z = coords.z,
						sprite = 488,
						color = 1,
						scale = 0.9,
						text = Lang:t('info.camera_speed', { radarid = radarID })
					}
					-- local street1, street2 = table.unpack(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
					local street1, street2 = (GetStreetNameAtCoord(coords.x, coords.y, coords.z))
					local street1name = GetStreetNameFromHashKey(street1)
					local street2name = GetStreetNameFromHashKey(street2)
					print(street1name)
					print(street2name)
					TriggerServerEvent('police:server:FlaggedPlateTriggered', radarID, plate, street1name, street2name, blipsettings, coords)
				end
			end, plate)
		end
	end

	if not isInMarker and HasAlreadyEnteredMarker and lastRadar == radarID then
		HasAlreadyEnteredMarker = false
		lastRadar = nil
	end
end

CreateThread(function()
	while true do
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			for i = 1, #Config.Radars do
				local value = Config.Radars[i]
				HandleSpeedCam(value, i)
			end
			Wait(1)
		else
			Wait(1000)
		end
	end
end)
