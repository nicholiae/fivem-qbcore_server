local QBCore = exports['qb-core']:GetCoreObject()
----------- / alcohol

for k, _ in pairs(Config.Consumables.alcohol) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        TriggerClientEvent('consumables:client:DrinkAlcohol', source, item.name)
		-- exports['nc-drugaddiction']:RegisterDrugUse(source, item.name)
    end)
end

----------- / Eat

for k, _ in pairs(Config.Consumables.edibles) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:edibles') then return end
		
		-- exports['nc-drugaddiction']:RegisterDrugUse(source, item.name)
        TriggerClientEvent('consumables:client:edibles', source, item.name)
    end)
end

----------- / Eat

for k, _ in pairs(Config.Consumables.eat) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:eat') then return end
		
        TriggerClientEvent('consumables:client:Eat', source, item.name)
    end)
end

-- weed bricks
for k, _ in pairs(Config.Consumables.largeWeedBricks) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:largeWeedBricks') then return end
        TriggerClientEvent('consumables:client:BreakLargeWeedBrick', source, item.name)
    end)
end

----------- / bricks of fentanyl
for k, _ in pairs(Config.Consumables.fentanylsmallbricks) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:smallfentanylbricks') then return end
        TriggerClientEvent('consumables:client:BreakSmallFentanylBrick', source, item.name)
    end)
end
for k, _ in pairs(Config.Consumables.fentanyllargebricks) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:largefentanylbricks') then return end
        TriggerClientEvent('consumables:client:BreakLargeFentanylBrick', source, item.name)
    end)
end

----------- / bottles of lean
for k, _ in pairs(Config.Consumables.leansmall) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:leansmall') then return end
        TriggerClientEvent('consumables:client:BreakSmallLeanBottle', source, item.name)
    end)
end
for k, _ in pairs(Config.Consumables.leanlarge) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:leanlarge') then return end
        TriggerClientEvent('consumables:client:BreakLargeLeanBottle', source, item.name)
    end)
end


RegisterNetEvent('consumables:server:AddFentanylFromSmallBrick', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:AddItem(source, 'fentanyl', 50, false, false, 'consumables:server:AddFentanylFromSmallBrick')
end)

RegisterNetEvent('consumables:server:AddFentanylFromLargeBrick', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:AddItem(source, 'fentanyl', 100, false, false, 'consumables:server:AddFentanylFromLargeBrick')
end)

----------- / bricks of crack
for k, _ in pairs(Config.Consumables.cracksmallbricks) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:smallcrackbricks') then return end
        TriggerClientEvent('consumables:client:BreakSmallCrackBrick', source, item.name)
    end)
end
for k, _ in pairs(Config.Consumables.cracklargebricks) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:largecrackbricks') then return end
        TriggerClientEvent('consumables:client:BreakLargeCrackBrick', source, item.name)
    end)
end


QBCore.Functions.CreateUseableItem('weaponrepairkit', function(source)
	TriggerClientEvent('consumables:client:RepairWeaponByKit', source)
    exports['qb-inventory']:RemoveItem(source, 'weaponrepairkit', 1, false, 'consumables:server:weaponrepairkit')
end)

RegisterNetEvent('consumables:server:AddCrackFromSmallBrick', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:AddItem(source, 'crack_baggy', 50, false, false, 'consumables:server:AddCrackFromSmallBrick')
end)

RegisterNetEvent('consumables:server:AddCrackFromLargeBrick', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:AddItem(source, 'crack_baggy', 100, false, false, 'consumables:server:AddCrackFromLargeBrick')
end)

RegisterNetEvent('consumables:server:AddLeanFromSmall', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:AddItem(source, 'lean', 50, false, false, 'consumables:server:AddLeanFromSmall')
end)

RegisterNetEvent('consumables:server:AddLeanFromLarge', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:AddItem(source, 'lean', 100, false, false, 'consumables:server:AddLeanFromLarge')
end)

RegisterNetEvent('consumables:server:AddWeedFromLargeBrick', function(weedType)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:AddItem(source, weedType, 100, false, false, 'consumables:server:AddWeedFromLargeBrick')
end)

----------- / bricks of coke
for k, _ in pairs(Config.Consumables.cokesmallbricks) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:smallcokebricks') then return end
        TriggerClientEvent('consumables:client:BreakSmallCokeBrick', source, item.name)
    end)
end
for k, _ in pairs(Config.Consumables.cokelargebricks) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:largecokebricks') then return end
        TriggerClientEvent('consumables:client:BreakLargeCokeBrick', source, item.name)
    end)
end

----------- / bricks of pixie
for k, _ in pairs(Config.Consumables.pixiesmallbricks) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:smallpixiebricks') then return end
        TriggerClientEvent('consumables:client:BreakSmallPixieBrick', source, item.name)
    end)
end
for k, _ in pairs(Config.Consumables.pixielargebricks) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:largepixiebricks') then return end
        TriggerClientEvent('consumables:client:BreakLargePixieBrick', source, item.name)
    end)
end

--pixie bricks 

RegisterNetEvent('consumables:server:AddPixieFromSmallBrick', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:AddItem(source, 'pixiedust', 50, false, false, 'consumables:server:AddPixieFromSmallBrick')
end)

RegisterNetEvent('consumables:server:AddPixieFromLargeBrick', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:AddItem(source, 'pixiedust', 100, false, false, 'consumables:server:AddPixieFromLargeBrick')
end)

--coke bricks 

RegisterNetEvent('consumables:server:AddCokeFromSmallBrick', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:AddItem(source, 'cokebaggy', 50, false, false, 'consumables:server:AddCokeFromSmallBrick')
end)

RegisterNetEvent('consumables:server:AddCokeFromLargeBrick', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:AddItem(source, 'cokebaggy', 100, false, false, 'consumables:server:AddCokeFromLargeBrick')
end)

----------- / pill bottles
for k, _ in pairs(Config.Consumables.xanaxbottle) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:openXanaxBottle') then return end
        TriggerClientEvent('consumables:client:openXanaxBottle', source, item.name)
    end)
end
for k, _ in pairs(Config.Consumables.morphinebottle) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:openMorphineBottle') then return end
        TriggerClientEvent('consumables:client:openMorphineBottle', source, item.name)
    end)
end
for k, _ in pairs(Config.Consumables.oxycodonebottle) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:openOxycodoneBottle') then return end
        TriggerClientEvent('consumables:client:openOxycodoneBottle', source, item.name)
    end)
end
for k, _ in pairs(Config.Consumables.amoxixillinbottle) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:openAmoxixillinBottle') then return end
        TriggerClientEvent('consumables:client:openAmoxixillinBottle', source, item.name)
    end)
end
for k, _ in pairs(Config.Consumables.ibuprofenbottle) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:openIbuprofenBottle') then return end
        TriggerClientEvent('consumables:client:openIbuprofenBottle', source, item.name)
    end)
end

----
----------- / christmas Present
for k, _ in pairs(Config.Consumables.presents) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:openPresent') then return end
        TriggerClientEvent('consumables:client:openPresent', source, item.name)
    end)
end

----------- / packosmokes
for k, _ in pairs(Config.Consumables.packofsmokes) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:opensmokes') then return end
        TriggerClientEvent('consumables:client:BreakCigarettePack', source, item.name)
    end)
end
----------- / cigarettes
for k, _ in pairs(Config.Consumables.cigs) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:UseCigarette') then return end
        TriggerClientEvent('consumables:client:UseCigarette', source, item.name)
		-- exports['nc-drugaddiction']:RegisterDrugUse(source, 'cigs')
    end)
end
for k, _ in pairs(Config.Consumables.lean) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:Uselean') then return end
        TriggerClientEvent('consumables:client:useLean', source, item.name)
		-- exports['nc-drugaddiction']:RegisterDrugUse(source, item.name)
    end)
end

RegisterNetEvent('consumables:server:AddXanax', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:AddItem(source, "xanax", 25, false, false, 'consumables:server:AddXanax')
end)
RegisterNetEvent('consumables:server:givenNarcan', function(targetId)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:RemoveItem(source, "narcan", 1, false, false, 'consumables:server:narcan')
    TriggerClientEvent('consumables:client:givenNarcan', targetId)
end)
RegisterNetEvent('consumables:server:AddMorphine', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:AddItem(source, "morphine", 25, false, false, 'consumables:server:AddMorphine')
end)
RegisterNetEvent('consumables:server:AddIbuprofen', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:AddItem(source, "ibuprofen", 25, false, false, 'consumables:server:AddIbuprofen')
end)
RegisterNetEvent('consumables:server:AddAmoxixillin', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:AddItem(source, "amoxixillin", 25, false, false, 'consumables:server:AddAmoxixillin')
end)
RegisterNetEvent('consumables:server:AddOxycodone', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:AddItem(source, "oxycodone", 25, false, false, 'consumables:server:AddOxycodone')
end)

RegisterNetEvent('consumables:server:AddPresentItem', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
	local randoNumber = math.random(1,10)
	local randoPresentItem = Config.PresentItems[math.random(1,#Config.PresentItems)]
    exports['qb-inventory']:AddItem(source, randoPresentItem, randoNumber, false, false, 'consumables:server:AddPresentItem')
end)

RegisterNetEvent('consumables:server:AddCigarette', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:AddItem(source, 'cigarette', 20, false, false, 'consumables:server:AddCigarette')
end)

----------- / DrinkShake
for k, _ in pairs(Config.Consumables.drinkshakes) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:DrinkShake') then return end
        TriggerClientEvent('consumables:client:DrinkShake', source, item.name)
    end)
end
----------- / Drink
for k, _ in pairs(Config.Consumables.drink) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:drink') then return end
        TriggerClientEvent('consumables:client:Drink', source, item.name)
    end)
end

----------- / topShelf
for k, _ in pairs(Config.Consumables.topShelfDrink) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:topShelfDrink') then return end
        TriggerClientEvent('consumables:client:topShelfDrink', source, item.name)
		-- exports['nc-drugaddiction']:RegisterDrugUse(source, 'whiskey')
    end)
end

for k, _ in pairs(Config.Consumables.topShelfEat) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:topShelfEat') then return end
        TriggerClientEvent('consumables:client:topShelfEat', source, item.name)
    end)
end

----------- / Custom
for k, _ in pairs(Config.Consumables.custom) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:custom') then return end
        TriggerClientEvent('consumables:client:Custom', source, item.name)
    end)
end

local function createItem(name, type)
    QBCore.Functions.CreateUseableItem(name, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:consumables:createItem') then return end
        TriggerClientEvent('consumables:client:' .. type, source, item.name)
    end)
end
----------- / Drug

for k, _ in pairs(Config.Consumables.weed) do
	QBCore.Functions.CreateUseableItem(k, function(source, item)
		local Player = QBCore.Functions.GetPlayer(source)
		if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:joint') then return end
		TriggerClientEvent('consumables:client:UseJoint', source, item.name)
		-- exports['nc-drugaddiction']:RegisterDrugUse(source, item.name)
	end)
end

----------- / joint

for k, _ in pairs(Config.Consumables.joint) do
	QBCore.Functions.CreateUseableItem(k, function(source, item)
		local Player = QBCore.Functions.GetPlayer(source)
		if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:joint') then return end
		TriggerClientEvent('consumables:client:UseJoint', source, item.name)
		-- exports['nc-drugaddiction']:RegisterDrugUse(source, item.name)
			
	end)
end

----------- / blunt

for k, _ in pairs(Config.Consumables.blunt) do
	QBCore.Functions.CreateUseableItem(k, function(source, item)
		local Player = QBCore.Functions.GetPlayer(source)
		if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:blunt') then return end
		TriggerClientEvent('consumables:client:UseBlunt', source, item.name)
		-- exports['nc-drugaddiction']:RegisterDrugUse(source, item.name)
	end)
end
			
			
QBCore.Functions.CreateUseableItem('pixiedust', function(source)
    TriggerClientEvent('consumables:client:Pixiebaggy', source)
	-- exports['nc-drugaddiction']:RegisterDrugUse(source, 'pixiedust')
end)

QBCore.Functions.CreateUseableItem('cokebaggy', function(source)
    TriggerClientEvent('consumables:client:Cokebaggy', source)
	-- exports['nc-drugaddiction']:RegisterDrugUse(source, 'cokebaggy')
end)

QBCore.Functions.CreateUseableItem('fentanyl', function(source)
    TriggerClientEvent('consumables:client:fentanyl', source)
	-- exports['nc-drugaddiction']:RegisterDrugUse(source, 'fentanyl')
end)

QBCore.Functions.CreateUseableItem('narcan', function(source)
	local Player = QBCore.Functions.GetPlayer(source)
    if not Player.Functions.GetItemByName('narcan') then return end
	exports['qb-inventory']:RemoveItem(source, 'narcan', 1, false, 'qb-smallresources:narcan')
    TriggerClientEvent('consumables:client:giveNarcan', source)
    TriggerEvent('nc-drugaddiction:server:UseNarcan')
	
end)

QBCore.Functions.CreateUseableItem('crack_baggy', function(source)
    TriggerClientEvent('consumables:client:Crackbaggy', source)
	-- exports['nc-drugaddiction']:RegisterDrugUse(source, 'crack_baggy')
end)

QBCore.Functions.CreateUseableItem('xtcbaggy', function(source)
    TriggerClientEvent('consumables:client:EcstasyBaggy', source)
	-- exports['nc-drugaddiction']:RegisterDrugUse(source, 'xtcbaggy')
end)

QBCore.Functions.CreateUseableItem('oxy', function(source)
    TriggerClientEvent('consumables:client:oxy', source)
	-- exports['nc-drugaddiction']:RegisterDrugUse(source, 'oxy')
end)

QBCore.Functions.CreateUseableItem('meth', function(source)
    TriggerClientEvent('consumables:client:meth', source)
	-- exports['nc-drugaddiction']:RegisterDrugUse(source, 'meth')
end)

----------- / Tools

QBCore.Functions.CreateUseableItem('armor', function(source)
    TriggerClientEvent('consumables:client:UseArmor', source)
end)

QBCore.Functions.CreateUseableItem('heavyarmor', function(source)
    TriggerClientEvent('consumables:client:UseHeavyArmor', source)
end)

QBCore.Functions.CreateUseableItem('med_bodyarmor', function(source)
    TriggerClientEvent('consumables:client:UseMedArmor', source)
end)

QBCore.Commands.Add('resetarmor', 'Resets Vest (Police Only)', {}, false, function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == 'police' then
        TriggerClientEvent('consumables:client:ResetArmor', source)
    else
        TriggerClientEvent('QBCore:Notify', source, 'For Police Officer Only', 'error')
    end
end)

QBCore.Functions.CreateUseableItem('binoculars', function(source)
    TriggerClientEvent('binoculars:Toggle', source)
end)

QBCore.Functions.CreateUseableItem('parachute', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if not exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-smallresources:parachute') then return end
    TriggerClientEvent('consumables:client:UseParachute', source)
end)

QBCore.Commands.Add('resetparachute', 'Resets Parachute', {}, false, function(source)
    TriggerClientEvent('consumables:client:ResetParachute', source)
end)

----------- / Firework

for _, v in pairs(Config.Fireworks.items) do
    QBCore.Functions.CreateUseableItem(v, function(source, item)
        local src = source
        TriggerClientEvent('fireworks:client:UseFirework', src, item.name, 'proj_indep_firework')
    end)
end

----------- / Lockpicking

QBCore.Functions.CreateUseableItem('lockpick', function(source)
    TriggerClientEvent('lockpicks:UseLockpick', source, false)
end)

QBCore.Functions.CreateUseableItem('advancedlockpick', function(source)
    TriggerClientEvent('lockpicks:UseLockpick', source, true)
end)

-- Events for adding and removing specific items to fix some exploits

RegisterNetEvent('consumables:server:AddParachute', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:AddItem(source, 'parachute', 1, false, false, 'consumables:server:AddParachute')
end)

RegisterNetEvent('consumables:server:resetArmor', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:AddItem(source, 'heavyarmor', 1, false, false, 'consumables:server:resetArmor')
end)

RegisterNetEvent('consumables:server:UseMedArmor', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    if not exports['qb-inventory']:RemoveItem(source, 'med_bodyarmor', 1, false, 'consumables:server:med_bodyarmor') then return end
    TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items['med_bodyarmor'], 'remove')
    TriggerClientEvent('hospital:server:SetArmor', source, 100)
    SetPedArmour(GetPlayerPed(source), 100)
end)

RegisterNetEvent('consumables:server:useHeavyArmor', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    if not exports['qb-inventory']:RemoveItem(source, 'heavyarmor', 1, false, 'consumables:server:useHeavyArmor') then return end
    TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items['heavyarmor'], 'remove')
    TriggerClientEvent('hospital:server:SetArmor', source, 100)
    SetPedArmour(GetPlayerPed(source), 100)
end)

RegisterNetEvent('consumables:server:useArmor', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    if not exports['qb-inventory']:RemoveItem(source, 'armor', 1, false, 'consumables:server:useArmor') then return end
    TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items['armor'], 'remove')
    TriggerClientEvent('hospital:server:SetArmor', source, 75)
    SetPedArmour(GetPlayerPed(source), 75)
end)

RegisterNetEvent('consumables:server:useMeth', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:RemoveItem(source, 'meth', 1, false, 'consumables:server:useMeth')
	exports['nc-drugaddiction']:RegisterDrugUse(source, 'meth')
end)

RegisterNetEvent('consumables:server:useFentanyl', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:RemoveItem(source, 'fentanyl', 1, false, 'consumables:server:useFentanyl')
	exports['nc-drugaddiction']:RegisterDrugUse(source, 'fentanyl')
end)

RegisterNetEvent('consumables:server:useOxy', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:RemoveItem(source, 'oxy', 1, false, 'consumables:server:useOxy')
	exports['nc-drugaddiction']:RegisterDrugUse(source, 'oxy')
end)

RegisterNetEvent('consumables:server:useXTCBaggy', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:RemoveItem(source, 'xtcbaggy', 1, false, 'consumables:server:useXTCBaggy')
	exports['nc-drugaddiction']:RegisterDrugUse(source, 'xtcbaggy')
end)

RegisterNetEvent('consumables:server:useCrackBaggy', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:RemoveItem(source, 'crack_baggy', 1, false, 'consumables:server:useCrackBaggy')
	exports['nc-drugaddiction']:RegisterDrugUse(source, 'crack_baggy')
end)

RegisterNetEvent('consumables:server:useCokeBaggy', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:RemoveItem(source, 'cokebaggy', 1, false, 'consumables:server:useCokeBaggy')
	exports['nc-drugaddiction']:RegisterDrugUse(source, 'cokebaggy')
end)

RegisterNetEvent('consumables:server:usePixieBaggy', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    exports['qb-inventory']:RemoveItem(source, 'pixiedust', 1, false, 'consumables:server:usePixieBaggy')
	exports['nc-drugaddiction']:RegisterDrugUse(source, 'pixiedust')
end)


RegisterNetEvent('consumables:server:drinkAlcohol', function(item)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    local foundItem = nil

    for k in pairs(Config.Consumables.alcohol) do
        if k == item then
            foundItem = k
            break
        end
    end

    if not foundItem then return end
    exports['qb-inventory']:RemoveItem(source, foundItem, 1, false, 'consumables:server:drinkAlcohol')
	exports['nc-drugaddiction']:RegisterDrugUse(source, item)
end)

RegisterNetEvent('consumables:server:UseFirework', function(item)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    local foundItem = nil

    for i = 1, #Config.Fireworks.items do
        if Config.Fireworks.items[i] == item then
            foundItem = Config.Fireworks.items[i]
            break
        end
    end

    if not foundItem then return end
    exports['qb-inventory']:RemoveItem(source, foundItem, 1, false, 'consumables:server:UseFirework')
end)

RegisterNetEvent('consumables:server:addThirst', function(amount)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.SetMetaData('thirst', amount)
    TriggerClientEvent('hud:client:UpdateNeeds', source, Player.PlayerData.metadata.hunger, amount)
	-- print(math.floor(amount/10))
    TriggerEvent('hud:server:ReduceBioOne', math.floor(amount/15), source)
end)

RegisterNetEvent('consumables:server:RepairWeaponByKit', function(amount)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
	TriggerClientEvent('qb-weapons:client:SetWeaponQuality', source, tonumber(amount))
end)

RegisterNetEvent('consumables:server:addHunger', function(amount)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.SetMetaData('hunger', amount)
    TriggerClientEvent('hud:client:UpdateNeeds', source, amount, Player.PlayerData.metadata.thirst)
	-- print(math.floor(amount/12))
    TriggerEvent('hud:server:ReduceBioTwo', math.floor(amount/18), source)
end)

QBCore.Functions.CreateCallback('consumables:itemdata', function(_, cb, itemName)
    cb(Config.Consumables.custom[itemName])
end)

---Checks if item already exists in the table. If not, it creates it.
---@param drinkName string name of item
---@param replenish number amount it replenishes
---@return boolean, string
local function addDrink(drinkName, replenish)
    if Config.Consumables.drink[drinkName] ~= nil then
        return false, 'already added'
    else
        Config.Consumables.drink[drinkName] = replenish
        createItem(drinkName, 'Drink')
        return true, 'success'
    end
end

exports('AddDrink', addDrink)

---Checks if item already exists in the table. If not, it creates it.
---@param foodName string name of item
---@param replenish number amount it replenishes
---@return boolean, string
local function addFood(foodName, replenish)
    if Config.Consumables.eat[foodName] ~= nil then
        return false, 'already added'
    else
        Config.Consumables.eat[foodName] = replenish
        createItem(foodName, 'Eat')
        return true, 'success'
    end
end

exports('AddFood', addFood)

---Checks if item already exists in the table. If not, it creates it.
---@param alcoholName string name of item
---@param replenish number amount it replenishes
---@return boolean, string
local function addAlcohol(alcoholName, replenish)
    if Config.Consumables.alcohol[alcoholName] ~= nil then
        return false, 'already added'
    else
        Config.Consumables.alcohol[alcoholName] = replenish
        createItem(alcoholName, 'DrinkAlcohol')
        return true, 'success'
    end
end

exports('AddAlcohol', addAlcohol)

---Checks if item already exists in the table. If not, it creates it.
---@param itemName string name of item
---@param data number amount it replenishes
---@return boolean, string
local function addCustom(itemName, data)
    if 'consumables:itemdata' ~= nil then
        return false, 'already added'
    else
        Config.Consumables.custom[itemName] = data
        createItem(itemName, 'Custom')
        return true, 'success'
    end
end

exports('AddCustom', addCustom)
