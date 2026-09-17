Config = {
    Debug = false,            -- true / false - Currently prints the vector3 and label of locations when requesting a delivery
    UseTarget = GetConvar('UseTarget', 'false') == 'true', -- Use qb-target interactions (don't change this, go to your server.cfg and add setr UseTarget true)
    PoliceCallChance = 20,                                 --in percentage (if 99, theres the 99% to call the police)
    -- Selling Config
    SuccessChance = 75,
    ScamChance = 25,
    RobberyChance = 18,
    MinimumSalePrice = 250,
    MaximumSalePrice = 500,
    MinRisk = 400,
    MaxRisk = 800,
}
