local QBCore = exports['qb-core']:GetCoreObject()
function DefaultSkills() -- Add Skills
    Citizen.CreateThread(function()
        while true do
            local ped = PlayerPedId()
            local vehicle = GetVehiclePedIsUsing(ped)
    
            if IsPedSwimmingUnderWater(ped) then
				local player = QBCore.Functions.GetPlayerData()
				local PlayerJob = player.job
				
				if player.name == 'Nicholiae' or player.name == 'Free Smoke' or player.name == 'ndsha' then
					TriggerEvent('brutal_skills:client:AddSkill', 'Swimming', 100)
					TriggerEvent('brutal_skills:client:AddSkill', 'Swimming', 50)
					TriggerEvent('brutal_skills:client:AddSkill', 'Swimming', 25)
					TriggerEvent('brutal_skills:client:AddSkill', 'Swimming', 15)
					TriggerEvent('brutal_skills:client:AddSkill', 'Swimming', 10)
					TriggerEvent('brutal_skills:client:AddSkill', 'Swimming', 5)
					TriggerEvent('brutal_skills:client:AddSkill', 'Swimming', 1)
				elseif PlayerJob.name == 'police' or PlayerJob.name == 'ambulance' then
					TriggerEvent('brutal_skills:client:AddSkill', 'Swimming', 2)
					TriggerEvent('brutal_skills:client:AddSkill', 'Swimming', 1)
				else
					TriggerEvent('brutal_skills:client:AddSkill', 'Swimming', 1)
				end
				
            elseif GetEntitySpeed(vehicle) * 3.6 >= 100 and GetPedInVehicleSeat(GetVehiclePedIsIn(ped), -1) == ped then
                local player = QBCore.Functions.GetPlayerData()
				local PlayerJob = player.job
				-- for k,v in pairs(PlayerJob) do
					-- print("Key:"..tostring(k))
					-- print("Value:"..tostring(v))
				-- end
				if player.name == 'Nicholiae' or player.name == 'Free Smoke' or player.name == 'ndsha' then
					TriggerEvent('brutal_skills:client:AddSkill', 'Driving', 100)
					TriggerEvent('brutal_skills:client:AddSkill', 'Driving', 50)
					TriggerEvent('brutal_skills:client:AddSkill', 'Driving', 25)
					TriggerEvent('brutal_skills:client:AddSkill', 'Driving', 15)
					TriggerEvent('brutal_skills:client:AddSkill', 'Driving', 10)
					TriggerEvent('brutal_skills:client:AddSkill', 'Driving', 5)
					TriggerEvent('brutal_skills:client:AddSkill', 'Driving', 1)
				elseif PlayerJob.name == 'police' or PlayerJob.name == 'ambulance' then
					TriggerEvent('brutal_skills:client:AddSkill', 'Driving', 2)
					TriggerEvent('brutal_skills:client:AddSkill', 'Driving', 1)
				else
					TriggerEvent('brutal_skills:client:AddSkill', 'Driving', 1)
				end
            end
            Citizen.Wait(30000)
        end
    end)
    Citizen.CreateThread(function()
        while true do
            local ped = PlayerPedId()
            if IsPedShooting(ped) then
                GoodWeapon = true
                for k,v in pairs(Config.ShootWeponsBlackList) do
                    if GetSelectedPedWeapon(ped) == GetHashKey(v) then
                        GoodWeapon = false
                    end
                end

                if GoodWeapon then
                    local player = QBCore.Functions.GetPlayerData()
					local PlayerJob = player.job
					if player.name == 'Nicholiae' or player.name == 'Free Smoke' or player.name == 'ndsha' then
						TriggerEvent('brutal_skills:client:AddSkill', 'Shooting', 100)
						TriggerEvent('brutal_skills:client:AddSkill', 'Shooting', 50)
						TriggerEvent('brutal_skills:client:AddSkill', 'Shooting', 25)
						TriggerEvent('brutal_skills:client:AddSkill', 'Shooting', 15)
						TriggerEvent('brutal_skills:client:AddSkill', 'Shooting', 10)
						TriggerEvent('brutal_skills:client:AddSkill', 'Shooting', 5)
						TriggerEvent('brutal_skills:client:AddSkill', 'Shooting', 1)
					elseif PlayerJob.name == 'police' or PlayerJob.name == 'ambulance' then
						TriggerEvent('brutal_skills:client:AddSkill', 'Shooting', 2)
						TriggerEvent('brutal_skills:client:AddSkill', 'Shooting', 1)
					else
						TriggerEvent('brutal_skills:client:AddSkill', 'Shooting', 1)
					end
                end
            end
            Citizen.Wait(200)
        end
    end)
end