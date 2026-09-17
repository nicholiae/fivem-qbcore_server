QBCore = exports['qb-core']:GetCoreObject()
local soliciting = false
local hasTarget = false
local trickTime = nil
local lastPed = {}
local stealingPed = nil
local stealData = {}
local availableDrugs = {}
local currentOfferDrug = nil
local CurrentCops = 0
local playerInput = {}
local rewardInput = {
    [1] = math.random(1,3),
    [2] = math.random(1,3),
    [3] = math.random(1,3)
}
local textDrawn = false
local zoneMade = false
local currentProstituteModel = nil
local currentProstituteName = nil

-- Functions
local function LoadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end
end

local function GetProstituteData(model)
    return Config.Prostitutes[model]
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    local player = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()
    TriggerServerEvent('NS-PickUp:server:setMyData')
end)

local function GenerateRewardInput()
    rewardInput = {
        [1] = math.random(1,3),
        [2] = math.random(1,3),
        [3] = math.random(1,3)
    }
end

local function DoWeGetRewarded(playerInput, pedModel)
    local matchResults = {}
    local CrimReward = 0
    local isCop = false
	SetPedAsNoLongerNeeded(ped)
	TaskWanderStandard(ped, 10.0, 10)
	soliciting = false
	hasTarget = false
	trickTime = nil
	currentProstituteModel = nil
	currentProstituteName = nil
    for k,v in pairs(rewardInput) do
        local matched = v == playerInput[k]
        matchResults[k] = {
            input = playerInput[k],
            expected = rewardInput[k],
            matched = matched
        }
        
        if matched then
            local PlayerData = QBCore.Functions.GetPlayerData()
            QBCore.Functions.Notify('Yours ['..tostring(playerInput[k])..'] MATCHED your escorts ['..tostring(rewardInput[k])..'] REWARD GRANTED', 'success')
            local pimpmultiplier = PlayerData.metadata.pimpmultiplier
            CrimReward = CrimReward + 1
            
            if pimpmultiplier >= Config.MaxMultiplier then
                pimpmultiplier = Config.MaxMultiplier
                QBCore.Functions.Notify('Your Base Multiplier cannot go any higher than '..pimpmultiplier, 'warning')
            end
        else
            QBCore.Functions.Notify('Your ['..tostring(playerInput[k])..'] did not match your escorts ['..tostring(rewardInput[k])..']', 'error')
        end
        Wait(1000)
    end
    
    -- Send results to server for processing
    TriggerServerEvent('NS-PickUp:server:ProcessInteraction', pedModel, matchResults, trickPrice)
end

local function DoCopGetRewarded(playerInput)
    local CopReward = 0
    local PlayerData = QBCore.Functions.GetPlayerData()
    local isCop = true
    
    for k,v in pairs(rewardInput) do
        if v == playerInput[k] then
            QBCore.Functions.Notify('Yours ['..tostring(playerInput[k])..'] MATCHED your escorts ['..tostring(rewardInput[k])..']', 'success')
            CopReward = CopReward + 1
        else
            QBCore.Functions.Notify('Your ['..tostring(playerInput[k])..'] did not match your escorts ['..tostring(rewardInput[k])..']', 'error')
        end
        Wait(1000)
    end
    
    if CopReward >= 2 then
        local pimpmultiplier = PlayerData.metadata.pimpmultiplier
        if pimpmultiplier >= Config.MaxMultiplier then
            pimpmultiplier = Config.MaxMultiplier
            TriggerServerEvent('NS-PickUp:server:addMultiplier', pimpmultiplier, isCop, CopReward)
            QBCore.Functions.Notify('Your Pimp Multiplier cannot go any higher than '..pimpmultiplier, 'warning')
        else
            pimpmultiplier = pimpmultiplier + 0.1
            TriggerServerEvent('NS-PickUp:server:addMultiplier', pimpmultiplier, isCop, CopReward)
            QBCore.Functions.Notify('Your Pimp Multiplier has been raised to '..pimpmultiplier, 'success')
        end
    else
        QBCore.Functions.Notify('You did not get the information you need.', 'error')
    end
end

local function TooFarAway()
    QBCore.Functions.Notify(Lang:t('error.too_far_away'), 'error')
    LocalPlayer.state:set('inv_busy', false, true)
    soliciting = false
    hasTarget = false
    trickTime = nil
    currentProstituteModel = nil
    currentProstituteName = nil
end

local function makeHerAWoman(ped, trickTime, pedModel)
    local playerInput = {}
    local counter = 0
    textDrawn = false
    
    while #playerInput < 3 do
        if not textDrawn then
            textDrawn = true
            exports['qb-core']:DrawText(Lang:t('info.what_now'))
        end
        
        if IsControlJustReleased(0, 38) then -- E
            exports['qb-core']:KeyPressed()
            textDrawn = false
            RequestAnimDict('mini@prostitutes@sexnorm_veh')
            while not HasAnimDictLoaded('mini@prostitutes@sexnorm_veh') do
                Wait(0)
            end
            TaskPlayAnim(ped, 'mini@prostitutes@sexnorm_veh', 'bj_loop_prostitute', 8.0, -8.0, -1, 1, 0, false, false, false)
            Wait(1000)
            RequestAnimDict('mini@prostitutes@sexnorm_veh')
            while not HasAnimDictLoaded('mini@prostitutes@sexnorm_veh') do
                Wait(0)
            end
            TaskPlayAnim(PlayerPedId(), 'mini@prostitutes@sexnorm_veh', 'bj_loop_male', 8.0, -8.0, -1, 1, 0, false, false, false)
            Wait(trickTime*60000)
            StopAnimTask(ped, 'mini@prostitutes@sexnorm_veh', 'bj_loop_prostitute', 8.0)
            StopAnimTask(PlayerPedId(), 'mini@prostitutes@sexnorm_veh', 'bj_loop_male', 8.0)
            textDrawn = false
            counter += 1
            playerInput[counter] = 1
        end
        
        if IsControlJustReleased(0, 246) then -- Y
            exports['qb-core']:KeyPressed()
            textDrawn = false
            RequestAnimDict('mini@prostitutes@sexlow_veh_first_person')
            while not HasAnimDictLoaded('mini@prostitutes@sexlow_veh_first_person') do
                Wait(0)
            end
            TaskPlayAnim(ped, 'mini@prostitutes@sexlow_veh_first_person', 'low_car_sex_to_prop_p1_female', 8.0, -8.0, -1, 1, 0, false, false, false)
            Wait(1000)
            RequestAnimDict('mini@prostitutes@sexlow_veh_first_person')
            while not HasAnimDictLoaded('mini@prostitutes@sexlow_veh_first_person') do
                Wait(0)
            end
            TaskPlayAnim(PlayerPedId(), 'mini@prostitutes@sexlow_veh_first_person', 'low_car_sex_to_prop_p1_player', 8.0, -8.0, -1, 1, 0, false, false, false)
            Wait(trickTime*60000)
            StopAnimTask(ped, 'mini@prostitutes@sexlow_veh_first_person', 'low_car_sex_to_prop_p1_female', 8.0)
            StopAnimTask(PlayerPedId(), 'mini@prostitutes@sexlow_veh_first_person', 'low_car_sex_to_prop_p1_player', 8.0)
            textDrawn = false
            counter += 1
            playerInput[counter] = 2
        end
        
        if IsControlJustReleased(0, 303) then -- U
            exports['qb-core']:KeyPressed()
            textDrawn = false
            RequestAnimDict('mini@prostitutes@sexnorm_veh')
            while not HasAnimDictLoaded('mini@prostitutes@sexnorm_veh') do
                Wait(0)
            end
            TaskPlayAnim(ped, 'mini@prostitutes@sexnorm_veh', 'sex_loop_prostitute', 8.0, -8.0, -1, 1, 0, false, false, false)
            Wait(1000)
            RequestAnimDict('mini@prostitutes@sexnorm_veh')
            while not HasAnimDictLoaded('mini@prostitutes@sexnorm_veh') do
                Wait(0)
            end
            TaskPlayAnim(PlayerPedId(), 'mini@prostitutes@sexnorm_veh', 'sex_loop_male', 8.0, -8.0, -1, 1, 0, false, false, false)
            Wait(trickTime*60000)
            StopAnimTask(ped, 'mini@prostitutes@sexnorm_veh', 'sex_loop_prostitute', 8.0)
            StopAnimTask(PlayerPedId(), 'mini@prostitutes@sexnorm_veh', 'sex_loop_male', 8.0)
            textDrawn = false
            counter += 1
            playerInput[counter] = 3
        end
        Wait(1)
    end
    
    ClearPedTasksImmediately(ped)
    Wait(3000)
    DoWeGetRewarded(playerInput, pedModel)
end

local function goToSomePlace(ped, trickTime, pedModel)
    local movetoCoords = Config.Locations[math.random(1,#Config.Locations)]
    
    -- ClearPedTasksImmediately(ped)
    -- TaskVehicleDriveToCoord(ped, GetVehiclePedIsIn(ped), movetoCoords.x, movetoCoords.y, movetoCoords.z, 17.0, 1.0, GetEntityModel(GetVehiclePedIsIn(ped)), 786603, 5.0)
    
    -- Wait(5000)
    
    local arrived = false
    while not arrived do
        local pedCoords = GetEntityCoords(ped)
        local dist = #(vector3(movetoCoords.x, movetoCoords.y, movetoCoords.z) - pedCoords)
        SetNewWaypoint(movetoCoords.x,movetoCoords.y)
        if dist <= 10.0 then
            arrived = true
            -- ClearPedTasksImmediately(ped)
            -- TaskLeaveVehicle(ped, GetVehiclePedIsIn(ped), 0)
            -- Wait(3000)
            makeHerAWoman(ped, trickTime, pedModel)
            
        end
        Wait(1000)
    end
end

local function goToSomePlaceAsCop(ped, trickTime)
    local movetoCoords = Config.Locations[math.random(1,#Config.Locations)]
    
    -- ClearPedTasksImmediately(ped)
    -- TaskVehicleDriveToCoord(ped, GetVehiclePedIsIn(ped), movetoCoords.x, movetoCoords.y, movetoCoords.z, 17.0, 1.0, GetEntityModel(GetVehiclePedIsIn(ped)), 786603, 5.0)
    
    -- Wait(5000)
    local arrived = false
    while not arrived do
        local pedCoords = GetEntityCoords(ped)
        local dist = #(vector3(movetoCoords.x, movetoCoords.y, movetoCoords.z) - pedCoords)
		SetNewWaypoint(movetoCoords.x,movetoCoords.y)
        
        if dist <= 10.0 then
            arrived = true
            -- ClearPedTasksImmediately(ped)
            -- TaskLeaveVehicle(ped, GetVehiclePedIsIn(ped), 0)
            -- Wait(3000)
            
            local playerInput = {}
            local counter = 0
            textDrawn = false
            
            while #playerInput < 3 do
                if not textDrawn then
                    textDrawn = true
                    exports['qb-core']:DrawText(Lang:t('info.what_now'))
                end
                
                if IsControlJustReleased(0, 38) then -- E
                    exports['qb-core']:KeyPressed()
                    textDrawn = false
                    counter += 1
                    playerInput[counter] = 1
                end
                
                if IsControlJustReleased(0, 246) then -- Y
                    exports['qb-core']:KeyPressed()
                    textDrawn = false
                    counter += 1
                    playerInput[counter] = 2
                end
                
                if IsControlJustReleased(0, 303) then -- U
                    exports['qb-core']:KeyPressed()
                    textDrawn = false
                    counter += 1
                    playerInput[counter] = 3
                end
                Wait(1)
            end
            
            DoCopGetRewarded(playerInput)
            Wait(5000)
            SetPedAsNoLongerNeeded(ped)
            TaskWanderStandard(ped, 10.0, 10)
            soliciting = false
            hasTarget = false
            trickTime = nil
        end
        Wait(1000)
    end
end

local function RobberyPed()
    local ped = stealingPed
    local pedCoords = GetEntityCoords(ped)
    local pedDist = #(GetEntityCoords(PlayerPedId()) - pedCoords)
    
    CreateThread(function()
        -- ✅ Track BOTH distance AND death
        while pedDist < 100.0 and not IsPedDeadOrDying(ped) do
            pedCoords = GetEntityCoords(ped)
            pedDist = #(GetEntityCoords(PlayerPedId()) - pedCoords)
            Wait(100)
        end
        
        -- ✅ Check why loop ended
        if IsPedDeadOrDying(ped) then
            -- Ped was killed - return money
            QBCore.Functions.Notify('You recovered your stolen money from the body', 'success')
            TriggerServerEvent('NS-PickUp:server:giveStolenMoney', stealData.money)
        else
            -- Ped escaped - dont return money
            QBCore.Functions.Notify('You did NOT recover your stolen money from the hoe', 'warning')
            -- TriggerServerEvent('NS-PickUp:server:giveStolenMoney', stealData.money)
        end
        
        stealingPed = nil
        stealData = {}
    end)
end


local function QuestionPed(ped)
    hasTarget = true
    
    for i = 1, #lastPed, 1 do
        if lastPed[i] == ped then
            hasTarget = false
            return
        end
    end
    
    local successChance = math.random(1, 100)
    local scamChance = math.random(1, 100)
    local getRobbed = math.random(1, 100)
    
    if successChance <= Config.SuccessChance then
        hasTarget = false
        return
    end
    
    trickPrice = math.random(Config.MinimumSalePrice, Config.MaximumSalePrice)
    trickTime = math.ceil(trickPrice / 20000)
    if trickTime >= 2 then
        trickTime = 1.5
    end
    
    SetEntityAsNoLongerNeeded(ped)
    ClearPedTasks(ped)
    
    local coords = GetEntityCoords(PlayerPedId(), true)
    local pedCoords = GetEntityCoords(ped)
    local pedDist = #(coords - pedCoords)
    
    while pedDist > 2.5 do
        coords = GetEntityCoords(PlayerPedId(), true)
        pedCoords = GetEntityCoords(ped)
        TaskGoStraightToCoord(ped, coords, 1.2, -1, 0.0, 0.0)
        pedDist = #(coords - pedCoords)
        Wait(100)
    end
    
    TaskLookAtEntity(ped, PlayerPedId(), 5500.0, 2048, 3)
    TaskTurnPedToFaceEntity(ped, PlayerPedId(), 5500)
    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT', 0, false)
    
    if hasTarget then
        while pedDist < 2.5 and not IsPedDeadOrDying(ped) do
            local coords2 = GetEntityCoords(PlayerPedId(), true)
            local pedCoords2 = GetEntityCoords(ped)
            local pedDist2 = #(coords2 - pedCoords2)
            
            if pedDist2 < 2.5 and soliciting then
                if Config.UseTarget and not zoneMade then
                    zoneMade = true
                    exports['qb-target']:AddEntityZone('sellingPed', ped, {
                        name = 'sellingPed',
                        debugPoly = false,
                    }, {
                        options = {
                            {
                                icon = 'fas fa-hand-holding-dollar',
                                label = Lang:t('info.offer', { tricktime = trickTime, trickprice = trickPrice }),
                                action = function(entity)
                                    if not IsPedInAnyVehicle(PlayerPedId(), false) then
                                        QBCore.Functions.Notify(Lang:t('error.in_vehicle'), 'error')
                                        hasTarget = false
                                        soliciting = false
                                        SetPedKeepTask(entity, false)
                                        SetEntityAsNoLongerNeeded(entity)
                                        ClearPedTasksImmediately(entity)
                                        lastPed[#lastPed + 1] = entity
                                        exports['qb-target']:RemoveZone('sellingPed')
                                        return
                                    else
                                        exports['qb-target']:RemoveZone('sellingPed')
                                        QBCore.Functions.Progressbar('soliciting', Lang:t('info.selling_to_ped'), '1000', false, false, {
                                            disableMovement = true,
                                            disableCarMovement = true,
                                            disableMouse = false,
                                            disableCombat = false,
                                        }, {}, {}, {}, function()
                                            hasTarget = false
                                            TriggerServerEvent('NS-PickUp:server:Solicit', trickPrice)
                                            lastPed[#lastPed + 1] = ped
                                            exports['qb-target']:RemoveZone('sellingPed')
                                            soliciting = false
											TaskEnterVehicle(ped, GetVehiclePedIsIn(PlayerPedId()), 60000, 0, 2.0, 0, 0)
											local timeout = 0
											local maxTimeout = 10 -- 20 seconds
											while not IsPedInVehicle(ped, GetVehiclePedIsIn(PlayerPedId()), false) and timeout < maxTimeout do
												TaskEnterVehicle(ped, GetVehiclePedIsIn(PlayerPedId()), 60000, 0, 2.0, 0, 0)
												-- print(ped)
												-- print(GetVehiclePedIsIn(PlayerPedId()))
												-- print(IsPedInVehicle(ped, GetVehiclePedIsIn(PlayerPedId()), false))
												Wait(2000)
												timeout = timeout + 1
											end
											SetPedKeepTask(ped, true)
											if IsPedInVehicle(ped, GetVehiclePedIsIn(PlayerPedId()), false) then
												goToSomePlace(ped, trickTime, pedModel)
											else
												-- Handle failure
												QBCore.Functions.Notify('The escort failed to enter the vehicle', 'error')
												-- Cleanup code...
											end
                                        end)
                                    end
                                end,
                            },
                            {
                                icon = 'fas fa-x',
                                label = 'Decline offer',
                                action = function(entity)
                                    QBCore.Functions.Notify(Lang:t('error.offer_declined'), 'error')
                                    soliciting = false
                                    hasTarget = false
                                    SetPedKeepTask(entity, false)
                                    SetEntityAsNoLongerNeeded(entity)
                                    ClearPedTasksImmediately(entity)
                                    lastPed[#lastPed + 1] = entity
                                    exports['qb-target']:RemoveZone('sellingPed')
                                end,
                            },
                        },
                        distance = 1.5,
                    })
                elseif not Config.UseTarget then
                    if not textDrawn then
                        textDrawn = true
                        exports['qb-core']:DrawText(Lang:t('info.offer', { tricktime = trickTime, trickprice = trickPrice }))
                    end
                    
                    if IsControlJustPressed(0, 38) then
                        if not IsPedInAnyVehicle(PlayerPedId(), false) then
                            QBCore.Functions.Notify(Lang:t('error.in_vehicle'), 'error')
                            exports['qb-core']:KeyPressed()
                            textDrawn = false
                            ToggleSelling()
                            hasTarget = false
                            SetPedKeepTask(ped, false)
                            SetEntityAsNoLongerNeeded(ped)
                            ClearPedTasksImmediately(ped)
                            TaskWanderStandard(ped, 10, 10)
                            lastPed[#lastPed + 1] = ped
                            break
                        else
                            exports['qb-core']:KeyPressed()
                            textDrawn = false
                            QBCore.Functions.Progressbar('soliciting', Lang:t('info.selling_to_ped'), '1000', false, false, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = false,
                            }, {}, {}, {}, function()
                                hasTarget = false
                                TriggerServerEvent('NS-PickUp:server:Solicit', trickPrice)
                                lastPed[#lastPed + 1] = ped
                                exports['qb-target']:RemoveZone('sellingPed')
                                soliciting = false
								TaskEnterVehicle(ped, GetVehiclePedIsIn(PlayerPedId()), 60000, 0, 2.0, 0, 0)
								local timeout = 0
								local maxTimeout = 10 -- 20 seconds
								while not IsPedInVehicle(ped, GetVehiclePedIsIn(PlayerPedId()), false) and timeout < maxTimeout do
									TaskEnterVehicle(ped, GetVehiclePedIsIn(PlayerPedId()), 60000, 0, 2.0, 0, 0)
									-- print(ped)
									-- print(GetVehiclePedIsIn(PlayerPedId()))
									-- print(IsPedInVehicle(ped, GetVehiclePedIsIn(PlayerPedId()), false))
									Wait(2000)
									timeout = timeout + 1
								end
								SetPedKeepTask(ped, true)
								if IsPedInVehicle(ped, GetVehiclePedIsIn(PlayerPedId()), false) then
									goToSomePlace(ped, trickTime, pedModel)
								else
									-- Handle failure
									QBCore.Functions.Notify('The escort failed to enter the vehicle', 'error')
									-- Cleanup code...
								end
                            end)
                        end
                    end
                    
                    if IsControlJustPressed(0, 48) then
                        exports['qb-core']:KeyPressed()
                        textDrawn = false
                        QBCore.Functions.Notify(Lang:t('error.offer_declined'), 'error')
                        hasTarget = false
                        soliciting = false
                        SetPedKeepTask(ped, false)
                        SetEntityAsNoLongerNeeded(ped)
                        ClearPedTasksImmediately(ped)
                        TaskWanderStandard(ped, 10, 10)
                        lastPed[#lastPed + 1] = ped
                        break
                    end
                end
            else
                if Config.UseTarget then
                    zoneMade = false
                    exports['qb-target']:RemoveZone('sellingPed')
                else
                    if textDrawn then
                        exports['qb-core']:HideText()
                        textDrawn = false
                    end
                end
                hasTarget = false
                soliciting = false
                SetPedKeepTask(ped, false)
                SetEntityAsNoLongerNeeded(ped)
                ClearPedTasksImmediately(ped)
                TaskWanderStandard(ped, 10, 10)
                lastPed[#lastPed + 1] = ped
                break
            end
            Wait(0)
        end
        Wait(math.random(4000, 7000))
    end
end

local function SellToPed(ped)
    hasTarget = true
    local pedModel = GetEntityModel(ped)
    local prostituteData = GetProstituteData(pedModel)
    
    -- Store current prostitute info
    currentProstituteModel = pedModel
    currentProstituteName = prostituteData and prostituteData.name or "Unknown"
    
    for i = 1, #lastPed, 1 do
        if lastPed[i] == ped then
            hasTarget = false
            return
        end
    end
    
    local successChance = math.random(1, 100)
    local scamChance = math.random(1, 100)
    local getRobbed = math.random(1, 100)
    
    if successChance <= Config.SuccessChance then
        hasTarget = false
        return
    end
    
    trickPrice = math.random(Config.MinimumSalePrice, Config.MaximumSalePrice)
    trickTime = math.ceil(trickPrice / 20000)
    if trickTime >= 2 then
        trickTime = 1.5
    end
    
    if scamChance <= Config.ScamChance then
        trickPrice = math.random(500000, 1000000)
    end
    
    SetEntityAsNoLongerNeeded(ped)
    ClearPedTasks(ped)
    
    local coords = GetEntityCoords(PlayerPedId(), true)
    local pedCoords = GetEntityCoords(ped)
    local pedDist = #(coords - pedCoords)
    
    if getRobbed <= Config.RobberyChance then
        TaskGoStraightToCoord(ped, coords, 15.0, -1, 0.0, 0.0)
    else
        TaskGoStraightToCoord(ped, coords, 1.2, -1, 0.0, 0.0)
    end
    
    while pedDist > 2.5 do
        coords = GetEntityCoords(PlayerPedId(), true)
        pedCoords = GetEntityCoords(ped)
        if getRobbed <= Config.RobberyChance then
            TaskGoStraightToCoord(ped, coords, 15.0, -1, 0.0, 0.0)
        else
            TaskGoStraightToCoord(ped, coords, 1.2, -1, 0.0, 0.0)
        end
        pedDist = #(coords - pedCoords)
        Wait(100)
    end
    
    TaskLookAtEntity(ped, PlayerPedId(), 5500.0, 2048, 3)
    TaskTurnPedToFaceEntity(ped, PlayerPedId(), 5500)
    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT', 0, false)
    
    if hasTarget then
        while pedDist < 2.5 and not IsPedDeadOrDying(ped) do
            local coords2 = GetEntityCoords(PlayerPedId(), true)
            local pedCoords2 = GetEntityCoords(ped)
            local pedDist2 = #(coords2 - pedCoords2)
            
            if getRobbed <= Config.RobberyChance then
                local moneyrobbed = math.random(Config.MinimumSalePrice + Config.MinRisk, Config.MaximumSalePrice + Config.MaxRisk)
                QBCore.Functions.TriggerCallback('NS-PickUp:server:checkcash', function(cb)
                    moneyrobbed = cb
                    TriggerServerEvent('NS-PickUp:server:robSolicitor', moneyrobbed)
                    QBCore.Functions.Notify(Lang:t('info.has_been_robbed', { money = moneyrobbed }))
                    stealingPed = ped
                    stealData = {
                        money = moneyrobbed,
                    }
                    hasTarget = false
                    local moveto = GetEntityCoords(PlayerPedId())
                    local movetoCoords = { x = moveto.x + math.random(100, 500), y = moveto.y + math.random(100, 500), z = moveto.z, }
                    ClearPedTasksImmediately(ped)
                    TaskGoStraightToCoord(ped, movetoCoords.x, movetoCoords.y, movetoCoords.z, 15.0, -1, 0.0, 0.0)
                    lastPed[#lastPed + 1] = ped
                    RobberyPed()
                    currentProstituteModel = nil
                    currentProstituteName = nil
                end, moneyrobbed)
                break
            else
                if pedDist2 < 2.5 and soliciting then
                    -- Show relationship info if available
                    local offerText = Lang:t('info.offer', { tricktime = trickTime, trickprice = trickPrice })
                    if prostituteData then
                        offerText = prostituteData.name .. ' - ' .. offerText
                    end
                    
                    if Config.UseTarget and not zoneMade then
                        zoneMade = true
                        exports['qb-target']:AddEntityZone('sellingPed', ped, {
                            name = 'sellingPed',
                            debugPoly = false,
                        }, {
                            options = {
                                {
                                    icon = 'fas fa-hand-holding-dollar',
                                    label = offerText,
                                    action = function(entity)
                                        if not IsPedInAnyVehicle(PlayerPedId(), false) then
                                            QBCore.Functions.Notify(Lang:t('error.in_vehicle'), 'error')
                                            hasTarget = false
                                            ToggleSelling()
                                            SetPedKeepTask(entity, false)
                                            SetEntityAsNoLongerNeeded(entity)
                                            ClearPedTasksImmediately(entity)
                                            lastPed[#lastPed + 1] = entity
                                            exports['qb-target']:RemoveZone('sellingPed')
                                            currentProstituteModel = nil
                                            currentProstituteName = nil
                                            return
                                        else
										
                                            exports['qb-target']:RemoveZone('sellingPed')
                                            QBCore.Functions.Progressbar('soliciting', Lang:t('info.selling_to_ped'), '1000', false, false, {
                                                disableMovement = true,
                                                disableCarMovement = true,
                                                disableMouse = false,
                                                disableCombat = false,
                                            }, {}, {}, {}, function()
                                                hasTarget = false
                                                TriggerServerEvent('NS-PickUp:server:Solicit', trickPrice, pedModel)
                                                lastPed[#lastPed + 1] = ped
                                                exports['qb-target']:RemoveZone('sellingPed')
                                                soliciting = false
                                                TaskEnterVehicle(ped, GetVehiclePedIsIn(PlayerPedId()), 60000, 0, 2.0, 0, 0)
												local timeout = 0
												local maxTimeout = 10 -- 20 seconds
												while not IsPedInVehicle(ped, GetVehiclePedIsIn(PlayerPedId()), false) and timeout < maxTimeout do
													TaskEnterVehicle(ped, GetVehiclePedIsIn(PlayerPedId()), 60000, 0, 2.0, 0, 0)
													-- print(ped)
													-- print(GetVehiclePedIsIn(PlayerPedId()))
													-- print(IsPedInVehicle(ped, GetVehiclePedIsIn(PlayerPedId()), false))
													Wait(2000)
													timeout = timeout + 1
												end
                                                SetPedKeepTask(ped, true)
												if IsPedInVehicle(ped, GetVehiclePedIsIn(PlayerPedId()), false) then
													goToSomePlace(ped, trickTime, pedModel)
												else
													-- Handle failure
													QBCore.Functions.Notify('The escort failed to enter the vehicle', 'error')
													-- Cleanup code...
												end
                                            end)
                                        end
                                    end,
                                },
                                {
                                    icon = 'fas fa-x',
                                    label = 'Decline offer',
                                    action = function(entity)
                                        QBCore.Functions.Notify(Lang:t('error.offer_declined'), 'error')
                                        ToggleSelling()
                                        hasTarget = false
                                        SetPedKeepTask(entity, false)
                                        SetEntityAsNoLongerNeeded(entity)
                                        ClearPedTasksImmediately(entity)
                                        lastPed[#lastPed + 1] = entity
                                        exports['qb-target']:RemoveZone('sellingPed')
                                        currentProstituteModel = nil
                                        currentProstituteName = nil
                                    end,
                                },
                            },
                            distance = 1.5,
                        })
                    elseif not Config.UseTarget then
                        if not textDrawn then
                            textDrawn = true
                            exports['qb-core']:DrawText(offerText)
                        end
                        
                        if IsControlJustPressed(0, 38) then
                            if not IsPedInAnyVehicle(PlayerPedId(), false) then
                                QBCore.Functions.Notify(Lang:t('error.in_vehicle'), 'error')
                                exports['qb-core']:KeyPressed()
                                textDrawn = false
                                hasTarget = false
                                SetPedKeepTask(ped, false)
                                SetEntityAsNoLongerNeeded(ped)
                                ClearPedTasksImmediately(ped)
                                TaskWanderStandard(ped, 10, 10)
                                lastPed[#lastPed + 1] = ped
                                currentProstituteModel = nil
                                currentProstituteName = nil
                                break
                            else
                                exports['qb-core']:KeyPressed()
                                textDrawn = false
                                QBCore.Functions.Progressbar('soliciting', Lang:t('info.selling_to_ped'), '1000', false, false, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = false,
                                }, {}, {}, {}, function()
                                    hasTarget = false
                                    TriggerServerEvent('NS-PickUp:server:Solicit', trickPrice, pedModel)
                                    lastPed[#lastPed + 1] = ped
                                    exports['qb-target']:RemoveZone('sellingPed')
                                    soliciting = false
									TaskEnterVehicle(ped, GetVehiclePedIsIn(PlayerPedId()), 60000, 0, 2.0, 0, 0)
									local timeout = 0
									local maxTimeout = 10 -- 20 seconds
									while not IsPedInVehicle(ped, GetVehiclePedIsIn(PlayerPedId()), false) and timeout < maxTimeout do
										TaskEnterVehicle(ped, GetVehiclePedIsIn(PlayerPedId()), 60000, 0, 2.0, 0, 0)
										-- print(ped)
										-- print(GetVehiclePedIsIn(PlayerPedId()))
										-- print(IsPedInVehicle(ped, GetVehiclePedIsIn(PlayerPedId()), false))
										Wait(2000)
										timeout = timeout + 1
									end
									SetPedKeepTask(ped, true)
									if IsPedInVehicle(ped, GetVehiclePedIsIn(PlayerPedId()), false) then
										goToSomePlace(ped, trickTime, pedModel)
									else
										-- Handle failure
										QBCore.Functions.Notify('The escort failed to enter the vehicle', 'error')
										-- Cleanup code...
									end
                                end)
                            end
                        end
                        
                        if IsControlJustPressed(0, 48) then
                            exports['qb-core']:KeyPressed()
                            textDrawn = false
                            QBCore.Functions.Notify(Lang:t('error.offer_declined'), 'error')
                            soliciting = false
                            hasTarget = false
                            SetPedKeepTask(ped, false)
                            SetEntityAsNoLongerNeeded(ped)
                            ClearPedTasksImmediately(ped)
                            TaskWanderStandard(ped, 10, 10)
                            lastPed[#lastPed + 1] = ped
                            currentProstituteModel = nil
                            currentProstituteName = nil
                            break
                        end
                    end
                else
                    if Config.UseTarget then
                        zoneMade = false
                        exports['qb-target']:RemoveZone('sellingPed')
                    else
                        if textDrawn then
                            exports['qb-core']:HideText()
                            textDrawn = false
                        end
                    end
                    hasTarget = false
                    SetPedKeepTask(ped, false)
                    soliciting = false
                    SetEntityAsNoLongerNeeded(ped)
                    ClearPedTasksImmediately(ped)
                    TaskWanderStandard(ped, 10, 10)
                    lastPed[#lastPed + 1] = ped
                    currentProstituteModel = nil
                    currentProstituteName = nil
                    break
                end
            end
            Wait(0)
        end
        Wait(math.random(4000, 7000))
    end
end

local function ToggleSelling()
    if not soliciting then
        soliciting = true
        LocalPlayer.state:set('inv_busy', true, true)
        QBCore.Functions.Notify(Lang:t('info.started_solicitation'))
        local startLocation = GetEntityCoords(PlayerPedId())
        local PlayerData = QBCore.Functions.GetPlayerData()
        
        CreateThread(function()
            while soliciting do
                local player = PlayerPedId()
                local coords = GetEntityCoords(player)
                
                if not hasTarget then
                    local PlayerPeds = {}
                    if next(PlayerPeds) == nil then
                        for _, activePlayer in ipairs(GetActivePlayers()) do
                            local ped = GetPlayerPed(activePlayer)
                            PlayerPeds[#PlayerPeds + 1] = ped
                        end
                    end
                    
                    local closestPed, closestDistance = QBCore.Functions.GetClosestPed(coords, PlayerPeds)
                    
                    if closestDistance < 10.0 and closestPed ~= 0 and not IsPedInAnyVehicle(closestPed) and GetPedType(closestPed) ~= 28 then
                        local pedModel = GetEntityModel(closestPed)
                        
                        -- Check if this is a valid prostitute model
                        if GetProstituteData(pedModel) then
                            local isACop = false
                            for k, v in pairs(Config.ServiceJobs) do
                                if PlayerData.job.name == v then
                                    isACop = true
                                    break
                                end
                            end
                            
                            if isACop == true then
                                QuestionPed(closestPed)
                            else
                                SellToPed(closestPed)
                            end
                        end
                    end
                end
                
                local startDist = #(startLocation - coords)
                if startDist > 10 then
                    TooFarAway()
                end
                Wait(0)
            end
        end)
    else
        stealingPed = nil
        soliciting = false
        LocalPlayer.state:set('inv_busy', false, true)
        QBCore.Functions.Notify(Lang:t('info.stopped_solicitation'))
        currentProstituteModel = nil
        currentProstituteName = nil
    end
end

-- Events
RegisterNetEvent('NS-PickUp:client:Solicitation', function()
    -- QBCore.Functions.TriggerCallback('NS-StreetTricks:server:canWeCrime', function(results)
	
    -- local PlayerData = QBCore.Functions.GetPlayerData()
	-- if PlayerData.job ~= 'cityservice' then
	if IsPedInAnyVehicle(PlayerPedId(), true) then
		ToggleSelling()
	else
		QBCore.Functions.Notify(Lang:t('error.in_vehicle'), 'error')
	end
	-- else
		-- QBCore.Functions.Notify('You can not commit crime in a Blue Zone', 'error', 10000)
	-- end
    -- end)
end)

RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

RegisterNetEvent('NS-PickUp:client:refreshSolicitation', function()
    soliciting = false
    hasTarget = false
    trickTime = nil
    currentProstituteModel = nil
    currentProstituteName = nil
    
    if ped then
        SetPedKeepTask(ped, false)
        TaskWanderStandard(ped, 10, 10)
        lastPed[#lastPed + 1] = ped
        SetEntityAsNoLongerNeeded(ped)
        ClearPedTasksImmediately(ped)
        DeleteEntity(ped)
    end
    LocalPlayer.state:set('inv_busy', false, true)
end)

RegisterNetEvent('NS-PickUp:client:setMyMultiplier', function(multi)
    local player = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()
    PlayerData.metadata['pimpmultiplier'] = multi
end)