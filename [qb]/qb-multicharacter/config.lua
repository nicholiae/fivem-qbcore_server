Config = {}
Config.Interior = vector3(-814.89, 181.95, 76.85) -- Interior to load where characters are previewed
Config.DefaultSpawn = vector3(-1035.71, -2731.87, 12.86) -- Default spawn coords if you have start apartments disabled
Config.PedCoords = vector4(-813.97, 176.22, 76.74, -7.5) -- Create preview ped at these coordinates
Config.HiddenCoords = vector4(-812.23, 182.54, 76.74, 156.5) -- Hides your actual ped while you are in selection
Config.CamCoords = vector4(-813.46, 178.95, 76.85, 174.5) -- Camera coordinates for character preview screen
Config.EnableDeleteButton = true -- Define if the player can delete the character or not
Config.customNationality = false -- Defines if Nationality input is custom of blocked to the list of Countries
Config.SkipSelection = true -- Skip the spawn selection and spawns the player at the last location

Config.DefaultNumberOfCharacters = 2 -- Define maximum amount of default characters (maximum 5 characters defined by default)
Config.PlayersNumberOfCharacters = { -- Define maximum amount of player characters by rockstar license (you can find this license in your server's database in the player table)
    { license = "license:0f59caaac253a21b9837efe2e107a00ab8478b6d", numberOfChars = 10 }, -- nicholaie
    { license = "license:4c9b163a830ae62d6bd6ecefa2db9a9e3e130491", numberOfChars = 4 }, -- freesmoke
    { license = "license:10b53826e8f90d99e2d8a83a33919db8e81a30bf", numberOfChars = 4 }, -- manish
    { license = "license:50e10bf322129dccf158cfd848e2de8b78fa8c2f", numberOfChars = 4 }, -- sheriff
    { license = "license:0f9ff2fbee001c5d12386aeb37e118728ca56642", numberOfChars = 4 }, -- bones
}