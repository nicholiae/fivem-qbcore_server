if not GetResourceState('qb-inventory'):find('start') then return end
local resourceName = 'qb-core'

uData = {
    item = nil,
    checksThread = false
}

SetTimeout(2000, function()
    local QBCore = exports[resourceName]:GetCoreObject()

    -- Functions
    local function hasItem(item)
        local hasItem = QBCore.Functions.HasItem(item, 1)

        if hasItem then
            return 1
        end

        return 0
    end

    local function Reset()
        uData.checksThread = false
        uData.item = nil
    end

    local function MultipleChecksThread()
        uData.checksThread = true

        Citizen.CreateThread(function()
            while uData.checksThread do
                Wait(2000)

                -- Check if player is dead, is inlaststand, handcuffed or menu, if so, forcefully close menu
                if bridge.isDead() or IsPauseMenuActive() then
                    lib.hideContext(true)
                end

                -- Check if player still has item
                local count = hasItem(uData.item)

                if count < 1 then
                    exports[GetCurrentResourceName()]:SpawnPet('recall')
                    Reset()
                end
            end
        end)
    end

    -- Overrides
    exports[GetCurrentResourceName()]:OverrideMethod("OnTryingToSpawnPet", function(pet, config)
        local count = hasItem(pet)

        if count < 1 then
            return false
        end

        return true
    end)

    exports[GetCurrentResourceName()]:OverrideMethod("OnStartingAction", function(action, netId, config)
        -- Something something
    end)

    exports[GetCurrentResourceName()]:OverrideMethod("OnOpeningMenu", function(config, selected)
        if bridge.isDead() then
            return false
        end

        if IsPauseMenuActive() then
            return false
        end

        return true
    end)

    exports[GetCurrentResourceName()]:OverrideMethod("Notification", function(text, notifType)
        bridge.notify(text, notifType)
    end)

    exports[GetCurrentResourceName()]:OverrideMethod("OnFinishingPetSetup", function(netId, config, pet)
        uData.item = pet
        MultipleChecksThread()
    end)

    -- Events
    RegisterNetEvent("fd-pets:client:endThread", function()
        Reset()
    end)
end)
