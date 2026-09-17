local QBCore = exports['qb-core']:GetCoreObject()
local shake = false
function AddSkill(Skill)
    -- You can use another skill system, but I think our the best :D, because that is simple and great
    if Config.MINIGAME then
		local player = QBCore.Functions.GetPlayerData()
		TriggerServerEvent('hud:server:ReduceHygiene', math.random(1,9), player.source)
		local PlayerJob = player.job
		-- for k,v in pairs(player) do
			-- print("Key:"..tostring(k))
			-- print("Value:"..tostring(v))
		-- end
		if player.name == 'Nicholiae' or player.name == 'Free Smoke' or player.name == 'ndsha' then
			TriggerEvent('brutal_skills:client:AddSkill', Skill, 100)
			TriggerEvent('brutal_skills:client:AddSkill', Skill, 50)
			TriggerEvent('brutal_skills:client:AddSkill', Skill, 25)
			TriggerEvent('brutal_skills:client:AddSkill', Skill, 15)
			TriggerEvent('brutal_skills:client:AddSkill', Skill, 10)
			TriggerEvent('brutal_skills:client:AddSkill', Skill, 5)
			TriggerEvent('brutal_skills:client:AddSkill', Skill, 1)
		else
			finished = exports['qb-minigames']:Skillbar('easy', '12345') -- difficulty and words to enter 
			-- print (finished)
			if finished == true then
				
				if PlayerJob.name == 'police' or PlayerJob.name == 'ambulance' then
					TriggerEvent('brutal_skills:client:AddSkill', Skill, 2)
					TriggerEvent('brutal_skills:client:AddSkill', Skill, 1)
				else
					TriggerEvent('brutal_skills:client:AddSkill', Skill, 1)					
				end
				if Config.lucky > math.random(1,100) then
					TriggerEvent('brutal_skills:client:AddSkill', Skill, 2)
				end
				if shake then 
					TriggerEvent('brutal_skills:client:AddSkill', Skill, 3)
					QBCore.Functions.Notify("Shake added 3 extra "..tostring(Skill), "success")
				end
			else
				QBCore.Functions.Notify("Did that wrong", 'error')
				if shake then 
					TriggerEvent('brutal_skills:client:AddSkill', Skill, 1)
					QBCore.Functions.Notify("Shake added 1 extra "..tostring(Skill), "warning")
				end
			end
		end
    else
        TriggerEvent('brutal_skills:client:AddSkill', Skill, 1)
    end
	-- if Config.MINIGAME then
        -- finished = exports["taskbarskill"]:taskBar(3700, 1)
        -- if finished == 100 then 
            -- TriggerEvent('brutal_skills:client:AddSkill', Skill, 1)
        -- end
    -- else
        -- TriggerEvent('brutal_skills:client:AddSkill', Skill, 1)
    -- end
    -- Trigger name, SKILL_NAME, AMOUNT
end

	
local shakeLooped = false
function StartShake()
    if not shakeLooped then
        shakeLooped = true
		shake = true
		shakeCount = Config.ShakeTime
        CreateThread(function()
            while true do
                Wait(5)
                if shakeCount > 0 then
                    Wait(1000 * 60)
					QBCore.Functions.Notify("You have ("..tostring(shakeCount)..")Minute(s) left on your Pre-WorkOut", "warning")
                    shakeCount -= 1
                else
                    shakeLooped = false
					shake = false
                    break
                end
            end
        end)
    end
end

function ProgressBar(Time, Label)
	QBCore.Functions.Progressbar(Label, Label, Time, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, {}, {}
                    )
end

-- Buy here: (4€+VAT) https://store.brutalscripts.com
function notification(title, text, time, type)
    if Config.BrutalNotify then
        exports['brutal_notify']:SendAlert(title, text, time, type)
    else
        -- Put here your own notify and set the Config.BrutalNotify to false
        SetNotificationTextEntry("STRING")
        AddTextComponentString(text)
        DrawNotification(0,1)
    end
end

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.025+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

--[[
    Exercise Play trigger: TriggerEvent('brutal_skills:client:PlayExercise', exercise, heading)
]]


RegisterNetEvent('nicholiaegym:client:UsedShake', function()
	if not shake then 
		StartShake()
		QBCore.Functions.Notify("You feel PUMPED!!!!", "success")
	else
		QBCore.Functions.Notify("You dont need any more of that", "error")
	end
	
end)