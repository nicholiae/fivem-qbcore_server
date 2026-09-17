local QBCore = exports['qb-core']:GetCoreObject()
local pedCreated
local countdownOnGoing
local gameOnGoing = false
local playerQueue = {}
local plane 
local plane2 
local plane3 
local tdmType = nil 
-- local existingKarts = {}
local killDeathCounterList = {}
local lootChestLocations = {}
local lootChestObjects = {}
local lootChestIds = {}
local timer = cfg.gameSettings.queueTimer
local index = 1
local morethanone = false
local zoneChange = 60
local players = 1
local playerTeam = 0
local votese = 0
local votesy = 0
local votesq = 0
local gameTypeServer = 0


function GetRewards()
    if gameOnGoing then
        for k, v in pairs(playerQueue) do
			SetEntityCoords(GetPlayerPed(v.tempid), cfg.gameSettings.spawnLocAfterGame, false, false, true, true)
			TriggerClientEvent("BattleRoyal:gameover", v.tempid)
        end
    end
	Wait(3000)
	local mostKills = nil
	local longestLifeTime = nil
	local mostDeaths = nil
	local longestHillTime = nil
	local lastManAlive = nil
	local highestKills = 0
	local highestDeaths = 0
	local highestSurviveTime = 0
	local highestHillTime = 0
	for ke, ve in pairs(killDeathCounterList) do
		for key,vey in pairs(ve) do
			if key == 'kills' then 
				if vey > highestKills then 
					highestKills = vey
					mostKills = killDeathCounterList[ke].id
				end
			end
			if key == 'deaths' then 
				if vey > highestDeaths then 
					highestDeaths = vey
					mostDeaths = killDeathCounterList[ke].id
				end
			end
			if key == 'surviveTime' then 
				if vey > highestSurviveTime then 
					highestSurviveTime = vey
					longestLifeTime = killDeathCounterList[ke].id
				end
			end
			if gameTypeServer == 2 then
				if key == 'hillTime' then 
					if vey > highestHillTime then 
						highestHillTime = vey
						longestHillTime = killDeathCounterList[ke].id
					end
				end
			end
			if gameTypeServer == 1 then
				if key == 'isAlive' then 
					if vey == true then 
						lastManAlive = killDeathCounterList[ke].id
					end
				end
			end
		end
	end
	if gameTypeServer == 2 then
		local kingPlayer = QBCore.Functions.GetPlayer(tonumber(longestHillTime))
		if kingPlayer then
			kingPlayer.Functions.AddMoney('crypto', tonumber(cfg.rewards.kingReward*highestHillTime), 'BattleRoyal:kingReward')
			TriggerClientEvent('QBCore:Notify', longestHillTime, "You won the King Award!", 'success', 10000)
			TriggerEvent("qb-log:server:CreateLog", "BattleRoyal", "BattleRoyal", "yellow", "Player:".. kingPlayer.PlayerData.name .. "\n HillTime:"..tostring(highestHillTime).."\n Reward: Crypto("..tostring(cfg.rewards.kingReward*highestHillTime)..")")
		end
	end
	if gameTypeServer == 1 then
		local survivorPlayer = QBCore.Functions.GetPlayer(tonumber(lastManAlive))
		if survivorPlayer then
			local weapontogive = cfg.possibleGunRewards[math.random(#cfg.possibleGunRewards)].wepName
			exports['qb-inventory']:AddItem(lastManAlive, weapontogive, 1, false, false, 'BattleRoyal:server:lastManAliveReward')
			TriggerClientEvent('QBCore:Notify', lastManAlive, "You won the Last Man Alive Award!", 'success', 10000)
			TriggerEvent("qb-log:server:CreateLog", "BattleRoyal", "BattleRoyal", "blue", "Player:".. survivorPlayer.PlayerData.name .. "\n LastManAliveReward: ("..tostring(weapontogive)..")")
		end
	end
	-- print(mostKills)
	-- print(mostDeaths)
	-- print(longestLifeTime)
	local killerPlayer = QBCore.Functions.GetPlayer(tonumber(mostKills))
    if killerPlayer then
		local amount = cfg.rewards.mostKillsReward * highestKills
		exports['qb-inventory']:AddItem(mostKills, 'goldbar', amount, false, false, 'BattleRoyal:server:mostKills')
		TriggerClientEvent('QBCore:Notify', mostKills, "You won the most Kills Award!", 'success', 60000)
		TriggerEvent("qb-log:server:CreateLog", "BattleRoyal", "BattleRoyal", "red", "Player:".. killerPlayer.PlayerData.name .. "\n mostKills:"..tostring(highestDeaths).."\n Reward: goldbars("..tostring(amount)..")")
	
    end
	local deathPlayer = QBCore.Functions.GetPlayer(tonumber(mostDeaths))
    if deathPlayer then
        deathPlayer.Functions.AddMoney('cash', tonumber(cfg.rewards.mostDeathsReward), 'BattleRoyal:mostDeathsReward')
		TriggerClientEvent('QBCore:Notify', mostDeaths, "You won the most Deaths Award!", 'success', 60000)
		TriggerEvent("qb-log:server:CreateLog", "BattleRoyal", "BattleRoyal", "orange", "Player:".. deathPlayer.PlayerData.name .. "\n mostDeaths:"..tostring(highestKills).."\n Reward: $("..tostring(cfg.rewards.mostDeathsReward)..")")
    end
	local lifePlayer = QBCore.Functions.GetPlayer(tonumber(longestLifeTime))
    if lifePlayer then
        lifePlayer.Functions.AddMoney('cash', tonumber(cfg.rewards.lifeReward*highestSurviveTime), 'BattleRoyal:lifeReward')
		TriggerClientEvent('QBCore:Notify', longestLifeTime, "You won the longest life Award!", 'success', 60000)
		TriggerEvent("qb-log:server:CreateLog", "BattleRoyal", "BattleRoyal", "green", "Player:".. lifePlayer.PlayerData.name .. "\n LongestLife:"..tostring(highestSurviveTime).."\n Reward: $("..tostring(cfg.rewards.lifeReward*highestSurviveTime)..")")
    end
	endGame()
end


RegisterNetEvent("BattleRoyal:updateTable")
AddEventHandler("BattleRoyal:updateTable", function()
    local source = source
    local playersQueued = tablelength(playerQueue)

    if gameOnGoing then
        TriggerClientEvent("BattleRoyal:GameOngoing", source)
        return
    end
    
    if playersQueued > 0 then
        for k, v in pairs(playerQueue) do
            if v.tempid == source then
                TriggerClientEvent("BattleRoyal:alreadyInQueue", source)
                return false
            end
        end

        if playersQueued >= cfg.maxPlayers then
            TriggerClientEvent("BattleRoyal:SlotsFilled", source)
            return false
        else
			TriggerClientEvent("BattleRoyal:JoinedQueue", source, timer)
			playerQueue[index] = {tempid = source}
			index = index + 1
			if not countdownOnGoing then
				countdownOnGoing = true
				Wait(timer / 1000)
				startCountdown()
				countdownOnGoing = false
			end
        end
    else
        TriggerClientEvent("BattleRoyal:JoinedQueue", source, timer)
        playerQueue[index] = {tempid = source}
        index = index + 1
        if not countdownOnGoing then
            countdownOnGoing = true
            Wait(timer / 1000)
            startCountdown()
            countdownOnGoing = false
        end
        return
        
    end
end)

local resourceName = GetCurrentResourceName()
AddEventHandler('playerDropped', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(source)
	if Player then
		local PlayerData = Player.PlayerData
	else
		return
	end
    if gameOnGoing then
		for k,v in pairs(playerQueue) do
			if v.tempid == src then
			for i,d in pairs(killDeathCounterList) do
				if killDeathCounterList[i].id == src then
					killDeathCounterList[i].isAlive = false
				end
			end
				SetEntityCoords(src,cfg.gameSettings.spawnLocAfterGame.x,cfg.gameSettings.spawnLocAfterGame.y,cfg.gameSettings.spawnLocAfterGame.z,false,false,false,false)
				-- print('return true')
				-- print(Player.PlayerData.position)
				-- for _,loc in pairs(Player.PlayerData.position) do
					-- print(loc)
				-- end
				Wait(5000)
				MySQL.insert('INSERT INTO players (citizenid, cid, license, name, money, charinfo, job, gang, position, metadata) VALUES (:citizenid, :cid, :license, :name, :money, :charinfo, :job, :gang, :position, :metadata) ON DUPLICATE KEY UPDATE cid = :cid, name = :name, money = :money, charinfo = :charinfo, job = :job, gang = :gang, position = :position, metadata = :metadata', {
					citizenid = PlayerData.citizenid,
					cid = tonumber(PlayerData.cid),
					license = PlayerData.license,
					name = PlayerData.name,
					money = json.encode(PlayerData.money),
					charinfo = json.encode(PlayerData.charinfo),
					job = json.encode(PlayerData.job),
					gang = json.encode(PlayerData.gang),
					position = json.encode(cfg.gameSettings.spawnLocAfterGame),
					metadata = json.encode(PlayerData.metadata)
				})
				
				local savedItemData = {}
				Player.Functions.SetPlayerData('items', savedItemData)
				local keepList = {'phone, goldbar'}
				
				-- exports['qb-inventory']:ClearInventory(src, keepList)
				QBCore.ShowSuccess(resourceName, PlayerData.name .. ' PLAYER SAVED!')
				-- return true
			end
		end
	end
end)

RegisterNetEvent("BattleRoyal:putmeinaseat")
AddEventHandler("BattleRoyal:putmeinaseat", function(playerPed)
	if plane and not plane2 and not plane3 then
		SetPedIntoVehicle(playerPed, plane, 6)
	elseif plane and plane2 and not plane3 then
		SetPedIntoVehicle(playerPed, plane2, 6)
	elseif plane and plane2 and plane3 then
		SetPedIntoVehicle(playerPed, plane3, 6)
	end
end)

RegisterNetEvent("BattleRoyal:chestOpen")
AddEventHandler("BattleRoyal:chestOpen", function(ClosestStash)
    local src = source
	exports['qb-inventory']:OpenInventory(src, ClosestStash)
end)

RegisterNetEvent("BattleRoyal:inHill")
AddEventHandler("BattleRoyal:inHill", function(hillChange)
    local src = source
    local hillChange = hillChange
    if gameOnGoing then
		for i,d in pairs(killDeathCounterList) do
			if killDeathCounterList[i].id == src then
				killDeathCounterList[i].isInsideHill = hillChange
			end
		end
		TriggerClientEvent('BattleRoyal:updateKD', -1, killDeathCounterList)
    end
end)

RegisterNetEvent("BattleRoyal:clearInv")
AddEventHandler("BattleRoyal:clearInv", function()
    local src = source
	local keepList = {}
	exports['qb-inventory']:ClearInventory(src, keepList)
end)

RegisterNetEvent("BattleRoyal:clearInvGold")
AddEventHandler("BattleRoyal:clearInvGold", function()
    local src = source
	local keepList = {'goldbar', 'phone'}
	exports['qb-inventory']:ClearInventory(src, keepList)
end)

RegisterNetEvent("BattleRoyal:LootSpawnStart")
AddEventHandler("BattleRoyal:LootSpawnStart", function()
    -- local objectModel = 'xm_prop_rsply_crate04b'
    -- local objectModel = 'prop_drop_crate_01'
    local objectModel = 'gr_prop_gr_crate_pistol_02a'
	if cfg.debugKills then
		local position = vector4(4452.77, -4495.39, 4.2, 180)
		local chest = CreateObject('xm_prop_rsply_crate04b', position.x, position.y, position.z, true, true, false)
		table.insert(lootChestObjects, chest)
		local data = {
			label = 'LootCrate:DEBUG',
			maxweight = 500000000,
			slots = 100
		}
		table.insert(lootChestLocations,position)
		table.insert(lootChestIds,data.label)
		Wait(1000)
		exports['qb-inventory']:AddItem(data.label, 'weapon_m45a1', 1, 1, false, 'LootCrates DEBUG lootInside Add')
		exports['qb-inventory']:AddItem(data.label, 'weapon_m45a1', 1, 2, false, 'LootCrates DEBUG lootInside Add')
		exports['qb-inventory']:AddItem(data.label, 'rifle_ammo', 10, 3, false, 'LootCrates DEBUG lootInside Add')
		exports['qb-inventory']:AddItem(data.label, 'rifle_ammo', 10, 4, false, 'LootCrates DEBUG lootInside Add')
	end
	for number in pairs(cfg.lootChests) do 
		local doWeSpawn = math.random(0,10)
		
		if doWeSpawn <= 5 then
			local position = cfg.lootChests[number].location
			local chest = CreateObject(objectModel, position.x, position.y, position.z, true, true, false)
			table.insert(lootChestObjects, chest)
			local data = {
				label = 'LootCrate:'..tostring(number),
				maxweight = 500000000,
				slots = 100
			}
			table.insert(lootChestLocations,position)
			table.insert(lootChestIds,data.label)
			
			local lootInside = {}
			local lootType = {}
			local weaponsInside = 0
			local medicalInside = 0
			local ammoInside = 0
			local goldInside = 0
			local chanceWep = math.random(1,100)
			local chanceMed = math.random(1,100)
			local chanceAmm = math.random(1,100)
			if chanceWep <= cfg.chanceForWeapons then
				while weaponsInside ~= cfg.maxWeaponItems do
					local weaponChance = math.random(1,100)
					local weaponNumber = math.random(#cfg.possibleGuns)
					if cfg.possibleGuns[weaponNumber] then
						local chanceToSpawn = cfg.possibleGuns[weaponNumber].wepChance
						if chanceToSpawn > weaponChance then
							local weapon = cfg.possibleGuns[weaponNumber].wepName
							table.insert(lootInside,weapon)
							table.insert(lootType,'weapon')
							weaponsInside = weaponsInside + 1
						end
					end
				end
			end
			if chanceMed <= cfg.chanceForMedical then
				while medicalInside ~= cfg.maxMedicalItems do
					local medicalChance = math.random(1,100)
					local medicalNumber = math.random(#cfg.possibleMedical)
					local chanceToSpawn = cfg.possibleMedical[medicalNumber].wepChance
					if cfg.possibleMedical[medicalNumber] then
						if chanceToSpawn > medicalChance then
							local medical = cfg.possibleMedical[medicalNumber].wepName
							table.insert(lootInside,medical)
							table.insert(lootType,'medical')
							medicalInside = medicalInside + 1
						end
					end
				end
			end
			if chanceAmm <= cfg.chanceForAmmo then
				while ammoInside ~= cfg.maxAmmoItems do
					local ammoChance = math.random(1,100)
					local ammoNumber = math.random(#cfg.possibleAmmo)
					local chanceToSpawn = cfg.possibleAmmo[ammoNumber].wepChance
					if cfg.possibleAmmo[ammoNumber] then
						if chanceToSpawn > ammoChance then
							local ammo = cfg.possibleAmmo[ammoNumber].wepName
							table.insert(lootType,'ammo')
							table.insert(lootInside,ammo)
							ammoInside = ammoInside + 1
						end
					end
				end
			end
			-- for k, v in pairs(playerQueue) do
			exports['qb-inventory']:createLootInventory(1, data.label, data)
			-- end
			local slotCount = 1
			local itemAmount = 1
			for item in pairs(lootInside) do
				if lootType[slotCount] == 'ammo' then
					itemAmount = math.random(1,cfg.maxAmountAmmo)
				end
				if lootType[slotCount] == 'medical' then
					itemAmount = math.random(1,cfg.maxAmountMedical)
				end
				if lootType[slotCount] == 'weapon' then
					itemAmount = 1
				end
				exports['qb-inventory']:AddItem(data.label, lootInside[slotCount], itemAmount, slotCount, false, 'LootCrates lootInside Add')
				slotCount = slotCount + 1
			end
			-- if #lootInside <= 1 then
				-- exports['qb-inventory']:AddItem(data.label, 'panther', 1, slotCount, false, 'LootCrates No Loot')
				-- slotCount = slotCount + 1
			-- end
			local goldChance = math.random(1,100)
			if goldChance <= cfg.chanceForGold then
				local itemAmount = math.random(1,cfg.maxAmountGold)
				exports['qb-inventory']:AddItem(data.label, cfg.goldbar, itemAmount, slotCount, false, 'LootCrates Gold Add')
				slotCount = slotCount + 1
			end
		end
		Wait(250)
	end
	
	for k, v in pairs(playerQueue) do
		if #lootChestLocations ~= 0 and #lootChestIds ~= 0 then
			-- print(v.tempid)
			if k == tablelength(playerQueue)+1 then
				if cfg.debug then
					print('lootspawn:k: '..tostring(k))
					print('lootspawn:playerQueue+1: '..tostring(#playerQueue+1))
				end
				break
			else
				if cfg.debug then
					print('lootspawn:v.tempid: '..tostring(v.tempid))
				end
				TriggerClientEvent("BattleRoyal:lootChestLocationSync", v.tempid, lootChestLocations, lootChestIds)
			end
			Wait(100)
		end
	end
	
end)

RegisterNetEvent("BattleRoyal:Start")
AddEventHandler("BattleRoyal:Start", function()
    local src = source
	if cfg.debug then
		print('Start src: '..tostring(src))
		print('Start gameOnGoing: '..tostring(gameOnGoing))
	end
    if not gameOnGoing then
        gameOnGoing = true
        startGame()
		if cfg.debug then
			print('Start afterStartGame call')
		end
		for count,player in pairs(playerQueue) do
			if count == tablelength(playerQueue)+1 then
				if cfg.debug then
					print('Start break count'..tostring(count))
					print('Start break tablelength(playerQueue)+1'..tostring(tablelength(playerQueue)+1))
				end
				break
			else
				if cfg.debug then
					print('Start player.tempId: '..tostring(player.tempid))
				end
				TriggerClientEvent("BattleRoyal:tensecondcountdown", player.tempid)
			end
		end
        Citizen.Wait(cfg.gameSettings.timeToPlayGame * 1000)
		if gameTypeServer == 1 then
			while morethanone do
				if cfg.debugtensecondcountdown then
					print('Server morethanone loop: '..tostring(morethanone))
				end
				Citizen.Wait(1000) -- while there is more than one person alive in last man standing wait 1 second
			end
		end
		GetRewards()
        -- endGame()
    end
end)

RegisterNetEvent("BattleRoyal:killCounter")
AddEventHandler("BattleRoyal:killCounter", function(killerID)
    local src = source
	local killer = killerID
	if cfg.debugKills then
		print('BattleRoyal:killCounter src: '..tostring(src))
		print('BattleRoyal:killCounter killer: '..tostring(killer))
		print('BattleRoyal:killCounter killerID: '..tostring(killerID))
	end
    if gameOnGoing then
		for i,d in pairs(killDeathCounterList) do
			if killDeathCounterList[i].id == killer and killer ~= src then
				if killDeathCounterList[i].isAlive == true then
					killDeathCounterList[i].kills = killDeathCounterList[i].kills + 1
				end	
			end
			if killDeathCounterList[i].id == src then
				if killDeathCounterList[i].isAlive == true then
					killDeathCounterList[i].deaths = killDeathCounterList[i].deaths + 1
					killDeathCounterList[i].isAlive = false
				end
			end
			if cfg.debugKills then
				print('BattleRoyal:killCounter killer After: '..tostring(killer))
				print('BattleRoyal:killCounter GetPlayerName(src): '..tostring(GetPlayerName(src)))
				print('BattleRoyal:killCounter GetPlayerName(killer): '..tostring(GetPlayerName(killer)))
			end
			if killer ~= 0 then 
				local killerName = GetPlayerName(killer)
			else
				local killerName = GetPlayerName(src)
			end
			local dead = GetPlayerName(src)
			TriggerClientEvent('BattleRoyal:announcement', killDeathCounterList[i].id, killerName, dead)
		end
		TriggerClientEvent('BattleRoyal:updateKD', -1, killDeathCounterList)
    end
end)

RegisterNetEvent("BattleRoyal:reviveMe")
AddEventHandler("BattleRoyal:reviveMe", function()
    local src = source
    if gameOnGoing then
		for i,d in pairs(killDeathCounterList) do
			if killDeathCounterList[i].id == src then
				killDeathCounterList[i].isAlive = true
			end
		end
	end
	TriggerClientEvent('BattleRoyal:updateKD', -1, killDeathCounterList)
end)

QBCore.Functions.CreateCallback('NS-BattleRoyal:server:isGameActiveAndPlayerInvolved', function(cb, source)
    local src = source 

	if cfg.debugcallback then
		print('isGameActiveAndPlayerInvolved src:'..tostring(src))
		print('isGameActiveAndPlayerInvolved cb:'..tostring(cb))
		print('isGameActiveAndPlayerInvolved gameOnGoing:'..tostring(gameOnGoing))
	end	
    if gameOnGoing then
		for k,v in pairs(playerQueue) do
			if cfg.debugcallback then
				print('isGameActiveAndPlayerInvolved v.tempid:'..tostring(v.tempid))
				print('isGameActiveAndPlayerInvolved src:'..tostring(src))
			end	
		
			if v.tempid == src then
				if cfg.debugcallback then				
					print('isGameActiveAndPlayerInvolved return true callback')
				end
				cb(true)
				return 
				-- return true
			end
		end
	else

		if cfg.debugcallback then				
			print('isGameActiveAndPlayerInvolved return false callback')
		end
		cb(false)
		return 
		-- return false
	end
end)

RegisterNetEvent("BattleRoyal:morethanone")
AddEventHandler("BattleRoyal:morethanone", function(trigger)
	if cfg.debugtensecondcountdown then
		print('Server morethanone trigger: '..tostring(trigger))
	end
    morethanone = trigger
end)

RegisterNetEvent("BattleRoyal:unfreezePlane")
AddEventHandler("BattleRoyal:unfreezePlane", function(vehicle)
    local src = source
	FreezeEntityPosition(vehicle, false)
	FreezeEntityPosition(plane, false)
	FreezeEntityPosition(plane2, false)
	FreezeEntityPosition(plane3, false)
end)

RegisterNetEvent("BattleRoyal:receiveVote")
AddEventHandler("BattleRoyal:receiveVote", function(vote)
    local src = source
	if vote == 1 then
		votese = votese + 1
	end
	
	if vote == 2 then
		votesy = votesy + 1
	end
	
	if vote == 3 then
		votesq = votesq + 1
	end
end)

QBCore.Functions.CreateCallback('BattleRoyal:votesReturn', function(source, cb)
    local src = source
	local clientvotese = votese
	local clientvotesy = votesy
	local clientvotesq = votesq
	local votes = {clientvotese,clientvotesy,clientvotesq}
	cb(votes)
end)

function getHighestVote()
	
	local votes = {votese,votesy,votesq}
	local top = 0
	local highest = 0
	for t, val in pairs(votes) do
		-- print('t:'..tostring(t))
		-- print('val:'..tostring(val))
		-- print('top:'..tostring(top))
		-- print('highest:'..tostring(highest))
		if val > top then
			top = val
			highest = t
		end
	end
	if highest == 0 then
		highest = 1
	end
	return(highest)
end

function getHighestKills()
	
	local votes = killDeathCounterList.kills
	local top = 0
	local highest = 0
	for t, val in pairs(votes) do
		-- print('t:'..tostring(t))
		-- print('val:'..tostring(val))
		-- print('top:'..tostring(top))
		-- print('highest:'..tostring(highest))
		if val > top then
			top = val
			highest = t
		end
	end
	return(highest)
end

function getHighestDeaths()
	
	local votes = killDeathCounterList.deaths
	local top = 0
	local highest = 0
	for t, val in pairs(votes) do
		-- print('t:'..tostring(t))
		-- print('val:'..tostring(val))
		-- print('top:'..tostring(top))
		-- print('highest:'..tostring(highest))
		if val > top then
			top = val
			highest = t
		end
	end
	return(highest)
end

function getHighestLife()
	
	local votes = killDeathCounterList.timeAlive
	local top = 0
	local highest = 0
	for t, val in pairs(votes) do
		-- print('t:'..tostring(t))
		-- print('val:'..tostring(val))
		-- print('top:'..tostring(top))
		-- print('highest:'..tostring(highest))
		if val > top then
			top = val
			highest = t
		end
	end
	return(highest)
end

function getHighestKing()
	
	local votes = killDeathCounterList.hillTime
	local top = 0
	local highest = 0
	for t, val in pairs(votes) do
		-- print('t:'..tostring(t))
		-- print('val:'..tostring(val))
		-- print('top:'..tostring(top))
		-- print('highest:'..tostring(highest))
		if val > top then
			top = val
			highest = t
		end
	end
	return(highest)
end

function startGame()
	-- local plane = Citizen.InvokeNative(`CREATE_AUTOMOBILE` & 0xFFFFFFFF, cfg.transport.vehicleModel, cfg.transport.locations[1], 326.09)
	plane = CreateVehicle(cfg.transport.vehicleModel, cfg.transport.locations[1].x, cfg.transport.locations[1].y, cfg.transport.locations[1].z, 251.23, true, true)
	if #playerQueue >= 10 then
		plane2 = CreateVehicle(cfg.transport.vehicleModel, cfg.transport.locations[2].x, cfg.transport.locations[2].y, cfg.transport.locations[2].z, 251.23, true, true)
		FreezeEntityPosition(plane2, true)
	end
	if #playerQueue >= 19 then
		plane3 = CreateVehicle(cfg.transport.vehicleModel, cfg.transport.locations[3].x, cfg.transport.locations[3].y, cfg.transport.locations[3].z, 251.23, true, true)
		FreezeEntityPosition(plane3, true)
	end
	FreezeEntityPosition(plane, true)
	local vehicleSlot = 0
	local gameType = getHighestVote()
	gameTypeServer = gameType
	if cfg.debug then
		print('startGame:server: gameType '..tostring(gameType))
		print('startGame:server: gameTypeServer '..tostring(gameTypeServer))
	end
	teamPlayerCount = 0 
	savedTPC = 0
	if gameTypeServer == 3 then
		if #playerQueue == 1 then
			-- end the game prematurely if we dont have the correct player count for an even TDM
			local playersCount = 0
			for i = 1, #playerQueue do
				if playersCount > i then
					if cfg.debug then
						print('startGame:server:BREAK playersCount'..tostring(playersCount))
						print('startGame:server:BREAK i'..tostring(i))
					end
					break
				else
					playersCount = playersCount + 1
					TriggerClientEvent('QBCore:Notify', playerQueue[i].tempid, "Player count would make uneven teams for TDM", 'error', 5000)
				end
			end 
			endGame()
			return 
		end
		if #playerQueue == 3 then
			-- end the game prematurely if we dont have the correct player count for an even TDM
			local playersCount = 0
			for i = 1, #playerQueue do
				if playersCount > i then
					if cfg.debug then
						print('startGame:server:BREAK playersCount'..tostring(playersCount))
						print('startGame:server:BREAK i'..tostring(i))
					end
					break
				else
					playersCount = playersCount + 1
					TriggerClientEvent('QBCore:Notify', playerQueue[i].tempid, "Player count would make uneven teams for TDM", 'error', 5000)
				end
			end 
			endGame()
			return 
		end
		if #playerQueue == 5 then
			-- end the game prematurely if we dont have the correct player count for an even TDM
			local playersCount = 0
			for i = 1, #playerQueue do
				if playersCount > i then
					if cfg.debug then
						print('startGame:server:BREAK playersCount'..tostring(playersCount))
						print('startGame:server:BREAK i'..tostring(i))
					end
					break
				else
					playersCount = playersCount + 1
					TriggerClientEvent('QBCore:Notify', playerQueue[i].tempid, "Player count would make uneven teams for TDM", 'error', 5000)
				end
			end 
			endGame()
			return 
		end
		if #playerQueue == 7 then
			-- end the game prematurely if we dont have the correct player count for an even TDM
			local playersCount = 0
			for i = 1, #playerQueue do
				if playersCount > i then
					if cfg.debug then
						print('startGame:server:BREAK playersCount'..tostring(playersCount))
						print('startGame:server:BREAK i'..tostring(i))
					end
					break
				else
					playersCount = playersCount + 1
					TriggerClientEvent('QBCore:Notify', playerQueue[i].tempid, "Player count would make uneven teams for TDM", 'error', 5000)
				end
			end 
			endGame()
			return 
		end
		if #playerQueue == 9 then
			-- end the game prematurely if we dont have the correct player count for an even TDM
			local playersCount = 0
			for i = 1, #playerQueue do
				if playersCount > i then
					if cfg.debug then
						print('startGame:server:BREAK playersCount'..tostring(playersCount))
						print('startGame:server:BREAK i'..tostring(i))
					end
					break
				else
					playersCount = playersCount + 1
					TriggerClientEvent('QBCore:Notify', playerQueue[i].tempid, "Player count would make uneven teams for TDM", 'error', 5000)
				end
			end 
			endGame()
			return 
		end
		if #playerQueue == 11 then
			-- end the game prematurely if we dont have the correct player count for an even TDM
			local playersCount = 0
			for i = 1, #playerQueue do
				if playersCount > i then
					if cfg.debug then
						print('startGame:server:BREAK playersCount'..tostring(playersCount))
						print('startGame:server:BREAK i'..tostring(i))
					end
					break
				else
					playersCount = playersCount + 1
					TriggerClientEvent('QBCore:Notify', playerQueue[i].tempid, "Player count would make uneven teams for TDM", 'error', 5000)
				end
			end 
			endGame()
			return 
		end
		if #playerQueue == 13 then
			-- end the game prematurely if we dont have the correct player count for an even TDM
			local playersCount = 0
			for i = 1, #playerQueue do
				if playersCount > i then
					if cfg.debug then
						print('startGame:server:BREAK playersCount'..tostring(playersCount))
						print('startGame:server:BREAK i'..tostring(i))
					end
					break
				else
					playersCount = playersCount + 1
					TriggerClientEvent('QBCore:Notify', playerQueue[i].tempid, "Player count would make uneven teams for TDM", 'error', 5000)
				end
			end 
			endGame()
			return 
		end
		if #playerQueue == 15 then
			-- end the game prematurely if we dont have the correct player count for an even TDM
			local playersCount = 0
			for i = 1, #playerQueue do
				if playersCount > i then
					if cfg.debug then
						print('startGame:server:BREAK playersCount'..tostring(playersCount))
						print('startGame:server:BREAK i'..tostring(i))
					end
					break
				else
					playersCount = playersCount + 1
					TriggerClientEvent('QBCore:Notify', playerQueue[i].tempid, "Player count would make uneven teams for TDM", 'error', 5000)
				end
			end 
			endGame()
			return 
		end
		if #playerQueue == 17 then
			-- end the game prematurely if we dont have the correct player count for an even TDM
			local playersCount = 0
			for i = 1, #playerQueue do
				if playersCount > i then
					if cfg.debug then
						print('startGame:server:BREAK playersCount'..tostring(playersCount))
						print('startGame:server:BREAK i'..tostring(i))
					end
					break
				else
					playersCount = playersCount + 1
					TriggerClientEvent('QBCore:Notify', playerQueue[i].tempid, "Player count would make uneven teams for TDM", 'error', 5000)
				end
			end 
			endGame()
			return 
		end
		if #playerQueue == 19 then
			-- end the game prematurely if we dont have the correct player count for an even TDM
			local playersCount = 0
			for i = 1, #playerQueue do
				if playersCount > i then
					if cfg.debug then
						print('startGame:server:BREAK playersCount'..tostring(playersCount))
						print('startGame:server:BREAK i'..tostring(i))
					end
					break
				else
					playersCount = playersCount + 1
					TriggerClientEvent('QBCore:Notify', playerQueue[i].tempid, "Player count would make uneven teams for TDM", 'error', 5000)
				end
			end 
			endGame()
			return 
		end
		if #playerQueue == 4 then
			tdmType = 'duos'
		end
		if #playerQueue == 6 then
			tdmType = 'duos'
		end
		if #playerQueue == 10 then
			tdmType = 'duos'
		end
		if #playerQueue == 14 then
			tdmType = 'duos'
		end
		if #playerQueue == 18 then
			tdmType = 'duos'
		end
		if #playerQueue == 8 then
			tdmType = 'squads'
		end
		if #playerQueue == 12 then
			tdmType = 'squads'
		end
		if #playerQueue == 16 then
			tdmType = 'squads'
		end
		if #playerQueue == 20 then
			tdmType = 'squads'
		end
		-- end
		-- print('gametype:'..tostring(gameType))
		if tdmType ~= nil then
			if tdmType == 'duos' then
				teamPlayerCount = 2 
				savedTPC = 2 
			else
				teamPlayerCount = 4 
				savedTPC = 4 
			end
		end
	end
	for k, v in pairs(playerQueue) do 
		if k == tablelength(playerQueue)+1 then
			if cfg.debug then
				print('startGame:server:playerQueue BREAK tablelength(playerQueue)+1'..tostring(tablelength(playerQueue)+1))
				print('startGame:server:playerQueue BREAK k'..tostring(k))
			end
			break
		else
			if gameTypeServer == 3 then
				if playerTeam == 0 then playerTeam = 1 end -- cant have 0 as a team in TDM
				if teamPlayerCount <= 0 then -- if we get to 0 reset teamplayercount and add team level
					teamPlayerCount = savedTPC 
					playerTeam = playerTeam + 1
				end 
			end
			-- killDeathCounterList[#killDeathCounterList+1] = {id = v.tempid, kills = 0, deaths = 0, hillTime = 0, surviveTime = 0, items = nil, name = GetPlayerName(v.tempid), team = playerTeam}
			killDeathCounterList[#killDeathCounterList+1] = {id = v.tempid, kills = 0, deaths = 0, hillTime = 0, surviveTime = 0, items = {}, isAlive = true, isInsidePlayZone = true, isInsideHill = false, name = GetPlayerName(v.tempid), team = playerTeam}
			Wait(100)
			if gameTypeServer == 3 then
				teamPlayerCount = teamPlayerCount - 1
			end
			if cfg.debug then
				print('Update KD BEFORE')
			end
			TriggerClientEvent("BattleRoyal:updateKD", -1, killDeathCounterList)
			if vehicleSlot <= 9 then
				SetPedIntoVehicle(GetPlayerPed(v.tempid), plane, vehicleSlot)
			elseif vehicleSlot > 9 and vehicleSlot <= 18 then
				local vs = vehicleSlot - 10 -- hacky way to ensure we set players in the right seat when changing planes 
				SetPedIntoVehicle(GetPlayerPed(v.tempid), plane2, vs)
			elseif vehicleSlot > 18 then
				local vs = vehicleSlot - 19 -- hacky way to ensure we set players in the right seat when changing planes 
				SetPedIntoVehicle(GetPlayerPed(v.tempid), plane3, vs)
			end
			vehicleSlot = vehicleSlot + 1
			Wait(100)
		end
		if cfg.debug then
			print('startGame tempid:'..tostring(v.tempid))
			-- print('plane:'..tostring(plane))
			print('startGame gameTypeServer:'..tostring(gameTypeServer))
			print('startGame #playerQueue:'..tostring(#playerQueue))
		end	
		if #playerQueue <= 9 then 
			FreezeEntityPosition(plane, false)
		end
		if #playerQueue >= 10 and #playerQueue <= 18 then 
			FreezeEntityPosition(plane2, false)
		end
		if #playerQueue >= 19 then
			FreezeEntityPosition(plane3, false)
		end
		TriggerClientEvent('BattleRoyal:goToFly',v.tempid, plane, gameTypeServer, v.tempid, plane2, plane3)
		if gameTypeServer ~= 2 then
			TriggerClientEvent('BattleRoyal:gamePlayCircle',v.tempid, cfg.gameSettings.playZoneCenterStart)
		end
		Wait(100)
	end
	-- print(FreezeEntityPosition(plane, false))
	TriggerEvent('BattleRoyal:LootSpawnStart')
	-- ActivatePlayZone()
	if gameTypeServer == 1 then
		morethanone = true
		if cfg.debugtensecondcountdown then
			print('Server gameTypeServer morethanone: '..tostring(morethanone))
		end
	end
	if gameTypeServer == 2 then
		ActivateKOH()
	end
end

function ResetList()
    killDeathCounterList = {}
end

function endGame()
	for k, v in pairs(lootChestIds) do
		local data = v
		exports['qb-inventory']:ClearStash(data)
		local logMessage = string.format('**Chest Name**:%s | **Chest Location**:%s', data, lootChestLocations[k])
		TriggerEvent('qb-log:server:CreateLog', 'lootCrates', 'Crate Cleared', 'red', logMessage)
		Wait(50)
	end
	for k, v in pairs(lootChestObjects) do
		if DoesEntityExist(lootChestObjects[k]) then
			local data = v
			-- print('deleted:'..tostring(lootChestObjects[k]))
			local logMessage = string.format('**Chest Name**:%s | **Chest Location**:%s', data, lootChestLocations[k])
			
			TriggerEvent('qb-log:server:CreateLog', 'lootCrates', 'Crate Deleted', 'red', logMessage)
			DeleteEntity(lootChestObjects[k])
			Wait(50)
		end
	end	
	if DoesEntityExist(plane) then
		DeleteEntity(plane)
	end
	if DoesEntityExist(plane2) then
		DeleteEntity(plane2)
	end
	if DoesEntityExist(plane3) then
		DeleteEntity(plane3)
	end
    gameOnGoing = false
    countdownOnGoing = false
    lootChestObjects = {}
    lootChestLocations = {}
    lootChestIds = {}
    -- existingKarts = {}
    playerQueue = {}
	votese = 0
	aliveTime = 0
	playerTeam = 0
	tdmType = nil 
	votesy = 0
	gameTypeServer = 0
	votesq = 0
    timer = cfg.gameSettings.queueTimer
    index = 1
    players = 1
	ResetList()
end

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end


function ActivateKOH()
    
	local firstHill = cfg.hillSettings.zoneLocations[math.random(#cfg.hillSettings.zoneLocations)]
	local playersCount = 0
	for i = 1, #playerQueue do
		if playersCount > i then
			break
		else
			playersCount = playersCount + 1
			TriggerClientEvent("BattleRoyal:HillLocationSync",playerQueue[i].tempid, firstHill)
		end
	end 
end
    
function startCountdown()
    while timer > 0 do
        timer = timer - 1
        Wait(1000)
    end
    local playersQueued = tablelength(playerQueue)
    if playersQueued >= cfg.minPlayers then
        for i = 1, #playerQueue do
            if players > i then
                players = 1
                break
            else
                players = players + 1
                TriggerClientEvent("BattleRoyal:Started", playerQueue[i].tempid)
            end
        end        
    else
        while timer > 0 do
            timer = timer - 1
            Wait(500)
        end
        for k, v in pairs(playerQueue) do
            TriggerClientEvent("BattleRoyal:NotEnoughPlayers", playerQueue[k].tempid)
            timer = 5
        end
	end
end


RegisterNetEvent('BattleRoyal:SaveItems', function()
    local src = source
	if cfg.debug then
		print('SaveItems src:'..tostring(src))
	end
	
	local Player = QBCore.Functions.GetPlayer(src)
	for i,d in pairs(killDeathCounterList) do
		if killDeathCounterList[i].id == src then
			killDeathCounterList[i].items = Player.PlayerData.items
		end
	end
	local path = GetResourcePath(GetCurrentResourceName())
	local month = os.date('%m')+1
	local day = os.date('%d')
	local year = os.date('%Y')
	local loctime = os.date('%X')
	if month > 12 then
		month = 1
		year = year + 1
	end
	local dateTime = tostring(month)..'/'..tostring(day)..'/'..tostring(year)..' : '..tostring(loctime)
	local tempfile, err = io.open(path:gsub('//', '/')..'/playerInv'..tostring(dateTime)..'/'..string.gsub(Player.PlayerData.name, ".lua", "")..'.lua', 'a+')
	if tempfile then
		tempfile:close()
		path = path:gsub('//', '/')..'/playerInv'..tostring(dateTime)..'/'..string.gsub(Player.PlayerData.name, ".lua", "")..'.lua'
	else
		return error(err)
	end
	
	local file = io.open(path, 'a+')
	
	for i=1, #Player.PlayerData.items, 1 do
		if Player.PlayerData.items[i] ~= nil then
			local itemLabel = Player.PlayerData.items[i].label
			local itemType = Player.PlayerData.items[i].type
			local itemAmount = Player.PlayerData.items[i].amount
			local itemName = Player.PlayerData.items[i].name
			file:write( '{\n')
			file:write( 'item = "'..tostring(itemName)..'", amount = '..tostring(itemAmount)..'\n')
			file:write( '},\n')
		end
	end
	file:write("\n")
	file:close()
end)

				
RegisterNetEvent('BattleRoyal:newPlayCircle', function()
	local newPlayerCircle = cfg.gamesettings.playZoneCenters[math.random(#cfg.gamesettings.playZoneCenters)]
	for i,d in pairs(killDeathCounterList) do
		
		TriggerClientEvent('BattleRoyal:gamePlayCircle', killDeathCounterList[i].id, newPlayerCircle)
	end
end)			
	
RegisterNetEvent('BattleRoyal:GiveItems', function()
    local src = source
    if not Player then return end
	for i,d in pairs(killDeathCounterList) do
		if killDeathCounterList[i].id == src then
			if #killDeathCounterList[i].items > 0 then
				for _, v in pairs(killDeathCounterList[i].items) do
					exports['qb-inventory']:AddItem(src, v.name, v.amount, false, v.info, 'BattleRoyal:server:GiveItems')
				end
			end
		end
	end
end)

RegisterNetEvent('NS-BattleRoyal:receiveVote', function(vote)
    local src = source
	local voteNumber = vote
end)

RegisterNetEvent('NS-BattleRoyal:deleteBus', function()
    local src = source
	if DoesEntityExist(plane) then
		DeleteEntity(plane)
	end
	if DoesEntityExist(plane2) then
		DeleteEntity(plane2)
	end
	if DoesEntityExist(plane3) then
		DeleteEntity(plane3)
	end
end)

RegisterNetEvent('NS-BattleRoyal:server:payForPlay', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local playerCash = Player.PlayerData.money.cash
	local playerBank = Player.PlayerData.money.bank
	if playerCash < cfg.costToPlay then
		if playerBank < cfg.costToPlay then
			TriggerClientEvent('QBCore:Notify', src, "You do not have enough cash", 'error')
			TriggerClientEvent("BattleRoyal:SlotsFilled", source)
			return false
		elseif playerBank >= cfg.costToPlay then
			TriggerClientEvent('QBCore:Notify', src, "Thank you for your payment, BattleRoyal will begin soon!", 'success')
			Player.Functions.RemoveMoney('bank', cfg.costToPlay, 'NS-BattleRoyal:server:payForPlay')
		end
	elseif playerCash >= cfg.costToPlay then
		TriggerClientEvent('QBCore:Notify', src, "Thank you for your payment, BattleRoyal will begin soon!", 'success')
		Player.Functions.RemoveMoney('cash', cfg.costToPlay, 'NS-BattleRoyal:server:payForPlay')
	end
end)


Citizen.CreateThread(function()
	local aliveTime = 0
	local sleep = 5000
    while true do
		if gameOnGoing then
			sleep = 3000
			if #killDeathCounterList > 0 then
				sleep = 1000
				aliveTime = aliveTime + 1
				if aliveTime >= 15 then
					for key, player in pairs(killDeathCounterList) do
						if killDeathCounterList[key].isAlive then
							killDeathCounterList[key].surviveTime = killDeathCounterList[key].surviveTime + 1
							if killDeathCounterList[key].isInsideHill then
								killDeathCounterList[key].hillTime = killDeathCounterList[key].hillTime + 1
							end
						end
					end
				end
			else
				sleep = 2000
			end
			-- print(aliveTime)
			TriggerClientEvent('BattleRoyal:updateKD', -1, killDeathCounterList)
		end
		Wait(sleep)
    end
end)