local QBCore = exports['qb-core']:GetCoreObject()
local carryPackage = nil
local packageCoords = nil
local packageBlip = nil
local onDuty = false
local DropBlip = nil

-- Specialty Package Variables
local isSpecialtyPackage = false
local selectedSpecialtyItem = nil

-- zone check
local vehicle = nil
local entranceTargetID = 'entranceTarget'
local isInsideEntranceZone = false
local entranceZone = nil

local exitTargetID = 'exitTarget'
local isInsideExitZone = false
local exitZone = nil

local deliveryTargetID = 'deliveryTarget'
local isInsideDeliveryZone = false
local deliveryZone = nil

local dutyTargetID = 'dutyTarget'
local isInsideDutyZone = false
local dutyZone = nil

local pickupTargetID = 'pickupTarget'
local isInsidePickupZone = false
local pickupZone = nil

-- Functions

local function DestroyPickupTarget()
    if not pickupZone then
        return
    end

    if Config.UseTarget then
        exports['qb-target']:RemoveZone(pickupTargetID)
        pickupZone = nil
    else
        pickupZone:destroy()
        pickupZone = nil
        isInsidePickupZone = false
    end
end

local function GetDutyTargetText()
    local text = onDuty and Lang:t('text.clock_out') or Lang:t('text.clock_in')
    return text
end

local function RegisterDutyTarget()
    local coords = vector3(Config.DutyLocation.x, Config.DutyLocation.y, Config.DutyLocation.z)

    if Config.UseTarget then
        dutyZone = exports['qb-target']:AddBoxZone(dutyTargetID, coords, 2, 2, {
            name = dutyTargetID,
            heading = 270,
            minZ = Config.DutyLocation.z - 2.0,
            maxZ = Config.DutyLocation.z + 1.0,
            debugPoly = false,
        }, {
            options = {
                {
                    type = 'client',
                    event = 'NS-ForkLiftRecycling:client:target:toggleDuty',
                    label = GetDutyTargetText(),
                },
            },
            distance = 1.0
        })
    else
        dutyZone = BoxZone:Create(coords, 1, 1, {
            name = dutyTargetID,
            heading = 270,
            minZ = Config.DutyLocation.z - 2.0,
            maxZ = Config.DutyLocation.z + 1.0,
            debugPoly = false
        })

        dutyZone:onPlayerInOut(function(isPointInside)
            if isPointInside then
                exports['qb-core']:DrawText(GetDutyTargetText(), 'left')
            else
                exports['qb-core']:HideText()
            end

            isInsideDutyZone = isPointInside
        end)
    end
end

local function DestroyDutyTarget()
    if not dutyZone then
        return
    end

    if Config.UseTarget then
        exports['qb-target']:RemoveZone(dutyTargetID)
        dutyZone = nil
    else
        dutyZone:destroy()
        dutyZone = nil
        isInsideDutyZone = false
    end
end

local function RefreshDutyTarget()
    DestroyDutyTarget()
    RegisterDutyTarget()
end

local function SetLocationBlip()
    local RecycleBlip = AddBlipForCoord(Config.DutyLocation.x, Config.DutyLocation.y, Config.DutyLocation.z)
    SetBlipSprite(RecycleBlip, 365)
    SetBlipColour(RecycleBlip, 2)
    SetBlipScale(RecycleBlip, 0.8)
    SetBlipAsShortRange(RecycleBlip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('Import Exports')
    EndTextCommandSetBlipName(RecycleBlip)
end

local function SetPickUpLocationBlip()
    packageBlip = AddBlipForCoord(packageCoords.x, packageCoords.y, packageCoords.z)
    SetBlipSprite(packageBlip, 351)
    SetBlipColour(packageBlip, 2)
    SetBlipScale(packageBlip, 0.8)
    SetBlipAsShortRange(packageBlip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('Package')
    EndTextCommandSetBlipName(packageBlip)
end

local function SetDropOffBlip()
    DropBlip = AddBlipForCoord(Config.DropLocation.x, Config.DropLocation.y, Config.DropLocation.z)
    SetBlipSprite(DropBlip, 527)
    SetBlipColour(DropBlip, 2)
    SetBlipScale(DropBlip, 0.8)
    SetBlipAsShortRange(DropBlip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('DropOff')
    EndTextCommandSetBlipName(DropBlip)
end

local function RegisterDeliveyTarget()
    local coords = vector3(Config.DropLocation.x, Config.DropLocation.y, Config.DropLocation.z)
	
    if Config.UseTarget then
        deliveryZone = exports['qb-target']:AddBoxZone(deliveryTargetID, coords, 3, 3, {
            name = deliveryTargetID,
            heading = 270,
            minZ = Config.DropLocation.z - 2.0,
            maxZ = Config.DropLocation.z + 2.0,
            debugPoly = false,
        }, {
            options = {
                {
                    type = 'client',
                    event = 'NS-ForkLiftRecycling:client:target:dropPackage',
                    label = Lang:t('text.hand_in_package'),
                },
            },
            distance = 1.0
        })
    else
        deliveryZone = BoxZone:Create(coords, 3, 3, {
            name = deliveryTargetID,
            heading = 270,
            minZ = Config.DropLocation.z - 2.0,
            maxZ = Config.DropLocation.z + 2.0,
            debugPoly = false
        })

        deliveryZone:onPlayerInOut(function(isPointInside)
            if isPointInside and carryPackage then
                exports['qb-core']:DrawText(Lang:t('text.point_hand_in_package'), 'left')
            else
                exports['qb-core']:HideText()
            end

            isInsideDeliveryZone = isPointInside
        end)
    end
end

local function DestroyDeliveryTarget()
    if not deliveryZone then
        return
    end

    if Config.UseTarget then
        exports['qb-target']:RemoveZone(deliveryTargetID)
        deliveryZone = nil
    else
        deliveryZone:destroy()
        deliveryZone = nil
        isInsideDeliveryZone = false
    end
end

local function DestroyInsideZones()
    DestroyPickupTarget()
    DestroyExitTarget()
    DestroyDutyTarget()
    DestroyDeliveryTarget()
end

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

local function ScrapAnim()
    local time = 5
    loadAnimDict('mp_car_bomb')
    TaskPlayAnim(PlayerPedId(), 'mp_car_bomb', 'car_bomb_mechanic', 3.0, 3.0, -1, 16, 0, false, false, false)
    local openingDoor = true

    CreateThread(function()
        while openingDoor do
            TaskPlayAnim(PlayerPedId(), 'mp_car_bomb', 'car_bomb_mechanic', 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Wait(1000)
            time = time - 1
            if time <= 0 then
                openingDoor = false
                StopAnimTask(PlayerPedId(), 'mp_car_bomb', 'car_bomb_mechanic', 1.0)
            end
        end
    end)
end

local function GetRandomPackage()
    packageCoords = Config.PickupLocations[math.random(1, #Config.PickupLocations)]
    RegisterPickupTarget(packageCoords)
	SetPickUpLocationBlip()
end

local function PickupPackage()
    local pos = GetEntityCoords(PlayerPedId(), true)
	local posHeading = GetEntityForwardVector(PlayerPedId())
	-- print(posHeading)
    -- RequestAnimDict('anim@heists@box_carry@')
    -- while (not HasAnimDictLoaded('anim@heists@box_carry@')) do
        -- Wait(7)
    -- end
    -- TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 5.0, -1, -1, 50, 0, false, false, false)
    RequestModel(Config.PickupBoxModel)
    while not HasModelLoaded(Config.PickupBoxModel) do
        Wait(0)
    end
	
    local object = CreateObject(Config.PickupBoxModel, pos.x+posHeading.x, pos.y+posHeading.y, pos.z+posHeading.z, true, true, true)
    -- AttachEntityToEntity(object, vehicle, GetPedBoneIndex(PlayerPedId(), 57005), posHeading.x, posHeading.y, posHeading.z, 300.0, 250.0, 20.0, true, true, false, true, 1, true)
    AttachEntityToEntity(object, vehicle, "seat_dside_f", 0.0, 2.0, posHeading.z, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
	TriggerServerEvent('hud:server:GainStress', math.random(1, 10))
    carryPackage = object
	RemoveBlip(packageBlip)
	SetDropOffBlip()
end

local function DropPackage()
    ClearPedTasks(PlayerPedId())
    DetachEntity(carryPackage, true, true)
    DeleteObject(carryPackage)
    carryPackage = nil
	RemoveBlip(DropBlip)
	-- Reset specialty package state
	isSpecialtyPackage = false
	selectedSpecialtyItem = nil
end

local function CreateForkLift()
    
	if vehicle == nil then
		while not HasModelLoaded(Config.Vehicle) do 
			RequestModel(Config.Vehicle)
			Wait(0) 
		end
		vehicle = CreateVehicle(Config.Vehicle, Config.VehicleSpawn, Config.VehicleSpawnHeading, true, false) 
		SetModelAsNoLongerNeeded(Config.Vehicle)
        TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(vehicle))
        exports['myFuel']:SetFuel(vehicle, 100)
	else
		DeleteEntity(vehicle)
		vehicle = nil
	end
	
end

-- Check if player can afford specialty package
local function CanAffordSpecialtyPackage()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local cash = PlayerData.money['cash'] or 0
    local bank = PlayerData.money['bank'] or 0
    local totalMoney = cash + bank
    
    return totalMoney >= Config.SpecialtyPackageCost
end

-- Show specialty item selection menu
local function ShowSpecialtyItemMenu()
    local itemMenu = {
        {
            header = "Select Specialty Resource",
            isMenuHeader = true
        }
    }
    
    -- Add each item from ItemTable
    for i = 1, #Config.ItemTable do
        local itemName = Config.ItemTable[i]
        local itemData = QBCore.Shared.Items[itemName]
        local label = itemData and itemData.label or itemName
        
        itemMenu[#itemMenu + 1] = {
            header = label,
            txt = "This delivery will contain only " .. label,
            params = {
                event = "NS-ForkLiftRecycling:client:selectSpecialtyItem",
                args = {
                    item = itemName
                }
            }
        }
    end
    
    -- Add cancel option
    itemMenu[#itemMenu + 1] = {
        header = "Cancel",
        txt = "Go back to package selection",
        params = {
            event = "NS-ForkLiftRecycling:client:showPackageTypeMenu"
        }
    }
    
    exports['qb-menu']:openMenu(itemMenu)
end

-- Show package type selection menu
local function ShowPackageTypeMenu()
    local canAfford = CanAffordSpecialtyPackage()
    
    local packageMenu = {
        {
            header = "Select Package Type",
            isMenuHeader = true
        },
        {
            header = "Regular Package",
            txt = "Standard recycling package",
            params = {
                event = "NS-ForkLiftRecycling:client:confirmRegularPackage"
            }
        }
    }
    
    -- Add specialty package option
    if canAfford then
        packageMenu[#packageMenu + 1] = {
            header = "Specialty Package",
            txt = "Cost: $" .. Config.SpecialtyPackageCost .. " | Choose specific resource | +20% bonus chance",
            params = {
                event = "NS-ForkLiftRecycling:client:showSpecialtyItemMenu"
            }
        }
    else
        packageMenu[#packageMenu + 1] = {
            header = "Specialty Package",
            txt = "Cost: $" .. Config.SpecialtyPackageCost .. " | Insufficient funds",
            disabled = true
        }
    end
    
    -- Add cancel option
    packageMenu[#packageMenu + 1] = {
        header = "Cancel",
        txt = "Don't pick up package",
        params = {
            event = "NS-ForkLiftRecycling:client:cancelPackageSelection"
        }
    }
    
    exports['qb-menu']:openMenu(packageMenu)
end

function RegisterPickupTarget(coords)
    local targetCoords = vector3(coords.x, coords.y, coords.z)

    if Config.UseTarget then
        pickupZone = exports['qb-target']:AddBoxZone(pickupTargetID, targetCoords, 3, 3, {
            name = pickupTargetID,
            heading = coords.h,
            minZ = coords.z - 1.0,
            maxZ = coords.z + 2.0,
            debugPoly = false,
        }, {
            options = {
                {
                    type = 'client',
                    event = 'NS-ForkLiftRecycling:client:target:pickupPackage',
                    label = Lang:t('text.get_package'),
                },
            },
            distance = 1.0
        })
    else
        pickupZone = BoxZone:Create(targetCoords, 4, 1.5, {
            name = pickupTargetID,
            heading = coords.h,
            minZ = coords.z - 1.0,
            maxZ = coords.z + 2.0,
            debugPoly = false
        })

        pickupZone:onPlayerInOut(function(isPointInside)
            if isPointInside then
                exports['qb-core']:DrawText(Lang:t('text.point_get_package'), 'left')
            else
                exports['qb-core']:HideText()
            end

            isInsidePickupZone = isPointInside
        end)
    end
end

local function DrawPackageLocationBlip()
    if not Config.DrawPackageLocationBlip then
        return
    end
    DrawMarker(2, packageCoords.x, packageCoords.y, packageCoords.z + 3, 0, 0, 0, 180.0, 0, 0, 0.5, 0.5, 0.5, 255, 255, 0, 100, false, false, 2, true, nil, nil, false)
end

local function DrawPackageDropLocationBlip()
    if not Config.DrawPackageLocationBlip then
        return
    end
    DrawMarker(2, Config.DropLocation.x, Config.DropLocation.y, Config.DropLocation.z + 3, 0, 0, 0, 180.0, 0, 0, 0.5, 0.5, 0.5, 255, 255, 0, 100, false, false, 2, true, nil, nil, false)
end

-- Events

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    RegisterDutyTarget()
end)

RegisterNetEvent('NS-ForkLiftRecycling:client:target:toggleDuty', function()
    onDuty = not onDuty
    if onDuty then
        QBCore.Functions.Notify(Lang:t('success.you_have_been_clocked_in'), 'success')
		CreateForkLift()
        GetRandomPackage()
    else
        QBCore.Functions.Notify(Lang:t('error.you_have_clocked_out'), 'error')
		CreateForkLift()
		if packageBlip then
			RemoveBlip(packageBlip)
		end
		if DropBlip then
			RemoveBlip(DropBlip)
		end
        DestroyPickupTarget()
    end

    if carryPackage then
        DropPackage()
    end
    RefreshDutyTarget()
    DestroyDeliveryTarget()
end)

RegisterNetEvent('NS-ForkLiftRecycling:client:target:pickupPackage', function()
    if not pickupZone or carryPackage then
        return
    end

    if not Config.UseTarget and not isInsidePickupZone then
        return
    end

    -- Show package type selection menu
    ShowPackageTypeMenu()
end)

RegisterNetEvent('NS-ForkLiftRecycling:client:showPackageTypeMenu', function()
    ShowPackageTypeMenu()
end)

RegisterNetEvent('NS-ForkLiftRecycling:client:showSpecialtyItemMenu', function()
    ShowSpecialtyItemMenu()
end)

RegisterNetEvent('NS-ForkLiftRecycling:client:confirmRegularPackage', function()
    isSpecialtyPackage = false
    selectedSpecialtyItem = nil
    
    QBCore.Functions.Progressbar('pickup_reycle_package', Lang:t('text.picking_up_the_package'), Config.PickupActionDuration, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
    }, {}, {}, {}, function()
        packageCoords = nil
        ClearPedTasks(PlayerPedId())
        PickupPackage()
        DestroyPickupTarget()
        RegisterDeliveyTarget()
    end)
end)

RegisterNetEvent('NS-ForkLiftRecycling:client:selectSpecialtyItem', function(data)
    isSpecialtyPackage = true
    selectedSpecialtyItem = data.item
    print(selectedSpecialtyItem)
    -- Trigger server to check payment and pickup
    TriggerServerEvent('NS-ForkLiftRecycling:server:attemptSpecialtyPickup', selectedSpecialtyItem)
end)

RegisterNetEvent('NS-ForkLiftRecycling:client:specialtyPickupApproved', function()
    QBCore.Functions.Progressbar('pickup_reycle_package', Lang:t('text.picking_up_the_package'), Config.PickupActionDuration, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
    }, {}, {}, {}, function()
        packageCoords = nil
        ClearPedTasks(PlayerPedId())
        PickupPackage()
        DestroyPickupTarget()
        RegisterDeliveyTarget()
    end)
end)

RegisterNetEvent('NS-ForkLiftRecycling:client:specialtyPickupDenied', function()
    isSpecialtyPackage = false
    selectedSpecialtyItem = nil
    QBCore.Functions.Notify('Insufficient funds for specialty package', 'error')
end)

RegisterNetEvent('NS-ForkLiftRecycling:client:cancelPackageSelection', function()
    -- Just close the menu, player can reopen by going back to pickup zone
end)

RegisterNetEvent('NS-ForkLiftRecycling:client:target:dropPackage', function()
    if not carryPackage or not deliveryZone then
        return
    end
	
	local newFuel = math.ceil(GetVehicleFuelLevel(vehicle)) + 8
	if newFuel > 100 then
		newFuel = 100
	end	
	exports['myFuel']:SetFuel(vehicle,  newFuel)
    if not Config.UseTarget and not isInsideDeliveryZone then
        return
    end

	print(isSpecialtyPackage)
	print(selectedSpecialtyItem)
	TriggerServerEvent('NS-ForkLiftRecycling:server:getItem', isSpecialtyPackage, selectedSpecialtyItem)
    DropPackage()
    ScrapAnim()
    DestroyDeliveryTarget()
    QBCore.Functions.Progressbar('deliver_reycle_package', Lang:t('text.unpacking_the_package'), Config.DeliveryActionDuration, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
    }, {}, {}, {}, function()
        -- Done
        StopAnimTask(PlayerPedId(), 'mp_car_bomb', 'car_bomb_mechanic', 1.0)
        GetRandomPackage()
    end)
end)

-- Threads

CreateThread(function()
    local sleep = 500

    while not LocalPlayer.state.isLoggedIn do
        -- do nothing
        Wait(sleep)
    end

    SetLocationBlip()

    if Config.UseTarget then
        if not Config.DrawPackageLocationBlip then
            return
        end

        while true do
            sleep = 500

            if onDuty and packageCoords and not carryPackage then
                sleep = 0
                DrawPackageLocationBlip()
            end

            Wait(sleep)
        end
    else
        while true do
            sleep = 1
            if isInsideDutyZone then
                sleep = 0
                if IsControlJustReleased(0, 38) then
                    exports['qb-core']:KeyPressed()
                    Wait(500)
                    TriggerEvent('NS-ForkLiftRecycling:client:target:toggleDuty')
                    exports['qb-core']:HideText()
                end
            end

            if onDuty then
                if isInsidePickupZone and not carryPackage then
                    sleep = 0
                    if IsControlJustReleased(0, 38) then
                        exports['qb-core']:KeyPressed()
                        Wait(500)
                        TriggerEvent('NS-ForkLiftRecycling:client:target:pickupPackage')
                        exports['qb-core']:HideText()
                    end
                elseif packageCoords and not carryPackage then
                    sleep = 0
                    DrawPackageLocationBlip()
                end

                if isInsideDeliveryZone and carryPackage then
                    sleep = 0
                    if IsControlJustReleased(0, 38) then
                        exports['qb-core']:KeyPressed()
                        Wait(500)
                        TriggerEvent('NS-ForkLiftRecycling:client:target:dropPackage')
                        exports['qb-core']:HideText()
                    end
                elseif not isInsideDeliveryZone and carryPackage then
                    DrawPackageDropLocationBlip()
				end
            end

            Wait(sleep)
        end
    end
end)


AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    RegisterDutyTarget()
end)