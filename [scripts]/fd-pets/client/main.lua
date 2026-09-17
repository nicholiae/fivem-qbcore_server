local General = require 'config.general'
local Animals = require 'config.animals'

AddRelationshipGroup('PlayerPet' .. GetPlayerServerId(PlayerId()))
AddRelationshipGroup('PetOwner' .. GetPlayerServerId(PlayerId()))

Data = {
    pet = nil,
    deathCheck = nil,
    recalled = nil,
    config = nil,
    selector = false,
    selected = {
        entity = nil,
        coords = nil,
    },
    actions = {}
}

Actions = {}

function retreivePetConfig(pet)
    return Animals[pet] or nil
end

function spawnPet(pet)
    if Data.pet then
        Data.recalled = true

        TriggerServerEvent("fd-pets:server:recallPet")
        Utils.Notification(locale("Pet has been recalled."), "success")

        return
    end

    local ped = PlayerPedId()
    local config = retreivePetConfig(pet)

    if not Utils.OnTryingToSpawnPet(pet, config) then
        return
    end

    if IsPedInAnyVehicle(ped, true) then
        return
    end

    if not config then
        Utils.Notification(locale("Animal config wans't found. Please contact your administrator!"), "error")
        return
    end

    config.model = type(config.model) == 'string' and GetHashKey(config.model) or config.model

    RequestModel(config.model)
    while not HasModelLoaded(config.model) do
        Wait(0)
    end

    local coords = GetEntityCoords(ped)
    local _, z = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z, false)

    TriggerServerEvent("fd-pets:server:spawnPet",
        { x = coords.x + 1, y = coords.y, z = z + 0.4, heading = GetEntityHeading(ped) }, pet)

    SetModelAsNoLongerNeeded(config.model)
end

function playCallingAnimation(animation)
    if animation and animation.dict and animation.anim then
        local ped = PlayerPedId()

        while not HasAnimDictLoaded(animation.dict) do
            RequestAnimDict(animation.dict)
            Wait(5)
        end

        TaskPlayAnim(ped, animation.dict, animation.anim, 5.0, 1.5, 1000, 49, 0, 0, 0)
        Wait(400)
    end
end

function setUpPet(id, pet)
    while not NetworkDoesEntityExistWithNetworkId(id) do
        Wait(0)
    end

    Data.pet = id or nil

    if not Data.pet and Data.deathCheck then
        return clearDeathCheckInterval()
    end

    SetEntityOnlyDamagedByPlayer(NetToPed(Data.pet), true)

    SetBlockingOfNonTemporaryEvents(NetToPed(Data.pet), true)
    SetPedFleeAttributes(NetToPed(Data.pet), 0, 0)
    -- SetPedRelationshipGroupHash(NetToPed(Data.pet), GetHashKey('PlayerPet' .. GetPlayerServerId(PlayerId())))
    -- SetPedRelationshipGroupHash(PlayerPedId(), GetHashKey('PetOwner' .. GetPlayerServerId(PlayerId())))
    SetRelationshipBetweenGroups(1, GetHashKey('PlayerPet' .. GetPlayerServerId(PlayerId())),
        GetHashKey('PetOwner' .. GetPlayerServerId(PlayerId())))
    SetRelationshipBetweenGroups(1, GetHashKey('PetOwner' .. GetPlayerServerId(PlayerId())),
        GetHashKey('PlayerPet' .. GetPlayerServerId(PlayerId())))

    local config = retreivePetConfig(pet)

    if not config then
        Utils.Notification(locale("Cannot retreive pet config. Please contact administrator!"), "error")
        return
    end

    Utils.OnFinishingPetSetup(id, config, pet)

    Data.config = config

    startDeathCheckInterval()

    local hasControl = requestControl()

    for k, v in pairs(Data.config.actions) do
        Data.actions[k] = false
    end

    Utils.Notification(locale("Pet has been called."), "success")

    if Data.config.followOnSpawn then
        Actions.follow()
    end
end

function resetActions(ignore)
    if not Data.config then return end

    for k, v in pairs(Data.config.actions) do
        if ignore and k == ignore then
            if General.debug then
                print('Ignored key', k, ignore)
            end

            goto skip_loop
        end

        if General.debug then
            print('Resetting:', k)
        end

        Data.actions[k] = false

        ::skip_loop::
    end
end

function requestControl()
    while not NetworkHasControlOfNetworkId(Data.pet) do
        NetworkRequestControlOfNetworkId(Data.pet)
        Wait(0)
    end

    return true
end

Actions.follow = function()
    if not Data.pet or not Data.config then return end

    resetActions('follow')

    if GetScriptTaskStatus(NetToPed(Data.pet), 0x3EF867F4) ~= 1 and Data.actions.follow then
        Data.actions.follow = false
    end

    Data.actions.follow = not Data.actions.follow

    if Data.actions.follow then
        Utils.OnStartingAction("follow", Data.pet, Data.config, Data.selected)

        if General.debug then
            print('Starting action follow')
        end

        ClearPedTasksImmediately(NetToPed(Data.pet))
        local follow = PlayerPedId()

        if Data.selected.entity then
            follow = Data.selected.entity
        end

        TaskFollowToOffsetOfEntity(NetToPed(Data.pet), follow, 1.0, 0.0, 0.0, 10.0, -1, 0.0, true)
        SetPedKeepTask(NetToPed(Data.pet), true)

        resetSelectedObject()
        return
    end

    if General.debug then
        print('Clearing tasks')
    end

    resetSelectedObject()
    ClearPedTasks(NetToPed(Data.pet))
end

Actions.move = function()
    if not Data.pet or not Data.config then return end

    resetActions()

    if Data.selected.coords then
        Utils.OnStartingAction("move", Data.pet, Data.config, Data.selected)

        if General.debug then
            print('Starting action coords')
        end
        ClearPedTasks(NetToPed(Data.pet))

        local coords = Data.selected.coords
        TaskGoToCoordAnyMeans(NetToPed(Data.pet), coords[1], coords[2], coords[3], 5.0, 0, false, 0, 0)
    end

    resetSelectedObject()
end

Actions.attack = function()
    if not Data.pet or not Data.config then return end

    resetActions()

    local isPed = (IsEntityAPed(Data.selected.entity) and not IsPedDeadOrDying(Data.selected.entity))

    if isPed then
        Utils.OnStartingAction("attack", Data.pet, Data.config, Data.selected)

        if General.debug then
            print('Starting action attack')
        end

        ClearPedTasks(NetToPed(Data.pet))

        TaskCombatPed(NetToPed(Data.pet), Data.selected.entity, 0, 16)
        return
    end

    resetSelectedObject()
    ClearPedTasks(NetToPed(Data.pet))
end

Actions.getin = function()
    if not Data.pet or not Data.config then return end

    resetActions()

    if not IsPedInAnyVehicle(Data.pet) and Data.selected.entity and IsEntityAVehicle(Data.selected.entity) then
        local seat = nil
        ClearPedTasks(NetToPed(Data.pet))

        Utils.OnStartingAction("getin", Data.pet, Data.config, Data.selected)

        local locked = GetVehicleDoorLockStatus(Data.selected.entity)

        if locked ~= 0 and locked ~= 1 and locked ~= 3 then
            Utils.Notification(locale("Vehicle is locked!", "error"))

            return
        end

        local seats = GetVehicleModelNumberOfSeats(GetEntityModel(Data.selected.entity))

        for i = seats - 2, 0, -1 do
            local isFree = IsVehicleSeatFree(Data.selected.entity, i)

            if isFree then
                seat = i
                goto skip_loop
            end
        end

        ::skip_loop::

        if seat ~= nil and seat > -1 then
            local timer = GetGameTimer()
            local coords = Data.selected.coords
            local entity = Data.selected.entity

            Actions.move()

            while #(GetEntityCoords(NetToPed(Data.pet)) - vector3(coords[1], coords[2], coords[3])) > 2 do
                if GetGameTimer() > (timer + (10 * 1000)) then
                    return
                end

                Wait(0)
            end

            TaskEnterVehicle(NetToPed(Data.pet), entity, 1, seat, 1.0, 16, 0)

            while not IsPedInAnyVehicle(NetToPed(Data.pet)) do
                Wait(0)
            end

            animAction("sit")

            resetSelectedObject()

            return
        end
    end

    resetSelectedObject()
    ClearPedTasks(NetToPed(Data.pet))
end

Actions.getout = function()
    if not Data.pet or not Data.config then return end

    resetActions()

    if IsPedInAnyVehicle(NetToPed(Data.pet)) then
        ClearPedTasks(NetToPed(Data.pet))

        Utils.OnStartingAction("getout", Data.pet, Data.config, Data.selected)

        TaskLeaveAnyVehicle(NetToPed(Data.pet), 1, 16)
        FreezeEntityPosition(NetToPed(Data.pet), true)

        while IsPedInAnyVehicle(NetToPed(Data.pet)) do
            Wait(100)
        end

        local coords = GetEntityCoords(NetToPed(Data.pet))
        local _, z = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z, false)

        SetEntityCoords(NetToPed(Data.pet), coords.x, coords.y, z)
        FreezeEntityPosition(NetToPed(Data.pet), false)
    end

    resetSelectedObject()
    ClearPedTasks(NetToPed(Data.pet))
end

function animAction(action)
    if not Data.pet or not Data.config then return end

    if not Data.config.animations[action] then
        Utils.Notification(locale("Animation wasn't found. Please contact your administrator!"), "error")
        return
    end

    if not Data.config.animations[action].dict or not Data.config.animations[action].anim then
        Utils.Notification(locale("Animation wasn't found. Please contact your administrator!"), "error")
        return
    end

    if action == "sit" then
        local temp = Data.config.animations["sitInCar"]

        if IsPedInAnyVehicle(NetToPed(Data.pet)) and temp and temp.dict and temp.anim then
            action = "sitInCar"
        end
    end

    local animation = Data.config.animations[action]

    if animation.dict and animation.anim and not IsEntityPlayingAnim(NetToPed(Data.pet), animation.dict, animation.anim, 3) then
        Data.actions[action] = false
    end

    resetActions(action)

    Data.actions[action] = not Data.actions[action]

    if Data.actions[action] then
        ClearPedTasks(NetToPed(Data.pet))

        Utils.OnStartingAction(action, Data.pet, Data.config, Data.selected)

        if General.debug then
            print('Starting action', action)
        end

        while not HasAnimDictLoaded(animation.dict) do
            RequestAnimDict(animation.dict)
            Wait(0)
        end

        TaskPlayAnim(NetToPed(Data.pet), animation.dict, animation.anim, 1.0, 1.0, -1, 1, 1.0, false, false, false)

        resetSelectedObject()
        return
    end

    resetSelectedObject()

    ClearPedTasks(NetToPed(Data.pet))
end

function startDeathCheckInterval()
    if Data.deathCheck then
        clearDeathCheckInterval()
    end

    Data.deathCheck = true
    local exists = NetworkDoesEntityExistWithNetworkId(Data.pet)
    Citizen.CreateThread(function()
        while Data.deathCheck do
            Wait(1000)
            exists = NetworkDoesEntityExistWithNetworkId(Data.pet)

            if Data.recalled then
                if General.debug then
                    print("Recalled, ending clearing death check!")
                end

                clearDeathCheckInterval()
                return
            end

            if not exists then
                if General.debug then
                    print("Entity doesn't exist anymore!")
                end

                TriggerServerEvent("fd-pets:server:entityDead")
                clearDeathCheckInterval()

                return
            end

            if IsEntityDead(NetToPed(Data.pet)) then
                if General.debug then
                    print("Entity is dead, null value!")
                    print(Data.config.name)
                end
				
				TriggerServerEvent("fd-pets:server:deleteTheDead", Data.config.name) 
                TriggerServerEvent("fd-pets:server:entityDead")
                clearDeathCheckInterval()

                return
            end
        end
    end)
end

function clearDeathCheckInterval()
    Data.deathCheck = nil
    Data.pet = nil
    Data.config = nil

    resetActions()

    Data.actions = {}
    Data.recalled = false

    return true
end

function rotationToDirection(coords)
    local dividedPi = math.pi / 180

    local adjustedRotation = vector3(dividedPi * coords.x, dividedPi * coords.y, dividedPi * coords.z)

    local direction = vector3(
        -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
        math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
        math.sin(adjustedRotation.x)
    )

    return direction
end

function rayCastGamePlayCamera(distance)
    local cameraRotation = GetGameplayCamRot()
    local camCoords = GetGameplayCamCoord()

    local direction = rotationToDirection(cameraRotation)

    local destination = vector3(
        camCoords.x + direction.x * distance,
        camCoords.y + direction.y * distance,
        camCoords.z + direction.z * distance
    )

    local ray = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, destination.x, destination.y, destination.z, 27,
        PlayerPedId(), 0)

    local rayHandle, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(ray)

    return hit, endCoords, entityHit, surfaceNormal
end

function resetSelectedObject()
    Data.selected = {
        entity = nil,
        coords = nil
    }
end

function startPetActions()
    if Data.selector and Data.selected.coords and Data.pet then
        openPetActions(true)
    end

    if not Data.pet then return end

    Data.selector = not Data.selector

    if Data.selector then
        Citizen.CreateThread(function()
            while Data.selector and not IsPedInAnyVehicle(PlayerPedId(), false) do
                Wait(0)

                local hit, coords, entity = rayCastGamePlayCamera(General.selectionDistance or 30.0)

                local isVehicle = IsEntityAVehicle(entity)
                local isPed = (IsEntityAPed(entity) and not IsPedDeadOrDying(entity))

                if hit and not isVehicle and not isPed then
                    DrawMarker(1, coords.x, coords.y, coords.z + 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 250,
                        249, 246, 120, false, true, 2, false, nil, nil, false)
                    Data.selected = {
                        entity = nil,
                        coords = coords
                    }

                    goto skip_loop
                end

                if isVehicle or isPed then
                    local ecoords = GetEntityCoords(entity)
                    local min, max = GetModelDimensions(GetEntityModel(entity))
                    local scale = isVehicle and 0.45 or 0.3

                    DrawMarker(2, ecoords.x, ecoords.y, ecoords.z + (max.z - min.z), 0.0, 0.0, 0.0, 0.0, 180.0, 0.0,
                        scale, scale, scale, 227, 11, 92, 120, true, true, 2, true, nil, nil, false)

                    Data.selected = {
                        entity = entity,
                        coords = coords
                    }

                    goto skip_loop
                end

                Data.selected = {
                    entity = nil,
                    coords = nil
                }

                ::skip_loop::
            end
        end)

        return
    end

    Data.selector = false
end

function changeState(action, toggle)
    if Data.actions[action] then
        Data.actions[action] = toggle
    end
end

function openPetActions(selection)
    if not Data.pet then return end

    if not Utils.OnOpeningMenu(Data.config, Data.selected) then
        return
    end

    local compiledMenu = {}

    local isEntitySelected = Data.selected.entity
    local isPlayer = (Data.selected.entity and IsPedAPlayer(Data.selected.entity)) and true or false
    local isPed = (Data.selected.entity and IsEntityAPed(Data.selected.entity)) and true or false
    local isVehicle = (Data.selected.entity and IsEntityAVehicle(Data.selected.entity)) and true or false
    local isPetInVehicle = (Data.pet and IsPedInAnyVehicle(NetToPed(Data.pet))) and true or false
    local isFromSelectionMenu = selection

    local type = "base"

    if (Data.selected.coords or Data.selected.entity) and isFromSelectionMenu then
        type = "selection"
    end

    if isPed then
        type = "ped"
    end

    if isPlayer then
        type = "player"
    end

    if isVehicle then
        type = "vehicle"
    end

    if Data.selected.entity == NetToPed(Data.pet) then
        type = "base"
    end

    if isPetInVehicle then
        type = "invehicle"
    end

    if type == "base" then
        Data.selector = false
        resetSelectedObject()
    end

    if Data.config.actions then
        for key, value in pairs(Data.config.actions) do
            local capitalized = (key:gsub("^%l", string.upper))

            if lib.table.contains(value, type) then
                compiledMenu[#compiledMenu + 1] = {
                    title = locale(capitalized),
                    description = locale(capitalized .. " Helptext"),
                    event = 'fd-pets:actions:perform',
                    args = key,
                }
            end
        end
    end

    lib.registerContext({
        id = 'fd_petmenu',
        title = locale("MenuTitle"),
        description = locale("MenuSubtitle"),
        options = compiledMenu
    })

    lib.showContext('fd_petmenu')
end
