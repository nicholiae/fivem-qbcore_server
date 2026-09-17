-- NC Drug Addiction System
-- Client-side main initialization

local QBCore = nil
local PlayerData = {}
local AddictionData = {}
local isInitialized = false

-- Initialize QBCore
CreateThread(function()
    Wait(1000)
    QBCore = exports['qb-core']:GetCoreObject()
    
    if Config.Debug then
        print('[NC-DrugAddiction] Client initialized')
    end
    
    isInitialized = true
end)

-- Sync addiction data from server
RegisterNetEvent('nc-drugaddiction:client:SyncAddictions', function(data)
    AddictionData = data or {}
    
    if Config.Debug then
        print('[NC-DrugAddiction] Synced addiction data')
    end
    
    -- Trigger health cap update
    TriggerEvent('nc-drugaddiction:client:UpdateHealthCap')
end)

-- Handle overdose event
RegisterNetEvent('nc-drugaddiction:client:Overdose', function(drugType)
    local ped = PlayerPedId()
    
    -- Set player to injured/downed state
    TriggerEvent('hospital:client:SetDeathStatus', false)
    TriggerEvent('hospital:client:SetLaststand', true)
    
    -- Visual effects
    ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 0.5)
    
    -- Notify
    local drugName = Config.DrugNames[drugType] or 'Unknown Drug'
    QBCore.Functions.Notify('You have overdosed on ' .. drugName .. '!', 'error', 10000)
    
    -- Apply overdose effects
    local coords = GetEntityCoords(ped)
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0, 'breathing', 0.5)
    
    -- Create overdose effect loop
    CreateThread(function()
        local overdoseTimer = 0
        local maxOverdoseTime = 180 -- 3 minutes max before death
        
        while overdoseTimer < maxOverdoseTime do
            Wait(1000)
            overdoseTimer = overdoseTimer + 1
            
            -- Random screen effects
            if math.random(1, 10) <= 3 then
                AnimpostfxPlay('DrugsMichaelAliensFightIn', 3.0, false)
            end
            
            -- Shake camera periodically
            if math.random(1, 10) <= 5 then
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.3)
            end
            
            -- Check if revived or narcan used
            if not IsPedDeadOrDying(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId(), false) then
                -- Player might have been revived
                if GetEntityHealth(PlayerPedId()) > 100 then
                    break
                end
            end
        end
        
        -- If not treated in time, player goes to last stand/death
        if overdoseTimer >= maxOverdoseTime then
            SetEntityHealth(PlayerPedId(), 0)
        end
    end)
end)

-- Handle narcan used event
RegisterNetEvent('nc-drugaddiction:client:NarcanUsed', function()
    local ped = PlayerPedId()
    
    -- Clear overdose state if active
    TriggerEvent('hospital:client:SetLaststand', false)
    
    -- Recovery animation
    RequestAnimDict('missheistdockssetup1clipboard@idle_a')
    while not HasAnimDictLoaded('missheistdockssetup1clipboard@idle_a') do
        Wait(100)
    end
    
    TaskPlayAnim(ped, 'missheistdockssetup1clipboard@idle_a', 'idle_a', 8.0, -8.0, -1, 0, 0, false, false, false)
    
    -- Visual recovery effect
    AnimpostfxStopAll()
    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.2)
    Wait(500)
    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.1)
    Wait(500)
    StopGameplayCamShaking(true)
    
    -- Notify
    QBCore.Functions.Notify('The Narcan is taking effect...', 'success', 5000)
    
    -- Restore some health
    local currentHealth = GetEntityHealth(ped)
    SetEntityHealth(ped, math.min(200, currentHealth + 50))
    
    -- Clear withdrawal timers
    TriggerEvent('nc-drugaddiction:client:ClearWithdrawal')
end)

-- Handle OD blip for EMS
RegisterNetEvent('nc-drugaddiction:client:ODBlip', function(coords, playerName)
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, 153) -- Medical blip
    SetBlipScale(blip, 1.5)
    SetBlipColour(blip, 1) -- Red
    SetBlipAsShortRange(blip, false)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString('OD: ' .. playerName)
    EndTextCommandSetBlipName(blip)
    
    -- Flash the blip
    SetBlipFlashes(blip, true)
    
    -- Remove blip after 2 minutes
    SetTimeout(120000, function()
        RemoveBlip(blip)
    end)
end)

-- Get local addiction level for UI
function GetAddictionLevel(drugType)
    if AddictionData and AddictionData.addictions then
        return AddictionData.addictions[drugType] or 0
    end
    return 0
end

-- Get local tolerance level for UI
function GetToleranceLevel(drugType)
    if AddictionData and AddictionData.tolerance then
        return AddictionData.tolerance[drugType] or 0
    end
    return 0
end

-- Get all addiction data
function GetAllAddictionData()
    return AddictionData
end

-- Export client functions
exports('GetAddictionLevel', GetAddictionLevel)
exports('GetToleranceLevel', GetToleranceLevel)
exports('GetAllAddictionData', GetAllAddictionData)