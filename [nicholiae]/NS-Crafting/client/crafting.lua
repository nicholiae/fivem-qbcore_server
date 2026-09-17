-- Client-side script for the modern crafting system
-- Integrated with original NS-Crafting system + Bonus Zones + Enhanced Features

local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local craftingOpen = false
local xpType = 'craftingrep'
local currentBenchType = nil

-- Bonus Zone Variables
local insideCraftBoxZonee1 = false
local insideCraftBoxZonee2 = false
local insideCraftBoxZonee3 = false

-- Bonus Zone Functions
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

-- Function to check if player is in any bonus zone
local function isInBonusZone()
    return insideCraftBoxZonee1 or insideCraftBoxZonee2 or insideCraftBoxZonee3
end

-- Access control is now handled by only loading applicable benches in generateRecipeData()

-- Helper to get display name for bench
local function getBenchDisplayName(benchType)
    local displayNames = {
        unemployed_bench = "Universal Crafting",
        lux_bench = "Lux Industries",
        ballas_bench = "Ballas Workshop",
        syndicate_bench = "Syndicate Lab",
        abk_bench = "ABK Workshop",
        otf_bench = "OTF Workshop",
        lostmc_bench = "Lost MC Garage",
        gang_bench = "Gang Armory",
        joint_bench = "Joint Rolling Station",
        blunt_bench = "Blunt Rolling Station",
        police_bench = "Police Armory",
        rustybrowns_bench = "Rusty Browns Cafe",
        tequilala_bench = "Tequilala Bar",
        bigjohns_bench = "Big Johns Kitchen",
        drivein_bench = "Drive-In Kitchen",
        burgershot_bench = "Burgershot Kitchen",
        butcher_bench = "Butcher Shop",
        bikes_bench = "Bike Mechanic",
        pjsauto_bench = "PJs Auto Shop",
        mechj_bench = "MechJ Garage",
        tuners_bench = "Tuners Shop",
        customs_bench = "Customs Shop",
        cookies_bench = "Cookies Dispensary",
        whitewidow_bench = "White Widow Dispensary",
        weedshop_bench = "Weed Shop",
        pets_bench = "Pet Shop"
    }
    
    return displayNames[benchType] or benchType:gsub("_", " "):gsub("^%l", string.upper)
end

-- Initialize when resource starts
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        PlayerData = QBCore.Functions.GetPlayerData()
    end
end)

-- Update player data when it changes
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    xpType = 'craftingrep'
    if Config.ResetPlayersXp then
        local PD = QBCore.Functions.GetPlayerData()
        if PD.metadata['rep'][xpType] ~= 0 then
            TriggerServerEvent('ns-crafting:server:resetPlayerXp', xpType)
        end
    end

    -- Initialize Bonus Zones
    QBCore.Functions.GetPlayerData(function(PlayerData)
        local DrugLab1 = BoxZone:Create(Config.BonusZones['DrugLab1'].Center, Config.BonusZones['DrugLab1'].Length, Config.BonusZones['DrugLab1'].Width, {
            name='DrugLab1',
            offset={0.0, 0.0, 0.0},
            scale={1.0, 1.0, 1.0},
            debugPoly=false,
        })
        local DrugLab2 = BoxZone:Create(Config.BonusZones['DrugLab2'].Center, Config.BonusZones['DrugLab2'].Length, Config.BonusZones['DrugLab2'].Width, {
            name='DrugLab2',
            offset={0.0, 0.0, 0.0},
            scale={1.0, 1.0, 1.0},
            debugPoly=false,
        })
        local DrugLab3 = BoxZone:Create(Config.BonusZones['DrugLab3'].Center, Config.BonusZones['DrugLab3'].Length, Config.BonusZones['DrugLab3'].Width, {
            name='DrugLab3',
            offset={0.0, 0.0, 0.0},
            scale={1.0, 1.0, 1.0},
            debugPoly=false,
        })

        -- Zone Detection Thread 1
        Citizen.CreateThread(function()
            while true do
                local plyPed = PlayerPedId()
                local coord = GetEntityCoords(plyPed)
                insideCraftBoxZonee1 = DrugLab1:isPointInside(coord)
                if Config.debug == true then
                    print(insideCraftBoxZonee1)
                end
                if insideCraftBoxZonee1 then
                    alienEffect()
                end
                Citizen.Wait(500)
            end
        end) 

        -- Zone Detection Thread 2
        Citizen.CreateThread(function()
            while true do
                local plyPed = PlayerPedId()
                local coord = GetEntityCoords(plyPed)
                insideCraftBoxZonee2 = DrugLab2:isPointInside(coord)
                if Config.debug == true then
                    print(insideCraftBoxZonee2)
                end
                if insideCraftBoxZonee2 then
                    alienEffect()
                end
                Citizen.Wait(500)
            end
        end)  

        -- Zone Detection Thread 3
        Citizen.CreateThread(function()
            while true do
                local plyPed = PlayerPedId()
                local coord = GetEntityCoords(plyPed)
                insideCraftBoxZonee3 = DrugLab3:isPointInside(coord)
                if Config.debug == true then
                    print(insideCraftBoxZonee3)
                end
                if insideCraftBoxZonee3 then
                    alienEffect()
                end
                Citizen.Wait(500)
            end
        end) 
    end)
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

-- Original NS-Crafting events that now open the unified GUI
-- All events open the same menu, which shows recipes based on player's job/gang
RegisterNetEvent('NS-Crafting:client:craftingTableCall', function()
    openCraftingMenu()
end)

RegisterNetEvent('NS-Crafting:client:craftingWeaponTableCall', function()
    openCraftingMenu()
end)

RegisterNetEvent('NS-Crafting:client:craftingGangTableCall', function()
    openCraftingMenu()
end)

RegisterNetEvent('NS-Crafting:client:craftingRegTableCall', function()
    openCraftingMenu()
end)

RegisterNetEvent('NS-Crafting:client:craftingJointTableCall', function()
    openCraftingMenu()
end)

RegisterNetEvent('NS-Crafting:client:craftingBluntTableCall', function()
    openCraftingMenu()
end)

-- Function to open the crafting menu (shows ALL applicable recipes)
function openCraftingMenu(benchType)
    if craftingOpen then return end
    
    currentBenchType = benchType or 'crafting'
    craftingOpen = true
    SetNuiFocus(true, true)
    
    -- Get player info for display
    local playerJob = PlayerData.job and PlayerData.job.label or 'Unemployed'
    local playerGang = PlayerData.gang and PlayerData.gang.label or 'None'
    
    -- Notify if in bonus zone
    if isInBonusZone() then
        QBCore.Functions.Notify('Opening Crafting Menu - BONUS ZONE ACTIVE!', 'success')
    else
        QBCore.Functions.Notify('Opening Crafting Menu', 'success')
    end
    
    -- Get player inventory and generate recipe data (loads ALL applicable recipes)
    QBCore.Functions.TriggerCallback('crafting:getPlayerInventory', function(inventory)
        local recipes = generateRecipeData(inventory, benchType)
        
        -- Send data to NUI
        SendNUIMessage({
            action = 'show',
            laborPoints = PlayerData.metadata['crafting_labor'] or 0,
            proficiencyLevels = generateProficiencyLevels(),
            recipes = recipes,
            inBonusZone = isInBonusZone(),
            benchType = 'all',
            benchName = 'Crafting Menu'
        })
    end)
end

-- Function to close the crafting menu
function closeCraftingMenu()
    craftingOpen = false
    currentBenchType = nil
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = 'hide'
    })
end

-- Generate proficiency levels for all bench types
function generateProficiencyLevels()
    local levels = {}
    
    -- Using the bench types from the original config
    for benchType, _ in pairs(Config) do
        if string.find(benchType, "_bench") then
            local benchName = string.gsub(benchType, "_bench", "")
            local xpValue = 0
            if PlayerData.metadata and PlayerData.metadata['rep'] and PlayerData.metadata['rep'][xpType] then
                xpValue = PlayerData.metadata['rep'][xpType]
            end
            levels[benchName] = xpValue
        end
    end
    
    return levels
end

-- Generate recipe data for the UI with bonus zone calculations (SPECIFIC BENCH + UNIVERSAL BENCHES)
function generateRecipeData(inventory, benchType)
    local recipes = {}
    
    -- Get current XP
    local currentXP = 0
    if PlayerData.metadata and PlayerData.metadata['rep'] and PlayerData.metadata['rep'][xpType] then
        currentXP = PlayerData.metadata['rep'][xpType]
    end
    
    -- Check if in bonus zone
    local inBonusZone = isInBonusZone()
    
    -- Get player data
    local playerJob = PlayerData.job and PlayerData.job.name or 'unemployed'
    local playerGang = PlayerData.gang and PlayerData.gang.name or 'none'
    
    -- Universal benches that should always be included
    local universalBenches = {
        'unemployed_bench',
        'joint_bench',
        'blunt_bench',
    }
    
    -- Determine which benches to load based on player's job and gang
    local benchesToLoad = {}
    
    -- Always add universal benches
    for _, bench in ipairs(universalBenches) do
        table.insert(benchesToLoad, bench)
    end
    
    -- Add player's job bench (if not unemployed)
    if playerJob ~= 'unemployed' then
        local jobBench = string.lower(playerJob) .. '_bench'
        table.insert(benchesToLoad, jobBench)
    end
    
    -- Add player's gang bench (if in a gang)
    if playerGang ~= 'none' then
        local gangBench = string.lower(playerGang) .. '_bench'
        table.insert(benchesToLoad, gangBench)
		gangBench = 'gang_bench'
        table.insert(benchesToLoad, gangBench)
    end
    
    -- Helper function to process recipes from a bench
    local function processRecipes(benchTypeToProcess)
        if not Config[benchTypeToProcess] or not Config[benchTypeToProcess].recipes then
            if Config.debug then
                print("Warning: Bench type " .. benchTypeToProcess .. " not found in config or has no recipes")
            end
            return
        end
        
        local benchRecipes = Config[benchTypeToProcess].recipes
        local benchName = string.gsub(benchTypeToProcess, "_bench", "")
        
        if Config.debug then
            print("Processing " .. #benchRecipes .. " recipes from " .. benchTypeToProcess)
        end
        
        for _, recipeData in ipairs(benchRecipes) do
            local canCraft = true
            local ingredients = {}
            
            -- Check if player has required items
            for _, reqItem in pairs(recipeData.requiredItems) do
                local hasItem = false
                local itemAmount = 0
                
                for _, invItem in pairs(inventory) do
                    if invItem.name == reqItem.item then
                        itemAmount = invItem.amount
                        if invItem.amount >= reqItem.amount then
                            hasItem = true
                        end
                        break
                    end
                end
                
                local itemLabel = reqItem.item
                if QBCore.Shared.Items[reqItem.item] then
                    itemLabel = QBCore.Shared.Items[reqItem.item].label or reqItem.item
                end
                
                table.insert(ingredients, {
                    name = itemLabel,
                    required = reqItem.amount,
                    available = itemAmount,
                    icon = Config.ImageBasePath .. (QBCore.Shared.Items[reqItem.item] and QBCore.Shared.Items[reqItem.item].image or 'default.png')
                })
                
                if not hasItem then
                    canCraft = false
                end
            end
            
            -- Check proficiency requirement
            if currentXP < recipeData.xpRequired then
                canCraft = false
            end
            
            local itemLabel = recipeData.item
            if QBCore.Shared.Items[recipeData.item] then
                itemLabel = QBCore.Shared.Items[recipeData.item].label or recipeData.item
            end
            
            -- Calculate bonus zone effects
            local craftAmount = recipeData.yield or 1
            local craftTime = Config.EnableSkillCheck and Config.TTC or 1
            local bonusActive = false
            
            if inBonusZone then
                -- Check if item is not a weapon and not blacklisted
                local isWeapon = QBCore.Shared.Items[recipeData.item] and QBCore.Shared.Items[recipeData.item].type == 'weapon'
                local isBlacklisted = false
                
                for _, blacklistItem in pairs(Config.BlacklistItems or {}) do
                    if blacklistItem == recipeData.item then
                        isBlacklisted = true
                        break
                    end
                end
                
                if not isWeapon and not isBlacklisted then
                    -- Apply yield bonus
                    if Config.YieldBonus == true then
                        craftAmount = craftAmount * (Config.BonusYield or 2)
                        bonusActive = true
                    end
                    
                    -- Apply time bonus
                    if Config.TimeBonus == true then
                        craftTime = craftTime * (Config.BonusTime or 0.5)
                        bonusActive = true
                    end
                end
            end
            
            table.insert(recipes, {
                name = recipeData.item,
                displayName = itemLabel,
                benchType = benchName,
                benchName = benchName:gsub("^%l", string.upper):gsub("_", " "),
                labor = 10,
                time = craftTime,
                amount = craftAmount,
                proficiency = recipeData.xpRequired or 0,
                xpGain = recipeData.xpGain or 0,
                ingredients = ingredients,
                available = canCraft,
                icon = Config.ImageBasePath .. (QBCore.Shared.Items[recipeData.item] and QBCore.Shared.Items[recipeData.item].image or 'default.png'),
                bonusActive = bonusActive,
                baseAmount = recipeData.yield or 1,
                baseTime = Config.EnableSkillCheck and Config.TTC or 1
            })
        end
    end
    
    -- Load all applicable benches for this player
    if Config.debug then
        print("=== Loading Recipes for Player ===")
        print("Player Job: " .. playerJob)
        print("Player Gang: " .. playerGang)
        print("Benches to load: " .. table.concat(benchesToLoad, ", "))
    end
    
    -- Process all applicable benches
    for _, bench in ipairs(benchesToLoad) do
        processRecipes(bench)
    end
    
    if Config.debug then
        print("Total recipes loaded: " .. #recipes)
        print("===================================")
    end
    
    return recipes
end

-- NUI Callbacks
RegisterNUICallback('close', function(data, cb)
    closeCraftingMenu()
    cb('ok')
end)

RegisterNUICallback('craftItem', function(data, cb)
    local recipe = data.recipe
    local quantity = data.quantity
    
    -- Get the required items from config
    local requiredItems = {}
    local recipeData = nil
    for benchType, benchData in pairs(Config) do
        if string.find(benchType, "_bench") then
            local benchName = string.gsub(benchType, "_bench", "")
            if benchName == recipe.benchType then
                for _, rData in pairs(benchData.recipes) do
                    if rData.item == recipe.name then
                        requiredItems = rData.requiredItems
                        recipeData = rData
                        break
                    end
                end
            end
        end
    end
    
    -- Calculate actual craft amount with bonus zones
    local actualCraftAmount = recipeData.yield or 1
    local inBonusZone = isInBonusZone()
    
    if inBonusZone and recipeData then
        local isWeapon = QBCore.Shared.Items[recipeData.item] and QBCore.Shared.Items[recipeData.item].type == 'weapon'
        local isBlacklisted = false
        
        for _, blacklistItem in pairs(Config.BlacklistItems or {}) do
            if blacklistItem == recipeData.item then
                isBlacklisted = true
                break
            end
        end
        
        if not isWeapon and not isBlacklisted and Config.YieldBonus == true then
            actualCraftAmount = actualCraftAmount * (Config.BonusYield or 2)
        end
    end
    
    -- Multiply required items by quantity
    local multipliedItems = {}
    for _, reqItem in ipairs(requiredItems) do
        table.insert(multipliedItems, {
            item = reqItem.item,
            amount = reqItem.amount * quantity
        })
    end
    
    TriggerServerEvent('ns-crafting:server:receiveItem', recipe.name, multipliedItems, quantity, recipe.xpGain, xpType, actualCraftAmount)
    
    -- Close and reopen menu to refresh
    Wait(100)
    closeCraftingMenu()
    Wait(100)
    openCraftingMenu(currentBenchType)
    
    cb('ok')
end)

-- Close menu on ESC (this handles the key when NUI doesn't have focus)
RegisterCommand('+closeCrafting', function()
    if craftingOpen then
        closeCraftingMenu()
    end
end, false)

RegisterKeyMapping('+closeCrafting', 'Close Crafting Menu', 'keyboard', 'ESCAPE')

-- Also handle ESC when NUI has focus (backup method)
CreateThread(function()
    while true do
        Wait(0)
        if craftingOpen then
            if IsControlJustPressed(0, 322) then -- ESC key
                closeCraftingMenu()
            end
        else
            Wait(500)
        end
    end
end)