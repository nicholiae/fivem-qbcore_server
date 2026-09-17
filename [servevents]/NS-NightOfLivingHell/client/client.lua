local QBCore = exports['qb-core']:GetCoreObject()
local optin = false
local lastKills = {}
local multiplier = Config.StartingMultiplier
local counting = 0
local minutes = 0
local seconds = 0
local killCount = 0


RegisterNetEvent('NOLH:client:toggleEventForSolo', function(player)

	optin = false
	QBCore.Functions.Notify("You decided not to participate.", 'primary')
	SetPlayerWantedLevel(GetPlayerPed(-1), 0)
	
	local playerData = QBCore.Functions.GetPlayerData()
	local dataGang = QBCore.Functions.GetPlayerData().gang
	while dataGang == nil do
		dataGang = QBCore.Functions.GetPlayerData().gang
		Wait(150)
	end
	
	local playerGang = QBCore.Functions.GetPlayerData().gang.name
	while playerGang == nil do
		playerGang = QBCore.Functions.GetPlayerData().gang.name
		Wait(150)
	end
	
	local playerJob = QBCore.Functions.GetPlayerData().job.name
	while playerJob == nil do
		playerJob = QBCore.Functions.GetPlayerData().job.name
		Wait(150)
	end
	Wait(150)	
	
	local ped = GetPlayerPed(-1)
	local nearby = GetGamePool('CPed')
	-- print(nearby)
	for key,value in pairs(nearby) do
		-- print(key)
		-- print(value)
		if not IsPedAPlayer(value) and not IsEntityDead(value) then
			
			-- print("found a ped:"..tostring(value))
			
			SetRelationshipBetweenGroups(3, `AMBIENT_GANG_HILLBILLY`, `PLAYER`)
			SetRelationshipBetweenGroups(3, `AMBIENT_GANG_BALLAS`, `PLAYER`)
			SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MEXICAN`, `PLAYER`) 
			SetRelationshipBetweenGroups(3, `AMBIENT_GANG_FAMILY`, `PLAYER`) 
			SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MARABUNTE`, `PLAYER`)
			SetRelationshipBetweenGroups(3, `AMBIENT_GANG_SALVA`, `PLAYER`) 
			SetRelationshipBetweenGroups(3, `AMBIENT_GANG_LOST`, `PLAYER`) 
			SetRelationshipBetweenGroups(3, `GANG_1`, `PLAYER`)
			SetRelationshipBetweenGroups(3, `GANG_2`, `PLAYER`)
			SetRelationshipBetweenGroups(3, `GANG_9`, `PLAYER`)
			SetRelationshipBetweenGroups(3, `GANG_10`, `PLAYER`)
			SetRelationshipBetweenGroups(3, `FIREMAN`, `PLAYER`)
			SetRelationshipBetweenGroups(3, `MEDIC`, `PLAYER`)
			SetRelationshipBetweenGroups(3, `COP`, `PLAYER`)
			SetRelationshipBetweenGroups(3, `PRISONER`, `PLAYER`)
			SetPedArmour(value, 0)
			SetPedAsCop(value, false)
			SetPedAsNoLongerNeeded(value)
			ClearPedTasksImmediately(value)
			TaskWanderStandard(value,10,10)
		end
	end
	if playerJob == 'police' then
		QBCore.Functions.Notify("Piggy playing cop!!", 'primary')
		SetMaxWantedLevel(0)
		SetRelationshipBetweenGroups(3, `AMBIENT_GANG_HILLBILLY`, `PLAYER`) --hillbilly
		SetRelationshipBetweenGroups(3, `AMBIENT_GANG_BALLAS`, `PLAYER`) --ballas
		SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MEXICAN`, `PLAYER`) --vagos
		SetRelationshipBetweenGroups(3, `AMBIENT_GANG_FAMILY`, `PLAYER`) --families
		SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MARABUNTE`, `PLAYER`) --marabunte
		SetRelationshipBetweenGroups(3, `AMBIENT_GANG_SALVA`, `PLAYER`) --salva
		SetRelationshipBetweenGroups(3, `AMBIENT_GANG_LOST`, `PLAYER`) --lostmc
		SetRelationshipBetweenGroups(3, `GANG_1`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `GANG_2`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `GANG_9`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `GANG_10`, `PLAYER`)
		SetRelationshipBetweenGroups(1, `FIREMAN`, `PLAYER`)
		SetRelationshipBetweenGroups(1, `MEDIC`, `PLAYER`)
		SetRelationshipBetweenGroups(1, `COP`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `PRISONER`, `PLAYER`)
		
		
	elseif playerGang == 'hillbilly' then
		SetRelationshipBetweenGroups(1, `AMBIENT_GANG_HILLBILLY`, `PLAYER`) --Like
		QBCore.Functions.Notify("HILLLLLLLL BILLLLLLYYYY", 'primary')
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_BALLAS`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_MEXICAN`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_FAMILY`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_MARABUNTE`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_SALVA`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_LOST`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `GANG_1`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_2`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_9`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_10`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `FIREMAN`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `MEDIC`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `COP`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `PRISONER`, `PLAYER`)
		
	elseif playerGang == 'ballas' then
		SetRelationshipBetweenGroups(1, `AMBIENT_GANG_BALLAS`, `PLAYER`) --Like
		QBCore.Functions.Notify("BALLLLLLLAAASSSSS 4 LIFE", 'primary')
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_HILLBILLY`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_MEXICAN`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_FAMILY`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_MARABUNTE`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_SALVA`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_LOST`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `GANG_1`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_2`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_9`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_10`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `FIREMAN`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `MEDIC`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `COP`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `PRISONER`, `PLAYER`)
		
	elseif playerGang == 'vagos' then
		SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MEXICAN`, `PLAYER`) --Like
		QBCore.Functions.Notify("Vagos Vagos Vagos", 'primary')
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_HILLBILLY`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_BALLAS`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_FAMILY`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_MARABUNTE`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_SALVA`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_LOST`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `GANG_1`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_2`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_9`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_10`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `FIREMAN`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `MEDIC`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `COP`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `PRISONER`, `PLAYER`)	
		
	elseif playerGang == 'abk' then
		SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MEXICAN`, `PLAYER`) --Like
		QBCore.Functions.Notify("ABK", 'primary')
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_HILLBILLY`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_BALLAS`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_FAMILY`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_MARABUNTE`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_SALVA`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_LOST`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `GANG_1`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_2`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_9`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_10`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `FIREMAN`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `MEDIC`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `COP`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `PRISONER`, `PLAYER`)	
		
	elseif playerGang == 'families' then
		SetRelationshipBetweenGroups(1, `AMBIENT_GANG_FAMILY`, `PLAYER`) --Like
		QBCore.Functions.Notify("FAM!", 'primary')
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_HILLBILLY`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_BALLAS`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_MEXICAN`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_MARABUNTE`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_SALVA`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_LOST`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `GANG_1`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_2`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_9`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_10`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `FIREMAN`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `MEDIC`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `COP`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `PRISONER`, `PLAYER`)
		
	elseif playerGang == 'marabunte' then
		SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MARABUNTE`, `PLAYER`) --Like
		QBCore.Functions.Notify("WTF DOES MARABUNTE MEAN!", 'primary')
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_HILLBILLY`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_BALLAS`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_MEXICAN`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_FAMILY`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_SALVA`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_LOST`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `GANG_1`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_2`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_9`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_10`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `FIREMAN`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `MEDIC`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `COP`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `PRISONER`, `PLAYER`)
		
	elseif playerGang == 'salva' then
		SetRelationshipBetweenGroups(1, `AMBIENT_GANG_SALVA`, `PLAYER`) --Like
		QBCore.Functions.Notify("SALVA FUCK YOU UP", 'primary')
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_HILLBILLY`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_BALLAS`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_MEXICAN`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_FAMILY`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_MARABUNTE`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_LOST`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `GANG_1`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_2`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_9`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_10`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `FIREMAN`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `MEDIC`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `COP`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `PRISONER`, `PLAYER`)
		
	elseif playerGang == 'lostmc' then
		SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `PLAYER`) --Like
		QBCore.Functions.Notify("NOT ALL WHO LOST ARE WONDERIN, or something like that", 'primary')
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_HILLBILLY`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_BALLAS`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_MEXICAN`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_FAMILY`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_MARABUNTE`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_SALVA`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `GANG_1`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_2`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_9`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_10`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `FIREMAN`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `MEDIC`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `COP`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `PRISONER`, `PLAYER`)
	
	else
		QBCore.Functions.Notify("hey... citizen!", 'primary')
		SetRelationshipBetweenGroups(3, `AMBIENT_GANG_HILLBILLY`, `PLAYER`) --hillbilly
		SetRelationshipBetweenGroups(3, `AMBIENT_GANG_BALLAS`, `PLAYER`) --ballas
		SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MEXICAN`, `PLAYER`) --vagos
		SetRelationshipBetweenGroups(3, `AMBIENT_GANG_FAMILY`, `PLAYER`) --families
		SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MARABUNTE`, `PLAYER`) --marabunte
		SetRelationshipBetweenGroups(3, `AMBIENT_GANG_SALVA`, `PLAYER`) --salva
		SetRelationshipBetweenGroups(3, `AMBIENT_GANG_LOST`, `PLAYER`) --lostmc
		SetRelationshipBetweenGroups(3, `GANG_1`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `GANG_2`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `GANG_9`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `GANG_10`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `FIREMAN`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `MEDIC`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `COP`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `PRISONER`, `PLAYER`)
	end
	
	QBCore.Functions.Notify("Relationships have been reset, all should be normal for you.", 'primary')
	QBCore.Functions.Notify("While the event is active you will have to toggle this option each time you log out and back in.", 'primary')
	QBCore.Functions.Notify("Relationships have been reset, all should be normal for you.", 'primary')
	QBCore.Functions.Notify("While the event is active you will have to toggle this option each time you log out and back in.", 'primary')
	QBCore.Functions.Notify("Relationships have been reset, all should be normal for you.", 'primary')
	QBCore.Functions.Notify("While the event is active you will have to toggle this option each time you log out and back in.", 'primary')
	
end)
RegisterNetEvent('NOLH:client:toggleEvent', function(targetPlayer)

	if optin == true then
		optin = false
		-- SetMaxWantedLevel(5)
		QBCore.Functions.Notify("Server has entered Night of Living Hell:"..tostring(optin), 'primary')
		
		SetRelationshipBetweenGroups(3, `AMBIENT_GANG_HILLBILLY`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `AMBIENT_GANG_BALLAS`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MEXICAN`, `PLAYER`) 
		SetRelationshipBetweenGroups(3, `AMBIENT_GANG_FAMILY`, `PLAYER`) 
		SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MARABUNTE`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `AMBIENT_GANG_SALVA`, `PLAYER`) 
		SetRelationshipBetweenGroups(3, `AMBIENT_GANG_LOST`, `PLAYER`) 
		SetRelationshipBetweenGroups(3, `GANG_1`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `GANG_2`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `GANG_9`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `GANG_10`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `FIREMAN`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `MEDIC`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `COP`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `PRISONER`, `PLAYER`)
	else
		optin = true
		SetMaxWantedLevel(5)
		QBCore.Functions.Notify("Server has entered Night of Living Hell:"..tostring(optin), 'primary')
		Wait(5000)
		QBCore.Functions.Notify("To opt your self out of this event, type /nohlout", 'primary')
		Wait(5000)
		-- SetMaxWantedLevel(0)
		SetRelationshipBetweenGroups(5, `AMBIENT_GANG_HILLBILLY`, `PLAYER`)
		SetRelationshipBetweenGroups(5, `AMBIENT_GANG_BALLAS`, `PLAYER`)
		SetRelationshipBetweenGroups(5, `AMBIENT_GANG_MEXICAN`, `PLAYER`) 
		SetRelationshipBetweenGroups(5, `AMBIENT_GANG_FAMILY`, `PLAYER`) 
		SetRelationshipBetweenGroups(5, `AMBIENT_GANG_MARABUNTE`, `PLAYER`)
		SetRelationshipBetweenGroups(5, `AMBIENT_GANG_SALVA`, `PLAYER`) 
		SetRelationshipBetweenGroups(5, `AMBIENT_GANG_LOST`, `PLAYER`) 
		SetRelationshipBetweenGroups(5, `GANG_1`, `PLAYER`)
		SetRelationshipBetweenGroups(5, `GANG_2`, `PLAYER`)
		SetRelationshipBetweenGroups(5, `GANG_9`, `PLAYER`)
		SetRelationshipBetweenGroups(5, `GANG_10`, `PLAYER`)
		SetRelationshipBetweenGroups(5, `FIREMAN`, `PLAYER`)
		SetRelationshipBetweenGroups(5, `MEDIC`, `PLAYER`)
		SetRelationshipBetweenGroups(5, `COP`, `PLAYER`)
		SetRelationshipBetweenGroups(5, `PRISONER`, `PLAYER`)
		StartLivingDead()
	end
end)


AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    local player = PlayerId()
	QBCore.Functions.TriggerCallback('NOLH:server:getoption', function(option)
	
		-- print(option)
		if not option then
			optin = false
			QBCore.Functions.Notify("Tis a normal night", 'primary')
			-- SetMaxWantedLevel(5)
			
		else
			-- optin = true
			QBCore.Functions.Notify("Night of Living Hell:"..tostring(option), 'primary')
			
			-- SetMaxWantedLevel(0)
			optin = true
			StartLivingDead()
			SetRelationshipBetweenGroups(5, `AMBIENT_GANG_HILLBILLY`, `PLAYER`)
			SetRelationshipBetweenGroups(5, `AMBIENT_GANG_BALLAS`, `PLAYER`)
			SetRelationshipBetweenGroups(5, `AMBIENT_GANG_MEXICAN`, `PLAYER`) 
			SetRelationshipBetweenGroups(5, `AMBIENT_GANG_FAMILY`, `PLAYER`) 
			SetRelationshipBetweenGroups(5, `AMBIENT_GANG_MARABUNTE`, `PLAYER`)
			SetRelationshipBetweenGroups(5, `AMBIENT_GANG_SALVA`, `PLAYER`) 
			SetRelationshipBetweenGroups(5, `AMBIENT_GANG_LOST`, `PLAYER`) 
			SetRelationshipBetweenGroups(5, `GANG_1`, `PLAYER`)
			SetRelationshipBetweenGroups(5, `GANG_2`, `PLAYER`)
			SetRelationshipBetweenGroups(5, `GANG_9`, `PLAYER`)
			SetRelationshipBetweenGroups(5, `GANG_10`, `PLAYER`)
			SetRelationshipBetweenGroups(5, `FIREMAN`, `PLAYER`)
			SetRelationshipBetweenGroups(5, `MEDIC`, `PLAYER`)
			SetRelationshipBetweenGroups(5, `COP`, `PLAYER`)
			SetRelationshipBetweenGroups(5, `PRISONER`, `PLAYER`)
		end
			
	end)
end)


function removeEntity(entity)
    local delidx = 0

    for i = 1, #lastKills do
        if (lastKills[i].entity == entity) then delidx = i end
    end

    if (delidx > 0) then table.remove(lastKills, delidx) end
end

function lastKillExists(entity)
    for _, v in pairs(lastKills) do
        if (v.entity == entity) then return true end
    end
end

function handleDecorator(Kill)
    if (DecorExistOn(Kill, "lastshot")) then
        DecorSetInt(Kill, "lastshot", GetPlayerServerId(PlayerId()))
    else
        DecorRegister("lastshot", 3)
        DecorSetInt(Kill, "lastshot", GetPlayerServerId(PlayerId()))
    end
end

function isKillMine(Kill)
    if (DecorExistOn(Kill, "lastshot")) then
        local aid = DecorGetInt(Kill, "lastshot")
        local id = GetPlayerServerId(PlayerId())

        return aid == id
    end
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(0)
    end
end

function StartLivingDead()
	CreateThread(function()
		while optin == true do
			-- print(optin)
			local ped = GetPlayerPed(-1)
			local nearby = GetGamePool('CPed')
			SetPedDensityMultiplierThisFrame(1.0)
			-- print(nearby)
			if not IsPedArmed(ped, 1|2|4) then
				local randomSelect = math.random(1,#Config.PlayerWeapon)
				GiveWeaponToPed(ped, Config.PlayerWeapon[randomSelect],450,false,true)
			end
			for key,value in pairs(nearby) do
				-- print(key)
				-- print(value)
				if not IsPedAPlayer(value) and not IsEntityDead(value) then
					
					-- print("found a ped:"..tostring(value))
					
					SetRelationshipBetweenGroups(5, `AMBIENT_GANG_HILLBILLY`, `PLAYER`)
					SetRelationshipBetweenGroups(5, `AMBIENT_GANG_BALLAS`, `PLAYER`)
					SetRelationshipBetweenGroups(5, `AMBIENT_GANG_MEXICAN`, `PLAYER`) 
					SetRelationshipBetweenGroups(5, `AMBIENT_GANG_FAMILY`, `PLAYER`) 
					SetRelationshipBetweenGroups(5, `AMBIENT_GANG_MARABUNTE`, `PLAYER`)
					SetRelationshipBetweenGroups(5, `AMBIENT_GANG_SALVA`, `PLAYER`) 
					SetRelationshipBetweenGroups(5, `AMBIENT_GANG_LOST`, `PLAYER`) 
					SetRelationshipBetweenGroups(5, `GANG_1`, `PLAYER`)
					SetRelationshipBetweenGroups(5, `GANG_2`, `PLAYER`)
					SetRelationshipBetweenGroups(5, `GANG_9`, `PLAYER`)
					SetRelationshipBetweenGroups(5, `GANG_10`, `PLAYER`)
					SetRelationshipBetweenGroups(5, `FIREMAN`, `PLAYER`)
					SetRelationshipBetweenGroups(5, `MEDIC`, `PLAYER`)
					SetRelationshipBetweenGroups(5, `COP`, `PLAYER`)
					SetRelationshipBetweenGroups(5, `PRISONER`, `PLAYER`)
					if not IsPedArmed(value, 1|2|4) then
						local randomNum = math.random(1,#Config.PedWeapon)
						GiveWeaponToPed(value, Config.PedWeapon[randomNum],450,false,true)
						SetPedArmour(value, Config.PedArmor)
						SetPedAsCop(value,true)
						SetPedRelationshipGroupDefaultHash(value,`COP`)
						SetPedRelationshipGroupHash(value,`COP`)
						SetCanAttackFriendly(value,false,false)
						-- SetEntityAsMissionEntity(value,true,false)
						SetPedFleeAttributes(value, 0, true)
						SetPedCombatAttributes(value, 46, true)
						SetPedAccuracy(value, 7)
						-- SetPedCombatAbility(value, 1)
						-- SetPedCombatMovement(value, 3)
						SetPedCombatRange(value, 0)
						SetPedDropsWeaponsWhenDead(value,false)
						TaskCombatPed(value, PlayerPedId(), 0, 16)
						SetPedKeepTask(value, true)
					end
				end
			end
			Wait(1000)
			if (QBCore.Functions.GetPlayerData().metadata["isdead"]) or (QBCore.Functions.GetPlayerData().metadata["inlaststand"]) then
				QBCore.Functions.Notify("You died! Dont call for help. Your multiplier has been reset and you will be healed shortly", 'error')
				Wait(1500)
				TriggerServerEvent('NOLH:server:died',Config.PayPerDeath)
				Wait(1500)
				TriggerEvent("hospital:client:Revive")
				Wait(1500)
				SetPedArmour(PlayerPedId(),Config.ArmorOnDeath)
				multiplier = Config.StartingMultiplier
				minutes = 0
				seconds = 0
				counting = 0
				killCount = 0
			end
			if (IsAimCamActive()) and not IsPedInAnyVehicle(ped, false) then
				local _, ent = GetEntityPlayerIsFreeAimingAt(PlayerId(), Citizen.ReturnResultAnyway())
				if (ent and not IsEntityDead(ent)) then
					if (IsEntityAPed(ent)) then
						handleDecorator(ent)
						if (not lastKillExists(ent)) then
							if (#lastKills > 5) then
								table.remove(lastKills, 1)
							end
							local newAnim = {}
							newAnim.entity = ent
							newAnim.data = Kill
							table.insert(lastKills, newAnim)
						end
				 
					end
				end
			end
			if (#lastKills > 0) then
				for _, v in pairs(lastKills) do
					local pos = GetEntityCoords(ped)
					local rpos = GetEntityCoords(v.entity)
					if (GetDistanceBetweenCoords(pos, rpos.x, rpos.y, rpos.z, true) < Config.KillDistance and isKillMine(v.entity)) then
						if (DoesEntityExist(v.entity)) then
							if (IsEntityDead(v.entity)) then
								ClearPedTasks(GetPlayerPed(-1))
								-- PAY THE PLAYER FOR THEIR KILL
								local payout = Config.PayPerKill * multiplier
								multiplier = multiplier + Config.MultiplierChangePerKill
								SetPedArmour(ped, GetPedArmour(ped)+Config.ArmorPerKill)
								TriggerServerEvent('NOLH:server:pay',payout)
								QBCore.Functions.Notify("Night of Living Hell payment:$"..tostring(payout).." Multiplier:"..tostring(multiplier), 'success')
								killCount = killCount + 1
								if killCount >= 10 then
									SetPedArmour(ped, GetPedArmour(ped)+Config.KillArmorReward)
									multiplier = multiplier + Config.StartingMultiplier
									QBCore.Functions.Notify("Kill-Streak! New Multiplier:"..tostring(multiplier), 'success')
									killCount = 0
									local ammotype = GetPedAmmoTypeFromWeapon(Config.PedWeapon)
									local ammocnt = GetPedAmmoByType(ped, ammotype)
									SetPedAmmo(ped, Config.PedWeapon,ammocnt+Config.KillRoundsReward)
								end
								-- print(v.entity)
								Citizen.Wait(1500)
								removeEntity(v.entity)
								DeleteEntity(v.entity)
							end
						else
							removeEntity(v.entity)
							DeleteEntity(v.entity)
						end
					end
				end
			end
			counting = counting + 1
			seconds = seconds + 1
			if seconds == 60 then
				minutes = minutes + 1
				seconds = 0
			end
			if counting == Config.CountTime then
				TriggerEvent("hospital:client:Revive")
				multiplier = multiplier + Config.MultiplierChangePerCount
				counting = 0
				QBCore.Functions.Notify("Night of Living Hell Life Timer: "..tostring(minutes).." Minutes and your New Multiplier:"..tostring(multiplier), 'primary')
			end
		end
		Wait(1000)
	end)
end
