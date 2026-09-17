local GithubL, Changelog, ESX, QBCore

local Version = GetResourceMetadata(GetCurrentResourceName(), 'version', 0) -- Do Not Change This Value
local Github = GetResourceMetadata(GetCurrentResourceName(), 'github', 0)
local Updater = false

-- Multi-dancer support
local PoleDancers = {}
local PlayersInside = {}
local CurrentPoleCount = 0

-- Server Seat Locales
local GetPlayerSeated = 0
local Seat1Taken = false
local Seat2Taken = false
local Seat3Taken = false
local Seat4Taken = false
local Seat5Taken = false
local Seat6Taken = false
local Seat7Taken = false

-- Import
if Config.Framework == "ESX" then
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
elseif Config.Framework == "QBCore" then
    QBCore = exports['qb-core']:GetCoreObject()
end

-------- Check if new update available
Citizen.CreateThread(function()
    
    local Resources = GetNumResources()

	for i = 0, Resources, 1 do
		local resource = GetResourceByFindIndex(i)
		UpdateResource(resource)
	end

    Citizen.Wait(4000)
    if Updater == false then
        if Config.UpdateChecker then
            Updater = not Updater
            UpdateChecker()
        end
    end
end)

function UpdateResource(resource)
	if resource == 'fivem-checker' then
        if GetResourceState(resource) == 'started' or GetResourceState(resource) == 'starting' then
            if Config.UpdateChecker then
                Updater = true
            end
		end
	end
end

---------------- deprecated

function UpdateChecker()
	return
    -- local NewestVersion = nil
    -- local Version1 = nil
    
    -- if string.find(Github, "github") then
        -- if string.find(Github, "github.com") then
            -- GithubL = Github
            -- Github = string.gsub(Github, "github", "raw.githubusercontent")..'/master/version'
        -- else
            -- GithubL = string.gsub(Github, "raw.githubusercontent", "github"):gsub("/master", "")
            -- Github = Github..'/version'
        -- end
    -- end
    
    -- PerformHttpRequest(Github, function(Error, V, Header)
        -- if not Error then
            -- NewestVersion = V
        -- end
    -- end)
    
    -- repeat
        -- Citizen.Wait(10)
    -- until NewestVersion ~= nil
    
    -- local _, strings = string.gsub(NewestVersion or "", "\n", "\n")
    -- Version1 = (NewestVersion or ""):match("[^\n]*"):gsub("[<>]", "")
    
    -- if string.find(Version1, Version) then
    -- else
        -- if strings > 0 then
            -- Changelog = (NewestVersion or ""):gsub(Version1,""):match("(.*" .. Version .. ")"):gsub(Version,"")
            -- Changelog = string.gsub(Changelog, "\n", "")
            -- Changelog = string.gsub(Changelog, "-", " \n-"):gsub("%b<>", ""):sub(1, -2)
            -- NewestVersion = Version1
        -- end
    -- end
    -- Citizen.Wait(500)
    
    -- print('')
    -- if Config.Framework == 'QBCore' then
        -- print('^8QBCore ^6KC Unicorn Script ('..GetCurrentResourceName()..')')
    -- elseif Config.Framework == 'Standalone' then
        -- print('^9Standalone ^6KC Unicorn Script ('..GetCurrentResourceName()..')')
    -- elseif Config.Framework == 'ESX' then
        -- print('^3ESX ^6KC Unicorn Script ('..GetCurrentResourceName()..')')
    -- end
    -- if Version == Version1 then
        -- print('^2Version ' .. Version .. ' - Up to date!')
    -- else
        -- print('^1Version ' .. Version .. ' - Outdated!')
        -- print('^1New version: v' .. Version1)
        -- if Config.ChangeLog and Changelog then
            -- print('\n^3Changelog:')
            -- print('^4'..Changelog..'\n')
        -- end
        -- print('^1Please check the GitHub and download the last update')
        -- print('^2'..GithubL..'/releases/latest')
    -- end
    -- print('')
end

-- Enhanced Multi-Dancer Pole System (Server-side coordination only)
function CreatePoleDancer(poleId, stripperId)
    if not Config.MultiDancerPoles.enabled then return false end
    if CurrentPoleCount >= Config.MultiDancerPoles.maxDancers then return false end
    
    local poleConfig = Config.MultiDancerPoles.poleLocations[poleId]
    local stripperConfig = Config.Strippers[stripperId]
    
    if not poleConfig or not stripperConfig then return false end
    
    -- Store dancer info (actual ped creation happens client-side)
    PoleDancers[poleId] = {
        poleId = poleId,
        stripperId = stripperId,
        coords = poleConfig.coords,
        heading = poleConfig.heading,
        pedNumber = math.random(1, 2), -- Random dance animation
        isActive = true
    }
    
    CurrentPoleCount = CurrentPoleCount + 1
    
    if Config.Debug then
        print(string.format("Server registered pole dancer: %s at %s", stripperConfig.Name, poleConfig.name))
    end
    
	if #PlayersInside > 0 then
		
		-- Trigger client-side pole dancer creation
		TriggerClientEvent('NS-StripClub:client:CreatePoleDancer', PlayersInside[1].PlayerData.source, poleId, stripperId)
		
	else
		
		CleanupAllPoleDancers()
	
	end
    
    return true
end

-- Enhanced cleanup function
function CleanupAllPoleDancers()
    -- Remove all existing dancers
    for poleId, dancerInfo in pairs(PoleDancers) do
        if dancerInfo.isActive then
            TriggerClientEvent('NS-StripClub:client:RemovePoleDancer', -1, poleId)
            if Config.Debug then
                print(string.format("Removed pole dancer from pole %d", poleId))
            end
        end
    end
    
    -- Reset dancer data
    PoleDancers = {}
    CurrentPoleCount = 0
    
    if Config.Debug then
        print("All pole dancers cleaned up successfully")
    end
end

function InitializePoleDancers()
    if not Config.MultiDancerPoles.enabled then 
        if Config.Debug then
            print("Multi-dancer system is disabled")
        end
        return 
    end
    
    -- Clean up any existing dancers first
    CleanupAllPoleDancers()
    
    Wait(2000) -- Wait for resource to fully start
    
    -- Create dancers based on configuration
    local polesToCreate = 0
    for poleId, stripperId in pairs(Config.MultiDancerPoles.dancerAssignments) do
        if poleId <= Config.MultiDancerPoles.maxDancers then
            polesToCreate = polesToCreate + 1
            if Config.Debug then
                print(string.format("Creating dancer for pole %d with stripper %d", poleId, stripperId))
            end
            CreatePoleDancer(poleId, stripperId)
            -- Wait(100) -- Stagger creation to prevent issues
        else
            if Config.Debug then
                print(string.format("Skipping pole %d - exceeds maxDancers (%d)", poleId, Config.MultiDancerPoles.maxDancers))
            end
        end
    end
    
    if Config.Debug then
        print(string.format("Initialized %d pole dancers out of %d configured poles", CurrentPoleCount, polesToCreate))
    end
end

-- Start the pole dancer system
Citizen.CreateThread(function()
	while true do 
		InitializePoleDancers()
		Wait(1000*60*20) -- 20 minutes
	end
end)

-- Enhanced pole dancer management
function RefreshAllPoleDancers()
    if Config.Debug then
        print("Refreshing all pole dancers...")
    end
    
    -- Remove existing dancers
    CleanupAllPoleDancers()
    
    -- Recreate dancers
    InitializePoleDancers()
    
    if Config.Debug then
        print("Pole dancer refresh completed")
    end
end

-- LEGACY SYSTEM COMPLETELY DISABLED AND REMOVED
-- All legacy pole dance variables and functions have been removed
-- to prevent any possibility of duplicate ped spawning


RegisterServerEvent('NS-StripClub:bounceThePoles')
AddEventHandler('NS-StripClub:bounceThePoles', function(ped, stripperId, poleId)
	
	-- print(#PlayersInside)
	
	for x,y in pairs(PlayersInside) do
		if x == 1 then 
			print("skipping player 1")
		else
			-- print(PlayersInside[x].PlayerData.source)
			TriggerClientEvent('NS-StripClub:client:SynchPoleDancer', tonumber(PlayersInside[x].PlayerData.source), ped, stripperId, poleId)
			
		end
	end
	
end)


RegisterServerEvent('NS-StripClub:buy')
AddEventHandler('NS-StripClub:buy', function(Stripper)
	
    if Config.Framework == "QBCore" then

        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        
        -- Apply price modifier based on stripper
        local stripperConfig = Config.Strippers[Stripper]
        local priceModifier = stripperConfig and stripperConfig.BasePriceModifier or 1.0
        Cost = math.floor(Config.LapDanceCost * priceModifier)
        
        PlayerMoney = Player.PlayerData.money["cash"]
        PlayerBirthdate = Player.PlayerData.charinfo.birthdate
        TodayDate = os.date("%Y-%m-%d")

        if GetPlayerSeated >= 7 then
            TriggerClientEvent('QBCore:Notify', src, Loc('AllPlacesTaken'), "error", 1700)
        else
            if PlayerMoney >= Cost then
                if not LapDanceActive then
                    Player.Functions.RemoveMoney("cash", Cost)
                    local stripperName = stripperConfig and stripperConfig.Name or "Stripper"
                    TriggerClientEvent('QBCore:Notify', src, Loc('BoughtLapdance', Cost) .. " from " .. stripperName, "success", 1700)
                    TriggerClientEvent('NS-StripClub:lapdance', src, PlayerMoney, PlayerBirthdate, TodayDate, Stripper)
                else
                    TriggerClientEvent('QBCore:Notify', src, Loc('StripperActive'), "error", 1700)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, Loc('NotEnoughMoney', Cost), "error", 1700)
            end
        end

    elseif Config.Framework == "ESX" then

        local src = source
        local Player = ESX.GetPlayerFromId(src)
        
        -- Apply price modifier based on stripper
        local stripperConfig = Config.Strippers[Stripper]
        local priceModifier = stripperConfig and stripperConfig.BasePriceModifier or 1.0
        Cost = math.floor(Config.LapDanceCost * priceModifier)
        
        PlayerMoney = Player.getMoney()

        if GetPlayerSeated >= 7 then
            TriggerClientEvent('esx:showNotification', src, Loc('AllPlacesTaken'))
        else
            if PlayerMoney >= Cost then
                if not LapDanceActive then
                    Player.removeMoney(Cost)
                    TriggerClientEvent('esx:showNotification', src, Loc('BoughtLapdance', Cost))
                    TriggerClientEvent('NS-StripClub:lapdance', src, PlayerMoney, PlayerBirthdate, TodayDate, Stripper)
                else
                    TriggerClientEvent('esx:showNotification', src, Loc('StripperActive'))
                end
            else
                TriggerClientEvent('esx:showNotification', src, Loc('NotEnoughMoney', Cost))
            end
        end

    elseif Config.Framework == 'Standalone' then
        local src = source
        
        if GetPlayerSeated >= 7 then
            TriggerClientEvent('NS-StripClub:showNotify', src, Loc('AllPlacesTaken'))
        else
            TriggerClientEvent('NS-StripClub:lapdance', src, PlayerMoney, PlayerBirthdate, TodayDate, Stripper)
        end
    end
end)

local function isThisPlayerInside(source)

	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	for i, p in ipairs(PlayersInside) do
		if p.PlayerData.citizenid == Player.PlayerData.citizenid then
			return true
		end
	end
	
	return false 
end


-- Register Player Inside
RegisterServerEvent('NS-StripClub:server:RegisterMeInside')
AddEventHandler('NS-StripClub:server:RegisterMeInside', function()
	
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	
	if not isThisPlayerInside(src) then
		table.insert(PlayersInside, Player)
	end
	
end)

-- Register Player Outside
RegisterServerEvent('NS-StripClub:server:RegisterMeOutside')
AddEventHandler('NS-StripClub:server:RegisterMeOutside', function()
	
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if isThisPlayerInside(src) then
		for i, p in ipairs(PlayersInside) do
			if p.citizenid == Player.citizenid then
				table.remove(PlayersInside, i)
				break
			end
		end
	end
	
end)

-- Lean Throw function
RegisterServerEvent('NS-StripClub:leanthrow')
AddEventHandler('NS-StripClub:leanthrow', function()
	
    if Config.Framework == "QBCore" then

        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        Cost = Config.ThrowCost
        PlayerMoney = Player.PlayerData.money["cash"]

        Player.Functions.RemoveMoney("cash", Cost)

    elseif Config.Framework == "ESX" then

        local src = source
        local Player = ESX.GetPlayerFromId(src)
        Cost = Config.ThrowCost
        PlayerMoney = Player.getMoney()

        Player.removeMoney(Cost)

    end
end)

-- Lean ESX Get Money
RegisterServerEvent('NS-StripClub:esxmoney')
AddEventHandler('NS-StripClub:esxmoney', function()

    local src = source
    local Player = ESX.GetPlayerFromId(src)
    Cost = Config.LapDanceCost
    PlayerMoney = Player.getMoney()
    
    TriggerClientEvent("NS-StripClub:esxplayermoney", src, PlayerMoney)

end)

-- lean throw got trojan
RegisterServerEvent('NS-StripClub:server:addTrojanUsb')
AddEventHandler('NS-StripClub:server:addTrojanUsb', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	exports['qb-inventory']:AddItem(src, 'trojan_usb', 1, false, false, 'NS-StripClub:addTrojanUsb')
end)

RegisterServerEvent('NS-StripClub:SyncLapDanceSpawn')
AddEventHandler('NS-StripClub:SyncLapDanceSpawn', function()

    TriggerClientEvent("NS-StripClub:LapDanceSpawn", 0)

end)

RegisterServerEvent('NS-StripClub:GetPlayerSeated')
AddEventHandler('NS-StripClub:GetPlayerSeated', function()
    local src = source

    if Seat1Taken then
        GetPlayerSeated = GetPlayerSeated + 1
    end
    if Seat2Taken then
        GetPlayerSeated = GetPlayerSeated + 1
    end
    if Seat3Taken then
        GetPlayerSeated = GetPlayerSeated + 1
    end
    if Seat4Taken then
        GetPlayerSeated = GetPlayerSeated + 1
    end
    if Seat5Taken then
        GetPlayerSeated = GetPlayerSeated + 1
    end
    if Seat6Taken then
        GetPlayerSeated = GetPlayerSeated + 1
    end
    if Seat7Taken then
        GetPlayerSeated = GetPlayerSeated + 1
    end
    if not Seat1Taken and not Seat2Taken and not Seat3Taken and not Seat4Taken and not Seat5Taken and not Seat6Taken and not Seat7Taken then
        GetPlayerSeated = 0
    end

    if Config.Debug then
        print("Server: ", "Seat1: ", Seat1Taken, "Seat2: ", Seat2Taken, "Seat3: ", Seat3Taken, "Seat4: ", Seat4Taken, "Seat5: ", Seat5Taken, "Seat6: ", Seat6Taken, "Seat7: ", Seat7Taken, " ", GetPlayerSeated)
    end
    TriggerClientEvent("NS-StripClub:SetPlayerSeated", src, GetPlayerSeated, Seat1Taken,  Seat2Taken, Seat3Taken, Seat4Taken, Seat5Taken, Seat6Taken, Seat7Taken)
    GetPlayerSeated = 0

end)

RegisterServerEvent('NS-StripClub:Seat1')
AddEventHandler('NS-StripClub:Seat1', function(seat)
    Seat1Taken = true
end)

RegisterServerEvent('NS-StripClub:Seat2')
AddEventHandler('NS-StripClub:Seat2', function(seat)
    Seat2Taken = true
end)

RegisterServerEvent('NS-StripClub:Seat3')
AddEventHandler('NS-StripClub:Seat3', function(seat)
    Seat3Taken = true
end)

RegisterServerEvent('NS-StripClub:Seat4')
AddEventHandler('NS-StripClub:Seat4', function(seat)
    Seat4Taken = true
end)

RegisterServerEvent('NS-StripClub:Seat5')
AddEventHandler('NS-StripClub:Seat5', function(seat)
    Seat5Taken = true
end)

RegisterServerEvent('NS-StripClub:Seat6')
AddEventHandler('NS-StripClub:Seat6', function(seat)
    Seat6Taken = true
end)

RegisterServerEvent('NS-StripClub:Seat7')
AddEventHandler('NS-StripClub:Seat7', function(seat)
    Seat7Taken = true
end)

RegisterServerEvent('NS-StripClub:RemoveSeat1')
AddEventHandler('NS-StripClub:RemoveSeat1', function(seat)
    Seat1Taken = false
end)

RegisterServerEvent('NS-StripClub:RemoveSeat2')
AddEventHandler('NS-StripClub:RemoveSeat2', function(seat)
    Seat2Taken = false
end)

RegisterServerEvent('NS-StripClub:RemoveSeat3')
AddEventHandler('NS-StripClub:RemoveSeat3', function(seat)
    Seat3Taken = false
end)

RegisterServerEvent('NS-StripClub:RemoveSeat4')
AddEventHandler('NS-StripClub:RemoveSeat4', function(seat)
    Seat4Taken = false
end)

RegisterServerEvent('NS-StripClub:RemoveSeat5')
AddEventHandler('NS-StripClub:RemoveSeat5', function(seat)
    Seat5Taken = false
end)

RegisterServerEvent('NS-StripClub:RemoveSeat6')
AddEventHandler('NS-StripClub:RemoveSeat6', function(seat)
    Seat6Taken = false
end)

RegisterServerEvent('NS-StripClub:RemoveSeat7')
AddEventHandler('NS-StripClub:RemoveSeat7', function(seat)
    Seat7Taken = false
end)

RegisterServerEvent('NS-StripClub:NoPlaceAvailable')
AddEventHandler('NS-StripClub:NoPlaceAvailable', function()

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Cost = Config.LapDanceCost

    Player.Functions.AddMoney("cash", Cost)
    TriggerClientEvent('QBCore:Notify', src, Loc('AllPlacesTaken'), "error", 1700)

end)

-- Enhanced resource stop cleanup
AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
		return
	end
	
	-- Clean up multi-dancer pole system
	CleanupAllPoleDancers()
	
	if Config.Debug then
		print("All pole dancers successfully deleted")
	end
end)

-- Export functions for external resource control
RegisterServerEvent('NS-StripClub:client:RequestDancerRefresh')
AddEventHandler('NS-StripClub:client:RequestDancerRefresh', function()
        if Config.Debug then
                print('Client requested dancer refresh')
        end
        RefreshAllPoleDancers()
end)

exports('GetPoleDancerCount', function()
    return CurrentPoleCount
end)

exports('RefreshPoleDancers', function()
    RefreshAllPoleDancers()
end)

exports('IsMultiDancerEnabled', function()
    return Config.MultiDancerPoles.enabled
end)