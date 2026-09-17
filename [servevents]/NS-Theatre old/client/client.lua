local QBCore = exports['qb-core']:GetCoreObject()


Citizen.CreateThread(function()
	local sleep = 1000
	local tvs = false
	while not tvs do
		for k,v in pairs(Config.TVs) do
			-- if not DoesEntityExist(CreateObject(Config.TVs[k].model,Config.TVs[k].location.x,Config.TVs[k].location.y,Config.TVs[k].location.z,true,false,false)) then
				local TV = CreateObject(Config.TVs[k].model,Config.TVs[k].location.x,Config.TVs[k].location.y,Config.TVs[k].location.z,true,false,false)
				local rot = GetEntityRotation(TV, 2)
				local roll, pitch, yaw = rot.x, rot.y, rot.z
				print(roll, pitch, yaw)
				print(DoesEntityExist(TV))
				while yaw ~= Config.TVs[k].rotation do
					SetEntityRotation(TV, roll, pitch, Config.TVs[k].rotation, 1, false)
					Wait(500)
					SetEntityHeading(TV, Config.TVs[k].rotation)
					rot = GetEntityRotation(TV, 2)
					roll, pitch, yaw = rot.x, rot.y, rot.z
					print(yaw)
					if yaw == Config.TVs[k].rotation then
						break
					end
				end
				rot = GetEntityRotation(TV, 2)
				roll, pitch, yaw = rot.x, rot.y, rot.z
				print(roll, pitch, yaw)
			-- else
				sleep = 5000
			-- end
		end
		tvs = true
	Citizen.Wait(sleep)
	end
end)  