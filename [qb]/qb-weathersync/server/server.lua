local QBCore = exports['qb-core']:GetCoreObject()
local CurrentWeather = Config.StartWeather
local baseTime = Config.BaseTime
local timeOffset = Config.TimeOffset
local freezeTime = Config.FreezeTime
local blackout = Config.Blackout
local newWeatherTimer = Config.NewWeatherTimer
local currentSeason = nil

--- Is the source a client or the server
--- @param src string | number - source to check
--- @return int - source
local function getSource(src)
    return src == '' and 0 or src
end

--- Does source have permissions to run admin commands
--- @param src number - Source to check
--- @return boolean - has permission
local function isAllowedToChange(src)
    return src == 0 or QBCore.Functions.HasPermission(src, "admin") or IsPlayerAceAllowed(src, 'command')
end

--- Sets time offset based on minutes provided
--- @param minute number - Minutes to offset by
local function shiftToMinute(minute)
    timeOffset = timeOffset - (((baseTime + timeOffset) % 60) - minute)
end

--- Sets time offset based on hour provided
--- @param hour number - Hour to offset by
local function shiftToHour(hour)
    timeOffset = timeOffset - ((((baseTime + timeOffset) / 60) % 24) - hour) * 60
end

--- Gets the current season based on real-time date
--- @return string - Current season name
local function getCurrentSeason()
    if not Config.EnableSeasons then
        return nil
    end

    local date = os.date("*t")
    local month = date.month
    local day = date.day
    
    -- Convert date to day of year for easier comparison
    local function toDayOfYear(m, d)
        local daysInMonth = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
        local dayOfYear = d
        for i = 1, m - 1 do
            dayOfYear = dayOfYear + daysInMonth[i]
        end
        return dayOfYear
    end
    
    local currentDay = toDayOfYear(month, day)
    
    -- Define season ranges based on hemisphere
    local seasons = {}
    
    if Config.Hemisphere == 'south' then
        -- Southern Hemisphere (seasons are reversed)
        seasons = {
            {name = 'autumn', start = toDayOfYear(3, 20), finish = toDayOfYear(6, 20)},
            {name = 'winter', start = toDayOfYear(6, 21), finish = toDayOfYear(9, 22)},
            {name = 'spring', start = toDayOfYear(9, 23), finish = toDayOfYear(12, 20)},
            {name = 'summer', start = toDayOfYear(12, 21), finish = 365},
            {name = 'summer', start = 1, finish = toDayOfYear(3, 19)}
        }
    else
        -- Northern Hemisphere (default)
        seasons = {
            {name = 'spring', start = toDayOfYear(3, 20), finish = toDayOfYear(6, 20)},
            {name = 'summer', start = toDayOfYear(6, 21), finish = toDayOfYear(9, 22)},
            {name = 'autumn', start = toDayOfYear(9, 23), finish = toDayOfYear(12, 20)},
            {name = 'winter', start = toDayOfYear(12, 21), finish = 365},
            {name = 'winter', start = 1, finish = toDayOfYear(3, 19)}
        }
    end
    
    -- Find current season
    for _, season in ipairs(seasons) do
        if currentDay >= season.start and currentDay <= season.finish then
            return season.name
        end
    end
    
    return 'spring' -- Default fallback
end

--- Checks if current date is within a special event period
--- @return string|nil - Event weather type or nil
local function checkSpecialEvents()
    if not Config.EnableSeasons then
        return nil
    end

    local date = os.date("*t")
    local month = date.month
    local day = date.day
    
    for eventName, event in pairs(Config.SpecialEvents) do
        if event.enabled then
            local inRange = false
            
            -- Check if current date is within event range
            if event.start.month == event.finish.month then
                -- Event within same month
                if month == event.start.month and day >= event.start.day and day <= event.finish.day then
                    inRange = true
                end
            elseif event.start.month < event.finish.month then
                -- Event spans multiple months (same year)
                if (month == event.start.month and day >= event.start.day) or
                   (month == event.finish.month and day <= event.finish.day) or
                   (month > event.start.month and month < event.finish.month) then
                    inRange = true
                end
            else
                -- Event spans year boundary
                if (month == event.start.month and day >= event.start.day) or
                   (month == event.finish.month and day <= event.finish.day) or
                   (month > event.start.month or month < event.finish.month) then
                    inRange = true
                end
            end
            
            if inRange then
                return event.weather
            end
        end
    end
    
    return nil
end

--- Gets a random weather type from the seasonal weather pool
--- @param season string - Season name
--- @return string - Weather type
local function getSeasonalWeather(season)
    if not Config.EnableSeasons or not Config.SeasonalWeather[season] then
        return 'CLEAR'
    end
    
    local weatherPool = Config.SeasonalWeather[season]
    local totalWeight = 0
    
    -- Calculate total weight
    for _, entry in ipairs(weatherPool) do
        totalWeight = totalWeight + entry.weight
    end
    
    -- Select random weather based on weights
    local random = math.random(1, totalWeight)
    local currentWeight = 0
    
    for _, entry in ipairs(weatherPool) do
        currentWeight = currentWeight + entry.weight
        if random <= currentWeight then
            return entry.weather
        end
    end
    
    return weatherPool[1].weather -- Fallback to first weather type
end

--- Triggers event to switch weather to next stage (with seasonal logic)
local function nextWeatherStage()
    -- Check for special events first
    local specialWeather = checkSpecialEvents()
    if specialWeather then
        CurrentWeather = specialWeather
        TriggerEvent("qb-weathersync:server:RequestStateSync")
        return
    end
    
    -- Use seasonal weather if enabled
    if Config.EnableSeasons then
        local season = getCurrentSeason()
        currentSeason = season
        CurrentWeather = getSeasonalWeather(season)
        TriggerEvent("qb-weathersync:server:RequestStateSync")
        return
    end
    
    -- Original weather progression logic (fallback)
    if CurrentWeather == "CLEAR" or CurrentWeather == "CLOUDS" or CurrentWeather == "EXTRASUNNY" then
        CurrentWeather = (math.random(1, 5) > 2) and "CLEARING" or "OVERCAST" -- 60/40 chance
    elseif CurrentWeather == "CLEARING" or CurrentWeather == "OVERCAST" then
        local new = math.random(1, 6)
        if new == 1 then CurrentWeather = (CurrentWeather == "CLEARING") and "FOGGY" or "RAIN"
        elseif new == 2 then CurrentWeather = "CLOUDS"
        elseif new == 3 then CurrentWeather = "CLEAR"
        elseif new == 4 then CurrentWeather = "EXTRASUNNY"
        elseif new == 5 then CurrentWeather = "SMOG"
        else CurrentWeather = "FOGGY"
        end
    elseif CurrentWeather == "THUNDER" or CurrentWeather == "RAIN" then CurrentWeather = "CLEARING"
    elseif CurrentWeather == "SMOG" or CurrentWeather == "FOGGY" then CurrentWeather = "CLEAR"
    else CurrentWeather = "CLEAR"
    end
    TriggerEvent("qb-weathersync:server:RequestStateSync")
end

--- Switch to a specified weather type
--- @param weather string - Weather type from Config.AvailableWeatherTypes
--- @return boolean - success
local function setWeather(weather)
    local validWeatherType = false
    for _, weatherType in pairs(Config.AvailableWeatherTypes) do
        if weatherType == string.upper(weather) then
            validWeatherType = true
        end
    end
    if not validWeatherType then return false end
    CurrentWeather = string.upper(weather)
    newWeatherTimer = Config.NewWeatherTimer
    TriggerEvent('qb-weathersync:server:RequestStateSync')
    return true
end

--- Sets sun position based on time to specified
--- @param hour number|string - Hour to set (0-24)
--- @param minute number|string `optional` - Minute to set (0-60)
--- @return boolean - success
local function setTime(hour, minute)
    local argh = tonumber(hour)
    local argm = tonumber(minute) or 0
    if argh == nil or argh > 24 then
        print(Lang:t('time.invalid'))
        return false
    end
    shiftToHour((argh < 24) and argh or 0)
    shiftToMinute((argm < 60) and argm or 0)
    print(Lang:t('time.change', {value = argh, value2 = argm}))
    TriggerEvent('qb-weathersync:server:RequestStateSync')
    return true
end

--- Sets or toggles blackout state and returns the state
--- @param state boolean `optional` - enable blackout?
--- @return boolean - blackout state
local function setBlackout(state)
    if state == nil then state = not blackout end
    if state then blackout = true
    else blackout = false end
    TriggerEvent('qb-weathersync:server:RequestStateSync')
    return blackout
end

--- Sets or toggles time freeze state and returns the state
--- @param state boolean `optional` - Enable time freeze?
--- @return boolean - Time freeze state
local function setTimeFreeze(state)
    if state == nil then state = not freezeTime end
    if state then freezeTime = true
    else freezeTime = false end
    TriggerEvent('qb-weathersync:server:RequestStateSync')
    return freezeTime
end

--- Sets or toggles dynamic weather state and returns the state
--- @param state boolean `optional` - Enable dynamic weather?
--- @return boolean - Dynamic Weather state
local function setDynamicWeather(state)
    if state == nil then state = not Config.DynamicWeather end
    if state then Config.DynamicWeather = true
    else Config.DynamicWeather = false end
    TriggerEvent('qb-weathersync:server:RequestStateSync')
    return Config.DynamicWeather
end

--- Retrieves the current time from worldtimeapi.org
--- @return number - Unix time
local function retrieveTimeFromApi(callback)
    Citizen.CreateThread(function()
        PerformHttpRequest("http://worldtimeapi.org/api/ip", function(statusCode, response)
            if statusCode == 200 then
                local data = json.decode(response)
                if data == nil or data.unixtime == nil then
                    callback(nil)
                else
                    callback(data.unixtime)
                end
            else
                callback(nil)
            end
        end, "GET", nil, nil)
    end)
end

-- EVENTS
RegisterNetEvent('qb-weathersync:server:RequestStateSync', function()
    TriggerClientEvent('qb-weathersync:client:SyncWeather', -1, CurrentWeather, blackout)
    TriggerClientEvent('qb-weathersync:client:SyncTime', -1, baseTime, timeOffset, freezeTime)
end)

RegisterNetEvent('qb-weathersync:server:setWeather', function(weather)
    local src = getSource(source)
    if isAllowedToChange(src) then
        local success = setWeather(weather)
        if src > 0 then
            if (success) then TriggerClientEvent('QBCore:Notify', src, Lang:t('weather.updated'))
            else TriggerClientEvent('QBCore:Notify', src, Lang:t('weather.invalid'))
            end
        end
    end
end)

RegisterNetEvent('qb-weathersync:server:setTime', function(hour, minute)
    local src = getSource(source)
    if isAllowedToChange(src) then
        local success = setTime(hour, minute)
        if src > 0 then
            if (success) then TriggerClientEvent('QBCore:Notify', src, Lang:t('time.change', {value = hour, value2 = minute or "00"}))
            else TriggerClientEvent('QBCore:Notify', src, Lang:t('time.invalid'))
            end
        end
    end
end)

RegisterNetEvent('qb-weathersync:server:toggleBlackout', function(state)
    local src = getSource(source)
    if isAllowedToChange(src) then
        local newstate = setBlackout(state)
        if src > 0 then
            if (newstate) then TriggerClientEvent('QBCore:Notify', src, Lang:t('blackout.enabled'))
            else TriggerClientEvent('QBCore:Notify', src, Lang:t('blackout.disabled'))
            end
        end
    end
end)

RegisterNetEvent('qb-weathersync:server:toggleFreezeTime', function(state)
    local src = getSource(source)
    if isAllowedToChange(src) then
        local newstate = setTimeFreeze(state)
        if src > 0 then
            if (newstate) then TriggerClientEvent('QBCore:Notify', src, Lang:t('time.now_frozen'))
            else TriggerClientEvent('QBCore:Notify', src, Lang:t('time.now_unfrozen'))
            end
        end
    end
end)

RegisterNetEvent('qb-weathersync:server:toggleDynamicWeather', function(state)
    local src = getSource(source)
    if isAllowedToChange(src) then
        local newstate = setDynamicWeather(state)
        if src > 0 then
            if (newstate) then TriggerClientEvent('QBCore:Notify', src, Lang:t('weather.now_unfrozen'))
            else TriggerClientEvent('QBCore:Notify', src, Lang:t('weather.now_frozen'))
            end
        end
    end
end)

-- COMMANDS
QBCore.Commands.Add('freezetime', Lang:t('help.freezecommand'), {}, false, function(source)
    local newstate = setTimeFreeze()
    if source > 0 then
        if (newstate) then return TriggerClientEvent('QBCore:Notify', source, Lang:t('time.frozenc')) end
        return TriggerClientEvent('QBCore:Notify', source, Lang:t('time.unfrozenc'))
    end
    if (newstate) then return print(Lang:t('time.now_frozen')) end
    return print(Lang:t('time.now_unfrozen'))
end, 'admin')

QBCore.Commands.Add('freezeweather', Lang:t('help.freezeweathercommand'), {}, false, function(source)
    local newstate = setDynamicWeather()
    if source > 0 then
        if (newstate) then return TriggerClientEvent('QBCore:Notify', source, Lang:t('dynamic_weather.enabled')) end
        return TriggerClientEvent('QBCore:Notify', source, Lang:t('dynamic_weather.disabled'))
    end
    if (newstate) then return print(Lang:t('weather.now_unfrozen')) end
    return print(Lang:t('weather.now_frozen'))
end, 'admin')

QBCore.Commands.Add('weather', Lang:t('help.weathercommand'), {{name = Lang:t('help.weathertype'), help = Lang:t('help.availableweather')}}, true, function(source, args)
    local success = setWeather(args[1])
    if source > 0 then
        if (success) then return TriggerClientEvent('QBCore:Notify', source, Lang:t('weather.willchangeto', {value = string.lower(args[1])})) end
        return TriggerClientEvent('QBCore:Notify', source, Lang:t('weather.invalidc'), 'error')
    end
    if (success) then return print(Lang:t('weather.updated')) end
    return print(Lang:t('weather.invalid'))
end, 'admin')

QBCore.Commands.Add('blackout', Lang:t('help.blackoutcommand'), {}, false, function(source)
    local newstate = setBlackout()
    if source > 0 then
        if (newstate) then return TriggerClientEvent('QBCore:Notify', source, Lang:t('blackout.enabledc')) end
        return TriggerClientEvent('QBCore:Notify', source, Lang:t('blackout.disabledc'))
    end
    if (newstate) then return print(Lang:t('blackout.enabled')) end
    return print(Lang:t('blackout.disabled'))
end, 'admin')

QBCore.Commands.Add('morning', Lang:t('help.morningcommand'), {}, false, function(source)
    setTime(9, 0)
    if source > 0 then return TriggerClientEvent('QBCore:Notify', source, Lang:t('time.morning')) end
end, 'admin')

QBCore.Commands.Add('noon', Lang:t('help.nooncommand'), {}, false, function(source)
    setTime(12, 0)
    if source > 0 then return TriggerClientEvent('QBCore:Notify', source, Lang:t('time.noon')) end
end, 'admin')

QBCore.Commands.Add('evening', Lang:t('help.eveningcommand'), {}, false, function(source)
    setTime(18, 0)
    if source > 0 then return TriggerClientEvent('QBCore:Notify', source, Lang:t('time.evening')) end
end, 'admin')

QBCore.Commands.Add('night', Lang:t('help.nightcommand'), {}, false, function(source)
    setTime(23, 0)
    if source > 0 then return TriggerClientEvent('QBCore:Notify', source, Lang:t('time.night')) end
end, 'admin')

QBCore.Commands.Add('time', Lang:t('help.timecommand'), {{ name=Lang:t('help.timehname'), help=Lang:t('help.timeh') }, { name=Lang:t('help.timemname'), help=Lang:t('help.timem') }}, true, function(source, args)
    local success = setTime(args[1], args[2])
    if source > 0 then
        if (success) then return TriggerClientEvent('QBCore:Notify', source, Lang:t('time.changec', {value = args[1] .. ':' .. (args[2] or "00")})) end
        return TriggerClientEvent('QBCore:Notify', source, Lang:t('time.invalidc'), 'error')
    end
    if (success) then return print(Lang:t('time.change', {value = args[1], value2 = args[2] or "00"})) end
    return print(Lang:t('time.invalid'))
end, 'admin')

-- NEW SEASONAL COMMANDS
QBCore.Commands.Add('season', 'Check current season', {}, false, function(source)
    local season = getCurrentSeason()
    local hemisphere = Config.Hemisphere == 'south' and 'Southern' or 'Northern'
    if source > 0 then
        TriggerClientEvent('QBCore:Notify', source, 'Current Season: ' .. season .. ' (' .. hemisphere .. ' Hemisphere)')
    else
        print('Current Season: ' .. season .. ' (' .. hemisphere .. ' Hemisphere)')
    end
end, 'admin')

-- THREAD LOOPS
CreateThread(function()
    local previous = 0
    local realTimeFromApi = nil
    local failedCount = 0

    while true do
        Wait(0)
        local newBaseTime = os.time(os.date("!*t")) / 2 + 360 --Set the server time depending of OS time
        if Config.RealTimeSync then
            newBaseTime = os.time(os.date("!*t")) --Set the server time depending of OS time
            if realTimeFromApi == nil then
                retrieveTimeFromApi(function(unixTime)
                    realTimeFromApi = unixTime -- Set the server time depending on real-time retrieved from API
                end)
            end
            while realTimeFromApi == nil do
                if failedCount > 10 then
                    print("Failed to retrieve real time from API, falling back to local time")
                    break
                end
                failedCount = failedCount + 1
                Wait(100)
            end
            if realTimeFromApi ~= nil then
                newBaseTime = realTimeFromApi
            end
        end
        if (newBaseTime % 60) ~= previous then --Check if a new minute is passed
            previous = newBaseTime % 60 --Only update time with plain minutes, seconds are handled in the client
            if freezeTime then
                timeOffset = timeOffset + baseTime - newBaseTime
            end
            baseTime = newBaseTime
        end
    end
end)

CreateThread(function()
    while true do
        Wait(2000)--Change to send every minute in game sync
        TriggerClientEvent('qb-weathersync:client:SyncTime', -1, baseTime, timeOffset, freezeTime)
    end
end)

CreateThread(function()
    while true do
        Wait(300000)
        TriggerClientEvent('qb-weathersync:client:SyncWeather', -1, CurrentWeather, blackout)
    end
end)

CreateThread(function()
    while true do
        newWeatherTimer = newWeatherTimer - 1
        Wait((1000 * 60) * Config.NewWeatherTimer)
        if newWeatherTimer == 0 then
            if Config.DynamicWeather then
                nextWeatherStage()
            end
            newWeatherTimer = Config.NewWeatherTimer
        end
    end
end)

-- Initialize season on server start
CreateThread(function()
    Wait(1000)
    if Config.EnableSeasons then
        currentSeason = getCurrentSeason()
        local hemisphere = Config.Hemisphere == 'south' and 'Southern' or 'Northern'
        print('^2[qb-weathersync]^7 Seasonal weather system initialized')
        print('^2[qb-weathersync]^7 Current Season: ^3' .. currentSeason .. '^7 (' .. hemisphere .. ' Hemisphere)')
        
        -- Set initial weather based on season
        local specialWeather = checkSpecialEvents()
        if specialWeather then
            print('^2[qb-weathersync]^7 Special event active: ^3' .. specialWeather)
            CurrentWeather = specialWeather
        else
            CurrentWeather = getSeasonalWeather(currentSeason)
            print('^2[qb-weathersync]^7 Initial weather set to: ^3' .. CurrentWeather)
        end
        
        TriggerEvent('qb-weathersync:server:RequestStateSync')
    end
end)

-- EXPORTS
exports('nextWeatherStage', nextWeatherStage)
exports('setWeather', setWeather)
exports('setTime', setTime)
exports('setBlackout', setBlackout)
exports('setTimeFreeze', setTimeFreeze)
exports('setDynamicWeather', setDynamicWeather)
exports('getBlackoutState', function() return blackout end)
exports('getTimeFreezeState', function() return freezeTime end)
exports('getWeatherState', function() return CurrentWeather end)
exports('getDynamicWeather', function() return Config.DynamicWeather end)
exports('getCurrentSeason', getCurrentSeason)
exports('getSeasonalWeather', getSeasonalWeather)

exports('getTime', function()
    local hour = math.floor(((baseTime+timeOffset)/60)%24)
    local minute = math.floor((baseTime+timeOffset)%60)

    return hour,minute
end)