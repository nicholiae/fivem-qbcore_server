--  Relationship Types:
--  0 = Companion
--  1 = Respect
--  2 = Like
--  3 = Neutral
--  4 = Dislike
--  5 = Hate
local QBCore = exports['qb-core']:GetCoreObject()

local nothing = ''

while nothing == '' do

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
	if playerJob == 'firefighter' then
		QBCore.Functions.Notify("Get that heat!", 'primary')
		SetMaxWantedLevel(5)
		-- SetRelationshipBetweenGroups(0, `AMBIENT_GANG_HILLBILLY`, `PLAYER`) --hillbilly
		-- SetRelationshipBetweenGroups(0, `AMBIENT_GANG_BALLAS`, `PLAYER`) --ballas
		-- SetRelationshipBetweenGroups(0, `AMBIENT_GANG_MEXICAN`, `PLAYER`) --vagos
		-- SetRelationshipBetweenGroups(0, `AMBIENT_GANG_FAMILY`, `PLAYER`) --families
		-- SetRelationshipBetweenGroups(0, `AMBIENT_GANG_MARABUNTE`, `PLAYER`) --marabunte
		-- SetRelationshipBetweenGroups(0, `AMBIENT_GANG_SALVA`, `PLAYER`) --salva
		-- SetRelationshipBetweenGroups(0, `AMBIENT_GANG_LOST`, `PLAYER`) --lostmc
		-- SetRelationshipBetweenGroups(0, `GANG_1`, `PLAYER`)
		-- SetRelationshipBetweenGroups(0, `GANG_2`, `PLAYER`)
		-- SetRelationshipBetweenGroups(0, `GANG_9`, `PLAYER`)
		-- SetRelationshipBetweenGroups(0, `GANG_10`, `PLAYER`)
		-- SetRelationshipBetweenGroups(0, `FIREMAN`, `PLAYER`)
		-- SetRelationshipBetweenGroups(0, `MEDIC`, `PLAYER`)
		-- SetRelationshipBetweenGroups(0, `COP`, `PLAYER`)
		SetRelationshipBetweenGroups(1, `AMBIENT_GANG_HILLBILLY`, `PLAYER`) --hillbilly
		SetRelationshipBetweenGroups(1, `AMBIENT_GANG_BALLAS`, `PLAYER`) --ballas
		SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MEXICAN`, `PLAYER`) --vagos
		SetRelationshipBetweenGroups(1, `AMBIENT_GANG_FAMILY`, `PLAYER`) --families
		SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MARABUNTE`, `PLAYER`) --marabunte
		SetRelationshipBetweenGroups(1, `AMBIENT_GANG_SALVA`, `PLAYER`) --salva
		SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `PLAYER`) --lostmc
		SetRelationshipBetweenGroups(1, `GANG_1`, `PLAYER`)
		SetRelationshipBetweenGroups(1, `GANG_2`, `PLAYER`)
		SetRelationshipBetweenGroups(1, `GANG_9`, `PLAYER`)
		SetRelationshipBetweenGroups(1, `GANG_10`, `PLAYER`)
		SetRelationshipBetweenGroups(1, `FIREMAN`, `PLAYER`)
		SetRelationshipBetweenGroups(1, `MEDIC`, `PLAYER`)
		SetRelationshipBetweenGroups(1, `COP`, `PLAYER`)
		nothing = 'firefighter'
		
	elseif playerJob == 'police' then
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
		nothing = 'cop'
		
		
	elseif playerJob == 'mayor' then
		QBCore.Functions.Notify("Mayor Runs the City", 'primary')
		SetMaxWantedLevel(0)
		SetRelationshipBetweenGroups(0, `AMBIENT_GANG_HILLBILLY`, `PLAYER`) --hillbilly
		SetRelationshipBetweenGroups(0, `AMBIENT_GANG_BALLAS`, `PLAYER`) --ballas
		SetRelationshipBetweenGroups(0, `AMBIENT_GANG_MEXICAN`, `PLAYER`) --vagos
		SetRelationshipBetweenGroups(0, `AMBIENT_GANG_FAMILY`, `PLAYER`) --families
		SetRelationshipBetweenGroups(0, `AMBIENT_GANG_MARABUNTE`, `PLAYER`) --marabunte
		SetRelationshipBetweenGroups(0, `AMBIENT_GANG_SALVA`, `PLAYER`) --salva
		SetRelationshipBetweenGroups(0, `AMBIENT_GANG_LOST`, `PLAYER`) --lostmc
		SetRelationshipBetweenGroups(0, `GANG_1`, `PLAYER`)
		SetRelationshipBetweenGroups(0, `GANG_2`, `PLAYER`)
		SetRelationshipBetweenGroups(0, `GANG_9`, `PLAYER`)
		SetRelationshipBetweenGroups(0, `GANG_10`, `PLAYER`)
		SetRelationshipBetweenGroups(0, `FIREMAN`, `PLAYER`)
		SetRelationshipBetweenGroups(0, `MEDIC`, `PLAYER`)
		SetRelationshipBetweenGroups(0, `COP`, `PLAYER`)
		SetRelationshipBetweenGroups(0, `PRISONER`, `PLAYER`)
		nothing = 'mayor'
		
		
	elseif playerGang == 'syndicate' then
		QBCore.Functions.Notify("Only one way out of the Syndicate", 'primary')
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_BALLAS`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_MEXICAN`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_FAMILY`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_MARABUNTE`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_SALVA`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_HILLBILLY`, `PLAYER`) --Like
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_LOST`, `PLAYER`) 
		SetRelationshipBetweenGroups(4, `GANG_1`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_2`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_9`, `PLAYER`)
		SetRelationshipBetweenGroups(4, `GANG_10`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `FIREMAN`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `MEDIC`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `COP`, `PLAYER`)
		SetRelationshipBetweenGroups(3, `PRISONER`, `PLAYER`)
		nothing = 'syndicate'
		
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
		nothing = 'hillbilly'
		
	elseif playerGang == 'ballas' then
		SetRelationshipBetweenGroups(1, `AMBIENT_GANG_BALLAS`, `PLAYER`) --Like
		QBCore.Functions.Notify("Ballas", 'primary')
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
		nothing = 'ballas'
		
	elseif playerGang == 'otf' then
		QBCore.Functions.Notify("Only The Fam", 'primary')
		SetRelationshipBetweenGroups(4, `AMBIENT_GANG_BALLAS`, `PLAYER`)
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
		nothing = 'otf'
		
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
		nothing = 'vagos'
		
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
		nothing = 'AnyBody Killaz'
		
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
		nothing = 'families'
		
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
		nothing = 'marabunte'
		
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
		nothing = 'salva'
		
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
		nothing = 'lost'
	
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
		nothing = 'citizen'
	end
end


-- player gang specific setups. 


--AI Relationship

SetRelationshipBetweenGroups(3, `AMBIENT_GANG_HILLBILLY`, `AMBIENT_GANG_BALLAS`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_HILLBILLY`, `AMBIENT_GANG_MEXICAN`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_HILLBILLY`, `AMBIENT_GANG_FAMILY`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_HILLBILLY`, `AMBIENT_GANG_MARABUNTE`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_HILLBILLY`, `AMBIENT_GANG_SALVA`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_HILLBILLY`, `AMBIENT_GANG_LOST`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_HILLBILLY`, `GANG_1`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_HILLBILLY`, `GANG_2`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_HILLBILLY`, `GANG_9`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_HILLBILLY`, `GANG_10`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_HILLBILLY`, `COP`)

SetRelationshipBetweenGroups(3, `AMBIENT_GANG_BALLAS`, `AMBIENT_GANG_HILLBILLY`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_BALLAS`, `AMBIENT_GANG_MEXICAN`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_BALLAS`, `AMBIENT_GANG_FAMILY`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_BALLAS`, `AMBIENT_GANG_MARABUNTE`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_BALLAS`, `AMBIENT_GANG_SALVA`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_BALLAS`, `AMBIENT_GANG_LOST`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_BALLAS`, `GANG_1`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_BALLAS`, `GANG_2`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_BALLAS`, `GANG_9`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_BALLAS`, `GANG_10`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_BALLAS`, `COP`)

SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MEXICAN`, `AMBIENT_GANG_HILLBILLY`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MEXICAN`, `AMBIENT_GANG_BALLAS`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MEXICAN`, `AMBIENT_GANG_FAMILY`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MEXICAN`, `AMBIENT_GANG_MARABUNTE`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MEXICAN`, `AMBIENT_GANG_SALVA`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MEXICAN`, `AMBIENT_GANG_LOST`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MEXICAN`, `GANG_1`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MEXICAN`, `GANG_2`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MEXICAN`, `GANG_9`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MEXICAN`, `GANG_10`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MEXICAN`, `COP`)

SetRelationshipBetweenGroups(3, `AMBIENT_GANG_FAMILY`, `AMBIENT_GANG_HILLBILLY`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_FAMILY`, `AMBIENT_GANG_MEXICAN`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_FAMILY`, `AMBIENT_GANG_BALLAS`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_FAMILY`, `AMBIENT_GANG_MARABUNTE`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_FAMILY`, `AMBIENT_GANG_SALVA`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_FAMILY`, `AMBIENT_GANG_LOST`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_FAMILY`, `GANG_1`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_FAMILY`, `GANG_2`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_FAMILY`, `GANG_9`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_FAMILY`, `GANG_10`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_FAMILY`, `COP`)

SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MARABUNTE`, `AMBIENT_GANG_HILLBILLY`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MARABUNTE`, `AMBIENT_GANG_MEXICAN`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MARABUNTE`, `AMBIENT_GANG_BALLAS`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MARABUNTE`, `AMBIENT_GANG_FAMILY`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MARABUNTE`, `AMBIENT_GANG_SALVA`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MARABUNTE`, `AMBIENT_GANG_LOST`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MARABUNTE`, `GANG_1`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MARABUNTE`, `GANG_2`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MARABUNTE`, `GANG_9`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MARABUNTE`, `GANG_10`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MARABUNTE`, `COP`)

SetRelationshipBetweenGroups(3, `AMBIENT_GANG_SALVA`, `AMBIENT_GANG_HILLBILLY`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_SALVA`, `AMBIENT_GANG_MEXICAN`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_SALVA`, `AMBIENT_GANG_BALLAS`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_SALVA`, `AMBIENT_GANG_FAMILY`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_SALVA`, `AMBIENT_GANG_MARABUNTE`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_SALVA`, `AMBIENT_GANG_LOST`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_SALVA`, `GANG_1`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_SALVA`, `GANG_2`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_SALVA`, `GANG_9`)
-- SetRelationshipBetweenGroups(3, `AMBIENT_GANG_SALVA`, `GANG_10`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_SALVA`, `COP`)

SetRelationshipBetweenGroups(3, `AMBIENT_GANG_LOST`, `AMBIENT_GANG_HILLBILLY`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_LOST`, `AMBIENT_GANG_MEXICAN`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_LOST`, `AMBIENT_GANG_BALLAS`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_LOST`, `AMBIENT_GANG_FAMILY`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_LOST`, `AMBIENT_GANG_MARABUNTE`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_LOST`, `AMBIENT_GANG_SALVA`)
-- SetRelationshipBetweenGroups(5, `AMBIENT_GANG_LOST`, `GANG_1`)
-- SetRelationshipBetweenGroups(5, `AMBIENT_GANG_LOST`, `GANG_2`)
-- SetRelationshipBetweenGroups(5, `AMBIENT_GANG_LOST`, `GANG_9`)
-- SetRelationshipBetweenGroups(5, `AMBIENT_GANG_LOST`, `GANG_10`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_LOST`, `COP`)

-- SetRelationshipBetweenGroups(5, `GANG_1`, `AMBIENT_GANG_HILLBILLY`)
-- SetRelationshipBetweenGroups(5, `GANG_1`, `AMBIENT_GANG_MEXICAN`)
-- SetRelationshipBetweenGroups(5, `GANG_1`, `AMBIENT_GANG_BALLAS`)
-- SetRelationshipBetweenGroups(5, `GANG_1`, `AMBIENT_GANG_FAMILY`)
-- SetRelationshipBetweenGroups(5, `GANG_1`, `AMBIENT_GANG_MARABUNTE`)
-- SetRelationshipBetweenGroups(5, `GANG_1`, `AMBIENT_GANG_SALVA`)
-- SetRelationshipBetweenGroups(5, `GANG_1`, `AMBIENT_GANG_LOST`)
-- SetRelationshipBetweenGroups(5, `GANG_1`, `GANG_2`)
-- SetRelationshipBetweenGroups(5, `GANG_1`, `GANG_9`)
-- SetRelationshipBetweenGroups(5, `GANG_1`, `GANG_10`)
-- SetRelationshipBetweenGroups(3, `GANG_1`, `COP`)

-- SetRelationshipBetweenGroups(5, `GANG_2`, `AMBIENT_GANG_HILLBILLY`)
-- SetRelationshipBetweenGroups(5, `GANG_2`, `AMBIENT_GANG_MEXICAN`)
-- SetRelationshipBetweenGroups(5, `GANG_2`, `AMBIENT_GANG_BALLAS`)
-- SetRelationshipBetweenGroups(5, `GANG_2`, `AMBIENT_GANG_FAMILY`)
-- SetRelationshipBetweenGroups(5, `GANG_2`, `AMBIENT_GANG_MARABUNTE`)
-- SetRelationshipBetweenGroups(5, `GANG_2`, `AMBIENT_GANG_SALVA`)
-- SetRelationshipBetweenGroups(5, `GANG_2`, `AMBIENT_GANG_LOST`)
-- SetRelationshipBetweenGroups(5, `GANG_2`, `GANG_1`)
-- SetRelationshipBetweenGroups(5, `GANG_2`, `GANG_9`)
-- SetRelationshipBetweenGroups(5, `GANG_2`, `GANG_10`)
-- SetRelationshipBetweenGroups(3, `GANG_2`, `COP`)

-- SetRelationshipBetweenGroups(5, `GANG_9`, `AMBIENT_GANG_HILLBILLY`)
-- SetRelationshipBetweenGroups(5, `GANG_9`, `AMBIENT_GANG_MEXICAN`)
-- SetRelationshipBetweenGroups(5, `GANG_9`, `AMBIENT_GANG_BALLAS`)
-- SetRelationshipBetweenGroups(5, `GANG_9`, `AMBIENT_GANG_FAMILY`)
-- SetRelationshipBetweenGroups(5, `GANG_9`, `AMBIENT_GANG_MARABUNTE`)
-- SetRelationshipBetweenGroups(5, `GANG_9`, `AMBIENT_GANG_SALVA`)
-- SetRelationshipBetweenGroups(5, `GANG_9`, `AMBIENT_GANG_LOST`)
-- SetRelationshipBetweenGroups(5, `GANG_9`, `GANG_1`)
-- SetRelationshipBetweenGroups(5, `GANG_9`, `GANG_2`)
-- SetRelationshipBetweenGroups(5, `GANG_9`, `GANG_10`)
-- SetRelationshipBetweenGroups(3, `GANG_9`, `COP`)

-- SetRelationshipBetweenGroups(5, `GANG_10`, `AMBIENT_GANG_HILLBILLY`)
-- SetRelationshipBetweenGroups(5, `GANG_10`, `AMBIENT_GANG_MEXICAN`)
-- SetRelationshipBetweenGroups(5, `GANG_10`, `AMBIENT_GANG_BALLAS`)
-- SetRelationshipBetweenGroups(5, `GANG_10`, `AMBIENT_GANG_FAMILY`)
-- SetRelationshipBetweenGroups(5, `GANG_10`, `AMBIENT_GANG_MARABUNTE`)
-- SetRelationshipBetweenGroups(5, `GANG_10`, `AMBIENT_GANG_SALVA`)
-- SetRelationshipBetweenGroups(5, `GANG_10`, `AMBIENT_GANG_LOST`)
-- SetRelationshipBetweenGroups(5, `GANG_10`, `GANG_1`)
-- SetRelationshipBetweenGroups(5, `GANG_10`, `GANG_2`)
-- SetRelationshipBetweenGroups(5, `GANG_10`, `GANG_9`)
-- SetRelationshipBetweenGroups(3, `GANG_10`, `COP`)

SetRelationshipBetweenGroups(3, `COP`, `AMBIENT_GANG_HILLBILLY`)
SetRelationshipBetweenGroups(3, `COP`, `AMBIENT_GANG_MEXICAN`)
SetRelationshipBetweenGroups(3, `COP`, `AMBIENT_GANG_BALLAS`)
SetRelationshipBetweenGroups(3, `COP`, `AMBIENT_GANG_FAMILY`)
SetRelationshipBetweenGroups(3, `COP`, `AMBIENT_GANG_MARABUNTE`)
SetRelationshipBetweenGroups(3, `COP`, `AMBIENT_GANG_SALVA`)
SetRelationshipBetweenGroups(3, `COP`, `AMBIENT_GANG_LOST`)
-- SetRelationshipBetweenGroups(3, `COP`, `GANG_1`)
-- SetRelationshipBetweenGroups(3, `COP`, `GANG_2`)
-- SetRelationshipBetweenGroups(3, `COP`, `GANG_9`)
-- SetRelationshipBetweenGroups(3, `COP`, `GANG_10`)




