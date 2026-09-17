-- ============================================
-- NS-CallGirl Enhanced with Custom Prostitute Models
-- Using Freemode Peds with Full Clothing Control
-- INTEGRATED VERSION with Full Phase Logic
-- ============================================

local QBCore = exports['qb-core']:GetCoreObject()
local clothingused = 0
local outfitData = {}
local MissionStart
local madam
local hoe
local firstphase
local secondphase
local thirdphase
local bonusphase = false
local pdist = 10
local startedPhase = 0
local startedSecondPhase = 0
local startedThirdPhase = 0
local ploc
local hloc
local hoeDist = 10
local pbeddist = 10
local hoeBedDist = 10
local penddist = 10
local hoeendDist = 10
local activeStatus
local currentProstituteIndex = 1
local currentProstituteModel = nil
local menuOpen = false
local isNaked = false

-- Functions

-- Apply full appearance to prostitute ped
function ApplyProstituteAppearance(ped, prostituteIndex, state)
    local prostitute = Config.Prostitutes[prostituteIndex]
    if not prostitute then return end
    
    local appearance = prostitute.appearance
    
    -- ===== FACE BLEND (HERITAGE) =====
    SetPedHeadBlendData(ped, 
        appearance.face.item,           -- Mother's face
        appearance.face2.item,          -- Father's face
        nil,                            -- Third parent (unused)
        appearance.face.texture,        -- Mother's skin tone
        appearance.face2.texture,       -- Father's skin tone
        nil,                            -- Third parent skin (unused)
        appearance.facemix.shapeMix,    -- Shape mix (0.0-1.0)
        appearance.facemix.skinMix,     -- Skin mix (0.0-1.0)
        nil,                            -- Third parent mix (unused)
        true                            -- Is parent
    )
    
    -- ===== FACIAL FEATURES (STRUCTURE) =====
    -- Values are 0-10 in config, divide by 10 to get -1.0 to 1.0 range
    SetPedFaceFeature(ped, 0, appearance.nose_0.item / 10.0)                -- Nose Width
    SetPedFaceFeature(ped, 1, appearance.nose_1.item / 10.0)                -- Nose Peak Height
    SetPedFaceFeature(ped, 2, appearance.nose_2.item / 10.0)                -- Nose Peak Length
    SetPedFaceFeature(ped, 3, appearance.nose_3.item / 10.0)                -- Nose Bone Height
    SetPedFaceFeature(ped, 4, appearance.nose_4.item / 10.0)                -- Nose Peak Lowering
    SetPedFaceFeature(ped, 5, appearance.nose_5.item / 10.0)                -- Nose Bone Twist
    SetPedFaceFeature(ped, 6, appearance.eyebrown_high.item / 10.0)         -- Eyebrow Height
    SetPedFaceFeature(ped, 7, appearance.eyebrown_forward.item / 10.0)      -- Eyebrow Forward
    SetPedFaceFeature(ped, 8, appearance.cheek_1.item / 10.0)               -- Cheek Bone Height
    SetPedFaceFeature(ped, 9, appearance.cheek_2.item / 10.0)               -- Cheek Bone Width
    SetPedFaceFeature(ped, 10, appearance.cheek_3.item / 10.0)              -- Cheeks Width
    SetPedFaceFeature(ped, 11, appearance.eye_opening.item / 10.0)          -- Eye Opening
    SetPedFaceFeature(ped, 12, appearance.lips_thickness.item / 10.0)       -- Lips Thickness
    SetPedFaceFeature(ped, 13, appearance.jaw_bone_width.item / 10.0)       -- Jaw Bone Width
    SetPedFaceFeature(ped, 14, appearance.jaw_bone_back_lenght.item / 10.0) -- Jaw Bone Back Length
    SetPedFaceFeature(ped, 15, appearance.chimp_bone_lowering.item / 10.0)  -- Chin Bone Lowering
    SetPedFaceFeature(ped, 16, appearance.chimp_bone_lenght.item / 10.0)    -- Chin Bone Length
    SetPedFaceFeature(ped, 17, appearance.chimp_bone_width.item / 10.0)     -- Chin Bone Width
    SetPedFaceFeature(ped, 18, appearance.chimp_hole.item / 10.0)           -- Chin Hole
    SetPedFaceFeature(ped, 19, appearance.neck_thikness.item / 10.0)        -- Neck Thickness
    
    -- ===== HAIR =====
    SetPedComponentVariation(ped, 2, appearance.hair.item, 0, 0)
    SetPedHairColor(ped, appearance.hair.texture, appearance.hair.texture)
    
    -- ===== OVERLAYS (MAKEUP, EYEBROWS, ETC.) =====
    -- Eyebrows
    SetPedHeadOverlay(ped, 2, appearance.eyebrows.item, 1.0)
    SetPedHeadOverlayColor(ped, 2, 1, appearance.eyebrows.texture, 0)
    
    -- Beard (should be -1 for females)
    if appearance.beard.item ~= -1 then
        SetPedHeadOverlay(ped, 1, appearance.beard.item, 1.0)
        SetPedHeadOverlayColor(ped, 1, 1, appearance.beard.texture, 0)
    end
    
    -- Blush
    if appearance.blush.item ~= -1 then
        SetPedHeadOverlay(ped, 5, appearance.blush.item, 1.0)
        SetPedHeadOverlayColor(ped, 5, 2, appearance.blush.texture, 0)
    end
    
    -- Lipstick
    if appearance.lipstick.item ~= -1 then
        SetPedHeadOverlay(ped, 8, appearance.lipstick.item, 1.0)
        SetPedHeadOverlayColor(ped, 8, 2, appearance.lipstick.texture, 0)
    end
    
    -- Makeup
    if appearance.makeup.item ~= -1 then
        SetPedHeadOverlay(ped, 4, appearance.makeup.item, 1.0)
        SetPedHeadOverlayColor(ped, 4, 2, appearance.makeup.texture, 0)
    end
    
    -- Ageing
    if appearance.ageing.item ~= -1 then
        SetPedHeadOverlay(ped, 3, appearance.ageing.item, 1.0)
    end
    
    -- Moles
    if appearance.moles.item ~= 0 then
        SetPedHeadOverlay(ped, 9, appearance.moles.item, appearance.moles.texture / 10.0)
    end
    
    -- ===== EYE COLOR =====
    SetPedEyeColor(ped, appearance.eye_color.item)
    
    -- ===== CLOTHING BASED ON STATE =====
    local clothing = state == "naked" and prostitute.naked or prostitute.lingerie
    
    -- Component 3: Arms/Torso
    SetPedComponentVariation(ped, 3, clothing.arms.drawable, clothing.arms.texture, 0)
    
    -- Component 8: Undershirt/T-Shirt
    SetPedComponentVariation(ped, 8, clothing["t-shirt"].drawable, clothing["t-shirt"].texture, 0)
    
    -- Component 11: Torso2/Jacket (bra/topless)
    SetPedComponentVariation(ped, 11, clothing.torso2.drawable, clothing.torso2.texture, 0)
    
    -- Component 4: Pants/Legs
    SetPedComponentVariation(ped, 4, clothing.pants.drawable, clothing.pants.texture, 0)
    
    -- Component 6: Shoes
    SetPedComponentVariation(ped, 6, clothing.shoes.drawable, clothing.shoes.texture, 0)
    
    -- Component 9: Vest
    SetPedComponentVariation(ped, 9, clothing.vest.drawable, clothing.vest.texture, 0)
    
    -- Component 5: Bag
    SetPedComponentVariation(ped, 5, clothing.bag.drawable, clothing.bag.texture, 0)
    
    -- Component 7: Accessory
    SetPedComponentVariation(ped, 7, clothing.accessory.drawable, clothing.accessory.texture, 0)
    
    -- Component 10: Decals
    SetPedComponentVariation(ped, 10, clothing.decals.drawable, clothing.decals.texture, 0)
    
    -- Component 1: Mask
    SetPedComponentVariation(ped, 1, clothing.mask.drawable, clothing.mask.texture, 0)
    
    -- ===== PROPS =====
    -- Hat (Prop 0)
    if clothing.hat.drawable ~= -1 and clothing.hat.drawable ~= 0 then
        SetPedPropIndex(ped, 0, clothing.hat.drawable, clothing.hat.texture, true)
    else
        ClearPedProp(ped, 0)
    end
    
    -- Glasses (Prop 1)
    if clothing.glass.drawable ~= -1 and clothing.glass.drawable ~= 0 then
        SetPedPropIndex(ped, 1, clothing.glass.drawable, clothing.glass.texture, true)
    else
        ClearPedProp(ped, 1)
    end
    
    -- Ear (Prop 2)
    if clothing.ear.drawable ~= -1 and clothing.ear.drawable ~= 0 then
        SetPedPropIndex(ped, 2, clothing.ear.drawable, clothing.ear.texture, true)
    else
        ClearPedProp(ped, 2)
    end
    
    -- Watch (Prop 6)
    if clothing.watch.drawable ~= -1 and clothing.watch.drawable ~= 0 then
        SetPedPropIndex(ped, 6, clothing.watch.drawable, clothing.watch.texture, true)
    else
        ClearPedProp(ped, 6)
    end
    
    -- Bracelet (Prop 7)
    if clothing.bracelet.drawable ~= -1 and clothing.bracelet.drawable ~= 0 then
        SetPedPropIndex(ped, 7, clothing.bracelet.drawable, clothing.bracelet.texture, true)
    else
        ClearPedProp(ped, 7)
    end
    
    if Config.Debug then
        print("Applied " .. state .. " appearance to " .. prostitute.name)
        print("Face: " .. appearance.face.item .. ", Hair: " .. appearance.hair.item .. ", Eyes: " .. appearance.eye_color.item)
    end
end

-- Spawn prostitute with lingerie
function SpawnHoe(prostituteIndex)
    local prostitute = Config.Prostitutes[prostituteIndex]
    if not prostitute then return end
    
    local model = prostitute.model
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
    
    hoe = CreatePed(4, model, Config.HoeSpawn.x, Config.HoeSpawn.y, Config.HoeSpawn.z, 0.0, false, false)
    SetEntityAsMissionEntity(hoe, true, true)
    SetBlockingOfNonTemporaryEvents(hoe, true)
    -- FreezeEntityPosition(hoe, true)
    SetEntityInvincible(hoe, true)
    
    -- Apply lingerie appearance
    ApplyProstituteAppearance(hoe, prostituteIndex, "lingerie")
    isNaked = false
    
    currentProstituteIndex = prostituteIndex
    currentProstituteModel = prostituteIndex
    
    if Config.Debug then
        print("Spawned " .. prostitute.name .. " in lingerie")
    end
end

-- Transition prostitute from lingerie to naked
function MakeProstituteNaked()
    if not hoe or not DoesEntityExist(hoe) then return end
    if isNaked then return end -- Already naked
    
    ApplyProstituteAppearance(hoe, currentProstituteIndex, "naked")
    isNaked = true
    
    if Config.Debug then
        print("Prostitute is now naked")
    end
end

function GetUnNaked()
    if Config.Debug == true then
        print("No Longer Naked")
    end
    if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then --male
        TriggerEvent('qb-clothing:client:loadOutfit', {
            outfitData = {
                ["arms"] = { item = 6, texture = 0 },
                ["t-shirt"] = { item = 31, texture = 0 },
                ["torso2"] = { item = 192, texture = 11 },
                ["pants"] = { item = 20, texture = 0 },
                ["shoes"] = { item = 75, texture = 0 },
                ["glass"] = { item = 10, texture = 5 }
            }
        })
    else
        TriggerEvent('qb-clothing:client:loadOutfit', {        --female
            outfitData = {
                ["arms"] = { item = 356, texture = 0 },
                ["t-shirt"] = { item = 6, texture = 0 },
                ["torso2"] = { item = 726, texture = 1 },
                ["pants"] = { item = 233, texture = 0 },
                ["shoes"] = { item = 201, texture = 0 },
                ["glass"] = { item = 6, texture = 0 }
            }
        })
    end
end

local function LoadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end
end

function GetNaked()
    if Config.Debug == true then
        print("Player getting naked")
    end
    
    -- Player gets naked
    if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then -- Male player
        TriggerEvent('qb-clothing:client:loadOutfit', {
            outfitData = {
                ["arms"] = { item = 15, texture = 0 },
                ["t-shirt"] = { item = 15, texture = 0 },
                ["torso2"] = { item = 15, texture = 0 },
                ["pants"] = { item = 21, texture = 0 },
                ["shoes"] = { item = 34, texture = 0 },
                ["glass"] = { item = 0, texture = 0 }
            }
        })
    else -- Female player
        TriggerEvent('qb-clothing:client:loadOutfit', {
            outfitData = {
                ["arms"] = { item = 15, texture = 0 },
                ["t-shirt"] = { item = 14, texture = 0 },
                ["torso2"] = { item = -1, texture = 0 },
                ["pants"] = { item = 193, texture = 0 },
                ["shoes"] = { item = 35, texture = 0 },
                ["glass"] = { item = 0, texture = 0 }
            }
        })
    end
end

local function LeaveThisBitch()
    clothingused = 1
    DoScreenFadeOut(250)
    Wait(500)
    SetEntityCoords(PlayerPedId(), Config.ExitLocation.x, Config.ExitLocation.y, Config.ExitLocation.z+1)
    Wait(500)
    if Config.Debug == true then
        print("Left This Bitch")
    end
    TriggerServerEvent('hud:server:RelieveStress', 100)
    QBCore.Functions.Notify('You are stressfree!', "success")
    TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING_POT_CLUBHOUSE", 0, false)
    DoScreenFadeIn(250)
	-- Award reputation for Completion
	if currentProstituteModel ~= nil then
		TriggerServerEvent('ns-callgirl:server:updateReputation', currentProstituteModel, Config.ReputationGain.perfect_service, true)
		QBCore.Functions.Notify('Reputation +'..Config.ReputationGain.perfect_service, 'success')
		TriggerServerEvent('ns-callgirl:server:incrementInteractions', currentProstituteModel)
	end
    Wait(500)
end

local function hintToDisplay(text)
    exports['qb-core']:DrawText(text)
end

function hideLastHint()
    exports['qb-core']:HideText()
end

-- Reputation system functions
function CalculateTier(reputation)
    for tier = 5, 1, -1 do
        if reputation >= Config.ReputationTiers[tier].min then
            return tier
        end
    end
    return 1
end

function CalculatePrice(tier)
    local tierData = Config.ReputationTiers[tier]
    if tierData.min >= 81 then
        return 0
    end
    local discount = tierData.bonus
    return math.floor(Config.BaseActivationCost * (1 - discount))
end

function GetProstitutesData()
    local p = promise.new()
    
    QBCore.Functions.TriggerCallback('ns-callgirl:server:getAllRelationships', function(data)
        p:resolve(data)
    end)
    
    return Citizen.Await(p)
end

-- Selection menu functions
function OpenSelectionMenu()
    if menuOpen then return end
    
    local prostitutesData = GetProstitutesData()
    
    if not prostitutesData or #prostitutesData == 0 then
        QBCore.Functions.Notify('No companions available', 'error')
        return
    end
    
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openMenu',
        prostitutes = prostitutesData
    })
    
    menuOpen = true
end

function CloseSelectionMenu()
    if not menuOpen then return end
    
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = 'closeMenu'
    })
    
    menuOpen = false
end
RegisterNUICallback('selectProstitute', function(data, cb)
    local selectedIndex = data.model
    CloseSelectionMenu()
    
    -- Get relationship data for pricing
    QBCore.Functions.TriggerCallback('ns-callgirl:server:getRelationshipData', function(relationshipData)
        if not relationshipData then
            QBCore.Functions.Notify('Error loading companion data', 'error')
            return
        end
        
        local tier = relationshipData.tier or 1
        local price = CalculatePrice(tier)
        
        -- Check if player can afford
        QBCore.Functions.TriggerCallback('ns-callgirl:server:canAfford', function(canAfford)
            if canAfford then
                -- Charge player
                TriggerServerEvent('ns-callgirl:server:chargePlayer', price, selectedIndex)  -- ✅ Still send index (server will convert)
                
                -- Start the service
                currentProstituteIndex = selectedIndex
                StartCallGirlService(selectedIndex)
            else
                QBCore.Functions.Notify('You cannot afford this service ($' .. price .. ')', 'error')
            end
        end, price)
    end, selectedIndex)  -- ✅ Still send index (server will convert)
    
    cb('ok')
end)

RegisterNUICallback('closeMenu', function(data, cb)
    CloseSelectionMenu()
    cb('ok')
end)

function StartCallGirlService(prostituteIndex)
    -- Reset all phase variables
    firstphase = 0
    secondphase = 0
    thirdphase = 0
    startedPhase = 0
    startedSecondPhase = 0
    startedThirdPhase = 0
    pdist = 10
    hoeDist = 10
    pbeddist = 10
    hoeBedDist = 10
    penddist = 10
    hoeendDist = 10
    clothingused = 0
    
    -- Spawn prostitute in lingerie
    SpawnHoe(prostituteIndex)
    
    -- Start mission interaction
    Wait(1000)
    MissionStart = 1
    startMission()
end

-- Mission interaction (approach prostitute to start)
function startMission()
    CreateThread(function()
        while MissionStart == 1 do
            if Config.Debug == true then
                print("MissionStart: loop")
            end
            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local hoeCoords = GetEntityCoords(hoe)
            local dist = #(plyCoords - hoeCoords)
            local sleep = 500
            if dist >= 2.5 then
                sleep = 0
                DrawMarker(0, hoeCoords.x, hoeCoords.y, hoeCoords.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 135, 31, 35, 100, 1, 0, 0, 0)
            else
                hintToDisplay('Press [E] to get busy')
                sleep = 5
                if IsControlJustPressed(0, 38) then
                    if Config.Debug == true then
                        print("Pressed Start Button")
                    end
                    hideLastHint()
                    StartThisBitch()
                end
            end
            
            Wait(sleep)
        end
    end)
end

-- Phase 1: Blowjob (Keep lingerie)
function StartThisBitch()
    if Config.Debug then
        print("Starting Phase 1 - Blowjob (Lingerie)")
    end
    
    MissionStart = 0
    hideLastHint()
    CreateThread(function()
        local plyCoords = GetEntityCoords(PlayerPedId())
        local hoeCoords = GetEntityCoords(hoe)
        local sleep = 1
        local wallspot = vector3(334.0, 426.35, 145.57)
        DoScreenFadeOut(500)
        Wait(1000)
            GetNaked()	
        DoScreenFadeIn(500)	
        Wait(1000)
        while thirdphase == 0 do
            if Config.Debug == true then
                print("Start Phase")
            end
            TaskGoStraightToCoord(hoe, wallspot.x,wallspot.y,wallspot.z, 1.0, -1, 0.0, 0.0)
        
            while hoeDist > 0.25 do
                hoeCoords = GetEntityCoords(hoe)
                hoeDist = #(wallspot - hoeCoords)
                Wait(1000)
                if Config.Debug == true then
                    print("Start Phase: hoe dist"..tostring(hoeDist).." to wallspot")
                end
            end
            TaskTurnPedToFaceEntity(hoe, PlayerPedId(), 1000)
            Wait(1000)
            FreezeEntityPosition(hoe,true)
            while pdist > 0.75 do
                ploc = GetEntityCoords(PlayerPedId())
                hloc = GetEntityCoords(hoe)
                pdist = #(hloc - ploc)
                DrawMarker(0, hloc.x, hloc.y, hloc.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 135, 31, 35, 100, 1, 0, 0, 0)
                Wait(0)
                if Config.Debug == true then
                    print("Start Phase: ped dist"..tostring(pdist).." to hoe")
                end
            end
            TaskTurnPedToFaceEntity(PlayerPedId(), hoe, 1000)
            Wait(1000)
            startedPhase = 1
            while startedPhase == 1 do
                if Config.Debug == true then
                    print("Start Phase: Started action")
                end
                sleep = Config.BlowTime
                local flib = 'misscarsteal2pimpsex'
                local fanim = 'pimpsex_hooker'
                LoadAnimDict(flib)
                TaskPlayAnim(hoe,flib,fanim, 3.0, 3.0, sleep*1000, 1, 0.15, 0, 0, 0)
                
                local mlib = 'misscarsteal2pimpsex'
                local manim = 'pimpsex_punter'
                LoadAnimDict(mlib)
                TaskPlayAnim(PlayerPedId(), mlib, manim, 3.0, 3.0, sleep*1000, 1, 0.15, 0, 0, 0)
                
                QBCore.Functions.Progressbar('gettingthishoe', 'Getting Head healin', sleep*1000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = false,
                }, {}, {}, {}, function()
                    Wait(1000)
                    if Config.Debug == true then
                        print("Start Phase: Ending action")
                    end
                    
                    if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then
                        SetEntityHealth(PlayerPedId(),GetEntityMaxHealth(PlayerPedId()))
                    else
                        SetEntityHealth(PlayerPedId(),GetEntityMaxHealth(PlayerPedId())+100)
                    end
                    QBCore.Functions.Notify('Healed by the power of Sex!', 'success')
                    
                   -- At end of phase 1, award reputation
					if currentProstituteIndex then
						TriggerServerEvent('ns-callgirl:server:updateReputation', currentProstituteIndex, 1.0)  -- ✅ Send index (server converts)
						QBCore.Functions.Notify('Reputation +1.0', 'success')
					end
                    
                    DoScreenFadeOut(500)
                    Wait(1000)
                    StartSecondPhase()
                    thirdphase = 1
                                                
                end,
				function()
                    
                    QBCore.Functions.Notify('You stopped before she was finished!!', 'warning')
                    
                    -- reputation loss for exit
                    if currentProstituteModel then
                        TriggerServerEvent('ns-callgirl:server:updateReputation', currentProstituteModel, Config.ReputationLoss.early_exit, true)
                        QBCore.Functions.Notify('Reputation -'..Config.ReputationLoss.early_exit, 'warning')
                    end
                    
                    DoScreenFadeOut(500)
                    Wait(1000)
                    StartSecondPhase()
                    thirdphase = 1
                                                
                end)
                Wait(sleep*2000)
                if Config.Debug == true then
                    print("Start Phase: Wait inside StartedPhase")
                end
            end
        end
        Wait(sleep*1000)
        if Config.Debug == true then
            print("Start Phase: Wait Outside")
        end
    end)
end

-- Phase 2: Doggy Style (Transition to naked)
function StartSecondPhase()
    if Config.Debug then
        print("Starting Phase 2 - Doggy Style (Getting Naked)")
    end
    
    hideLastHint()
    startedPhase = 0
    ClearPedTasks(hoe)
    Wait(1000)
    
    -- CRITICAL: Make prostitute naked for this phase
    MakeProstituteNaked()
    
    local bedcoords = vector3(331.23, 423.73, 146.29)
    SetEntityCoords(hoe, bedcoords.x, bedcoords.y, bedcoords.z)
    local pheading = GetEntityHeading(PlayerPedId())
    SetEntityHeading(hoe,pheading)
    
    DoScreenFadeIn(250)
    local plyCoords = GetEntityCoords(PlayerPedId())
    local hoeCoords = GetEntityCoords(hoe)
    local sleep = 1
    
    ClearPedTasks(hoe)
    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(hoe,false)
    CreateThread(function()
        while secondphase == 0 do
            if Config.Debug == true then
                print("Second Phase")
            end
            while hoeBedDist > 0.25 do
                hoeCoords = GetEntityCoords(hoe)
                hoeBedDist = #(bedcoords - hoeCoords)
                Wait(500)
                if Config.Debug == true then
                    print("Second Phase: hoe dist"..tostring(hoeBedDist).." to bed")
                end
            end
            FreezeEntityPosition(hoe,true)
            while pbeddist > 0.75 do
                ploc = GetEntityCoords(PlayerPedId())
                hloc = GetEntityCoords(hoe)
                pbeddist = #(hloc - ploc)
                DrawMarker(0, hloc.x, hloc.y, hloc.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 135, 31, 35, 100, 1, 0, 0, 0)
                Wait(0)
                if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then
                    local mlib2 = 'anim@female_laying_sexy'
                    local manim2 = 'laying_sexy_clip'
                    LoadAnimDict(mlib2)
                    TaskPlayAnim(hoe, mlib2, manim2, 3.0, 3.0, sleep*1200, 1, 0.15, 0, 0, 0)
                else
                    local mlib2 = 'anim@female_laying_sexy'
                    local manim2 = 'laying_sexy_clip'
                    LoadAnimDict(mlib2)
                    TaskPlayAnim(hoe, mlib2, manim2, 3.0, 3.0, sleep*1200, 1, 0.15, 0, 0, 0)
                end
                if Config.Debug == true then
                    print("Second Phase: ped dist"..tostring(pbeddist).." to bed")
                end
            end
            startedSecondPhase = 1
            while startedSecondPhase == 1 do
                if Config.Debug == true then
                    print("Second Phase: Started action")
                end
                sleep = Config.MissionaryTime
                
                DoScreenFadeOut(500)
                Wait(1000)
                
                if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then
                    local mlib2 = 'zmdev@erotica_doggystylem'
                    local manim2 = 'doggystylem'
                    LoadAnimDict(mlib2)
                    TaskPlayAnim(PlayerPedId(), mlib2, manim2, 3.0, 3.0, sleep*1200, 1, 0.15, 0, 0, 0)
                    Wait(1000)
                    ploc = GetEntityCoords(PlayerPedId())
                    local pheading = GetEntityHeading(PlayerPedId())
                    local forw = GetEntityForwardVector(PlayerPedId())
                    SetEntityCoords(hoe, ploc.x+(forw.y/2), ploc.y-(forw.x/2), ploc.z-1.0)
                    SetEntityHeading(hoe,pheading)
                    Wait(1000)
                    DoScreenFadeIn(500)
                    local flib2 = 'zmdev@erotica_doggystylef'
                    local fanim2 = 'doggystylef'
                    LoadAnimDict(flib2)
                    TaskPlayAnim(hoe,flib2,fanim2, 3.0, 3.0, sleep*1000, 1, 0.15, 0, 0, 0)
                else
                    local mlib2 = 'zmdev@erotica_doggystylef'
                    local manim2 = 'doggystylef'
                    LoadAnimDict(mlib2)
                    TaskPlayAnim(PlayerPedId(), mlib2, manim2, 3.0, 3.0, sleep*1200, 1, 0.15, 0, 0, 0)
                    Wait(1000)
                    ploc = GetEntityCoords(PlayerPedId())
                    local pheading = GetEntityHeading(PlayerPedId())
                    local forw = GetEntityForwardVector(PlayerPedId())
                    SetEntityCoords(hoe, ploc.x-(forw.y/2), ploc.y+(forw.x/2), ploc.z-1.0)
                    SetEntityHeading(hoe,pheading)
                    Wait(1000)
                    DoScreenFadeIn(500)
                    local flib2 = 'zmdev@erotica_doggystylem'
                    local fanim2 = 'doggystylem'
                    LoadAnimDict(flib2)
                    TaskPlayAnim(hoe,flib2,fanim2, 3.0, 3.0, sleep*1000, 1, 0.15, 0, 0, 0)
                end
                QBCore.Functions.Progressbar('gettingthishoe', 'Getting Doggy Stamina', sleep*1000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = false,
                }, {}, {}, {}, function()
                    Wait(1000)
                    if Config.Debug == true then
                        print("Second Phase: Ending action")
                    end
                    SetPlayerMaxStamina(PlayerPedId(),GetPlayerMaxStamina(PlayerPedId())+(GetPlayerMaxStamina(PlayerPedId())/2))
                    QBCore.Functions.Notify('Stamina increased 50%', 'success')
                    
                    -- Award reputation for Phase 2
                    if currentProstituteModel then
                        TriggerServerEvent('ns-callgirl:server:updateReputation', currentProstituteModel, Config.ReputationGain.phase_completion, true)
                        QBCore.Functions.Notify('Reputation +'..Config.ReputationGain.phase_completion, 'success')
                    end
                    
                    DoScreenFadeOut(500)
                    Wait(1000)
                    StartFirstPhase()	
                    secondphase = 1						
                end,
				function()
                    
                    QBCore.Functions.Notify('You stopped before she was finished!!', 'warning')
                    
                    -- reputation loss for exit
                    if currentProstituteModel then
                        TriggerServerEvent('ns-callgirl:server:updateReputation', currentProstituteModel, Config.ReputationLoss.early_exit, true)
                        QBCore.Functions.Notify('Reputation -'..Config.ReputationLoss.early_exit, 'warning')
                    end
                    DoScreenFadeOut(500)
                    Wait(1000)
                    StartFirstPhase()	
                    secondphase = 1
				
				end)
                Wait(sleep*2000)
                if Config.Debug == true then
                    print("Second Phase: Wait inside startedSecondPhase")
                end
            end
        end
        Wait(sleep*1000)
        if Config.Debug == true then
            print("Second Phase: Wait Outside")
        end
    end)
end

-- Phase 3: Cowgirl (Stay naked)
function StartFirstPhase()
    if Config.Debug then
        print("Starting Phase 3 - Cowgirl (Naked)")
    end
    
    hideLastHint()
    startedSecondPhase = 0
    ClearPedTasks(hoe)
    Wait(1000)
    local endcoords = vector3(342.1, 429.62, 145.58)
    SetEntityCoords(hoe, Config.HoeSpawn.x, Config.HoeSpawn.y, Config.HoeSpawn.z)
    DoScreenFadeIn(250)
    ClearPedTasks(hoe)
    ClearPedTasks(PlayerPedId())
    CreateThread(function()
        local plyCoords = GetEntityCoords(PlayerPedId())
        local hoeCoords = GetEntityCoords(hoe)
        local sleep = 1
        FreezeEntityPosition(hoe,false)
        while firstphase == 0 do
            if Config.Debug == true then
                print("Last Phase")
            end
            TaskGoStraightToCoord(hoe, endcoords.x,endcoords.y,endcoords.z, 1.0, -1, 0.0, 0.0)
            while hoeendDist > 0.25 do
                hoeCoords = GetEntityCoords(hoe)
                hoeendDist = #(endcoords - hoeCoords)
                Wait(500)
                if Config.Debug == true then
                    print("Last Phase: hoe dist"..tostring(hoeendDist).." to hoeendDist")
                end
            end
            TaskTurnPedToFaceEntity(hoe, PlayerPedId(), 1000)
            Wait(1000)
            FreezeEntityPosition(hoe,true)
                
            while penddist > 0.75 do
                local ploc = GetEntityCoords(PlayerPedId())
                local hloc = GetEntityCoords(hoe)
                penddist = #(hloc - ploc)
                DrawMarker(0, hloc.x, hloc.y, hloc.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 135, 31, 35, 100, 1, 0, 0, 0)
                Wait(0)
                if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then
                    local mlib2 = 'littlespoon@sexy006'
                    local manim2 = 'sexy006'
                    LoadAnimDict(mlib2)
                    TaskPlayAnim(hoe, mlib2, manim2, 3.0, 3.0, sleep*1200, 1, 0.15, 0, 0, 0)
                else
                    local mlib2 = 'littlespoon@sexy006'
                    local manim2 = 'sexy006'
                    LoadAnimDict(mlib2)
                    TaskPlayAnim(hoe, mlib2, manim2, 3.0, 3.0, sleep*1200, 1, 0.15, 0, 0, 0)
                end
                if Config.Debug == true then
                    print("Last Phase: ped dist"..tostring(penddist).." to penddist")
                end
            end
            TaskTurnPedToFaceEntity(PlayerPedId(), hoe, 1000)
            Wait(1000)
            startedThirdPhase = 1
            while startedThirdPhase == 1 do
                if Config.Debug == true then
                    print("Last Phase: Started action")
                end
                sleep = Config.EndTime
                DoScreenFadeOut(500)
                Wait(1000)
                if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then
                    local mlib = 'zmdev@erotica_standingcowgirlm'
                    local manim = 'standingcowgirlm'
                    LoadAnimDict(mlib)
                    TaskPlayAnim(PlayerPedId(), mlib, manim, 3.0, 3.0, sleep*1500, 1, 0.15, 0, 0, 0)
                    Wait(1000)
                    ploc = GetEntityCoords(PlayerPedId())
                    local pheading = GetEntityHeading(PlayerPedId())
                    local forw = GetEntityForwardVector(PlayerPedId())
                    
                    SetEntityCoords(hoe, ploc.x+(forw.y/3), ploc.y-(forw.x/3), ploc.z-1.1)
                    SetEntityHeading(hoe,pheading)
                    Wait(1000)
                    DoScreenFadeIn(500)
                    
                    local flib = 'zmdev@erotica_standingcowgirlf'
                    local fanim = 'standingcowgirlf'
                    LoadAnimDict(flib)
                    TaskPlayAnim(hoe,flib,fanim, 3.0, 3.0, sleep*1000, 1, 0.15, 0, 0, 0)
                else
                    local mlib = 'zmdev@erotica_standingcowgirlf'
                    local manim = 'standingcowgirlf'
                    LoadAnimDict(mlib)
                    TaskPlayAnim(PlayerPedId(), mlib, manim, 3.0, 3.0, sleep*1500, 1, 0.15, 0, 0, 0)
                    Wait(1000)
                    ploc = GetEntityCoords(PlayerPedId())
                    local pheading = GetEntityHeading(PlayerPedId())
                    local forw = GetEntityForwardVector(PlayerPedId())
                    
                    SetEntityCoords(hoe, ploc.x-(forw.y/3), ploc.y+(forw.x/3), ploc.z-0.75)
                    SetEntityHeading(hoe,pheading)
                    Wait(1000)
                    DoScreenFadeIn(500)
                    
                    local flib = 'zmdev@erotica_standingcowgirlm'
                    local fanim = 'standingcowgirlm'
                    LoadAnimDict(flib)
                    TaskPlayAnim(hoe,flib,fanim, 3.0, 3.0, sleep*1000, 1, 0.15, 0, 0, 0)
                end
                QBCore.Functions.Progressbar('gettingthishoe', 'Getting CowGirl Armor', sleep*1000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = false,
                }, {}, {}, {}, function()
                    Wait(1000)
                    if Config.Debug == true then
                        print("Last Phase: Ending action")
                    end
                    SetPedArmour(PlayerPedId(),100)
                    QBCore.Functions.Notify('Full set of Armor!', 'success')
                    
                    -- Award reputation for Phase 3
                    if currentProstituteModel then
                        TriggerServerEvent('ns-callgirl:server:updateReputation', currentProstituteModel, Config.ReputationGain.phase_completion, true)
                        QBCore.Functions.Notify('Reputation +'..Config.ReputationGain.phase_completion, 'success')
                        TriggerServerEvent('ns-callgirl:server:incrementInteractions', currentProstituteModel)
                    end
                    
                    QBCore.Functions.Notify('Go to the closet to change', 'success')
                    ClearPedTasks(hoe)
                    ClearPedTasks(PlayerPedId())
                    clothingused = 0
                    firstphase = 1
                    EndMission()
                end,
				function()
                    
                    QBCore.Functions.Notify('You stopped before she was finished!!', 'warning')
                    
                    -- reputation loss for exit
                    if currentProstituteModel then
                        TriggerServerEvent('ns-callgirl:server:updateReputation', currentProstituteModel, Config.ReputationLoss.early_exit, true)
                        QBCore.Functions.Notify('Reputation -'..Config.ReputationLoss.early_exit, 'warning')
                    end
					
                    QBCore.Functions.Notify('Go to the closet to change', 'warning')
                    ClearPedTasks(hoe)
                    ClearPedTasks(PlayerPedId())
                    clothingused = 0
                    firstphase = 1
                    EndMission()
				
				end)
                Wait(sleep*2000)
                if Config.Debug == true then
                    print("Last Phase: Wait inside startedThirdPhase")
                end
            end
        end
        Wait(sleep*1000)
        if Config.Debug == true then
            print("Last Phase: Wait Outside")
        end
    end)
end

-- Phase Bonus: Shower (Stay naked)
function StartBonusBitch()
    if Config.Debug then
        print("Starting Bonus- Shower (Naked)")
    end
    hideLastHint()
    ClearPedTasks(hoe)
    Wait(1000)
    DoScreenFadeIn(250)
	while bonusphase == true and firstphase == 1 do
        local plyCoords = GetEntityCoords(PlayerPedId())
        local hoeCoords = GetEntityCoords(hoe)
        local sleep = 1
        FreezeEntityPosition(hoe,false)
		Wait(1000)
		if Config.Debug == true then
			print("Bonus Phase: Started action")
		end
		sleep = Config.EndTime
		DoScreenFadeOut(500)
		Wait(1000)
		if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then
			local mlib2 = 'zmdev@erotica_standingm'
			local manim2 = 'standingm'
			LoadAnimDict(mlib2)
			TaskPlayAnim(PlayerPedId(), mlib2, manim2, 3.0, 3.0, sleep*700, 1, 0.15, 0, 0, 0)
			Wait(1000)
			ploc = GetEntityCoords(PlayerPedId())
			local pheading = GetEntityHeading(PlayerPedId())
			local forw = GetEntityForwardVector(PlayerPedId())
			SetEntityCoords(hoe, ploc.x+(forw.y/2), ploc.y-(forw.x/2), ploc.z-1.0)
			SetEntityHeading(hoe,pheading)
			Wait(1000)
			DoScreenFadeIn(500)
			local flib2 = 'zmdev@erotica_standingf'
			local fanim2 = 'standingf'
			LoadAnimDict(flib2)
			TaskPlayAnim(hoe,flib2,fanim2, 3.0, 3.0, sleep*600, 1, 0.15, 0, 0, 0)
		else
			local mlib2 = 'zmdev@erotica_standingf'
			local manim2 = 'standingf'
			LoadAnimDict(mlib2)
			TaskPlayAnim(PlayerPedId(), mlib2, manim2, 3.0, 3.0, sleep*700, 1, 0.15, 0, 0, 0)
			Wait(1000)
			ploc = GetEntityCoords(PlayerPedId())
			local pheading = GetEntityHeading(PlayerPedId())
			local forw = GetEntityForwardVector(PlayerPedId())
			SetEntityCoords(hoe, ploc.x-(forw.y/2), ploc.y+(forw.x/2), ploc.z-1.0)
			SetEntityHeading(hoe,pheading)
			Wait(1000)
			DoScreenFadeIn(500)
			local flib2 = 'zmdev@erotica_standingm'
			local fanim2 = 'standingm'
			LoadAnimDict(flib2)
			TaskPlayAnim(hoe,flib2,fanim2, 3.0, 3.0, sleep*600, 1, 0.15, 0, 0, 0)
		end
		QBCore.Functions.Progressbar('gettingthishoe', 'Getting it fresh!', sleep*600, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = false,
		}, {}, {}, {}, function()
			if Config.Debug == true then
				print("Bonus Phase: Ending action")
			end
			
			-- Award reputation for Phase 3
			if currentProstituteModel ~= nil then
			
				TriggerServerEvent('hud:server:RelieveHygiene', 100)
				TriggerEvent('PlayerBiology:client:addToBuffer', 100)
				QBCore.Functions.Notify('You Smell Wonderful!', 'success')
				
				TriggerServerEvent('ns-callgirl:server:updateReputation', currentProstituteModel, Config.ReputationGain.bonus_completion, true)
				QBCore.Functions.Notify('Reputation +'..Config.ReputationGain.bonus_completion, 'success')
				TriggerServerEvent('ns-callgirl:server:incrementInteractions', currentProstituteModel)
			end
			
            QBCore.Functions.Notify('Go to the closet to change', 'success')
			ClearPedTasks(hoe)
			ClearPedTasks(PlayerPedId())
			
			local animDict = 'mp_safehouseshower@female@'
			local animName = 'shower_idle_a'
			LoadAnimDict(animDict)
			TaskPlayAnim(hoe,animDict,animName, 3.0, 3.0, 120000, 1, 0.15, 0, 0, 0)
			
			bonusphase = false
		end,
		function()
			
			QBCore.Functions.Notify('You stopped before she was finished!!', 'warning')
			
			-- reputation loss for exit
			if currentProstituteModel then
				TriggerServerEvent('ns-callgirl:server:updateReputation', currentProstituteModel, Config.ReputationLoss.early_exit, true)
				QBCore.Functions.Notify('Reputation -'..Config.ReputationLoss.early_exit, 'warning')
			end
			
            QBCore.Functions.Notify('Go to the closet to change', 'warning')
			ClearPedTasks(hoe)
			ClearPedTasks(PlayerPedId())
			
			bonusphase = false
		
			local animDict = 'mp_safehouseshower@female@'
			local animName = 'shower_idle_a'
			LoadAnimDict(animDict)
			TaskPlayAnim(hoe,animDict,animName, 3.0, 3.0, 120000, 1, 0.15, 0, 0, 0)
			
		end)
		Wait(sleep*2000)
		if Config.Debug == true then
			print("Bonus Phase: Wait inside Bonus")
		end
    end
end

function EndMission()
    startedThirdPhase = 0
    firstphase = 1
    DoScreenFadeOut(500)
    ClearPedTasks(PlayerPedId())
    ClearPedTasks(hoe)
    FreezeEntityPosition(hoe,false)
    local showercoords = vector3(336.08, 430.01, 145.6)
    TaskGoStraightToCoord(hoe, showercoords.x,showercoords.y,showercoords.z, 1.0, -1, 0.0, 0.0)
    Wait(5000)
	local animDict = 'mp_safehouseshower@female@'
	local animName = 'shower_idle_a'
	LoadAnimDict(animDict)
	TaskPlayAnim(hoe,animDict,animName, 3.0, 3.0, 90000, 1, 0.15, 0, 0, 0)
    DoScreenFadeIn(500)
    if Config.Debug == true then
        print("Ending Missions")
    end
    CleanupAfterService()
end

function CleanupAfterService()
    if Config.Debug == true then
        print("Top of cleanup")
    end
    MissionStart = 0
    local sleep = 90
    hideLastHint()
    ClearPedTasks(PlayerPedId())
    pdist = 10
    hoeendDist = 10
    penddist = 10
    hoeBedDist = 10
    pbeddist = 10
    hloc = 0
    ploc = 0
    hoeDist = 10
    ClothesStart()
    Wait(sleep*1000)
    if hoe and DoesEntityExist(hoe) then
        DeleteEntity(hoe)
    end
    if Config.Debug == true then
        print("Finally deleted that hoe")
    end
    hoe = nil
	bonusphase = false
    currentProstituteIndex = 1
    currentProstituteModel = nil
    isNaked = false
    firstphase = 0
    secondphase = 0
    thirdphase = 0
    QBCore.Functions.Notify('Call Girl is cleaning up', "success")
end

function ClothesStart()
    CreateThread(function()
        while clothingused == 0 do
            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = #(plyCoords - Config.ChangeLoc)
            local sleep = 100
			if hoe ~= nil and bonusphase == false then
				local secretDistplyCoords = GetEntityCoords(PlayerPedId(), false)
				local secretDisthoeCoords = GetEntityCoords(hoe)
				local secretDist = #(secretDistplyCoords - secretDisthoeCoords)
				if secretDist <= 1.5 then
					if Config.Debug == true then
						print("Bonus Started")
					end
					bonusphase = true
					hideLastHint()
					StartBonusBitch()
				end
			end
            if Config.Debug == true then
                print("ClothesStart: loop Inside")
            end
            if dist >= 0.5 then
                sleep = 0
                DrawMarker(0, Config.ChangeLoc.x, Config.ChangeLoc.y, Config.ChangeLoc.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 135, 31, 35, 100, 1, 0, 0, 0)
            else
                hintToDisplay('Press [E] to Change(ONLY USE AT END)')
                sleep = 5
                if IsControlJustPressed(0, 38) then
                    if Config.Debug == true then
                        print("Pressed Change Button")
                    end
					-- Award reputation for Quick Completion
					if currentProstituteModel ~= nil then
						TriggerServerEvent('ns-callgirl:server:updateReputation', currentProstituteModel, Config.ReputationGain.quick_completion, true)
						QBCore.Functions.Notify('Reputation +'..Config.ReputationGain.quick_completion, 'success')
						TriggerServerEvent('ns-callgirl:server:incrementInteractions', currentProstituteModel)
					end
					
                    GetUnNaked()
                    hideLastHint()
                    LeaveThisBitch()
                end
            end
            Wait(sleep)
        end
        Wait(1000)
        if Config.Debug == true then
            print("ClothesStart: Wait Outside")
        end
    end)
end

local function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    BeginTextCommandDisplayText("STRING")
    SetTextCentre(true)
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(x,y,z, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

-- Madam NPC spawn
CreateThread(function()
    -- Create blip on map
    if Config.blipOn then
        local blip = AddBlipForCoord(Config.MadamCoords.x, Config.MadamCoords.y, Config.MadamCoords.z)
        SetBlipSprite(blip, 280) -- Handcuffs icon (or use 121 for female icon)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 48) -- Pink color
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Madam's House")
        EndTextCommandSetBlipName(blip)
    end
    
    -- Spawn madam NPC
    local madamModel = `a_f_y_business_02` -- Professional looking female
    RequestModel(madamModel)
    while not HasModelLoaded(madamModel) do
        Wait(0)
    end
    
    madam = CreatePed(4, madamModel, Config.MadamCoords.x, Config.MadamCoords.y, Config.MadamCoords.z - 1.0, 59.82, false, false)
    SetEntityAsMissionEntity(madam, true, true)
    SetEntityInvincible(madam, true)
    
    -- Make madam sit in chair
	local madlib = 'mouse@femalearmchair'
	local madanim = 'female_armchair_clip_01'
	LoadAnimDict(madlib)
	TaskPlayAnim(madam, madlib, madanim, 3.0, 3.0, 60000, 1, 0.15, 0, 0, 0)
    
    if Config.Debug then
        print("Madam spawned at coordinates")
    end
    
    -- Add qb-target support if UseTarget is enabled
    if Config.UseTarget then
        exports['qb-target']:AddTargetEntity(madam, {
            options = {
                {
                    type = "client",
                    event = "ns-callgirl:client:talkToMadam",
                    icon = "fas fa-user",
                    label = "Talk to Madam",
                }
            },
            distance = 2.5
        })
    end
end)

-- Target event handler
RegisterNetEvent('ns-callgirl:client:talkToMadam', function()
    QBCore.Functions.TriggerCallback('NS-CallGirl:server:activeStatus', function(status)
        if status == 0 then
            OpenSelectionMenu()
        else
            QBCore.Functions.Notify('The callgirl is currently occupied. Please wait.', 'error')
        end
    end)
end)

-- Handle reputation updates from server
RegisterNetEvent('ns-callgirl:client:reputationUpdated', function(data)
    if not data then return end
    
    if Config.Debug then
        print("Reputation updated for model: " .. tostring(data.model))
        print("New reputation: " .. tostring(data.reputation))
        print("New tier: " .. tostring(data.tier))
        print("Status: " .. tostring(data.status))
    end
    QBCore.Functions.Notify('You have '..tostring(data.reputation)..' reputation with '..tostring(Config.Prostitutes[data.model].name).. ' now.', 'success')
    -- You can add additional client-side handling here if needed
    -- For example, updating UI elements, playing sounds, etc.
end)

-- Madam interaction (only if not using target)
if not Config.UseTarget then
    CreateThread(function()
        while true do
            local sleep = 1000
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local distance = #(playerCoords - Config.MadamCoords)
            
            if distance < 2.5 then
                sleep = 0
                DrawText3D(Config.MadamCoords.x, Config.MadamCoords.y, Config.MadamCoords.z, "[E] Talk to Madam")
                
                if IsControlJustReleased(0, 38) then -- E key
                    -- Check if service is available
                    QBCore.Functions.TriggerCallback('NS-CallGirl:server:activeStatus', function(status)
                        if status == 0 then
                            OpenSelectionMenu()
                        else
                            QBCore.Functions.Notify('The callgirl is currently occupied. Please wait.', 'error')
                        end
                    end)
                end
            end
            
            Wait(sleep)
        end
    end)
end

-- Cleanup on resource stop
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        if madam and DoesEntityExist(madam) then
            DeleteEntity(madam)
        end
        if hoe and DoesEntityExist(hoe) then
            DeleteEntity(hoe)
        end
    end
end)