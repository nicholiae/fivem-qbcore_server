local QBCore = exports['qb-core']:GetCoreObject()

-- Get tax data callback
QBCore.Functions.CreateCallback('qb-phone:server:GetTaxData', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then
        cb(nil)
        return
    end
    
    local citizenid = Player.PlayerData.citizenid
    
    -- Get tax information from database
    local taxInfo = MySQL.prepare.await('SELECT * FROM `playerpaidtaxes` WHERE `citizenid` = ?', {citizenid})
    
    if not taxInfo then
        -- Create default entry if doesn't exist
        MySQL.prepare('INSERT INTO `playerpaidtaxes`(`citizenid`, `PaidTaxes`, `HasPaidTaxes`, `playerowedtaxes`, `haveWeChecked`, `haveWePosted`) VALUES (?,?,?,?,?,?)', {
            citizenid,
            0,
            0,
            0,
            0,
            0
        })
        
        taxInfo = {
            citizenid = citizenid,
            PaidTaxes = 0,
            HasPaidTaxes = 0,
            playerowedtaxes = 0,
            haveWeChecked = 0,
            haveWePosted = 0
        }
    end
    
    -- Get vehicles
    local vehicleData = MySQL.query.await('SELECT `vehicle` FROM `player_vehicles` WHERE `citizenid` = ?', {citizenid})
    local vehicles = {}
    local totalVehicleValue = 0
    
    for _, v in pairs(vehicleData) do
        local vehicleName = v.vehicle
        if QBCore.Shared.Vehicles[vehicleName] then
            local price = QBCore.Shared.Vehicles[vehicleName].price
            table.insert(vehicles, {
                name = vehicleName,
                price = price
            })
            totalVehicleValue = totalVehicleValue + price
        end
    end
    
    -- Get houses
    local houseData = MySQL.query.await('SELECT `house` FROM `player_houses` WHERE `citizenid` = ?', {citizenid})
    local houses = {}
    local totalHouseValue = 0
    
    for _, h in pairs(houseData) do
        local houseName = h.house
        local housePrice = MySQL.prepare.await('SELECT `price` FROM `houselocations` WHERE `name` = ?', {houseName})
        
        if housePrice then
            table.insert(houses, {
                name = houseName,
                price = housePrice
            })
            totalHouseValue = totalHouseValue + housePrice
        end
    end
    
    -- Get business/job information
    local business = {}
    local businessAdjustment = 0
    
    local cityJobs = {
        'firefighter',
        'police',
        'ambulance',
        'reporter',
        'mayor',
        'judge',
        'supreme'
    }
    
    -- Check job 1
    local job1 = Player.PlayerData.job
    if job1.isboss then
        local isCityJob = false
        for _, cityJob in pairs(cityJobs) do
            if job1.name == cityJob then
                isCityJob = true
                businessAdjustment = businessAdjustment - 1000000
                table.insert(business, {
                    name = job1.label or job1.name,
                    isBoss = true,
                    taxAdjustment = -1000000,
                    type = 'City Job Boss (Tax Credit)'
                })
                break
            end
        end
        
        if not isCityJob then
            businessAdjustment = businessAdjustment + 500000
            table.insert(business, {
                name = job1.label or job1.name,
                isBoss = true,
                taxAdjustment = 500000,
                type = 'Business Owner'
            })
        end
    end
    
    -- Check job 2
    local job2Query = MySQL.query.await('SELECT `job_two` FROM `players` WHERE `citizenid` = ?', {citizenid})
    if job2Query and job2Query[1] and job2Query[1].job_two then
        local job2 = json.decode(job2Query[1].job_two)
        if job2 and job2.isboss then
            local isCityJob = false
            for _, cityJob in pairs(cityJobs) do
                if job2.name == cityJob then
                    isCityJob = true
                    businessAdjustment = businessAdjustment - 1000000
                    table.insert(business, {
                        name = job2.label or job2.name,
                        isBoss = true,
                        taxAdjustment = -1000000,
                        type = 'City Job Boss (Tax Credit)'
                    })
                    break
                end
            end
            
            if not isCityJob then
                businessAdjustment = businessAdjustment + 500000
                table.insert(business, {
                    name = job2.label or job2.name,
                    isBoss = true,
                    taxAdjustment = 500000,
                    type = 'Business Owner'
                })
            end
        end
    end
    
    -- Calculate days remaining
    local thisMonth = tonumber(os.date('%m'))
    local thisYear = tonumber(os.date('%Y'))
    local days_in_month = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
    local tDaysinMonth = days_in_month[thisMonth]
    local reference = os.time{day=tDaysinMonth, year=thisYear, month=thisMonth}
    local daysfrom = os.difftime(reference, os.time()) / (24 * 60 * 60)
    local daysRemaining = math.floor(daysfrom)
    
    -- Calculate total taxes
    local totalAssetValue = totalVehicleValue + totalHouseValue
    local baseTax = math.floor(totalAssetValue * 0.07)
    local totalOwed = baseTax + businessAdjustment
    
    -- Prepare response
    local taxData = {
        totalOwed = totalOwed,
        alreadyPaid = taxInfo.PaidTaxes or 0,
        hasPaid = (taxInfo.HasPaidTaxes == 1),
        daysRemaining = daysRemaining,
        vehicles = vehicles,
        houses = houses,
        business = business,
        totalVehicleValue = totalVehicleValue,
        totalHouseValue = totalHouseValue,
        businessAdjustment = businessAdjustment,
        baseTax = baseTax
    }
    
    cb(taxData)
end)

-- Pay taxes callback
QBCore.Functions.CreateCallback('qb-phone:server:PayTaxes', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then
        cb({success = false, message = 'Player not found'})
        return
    end
    
    local citizenid = Player.PlayerData.citizenid
    local hasPaid = MySQL.prepare.await('SELECT `HasPaidTaxes` FROM `playerpaidtaxes` WHERE `citizenid` = ?', {citizenid})
    
    if hasPaid == 1 then
        cb({success = false, message = 'You have already paid your taxes for this month'})
        return
    end
    
    local owed = MySQL.prepare.await('SELECT `playerowedtaxes` FROM `playerpaidtaxes` WHERE `citizenid` = ?', {citizenid})
    local paid = MySQL.prepare.await('SELECT `PaidTaxes` FROM `playerpaidtaxes` WHERE `citizenid` = ?', {citizenid})
    
    if not owed then owed = 0 end
    if not paid then paid = 0 end
    
    local taxes = owed - paid
    local statement_type = nil
    
    if taxes < 0 then
        -- Player has overpaid, give them money back
        taxes = math.abs(taxes)
        Player.Functions.AddMoney('bank', taxes, 'Tax refund')
        statement_type = 'deposit'
        exports['qb-banking']:RemoveMoney('mayor', taxes, 'Tax Refund')
        exports['qb-banking']:CreateBankStatement(src, 'checking', taxes, 'Tax Refund', statement_type, 'player')
        
        MySQL.prepare('UPDATE `playerpaidtaxes` SET `HasPaidTaxes` = 1 WHERE `citizenid` = ?', {citizenid})
        MySQL.prepare('UPDATE `playerpaidtaxes` SET `PaidTaxes` = 0 WHERE `citizenid` = ?', {citizenid})
        MySQL.prepare('UPDATE `playerpaidtaxes` SET `playerowedtaxes` = 0 WHERE `citizenid` = ?', {citizenid})
        
        TriggerEvent('qb-log:server:CreateLog', 'taxes', 'Tax Refund Collected: '..Player.PlayerData.name, 'green', 
            '💰 Player: '..tostring(Player.PlayerData.name)..
            '\n🆔 CivID: '..tostring(citizenid)..
            '\n💵 Refund Amount: $'..tostring(taxes)..
            '\n⏰ Collected on: '..os.date('%c')
        )
        
        cb({success = true, message = 'Tax refund of $'..taxes..' has been deposited to your account'})
    else
        -- Player needs to pay taxes
        if Player.PlayerData.money.bank < taxes then
            cb({success = false, message = 'You do not have enough money in your bank account'})
            return
        end
        
        Player.Functions.RemoveMoney('bank', taxes, 'Tax payment')
        statement_type = 'withdraw'
        exports['qb-banking']:AddMoney('mayor', taxes, 'Tax Payment')
        exports['qb-banking']:CreateBankStatement(src, 'checking', taxes, 'Tax Payment', statement_type, 'player')
        
        MySQL.prepare('UPDATE `playerpaidtaxes` SET `HasPaidTaxes` = 1 WHERE `citizenid` = ?', {citizenid})
        MySQL.prepare('UPDATE `playerpaidtaxes` SET `PaidTaxes` = 0 WHERE `citizenid` = ?', {citizenid})
        MySQL.prepare('UPDATE `playerpaidtaxes` SET `playerowedtaxes` = 0 WHERE `citizenid` = ?', {citizenid})
        
        TriggerEvent('qb-log:server:CreateLog', 'taxes', 'Taxes Paid: '..Player.PlayerData.name, 'green', 
            '💰 Player: '..tostring(Player.PlayerData.name)..
            '\n🆔 CivID: '..tostring(citizenid)..
            '\n💵 Amount Paid: $'..tostring(taxes)..
            '\n⏰ Paid on: '..os.date('%c')
        )
        
        cb({success = true, message = 'Successfully paid $'..taxes..' in taxes'})
    end
end)