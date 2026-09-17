Config = {}

-- Item name (must match the item added to qb-core/shared/items.lua)
Config.ItemName = 'physicalcash'

-- Minimum and maximum amounts allowed
Config.MinAmount = 1
Config.MaxAmount = 100000

-- Enable/disable logging
Config.EnableLogging = true

-- Cooldown between conversions (in milliseconds)
Config.ConversionCooldown = 1000 -- 1 second

-- Enable/disable notifications
Config.EnableNotifications = true

-- Animation settings
Config.UseAnimation = true
Config.AnimationDict = 'mp_common'
Config.AnimationName = 'givetake1_a'
Config.AnimationDuration = 2000 -- 2 seconds

-- Security settings
Config.MaxConversionsPerMinute = 10 -- Prevent spam/exploits
Config.EnableAntiDupe = true

-- UI Settings
Config.UISettings = {
    primaryColor = '#2ecc71',
    dangerColor = '#e74c3c',
    backgroundColor = 'rgba(0, 0, 0, 0.9)',
    borderRadius = '10px'
}