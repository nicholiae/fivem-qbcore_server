return {
    debug = false,
    selectionDistance = 30.0,

    timeouts = {
        beforeRemovingPet = 60 * 1000,                -- Timeout before dead / not existing pet is deleted
        beforeAllowingToSpawnNewPet = 30 * 60 * 1000, -- Timeout before user can spawn new pet (after it died)
        respawnTimeoutEnabledOnRecall = false
    },

    binds = {
        enabled = true,
        action = {
            defaultBind = "NUMPAD2",
            text = "Start selecting position/entitys"
        },
        actionWithoutSelection = {
            defaultBind = "NUMPAD3",
            text = "Open basic pet menu"
        }
    },

    commands = {
        spawn = {
            enabled = true,
            command = "spawnpet",
            useAce = false
        }
    }
}
