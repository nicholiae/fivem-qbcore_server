local IsNew = false
local spawnPoint
local MinZOffset = 45

RegisterNetEvent('qb-interior:client:SetNewState', function(bool)
    IsNew = bool
end)
-- Functions
function TeleportToInterior(x, y, z, h)
    CreateThread(function()
        SetEntityCoords(PlayerPedId(), x, y, z, 0, 0, 0, false)
        SetEntityHeading(PlayerPedId(), h)

        Wait(100)

        DoScreenFadeIn(1000)
    end)
end

exports('DespawnInterior', function(objects, cb)
    CreateThread(function()
        for _, v in pairs(objects) do
            if DoesEntityExist(v) then
                DeleteEntity(v)
            end
        end

        cb()
    end)
end)

--Core Functions

local function CreateShell(spawn, exitXYZH, model)
    local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = exitXYZH
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1000)
    end
    local house = CreateObject(model, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects + 1] = house
	spawnPoint = spawn
	
    TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

exports('CreateShell', function(spawn, exitXYZH, model)
    return CreateShell(spawn, exitXYZH, model)
end)

-- Starting Apartment

exports('CreateFurniMotelStandard', function(spawn)--16
    local exit = json.decode('{"x": 1.5, "y": -10.0, "z": 0, "h":358.50}')
    local model = 'standardmotel_shell'
    return CreateShell(spawn, exit, model)
end)

exports('CreateNV1u', function(spawn)--17
    local exit = { x = 0.58453369140625, y = 1.1893463134766, z = 1.3267822265625, h = 358.23 }
    local model = 'envi_shell_01_empty'
    return CreateShell(spawn, exit, model)
end)

exports('CreateNV1f', function(spawn)--18
    local exit = { x = 0.53643798828125, y = 0.30792236328125, z = 1.1853618621826, h = 5.5 }
    local model = 'envi_shell_01_furnished'
    return CreateShell(spawn, exit, model)
end)

exports('CreateNV2u', function(spawn)--19
    local exit = { x = 0.0465, y = -10.304504, z = 1.9514589309692, h = 0.61 }
    local model = 'envi_shell_02_empty'
    return CreateShell(spawn, exit, model)
end)

exports('CreateNV2f', function(spawn)--20
    local exit = { x = 0.19366455078125, y = -11.241516113281, z = 1.9514589309692, h = 0.61 }
    local model = 'envi_shell_02_furnished'
    return CreateShell(spawn, exit, model)
end)

exports('CreateNV3u', function(spawn)--21
    local exit = { x = 0.077484130859375, y = -10.783569335938, z = 1.944580078125, h = 2.61 }
    local model = 'envi_shell_02_empty'
    return CreateShell(spawn, exit, model)
end)

exports('CreateNV3f', function(spawn)--22
    local exit = { x = 5.1099243164062, y = 1.161865234375, z = 1.5051879882812, h = 2.61 }
    local model = 'envi_shell_03_furnished'
    return CreateShell(spawn, exit, model)
end)

exports('CreateApartmentFurnished', function(spawn)
    local exit = json.decode('{"x": 1.5, "y": -10.0, "z": 0, "h":358.50}')
    local model = 'furnitured_midapart'
    local obj = CreateShell(spawn, exit, model)
    if obj and obj[2] then
        obj[2].clothes = json.decode('{"x": -6.028, "y": -9.5, "z": 1.2, "h":2.263}')
        obj[2].stash = json.decode('{"x": -7.305, "y": -3.922, "z": 0.5, "h":2.263}')
        obj[2].logout = json.decode('{"x": -0.8, "y": 1.0, "z": 1.0, "h":2.263}')
        obj[2].sink = json.decode('{"x": -2.138916015625, "y": -8.7158203125, "z": 1.06, "h":1.459342956543}')
        obj[2].toilet = json.decode('{"x": -2.1480712890625, "y": -9.6976623535156, "z": 1.06, "h":257.01000976562}')
        obj[2].shower = json.decode('{"x": -2.277099609375, "y": -7.4913024902344, "z": 1.06, "h":90.144073486328}')
    end
    if IsNew then
        SetTimeout(750, function()
            TriggerEvent('qb-clothes:client:CreateFirstCharacter')
            IsNew = false
        end)
    end
    return { obj[1], obj[2] }
end)

exports('CreateHouseRobbery', function(spawn)
    local exit = json.decode('{"x": 1.46, "y": -10.33, "z": 1.06, "h": 0.39}')
    local model = 'furnitured_midapart'
    return CreateShell(spawn, exit, model)
end)

exports('CreateApartmentRobbery', function(spawn)
    local exit = json.decode('{"x": 4.98, "y": 4.35, "z": 1.16, "h": 179.79}')
    local model = 'modernhotel_shell'
    return CreateShell(spawn, exit, model)
end)

-- Shells (in order by tier starting at 1)

exports('CreateApartmentShell', function(spawn) --fix this --1
    local exit = json.decode('{"x": 4.693, "y": -6.015, "z": 1.11, "h":358.634}')
    local model = 'shell_v16low'
    return CreateShell(spawn, exit, model)
end)

exports('CreateTier1House', function(spawn)--2
    local exit = json.decode('{"x": 1.561, "y": -14.305, "z": 1.147, "h":2.263}')
    local model = 'shell_v16mid'
    return CreateShell(spawn, exit, model)
end)

exports('CreateTrevorsShell', function(spawn)--3
    local exit = json.decode('{"x": 0.374, "y": -3.789, "z": 2.428, "h":358.633}')
    local model = 'shell_trevor'
    return CreateShell(spawn, exit, model)
end)

exports('CreateCaravanShell', function(spawn)--4
    local exit = json.decode('{"z":3.3, "y":-2.1, "x":-1.4, "h":358.633972168}')
    local model = 'shell_trailer'
    return CreateShell(spawn, exit, model)
end)

exports('CreateLesterShell', function(spawn)--5
    local exit = json.decode('{"x":-1.780, "y":-0.795, "z":1.1,"h":270.30}')
    local model = 'shell_lester'
    return CreateShell(spawn, exit, model)
end)

exports('CreateRanchShell', function(spawn)--6
    local exit = json.decode('{"x":-1.257, "y":-5.469, "z":2.5, "h":270.57,}')
    local model = 'shell_ranch'
    return CreateShell(spawn, exit, model)
end)

exports('CreateContainer', function(spawn)--7
    local exit = json.decode('{"x": 0.08, "y": -5.73, "z": 1.24, "h": 359.32}')
    local model = 'container_shell'
    return CreateShell(spawn, exit, model)
end)

exports('CreateFurniMid', function(spawn)--8
    local exit = json.decode('{"x": 1.46, "y": -10.33, "z": 1.06, "h": 0.39}')
    local model = 'furnitured_midapart'
    return CreateShell(spawn, exit, model)
end)

exports('CreateFurniMotelModern', function(spawn)--9
    local exit = json.decode('{"x": 4.98, "y": 4.35, "z": 1.16, "h": 179.79}')
    local model = 'modernhotel_shell'
    return CreateShell(spawn, exit, model)
end)

exports('CreateFranklinAunt', function(spawn)--10
    local exit = json.decode('{"x": -0.36, "y": -5.89, "z": 1.70, "h": 358.21}')
    local model = 'shell_frankaunt'
    return CreateShell(spawn, exit, model)
end)

exports('CreateGarageMed', function(spawn)--11
    local exit = json.decode('{"x": 13.90, "y": 1.63, "z": 1.0, "h": 87.05}')
    local model = 'shell_garagem'
    return CreateShell(spawn, exit, model)
end)

exports('CreateMichael', function(spawn)--12
    local exit = json.decode('{"x": -9.49, "y": 5.54, "z": 9.91, "h": 270.86}')
    local model = 'shell_michael'
    return CreateShell(spawn, exit, model)
end)

exports('CreateOffice1', function(spawn)--13
    local exit = json.decode('{"x": 1.88, "y": 5.06, "z": 2.05, "h": 180.07}')
    local model = 'shell_office1'
    return CreateShell(spawn, exit, model)
end)

exports('CreateStore1', function(spawn)--14
    local exit = json.decode('{"x": -2.61, "y": -4.73, "z": 1.08, "h": 1.0}')
    local model = 'shell_store1'
    return CreateShell(spawn, exit, model)
end)

exports('CreateWarehouse1', function(spawn)--15
    local exit = { x = -8.95, y = 0.51, z = 1.04, h = 268.82 }
    local model = 'shell_warehouse1'
    return CreateShell(spawn, exit, model)
end)


-- Util Command (can be commented out - used for setting new spots in the config)

RegisterCommand('getintoffset', function()
    local coords = GetEntityCoords(PlayerPedId())
    local houseCoords = vector3(
        spawnPoint.x,
        spawnPoint.y,
        spawnPoint.z 
    )
	local xdist = coords.x - houseCoords.x
	local ydist = coords.y - houseCoords.y
	local zdist = coords.z - houseCoords.z
	print('X: ' .. xdist)
	print('Y: ' .. ydist)
	print('Z: ' .. zdist)
end, false)
