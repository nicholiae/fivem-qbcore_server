QBConfig = {}

QBConfig.MaxPlayers = GetConvarInt('sv_maxclients', 128) -- Gets max players from config file, default 48
QBConfig.DefaultSpawn = vector4(-1035.71, -2731.87, 12.86, 0.0)
QBConfig.UpdateInterval = 5                             -- how often to update player data in minutes
QBConfig.StatusInterval = 5000                          -- how often to check hunger/thirst status in milliseconds

QBConfig.Money = {}
QBConfig.Money.MoneyTypes = { cash = 500, bank = 5000, crypto = 0, starbucks = 10 } -- type = startamount - Add or remove money types for your server (for ex. blackmoney = 0), remember once added it will not be removed from the database!
QBConfig.Money.DontAllowMinus = { 'cash', 'crypto', 'starbucks' }                -- Money that is not allowed going in minus
QBConfig.Money.PayCheckTimeOut = 30                                 -- The time in minutes that it will give the paycheck
QBConfig.Money.PayCheckSociety = true                              -- If true paycheck will come from the society account that the player is employed at, requires qb-management
QBConfig.Money.PayCheckMultiplier = 1                              -- This will apply to both paycheck frequency and paycheck amount
QBConfig.Money.TaxRate = 0.07

QBConfig.Player = {}
QBConfig.Player.HungerRate = 3.2 -- Rate at which hunger goes down.
QBConfig.Player.ThirstRate = 2.4 -- Rate at which thirst goes down.
QBConfig.Player.HygieneRate = 1.3 -- Rate at which hygiene goes down.
-- QBConfig.Player.HygieneRate = 0.25 -- Rate at which hygiene goes down.
QBConfig.Player.BioOneRate = 0.9 -- Rate at which bioone goes down.
-- QBConfig.Player.BioOneRate = 0.25 -- Rate at which bioone goes down.
QBConfig.Player.BioTwoRate = 0.6 -- Rate at which biotwo goes down.
-- QBConfig.Player.BioTwoRate = 0.25 -- Rate at which biotwo goes down.
QBConfig.Player.Bloodtypes = {
    'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-',
}

QBConfig.Player.PlayerDefaults = {
    citizenid = function() return QBCore.Player.CreateCitizenId() end,
    cid = 1,
    money = function()
        local moneyDefaults = {}
        for moneytype, startamount in pairs(QBConfig.Money.MoneyTypes) do
            moneyDefaults[moneytype] = startamount
        end
        return moneyDefaults
    end,
    optin = true,
    charinfo = {
        firstname = 'Firstname',
        lastname = 'Lastname',
        birthdate = '00-00-0000',
        gender = 0,
        nationality = 'USA',
        phone = function() return QBCore.Functions.CreatePhoneNumber() end,
        account = function() return QBCore.Functions.CreateAccountNumber() end
    },
    job = {
        name = 'unemployed',
        label = 'Civilian',
        payment = 10,
        type = 'none',
        onduty = false,
        isboss = false,
        grade = {
            name = 'Freelancer',
            level = 0
        }
    },
    gang = {
        name = 'none',
        label = 'No Gang Affiliation',
        isboss = false,
        grade = {
            name = 'none',
            level = 0
        }
    },
    metadata = {
        hunger = 100,
        thirst = 100,
        hygiene = 100,
        bioone = 100,
        biotwo = 100,
        stress = 0,
        isdead = false,
        inlaststand = false,
        armor = 0,
        ishandcuffed = false,
        tracker = false,
        injail = 0,
        jailitems = {},
        status = {},
        phone = {},
        rep = {},
        pimpmultiplier = 1,
        currentapartment = nil,
        callsign = 'NO CALLSIGN',
        bloodtype = function() return QBConfig.Player.Bloodtypes[math.random(1, #QBConfig.Player.Bloodtypes)] end,
        fingerprint = function() return QBCore.Player.CreateFingerId() end,
        walletid = function() return QBCore.Player.CreateWalletId() end,
        criminalrecord = {
            hasRecord = false,
            date = nil
        },
		drugaddictions = {
			addictions = {},
			tolerance = {},
			lastUse = {},
			lastOnline = 0,
			totalUseCount = {},
			recentUses = {}
		},
        licences = {
            driver = true,
            business = false,
            weapon = false,
            xscript = false,
            mscript = false,
            oscript = false,
            ascript = false,
            iscript = false,
            warrant = false
        },
        inside = {
            house = nil,
            apartment = {
                apartmentType = nil,
                apartmentId = nil,
            }
        },
        phonedata = {
            SerialNumber = function() return QBCore.Player.CreateSerialNumber() end,
            InstalledApps = {}
        }
    },
    position = QBConfig.DefaultSpawn,
    items = {},
}

QBConfig.Server = {}                                    -- General server config
QBConfig.Server.Closed = false                          -- Set server closed (no one can join except people with ace permission 'qbadmin.join')
QBConfig.Server.ClosedReason = 'Server Closed'          -- Reason message to display when people can't join the server
QBConfig.Server.Uptime = 0                              -- Time the server has been up.
QBConfig.Server.Whitelist = false                       -- Enable or disable whitelist on the server
QBConfig.Server.WhitelistPermission = 'admin'           -- Permission that's able to enter the server when the whitelist is on
QBConfig.Server.PVP = true                              -- Enable or disable pvp on the server (Ability to shoot other players)
QBConfig.Server.Discord = 'https://discord.gg/VTBxU2X5du'                            -- Discord invite link
QBConfig.Server.CheckDuplicateLicense = true            -- Check for duplicate rockstar license on join
QBConfig.Server.Permissions = { 'god', 'admin', 'mod' } -- Add as many groups as you want here after creating them in your server.cfg

QBConfig.Commands = {}                                  -- Command Configuration
QBConfig.Commands.OOCColor = { 255, 151, 133 }          -- RGB color code for the OOC command

QBConfig.Notify = {}

QBConfig.Notify.NotificationStyling = {
    group = false,      -- Allow notifications to stack with a badge instead of repeating
    position = 'bottom', -- top-left | top-right | bottom-left | bottom-right | top | bottom | left | right | center
    progress = true     -- Display Progress Bar
}

-- These are how you define different notification variants
-- The "color" key is background of the notification
-- The "icon" key is the css-icon code, this project uses `Material Icons` & `Font Awesome`
QBConfig.Notify.VariantDefinitions = {
    success = {
        classes = 'success',
        icon = 'check_circle'
    },
    primary = {
        classes = 'primary',
        icon = 'notifications'
    },
    warning = {
        classes = 'warning',
        icon = 'warning'
    },
    info = {
        classes = 'primary',
        icon = 'notifications'
    },
    error = {
        classes = 'error',
        icon = 'error'
    },
    police = {
        classes = 'police',
        icon = 'local_police'
    },
    ambulance = {
        classes = 'ambulance',
        icon = 'fas fa-ambulance'
    }
}
