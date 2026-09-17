local QBCore = exports['qb-core']:GetCoreObject()

local isWashing = false
local canTake = false
local WashTime
local bagworths
local WashedItem = {}
local bagworth = 0
  
-- CreateThread(function()
    -- for k in pairs(Config.WashLocation) do
        -- local moneyWash = AddBlipForCoord(1129.94, -989.31, 45.97)
        -- SetBlipSprite (moneyWash, 642)
        -- SetBlipDisplay(moneyWash, 4)
        -- SetBlipScale  (moneyWash, 0.75)
        -- SetBlipAsShortRange(moneyWash, true)
        -- SetBlipColour(moneyWash, 46)
        -- BeginTextCommandSetBlipName('STRING')
        -- AddTextComponentSubstringPlayerName('Hands Free moneyWash')
        -- EndTextCommandSetBlipName(moneyWash)
    -- end
-- end)

CreateThread(function()
    if Config.UseTarget then
        for key, value in pairs(Config.WashLocation) do
            exports['qb-target']:AddBoxZone('washShop'..key, value.coords, value.length, value.width, {
                name = 'washShop'..key,
                heading = value.heading,
                minZ = value.minZ,
                maxZ = value.maxZ,
                debugPoly = value.debugPoly,
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'NS-MoneyWashing:client:openMenu',
                        icon = 'fas fa-ring',
                        label = 'Wash Shop',
                    },
                },
                distance = value.distance
            })
        end
    else
        local zone = {}
        for key, value in pairs(Config.WashLocation) do
            zone[#zone+1] = BoxZone:Create(value.coords, value.length, value.width, {
                name = 'washShop'..key,
                heading = value.heading,
                minZ = value.minZ,
                maxZ = value.maxZ,
            })
        end
        local washShopCombo = ComboZone:Create( zone, { name = 'NewwashShopCombo', debugPoly = false })
        washShopCombo:onPlayerInOut(function(isPointInside)
            if isPointInside then
                exports['qb-menu']:showHeader({
                    {
                        header = 'Money Washing',
                        txt = 'Open Wash',
                        params = {
                            event = 'NS-MoneyWashing:client:openMenu'
                        }
                    }
                })
            else
                exports['qb-menu']:closeMenu()
            end
        end)
    end
end)

RegisterNetEvent('NS-MoneyWashing:client:openMenu', function()
    if Config.UseTimes then
        if GetClockHours() >= Config.TimeOpen and GetClockHours() <= Config.TimeClosed then
            local washShop = {
                {
                    header = 'Wash Shop',
                    isMenuHeader = true,
                },
                {
                    header = 'Selling',
                    txt = 'Sell to Wash',
                    params = {
                        event = 'NS-MoneyWashing:client:openPawn',
                        args = {
                            items = Config.ScrubItems
                        }
                    }
                }
            }
            if not isWashing then
                washShop[#washShop + 1] = {
                    header = 'Wash yo Money',
                    txt = 'Wash Money',
                    params = {
                        event = 'NS-MoneyWashing:client:openWash',
                        args = {
                            items = Config.WashItems
                        }
                    }
                }
            end
            if canTake then
                washShop[#washShop + 1] = {
                    header = 'Pickup Washed',
                    txt = 'Pickup Washed Money',
                    params = {
                        isServer = true,
                        event = 'NS-MoneyWashing:server:pickupWashed',
                        args = {
                            items = WashedItem
                        }
                    }
                }
            end
            exports['qb-menu']:openMenu(washShop)
        else
            QBCore.Functions.Notify('Shop Closed')
        end
    else
        local washShop = {
            {
                header = 'Wash Shop',
                isMenuHeader = true,
            },
            {
                header = 'Sell Wash',
                txt = 'Selling to the Wash',
                params = {
                    event = 'NS-MoneyWashing:client:openPawn',
                    args = {
                        items = Config.ScrubItems
                    }
                }
            }
        }
        if not isWashing then
            washShop[#washShop + 1] = {
                header = 'Washing Shop',
                txt = 'Wash Money',
                params = {
                    event = 'NS-MoneyWashing:client:openWash',
                    args = {
                        items = Config.WashItems
                    }
                }
            }
        end
        if canTake then
            washShop[#washShop + 1] = {
                header = 'Washed Pickup',
                txt = 'Get your washed money',
                params = {
                    isServer = true,
                    event = 'NS-MoneyWashing:server:pickupWashed',
                    args = {
                        items = WashedItem
                    }
                }
            }
        end
        exports['qb-menu']:openMenu(washShop)
    end
end)

RegisterNetEvent('NS-MoneyWashing:client:openPawn', function(data)
    QBCore.Functions.TriggerCallback('NS-MoneyWashing:server:getInv', function(inventory)
        local PlyInv = inventory
        local pawnMenu = {
            {
                header = 'Sell Menu',
                isMenuHeader = true,
            }
        }
        for _, v in pairs(PlyInv) do
            for i = 1, #data.items do
                if v.name == data.items[i].item then
                    pawnMenu[#pawnMenu + 1] = {
                        header = QBCore.Shared.Items[v.name].label,
                        txt = 'sell',
                        params = {
                            event = 'NS-MoneyWashing:client:pawnitems',
                            args = {
                                label = QBCore.Shared.Items[v.name].label,
                                price = data.items[i].price,
                                name = v.name,
                                amount = v.amount
                            }
                        }
                    }
                end
            end
        end
        pawnMenu[#pawnMenu + 1] = {
            header = 'back',
            params = {
                event = 'NS-MoneyWashing:client:openMenu'
            }
        }
        exports['qb-menu']:openMenu(pawnMenu)
    end)
end)

RegisterNetEvent('NS-MoneyWashing:client:openWash', function(data)
    QBCore.Functions.TriggerCallback('NS-MoneyWashing:server:getInv', function(inventory)
        local PlyInv = inventory
        local WashMenu = {
            {
                header = 'Wash',
                isMenuHeader = true,
            }
        }
        for _, v in pairs(PlyInv) do
            for i = 1, #data.items do
                if v.name == data.items[i].item then
                    WashMenu[#WashMenu + 1] = {
                        header = QBCore.Shared.Items[v.name].label,
                        txt = 'Wash Money Worth:'..tostring(v.info.worth)..' in slot:'..tostring(v.slot),
                        params = {
                            event = 'NS-MoneyWashing:client:WashItems',
                            args = {
                                label = QBCore.Shared.Items[v.name].label,
                                reward = data.items[i].rewards,
                                name = v.name,
                                amount = v.amount,
                                worth = v.info.worth,
								slot = v.slot,
                                time = data.items[i].washTime
                            }
                        }
                    }
                end
            end
        end
        WashMenu[#WashMenu + 1] = {
            header = 'Wash',
            params = {
                event = 'NS-MoneyWashing:client:openMenu'
            }
        }
        exports['qb-menu']:openMenu(WashMenu)
    end)
end)

RegisterNetEvent('NS-MoneyWashing:client:pawnitems', function(item)
    local sellingItem = exports['qb-input']:ShowInput({
        header = 'The Wash',
        submitText = 'Wash Money',
        inputs = {
            {
                type = 'number',
                isRequired = false,
                name = 'amount',
                text = item.amount..' to wash'
            }
        }
    })
    if sellingItem then
        if not sellingItem.amount then
            return
        end

        if tonumber(sellingItem.amount) > 0 then
            if tonumber(sellingItem.amount) <= item.amount then
                TriggerServerEvent('NS-MoneyWashing:server:sellPawnItems', item.name, sellingItem.amount, item.price)
            else
                QBCore.Functions.Notify('nothing there', 'error')
            end
        else
            QBCore.Functions.Notify('negative?', 'error')
        end
    end
end)


RegisterNetEvent('NS-MoneyWashing:client:WashItems', function(item)
    local WashingItem = exports['qb-input']:ShowInput({
        header = 'Wash Items',
        submitText = 'Submit',
        inputs = {
            {
                type = 'number',
                isRequired = false,
                name = 'amount',
                text = item.amount..' amount'
            }
        }
    })
    if WashingItem then
        if not WashingItem.amount then
            return
        end
		
        if WashingItem.amount ~= nil then
            if tonumber(WashingItem.amount) > 0 then
                TriggerServerEvent('NS-MoneyWashing:server:WashItemRemove', item.name, WashingItem.amount, item)

            else
                QBCore.Functions.Notify('nothing washing', 'error')
            end
        else
            QBCore.Functions.Notify('nothing washing', 'error')
        end
    end
end)

RegisterNetEvent('NS-MoneyWashing:client:startWashing', function(item, WashingAmount, WashTimees)
    if not isWashing then
        isWashing = true
        WashTime = WashTimees
        WashedItem = {}
        CreateThread(function()
            while isWashing do
                if LocalPlayer.state.isLoggedIn then
                    WashTime = WashTime - 1
                    if WashTime <= 0 then
                        canTake = true
                        isWashing = false
                        WashedItem[#WashedItem+1] = { item = item, amount = WashingAmount }
                        if Config.SendWashingEmail then
                            TriggerServerEvent('qb-phone:server:sendNewMail', {
                                sender = 'BlackMarket Money Wash',
                                subject = 'Your Dirty Money',
                                message = 'Its no longer dirty',
                                button = {}
                            })
                        else
                            QBCore.Functions.Notify('Washwash ready', 'success')
                        end
                    end
                else
                    break
                end
                Wait(1000)
            end
        end)
    end
end)

RegisterNetEvent('NS-MoneyWashing:client:resetPickup', function()
    canTake = false
end)
