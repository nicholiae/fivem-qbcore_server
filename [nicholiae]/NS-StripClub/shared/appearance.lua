-- Shared Appearance Application Functions for NS-StripClub Enhanced Stripper System
-- This file contains utility functions to apply detailed prostitute appearances

-- Apply facial features and structure
function ApplyPedAppearance(ped, appearanceData)
    if not appearanceData or not ped then return end
    
    -- Apply face shape and blend
    if appearanceData.face then
        SetPedHeadBlendData(ped, 
            appearanceData.face.item, 
            appearanceData.face2.item, 
            0, 
            appearanceData.facemix.shapeMix, 
            appearanceData.facemix.skinMix, 
            0.0, 
            false)
    end
    
    -- Apply hair
    if appearanceData.hair then
        SetPedComponentVariation(ped, 2, appearanceData.hair.item, appearanceData.hair.texture, 0)
    end
    
    -- Apply facial structure (normalized from 0-10 to -1.0 to 1.0)
    local facialFeatures = {
        'nose_0', 'nose_1', 'nose_2', 'nose_3', 'nose_4', 'nose_5',
        'cheek_1', 'cheek_2', 'cheek_3',
        'eyebrown_high', 'eyebrown_forward',
        'eye_opening', 'lips_thickness',
        'jaw_bone_width', 'jaw_bone_back_lenght',
        'chimp_bone_lowering', 'chimp_bone_lenght', 'chimp_bone_width', 'chimp_hole',
        'neck_thikness'
    }
    
    local featureIndices = {
        nose_0 = 0, nose_1 = 1, nose_2 = 2, nose_3 = 3, nose_4 = 4, nose_5 = 5,
        cheek_1 = 6, cheek_2 = 7, cheek_3 = 8,
        eyebrown_high = 9, eyebrown_forward = 10,
        eye_opening = 11, lips_thickness = 12,
        jaw_bone_width = 13, jaw_bone_back_lenght = 14,
        chimp_bone_lowering = 15, chimp_bone_lenght = 16, chimp_bone_width = 17, chimp_hole = 18,
        neck_thikness = 19
    }
    
    for feature, index in pairs(featureIndices) do
        if appearanceData[feature] then
            local value = (appearanceData[feature].item - 5) / 5.0 -- Convert 0-10 to -1.0 to 1.0
            SetPedFaceFeature(ped, index, value)
        end
    end
    
    -- Apply overlays
    if appearanceData.eyebrows then
        SetPedHeadOverlay(ped, 2, appearanceData.eyebrows.item, appearanceData.eyebrows.texture / 10)
    end
    if appearanceData.beard then
        SetPedHeadOverlay(ped, 1, appearanceData.beard.item, appearanceData.beard.texture / 10)
    end
    if appearanceData.blush then
        SetPedHeadOverlay(ped, 5, appearanceData.blush.item, appearanceData.blush.texture / 10)
    end
    if appearanceData.lipstick then
        SetPedHeadOverlay(ped, 8, appearanceData.lipstick.item, appearanceData.lipstick.texture / 10)
    end
    if appearanceData.makeup then
        SetPedHeadOverlay(ped, 4, appearanceData.makeup.item, appearanceData.makeup.texture / 10)
    end
    if appearanceData.ageing then
        SetPedHeadOverlay(ped, 3, appearanceData.ageing.item, appearanceData.ageing.texture / 10)
    end
    if appearanceData.moles then
        SetPedHeadOverlay(ped, 9, appearanceData.moles.item, appearanceData.moles.texture / 10)
    end
    
    -- Apply eye color
    if appearanceData.eye_color then
        SetPedEyeColor(ped, appearanceData.eye_color.item)
    end
end

-- Apply clothing and accessories
function ApplyPedClothing(ped, clothingData)
    if not clothingData or not ped then return end
    
    -- Apply clothing components
    -- if clothingData.arms then
        -- SetPedComponentVariation(ped, 3, clothingData.arms.drawable, clothingData.arms.texture, 0)
    -- end
    -- if clothingData.tshirt then
        -- SetPedComponentVariation(ped, 8, clothingData.tshirt.drawable, clothingData.tshirt.texture, 0)
    -- end
    -- if clothingData.torso2 then
        -- SetPedComponentVariation(ped, 11, clothingData.torso2.drawable, clothingData.torso2.texture, 0)
    -- end
    -- if clothingData.pants then
        -- SetPedComponentVariation(ped, 4, clothingData.pants.drawable, clothingData.pants.texture, 0)
    -- end
    -- if clothingData.shoes then
        -- SetPedComponentVariation(ped, 6, clothingData.shoes.drawable, clothingData.shoes.texture, 0)
    -- end
    -- if clothingData.vest then
        -- SetPedComponentVariation(ped, 9, clothingData.vest.drawable, clothingData.vest.texture, 0)
    -- end
    -- if clothingData.bag then
        -- SetPedComponentVariation(ped, 5, clothingData.bag.drawable, clothingData.bag.texture, 0)
    -- end
    -- if clothingData.accessory then
        -- SetPedComponentVariation(ped, 7, clothingData.accessory.drawable, clothingData.accessory.texture, 0)
    -- end
    -- if clothingData.decals then
        -- SetPedComponentVariation(ped, 10, clothingData.decals.drawable, clothingData.decals.texture, 0)
    -- end
    -- if clothingData.mask then
        -- SetPedComponentVariation(ped, 1, clothingData.mask.drawable, clothingData.mask.texture, 0)
    -- end
    -- if clothingData.hat then
        -- SetPedPropIndex(ped, 0, clothingData.hat.drawable, clothingData.hat.texture, true)
    -- end
    -- if clothingData.glass then
        -- SetPedPropIndex(ped, 1, clothingData.glass.drawable, clothingData.glass.texture, true)
    -- end
    -- if clothingData.ear then
        -- SetPedPropIndex(ped, 2, clothingData.ear.drawable, clothingData.ear.texture, true)
    -- end
    -- if clothingData.watch then
        -- SetPedPropIndex(ped, 6, clothingData.watch.drawable, clothingData.watch.texture, true)
    -- end
    -- if clothingData.bracelet then
        -- SetPedPropIndex(ped, 7, clothingData.bracelet.drawable, clothingData.bracelet.texture, true)
    -- end
end

-- Apply complete prostitute appearance
function ApplyFullProstituteAppearance(ped, stripperId)
    local stripper = Config.Strippers[stripperId]
    if not stripper or not ped then return end
    
    -- Apply the full appearance
    ApplyPedAppearance(ped, stripper.Appearance)
    ApplyPedClothing(ped, stripper.Lingerie)
    
    -- Apply any additional customizations based on personality
    if Config.Debug then
        print(string.format("Applied appearance for %s (%s)", stripper.Name, stripper.Nickname))
    end
end

-- Client-side event to apply appearance to pole dancers
RegisterNetEvent('NS-StripClub:client:ApplyPoleDancerAppearance')
AddEventHandler('NS-StripClub:client:ApplyPoleDancerAppearance', function(pedNetId, stripperId)
    local ped = NetworkGetEntityFromNetworkId(pedNetId)
    if DoesEntityExist(ped) then
        ApplyFullProstituteAppearance(ped, stripperId)
    end
end)

-- Export functions for external use
exports('ApplyPedAppearance', ApplyPedAppearance)
exports('ApplyPedClothing', ApplyPedClothing)
exports('ApplyFullProstituteAppearance', ApplyFullProstituteAppearance)