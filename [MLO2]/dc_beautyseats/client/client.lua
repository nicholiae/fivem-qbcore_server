local QBCore = exports['qb-core']:GetCoreObject()

local function loadAnimDict(dict)
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(0)
        end
    end
end

-- Function to play animation
local function playAnimation(ped, animDict, animName)
    loadAnimDict(animDict)
    TaskPlayAnim(ped, animDict, animName, 8.0, 8.0, -1, 15, 0, false, false, false)
end

-- Set up targets for each station
-- Set up targets for each station
for sectionName, sectionData in pairs(Config.Sections) do
    for stationIndex, stationData in ipairs(sectionData.stations) do
		
        -- Client Target Setup
        if stationData.client then
            local clientOptions = {
                {
                    type = 'client',  -- Specify the type as 'client'
                    event = 'salon:useStation',
                    icon = 'fa-solid fa-chair',
                    label = 'Use ' .. sectionName .. ' as Client',
                    args = {
                        role = 'client',
                        station = stationData
                    }
                }
            }
            if Config.Target == 'ox' then
                exports.ox_target:addSphereZone({
                    coords = stationData.client.targetCoords,
                    radius = 0.5,
                    options = clientOptions
                })
            elseif Config.Target == 'qb' then
                -- Generate a unique zone name
                local clientZoneName = 'salon_' .. sectionName .. '_client_' .. stationIndex
                exports["qb-target"]:AddCircleZone(clientZoneName, stationData.client.targetCoords, 0.5, {
                    name = clientZoneName,
                    useZ = true
                }, {
                    options = clientOptions,
                    distance = 1.5  -- Adjust the interaction distance as needed
                })
				
            end 
        end
        -- Employee Target Setup
		if stationData.employee then
			local employeeOptions = {
				{
					type = 'client',  -- Specify the type as 'client'
					event = 'salon:useStation',
					icon = 'fa-solid fa-user',
					label = 'Use ' .. sectionName .. ' as Employee',
					args = {
						role = 'employee',
						station = stationData
					}
				}
			}
			if Config.Target == 'ox' then
				exports.ox_target:addSphereZone({
					coords = stationData.employee.targetCoords,
					radius = 0.5,
					options = employeeOptions
				})
			elseif Config.Target == 'qb' then
				-- Generate a unique zone name
				local employeeZoneName = 'salon_' .. sectionName .. '_employee_' .. stationIndex
				exports["qb-target"]:AddCircleZone(employeeZoneName, stationData.employee.targetCoords, 0.5, {
					name = employeeZoneName,
					useZ = true
				}, {
					options = employeeOptions,
					distance = 1.5  -- Adjust the interaction distance as needed
				})
			end 
		end
    end
end


-- Event to handle station usage
RegisterNetEvent('salon:useStation')
AddEventHandler('salon:useStation', function(data)
    local playerPed = PlayerPedId()
	local notFound = true
    local roleData = data.args.role == 'client' and data.args.station.client or data.args.station.employee
	local Player = QBCore.Functions.GetPlayerData()
	local playerLoc = GetEntityCoords(playerPed)
	local PlayersList = QBCore.Functions.GetPlayers()
	local src = Player.source
	if data.args.role == 'employee' and Player.job.name ~= 'beauty' then return
	else
		if Player.job.name ~= 'beauty' then
			for _,PID in pairs(PlayersList) do
				local targetSource = GetPlayerServerId(PID)
				QBCore.Functions.TriggerCallback('salon:server:getPlayer', function(result)
					local targetPlayer = result
					if targetPlayer.PlayerData.job ~= nil then
						
						local targetJobName = targetPlayer.PlayerData.job.name
						local targetPed = GetPlayerPed(PID)
						local targetLoc = GetEntityCoords(targetPed)
						if targetJobName == 'beauty' then
							notFound = false
							if #(playerLoc - targetLoc) <= 5 then
								local allowedMenus = {
									{menu = "hair", label = 'Hair Menu', selected = false}
								}
								TriggerEvent('qb-clothing:client:outsideOpenMenu', allowedMenus)
								return
							else
								QBCore.Functions.Notify('Barber is not Nearby', 'warning')
							end
						end
					end
				end, targetSource)
				Wait(1000)
			end
			if notFound then
				QBCore.Functions.Notify('No Barber Online', 'warning')
				return
			end
		end
	end

	-- Force player to exact playerCoords
	FreezeEntityPosition(playerPed, true)
    SetEntityCoords(playerPed, roleData.playerCoords.x, roleData.playerCoords.y, roleData.playerCoords.z, true, true, true)
    SetEntityHeading(playerPed, roleData.heading)
	--FreezeEntityPosition(playerPed, true)
	SetEntityCollision(playerPed, false, false)
	SetEntityCompletelyDisableCollision(playerPed, true)

    -- Play animation locally
    playAnimation(playerPed, roleData.animDict, roleData.animName)

    -- Show Text UI
    lib.showTextUI(
	'[X] - Stand Up \n' ..
	'[Up Arrow] - Adjust Height Up \n' ..
	'[Down Arrow] - Adjust Height Down \n',
		{
        position = 'top-center',
        style = {
            backgroundColor = '#000000',
            color = '#FFFFFF'
        }
    })

    -- Optimized thread for key press
    CreateThread(function()
        while true do
            Wait(0)
			if IsControlJustReleased(0, 172) then
				local x, y, z = table.unpack(GetEntityCoords(playerPed))
				z = z + 0.01 -- Adjust this value as needed
				SetEntityCoordsNoOffset(playerPed, x, y, z, true, true, true)
			elseif IsControlJustReleased(0, 173) then
				local x, y, z = table.unpack(GetEntityCoords(playerPed))
				z = z - 0.01 -- Adjust this value as needed
				SetEntityCoordsNoOffset(playerPed, x, y, z, true, true, true)	
            elseif IsControlJustReleased(0, 73) then -- 73 is the control index for 'X'
                -- Stop animation and clear tasks
                ClearPedTasksImmediately(playerPed)

                -- Enable collision and unfreeze position
                FreezeEntityPosition(playerPed, false)
                SetEntityCollision(playerPed, true, true)

                -- Return to original coordinates
                SetEntityCoords(playerPed, roleData.returnCoords.x, roleData.returnCoords.y, roleData.returnCoords.z, false, false, false, true)
                SetEntityHeading(playerPed, roleData.returnCoords.w)

                -- Hide Text UI
                lib.hideTextUI()
                break
            end
        end
    end)
end)
