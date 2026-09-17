Config = {}

Config.Tables = {
    Active = true,
    Interaction = {
        Target = {
            Raise = {
                label = "Raise table",
                icon = "fas fa-arrow-up",
            },
            Lower = {
                label = "Lower table",
                icon = "fas fa-arrow-down",
            }
        },
        Native = {
            notify = "Press {H} to raise/lower the table",
            input = 74
        }
    },
}

-- Require fm_modules
Config.Seats = {
    Active = true,
    Interaction = {
        Target = {
            label = "Seat",
            icon = "fa-solid fa-chair"
        },
        Native = {
            notify = "Press {E} to sit down",
            input = 38
        }
    },

    Animations = {
        {dict = 'amb@prop_human_seat_chair@male@left_elbow_on_knee@base', name = 'base'},
        {dict = 'amb@prop_human_seat_chair@male@generic@base', name = 'base'},
        {dict = 'amb@prop_human_seat_chair@male@right_foot_out@base', name = 'base'}
    },

    Notification = "%s Change animation\n%s Get up",
    -- https://docs.fivem.net/docs/game-references/controls/#controls
    Controls = {
        ChangePosition = {id = 131, name = "INPUT_VEH_SUB_ASCEND"},
        GetUp          = {id = 194, name = "INPUT_FRONTEND_RRIGHT"},
    }
}

-- Require fm_modules
Config.Stashes = {
    Active = false,

    Options = {
        ["comedy_cloth_deposit"] = {
            active = true,
            label = "Open cloth deposit",
            icon = "fa-solid fa-shirt",
            
            inv = {
                label = "Cloth deposit",
                slots = 20,
                maxWeight = 2000,

                -- For QB: https://docs.qbcore.org/qbcore-documentation/qbcore-resources/qb-target
                -- For Ox: https://overextended.dev/ox_inventory/Guides/stashes#stash-properties
                groups = nil,
            }
        },
        ["comedy_reception_shelf"] = {
            active = true,
            label = "Open",
            icon = "fa-solid fa-box-open",
            
            inv = {
                label = "Reception shelf",
                slots = 20,
                maxWeight = 2000,

                -- For QB: https://docs.qbcore.org/qbcore-documentation/qbcore-resources/qb-target
                -- For Ox: https://overextended.dev/ox_inventory/Guides/stashes#stash-properties
                groups = nil,
            }
        },
    },
}

-- Require fm_modules
Config.Peds = {
    Active = false
}