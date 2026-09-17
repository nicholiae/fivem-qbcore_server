local QBCore = exports['qb-core']:GetCoreObject()

-- Local variables
local currentContainer = nil
local nearbyStores = {}

-- Helper Functions
local function DebugPrint(message)
    if Config.Debug then
        print('[QBContainerInventory] ' .. message)
    end
end


function putOnSmallBack()

	if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then --male
		TriggerEvent('qb-clothing:client:loadOutfit', {
			outfitData = {
				["bag"] = { item = 118, texture = 0 }
			}
		})
	else
		TriggerEvent('qb-clothing:client:loadOutfit', {		 --female
			outfitData = {
				["bag"] = { item = 6, texture = 0 }
			}
		})
	end
end

function putOnMediumBack()

	if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then --male
		TriggerEvent('qb-clothing:client:loadOutfit', {
			outfitData = {
				["bag"] = { item = 44, texture = 0 }
			}
		})
	else
		TriggerEvent('qb-clothing:client:loadOutfit', {		 --female
			outfitData = {
				["bag"] = { item = 4, texture = 0 }
			}
		})
	end
end


function putOnLargeBack()

	if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then --male
		TriggerEvent('qb-clothing:client:loadOutfit', {
			outfitData = {
				["bag"] = { item = 45, texture = 0 }
			}
		})
	else
		TriggerEvent('qb-clothing:client:loadOutfit', {		 --female
			outfitData = {
				["bag"] = { item = 6, texture = 0 }
			}
		})
	end
end


local function DrawText3D(coords, text)
    local onScreen, x, y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local camCoords = GetGameplayCamCoords()
    local distance = #(coords - camCoords)
    
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov
    
    if onScreen then
        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(x, y)
    end
end

-- Container opening (simplified - actual opening handled by qb-inventory)
RegisterNetEvent('qb-containerinventory:client:OpenContainer', function(containerId, containerType, config)
    currentContainer = {
        id = containerId,
        type = containerType,
        config = config
    }
    
    DebugPrint('Opened container: ' .. containerId .. ' (Type: ' .. containerType .. ')')
end)

-- Close container
AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        if currentContainer then
            TriggerServerEvent('qb-containerinventory:server:CloseContainer')
        end
    end
end)

-- Listen for inventory close events to clear current container
RegisterNetEvent('qb-inventory:client:closeInventory', function()
    if currentContainer then
        DebugPrint('Inventory closed, clearing current container')
        TriggerServerEvent('qb-containerinventory:server:CloseContainer')
        currentContainer = nil
    end
end)

-- Wallet usage
RegisterNetEvent('qb-containerinventory:client:UseWallet', function(itemName)
    local playerData = QBCore.Functions.GetPlayerData()
    local item = nil
    
    -- Find the wallet item
    for _, invItem in pairs(playerData.items) do
        if invItem and invItem.name == itemName then
            item = invItem
            break
        end
    end
    
    if item then
        TriggerServerEvent('qb-containerinventory:server:UseWallet', itemName, item)
    end
end)

-- Backpack usage
RegisterNetEvent('qb-containerinventory:client:UseBackpack', function(itemName)
    local playerData = QBCore.Functions.GetPlayerData()
    local item = nil
    
    -- Find the backpack item
    for _, invItem in pairs(playerData.items) do
        if invItem and invItem.name == itemName then
            item = invItem
            break
        end
    end
    
    if item then
		if itemName == "backpack_small" then
			putOnSmallBack()
		elseif itemName == "backpack_medium" then
			putOnMediumBack()
		elseif itemName == "backpack_large" then
			putOnLargeBack()
		end
        TriggerServerEvent('qb-containerinventory:server:UseBackpack', itemName, item)
    end
end)

-- Backpack trading
RegisterNetEvent('qb-containerinventory:client:TradeBackpack', function()
    local player, distance = QBCore.Functions.GetClosestPlayer()
    if player ~= -1 and distance < 3.0 then
        local playerId = GetPlayerServerId(player)
        TriggerServerEvent('qb-containerinventory:server:TradeBackpack', playerId)
    else
        QBCore.Functions.Notify('No player nearby!', 'error')
    end
end)

-- Store system
local function LoadStores()
    for _, store in ipairs(Config.Stores) do
        -- Create blip
        if store.blip.enabled then
            local blip = AddBlipForCoord(store.coords.x, store.coords.y, store.coords.z)
            SetBlipSprite(blip, store.blip.sprite)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, store.blip.scale)
            SetBlipColour(blip, store.blip.color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(store.blip.label)
            EndTextCommandSetBlipName(blip)
        end
        
        -- Spawn ped
        if store.ped.enabled then
            local pedHash = GetHashKey(store.ped.model)
            RequestModel(pedHash)
            while not HasModelLoaded(pedHash) do
                Wait(10)
            end
            
            local ped = CreatePed(4, pedHash, store.ped.coords.x, store.ped.coords.y, store.ped.coords.z - 1.0, store.ped.coords.w, false, true)
            SetEntityHeading(ped, store.ped.coords.w)
            FreezeEntityPosition(ped, true)
            SetEntityInvincible(ped, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
            
            -- Add to qb-target if enabled
            if Config.UseTarget then
                exports['qb-target']:AddTargetEntity(ped, {
                    options = {
                        {
                            type = "client",
                            event = "qb-containerinventory:client:OpenStore",
                            icon = "fas fa-shopping-bag",
                            label = "Browse Store",
                            store = store
                        }
                    },
                    distance = 2.5
                })
            end
            
            table.insert(nearbyStores, {
                coords = store.coords,
                ped = ped,
                data = store
            })
        end
    end
    
    DebugPrint('Loaded ' .. #nearbyStores .. ' stores')
end

-- Store interaction
RegisterNetEvent('qb-containerinventory:client:OpenStore', function(data)
    local store = data.store
    local menu = {
        {
            header = store.name,
            isMenuHeader = true
        }
    }
    
    -- Add wallets
    if store.items.wallets then
        for itemName, config in pairs(Config.Wallets) do
            table.insert(menu, {
                header = config.label,
                txt = config.description .. '<br>Price: $' .. config.price,
                params = {
                    event = "qb-containerinventory:client:PurchaseItem",
                    args = {
                        itemName = itemName,
                        itemType = 'wallet'
                    }
                }
            })
        end
    end
    
    -- Add backpacks
    if store.items.backpacks then
        for itemName, config in pairs(Config.Backpacks) do
            table.insert(menu, {
                header = config.label,
                txt = config.description .. '<br>Price: $' .. config.price,
                params = {
                    event = "qb-containerinventory:client:PurchaseItem",
                    args = {
                        itemName = itemName,
                        itemType = 'backpack'
                    }
                }
            })
        end
    end
    
    -- Add furniture
    if store.items.furniture then
        for itemName, config in pairs(Config.Furniture) do
            table.insert(menu, {
                header = config.label,
                txt = config.description .. '<br>Price: $' .. config.price,
                params = {
                    event = "qb-containerinventory:client:PurchaseItem",
                    args = {
                        itemName = itemName,
                        itemType = 'furniture'
                    }
                }
            })
        end
    end
    
    table.insert(menu, {
        header = "Close",
        params = {
            event = "qb-menu:client:closeMenu"
        }
    })
    
    exports['qb-menu']:openMenu(menu)
end)

-- Purchase item
RegisterNetEvent('qb-containerinventory:client:PurchaseItem', function(data)
    TriggerServerEvent('qb-containerinventory:server:PurchaseItem', data.itemName, data.itemType)
end)

-- Store interaction thread (if not using qb-target)
CreateThread(function()
    if not Config.UseTarget then
        while true do
            local sleep = 1000
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            
            for _, store in ipairs(nearbyStores) do
                local distance = #(playerCoords - store.coords)
                if distance < 3.0 then
                    sleep = 0
                    DrawText3D(store.coords, Config.Interactions.drawText)
                    
                    if distance < 2.0 and IsControlJustReleased(0, 38) then -- E key
                        TriggerEvent('qb-containerinventory:client:OpenStore', {store = store.data})
                    end
                end
            end
            
            Wait(sleep)
        end
    end
end)

-- Initialize
CreateThread(function()
    Wait(1000)
    LoadStores()
    DebugPrint('Client main script loaded successfully')
end)