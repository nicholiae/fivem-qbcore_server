QBShared = QBShared or {}

local StringCharset = {}
local NumberCharset = {}

QBShared.StarterItems = {
    ['phone'] = { amount = 1, item = 'phone' },
    ['id_card'] = { amount = 1, item = 'id_card' },
    ['driver_license'] = { amount = 1, item = 'driver_license' },
}

for i = 48, 57 do NumberCharset[#NumberCharset + 1] = string.char(i) end
for i = 65, 90 do StringCharset[#StringCharset + 1] = string.char(i) end
for i = 97, 122 do StringCharset[#StringCharset + 1] = string.char(i) end

function QBShared.RandomStr(length)
    if length <= 0 then return '' end
    return QBShared.RandomStr(length - 1) .. StringCharset[math.random(1, #StringCharset)]
end

function QBShared.RandomInt(length)
    if length <= 0 then return '' end
    return QBShared.RandomInt(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
end

function QBShared.SplitStr(str, delimiter)
    local result = {}
    local from = 1
    local delim_from, delim_to = string.find(str, delimiter, from)
    while delim_from do
        result[#result + 1] = string.sub(str, from, delim_from - 1)
        from = delim_to + 1
        delim_from, delim_to = string.find(str, delimiter, from)
    end
    result[#result + 1] = string.sub(str, from)
    return result
end

function QBShared.Trim(value)
    if not value then return nil end
    return (string.gsub(value, '^%s*(.-)%s*$', '%1'))
end

function QBShared.FirstToUpper(value)
    if not value then return nil end
    return (value:gsub("^%l", string.upper))
end

function QBShared.Round(value, numDecimalPlaces)
    if not numDecimalPlaces then return math.floor(value + 0.5) end
    local power = 10 ^ numDecimalPlaces
    return math.floor((value * power) + 0.5) / (power)
end

function QBShared.ChangeVehicleExtra(vehicle, extra, enable)
    if DoesExtraExist(vehicle, extra) then
        if enable then
            SetVehicleExtra(vehicle, extra, false)
            if not IsVehicleExtraTurnedOn(vehicle, extra) then
                QBShared.ChangeVehicleExtra(vehicle, extra, enable)
            end
        else
            SetVehicleExtra(vehicle, extra, true)
            if IsVehicleExtraTurnedOn(vehicle, extra) then
                QBShared.ChangeVehicleExtra(vehicle, extra, enable)
            end
        end
    end
end

function QBShared.SetDefaultVehicleExtras(vehicle, config)
    -- Clear Extras
    for i = 1, 20 do
        if DoesExtraExist(vehicle, i) then
            SetVehicleExtra(vehicle, i, 1)
        end
    end

    for id, enabled in pairs(config) do
        QBShared.ChangeVehicleExtra(vehicle, tonumber(id), type(enabled) == 'boolean' and enabled or true)
    end
end

QBShared.MaleNoGloves = {
    [0] = true,
    [1] = true,
    [2] = true,
    [3] = true,
    [4] = true,
    [5] = true,
    [6] = true,
    [7] = true,
    [8] = true,
    [9] = true,
    [10] = true,
    [11] = true,
    [12] = true,
    [13] = true,
    [14] = true,
    [15] = true,
    [16] = true,
    [17] = true,
    [99] = true,
    [100] = true,
    [114] = true,
    [115] = true,
    [116] = true,
    [186] = true,
    [190] = true,
    [198] = true,
    [199] = true,
    [200] = true,
    [204] = true,
    [213] = true,
    [214] = true
}

QBShared.FemaleNoGloves = {
    [0] = true,
    [1] = true,
    [2] = true,
    [3] = true,
    [4] = true,
    [5] = true,
    [6] = true,
    [7] = true,
    [8] = true,
    [9] = true,
    [10] = true,
    [11] = true,
    [12] = true,
    [13] = true,
    [14] = true,
    [15] = true,
    [19] = true,
    [20] = true,
    [21] = true,
    [22] = true,
    [23] = true,
    [24] = true,
    [25] = true,
    [26] = true,
    [27] = true,
    [28] = true,
    [29] = true,
    [30] = true,
    [31] = true,
    [32] = true,
    [33] = true,
    [34] = true,
    [35] = true,
    [39] = true,
    [40] = true,
    [41] = true,
    [44] = true,
    [45] = true,
    [46] = true,
    [47] = true,
    [48] = true,
    [58] = true,
    [75] = true,
    [76] = true,
    [78] = true,
    [79] = true,
    [80] = true,
    [81] = true,
    [82] = true,
    [83] = true,
    [84] = true,
    [85] = true,
    [86] = true,
    [87] = true,
    [88] = true,
    [89] = true,
    [90] = true,
    [91] = true,
    [100] = true,
    [101] = true,
    [102] = true,
    [103] = true,
    [104] = true,
    [132] = true,
    [133] = true,
    [150] = true,
    [151] = true,
    [155] = true,
    [161] = true,
    [162] = true,
    [169] = true,
    [173] = true,
    [177] = true,
    [181] = true,
    [185] = true,
    [249] = true,
    [253] = true,
    [261] = true,
    [256] = true,
    [265] = true,
    [266] = true,
    [267] = true,
    [268] = true,
    [269] = true,
    [270] = true,
    [271] = true,
    [272] = true,
    [273] = true,
    [274] = true,
    [275] = true,
    [276] = true,
    [277] = true,
    [278] = true,
    [279] = true,
    [280] = true,
    [281] = true,
    [282] = true,
    [283] = true,
    [284] = true,
    [285] = true,
    [286] = true,
    [287] = true,
    [288] = true,
    [289] = true,
    [290] = true,
    [291] = true,
    [292] = true,
    [293] = true,
    [294] = true,
    [295] = true,
    [296] = true,
    [297] = true,
    [298] = true,
    [299] = true,
    [300] = true,
    [301] = true,
    [302] = true,
    [303] = true,
    [304] = true,
    [305] = true,
    [306] = true,
    [307] = true,
    [308] = true,
    [309] = true,
    [310] = true,
    [311] = true,
    [312] = true,
    [313] = true,
    [314] = true,
    [315] = true,
	[316] = true,
	[317] = true,
	[318] = true,
	[319] = true,
	[320] = true,
	[321] = true,
	[322] = true,
	[323] = true,
	[324] = true,
	[325] = true,
	[326] = true,
	[327] = true,
	[328] = true,
	[329] = true,
	[330] = true,
	[331] = true,
	[332] = true,
	[333] = true,
	[334] = true,
	[335] = true,
	[336] = true,
	[337] = true,
	[338] = true,
	[339] = true,
	[340] = true,
	[341] = true,
	[342] = true,
	[343] = true,
	[344] = true,
	[345] = true,
	[346] = true,
	[347] = true,
	[348] = true,
	[349] = true,
	[350] = true,
	[351] = true,
	[352] = true,
	[353] = true,
	[354] = true,
	[355] = true,
	[356] = true,
	[357] = true,
	[358] = true,
	[359] = true,
    [360] = true
}
