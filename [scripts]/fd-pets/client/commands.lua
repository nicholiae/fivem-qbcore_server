local Animals = require 'config.animals'
local General = require 'config.general'
local QBCore = exports['qb-core']:GetCoreObject()
local pedData = {}
local petCanBeCaptured = false
local PlayerJob = {}
local onDuty = false

local animalsList = {
    {name = "MtLion", hash = 307287994, items = {"mtlion1","panther"}},
    {name = "Coyote", hash = 1682622302, items = {"retriever1","retriever2","retriever3","retriever4","shepherd1","husky1","husky2","husky3","rottweiler1","rottweiler2","rottweiler3"}},
    {name = "Rabbit", hash = -541762431, items = {"westy1","westy2","westy3","poodle","pug1","pug2","pug3","pug4","rabbit","cat1","cat2","cat3"}},
	{name = "Chicken", hash = -1430839454, items = {"chicken"}},
}

local function LoadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end
end

local function GivePlayerThePet(pedData)
	-- determine what to GivePlayerThePet
	local itemToGive = pedData.itemsList[math.random(#pedData.itemsList)]
	-- print("itemToGive:"..tostring(itemToGive))
	-- give what we determined
	TriggerEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[itemToGive], 'add', 1)
	QBCore.Functions.Notify('Successfully Captured a '..tostring(itemToGive), 'success')
	TriggerServerEvent('fd-pets:server:getitem', itemToGive)
	-- remove the net
	
end

Citizen.CreateThread(function()
    if General.commands.spawn and General.commands.spawn.enabled then
        RegisterCommand(General.commands.spawn.command, function(source, args, rawCommand)
            if not args[1] then return end

            spawnPet(args[1])
        end, General.commands.spawn.useAce or false)
    end
end)


AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    local ped = PlayerPedId()
    local player = PlayerId()
    CreateThread(function()
        Wait(1000)
        QBCore.Functions.GetPlayerData(function(PlayerData)
            PlayerJob = PlayerData.job
            onDuty = PlayerData.job.onduty
            
        end)
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    if PlayerJob.name == 'pets' then
        onDuty = PlayerJob.onduty
    end
end)

Citizen.CreateThread(function()
	while true do
		local player = PlayerPedId()
		local coords = GetEntityCoords(player)
		if PlayerJob.name == 'pets' then
			-- print(PlayerData.name)
			local PlayerPeds = {}
			if next(PlayerPeds) == nil then
				for _, activePlayer in ipairs(GetActivePlayers()) do
					local ped = GetPlayerPed(activePlayer)
					PlayerPeds[#PlayerPeds + 1] = ped
				end
			end
			local closestPed, closestDistance = QBCore.Functions.GetClosestPed(coords, PlayerPeds)
			if closestDistance > 25.0 or closestPed == 0 then
				textDrawn = false
				exports['qb-core']:HideText()
			end
			while closestDistance < 25.0 and closestPed ~= 0 and GetPedType(closestPed) == 28 do
				-- print(closestPed)
				local closestPed, closestDistance = QBCore.Functions.GetClosestPed(coords, PlayerPeds)
				-- print(closestPed)
				-- print(closestDistance)
				local hashKey = GetEntityModel(closestPed)
				for k,v in pairs(animalsList) do
					-- print(v.hash)
					-- print(v.items)
					if v.hash == hashKey then
						pedData.name = v.name
						pedData.itemsList = v.items
						petCanBeCaptured = true
						-- print("k:"..tostring(k))
						-- print("pedData.name:"..tostring(v.name))
						-- print("pedData.itemsList:"..tostring(pedData.itemsList))
						-- print("v:"..tostring(v))
					end
				end
				if QBCore.Functions.HasItem('petnet') and petCanBeCaptured then
					if not textDrawn then
						textDrawn = true
						exports['qb-core']:DrawText('Press ~E~ to Capture '..tostring(pedData.name))
					end
					if IsControlJustPressed(0, 38) then
						if IsPedInAnyVehicle(PlayerPedId(), false) then
							QBCore.Functions.Notify('You cannot be in a vehicle', 'error')
							exports['qb-core']:KeyPressed()
							textDrawn = false
							exports['qb-core']:HideText()
							break        
						else
							exports['qb-core']:KeyPressed()
							exports['qb-core']:HideText()
							textDrawn = false
							QBCore.Functions.Progressbar('Capturing Animal', 'Capturing Animal', '1000', false, false, {
								disableMovement = true,
								disableCarMovement = true,
								disableMouse = false,
								disableCombat = false,
							}, {}, {}, {}, function()
								LoadAnimDict('cover@first_person@weapon@grenade')
								TaskPlayAnim(PlayerPedId(), 'cover@first_person@weapon@grenade', 'hi_l_throw_long', 3.0, 3.0, -1, 49, 0, 0, 0, 0)
								Wait(650)
								ClearPedTasks(PlayerPedId())
								-- print(pedData.name)
								-- print(pedData.itemsList)
								DeleteEntity(closestPed)
								GivePlayerThePet(pedData)
							end)
						end
					end
					if closestDistance > 25.0 or closestPed == 0 then
						textDrawn = false
						exports['qb-core']:HideText()
						break
					end
				end
				Wait(1)
			end
		end
		Wait(5000)
	end
end)
