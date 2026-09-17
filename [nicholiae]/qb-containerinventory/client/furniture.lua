local QBCore = exports['qb-core']:GetCoreObject()

-- Local variables
local DeployedFurniture = {}
local furnitureObjects = {}
local isDeployingFurniture = false
local deployingItem = nil

-- Helper Functions
local function DebugPrint(message)
    if Config.Debug then
        print('[QBContainerInventory-Furniture] ' .. message)
    end
end

local function DrawText3D(coords, text)
    local onScreen, x, y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local camCoords = GetGameplayCamCoords()
    local distance = #(coords - camCoords)
    
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov
    
    if onScreen then
        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(x, y)
    end
end

local function GetPlayerHouseId()
    -- This function should integrate with your housing system
    -- For now, we'll use a callback to get player houses
    local playerCoords = GetEntityCoords(PlayerPedId())
    local houseId = nil
    
    QBCore.Functions.TriggerCallback('qb-phone:server:GetPlayerHouses', function(houses)
        for _, house in ipairs(houses) do
            local distance = #(playerCoords - house.coords)
            if distance <= Config.HouseDeployment.maxDistance then
                houseId = house.id
                break
            end
        end
    end)
    
    -- Wait for callback
    while houseId == nil do
        Wait(10)
    end
    
    return houseId
end

-- Sync furniture from server
RegisterNetEvent('qb-containerinventory:client:SyncFurniture', function(furniture)
    DeployedFurniture = furniture
    -- Remove old objects
    for _, obj in pairs(furnitureObjects) do
        if DoesEntityExist(obj) then
            DeleteEntity(obj)
        end
    end
    furnitureObjects = {}
    
    -- Spawn new objects
    for id, data in pairs(DeployedFurniture) do
        SpawnFurnitureObject(id, data)
    end
    
    DebugPrint('Synced ' .. #DeployedFurniture .. ' furniture objects')
end)

-- Spawn furniture object
function SpawnFurnitureObject(id, data)
    local modelHash = GetHashKey(data.data.model)
    RequestModel(modelHash)
    
    local timeout = 0
    while not HasModelLoaded(modelHash) and timeout < 100 do
        Wait(10)
        timeout = timeout + 1
    end
    
    if HasModelLoaded(modelHash) then
        local coords = vector3(data.coords.x, data.coords.y, data.coords.z)
        local obj = CreateObject(modelHash, coords.x, coords.y, coords.z, false, false, false)
        SetEntityHeading(obj, data.coords.h or 0.0)
        FreezeEntityPosition(obj, true)
        SetEntityAsMissionEntity(obj, true, true)
        
        furnitureObjects[id] = obj
        
        -- Add to qb-target if enabled
        if Config.UseTarget then
            exports['qb-target']:AddTargetEntity(obj, {
                options = {
                    {
                        type = "client",
                        event = "qb-containerinventory:client:InteractFurniture",
                        icon = "fas fa-box-open",
                        label = "Open Storage",
                        furnitureId = id,
                        canInteract = function()
                            local PlayerData = QBCore.Functions.GetPlayerData()
                            return data.owner == PlayerData.citizenid
                        end
                    },
                    {
                        type = "client",
                        event = "qb-containerinventory:client:BreakInFurniture",
                        icon = "fas fa-lock-open",
                        label = "Break In",
                        furnitureId = id,
                        canInteract = function()
                            local PlayerData = QBCore.Functions.GetPlayerData()
                            return data.owner ~= PlayerData.citizenid and Config.BreakIn.enabled
                        end
                    },
                    {
                        type = "client",
                        event = "qb-containerinventory:client:RemoveFurniture",
                        icon = "fas fa-trash",
                        label = "Remove Furniture",
                        furnitureId = id,
                        canInteract = function()
                            local PlayerData = QBCore.Functions.GetPlayerData()
                            return data.owner == PlayerData.citizenid
                        end
                    }
                },
                distance = Config.Interactions.openDistance
            })
        end
        
        DebugPrint('Spawned furniture object: ' .. id)
    else
        DebugPrint('Failed to load model: ' .. data.data.model)
    end
end

-- Furniture deployment
RegisterNetEvent('qb-containerinventory:client:UseFurniture', function(itemName)
    if isDeployingFurniture then
        QBCore.Functions.Notify('Already deploying furniture!', 'error')
        return
    end
    
    local furnitureConfig = Config.Furniture[itemName]
    if not furnitureConfig then return end
    
    isDeployingFurniture = true
    deployingItem = itemName
    
    QBCore.Functions.Notify('Press [E] to place furniture, [X] to cancel', 'primary', 5000)
    
    -- Get house ID
	if Config.HouseDeployment.requireOwnership then
		local houseId = GetPlayerHouseId()
		if not houseId and Config.HouseDeployment.requireOwnership then
			QBCore.Functions.Notify('You must be in your house to deploy furniture!', 'error')
			isDeployingFurniture = false
			deployingItem = nil
			return
		end
	end
    
    -- Preview object
    local modelHash = GetHashKey(furnitureConfig.model)
	
	
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(10)
    end
    
    local previewObj = CreateObject(modelHash, 0, 0, 0, false, false, false)
    SetEntityAlpha(previewObj, 150, false)
    SetEntityCollision(previewObj, false, false)
    -- Placement loop
    CreateThread(function()
		while isDeployingFurniture do
			local playerPed = PlayerPedId()
			local playerCoords = GetEntityCoords(playerPed)
			local heading = GetEntityHeading(playerPed)
			local forward = GetEntityForwardVector(playerPed)
			local placeCoords = playerCoords + (forward * 2.0)
			print(isDeployingFurniture)
			-- Raycast to ground
			local rayHandle = StartShapeTestRay(placeCoords.x, placeCoords.y, placeCoords.z + 2.0, placeCoords.x, placeCoords.y, placeCoords.z - 2.0, 1, playerPed, 0)
			local _, hit, hitCoords = GetShapeTestResult(rayHandle)
			
			if hit then
				SetEntityCoords(previewObj, hitCoords.x, hitCoords.y, hitCoords.z, false, false, false, false)
				SetEntityHeading(previewObj, heading)
				
				DrawText3D(hitCoords, Config.Interactions.deployText)
				
				-- Place furniture
				if IsControlJustReleased(0, 38) then -- E key
					TriggerServerEvent('qb-containerinventory:server:DeployFurniture', deployingItem, hitCoords, heading, houseId)
					DeleteEntity(previewObj)
					isDeployingFurniture = false
					deployingItem = nil
					break
				end
				
				-- Cancel
				if IsControlJustReleased(0, 73) then -- X key
					QBCore.Functions.Notify('Furniture placement cancelled', 'error')
					DeleteEntity(previewObj)
					isDeployingFurniture = false
					deployingItem = nil
					break
				end
			end
			Wait(0)
		end
    end)
end)

-- Interact with furniture
RegisterNetEvent('qb-containerinventory:client:InteractFurniture', function(data)
    local furnitureId = data.furnitureId
    TriggerServerEvent('qb-containerinventory:server:OpenFurniture', furnitureId)
end)

-- Break-in furniture
RegisterNetEvent('qb-containerinventory:client:BreakInFurniture', function(data)
    local furnitureId = data.furnitureId
    
    -- Show lockpick selection menu
    local menu = {
        {
            header = "Break In",
            isMenuHeader = true
        }
    }
    
    for lockpickType, config in pairs(Config.BreakIn.requiredItems) do
        table.insert(menu, {
            header = QBCore.Shared.Items[lockpickType].label,
            txt = 'Success Chance: ' .. config.successChance .. '%<br>Damage on Fail: ' .. config.damageOnFail .. ' HP',
            params = {
                event = "qb-containerinventory:client:StartBreakIn",
                args = {
                    furnitureId = furnitureId,
                    lockpickType = lockpickType
                }
            }
        })
    end
    
    table.insert(menu, {
        header = "Cancel",
        params = {
            event = "qb-menu:client:closeMenu"
        }
    })
    
    exports['qb-menu']:openMenu(menu)
end)

-- Start break-in
RegisterNetEvent('qb-containerinventory:client:StartBreakIn', function(data)
    TriggerServerEvent('qb-containerinventory:server:AttemptBreakIn', data.furnitureId, data.lockpickType)
end)

-- Break-in minigame
RegisterNetEvent('qb-containerinventory:client:StartBreakInMinigame', function(furnitureId, lockpickType, config)
    local success = false
    
    if Config.BreakIn.minigameType == 'qb-skillcheck' then
        -- Use qb-skillcheck
        local skillChecks = Config.BreakIn.skillCheckSettings[config.difficulty]
        
        exports['qb-skillcheck']:StartSkillCheck(#skillChecks, skillChecks, function(result)
            success = result
            TriggerServerEvent('qb-containerinventory:server:BreakInResult', furnitureId, lockpickType, success)
        end)
    elseif Config.BreakIn.minigameType == 'ps-ui' then
        -- Use ps-ui
        exports['ps-ui']:Circle(function(result)
            success = result
            TriggerServerEvent('qb-containerinventory:server:BreakInResult', furnitureId, lockpickType, success)
        end, #Config.BreakIn.skillCheckSettings[config.difficulty])
    else
        -- Simple random chance
        success = math.random(100) <= config.successChance
        TriggerServerEvent('qb-containerinventory:server:BreakInResult', furnitureId, lockpickType, success)
    end
end)

-- Remove furniture
RegisterNetEvent('qb-containerinventory:client:RemoveFurniture', function(data)
    local furnitureId = data.furnitureId
    
    QBCore.Functions.TriggerCallback('qb-core:server:confirm', function(confirmed)
        if confirmed then
            TriggerServerEvent('qb-containerinventory:server:RemoveFurniture', furnitureId)
        end
    end, 'Are you sure you want to remove this furniture? You will get the item back.')
	
end)
-- synch furniture receive
RegisterNetEvent('qb-containerinventory:client:receiveSynch', function(furniture)

    DeployedFurniture = furniture
	if #DeployedFurniture > 0 then
		DebugPrint('Client furniture script loaded successfully')
		
	else
		DebugPrint('Client furniture script loaded 0 DeployedFurniture')
	end
   
end)

-- Furniture interaction thread (if not using qb-target)
CreateThread(function()
    if not Config.UseTarget then
        while true do
            local sleep = 1000
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local PlayerData = QBCore.Functions.GetPlayerData()
            
            for id, obj in pairs(furnitureObjects) do
                if DoesEntityExist(obj) then
                    local objCoords = GetEntityCoords(obj)
                    local distance = #(playerCoords - objCoords)
                    
                    if distance < Config.Interactions.openDistance then
                        sleep = 0
                        local furniture = DeployedFurniture[id]
                        
                        if furniture then
                            if furniture.owner == PlayerData.citizenid then
                                DrawText3D(objCoords, Config.Interactions.drawText)
                                
                                if IsControlJustReleased(0, 38) then -- E key
                                    TriggerServerEvent('qb-containerinventory:server:OpenFurniture', id)
                                end
                            elseif Config.BreakIn.enabled then
                                DrawText3D(objCoords, Config.Interactions.breakInText)
                                
                                if IsControlJustReleased(0, 38) then -- E key
                                    TriggerEvent('qb-containerinventory:client:BreakInFurniture', {furnitureId = id})
                                end
                            end
                        end
                    end
                end
            end
            
            Wait(sleep)
        end
    end
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	-- Initialize
	CreateThread(function()
		Wait(2000)
		TriggerServerEvent('qb-containerinventory:server:requestSynchFurniture')
		
		-- QBCore.Functions.TriggerCallback('qb-containerinventory:server:GetAllFurniture', function(furniture)
			-- 
		-- end)
	end)
end)