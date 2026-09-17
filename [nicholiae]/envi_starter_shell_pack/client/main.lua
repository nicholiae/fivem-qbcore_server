local QBCore = exports['qb-core']:GetCoreObject()

exports('CreateNV1u', function(spawn)--15
    local exit = { x = -8.95, y = 0.51, z = 1.04, h = 268.82 }
    local model = 'envi_shell_01_empty'
    exports['qb-interior']:CreateShell(spawn, exit, model)
end)

exports('CreateNV1f', function(spawn)--15
    local exit = { x = -2.95, y = 0.51, z = 1.04, h = 268.82 }
    local model = 'envi_shell_01_furnished'
    exports['qb-interior']:CreateShell(s, exit, model)
end)

exports('CreateNV2u', function(spawn)--15
    local exit = { x = -8.95, y = 0.51, z = 1.04, h = 268.82 }
    local model = 'envi_shell_02_empty'
    exports['qb-interior']:CreateShell(spawn, exit, model)
end)

exports('CreateNV2f', function(spawn)--15
    local exit = { x = -8.95, y = 0.51, z = 1.04, h = 268.82 }
    local model = 'envi_shell_02_furnished'
    exports['qb-interior']:CreateShell(spawn, exit, model)
end)

exports('CreateNV3u', function(spawn)--15
    local exit = { x = -8.95, y = 0.51, z = 1.04, h = 268.82 }
    local model = 'envi_shell_02_empty'
    exports['qb-interior']:CreateShell(spawn, exit, model)
end)

exports('CreateNV3f', function(spawn)--15
    local exit = { x = -8.95, y = 0.51, z = 1.04, h = 268.82 }
    local model = 'envi_shell_03_furnished'
    exports['qb-interior']:CreateShell(spawn, exit, model)
end)
