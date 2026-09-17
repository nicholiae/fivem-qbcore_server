local QBCore = exports['qb-core']:GetCoreObject()
local playerVehiclesList = {}
local playerVehiclesCivIdList = {}
local vehicleList = {}
local playerHousesList = {}
local houseNamePriceList = {}
local houseNameList = {}
local cividlist = {}
local priceVList = {}
local priceHList = {}
local masterList = {}
local cityJobs = {
	'firefighter',
	'police',
	'ambulance',
	'reporter',
	-- 'lawyer',
	'mayor',
	'judge',
	'supreme'
}

local count = 1

local function postTheList()
	for k,v in pairs(masterList) do
	
		local Player = QBCore.Player.GetOfflinePlayer(k)
		if Player == nil then
			Player = QBCore.Player.GetPlayerByCitizenId(k)
		end
		local paid = MySQL.prepare.await('SELECT `PaidTaxes` FROM `playerpaidtaxes` where `citizenid` = ?', { Player.PlayerData.citizenid })
		local check = MySQL.prepare.await('SELECT `citizenid` FROM `playerpaidtaxes` WHERE `citizenid` = ?', { Player.PlayerData.citizenid })
		if not Config.Simulate then
			if check == nil then
				MySQL.prepare('INSERT INTO `playerpaidtaxes`(`citizenid`, `PaidTaxes`, `HasPaidTaxes`, `playerowedtaxes`, `haveWeChecked`, `haveWePosted`) VALUES (?,?,?,?,?,?)', {
					Player.PlayerData.citizenid,
					0,
					0,
					masterList[k],
					0,
					1
				})
			else
				MySQL.prepare('UPDATE `playerpaidtaxes` SET `playerowedtaxes` = ? WHERE `citizenid` = ?',{masterList[k], k})
				MySQL.prepare('UPDATE `playerpaidtaxes` SET `HasPaidTaxes` = 0 WHERE `citizenid` = ?',{k})
				MySQL.prepare('UPDATE `playerpaidtaxes` SET `haveWePosted` = 1 WHERE `citizenid` = ?',{k})
				MySQL.prepare('UPDATE `playerpaidtaxes` SET `haveWeChecked` = 0 WHERE `citizenid` = ?',{k})
			end
			TriggerEvent('qb-log:server:CreateLog', 'taxes', 'Taxes Posted For: '..Player.PlayerData.name, 'red', 
				'👨🏻Player: '..tostring(Player.PlayerData.name)..
				'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
				'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
				'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
				'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
				'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
				'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
				'\n💰PrePaid Taxes for the Month of '..os.date('%B')..' : '..tostring(paid)..
				'\n💰Total Taxes for the Month of '..os.date('%B')..' : '..tostring(masterList[k])..
				'\n⏰Posted on :'..os.date('%c')
			)
		else
			TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'Taxes Posted For: '..Player.PlayerData.name, 'red', 
				'👨🏻Player: '..tostring(Player.PlayerData.name)..
				'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
				'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
				'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
				'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
				'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
				'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
				'\n💰PrePaid Taxes for the Month of '..os.date('%B')..' : '..tostring(paid)..
				'\n💰Total Taxes for the Month of '..os.date('%B')..' : '..tostring(masterList[k])..
				'\n⏰Posted on :'..os.date('%c')
			)
		end
		Wait(500)
	end
end

local function postTheListSimulated(civId)
	local k = civId
	local Player = QBCore.Player.GetOfflinePlayer(k)
	if Player == nil then
		Player = QBCore.Player.GetPlayerByCitizenId(k)
	end
	local paid = MySQL.prepare.await('SELECT `PaidTaxes` FROM `playerpaidtaxes` where `citizenid` = ?', { Player.PlayerData.citizenid })
	local check = MySQL.prepare.await('SELECT `citizenid` FROM `playerpaidtaxes` WHERE `citizenid` = ?', { Player.PlayerData.citizenid })
	
	TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'Taxes Posted For: '..Player.PlayerData.name, 'red', 
		'👨🏻Player: '..tostring(Player.PlayerData.name)..
		'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
		'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
		'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
		'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
		'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
		'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
		'\n💰PrePaid Taxes for the Month of '..os.date('%B')..' : '..tostring(paid)..
		'\n💰Total Taxes for the Month of '..os.date('%B')..' : '..tostring(masterList[k])..
		'\n⏰Posted on :'..os.date('%c')
	)
end

local function GetBusinessOwners()
	for k,v in pairs(masterList) do
		jobExempt = false
		local Player = QBCore.Player.GetOfflinePlayer(k)
		if Player == nil then
			Player = QBCore.Player.GetPlayerByCitizenId(k)
		end
		-- myQuery = MySQL.query.await('SELECT `job` FROM `players` WHERE `citizenid`=?',{k})
		-- local job1 = json.decode(myQuery[1].job)
		local job1 = Player.PlayerData.job
		local job1name = job1.name
		local job1isboss = job1.isboss
		for _, job in pairs(cityJobs) do
			if job1name == job and job1isboss then
				jobExempt = true
				masterList[k] = masterList[k] - 1000000
			end
		end
		if job1isboss and not jobExempt then
			masterList[k] = masterList[k] + 500000
		end
	end
	for k,v in pairs(masterList) do
		jobExempt = false
		myQuery2 = MySQL.query.await('SELECT `job_two` FROM `players` WHERE `citizenid`=?',{k})
		local job2 = json.decode(myQuery2[1].job_two)
		if job2 ~= nil then
			local job2name = job2.name
			local job2isboss = job2.isboss
			for _, job in pairs(cityJobs) do
				if job2name == job and job2isboss then
				
					jobExempt = true
					masterList[k] = masterList[k] - 1000000
					
				end
			end
			if job2isboss and not jobExempt then
				masterList[k] = masterList[k] + 500000
			end
		end
	end
end

local function GetAllOwnedEntities()
	playerVehiclesCivIdList = MySQL.query.await('SELECT `citizenid` FROM `player_vehicles`')
	playerHousesCivIdList = MySQL.query.await('SELECT `citizenid` FROM `player_houses`')
	houseNameList = MySQL.query.await('SELECT `name` FROM `houselocations`')
	houseNamePriceList = MySQL.query.await('SELECT `price` FROM `houselocations`')
	vehicleList = QBCore.Shared.Vehicles
	
	-- get civids from players
	cividlist = MySQL.query.await('SELECT `citizenid` FROM `players`') 
	-- use civids list to get players Vehicles
	for k,v in pairs(cividlist) do
		
		for key,val in pairs(v) do
			--val is civid
			playerVehiclesList = MySQL.query.await('SELECT `vehicle` FROM `player_vehicles` WHERE `citizenid`=?',{val})
			
			priceVList = {}
			priceHList = {}
			count = 1
			for ke,va in pairs(playerVehiclesList) do
				-- match vehicles to prices
				for _, name in pairs(va) do
					--name is name of vehicle owned
					-- print(name)
					if not vehicleList[name] then
						local Player = QBCore.Functions.GetPlayerByCitizenId(val)
						TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'Unknown Vehicle: '..name, 'red', 
							'👨🏻Player: '..tostring(Player.PlayerData.name)..
							'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
							'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
							'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
							'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
							'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
							'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality),
							true -- tag everyone in discord to notify of broken vehicle name
							
						)
						-- print(Player.PlayerData.citizenid)
						-- print(name)
					else
						priceOfVehicle = vehicleList[name].price
						priceVList[count] = {['civid'] = val, ['vehPrice'] = priceOfVehicle}
						count = count + 1
					end
				end
			end
			-- use civids list to get players houses
			count = 1
 			playerHousesList = MySQL.query.await('SELECT `house` FROM `player_houses` WHERE `citizenid`=?',{val})
			
			for ke,va in pairs(playerHousesList) do
				for _, name in pairs(va) do
					--name is name of house owned
					priceOfHouselist = MySQL.query.await('SELECT `price` FROM `houselocations` WHERE `name`=?',{name})
					for x,y in pairs(priceOfHouselist) do
					-- match houses to prices
						for xs,price in pairs(y) do
							priceOfHouse = price
							priceHList[count] = {['civid'] = val, ['houPrice'] = priceOfHouse}
							count = count + 1
						end
					end
				end
			end
			count = 1
			totalVPrice = 0
			-- calculate taxes on all vehicles and houses
			for i=1,#priceVList,1 do
				
				totalVPrice = totalVPrice + priceVList[count]['vehPrice']
				count = count + 1
				
			end
			count = 1
			totalHPrice = 0
			for i=1,#priceHList,1 do
				
				totalHPrice = totalHPrice + priceHList[count]['houPrice']
				count = count + 1
				
			end
			local totalTaxes = math.floor((totalHPrice+totalVPrice)*0.07)
			masterList[val] = totalTaxes
		end
	end
	GetBusinessOwners()
end

local function GetBusinessOwnersbreakdown(civId, totalTaxes)
	local Player = QBCore.Player.GetOfflinePlayer(civId)
	if Player == nil then
		Player = QBCore.Player.GetPlayerByCitizenId(k)
	end
	jobExempt = false
	-- myQuery = MySQL.query.await('SELECT `job` FROM `players` WHERE `citizenid`=?',{civId})
	-- local job1 = json.decode(myQuery[1].job)
	local job1 = Player.PlayerData.job
	local job1name = job1.name
	local job1isboss = job1.isboss
	for _, job in pairs(cityJobs) do
		if job1name == job and job1isboss then
			jobExempt = true
			totalTaxes = totalTaxes - 1000000	
			TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'Job Tax breakDown For: '..Player.PlayerData.name, 'yellow', 
				'👨🏻Player: '..tostring(Player.PlayerData.name)..
				'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
				'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
				'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
				'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
				'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
				'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
				'\n💡 job1: '..tostring(job1.name)..
				'\n💡 job1isboss: '..tostring(job1isboss)..
				'\n💡 jobExempt: '..tostring(jobExempt)..
				'\n💰 Taxes Additional: '..tostring(-1000000)..
				'\n💰 Taxes Total: '..tostring(totalTaxes)
				
			)
		end
	end
	if job1isboss and not jobExempt then
		totalTaxes = totalTaxes + 500000	
		TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'Job Tax breakDown For: '..Player.PlayerData.name, 'yellow', 
			'👨🏻Player: '..tostring(Player.PlayerData.name)..
			'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
			'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
			'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
			'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
			'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
			'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
			'\n💡 job1: '..tostring(job1.name)..
			'\n💡 job1isboss: '..tostring(job1isboss)..
			'\n💡 jobExempt: '..tostring(jobExempt)..
			'\n💰 Taxes Additional: '..tostring(500000)..
			'\n💰 Taxes Total: '..tostring(totalTaxes)
		)
	end
	jobExempt = false
	myQuery2 = MySQL.query.await('SELECT `job_two` FROM `players` WHERE `citizenid`=?',{civId})
	local job2 = json.decode(myQuery2[1].job_two)
	if job2 ~= nil then
		local job2name = job2.name
		local job2isboss = job2.isboss
		for _, job in pairs(cityJobs) do
			if job2name == job and job2isboss then
			
				jobExempt = true
				totalTaxes = totalTaxes - 1000000
						
				TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'Job2 Tax breakDown For: '..Player.PlayerData.name, 'yellow', 
					'👨🏻Player: '..tostring(Player.PlayerData.name)..
					'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
					'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
					'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
					'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
					'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
					'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
					'\n💡 Job2: '..tostring(job2.name)..
					'\n💡 job2isboss: '..tostring(job2isboss)..
					'\n💡 job2Exempt: '..tostring(jobExempt)..
					'\n💰 Taxes Additional: '..tostring(-1000000)..
					'\n💰 Taxes Total: '..tostring(totalTaxes)
				)
					-- '\n🏘Repod House: '..tostring(name)
					-- '\n💡Repod Job1: '..tostring(job1)..
					-- '\n💡Repod Job2: '..tostring(job2.name)
			end
		end
		if job2isboss and not jobExempt then
			totalTaxes = totalTaxes + 500000
			TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'Job2 Tax breakDown For: '..Player.PlayerData.name, 'yellow', 
				'👨🏻Player: '..tostring(Player.PlayerData.name)..
				'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
				'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
				'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
				'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
				'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
				'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
				'\n💡 Job2: '..tostring(job2.name)..
				'\n💡 job2isboss: '..tostring(job2isboss)..
				'\n💡 job2Exempt: '..tostring(jobExempt)..
				'\n💰 Taxes Additional: '..tostring(500000)..
				'\n💰 Taxes Total: '..tostring(totalTaxes)
			)
		end
	end
	TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'Tax breakDown Total For: '..Player.PlayerData.name, 'green', 
		'👨🏻Player: '..tostring(Player.PlayerData.name)..
		'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
		'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
		'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
		'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
		'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
		'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
		'\n💰 Taxes Total: '..tostring(totalTaxes)
	)
end

local function GetBusinessOwnersRepost(civId, totalTaxes)
	local Player = QBCore.Player.GetOfflinePlayer(civId)
	if Player == nil then
		Player = QBCore.Player.GetPlayerByCitizenId(k)
	end
	jobExempt = false
	-- myQuery = MySQL.query.await('SELECT `job` FROM `players` WHERE `citizenid`=?',{civId})
	-- local job1 = json.decode(myQuery[1].job)
	local job1 = Player.PlayerData.job
	local job1name = job1.name
	local job1isboss = job1.isboss
	for _, job in pairs(cityJobs) do
		if job1name == job and job1isboss then
			jobExempt = true
			totalTaxes = totalTaxes - 1000000	
			TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'Job Tax Repost For: '..Player.PlayerData.name, 'yellow', 
				'👨🏻Player: '..tostring(Player.PlayerData.name)..
				'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
				'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
				'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
				'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
				'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
				'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
				'\n💡 job1: '..tostring(job1.name)..
				'\n💡 job1isboss: '..tostring(job1isboss)..
				'\n💡 jobExempt: '..tostring(jobExempt)..
				'\n💰 Taxes Additional: '..tostring(-1000000)..
				'\n💰 Taxes Total: '..tostring(totalTaxes)
				
			)
		end
	end
	if job1isboss and not jobExempt then
		totalTaxes = totalTaxes + 500000	
		TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'Job Tax Repost For: '..Player.PlayerData.name, 'yellow', 
			'👨🏻Player: '..tostring(Player.PlayerData.name)..
			'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
			'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
			'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
			'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
			'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
			'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
			'\n💡 job1: '..tostring(job1.name)..
			'\n💡 job1isboss: '..tostring(job1isboss)..
			'\n💡 jobExempt: '..tostring(jobExempt)..
			'\n💰 Taxes Additional: '..tostring(500000)..
			'\n💰 Taxes Total: '..tostring(totalTaxes)
		)
	end
	jobExempt = false
	myQuery2 = MySQL.query.await('SELECT `job_two` FROM `players` WHERE `citizenid`=?',{civId})
	local job2 = json.decode(myQuery2[1].job_two)
	if job2 ~= nil then
		local job2name = job2.name
		local job2isboss = job2.isboss
		for _, job in pairs(cityJobs) do
			if job2name == job and job2isboss then
			
				jobExempt = true
				totalTaxes = totalTaxes - 1000000
						
				TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'Job2 Tax Repost For: '..Player.PlayerData.name, 'yellow', 
					'👨🏻Player: '..tostring(Player.PlayerData.name)..
					'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
					'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
					'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
					'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
					'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
					'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
					'\n💡 Job2: '..tostring(job2.name)..
					'\n💡 job2isboss: '..tostring(job2isboss)..
					'\n💡 job2Exempt: '..tostring(jobExempt)..
					'\n💰 Taxes Additional: '..tostring(-1000000)..
					'\n💰 Taxes Total: '..tostring(totalTaxes)
				)
					-- '\n🏘Repod House: '..tostring(name)
					-- '\n💡Repod Job1: '..tostring(job1)..
					-- '\n💡Repod Job2: '..tostring(job2.name)
			end
		end
		if job2isboss and not jobExempt then
			totalTaxes = totalTaxes + 500000
			TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'Job2 Tax Repost For: '..Player.PlayerData.name, 'yellow', 
				'👨🏻Player: '..tostring(Player.PlayerData.name)..
				'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
				'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
				'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
				'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
				'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
				'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
				'\n💡 Job2: '..tostring(job2.name)..
				'\n💡 job2isboss: '..tostring(job2isboss)..
				'\n💡 job2Exempt: '..tostring(jobExempt)..
				'\n💰 Taxes Additional: '..tostring(500000)..
				'\n💰 Taxes Total: '..tostring(totalTaxes)
			)
		end
	end
	local paid = MySQL.prepare.await('SELECT `PaidTaxes` FROM `playerpaidtaxes` where `citizenid` = ?', { Player.PlayerData.citizenid })
	local check = MySQL.prepare.await('SELECT `citizenid` FROM `playerpaidtaxes` WHERE `citizenid` = ?', { Player.PlayerData.citizenid })
	if check == nil then
		MySQL.prepare('INSERT INTO `playerpaidtaxes`(`citizenid`, `PaidTaxes`, `HasPaidTaxes`, `playerowedtaxes`, `haveWeChecked`, `haveWePosted`) VALUES (?,?,?,?,?,?)', {
			Player.PlayerData.citizenid,
			0,
			0,
			totalTaxes,
			0,
			1
		})
	else
		MySQL.prepare('UPDATE `playerpaidtaxes` SET `playerowedtaxes` = ? WHERE `citizenid` = ?',{totalTaxes, civId})
		MySQL.prepare('UPDATE `playerpaidtaxes` SET `HasPaidTaxes` = 0 WHERE `citizenid` = ?',{civId})
		MySQL.prepare('UPDATE `playerpaidtaxes` SET `haveWePosted` = 1 WHERE `citizenid` = ?',{civId})
		MySQL.prepare('UPDATE `playerpaidtaxes` SET `haveWeChecked` = 0 WHERE `citizenid` = ?',{civId})
	end
	TriggerEvent('qb-log:server:CreateLog', 'taxes', 'Taxes RePosted For: '..Player.PlayerData.name, 'pink', 
		'👨🏻Player: '..tostring(Player.PlayerData.name)..
		'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
		'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
		'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
		'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
		'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
		'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
		'\n💰PrePaid Taxes for the Month of '..os.date('%B')..' : '..tostring(paid)..
		'\n💰Total Taxes for the Month of '..os.date('%B')..' : '..tostring(totalTaxes)..
		'\n⏰Posted on :'..os.date('%c')
	)
end

local function GetAllOwnedEntitiesRepost(civId)
	local cid = civId
	local Player = QBCore.Player.GetOfflinePlayer(civId)
	if Player == nil then
		Player = QBCore.Player.GetPlayerByCitizenId(k)
	end
	vehicleList = QBCore.Shared.Vehicles
	playerVehiclesList = MySQL.query.await('SELECT `vehicle` FROM `player_vehicles` WHERE `citizenid`=?',{cid})
	priceVList = {}
	priceHList = {}
	count = 1
	for ke,va in pairs(playerVehiclesList) do
		-- match vehicles to prices
		for _, name in pairs(va) do
			--name is name of vehicle owned
			priceOfVehicle = vehicleList[name].price
			priceVList[count] = {['civid'] = cid, ['vehPrice'] = priceOfVehicle}
			count = count + 1
					
			TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'Vehicle Tax Repost For: '..Player.PlayerData.name, 'yellow', 
				'👨🏻Player: '..tostring(Player.PlayerData.name)..
				'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
				'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
				'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
				'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
				'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
				'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
				'\n🚙Vehicle Name: '..tostring(name)..
				'\n💰Vehicle Price: '..tostring(priceOfVehicle)
			)
				-- '\n🏘Repod House: '..tostring(name)
				-- '\n💡Repod Job1: '..tostring(job1)..
				-- '\n💡Repod Job2: '..tostring(job2.name)
		end
	end
	-- use civids list to get players houses
	count = 1
	playerHousesList = MySQL.query.await('SELECT `house` FROM `player_houses` WHERE `citizenid`=?',{cid})
	
	for ke,va in pairs(playerHousesList) do
		for _, name in pairs(va) do
			--name is name of house owned
			priceOfHouselist = MySQL.query.await('SELECT `price` FROM `houselocations` WHERE `name`=?',{name})
			for x,y in pairs(priceOfHouselist) do
			-- match houses to prices
				for xs,price in pairs(y) do
					priceOfHouse = price
					priceHList[count] = {['civid'] = cid, ['houPrice'] = priceOfHouse}
					count = count + 1
					TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'House Tax Repost For: '..Player.PlayerData.name, 'yellow', 
						'👨🏻Player: '..tostring(Player.PlayerData.name)..
						'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
						'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
						'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
						'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
						'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
						'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
						'\n🏘House Name: '..tostring(name)..
						'\n💰House Price: '..tostring(priceOfHouse)
					)
						-- '\n💡Repod Job1: '..tostring(job1)..
						-- '\n💡Repod Job2: '..tostring(job2.name)
				end
			end
		end
	end
	count = 1
	totalVPrice = 0
	-- calculate taxes on all vehicles and houses
	for i=1,#priceVList,1 do
		
		totalVPrice = totalVPrice + priceVList[count]['vehPrice']
		count = count + 1
		
	end
	count = 1
	totalHPrice = 0
	for i=1,#priceHList,1 do
		
		totalHPrice = totalHPrice + priceHList[count]['houPrice']
		count = count + 1
		
	end
	local totalTaxes = math.floor((totalHPrice+totalVPrice)*0.07)

	TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'Total Vehicle Tax Repost For: '..Player.PlayerData.name, 'yellow', 
		'👨🏻Player: '..tostring(Player.PlayerData.name)..
		'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
		'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
		'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
		'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
		'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
		'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
		'\n💰Vehicle Taxes: '..tostring(totalTaxes)
	)
	GetBusinessOwnersRepost(civId, totalTaxes)

end


local function GetAllOwnedEntitiesbreakdown(civId)
	local cid = civId
	local Player = QBCore.Player.GetOfflinePlayer(civId)
	if Player == nil then
		Player = QBCore.Player.GetPlayerByCitizenId(k)
	end
	vehicleList = QBCore.Shared.Vehicles
	playerVehiclesList = MySQL.query.await('SELECT `vehicle` FROM `player_vehicles` WHERE `citizenid`=?',{cid})
	priceVList = {}
	priceHList = {}
	count = 1
	for ke,va in pairs(playerVehiclesList) do
		-- match vehicles to prices
		for _, name in pairs(va) do
			--name is name of vehicle owned
			priceOfVehicle = vehicleList[name].price
			priceVList[count] = {['civid'] = cid, ['vehPrice'] = priceOfVehicle}
			count = count + 1
					
			TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'Vehicle Tax breakDown For: '..Player.PlayerData.name, 'yellow', 
				'👨🏻Player: '..tostring(Player.PlayerData.name)..
				'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
				'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
				'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
				'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
				'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
				'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
				'\n🚙Vehicle Name: '..tostring(name)..
				'\n💰Vehicle Price: '..tostring(priceOfVehicle)
			)
				-- '\n🏘Repod House: '..tostring(name)
				-- '\n💡Repod Job1: '..tostring(job1)..
				-- '\n💡Repod Job2: '..tostring(job2.name)
		end
	end
	-- use civids list to get players houses
	count = 1
	playerHousesList = MySQL.query.await('SELECT `house` FROM `player_houses` WHERE `citizenid`=?',{cid})
	
	for ke,va in pairs(playerHousesList) do
		for _, name in pairs(va) do
			--name is name of house owned
			priceOfHouselist = MySQL.query.await('SELECT `price` FROM `houselocations` WHERE `name`=?',{name})
			for x,y in pairs(priceOfHouselist) do
			-- match houses to prices
				for xs,price in pairs(y) do
					priceOfHouse = price
					priceHList[count] = {['civid'] = cid, ['houPrice'] = priceOfHouse}
					count = count + 1
					TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'House Tax breakDown For: '..Player.PlayerData.name, 'yellow', 
						'👨🏻Player: '..tostring(Player.PlayerData.name)..
						'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
						'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
						'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
						'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
						'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
						'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
						'\n🏘House Name: '..tostring(name)..
						'\n💰House Price: '..tostring(priceOfHouse)
					)
						-- '\n💡Repod Job1: '..tostring(job1)..
						-- '\n💡Repod Job2: '..tostring(job2.name)
				end
			end
		end
	end
	count = 1
	totalVPrice = 0
	-- calculate taxes on all vehicles and houses
	for i=1,#priceVList,1 do
		
		totalVPrice = totalVPrice + priceVList[count]['vehPrice']
		count = count + 1
		
	end
	count = 1
	totalHPrice = 0
	for i=1,#priceHList,1 do
		
		totalHPrice = totalHPrice + priceHList[count]['houPrice']
		count = count + 1
		
	end
	local totalTaxes = math.floor((totalHPrice+totalVPrice)*0.07)

	TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'Total Vehicle Tax breakDown For: '..Player.PlayerData.name, 'yellow', 
		'👨🏻Player: '..tostring(Player.PlayerData.name)..
		'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
		'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
		'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
		'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
		'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
		'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
		'\n💰Vehicle Taxes: '..tostring(totalTaxes)
	)
	GetBusinessOwnersbreakdown(civId, totalTaxes)

end

local function GetPlayerPayments() -- deprecated
	for k,v in pairs(masterList) do
		-- print(k)
		local PlayerPay = MySQL.prepare.await('SELECT `PaidTaxes` FROM `playerpaidtaxes` where `citizenid` = ?', { k })
		if PlayerPay then
			masterList[k] = masterList[k] - PlayerPay
		end
	end
end

local function GetPlayerBank() -- deprecated
	for k,v in pairs(masterList) do
		-- print(k)
	-- local PlayerData = MySQL.prepare.await('SELECT * FROM `players` where `citizenid` = ?', { k })
		local Player = QBCore.Player.GetOfflinePlayer(k)
		if Player == nil then
			Player = QBCore.Player.GetPlayerByCitizenId(k)
		end
		if Player.PlayerData.money.bank >= masterList[k] then
			chargeAndReset(k, Player)
		else
			startRepo(k, Player)
		end
	end
end

local function chargeAndReset(source)

	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local haveYouPaid = MySQL.prepare.await('SELECT `HasPaidTaxes` FROM `playerpaidtaxes` where `citizenid` = ?', { Player.PlayerData.citizenid })
	local statement_type = nil
	if haveYouPaid == 0 then
	
		local owed = MySQL.prepare.await('SELECT `playerowedtaxes` FROM `playerpaidtaxes` where `citizenid` = ?', { Player.PlayerData.citizenid })
		local paid = MySQL.prepare.await('SELECT `PaidTaxes` FROM `playerpaidtaxes` where `citizenid` = ?', { Player.PlayerData.citizenid })
		local taxes = owed - paid
		if taxes < 0 then
			taxes = taxes * -1 -- turn to a positive number so we can pay them
			Player.Functions.AddMoney('bank', taxes, 'taxes')
			paidHow = 'paid untoward'
			statement_type = 'deposit'
			exports['qb-banking']:RemoveMoney('mayor', taxes, 'Payout Taxes')
			
		else
			Player.Functions.RemoveMoney('bank', taxes, 'taxes')
			statement_type = 'withdraw'
			paidHow = 'paid'
			exports['qb-banking']:AddMoney('mayor', taxes, 'Taxes')
			
		end
		-- CreateBankStatement(playerId, account, amount, reason, statementType, accountType)
		exports['qb-banking']:CreateBankStatement(src, 'checking', taxes, 'Taxes', statement_type, 'player')
		
		MySQL.prepare('UPDATE `playerpaidtaxes` SET `HasPaidTaxes` = 1 WHERE `citizenid` = ?',{Player.PlayerData.citizenid})
		MySQL.prepare('UPDATE `playerpaidtaxes` SET `PaidTaxes` = 0 WHERE `citizenid` = ?',{Player.PlayerData.citizenid})
		MySQL.prepare('UPDATE `playerpaidtaxes` SET `playerowedtaxes` = 0 WHERE `citizenid` = ?',{Player.PlayerData.citizenid})
		
		
		TriggerEvent('qb-log:server:CreateLog', 'taxes', 'Taxes Paid For: '..Player.PlayerData.name, 'green', 
			'👨🏻Player: '..tostring(Player.PlayerData.name)..
			'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
			'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
			'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
			'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
			'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
			'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
			'\n💰PrePaid Taxes for the Month of '..os.date('%B')..' : '..tostring(paid)..
			'\n💰Owed Taxes for the Month of '..os.date('%B')..' : '..tostring(owed)..
			'\n💰Total Taxes '..tostring(paidHow)..' for the Month of '..os.date('%B')..' : '..tostring(taxes)..
			'\n⏰Paid on :'..os.date('%c')
			
		)
	else
		TriggerClientEvent('QBCore:Notify', src, 'You have already paid your taxes for this month.')
	end	
	
end

local function startRepo(k, Player)
	local CivID = k
	local vehicleCount = 0
	local houseCount = 0
	local jobCount = 0
	if Player then 
		local Player = Player
	end
	local VehiclesList = MySQL.query.await('SELECT `vehicle` FROM `player_vehicles` WHERE `citizenid`=?',{CivID})
	for _,y in pairs(VehiclesList) do
		for k,name in pairs(y) do
			MySQL.prepare('DELETE FROM `player_vehicles` WHERE `vehicle` = ? AND `citizenid` = ?', {name,CivID}) -- job = json.encode(PlayerData.job),
			vehicleCount = vehicleCount + 1
			
			TriggerEvent('qb-log:server:CreateLog', 'repossession', 'Vehicle Repossession of '..Player.PlayerData.name, 'pink', 
				'👨🏻Player: '..tostring(Player.PlayerData.name)..
				'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
				'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
				'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
				'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
				'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
				'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
				'\n🚙Repod Vehicle: '..tostring(name)
			)
		end
	end
	local HousesList = MySQL.query.await('SELECT `house` FROM `player_houses` WHERE `citizenid`=?',{CivID})
	for _,y in pairs(HousesList) do
		for k,name in pairs(y) do
			-- remove all owned houses
			houseCount = houseCount + 1
			
			MySQL.prepare('DELETE FROM `player_houses` WHERE `house` = ? AND `citizenid` = ?', {name,CivID}) -- job = json.encode(PlayerData.job),
			
			MySQL.prepare('UPDATE `houselocations` SET owned = 0 WHERE name = ?', {name}) -- job = json.encode(PlayerData.job),
			
			TriggerEvent('qb-log:server:CreateLog', 'repossession', 'House Repossession of '..Player.PlayerData.name, 'pink', 
				'👨🏻Player: '..tostring(Player.PlayerData.name)..
				'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
				'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
				'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
				'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
				'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
				'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
				'\n🏘Repod House: '..tostring(name)
			)
		end
	end  
	local CivID = Player.PlayerData.citizenid
	local job1 = Player.PlayerData.job.name
	local job2Query = MySQL.query.await('SELECT `job_two` FROM `players` WHERE `citizenid`=?',{CivID})
	local job2 = json.decode(job2Query[1].job_two)
	Wait(300)
	if Player.Functions.SetJob('unemployed', '0') then
		if Player.Offline then
            QBCore.Player.SaveOffline(Player.PlayerData)
        else
            QBCore.Player.Save(Player.PlayerData.source)
        end
		
        MySQL.prepare('UPDATE players SET job_two = job WHERE citizenid = ?', {CivID}) -- job = json.encode(PlayerData.job),
	end 
	TriggerEvent('qb-log:server:CreateLog', 'repossession', 'Job Repossession of '..Player.PlayerData.name, 'pink', 
		'👨🏻Player: '..tostring(Player.PlayerData.name)..
		'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
		'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
		'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
		'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
		'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
		'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
		'\n💡Repod Job1: '..tostring(job1)..
		'\n💡Repod Job2: '..tostring(job2.name)
	)
	if houseCount == 0 and vehicleCount == 0 then
		if job1 == 'unemployed' and job2.name == 'unemployed' then
			MySQL.prepare('DELETE FROM `players` WHERE `citizenid` = ?', {CivID}) -- delete character out of database
			TriggerEvent('qb-log:server:CreateLog', 'repossession', 'Deletion of '..Player.PlayerData.name, 'red', 
				'👨🏻Player: '..tostring(Player.PlayerData.name)..
				'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
				'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
				'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
				'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
				'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
				'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
				'\n🏘Repod Houses: '..tostring(houseCount)..
				'\n🚙Repod Vehicles: '..tostring(vehicleCount)..
				'\n💡Repod Job1: '..tostring(job1)..		
				'\n💡Repod Job2: '..tostring(job2.name),
				true -- tag everyone in discord to notify
			)	
		end
	end
end

local function startSimulatedRepo(k, Player)
	local CivID = k
	local vehicleCount = 0
	local houseCount = 0
	local jobCount = 0
	if Player then 
		local Player = Player
	end
	local VehiclesList = MySQL.query.await('SELECT `vehicle` FROM `player_vehicles` WHERE `citizenid`=?',{CivID})
	for _,y in pairs(VehiclesList) do
		for k,name in pairs(y) do
			-- MySQL.prepare('DELETE FROM `player_vehicles` WHERE `vehicle` = ? AND `citizenid` = ?', {name,CivID}) -- job = json.encode(PlayerData.job),
			vehicleCount = vehicleCount + 1
			TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'Vehicle Repossession of '..Player.PlayerData.name, 'pink', 
				'👨🏻Player: '..tostring(Player.PlayerData.name)..
				'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
				'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
				'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
				'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
				'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
				'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
				'\n🚙Repod Vehicle: '..tostring(name)
			)
		end
	end
	local HousesList = MySQL.query.await('SELECT `house` FROM `player_houses` WHERE `citizenid`=?',{CivID})
	for _,y in pairs(HousesList) do
		for k,name in pairs(y) do
			houseCount = houseCount + 1
						
			-- remove all owned houses
			
			-- MySQL.prepare('DELETE FROM `player_houses` WHERE `house` = ? AND `citizenid` = ?', {name,CivID}) -- job = json.encode(PlayerData.job),
			
			-- MySQL.prepare('UPDATE `houselocations` SET owned = 0 WHERE name = ?', {name}) -- job = json.encode(PlayerData.job),
			
			TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'House Repossession of '..Player.PlayerData.name, 'pink', 
				'👨🏻Player: '..tostring(Player.PlayerData.name)..
				'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
				'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
				'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
				'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
				'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
				'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
				'\n🏘Repod House: '..tostring(name),
				true -- tag everyone in discord to notify
			)
					
		end
	end  
	local CivID = Player.PlayerData.citizenid
	local job1 = Player.PlayerData.job.name
	local job2Query = MySQL.query.await('SELECT `job_two` FROM `players` WHERE `citizenid`=?',{CivID})
	local job2 = json.decode(job2Query[1].job_two)
	-- if Player.Functions.SetJob('unemployed', '0') then
		-- if Player.Offline then
            -- QBCore.Player.SaveOffline(Player.PlayerData)
        -- else
            -- QBCore.Player.Save(Player.PlayerData.source)
        -- end
		-- local job2 =  MySQL.query.await('SELECT `job_two` FROM `players` WHERE `citizenid`=?',{CivID})
		-- Wait(1000)
        -- MySQL.prepare('UPDATE players SET job_two = job WHERE citizenid = ?', {CivID}) -- job = json.encode(PlayerData.job),
	-- end 
	TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'Job Repossession of '..Player.PlayerData.name, 'pink', 
		'👨🏻Player: '..tostring(Player.PlayerData.name)..
		'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
		'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
		'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
		'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
		'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
		'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
		'\n💡Repod Job1: '..tostring(job1)..		
		'\n💡Repod Job2: '..tostring(job2.name)

	)
	if houseCount == 0 and vehicleCount == 0 then
		if job1 == 'unemployed' and job2.name == 'unemployed' then
			TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'Deletion Simulated of '..Player.PlayerData.name, 'red', 
				'👨🏻Player: '..tostring(Player.PlayerData.name)..
				'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
				'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
				'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
				'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
				'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
				'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
				'\n🏘Repod Houses: '..tostring(houseCount)..
				'\n🚙Repod Vehicles: '..tostring(vehicleCount)..
				'\n💡Repod Job1: '..tostring(job1)..		
				'\n💡Repod Job2: '..tostring(job2.name),
				true -- tag everyone in discord to notify
			)	
		end
	end
end

local function postTheRepoList(k, Player)
	local CivID = k
	local vehicleCount = 0
	local houseCount = 0
	local jobCount = 0
	if Player then 
		local Player = Player
	end
	local VehiclesList = MySQL.query.await('SELECT `vehicle` FROM `player_vehicles` WHERE `citizenid`=?',{CivID})
	for _,y in pairs(VehiclesList) do
		for k,name in pairs(y) do
			vehicleCount = vehicleCount + 1
		end
	end
	local HousesList = MySQL.query.await('SELECT `house` FROM `player_houses` WHERE `citizenid`=?',{CivID})
	for _,y in pairs(HousesList) do
		for k,name in pairs(y) do
			houseCount = houseCount + 1
		end
	end  
	local CivID = Player.PlayerData.citizenid
	local job1 = Player.PlayerData.job.name
	local job2Query = MySQL.query.await('SELECT `job_two` FROM `players` WHERE `citizenid`=?',{CivID})
	local job2 = json.decode(job2Query[1].job_two)
	
	TriggerEvent('qb-log:server:CreateTaxLog', 'repossession', 'Repossession Simulation count of '..Player.PlayerData.name, 'blue', 
		'👨🏻Player: '..tostring(Player.PlayerData.name)..
		'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
		'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
		'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
		'\n🏘Repod Houses: '..tostring(houseCount)..
		'\n🚙Repod Vehicles: '..tostring(vehicleCount)..
		'\n💡Repod Job: '..tostring(job1)..		
		'\n💡Repod Job2: '..tostring(job2.name),
		true, -- tag nicholiae in discord to notify
		nil, --image
		(QBCore.Functions.GetIdentifier(Player.PlayerData.source, 'discord'):gsub("discord:", "") or "unknown") -- hopefully discord name
	)
	if houseCount == 0 and vehicleCount == 0 then
		if job1 == 'unemployed' and job2.name == 'unemployed' then
			TriggerEvent('qb-log:server:CreateTaxLog', 'repossession', 'Deletion Simulation of '..Player.PlayerData.name, 'orange', 
				'👨🏻Player: '..tostring(Player.PlayerData.name)..
				'\n🎫CivID: '..tostring(Player.PlayerData.citizenid)..
				'\n🎫FirstName: '..tostring(Player.PlayerData.charinfo.firstname)..
				'\n🎫LastName: '..tostring(Player.PlayerData.charinfo.lastname)..
				'\n🎫BirthDate: '..tostring(Player.PlayerData.charinfo.birthdate)..
				'\n🎫Gender: '..tostring(Player.PlayerData.charinfo.gender)..
				'\n🎫Nationality: '..tostring(Player.PlayerData.charinfo.nationality)..
				'\n🏘Repod Houses: '..tostring(houseCount)..
				'\n🚙Repod Vehicles: '..tostring(vehicleCount)..
				'\n💡Repod Job1: '..tostring(job1)..		
				'\n💡Repod Job2: '..tostring(job2.name),
				true, -- tag nicholiae in discord to notify
				nil, --image
				(QBCore.Functions.GetIdentifier(Player.PlayerData.source, 'discord'):gsub("discord:", "") or "unknown") -- hopefully discord name
			)	
		end
	end
end

local function postWhoHasntPaid()
	for k,v in pairs(masterList) do
		local PlayerPaid = MySQL.prepare.await('SELECT `HasPaidTaxes` FROM `playerpaidtaxes` where `citizenid` = ?', { k })
		local PlayerOwed = MySQL.prepare.await('SELECT `playerowedtaxes` FROM `playerpaidtaxes` where `citizenid` = ?', { k })
		local Player = QBCore.Player.GetOfflinePlayer(k)
		if Player == nil then
			Player = QBCore.Player.GetPlayerByCitizenId(k)
		end
		-- print(Player.PlayerData.name)
		-- print(Player.PlayerData.citizenid)
		-- print(PlayerPaid)
		Wait(300)
		if PlayerPaid == 0 then
			-- if not Config.Simulate then
				-- startRepo(k, Player)
			-- else
			postTheRepoList(k, Player)
			-- end
		end
	end
end

local function whoHasntPaid()
	for k,v in pairs(masterList) do
		local PlayerPaid = MySQL.prepare.await('SELECT `HasPaidTaxes` FROM `playerpaidtaxes` where `citizenid` = ?', { k })
		local PlayerOwed = MySQL.prepare.await('SELECT `playerowedtaxes` FROM `playerpaidtaxes` where `citizenid` = ?', { k })
		local Player = QBCore.Player.GetOfflinePlayer(k)
		if Player == nil then
			Player = QBCore.Player.GetPlayerByCitizenId(k)
		end
		if not Config.Simulate then
			MySQL.prepare('UPDATE `playerpaidtaxes` SET `haveWeChecked` = 1 WHERE `citizenid` = ?',{k})
			MySQL.prepare('UPDATE `playerpaidtaxes` SET `haveWePosted` = 0 WHERE `citizenid` = ?',{k})
		end
		Wait(300)
		if PlayerPaid == 0 then
			if not Config.Simulate then
				startRepo(k, Player)
			else
				startSimulatedRepo(k, Player)
			end
		end
	end
end


local function TimeForTaxes()
	local days_in_month = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 }   
	local month = os.date('%m')
	local tDaysinMonth = days_in_month[tonumber(month)]
	local haveWeChecked = MySQL.query.await('SELECT `haveWeChecked` FROM `playerpaidtaxes` WHERE `citizenid`=?',{'AVK48227'})
	local haveWePosted = MySQL.query.await('SELECT `haveWePosted` FROM `playerpaidtaxes` WHERE `citizenid`=?',{'AVK48227'})
	if not Config.Simulate then
		
		if tostring(os.date('%d')) == tostring(tDaysinMonth-3) then -- 4th last day of the month post who hasnt paid 
			GetAllOwnedEntities()
			postWhoHasntPaid()
		end
		if tostring(os.date('%d')) == tostring(tDaysinMonth) and not haveWeChecked[1].haveWeChecked then -- last day of the month check who hasnt paid 
			GetAllOwnedEntities()
			whoHasntPaid()
		end
		if os.date('%d') == '01' and not haveWePosted[1].haveWePosted then -- first day of the month post the taxes 
			GetAllOwnedEntities()
			postTheList()
			return true
		else
			return false
		end
	else
		GetAllOwnedEntities()
		postTheList()
		whoHasntPaid()
	end
end

RegisterNetEvent('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then 
		return 
	end
	if Config.Taxes then -- execute calculated taxes
		isItTime = TimeForTaxes()
	end
end)                                                                 


-- Events

RegisterServerEvent('NS-Taxes:server:tellThem', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	
    if Player then
		local thisMonth = os.date('%m')
		local thisYear = os.date('%Y')
		local message = ''
		local days_in_month = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 }   
		local tDaysinMonth = days_in_month[tonumber(thisMonth)]
		local reference = os.time{day=tonumber(tDaysinMonth), year=tonumber(thisYear), month=(tonumber(thisMonth))}
		-- print(reference)
		local daysfrom = os.difftime(reference, os.time()) / (24 * 60 * 60) -- seconds in a day
		local days = math.floor(daysfrom)
		local hasPaid = MySQL.prepare.await('SELECT `HasPaidTaxes` FROM `playerpaidtaxes` where `citizenid` = ?', { Player.PlayerData.citizenid })
		if hasPaid == 0 then
			local taxes = MySQL.prepare.await('SELECT `playerowedtaxes` FROM `playerpaidtaxes` where `citizenid` = ?', { Player.PlayerData.citizenid })
			local paid = MySQL.prepare.await('SELECT `PaidTaxes` FROM `playerpaidtaxes` where `citizenid` = ?', { Player.PlayerData.citizenid })
			taxes = taxes - paid
			if taxes < 0 then
				taxes = taxes * -1
				local message = 'collect'
			end
			if message == 'collect' then
				TriggerClientEvent('QBCore:Notify', src, 'You have '..days..' day(s) to do t/paymytaxes to collect your taxes of: $'..taxes, 'warning', 30000)
			else 
				TriggerClientEvent('QBCore:Notify', src, 'You have '..days..' day(s) to do t/paymytaxes to pay your taxes of: $'..taxes, 'warning', 30000)
			end
		else
			TriggerClientEvent('QBCore:Notify', src, 'You have paid your taxes already for the month of '..os.date('%B'), 'primary', 30000)
		end
    end
end)


-- Commands

QBCore.Commands.Add('whatsMyTaxes', 'Check my owed Taxes', { }, false, function(source, args)
	local src = source
	local ped = GetPlayerPed(src)
	local Player = QBCore.Functions.GetPlayer(source)
	local cid = Player.PlayerData.citizenid
	-- local taxes = MySQL.prepare.await('SELECT `playerowedtaxes` FROM `playerpaidtaxes` where `citizenid` = ?', { cid })
	GetAllOwnedEntities()
	
	local taxes = masterList[cid]
	local taxesPaid = MySQL.prepare.await('SELECT `PaidTaxes` FROM `playerpaidtaxes` where `citizenid` = ?', { cid })
	if not taxesPaid then
		taxesPaid = 0
	end
	local thisMonth = os.date('%m')
	local thisYear = os.date('%Y')
	
	local days_in_month = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 }   
	local tDaysinMonth = days_in_month[tonumber(thisMonth)]
	local reference = os.time{day=tonumber(tDaysinMonth), year=tonumber(thisYear), month=(tonumber(thisMonth))}
	-- print(reference)
	local daysfrom = os.difftime(reference, os.time()) / (24 * 60 * 60) -- seconds in a day
	local days = math.floor(daysfrom) 
	-- days = 'x' -- REMOVE BEFORE IMPLEMENTING
	if taxes then
		taxes = taxes - taxesPaid
	else
		local taxes = taxesPaid
	end
	if taxes < 0 then
		taxes = taxes * -1
		TriggerClientEvent('QBCore:Notify', src, 'You have $'..tostring(taxesPaid)..' in paid Taxes for a total credit of $'..tostring(taxes)..' paid to you in T-'..days..' day(s).')
	else
		TriggerClientEvent('QBCore:Notify', src, 'You have $'..tostring(taxesPaid)..' in paid Taxes for a total of $'..tostring(taxes)..' owed in '..days..' day(s)')
	end
	
end)

QBCore.Commands.Add('whogetsrepod', 'Simulates a repo', {}, false, function(source, args)
	GetAllOwnedEntities()
	postWhoHasntPaid()
end, 'admin')

QBCore.Commands.Add('simulateataxcycle', 'Simulates the current tax cycle', {}, false, function(source, args)
	if Config.Simulate == false then Config.Simulate = true end
	TimeForTaxes()
	
end, 'admin')

QBCore.Commands.Add('taxBreakDown', 'breakdown players taxes by civ ID', {{name = 'civid', help = 'Target Player CivId'}}, false, function(source, args)
	local civId = tostring(args[1])
	civId = civId:upper()
	local Player = QBCore.Functions.GetPlayerByCitizenId(civId)
	if Player == nil then 
		Player = QBCore.Player.GetOfflinePlayer(civId)
	end
	local PlayerSource = QBCore.Functions.GetPlayer(source)
	
	TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'BreakDown Call for '..Player.PlayerData.name.. ' from '..PlayerSource.PlayerData.name, 'blue', 
		'👨🏻Source Player: '..tostring(PlayerSource.PlayerData.name)..
		'\n🎫Source CivID: '..tostring(PlayerSource.PlayerData.citizenid)..
		'\n🎫Source FirstName: '..tostring(PlayerSource.PlayerData.charinfo.firstname)..
		'\n🎫Source LastName: '..tostring(PlayerSource.PlayerData.charinfo.lastname)..
		'\n🎫Source BirthDate: '..tostring(PlayerSource.PlayerData.charinfo.birthdate)..
		'\n🎫Source Gender: '..tostring(PlayerSource.PlayerData.charinfo.gender)..
		'\n🎫Source Nationality: '..tostring(PlayerSource.PlayerData.charinfo.nationality)

	)
	GetAllOwnedEntitiesbreakdown(civId)
	
end, 'admin')

QBCore.Commands.Add('taxRepostPlayerTaxes', 'repost a players taxes by civ ID', {{name = 'civid', help = 'Target Player CivId'}}, false, function(source, args)
	local civId = tostring(args[1])
	local Player = QBCore.Functions.GetPlayerByCitizenId(civId)
	if Player == nil then 
		Player = QBCore.Player.GetOfflinePlayer(civId)
	end
	local PlayerSource = QBCore.Functions.GetPlayer(source)
	
	TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'Repost Call for '..Player.PlayerData.name.. ' from '..PlayerSource.PlayerData.name, 'yellow', 
		'👨🏻Source Player: '..tostring(PlayerSource.PlayerData.name)..
		'\n🎫Source CivID: '..tostring(PlayerSource.PlayerData.citizenid)..
		'\n🎫Source FirstName: '..tostring(PlayerSource.PlayerData.charinfo.firstname)..
		'\n🎫Source LastName: '..tostring(PlayerSource.PlayerData.charinfo.lastname)..
		'\n🎫Source BirthDate: '..tostring(PlayerSource.PlayerData.charinfo.birthdate)..
		'\n🎫Source Gender: '..tostring(PlayerSource.PlayerData.charinfo.gender)..
		'\n🎫Source Nationality: '..tostring(PlayerSource.PlayerData.charinfo.nationality)

	)
	GetAllOwnedEntitiesRepost(civId)
	
end, 'admin')

QBCore.Commands.Add('taxSimPlayerTaxes', 'Simulates players taxes by civid', {{name = 'civid', help = 'Target Player CivId'}}, false, function(source, args)
	local civId = tostring(args[1])
	local Player = QBCore.Functions.GetPlayerByCitizenId(civId)
	if Player == nil then 
		Player = QBCore.Player.GetOfflinePlayer(civId)
	end
	local PlayerSource = QBCore.Functions.GetPlayer(source)
	
	TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'Simulation Call for '..Player.PlayerData.name.. ' from '..PlayerSource.PlayerData.name, 'green', 
		'👨🏻Source Player: '..tostring(PlayerSource.PlayerData.name)..
		'\n🎫Source CivID: '..tostring(PlayerSource.PlayerData.citizenid)..
		'\n🎫Source FirstName: '..tostring(PlayerSource.PlayerData.charinfo.firstname)..
		'\n🎫Source LastName: '..tostring(PlayerSource.PlayerData.charinfo.lastname)..
		'\n🎫Source BirthDate: '..tostring(PlayerSource.PlayerData.charinfo.birthdate)..
		'\n🎫Source Gender: '..tostring(PlayerSource.PlayerData.charinfo.gender)..
		'\n🎫Source Nationality: '..tostring(PlayerSource.PlayerData.charinfo.nationality)

	)
	GetAllOwnedEntities()
	postTheListSimulated(civId)
	-- remove all jobs
end, 'admin')

QBCore.Commands.Add('taxSimRepoPlayer', 'Repossess all players assets by civid', {{name = 'civid', help = 'Target Player CivId'}}, false, function(source, args)
	local civId = tostring(args[1])
	local Player = QBCore.Functions.GetPlayerByCitizenId(civId)
	if Player == nil then 
		Player = QBCore.Player.GetOfflinePlayer(civId)
	end
	local PlayerSource = QBCore.Functions.GetPlayer(source)
	
	TriggerEvent('qb-log:server:CreateLog', 'repossessionSim', 'Manual Repo Call for '..Player.PlayerData.name.. ' from '..PlayerSource.PlayerData.name, 'red', 
		'👨🏻Source Player: '..tostring(PlayerSource.PlayerData.name)..
		'\n🎫Source CivID: '..tostring(PlayerSource.PlayerData.citizenid)..
		'\n🎫Source FirstName: '..tostring(PlayerSource.PlayerData.charinfo.firstname)..
		'\n🎫Source LastName: '..tostring(PlayerSource.PlayerData.charinfo.lastname)..
		'\n🎫Source BirthDate: '..tostring(PlayerSource.PlayerData.charinfo.birthdate)..
		'\n🎫Source Gender: '..tostring(PlayerSource.PlayerData.charinfo.gender)..
		'\n🎫Source Nationality: '..tostring(PlayerSource.PlayerData.charinfo.nationality)

	)
	GetAllOwnedEntities()
	startSimulatedRepo(civId, Player)
	-- remove all jobs
end, 'admin')

QBCore.Commands.Add('payMyTaxes', 'Pay this Months Taxes', { }, false, function(source, args)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	GetAllOwnedEntities()
	if Player.PlayerData.money.bank >= masterList[Player.PlayerData.citizenid] then
		chargeAndReset(source)
	else
		TriggerClientEvent('QBCore:Notify', src, 'You do not have the funds for this transaction.', 'error', 10000)
	end
end)
