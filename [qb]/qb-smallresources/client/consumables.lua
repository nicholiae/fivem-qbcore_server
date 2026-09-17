-- Variables

local QBCore = exports['qb-core']:GetCoreObject()
local alcoholCount = 0
local weedCount = 0
local fentanylCount = 0
local healing, parachuteEquipped = false, false
local currVest, currVestTexture = nil, nil
local narcan = false
local od = false
-- Functions



local function GetClosestPlayer()
    local closestPlayers = QBCore.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(PlayerPedId())
    for i = 1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = #(pos - coords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end

RegisterNetEvent('QBCore:Client:UpdateObject', function()
    QBCore = exports['qb-core']:GetCoreObject()
end)

local function loadAnimDict(dict)
    if HasAnimDictLoaded(dict) then return end
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
end

local function equipParachuteAnim()
    loadAnimDict('clothingshirt')
    TaskPlayAnim(PlayerPedId(), 'clothingshirt', 'try_shirt_positive_d', 8.0, 1.0, -1, 49, 0, false, false, false)
end


local function healOxy()
    if healing then return end

    healing = true

    local count = 9
    while count > 0 do
        Wait(1000)
        count -= 1
        SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 6)
    end
    healing = false
end


local function alienEffect()
    StartScreenEffect('DrugsMichaelAliensFightIn', 3.0, 0)
    Wait(math.random(5000, 8000))
    StartScreenEffect('DrugsMichaelAliensFight', 3.0, 0)
    Wait(math.random(5000, 8000))
    StartScreenEffect('DrugsMichaelAliensFightOut', 3.0, 0)
    StopScreenEffect('DrugsMichaelAliensFightIn')
    StopScreenEffect('DrugsMichaelAliensFight')
    StopScreenEffect('DrugsMichaelAliensFightOut')
end


local function trevorEffect()
    StartScreenEffect('DrugsTrevorClownsFightIn', 3.0, 0)
    Wait(3000)
    StartScreenEffect('DrugsTrevorClownsFight', 3.0, 0)
    Wait(3000)
    StartScreenEffect('DrugsTrevorClownsFightOut', 3.0, 0)
    StopScreenEffect('DrugsTrevorClownsFight')
    StopScreenEffect('DrugsTrevorClownsFightIn')
    StopScreenEffect('DrugsTrevorClownsFightOut')
end


local function overDose()
	if not od then 
		od = true
		local playerHealth = math.floor(GetEntityHealth(PlayerPedId())) -- 
		
		while playerHealth > 0 and fentanylCount > 0 do
			
			loadAnimDict('custom@convulsion')
			TaskPlayAnim(PlayerPedId(), 'custom@convulsion', 'convulsion', 8.0, 1.0, -1, 1, 0, false, false, false)
			playerHealth -= math.random(9,33)
			SetEntityHealth(PlayerPedId(), playerHealth)
			playerHealth = math.floor(GetEntityHealth(PlayerPedId())) -- 
			if narcan then 
				QBCore.Functions.Notify('You have been saved by narcan', 'success')
				
				StopScreenEffect('DrugsTrevorClownsFight')
				StopScreenEffect('DrugsTrevorClownsFightIn')
				StopScreenEffect('DrugsTrevorClownsFightOut')
				StopAnimTask(PlayerPedId(), 'custom@convulsion', 'convulsion', 1.0)
				fentanylCount = 0
				playerHealth = nil
				od = false
				break
			end
			if playerHealth <= 110 then
				SetEntityHealth(PlayerPedId(), 0)
				QBCore.Functions.Notify('You have died of overdose', 'error')
				StopScreenEffect('DrugsTrevorClownsFight')
				StopScreenEffect('DrugsTrevorClownsFightIn')
				StopScreenEffect('DrugsTrevorClownsFightOut')
				playerHealth = nil
				od = false
				fentanylCount = 0
				break
			end
			trevorEffect()
			QBCore.Functions.Notify('You are having convulsions', 'warning')
			Wait(1000 * 60) -- 1 minutes
		end	
	end
end

local function methBagEffect()
    local startStamina = Config.DrugDurations
    trevorEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
    while startStamina > 0 do
        Wait(1000)
        if math.random(5, 100) < 10 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
        if math.random(5, 100) < 51 then
            trevorEffect()
        end
    end
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

local function weedEffect()
    local startStamina = Config.weedDrugDurations
    SetRunSprintMultiplierForPlayer(PlayerId(), 0.75)
    while startStamina > 0 do
        startStamina = startStamina - 1
        Wait(500)
        if math.random(5, 100) < 10 then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.18)
        end
		if weedCount >= math.random(3,weedCount+5) then
			if IsPedRunning(PlayerPedId()) then
				SetPedToRagdoll(PlayerPedId(), math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
			end
		end
		if startStamina < 0 then 
			startStamina = 0
			break
		end
    end
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

local function leanEffect()
    local startStamina = Config.DrugDurations
    SetFlash(0, 0, 500, 7000, 500)
    alienEffect()
    while startStamina > 0 do
        Wait(1000)
        startStamina -= 1
		SetRunSprintMultiplierForPlayer(PlayerId(), 0.15)
        if math.random(1, 100) < 51 then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
        end
		if IsPedRunning(PlayerPedId()) then
			SetPedToRagdoll(PlayerPedId(), math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
		end
    end
end

local function ecstasyEffect()
    local startStamina = Config.DrugDurations
    SetFlash(0, 0, 500, 7000, 500)
    while startStamina > 0 do
        Wait(1000)
        startStamina -= 1
        RestorePlayerStamina(PlayerId(), 1.0)
        if math.random(1, 100) < 51 then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
        end
    end
    if IsPedRunning(PlayerPedId()) then
        SetPedToRagdoll(PlayerPedId(), math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
    end
end
local function crackBaggyEffect()
    local startStamina = Config.DrugDurations
    local ped = PlayerPedId()
    alienEffect()
	SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
    while startStamina > 0 do
        Wait(1000)
        -- if math.random(1, 100) < 10 then
        RestorePlayerStamina(PlayerId(), 1.0)
        -- end
        startStamina -= 1
        -- if math.random(1, 100) < 60 and IsPedRunning(ped) then
            -- SetPedToRagdoll(ped, math.random(1000, 2000), math.random(1000, 2000), 3, false, false, false)
        -- end
        if math.random(1, 100) < 10 then
			alienEffect()
        end
    end
    -- if IsPedRunning(ped) then
        -- SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
    -- end
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

local function pixieBaggyEffect()
    local startStamina = Config.DrugDurations
    local ped = PlayerPedId()
    alienEffect()
	SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
    while startStamina > 0 do
        Wait(1000)
        -- if math.random(1, 100) < 90 then
        RestorePlayerStamina(PlayerId(), 1.0)
        -- end
        startStamina -= 1
        -- if math.random(1, 100) < 10 and IsPedRunning(ped) then
            -- SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
        -- end
        if math.random(1, 100) < 10 then
            alienEffect()
        end
    end
    -- if IsPedRunning(ped) then
        -- SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
    -- end
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

local function fentanylEffect()
    local startStamina = Config.DrugDurations
    local ped = PlayerPedId()
    alienEffect()
	SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
    while startStamina > 0 do
        Wait(1000)
        -- if math.random(1, 100) < 90 then
        RestorePlayerStamina(PlayerId(), 1.0)
        -- end
        startStamina -= 1
        -- if math.random(1, 100) < 10 and IsPedRunning(ped) then
            -- SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
        -- end
        if math.random(1, 100) < 10 then
            alienEffect()
        end
    end
    -- if IsPedRunning(ped) then
        -- SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
    -- end
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

local function cokeBaggyEffect()
    local startStamina = Config.DrugDurations
    local ped = PlayerPedId()
    alienEffect()
	SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
    while startStamina > 0 do
        Wait(1000)
        -- if math.random(1, 100) < 90 then
        RestorePlayerStamina(PlayerId(), 1.0)
        -- end
        startStamina -= 1
        -- if math.random(1, 100) < 10 and IsPedRunning(ped) then
            -- SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
        -- end
        if math.random(1, 100) < 10 then
            alienEffect()
        end
    end
    -- if IsPedRunning(ped) then
        -- SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
    -- end
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

local function topShelfEffect()
    local startStamina = Config.TopShelfDurations
    local ped = PlayerPedId()
    alienEffect()
    while startStamina > 0 do
		RestorePlayerStamina(PlayerId(), 1.0)
        Wait(1000)
        startStamina -= 1
    end
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end


RegisterNetEvent('consumables:client:topShelfDrink', function(itemName)
    QBCore.Functions.Progressbar('Top Shelf Dining', 'Top shelf make you feel fancy!', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mp_player_intdrink',
        anim = 'loop_bottle',
        flags = 49
    }, {
        model = 'prop_whiskey_bottle',
        bone = 60309,
        coords = vec3(0.0, 0.0, -0.17),
        rotation = vec3(0, 0.0, 0.0),
    }, {}, function() -- Done
		
		local ped = PlayerPedId()
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        TriggerServerEvent('consumables:server:addHunger', QBCore.Functions.GetPlayerData().metadata.hunger + Config.Consumables.topShelfDrink[itemName])
        TriggerServerEvent('consumables:server:addThirst', QBCore.Functions.GetPlayerData().metadata.thirst + Config.Consumables.topShelfDrink[itemName])
		SetPedArmour(ped, 80)
        TriggerServerEvent('hud:server:RelieveStress', Config.topShelfStress)
		topShelfEffect()	
    end)
end) 

RegisterNetEvent('consumables:client:topShelfEat', function(itemName)
    QBCore.Functions.Progressbar('Top Shelf Dining', 'Top shelf make you feel fancy!', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mp_player_inteat@burger',
        anim = 'mp_player_int_eat_burger',
        flags = 49
    }, {
        model = 'knjgh_pizzaslice1',
        bone = 60309,
        coords = vec3(0.05, -0.05, -0.015),
        rotation = vec3(0, -30.0, 90.0),
    }, {}, function() -- Done
		
		local ped = PlayerPedId()
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        TriggerServerEvent('consumables:server:addHunger', QBCore.Functions.GetPlayerData().metadata.hunger + Config.Consumables.topShelfEat[itemName])
        TriggerServerEvent('consumables:server:addThirst', QBCore.Functions.GetPlayerData().metadata.thirst + Config.Consumables.topShelfEat[itemName])
		SetPedArmour(ped, 80)
        TriggerServerEvent('hud:server:RelieveStress', Config.topShelfStress)
		topShelfEffect()	
    end)
end)


RegisterNetEvent('consumables:client:UseCigarette', function(itemName)
	if QBCore.Functions.HasItem(Config.lighterItems[1]) or QBCore.Functions.HasItem(Config.lighterItems[2]) or QBCore.Functions.HasItem(Config.lighterItems[3]) then
		QBCore.Functions.Progressbar('smoking', 'Lighting up a '..itemName, 1500, false, true, {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = false,
		}, {
			animDict = 'amb@world_human_smoking@female@idle_a',
			anim = 'idle_b',
			flags = 49
		}, {
			model = 'prop_cs_ciggy_01',
			bone = 28422,
			coords = vec3(0.0, 0.0, 0.0),
			rotation = vec3(0, 0.0, 0.0),
		}, {}, function() -- Done
			TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
			-- if IsPedInAnyVehicle(PlayerPedId(), false) then
				-- QBCore.Functions.PlayAnim('amb@world_human_smoking@female@idle_a', 'idle_b', true)
			-- else
				-- QBCore.Functions.PlayAnim('amb@world_human_smoking@female@idle_a', 'idle_b', true)
			-- end
			SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) - math.random(1,3))
			TriggerServerEvent('hud:server:RelieveStress', Config.RelieveWeedStress)
		end)
	else
		QBCore.Functions.Notify('You lack an ignition source', 'error')
	end
end)

RegisterNetEvent('consumables:client:giveNarcan', function()
	local player, distance = GetClosestPlayer()
	if player ~= -1 and distance < 2.5 then
		local targetId = GetPlayerServerId(player)
		QBCore.Functions.Notify('You administered narcan', 'success', 10000)
		
		TriggerServerEvent('consumables:server:givenNarcan', targetId)
	else
		QBCore.Functions.Notify('There is no one nearby', 'error')
	end
end)

RegisterNetEvent('consumables:client:givenNarcan', function()

	QBCore.Functions.Notify('You were given narcan', 'success', 10000)
	narcan = true
	Wait(1000*60*3) -- 3 minutes
	narcan = false
	
end)

RegisterNetEvent('consumables:client:openXanaxBottle', function(itemName)
    QBCore.Functions.Progressbar('Opening PillBottle', 'Opening PillBottle', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_player',
        flags = 49
    }, {
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
		TriggerServerEvent('consumables:server:AddXanax')
        
    end)
end)

RegisterNetEvent('consumables:client:openMorphineBottle', function(itemName)
    QBCore.Functions.Progressbar('Opening PillBottle', 'Opening PillBottle', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_player',
        flags = 49
    }, {
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
		TriggerServerEvent('consumables:server:AddMorphine')
        
    end)
end)

RegisterNetEvent('consumables:client:openIbuprofenBottle', function(itemName)
    QBCore.Functions.Progressbar('Opening PillBottle', 'Opening PillBottle', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_player',
        flags = 49
    }, {
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
		TriggerServerEvent('consumables:server:AddIbuprofen')
        
    end)
end)

RegisterNetEvent('consumables:client:openAmoxixillinBottle', function(itemName)
    QBCore.Functions.Progressbar('Opening PillBottle', 'Opening PillBottle', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_player',
        flags = 49
    }, {
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
		TriggerServerEvent('consumables:server:AddAmoxixillin')
        
    end)
end)
RegisterNetEvent('consumables:client:openOxycodoneBottle', function(itemName)
    QBCore.Functions.Progressbar('Opening PillBottle', 'Opening PillBottle', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_player',
        flags = 49
    }, {
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
		TriggerServerEvent('consumables:server:AddOxycodone')
        
    end)
end)

RegisterNetEvent('consumables:client:openPresent', function(itemName)
    QBCore.Functions.Progressbar('Opening Present', 'Opening Present', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_player',
        flags = 49
    }, {
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
		TriggerServerEvent('consumables:server:AddPresentItem')
        
    end)
end)

RegisterNetEvent('consumables:client:BreakCigarettePack', function(itemName)
    QBCore.Functions.Progressbar('Opening Pack', 'Opening Pack', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_player',
        flags = 49
    }, {
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items['cigarette'], 'add', 20)
		TriggerServerEvent('consumables:server:AddCigarette')
        QBCore.Functions.Notify('Received 20 cigarettes from that pack', 'success')
        
		
    end)
end)
RegisterNetEvent('consumables:client:BreakSmallFentanylBrick', function(itemName)
    QBCore.Functions.Progressbar('Opening Brick', 'Opening Brick', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_player',
        flags = 49
    }, {
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items['fentanyl'], 'add', 50)
		TriggerServerEvent('consumables:server:AddFentanylFromSmallBrick')
        QBCore.Functions.Notify('Received 50 Fentanyl from that pack', 'success')
        
		
    end)
end)
RegisterNetEvent('consumables:client:BreakLargeWeedBrick', function(itemName)
    QBCore.Functions.Progressbar('Opening Brick', 'Opening Brick', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_player',
        flags = 49
    }, {
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        local weedType = itemName
		if weedType == 'whitewidow_weed_brick' then
			weedType = 'weed_whitewidow'
		elseif weedType == 'ogkush_weed_brick' then
			weedType = 'weed_ogkush'
		elseif weedType == 'skunk_weed_brick' then
			weedType = 'weed_skunk'
		elseif weedType == 'amnesia_weed_brick' then
			weedType = 'weed_amnesia'
		elseif weedType == 'ak47_weed_brick' then
			weedType = 'weed_ak47'
		elseif weedType == 'purplehaze_weed_brick' then
			weedType = 'weed_purplehaze'
		end
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[weedType], 'add', 100)
		TriggerServerEvent('consumables:server:AddWeedFromLargeBrick', weedType)
        QBCore.Functions.Notify('Received 100 '..weedType..' from that pack', 'success')
        
		
    end)
end)

RegisterNetEvent('consumables:client:BreakLargeFentanylBrick', function(itemName)
    QBCore.Functions.Progressbar('Opening Brick', 'Opening Brick', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_player',
        flags = 49
    }, {
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items['fentanyl'], 'add', 100)
		TriggerServerEvent('consumables:server:AddFentanylFromLargeBrick')
        QBCore.Functions.Notify('Received 100 Fentanyl baggies from that pack', 'success')
        
		
    end)
end)
RegisterNetEvent('consumables:client:BreakSmallCrackBrick', function(itemName)
    QBCore.Functions.Progressbar('Opening Brick', 'Opening Brick', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_player',
        flags = 49
    }, {
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items['crack_baggy'], 'add', 50)
		TriggerServerEvent('consumables:server:AddCrackFromSmallBrick')
        QBCore.Functions.Notify('Received 50 crack baggies from that pack', 'success')
        
		
    end)
end)

RegisterNetEvent('consumables:client:BreakLargeLeanBottle', function(itemName)
    QBCore.Functions.Progressbar('Opening Bottle', 'Opening Bottle', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_player',
        flags = 49
    }, {
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items['lean'], 'add', 100)
		TriggerServerEvent('consumables:server:AddLeanFromLarge')
        QBCore.Functions.Notify('Received 100 Lean from that pack', 'success')
        
		
    end)
end)
RegisterNetEvent('consumables:client:BreakSmallLeanBottle', function(itemName)
    QBCore.Functions.Progressbar('Opening Bottle', 'Opening Bottle', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_player',
        flags = 49
    }, {
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items['lean'], 'add', 50)
		TriggerServerEvent('consumables:server:AddLeanFromSmall')
        QBCore.Functions.Notify('Received 50 lean from that pack', 'success')
        
		
    end)
end)
RegisterNetEvent('consumables:client:BreakLargeCrackBrick', function(itemName)
    QBCore.Functions.Progressbar('Opening Brick', 'Opening Brick', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_player',
        flags = 49
    }, {
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items['crack_baggy'], 'add', 100)
		TriggerServerEvent('consumables:server:AddCrackFromLargeBrick')
        QBCore.Functions.Notify('Received 100 crack baggies from that pack', 'success')
        
		
    end)
end)


RegisterNetEvent('consumables:client:BreakSmallPixieBrick', function(itemName)
    QBCore.Functions.Progressbar('Opening Brick', 'Opening Brick', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_player',
        flags = 49
    }, {
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items['pixiedust'], 'add', 50)
		TriggerServerEvent('consumables:server:AddPixieFromSmallBrick')
        QBCore.Functions.Notify('Received 50 pixiedust baggies from that pack', 'success')
        
		
    end)
end)
RegisterNetEvent('consumables:client:BreakLargePixieBrick', function(itemName)
    QBCore.Functions.Progressbar('Opening Brick', 'Opening Brick', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_player',
        flags = 49
    }, {
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items['pixiedust'], 'add', 100)
		TriggerServerEvent('consumables:server:AddPixieFromLargeBrick')
        QBCore.Functions.Notify('Received 100 pixiedust baggies from that pack', 'success')
        
		
    end)
end)


RegisterNetEvent('consumables:client:BreakSmallCokeBrick', function(itemName)
    QBCore.Functions.Progressbar('Opening Brick', 'Opening Brick', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_player',
        flags = 49
    }, {
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items['coke_baggy'], 'add', 50)
		TriggerServerEvent('consumables:server:AddCokeFromSmallBrick')
        QBCore.Functions.Notify('Received 50 coke baggies from that pack', 'success')
        
		
    end)
end)

RegisterNetEvent('consumables:client:BreakLargeCokeBrick', function(itemName)
    QBCore.Functions.Progressbar('Opening Brick', 'Opening Brick', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_player',
        flags = 49
    }, {
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items['coke_baggy'], 'add', 100)
		TriggerServerEvent('consumables:server:AddCokeFromLargeBrick')
        QBCore.Functions.Notify('Received 100 coke baggies from that pack', 'success')
        
		
    end)
end)


-- Events

RegisterNetEvent('consumables:client:edibles', function(itemName)
    QBCore.Functions.Progressbar('eat_something', Lang:t('consumables.eat_progress'), 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mp_player_inteat@burger',
        anim = 'mp_player_int_eat_burger',
        flags = 49
    }, {
        model = 'prop_cs_burger_01',
        bone = 60309,
        coords = vec3(0.0, 0.0, -0.02),
        rotation = vec3(30, 0.0, 0.0),
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        TriggerServerEvent('consumables:server:addHunger', QBCore.Functions.GetPlayerData().metadata.hunger + Config.Consumables.edibles[itemName])
        TriggerServerEvent('hud:server:RelieveStress', Config.edibleStress)
		
    end)
end)

RegisterNetEvent('consumables:client:Eat', function(itemName)
    QBCore.Functions.Progressbar('eat_something', Lang:t('consumables.eat_progress'), 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mp_player_inteat@burger',
        anim = 'mp_player_int_eat_burger',
        flags = 49
    }, {
        model = 'prop_cs_burger_01',
        bone = 60309,
        coords = vec3(0.0, 0.0, -0.02),
        rotation = vec3(30, 0.0, 0.0),
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        TriggerServerEvent('consumables:server:addHunger', QBCore.Functions.GetPlayerData().metadata.hunger + Config.Consumables.eat[itemName])
        TriggerServerEvent('hud:server:RelieveStress', Config.eatStress)
    end)
end)

RegisterNetEvent('consumables:client:Drink', function(itemName)
    QBCore.Functions.Progressbar('drink_something', Lang:t('consumables.drink_progress'), 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mp_player_intdrink',
        anim = 'loop_bottle',
        flags = 49
    }, {
        model = 'vw_prop_casino_water_bottle_01a',
        bone = 60309,
        coords = vec3(0.0, 0.0, -0.05),
        rotation = vec3(0.0, 0.0, -40),
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        TriggerServerEvent('consumables:server:addThirst', QBCore.Functions.GetPlayerData().metadata.thirst + Config.Consumables.drink[itemName])
        TriggerServerEvent('hud:server:RelieveStress', Config.drinkStress)
    end)
end)

RegisterNetEvent('consumables:client:DrinkShake', function(itemName)
    QBCore.Functions.Progressbar('Drinking PreWorkout', 'Drinking PreWorkout', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mp_player_intdrink',
        anim = 'loop_bottle',
        flags = 49
    }, {
        model = 'vw_prop_casino_water_bottle_01a',
        bone = 60309,
        coords = vec3(0.0, 0.0, -0.05),
        rotation = vec3(0.0, 0.0, -40),
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        TriggerEvent('nicholiaegym:client:UsedShake')
        TriggerServerEvent('consumables:server:addThirst', QBCore.Functions.GetPlayerData().metadata.thirst + Config.Consumables.drinkshakes[itemName])
    end)
end)

RegisterNetEvent('consumables:client:DrinkAlcohol', function(itemName)
    QBCore.Functions.Progressbar('drink_alcohol', Lang:t('consumables.liqour_progress'), math.random(3000, 6000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mp_player_intdrink',
        anim = 'loop_bottle',
        flags = 49
    }, {
        model = 'prop_cs_beer_bot_40oz',
        bone = 60309,
        coords = vec3(0.0, 0.0, -0.05),
        rotation = vec3(0.0, 0.0, -40),
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        TriggerServerEvent('consumables:server:drinkAlcohol', itemName)
        TriggerServerEvent('consumables:server:addThirst', QBCore.Functions.GetPlayerData().metadata.thirst + Config.Consumables.alcohol[itemName])
        TriggerServerEvent('hud:server:RelieveStress', Config.alcoholStress)
        alcoholCount += 1
        AlcoholLoop()
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent('evidence:client:SetStatus', 'alcohol', 200)
        elseif alcoholCount >= 4 then
            TriggerEvent('evidence:client:SetStatus', 'heavyalcohol', 200)
        end
    end, function() -- Cancel
        QBCore.Functions.Notify(Lang:t('consumables.canceled'), 'error')
    end)
end)

RegisterNetEvent('consumables:client:useLean', function(itemName)
    QBCore.Functions.Progressbar('sip_lean', 'Drinking Lean', math.random(3000, 6000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'mp_player_intdrink',
        anim = 'loop_bottle',
        flags = 49
    }, {
        model = 'prop_cs_paper_cup',
        bone = 60309,
        coords = vec3(0.0, 0.0, 0.015),
        rotation = vec3(0.0, 0.0, -40),
    }, {}, function() -- Done
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        TriggerServerEvent('consumables:server:addThirst', QBCore.Functions.GetPlayerData().metadata.thirst + Config.Consumables.lean[itemName])
        TriggerServerEvent('hud:server:RelieveStress', Config.fentanylStress)
        alcoholCount += 1
        AlcoholLoop()
		leanEffect()
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent('evidence:client:SetStatus', 'alcohol', 200)
        elseif alcoholCount >= 4 then
            TriggerEvent('evidence:client:SetStatus', 'heavyalcohol', 200)
        end
    end, function() -- Cancel
        QBCore.Functions.Notify(Lang:t('consumables.canceled'), 'error')
    end)
end)

RegisterNetEvent('consumables:client:Custom', function(itemName)
    QBCore.Functions.TriggerCallback('consumables:itemdata', function(data)
        QBCore.Functions.Progressbar('custom_consumable', data.progress.label, data.progress.time, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true
        }, {
            animDict = data.animation.animDict,
            anim = data.animation.anim,
            flags = data.animation.flags
        }, {
            model = data.prop.model,
            bone = data.prop.bone,
            coords = data.prop.coords,
            rotation = data.prop.rotation
        }, {}, function() -- Done
            ClearPedTasks(PlayerPedId())
            TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
            if data.replenish.type then
                TriggerServerEvent('consumables:server:add' .. data.replenish.type, QBCore.Functions.GetPlayerData().metadata[string.lower(data.replenish.type)] + data.replenish.replenish)
            end
            if data.replenish.isAlcohol then
                alcoholCount += 1
                AlcoholLoop()
                if alcoholCount > 1 and alcoholCount < 4 then
                    TriggerEvent('evidence:client:SetStatus', 'alcohol', 200)
                elseif alcoholCount >= 4 then
                    TriggerEvent('evidence:client:SetStatus', 'heavyalcohol', 200)
                end
            end
            if data.replenish.event then
                TriggerEvent(data.replenish.event)
            end
        end)
    end, itemName)
end)

RegisterNetEvent('consumables:client:Pixiebaggy', function()
    local ped = PlayerPedId()
    QBCore.Functions.Progressbar('snort', 'Snorting Pixiedust', math.random(5000, 8000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'switch@trevor@trev_smoking_meth',
        anim = 'trev_smoking_meth_loop',
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(ped, 'switch@trevor@trev_smoking_meth', 'trev_smoking_meth_loop', 1.0)
        TriggerServerEvent('consumables:server:usePixieBaggy')
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items['pixiedust'], 'remove')
        TriggerEvent('evidence:client:SetStatus', 'widepupils', 200)
        pixieBaggyEffect()
    end, function() -- Cancel
        StopAnimTask(ped, 'switch@trevor@trev_smoking_meth', 'trev_smoking_meth_loop', 1.0)
        QBCore.Functions.Notify(Lang:t('consumables.canceled'), 'error')
    end)
end)

RegisterNetEvent('consumables:client:fentanyl', function()
    local ped = PlayerPedId()
    QBCore.Functions.Progressbar('fentanyl', 'Popping Fentanyl', math.random(5000, 8000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'mp_suicide',
        anim = 'pill',
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), 'mp_suicide', 'pill', 1.0)
		fentanylCount += 1
        TriggerServerEvent('consumables:server:useFentanyl')
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items['fentanyl'], 'remove')
		TriggerServerEvent('hud:server:RelieveStress', Config.fentanylStress)
        if fentanylCount >= math.random(3,6) then	
			QBCore.Functions.Notify('You have overdosed on fentanyl', 'error')
			overDose()
        end
        if fentanylCount >= 1 and not od then
			TriggerEvent('evidence:client:SetStatus', 'widepupils', 100)
			-- QBCore.Functions.Notify('You may overdose if you take '..tostring((6-fentanylCount)).." more fentanyl", 'error')
			fentanylEffect()
			fentanylLoop()
		end
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), 'mp_suicide', 'pill', 1.0)
        QBCore.Functions.Notify(Lang:t('consumables.canceled'), 'error')
    end)
end)

RegisterNetEvent('consumables:client:Cokebaggy', function()
    local ped = PlayerPedId()
    QBCore.Functions.Progressbar('snort_coke', Lang:t('consumables.coke_progress'), math.random(5000, 8000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'switch@trevor@trev_smoking_meth',
        anim = 'trev_smoking_meth_loop',
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(ped, 'switch@trevor@trev_smoking_meth', 'trev_smoking_meth_loop', 1.0)
        TriggerServerEvent('consumables:server:useCokeBaggy')
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items['cokebaggy'], 'remove')
        TriggerEvent('evidence:client:SetStatus', 'widepupils', 200)
		TriggerServerEvent('hud:server:RelieveStress', Config.cokeStress)
        cokeBaggyEffect()
    end, function() -- Cancel
        StopAnimTask(ped, 'switch@trevor@trev_smoking_meth', 'trev_smoking_meth_loop', 1.0)
        QBCore.Functions.Notify(Lang:t('consumables.canceled'), 'error')
    end)
end)

RegisterNetEvent('consumables:client:Crackbaggy', function()
    local ped = PlayerPedId()
    QBCore.Functions.Progressbar('snort_coke', Lang:t('consumables.crack_progress'), math.random(7000, 10000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'switch@trevor@trev_smoking_meth',
        anim = 'trev_smoking_meth_loop',
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(ped, 'switch@trevor@trev_smoking_meth', 'trev_smoking_meth_loop', 1.0)
        TriggerServerEvent('consumables:server:useCrackBaggy')
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items['crack_baggy'], 'remove')
        TriggerEvent('evidence:client:SetStatus', 'widepupils', 300)
		TriggerServerEvent('hud:server:RelieveStress', Config.crackStress)
        crackBaggyEffect()
    end, function() -- Cancel
        StopAnimTask(ped, 'switch@trevor@trev_smoking_meth', 'trev_smoking_meth_loop', 1.0)
        QBCore.Functions.Notify(Lang:t('consumables.canceled'), 'error')
    end)
end)

RegisterNetEvent('consumables:client:EcstasyBaggy', function()
    QBCore.Functions.Progressbar('use_ecstasy', Lang:t('consumables.ecstasy_progress'), 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'mp_suicide',
        anim = 'pill',
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), 'mp_suicide', 'pill', 1.0)
        TriggerServerEvent('consumables:server:useXTCBaggy')
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items['xtcbaggy'], 'remove')
		TriggerServerEvent('hud:server:RelieveStress', Config.ecstasyStress)
        ecstasyEffect()
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), 'mp_suicide', 'pill', 1.0)
        QBCore.Functions.Notify(Lang:t('consumables.canceled'), 'error')
    end)
end)

RegisterNetEvent('consumables:client:oxy', function()
    QBCore.Functions.Progressbar('use_oxy', Lang:t('consumables.healing_progress'), 2000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'mp_suicide',
        anim = 'pill',
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), 'mp_suicide', 'pill', 1.0)
        TriggerServerEvent('consumables:server:useOxy')
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items['oxy'], 'remove')
		TriggerServerEvent('hud:server:RelieveStress', Config.oxyStress)
        ClearPedBloodDamage(PlayerPedId())
        healOxy()
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), 'mp_suicide', 'pill', 1.0)
        QBCore.Functions.Notify(Lang:t('consumables.canceled'), 'error')
    end)
end)

RegisterNetEvent('consumables:client:meth', function()
    QBCore.Functions.Progressbar('snort_meth', Lang:t('consumables.meth_progress'), 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'switch@trevor@trev_smoking_meth',
        anim = 'trev_smoking_meth_loop',
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), 'switch@trevor@trev_smoking_meth', 'trev_smoking_meth_loop', 1.0)
        TriggerServerEvent('consumables:server:useMeth')
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items['meth'], 'remove')
        TriggerEvent('evidence:client:SetStatus', 'widepupils', 300)
        TriggerEvent('evidence:client:SetStatus', 'agitated', 300)
		TriggerServerEvent('hud:server:RelieveStress', Config.methStress)
        methBagEffect()
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), 'switch@trevor@trev_smoking_meth', 'trev_smoking_meth_loop', 1.0)
        QBCore.Functions.Notify(Lang:t('consumables.canceled'), 'error')
    end)
end)



RegisterNetEvent('consumables:client:UseBlunt', function(itemName)
	if QBCore.Functions.HasItem(Config.lighterItems[1]) or QBCore.Functions.HasItem(Config.lighterItems[2]) or QBCore.Functions.HasItem(Config.lighterItems[3]) then
		QBCore.Functions.Progressbar('smoking', 'Lighting up a '..itemName, 1500, false, true, {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		},{
			animDict = 'amb@world_human_smoking@female@idle_a',
			anim = 'idle_b',
			flags = 49
		}, {
			model = 'prop_cs_ciggy_01',
			bone = 28422,
			coords = vec3(0.0, 0.0, 0.0),
			rotation = vec3(0, 0.0, 0.0),
		}, {}, function() -- Done
			TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
			-- if IsPedInAnyVehicle(PlayerPedId(), false) then
				-- TaskStartScenarioInPlace(PlayerPedId(),'WORLD_HUMAN_DRUG_DEALER',0,true)
				-- QBCore.Functions.PlayAnim('safe@michael@ig_3', 'cigar_idle_a_cigar', true)
			-- else
				-- QBCore.Functions.PlayAnim('safe@michael@ig_3', 'cigar_idle_a_cigar', true)
				-- TaskStartScenarioInPlace(PlayerPedId(),'WORLD_HUMAN_DRUG_DEALER',0,true)
			-- end
			TriggerEvent('evidence:client:SetStatus', 'weedsmell', 300)
			TriggerServerEvent('hud:server:RelieveStress', Config.RelieveWeedStress)
			local low = Config.RelieveWeedStress-5
			local high = Config.RelieveWeedStress+5
			if low < 0 then
				low = 1
			end
			while high < low do
				high = high + 5
			end
			-- joint 10 armor 
			-- blunt 25 armor
			TriggerServerEvent('consumables:server:addHunger', QBCore.Functions.GetPlayerData().metadata.hunger - math.random(low,high))
			QBCore.Functions.Notify('You feel hungry', 'error')
			TriggerServerEvent('hospital:server:SetArmor', PlayerPedId(), 50)
			SetPedArmour(PlayerPedId(), 50)
			weedCount += 2
			weedEffect()
			weedLoop()
			
		end)
	else
		QBCore.Functions.Notify('You lack an ignition source', 'error')
	end
end)

RegisterNetEvent('consumables:client:UseJoint', function(itemName)
	if QBCore.Functions.HasItem(Config.lighterItems[1]) or QBCore.Functions.HasItem(Config.lighterItems[2]) or QBCore.Functions.HasItem(Config.lighterItems[3]) then
		QBCore.Functions.Progressbar('smoking', 'Lighting up a '..itemName, 1500, false, true, {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		}, {
			animDict = 'amb@world_human_smoking@female@idle_a',
			anim = 'idle_b',
			flags = 49
		}, {
			model = 'prop_cs_ciggy_01',
			bone = 28422,
			coords = vec3(0.0, 0.0, 0.0),
			rotation = vec3(0, 0.0, 0.0),
		}, {}, function() -- Done
			TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
			-- if IsPedInAnyVehicle(PlayerPedId(), false) then
				-- if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then 
					-- QBCore.Functions.PlayAnim('timetable@gardener@smoking_joint', 'smoke_idle', true)
					-- TaskStartScenarioInPlace(PlayerPedId(),'WORLD_HUMAN_DRUG_DEALER',0,true)
				-- else
					-- TaskStartScenarioInPlace(PlayerPedId(),'WORLD_HUMAN_SMOKING_POT',0,true)
				-- end
			-- else
				-- if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then 
					-- QBCore.Functions.PlayAnim('timetable@gardener@smoking_joint', 'smoke_idle', true)
					-- TaskStartScenarioInPlace(PlayerPedId(),'WORLD_HUMAN_DRUG_DEALER',0,true)
				-- else
					-- TaskStartScenarioInPlace(PlayerPedId(),'WORLD_HUMAN_SMOKING_POT',0,true)
				-- end
			-- end
			TriggerEvent('evidence:client:SetStatus', 'weedsmell', 300)
			TriggerServerEvent('hud:server:RelieveStress', Config.RelieveWeedStress)
			local low = Config.RelieveWeedStress-5
			local high = Config.RelieveWeedStress+5
			
			if low < 0 then
				low = 1
			end
			while high < low do
				high = high + 5
			end
			-- joint 25 armor 
			-- blunt 50 armor
			TriggerServerEvent('consumables:server:addHunger', QBCore.Functions.GetPlayerData().metadata.hunger - math.random(low,high))
			TriggerServerEvent('hospital:server:SetArmor', PlayerPedId(), 25)
			SetPedArmour(PlayerPedId(), 25)
			QBCore.Functions.Notify('You feel hungry', 'error')
			weedCount += 1
			weedEffect()
			weedLoop()
		end)
	else
		QBCore.Functions.Notify('You lack an ignition source', 'error')
	end
end)

RegisterNetEvent('consumables:client:UseParachute', function()
    equipParachuteAnim()
    QBCore.Functions.Progressbar('use_parachute', "Putting Parachute on", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        local ped = PlayerPedId()
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items['parachute'], 'remove')
        GiveWeaponToPed(ped, `GADGET_PARACHUTE`, 1, false, false)
		if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then --male
			parachuteData = {
				outfitData = { ['bag'] = { item = 2, texture = 0 } }
			}
		else
			parachuteData = {
				outfitData = { ['bag'] = { item = 2, texture = 0 } }
			}
		end
        TriggerEvent('qb-clothing:client:loadOutfit', parachuteData)
        parachuteEquipped = true
        TaskPlayAnim(ped, 'clothingshirt', 'exit', 8.0, 1.0, -1, 49, 0, false, false, false)
    end)
end)

RegisterNetEvent('consumables:client:ResetParachute', function()
    if parachuteEquipped then
        equipParachuteAnim()
        QBCore.Functions.Progressbar('reset_parachute', Lang:t('consumables.pack_parachute_progress'), 40000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            local ped = PlayerPedId()
            TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items['parachute'], 'add')
            local parachuteResetData = {
                outfitData = { ['bag'] = { item = 0, texture = 0 } } -- Removing Parachute Clothing
            }
            TriggerEvent('qb-clothing:client:loadOutfit', parachuteResetData)
            TaskPlayAnim(ped, 'clothingshirt', 'exit', 8.0, 1.0, -1, 49, 0, false, false, false)
            TriggerServerEvent('consumables:server:AddParachute')
            parachuteEquipped = false
        end)
    else
        QBCore.Functions.Notify(Lang:t('consumables.no_parachute'), 'error')
    end
end)

RegisterNetEvent('consumables:client:RepairWeaponByKit', function()
    if GetSelectedPedWeapon(PlayerPedId()) then
        QBCore.Functions.Progressbar('repair_weapon', 'Repairing Weapon', 60000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            local ped = PlayerPedId()
            TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items['weaponrepairkit'], 'remove')
			TriggerServerEvent('consumables:server:RepairWeaponByKit', 100)
        end)
    else
        QBCore.Functions.Notify('No Weapon in Hand', 'error')
    end
end)

RegisterNetEvent('consumables:client:UseArmor', function()
    if GetPedArmour(PlayerPedId()) >= 75 then
        QBCore.Functions.Notify(Lang:t('consumables.armor_full'), 'error')
        return
    end
    QBCore.Functions.Progressbar('use_armor', Lang:t('consumables.armor_progress'), 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        if not Config.Disable.vestDrawable then
			if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then --male
				local armorData = {
					outfitData = { ['vest'] = { item = 87, texture = 0 } } -- Adding vest Clothing
				}
				TriggerEvent('qb-clothing:client:loadOutfit', armorData)
			end
			if GetEntityModel(PlayerPedId()) == `mp_f_freemode_01` then --female
				
				local armorData = {
					outfitData = { ['vest'] = { item = 20, texture = 0 } } -- Adding vest Clothing
				}
				TriggerEvent('qb-clothing:client:loadOutfit', armorData)
			end
        end
        TriggerServerEvent('consumables:server:useArmor')
    end)
end)

RegisterNetEvent('consumables:client:UseHeavyArmor', function()
    if GetPedArmour(PlayerPedId()) == 100 then
        QBCore.Functions.Notify(Lang:t('consumables.armor_full'), 'error')
        return
    end
    local ped = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()
    QBCore.Functions.Progressbar('use_heavyarmor', Lang:t('consumables.heavy_armor_progress'), 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        if not Config.Disable.vestDrawable then
			if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then --male
				local armorData = {
					outfitData = { ['vest'] = { item = 57, texture = 0 } } -- Adding vest Clothing
				}
				TriggerEvent('qb-clothing:client:loadOutfit', armorData)
			end
			if GetEntityModel(PlayerPedId()) == `mp_f_freemode_01` then --female
				
				local armorData = {
					outfitData = { ['vest'] = { item = 18, texture = 0 } } -- Adding vest Clothing
				}
				TriggerEvent('qb-clothing:client:loadOutfit', armorData)
			end
        end
        TriggerServerEvent('consumables:server:useHeavyArmor')
    end)
end)

RegisterNetEvent('consumables:client:UseMedArmor', function()
    if GetPedArmour(PlayerPedId()) == 100 then
        QBCore.Functions.Notify(Lang:t('consumables.armor_full'), 'error')
        return
    end
    local ped = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()
    QBCore.Functions.Progressbar('use_heavyarmor', Lang:t('consumables.heavy_armor_progress'), 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        if not Config.Disable.vestDrawable then
			if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then --male
				local armorData = {
					outfitData = { ['vest'] = { item = 74, texture = 3 } } -- Adding vest Clothing
				}
				TriggerEvent('qb-clothing:client:loadOutfit', armorData)
			end
			if GetEntityModel(PlayerPedId()) == `mp_f_freemode_01` then --female
				
				local armorData = {
					outfitData = { ['vest'] = { item = 111, texture = 0 } } -- Adding vest Clothing
				}
				TriggerEvent('qb-clothing:client:loadOutfit', armorData)
			end
        end
        TriggerServerEvent('consumables:server:UseMedArmor')
    end)
end)

RegisterNetEvent('consumables:client:ResetArmor', function()
    local ped = PlayerPedId()
    if currVest ~= nil and currVestTexture ~= nil then
        QBCore.Functions.Progressbar('remove_armor', Lang:t('consumables.remove_armor_progress'), 2500, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 9, currVest, currVestTexture, 2)
            SetPedArmour(ped, 0)
            TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items['heavyarmor'], 'add')
            TriggerServerEvent('consumables:server:resetArmor')
        end)
    else
        QBCore.Functions.Notify(Lang:t('consumables.armor_empty'), 'error')
    end
end)

-- RegisterNetEvent('consumables:client:UseRedSmoke', function()
--     if parachuteEquipped then
--         local ped = PlayerPedId()
--         SetPlayerParachuteSmokeTrailColor(ped, 255, 0, 0)
--         SetPlayerCanLeaveParachuteSmokeTrail(ped, true)
--         TriggerEvent("qb-inventory:client:ItemBox", QBCore.Shared.Items["smoketrailred"], "remove")
--     else
--         QBCore.Functions.Notify("You need to have a paracute to activate smoke!", "error")
--     end
-- end)

--Threads
local looped = false
function AlcoholLoop()
    if not looped then
        looped = true
        CreateThread(function()
            while true do
                Wait(10)
                if alcoholCount > 0 then
                    Wait(1000 * 60 * 15)
                    alcoholCount -= 1
					TriggerServerEvent('hud:server:ReduceBioOne', math.random(0,2), nil)
                else
                    looped = false
                    break
                end
            end
        end)
    end
end

local weedlooped = false
function weedLoop()
    if not weedlooped then
        weedlooped = true
        CreateThread(function()
            while true do
                Wait(10)
                if weedCount > 0 then
                    Wait(1000 * 60 * 15)
                    weedCount -= 1
                else
                    weedlooped = false
                    break
                end
            end
        end)
    end
end

local fentanylLooped = false
function fentanylLoop()
    if not fentanylLooped then
        fentanylLooped = true
        CreateThread(function()
            while true do
                Wait(10)
                if fentanylCount > 0 then
                    Wait(1000 * 60 * 15)
                    fentanylCount -= 1
                else
                    fentanylLooped = false
                    break
                end
            end
        end)
    end
end
