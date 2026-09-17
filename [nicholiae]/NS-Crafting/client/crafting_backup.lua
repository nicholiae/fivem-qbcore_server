-- Client-side script for the modern crafting system
-- Integrated with original NS-Crafting system

local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local craftingOpen = false
local xpType = 'craftingrep'
local currentBenchType = nil

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
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

-- Original NS-Crafting events that now open the GUI
RegisterNetEvent('NS-Crafting:client:craftingTableCall', function()
    local benchType = QBCore.Functions.GetPlayerData().job.name..'_bench'
    if benchType == 'unemployed_bench' then
        benchType = QBCore.Functions.GetPlayerData().gang.name..'_bench'
    end
    openCraftingMenu(benchType)
end)

RegisterNetEvent('NS-Crafting:client:craftingWeaponTableCall', function()
    if QBCore.Functions.GetPlayerData().gang.name ~= 'none' then
        local benchType = 'gang_bench'
        openCraftingMenu(benchType)
    else
        QBCore.Functions.Notify('This menu is not for you', 'error')
    end
end)

RegisterNetEvent('NS-Crafting:client:craftingGangTableCall', function()
    if QBCore.Functions.GetPlayerData().gang.name ~= 'none' then
        local benchType = QBCore.Functions.GetPlayerData().gang.name..'_bench'
        openCraftingMenu(benchType)
    else
        QBCore.Functions.Notify('This menu is not for you', 'error')
    end
end)

RegisterNetEvent('NS-Crafting:client:craftingRegTableCall', function()
    local benchType = 'unemployed_bench'
    openCraftingMenu(benchType)
end)

RegisterNetEvent('NS-Crafting:client:craftingJointTableCall', function()
    local benchType = 'joint_bench'
    openCraftingMenu(benchType)
end)

RegisterNetEvent('NS-Crafting:client:craftingBluntTableCall', function()
    local benchType = 'blunt_bench'
    openCraftingMenu(benchType)
end)

-- Function to open the crafting menu
function openCraftingMenu(benchType)
    if craftingOpen then return end
    
    currentBenchType = benchType
    craftingOpen = true
    SetNuiFocus(true, true)
    
    QBCore.Functions.Notify('Opening your '..benchType..' crafting menu', 'success')
    
    -- Get player inventory and generate recipe data
    QBCore.Functions.TriggerCallback('crafting:getPlayerInventory', function(inventory)
        local recipes = generateRecipeData(inventory)
        
        -- Send data to NUI
        SendNUIMessage({
            action = 'show',
            laborPoints = PlayerData.metadata['crafting_labor'] or 0,
            proficiencyLevels = generateProficiencyLevels(),
            recipes = recipes
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

-- Generate recipe data for the UI
function generateRecipeData(inventory)
    local recipes = {}
    
    -- Get current XP
    local currentXP = 0
    if PlayerData.metadata and PlayerData.metadata['rep'] and PlayerData.metadata['rep'][xpType] then
        currentXP = PlayerData.metadata['rep'][xpType]
    end
    
    -- Process each bench type from the original config
    for benchType, benchData in pairs(Config) do
        if string.find(benchType, "_bench") then
            local benchRecipes = benchData.recipes or {}
            local benchName = string.gsub(benchType, "_bench", "")
            
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
                
                table.insert(recipes, {
                    name = recipeData.item,
                    displayName = itemLabel,
                    benchType = benchName,
                    benchName = benchName:gsub("^%l", string.upper):gsub("_", " "),
                    labor = 10,
                    time = Config.EnableSkillCheck and 5 or 1,
                    amount = recipeData.yield or 1,
                    proficiency = recipeData.xpRequired or 0,
                    xpGain = recipeData.xpGain or 0,
                    ingredients = ingredients,
                    available = canCraft,
                    icon = Config.ImageBasePath .. (QBCore.Shared.Items[recipeData.item] and QBCore.Shared.Items[recipeData.item].image or 'default.png')
                })
            end
        end
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
    for benchType, benchData in pairs(Config) do
        if string.find(benchType, "_bench") then
            local benchName = string.gsub(benchType, "_bench", "")
            if benchName == recipe.benchType then
                for _, recipeData in pairs(benchData.recipes) do
                    if recipeData.item == recipe.name then
                        requiredItems = recipeData.requiredItems
                        break
                    end
                end
            end
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
    
    TriggerServerEvent('ns-crafting:server:receiveItem', recipe.name, multipliedItems, quantity, recipe.xpGain, xpType, recipe.amount)
    
    -- Close and reopen menu to refresh
    Wait(100)
    closeCraftingMenu()
    Wait(100)
    openCraftingMenu(currentBenchType)
    
    cb('ok')
end)

-- Close menu on ESC
RegisterCommand('+closeCrafting', function()
    if craftingOpen then
        closeCraftingMenu()
    end
end, false)

RegisterKeyMapping('+closeCrafting', 'Close Crafting Menu', 'keyboard', 'ESCAPE')