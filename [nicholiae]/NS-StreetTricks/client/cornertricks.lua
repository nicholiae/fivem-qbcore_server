QBCore = exports['qb-core']:GetCoreObject()
local turningTrick = false
local hasTarget = false
local lastPed = {}
local stealingPed = nil
local stealData = {}
local currentOffer = nil
local CurrentCops = 0
local textDrawn = false
local zoneMade = false
local trickTime = 10

-- Functions
local function LoadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end
end

local function TooFarAway()
    QBCore.Functions.Notify(Lang:t('error.too_far_away'), 'error')
    LocalPlayer.state:set('inv_busy', false, true)
    turningTrick = false
    hasTarget = false
end

-- Fixed:
-- swapped the condition to `random <= Config.PoliceCallChance` so "Config.PoliceCallChance", represents the call probability.
local function PoliceCall()
    local player = PlayerPedId()
	local pid = GetPlayerServerId(NetworkGetPlayerIndexFromPed(player))
	-- QBCore.Functions.Notify(pid..' player id', 'error')
	local level = 1
	local message = "you are now wanted for solicitation"
    local randomnum = math.random(1, 100)
    -- QBCore.Functions.Notify(tostring(randomnum).." random number", 'error')
    if randomnum <= Config.PoliceCallChance then
		TriggerServerEvent('NS-Wantedhandler:server:addStars', pid, level, message)
        TriggerServerEvent('police:server:policeAlert', 'Trick in progress')
    end
end

local function RobberyPed()
    if Config.UseTarget then
        exports['qb-target']:AddEntityZone('stealingPed', stealingPed, {
            name = 'stealingPed',
            debugPoly = false,
        }, {
            options = {
                {
                    icon = 'fas fa-magnifying-glass',
                    label = Lang:t('info.search_ped'),
                    action = function()
                        local player = PlayerPedId()
                        RequestAnimDict('pickup_object')
                        while not HasAnimDictLoaded('pickup_object') do
                            Wait(0)
                        end
                        TaskPlayAnim(player, 'pickup_object', 'pickup_low', 8.0, -8.0, -1, 1, 0, false, false, false)
                        Wait(2000)
                        ClearPedTasks(player)
                        TriggerServerEvent('NS-StreetTricks:server:giveStolenMoney', stealData.money)--GIVE PLAYER MONEY BACK
                        stealingPed = nil
                        stealData = {}
                        exports['qb-target']:RemoveZone('stealingPed')
                    end,
                    canInteract = function(entity)
                        if IsEntityDead(entity) then
                            return true
                        end
                    end
                }
            },
            distance = 1.5,
        })
        CreateThread(function()
            while stealingPed do
                local playerPed = PlayerPedId()
                local pos = GetEntityCoords(playerPed)
                local pedpos = GetEntityCoords(stealingPed)
                local dist = #(pos - pedpos)
                if dist > 100 then
                    stealingPed = nil
                    stealData = {}
                    exports['qb-target']:RemoveZone('stealingPed')
                    break
                end
                Wait(0)
            end
        end)
    else
        CreateThread(function()
            while stealingPed do
                if IsEntityDead(stealingPed) then
                    local playerPed = PlayerPedId()
                    local pos = GetEntityCoords(playerPed)
                    local pedpos = GetEntityCoords(stealingPed)
                    if not Config.UseTarget and #(pos - pedpos) < 1.5 then
                        if not textDrawn then
                            textDrawn = true
                            exports['qb-core']:DrawText(Lang:t('info.pick_up_button'))
                        end
                        if IsControlJustReleased(0, 38) then
                            exports['qb-core']:KeyPressed()
                            textDrawn = false
                            RequestAnimDict('pickup_object')
                            while not HasAnimDictLoaded('pickup_object') do
                                Wait(0)
                            end
                            TaskPlayAnim(playerPed, 'pickup_object', 'pickup_low', 8.0, -8.0, -1, 1, 0, false, false, false)
                            Wait(2000)
                            ClearPedTasks(playerPed)
                            TriggerServerEvent('NS-StreetTricks:server:giveStolenMoney', stealData.money) --GIVE MONEY BACK
                            stealingPed = nil
                            stealData = {}
                        end
                    end
                else
                    local playerPed = PlayerPedId()
                    local pos = GetEntityCoords(playerPed)
                    local pedpos = GetEntityCoords(stealingPed)
                    if #(pos - pedpos) > 100 then
                        stealingPed = nil
                        stealData = {}
                        break
                    end
                end
                Wait(0)
            end
        end)
    end
end

local function SellToPed(ped)
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
	
    trickPrice = math.random(Config.MinimumSalePrice,Config.MaximumSalePrice)
	trickTime = trickPrice / 60
	
    if scamChance <= Config.ScamChance then trickPrice = math.random(11,99) end

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

    while pedDist > 1.5 do
        coords = GetEntityCoords(PlayerPedId(), true)
        pedCoords = GetEntityCoords(ped)
        if getRobbed <= Config.RobberyChance then
            TaskGoStraightToCoord(ped, coords, 15.0, -1, 0.0, 0.0)
        else
            TaskGoStraightToCoord(ped, coords, 1.2, -1, 0.0, 0.0)
        end
        TaskGoStraightToCoord(ped, coords, 1.2, -1, 0.0, 0.0)
        pedDist = #(coords - pedCoords)
        Wait(100)
    end

    TaskLookAtEntity(ped, PlayerPedId(), 5500.0, 2048, 3)
    TaskTurnPedToFaceEntity(ped, PlayerPedId(), 5500)
    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT', 0, false)

    if hasTarget then
        while pedDist < 1.5 and not IsPedDeadOrDying(ped) do
            local coords2 = GetEntityCoords(PlayerPedId(), true)
            local pedCoords2 = GetEntityCoords(ped)
            local pedDist2 = #(coords2 - pedCoords2)
            if getRobbed <= Config.RobberyChance then
				local moneyrobbed = math.random(Config.MinimumSalePrice+Config.MinRisk,Config.MaximumSalePrice+Config.MaxRisk)
				QBCore.Functions.TriggerCallback('NS-StreetTricks:server:checkcash', function(cb)
					moneyrobbed = cb
					TriggerServerEvent('NS-StreetTricks:server:robTheHoe', moneyrobbed)
					QBCore.Functions.Notify(Lang:t('info.has_been_robbed', { money = moneyrobbed }))
					TaskPlayAnim(PlayerPedId(), 'amb@world_human_prostitute@hooker@enter', 'enter', 3.0, 3.0, 1, 0, 0, 0, 0, 0)
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
				
				end, moneyrobbed)
				break
            else
                if pedDist2 < 1.5 and turningTrick then
                    if Config.UseTarget and not zoneMade then
                        zoneMade = true
                        exports['qb-target']:AddEntityZone('sellingPed', ped, {
                            name = 'sellingPed',
                            debugPoly = false,
                        }, {
                            options = {
                                {
                                    icon = 'fas fa-hand-holding-dollar',
                                    label = Lang:t('info.target_trick_offer', { trickTime = trickTime, trickPrice = trickPrice }),
                                    action = function(entity)
                                        if IsPedInAnyVehicle(PlayerPedId(), false) then
                                            QBCore.Functions.Notify(Lang:t('error.in_vehicle'), 'error')
                                            hasTarget = false
                                            SetPedKeepTask(entity, false)
                                            SetEntityAsNoLongerNeeded(entity)
                                            ClearPedTasksImmediately(entity)
                                            lastPed[#lastPed + 1] = entity
                                            exports['qb-target']:RemoveZone('sellingPed')
                                            return
                                        else
                                            exports['qb-target']:RemoveZone('sellingPed')
                                            QBCore.Functions.Progressbar('turningTrick', Lang:t('info.selling_to_ped'), trickTime*1000, false, false, {
                                                disableMovement = true,
                                                disableCarMovement = true,
                                                disableMouse = false,
                                                disableCombat = false,
                                            }, {}, {}, {}, function()
                                                TriggerServerEvent('NS-StreetTricks:server:sellCornerTrick', trickPrice)
                                                -- LoadAnimDict('amb@world_human_prostitute@hooker@enter')
                                                -- TaskPlayAnim(PlayerPedId(), 'amb@world_human_prostitute@hooker@enter', 'enter', 3.0, 3.0, trickTime*1000, 49, 0, 0, 0, 0)
                                                TaskTurnPedToFaceEntity(PlayerPedId(), ped, 5500)
												local elib = 'misscarsteal2pimpsex'
												local ename = 'pimpsex_hooker'
												LoadAnimDict(elib)
												TaskPlayAnim(PlayerPedId(), elib, ename, 3.0, 3.0, trickTime*1000, 1, 0.15, 0, 0, 0)
												--test anima
												Wait(trickTime*1000)
                                                hasTarget = false
                                                ClearPedTasks(PlayerPedId())
                                                SetPedKeepTask(entity, false)
                                                SetEntityAsNoLongerNeeded(entity)
                                                ClearPedTasksImmediately(entity)
                                                lastPed[#lastPed + 1] = entity
                                                --exports['qb-target']:RemoveZone('sellingPed')
                                                PoliceCall()
												
                                            end)
                                        end
                                    end,
                                },
                                {
                                    icon = 'fas fa-x',
                                    label = 'Decline offer',
                                    action = function(entity)
                                        QBCore.Functions.Notify(Lang:t('error.offer_declined'), 'error')
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
                            exports['qb-core']:DrawText(Lang:t('info.trick_offer', { trickTime = trickTime, trickPrice = trickPrice }))
                        end
                        if IsControlJustPressed(0, 38) then
                            if IsPedInAnyVehicle(PlayerPedId(), false) then
                                QBCore.Functions.Notify(Lang:t('error.in_vehicle'), 'error')
                                exports['qb-core']:KeyPressed()
                                textDrawn = false
                                hasTarget = false
                                SetPedKeepTask(ped, false)
                                SetEntityAsNoLongerNeeded(ped)
                                ClearPedTasksImmediately(ped)
                                lastPed[#lastPed + 1] = ped
                                break
                            else
                                exports['qb-core']:KeyPressed()
                                textDrawn = false
								-- LoadAnimDict('mini@strip_club@private_dance@part3')
								-- TaskPlayAnim(PlayerPedId(), 'mini@strip_club@private_dance@part3', 'priv_dance_p3', 3.0, 3.0, trickTime*1000, 1, 0.15, 0, 0, 0)
								--TaskPlayAnim(ped, 'mini@strip_club@private_dance@part3', 'priv_dance_p3', 1.0, 1.0, trickTime*1000, 1, 0.15, 0, 0, 0)
								--removed action of pedestrian joining the animation
								movetoCoords3 = GetEntityCoords(PlayerPedId())
								coords3 = GetEntityCoords(PlayerPedId(), true)
								pedCoords3 = GetEntityCoords(ped)
								pedDist3 = #(coords3 - pedCoords3)
                                while pedDist3 > 0.75 do
									coords3 = GetEntityCoords(PlayerPedId(), true)
									pedCoords3 = GetEntityCoords(ped)
									TaskGoStraightToCoord(ped, movetoCoords3.x, movetoCoords3.y, movetoCoords3.z, 15.0, -1, 0.0, 0.0)
									pedDist3 = #(coords3 - pedCoords3)
									TaskTurnPedToFaceEntity(PlayerPedId(), ped, 100)
									Wait(100)
								end
								
								-- TaskStartScenarioInPlace(, 'WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT', 0, false)
								
								-- TaskTurnPedToFaceEntity(ped, PlayerPedId(), 100)
								-- Wait(1000)
								local pelib = 'misscarsteal2pimpsex'
								local pename = 'pimpsex_punter'
								LoadAnimDict(pelib)
								TaskPlayAnim(ped, pelib, pename, 3.0, 3.0, trickTime*60000, 1, 0.15, 0, 0, 0)
								FreezeEntityPosition(ped, true)
								
								TaskTurnPedToFaceEntity(PlayerPedId(), ped, 100)
								Wait(1000)
								
								local elib = 'misscarsteal2pimpsex'
								local ename = 'pimpsex_hooker'
								LoadAnimDict(elib)
								TaskPlayAnim(PlayerPedId(), elib, ename, 3.0, 3.0, trickTime*1000, 1, 0.15, 0, 0, 0)
								
								QBCore.Functions.Progressbar('turningTrick', Lang:t('info.selling_to_ped'), trickTime*2000, false, false, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = false,
                                }, {}, {}, {}, function()
                                    TriggerServerEvent('NS-StreetTricks:server:sellCornerTrick', trickPrice)
                                    Wait(650)
                                    hasTarget = false
                                    ClearPedTasks(PlayerPedId())
                                    SetPedKeepTask(ped, false)
                                    SetEntityAsNoLongerNeeded(ped)
                                    ClearPedTasksImmediately(ped)
									FreezeEntityPosition(ped, false)
                                    PoliceCall()
                                end)
                            end
                        end
                        if IsControlJustPressed(0, 47) then
                            exports['qb-core']:KeyPressed()
                            textDrawn = false
                            QBCore.Functions.Notify(Lang:t('error.offer_declined'), 'error')
                            hasTarget = false
                            SetPedKeepTask(ped, false)
                            SetEntityAsNoLongerNeeded(ped)
                            ClearPedTasksImmediately(ped)
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
                    SetPedKeepTask(ped, false)
                    SetEntityAsNoLongerNeeded(ped)
                    ClearPedTasksImmediately(ped)
                    lastPed[#lastPed + 1] = ped
                    break
                end
            end
            Wait(0)
        end
        Wait(math.random(5000, 10000))
    end
end

local function ToggleSelling()
    if not turningTrick then
        turningTrick = true
		LocalPlayer.state:set('inv_busy', true, true)
        QBCore.Functions.Notify(Lang:t('info.started_selling_drugs'))
		local startLocation = GetEntityCoords(PlayerPedId())
        CreateThread(function()
			-- LoadAnimDict('mini@strip_club@private_dance@part1')
			local elib = 'oddjobs@assassinate@multi@yachttarget@lapdance'
			local ename = 'yacht_ld_f'
			LoadAnimDict(elib)
			TaskPlayAnim(PlayerPedId(), elib, ename, 3.0, 3.0, 60000, 1, 0.15, 0, 0, 0)
					
			-- TaskPlayAnim(PlayerPedId(), 'mini@strip_club@private_dance@part1', 'priv_dance_p1', 3.0, 3.0, 60000, 1, 0.15, 0, 0, 0)
			--while searching for trick
            while turningTrick do
                local player = PlayerPedId()
                local coords = GetEntityCoords(player)
                if not hasTarget then
					--add dancing animation for player here
					--amb@world_human_prostitute@hooker@base  
					--base
                    local PlayerPeds = {}
                    if next(PlayerPeds) == nil then
                        for _, activePlayer in ipairs(GetActivePlayers()) do
                            local ped = GetPlayerPed(activePlayer)
                            PlayerPeds[#PlayerPeds + 1] = ped
                        end
                    end
                    local closestPed, closestDistance = QBCore.Functions.GetClosestPed(coords, PlayerPeds)
                    if closestDistance < 15.0 and closestPed ~= 0 and not IsPedInAnyVehicle(closestPed) and GetPedType(closestPed) ~= 28 then
                        SellToPed(closestPed)
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
        stealData = {}
        turningTrick = false
        LocalPlayer.state:set('inv_busy', false, true)
			TaskPlayAnim(PlayerPedId(), 'mini@strip_club@private_dance@part1', 'priv_dance_p1', 1.0, 1.0, 1, 0, 0, 0, 0, 0)
        QBCore.Functions.Notify(Lang:t('info.stopped_selling_drugs'))
    end
end

-- Events
RegisterNetEvent('NS-StreetTricks:client:trickselling', function()
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		QBCore.Functions.Notify(Lang:t('error.in_vehicle'), 'error')
	else
		ToggleSelling()
	end
end)

RegisterNetEvent('NS-StreetTricks:client:refreshTricks', function()
        --QBCore.Functions.Notify(Lang:t('error.no_drugs_left'), 'error')
    turningTrick = false
	LocalPlayer.state:set('inv_busy', false, true)
	
end)
