return {
    rottweiler1 = {
        model = "a_c_rottweiler",
		name = 'rottweiler1',
        actions = {
            move = { "selection", "player", "vehicle" },
            sit = { "base", "selection" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            ["break"] = { "base", "selection" },
            wander = { "base", "selection" },
            taunt = { "base", "selection" },
            beg = { "base", "selection" },
            paw = { "base", "selection" },
            dead = { "base", "selection" },
            attack = { "player", "ped" },
            getout = { "invehicle" },
            getin = { "vehicle" }
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@rottweiler@tricks@",
                anim = "sit_loop"
            },
            sitInCar = {
                dict = "creatures@rottweiler@in_vehicle@std_car",
                anim = "sit"
            },
            ["break"] = {
                dict = "creatures@rottweiler@amb@sleep_in_kennel@",
                anim = "sleep_in_kennel"
            },
            taunt = {
                dict = "creatures@rottweiler@melee@streamed_taunts@",
                anim = "taunt_02"
            },
            beg = {
                dict = "creatures@rottweiler@tricks@",
                anim = "beg_loop"
            },
            paw = {
                dict = "creatures@rottweiler@tricks@",
                anim = "paw_right_loop"
            },
            dead = {
                dict = "creatures@rottweiler@move",
                anim = "dead_left"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            { 4, 0, 0, 0 }
        }
    },
    rottweiler2 = {
        model = "a_c_rottweiler",
		name = 'rottweiler2',
        actions = {
            move = { "selection", "player", "vehicle" },
            sit = { "base", "selection" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            ["break"] = { "base", "selection" },
            wander = { "base", "selection" },
            taunt = { "base", "selection" },
            beg = { "base", "selection" },
            paw = { "base", "selection" },
            dead = { "base", "selection" },
            attack = { "player", "ped" },
            getout = { "invehicle" },
            getin = { "vehicle" }
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@rottweiler@tricks@",
                anim = "sit_loop"
            },
            sitInCar = {
                dict = "creatures@rottweiler@in_vehicle@std_car",
                anim = "sit"
            },
            ["break"] = {
                dict = "creatures@rottweiler@amb@sleep_in_kennel@",
                anim = "sleep_in_kennel"
            },
            taunt = {
                dict = "creatures@rottweiler@melee@streamed_taunts@",
                anim = "taunt_02"
            },
            beg = {
                dict = "creatures@rottweiler@tricks@",
                anim = "beg_loop"
            },
            paw = {
                dict = "creatures@rottweiler@tricks@",
                anim = "paw_right_loop"
            },
            dead = {
                dict = "creatures@rottweiler@move",
                anim = "dead_left"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            { 4, 0, 1, 0 }
        }
    },
    rottweiler3 = {
        model = "a_c_rottweiler",
		name = 'rottweiler3',
        actions = {
            move = { "selection", "player", "vehicle" },
            sit = { "base", "selection" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            ["break"] = { "base", "selection" },
            wander = { "base", "selection" },
            taunt = { "base", "selection" },
            beg = { "base", "selection" },
            paw = { "base", "selection" },
            dead = { "base", "selection" },
            attack = { "player", "ped" },
            getout = { "invehicle" },
            getin = { "vehicle" }
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@rottweiler@tricks@",
                anim = "sit_loop"
            },
            sitInCar = {
                dict = "creatures@rottweiler@in_vehicle@std_car",
                anim = "sit"
            },
            ["break"] = {
                dict = "creatures@rottweiler@amb@sleep_in_kennel@",
                anim = "sleep_in_kennel"
            },
            taunt = {
                dict = "creatures@rottweiler@melee@streamed_taunts@",
                anim = "taunt_02"
            },
            beg = {
                dict = "creatures@rottweiler@tricks@",
                anim = "beg_loop"
            },
            paw = {
                dict = "creatures@rottweiler@tricks@",
                anim = "paw_right_loop"
            },
            dead = {
                dict = "creatures@rottweiler@move",
                anim = "dead_left"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            { 4, 0, 2, 0 }
        }
    },
    cat1 = {
        model = "a_c_cat_01",
		name = 'cat1',
        actions = {
            move = { "selection", "player", "vehicle" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            wander = { "base", "selection" },
            getout = { "invehicle" },
            getin = { "vehicle" },

            sleep = { "base", "selection" },
            idle = { "base", "selection" },
            dead = { "base", "selection" },
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@cat@amb@world_cat_sleeping_ground@base",
                anim = "base"
            },
            sleep = {
                dict = "creatures@cat@amb@world_cat_sleeping_ground@base",
                anim = "base"
            },
            idle = {
                dict = "creatures@cat@move",
                anim = "idle"
            },
            dead = {
                dict = "creatures@cat@move",
                anim = "dead_left"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            { 0, 0, 0, 0 }
        }
    },
    cat2 = {
        model = "a_c_cat_01",
		name = 'cat2',
        actions = {
            move = { "selection", "player", "vehicle" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            wander = { "base", "selection" },
            getout = { "invehicle" },
            getin = { "vehicle" },

            sleep = { "base", "selection" },
            idle = { "base", "selection" },
            dead = { "base", "selection" },
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@cat@amb@world_cat_sleeping_ground@base",
                anim = "base"
            },
            sleep = {
                dict = "creatures@cat@amb@world_cat_sleeping_ground@base",
                anim = "base"
            },
            idle = {
                dict = "creatures@cat@move",
                anim = "idle"
            },
            dead = {
                dict = "creatures@cat@move",
                anim = "dead_left"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            { 0, 0, 1, 0 }
        }
    },
    cat3 = {
        model = "a_c_cat_01",
		name = 'cat3',
        actions = {
            move = { "selection", "player", "vehicle" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            wander = { "base", "selection" },
            getout = { "invehicle" },
            getin = { "vehicle" },

            sleep = { "base", "selection" },
            idle = { "base", "selection" },
            dead = { "base", "selection" },
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "rcmextreme3",
                anim = "idle"
            },
            sit = {
                dict = "creatures@cat@amb@world_cat_sleeping_ground@base",
                anim = "base"
            },
            sleep = {
                dict = "creatures@cat@amb@world_cat_sleeping_ground@base",
                anim = "base"
            },
            idle = {
                dict = "creatures@cat@move",
                anim = "idle"
            },
            dead = {
                dict = "creatures@cat@move",
                anim = "dead_left"
            },

        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            { 0, 0, 2, 0 }
        }
    },
    chicken = {
        model = "a_c_hen",
		name = 'chicken',
        actions = {
            move = { "selection", "player", "vehicle" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            getout = { "invehicle" },
            getin = { "vehicle" },
            peck = { "base", "selection" },
            idle = { "base", "selection" },
            dead = { "base", "selection" },
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            peck = {
                dict = "creatures@hen@amb@world_hen_pecking@base",
                anim = "base"
            },
            idle = {
                dict = "creatures@hen@amb@world_hen_standing@idle_a",
                anim = "idle_b"
            },
            dead = {
                dict = "creatures@hen@move",
                anim = "dead_left"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            -- {4, 0, 1, 0}
        }
    },
    husky1 = {
        model = "a_c_husky",
		name = 'husky1',
        actions = {
            move = { "selection", "player", "vehicle" },
            sit = { "base", "selection" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            ["break"] = { "base", "selection" },
            wander = { "base", "selection" },
            taunt = { "base", "selection" },
            beg = { "base", "selection" },
            paw = { "base", "selection" },
            dead = { "base", "selection" },
            attack = { "player", "ped" },
            getout = { "invehicle" },
            getin = { "vehicle" }
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@rottweiler@tricks@",
                anim = "sit_loop"
            },
            beg = {
                dict = "creatures@rottweiler@tricks@",
                anim = "beg_loop"
            },
            paw = {
                dict = "creatures@rottweiler@tricks@",
                anim = "paw_right_loop"
            },
            dead = {
                dict = "creatures@rottweiler@move",
                anim = "dead_left"
            },
            sitInCar = {
                dict = "creatures@rottweiler@in_vehicle@std_car",
                anim = "sit"
            },
            ["break"] = {
                dict = "creatures@rottweiler@amb@sleep_in_kennel@",
                anim = "sleep_in_kennel"
            },
            taunt = {
                dict = "creatures@rottweiler@melee@streamed_taunts@",
                anim = "taunt_02"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
        }
    },
    husky2 = {
        model = "a_c_husky",
		name = 'husky2',
        actions = {
            move = { "selection", "player", "vehicle" },
            sit = { "base", "selection" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            ["break"] = { "base", "selection" },
            wander = { "base", "selection" },
            taunt = { "base", "selection" },
            beg = { "base", "selection" },
            paw = { "base", "selection" },
            dead = { "base", "selection" },
            attack = { "player", "ped" },
            getout = { "invehicle" },
            getin = { "vehicle" }
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@rottweiler@tricks@",
                anim = "sit_loop"
            },
            beg = {
                dict = "creatures@rottweiler@tricks@",
                anim = "beg_loop"
            },
            paw = {
                dict = "creatures@rottweiler@tricks@",
                anim = "paw_right_loop"
            },
            dead = {
                dict = "creatures@rottweiler@move",
                anim = "dead_left"
            },
            sitInCar = {
                dict = "creatures@rottweiler@in_vehicle@std_car",
                anim = "sit"
            },
            ["break"] = {
                dict = "creatures@rottweiler@amb@sleep_in_kennel@",
                anim = "sleep_in_kennel"
            },
            taunt = {
                dict = "creatures@rottweiler@melee@streamed_taunts@",
                anim = "taunt_02"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            { 0, 0, 1, 0 }
        }
    },
    husky3 = {
        model = "a_c_husky",
		name = 'husky3',
        actions = {
            move = { "selection", "player", "vehicle" },
            sit = { "base", "selection" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            ["break"] = { "base", "selection" },
            wander = { "base", "selection" },
            taunt = { "base", "selection" },
            beg = { "base", "selection" },
            paw = { "base", "selection" },
            dead = { "base", "selection" },
            attack = { "player", "ped" },
            getout = { "invehicle" },
            getin = { "vehicle" }
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@rottweiler@tricks@",
                anim = "sit_loop"
            },
            beg = {
                dict = "creatures@rottweiler@tricks@",
                anim = "beg_loop"
            },
            paw = {
                dict = "creatures@rottweiler@tricks@",
                anim = "paw_right_loop"
            },
            dead = {
                dict = "creatures@rottweiler@move",
                anim = "dead_left"
            },
            sitInCar = {
                dict = "creatures@rottweiler@in_vehicle@std_car",
                anim = "sit"
            },
            ["break"] = {
                dict = "creatures@rottweiler@amb@sleep_in_kennel@",
                anim = "sleep_in_kennel"
            },
            taunt = {
                dict = "creatures@rottweiler@melee@streamed_taunts@",
                anim = "taunt_02"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            { 0, 0, 2, 0 }
        }
    },
    mtlion1 = {
        model = "a_c_mtlion",
		name = 'mtlion1',
        actions = {
            move = { "selection", "player", "vehicle" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            ["break"] = { "base", "selection" },
            wander = { "base", "selection" },
            taunt = { "base", "selection" },
            idle = { "base", "selection" },
            dead = { "base", "selection" },
            attack = { "player", "ped" },
            getout = { "invehicle" },
            getin = { "vehicle" }
        },
        followOnSpawn = false,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@cougar@amb@world_cougar_rest@base",
                anim = "base"
            },
            ["break"] = {
                dict = "creatures@cougar@amb@world_cougar_rest@base",
                anim = "base"
            },
            taunt = {
                dict = "creatures@cougar@melee@",
                anim = "growling"
            },
            idle = {
                dict = "creatures@cougar@move",
                anim = "idle"
            },
            dead = {
                dict = "creatures@rottweiler@move",
                anim = "dead_left"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            -- {4, 0, 1, 0}
        }
    },
    panther = {
        model = "a_c_panther",
		name = 'panther',
        actions = {
            move = { "selection", "player", "vehicle" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            ["break"] = { "base", "selection" },
            wander = { "base", "selection" },
            taunt = { "base", "selection" },
            idle = { "base", "selection" },
            dead = { "base", "selection" },
            attack = { "player", "ped" },
            getout = { "invehicle" },
            getin = { "vehicle" }
        },
        followOnSpawn = false,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@cougar@amb@world_cougar_rest@base",
                anim = "base"
            },
            ["break"] = {
                dict = "creatures@cougar@amb@world_cougar_rest@base",
                anim = "base"
            },
            taunt = {
                dict = "creatures@cougar@melee@",
                anim = "growling"
            },
            idle = {
                dict = "creatures@cougar@move",
                anim = "idle"
            },
            dead = {
                dict = "creatures@rottweiler@move",
                anim = "dead_left"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            -- {4, 0, 1, 0}
        }
    },
    poodle = {
        model = "a_c_poodle",
		name = 'poodle',
        actions = {
            move = { "selection", "player", "vehicle" },
            sit = { "base", "selection" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            wander = { "base", "selection" },
            dead = { "base", "selection" },
            getout = { "invehicle" },
            getin = { "vehicle" }
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@pug@amb@world_dog_sitting@base",
                anim = "base"
            },
            dead = {
                dict = "creatures@pug@move",
                anim = "dead_left"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            -- {4, 0, 1, 0}
        }
    },
    pug1 = {
        model = "a_c_pug",
		name = 'pug1',
        actions = {
            move = { "selection", "player", "vehicle" },
            sit = { "base", "selection" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            wander = { "base", "selection" },
            taunt = { "base", "selection" },
            dead = { "base", "selection" },
            attack = { "player", "ped" },
            getout = { "invehicle" },
            getin = { "vehicle" }
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@pug@amb@world_dog_sitting@base",
                anim = "base"
            },
            ["break"] = {
                dict = "creatures@rottweiler@amb@sleep_in_kennel@",
                anim = "sleep_in_kennel"
            },
            taunt = {
                dict = "creatures@pug@amb@world_dog_barking@idle_a",
                anim = "idle_a"
            },
            dead = {
                dict = "creatures@pug@move",
                anim = "dead_left"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            -- {4, 0, 1, 0}
        }
    },
    pug2 = {
        model = "a_c_pug",
		name = 'pug2',
        actions = {
            move = { "selection", "player", "vehicle" },
            sit = { "base", "selection" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            wander = { "base", "selection" },
            taunt = { "base", "selection" },
            dead = { "base", "selection" },
            attack = { "player", "ped" },
            getout = { "invehicle" },
            getin = { "vehicle" }
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@pug@amb@world_dog_sitting@base",
                anim = "base"
            },
            ["break"] = {
                dict = "creatures@rottweiler@amb@sleep_in_kennel@",
                anim = "sleep_in_kennel"
            },
            taunt = {
                dict = "creatures@pug@amb@world_dog_barking@idle_a",
                anim = "idle_a"
            },
            dead = {
                dict = "creatures@pug@move",
                anim = "dead_left"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            { 3, 0, 1, 0 },
            { 4, 0, 1, 0 }
        }
    },
    pug3 = {
        model = "a_c_pug",
		name = 'pug3',
        actions = {
            move = { "selection", "player", "vehicle" },
            sit = { "base", "selection" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            wander = { "base", "selection" },
            taunt = { "base", "selection" },
            dead = { "base", "selection" },
            attack = { "player", "ped" },
            getout = { "invehicle" },
            getin = { "vehicle" }
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@pug@amb@world_dog_sitting@base",
                anim = "base"
            },
            ["break"] = {
                dict = "creatures@rottweiler@amb@sleep_in_kennel@",
                anim = "sleep_in_kennel"
            },
            taunt = {
                dict = "creatures@pug@amb@world_dog_barking@idle_a",
                anim = "idle_a"
            },
            dead = {
                dict = "creatures@pug@move",
                anim = "dead_left"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            { 3, 0, 2, 0 },
            { 4, 0, 2, 0 }
        }
    },
    pug4 = {
        model = "a_c_pug",
		name = 'pug4',
        actions = {
            move = { "selection", "player", "vehicle" },
            sit = { "base", "selection" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            wander = { "base", "selection" },
            taunt = { "base", "selection" },
            dead = { "base", "selection" },
            attack = { "player", "ped" },
            getout = { "invehicle" },
            getin = { "vehicle" }
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@pug@amb@world_dog_sitting@base",
                anim = "base"
            },
            ["break"] = {
                dict = "creatures@rottweiler@amb@sleep_in_kennel@",
                anim = "sleep_in_kennel"
            },
            taunt = {
                dict = "creatures@pug@amb@world_dog_barking@idle_a",
                anim = "idle_a"
            },
            dead = {
                dict = "creatures@pug@move",
                anim = "dead_left"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            { 3, 0, 3, 0 },
            { 4, 0, 3, 0 }
        }
    },
    retriever1 = {
        model = "a_c_retriever",
		name = 'retriever1',
        actions = {
            move = { "selection", "player", "vehicle" },
            sit = { "base", "selection" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            ["break"] = { "base", "selection" },
            wander = { "base", "selection" },
            taunt = { "base", "selection" },
            beg = { "base", "selection" },
            paw = { "base", "selection" },
            dead = { "base", "selection" },
            attack = { "player", "ped" },
            getout = { "invehicle" },
            getin = { "vehicle" }
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@retriever@amb@world_dog_sitting@base",
                anim = "base"
            },
            sitInCar = {
                dict = "creatures@rottweiler@in_vehicle@std_car",
                anim = "sit"
            },
            ["break"] = {
                dict = "creatures@rottweiler@amb@sleep_in_kennel@",
                anim = "sleep_in_kennel"
            },
            taunt = {
                dict = "creatures@retriever@amb@world_dog_barking@base",
                anim = "base"
            },
            beg = {
                dict = "creatures@rottweiler@tricks@",
                anim = "beg_loop"
            },
            paw = {
                dict = "creatures@rottweiler@tricks@",
                anim = "paw_right_loop"
            },
            dead = {
                dict = "creatures@retriever@move",
                anim = "dead_left"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            -- {4, 0, 1, 0}
        }
    },
    retriever2 = {
        model = "a_c_retriever",
		name = 'retriever2',
        actions = {
            move = { "selection", "player", "vehicle" },
            sit = { "base", "selection" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            ["break"] = { "base", "selection" },
            wander = { "base", "selection" },
            taunt = { "base", "selection" },
            beg = { "base", "selection" },
            paw = { "base", "selection" },
            dead = { "base", "selection" },
            attack = { "player", "ped" },
            getout = { "invehicle" },
            getin = { "vehicle" }
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@retriever@amb@world_dog_sitting@base",
                anim = "base"
            },
            sitInCar = {
                dict = "creatures@rottweiler@in_vehicle@std_car",
                anim = "sit"
            },
            ["break"] = {
                dict = "creatures@rottweiler@amb@sleep_in_kennel@",
                anim = "sleep_in_kennel"
            },
            taunt = {
                dict = "creatures@retriever@amb@world_dog_barking@base",
                anim = "base"
            },
            beg = {
                dict = "creatures@rottweiler@tricks@",
                anim = "beg_loop"
            },
            paw = {
                dict = "creatures@rottweiler@tricks@",
                anim = "paw_right_loop"
            },
            dead = {
                dict = "creatures@retriever@move",
                anim = "dead_left"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            { 0, 0, 1, 0 }
        }
    },
    retriever3 = {
        model = "a_c_retriever",
		name = 'retriever3',
        actions = {
            move = { "selection", "player", "vehicle" },
            sit = { "base", "selection" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            ["break"] = { "base", "selection" },
            wander = { "base", "selection" },
            taunt = { "base", "selection" },
            beg = { "base", "selection" },
            paw = { "base", "selection" },
            dead = { "base", "selection" },
            attack = { "player", "ped" },
            getout = { "invehicle" },
            getin = { "vehicle" }
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@retriever@amb@world_dog_sitting@base",
                anim = "base"
            },
            sitInCar = {
                dict = "creatures@rottweiler@in_vehicle@std_car",
                anim = "sit"
            },
            ["break"] = {
                dict = "creatures@rottweiler@amb@sleep_in_kennel@",
                anim = "sleep_in_kennel"
            },
            taunt = {
                dict = "creatures@retriever@amb@world_dog_barking@base",
                anim = "base"
            },
            beg = {
                dict = "creatures@rottweiler@tricks@",
                anim = "beg_loop"
            },
            paw = {
                dict = "creatures@rottweiler@tricks@",
                anim = "paw_right_loop"
            },
            dead = {
                dict = "creatures@retriever@move",
                anim = "dead_left"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            { 0, 0, 2, 0 }
        }
    },
    retriever4 = {
        model = "a_c_retriever",
		name = 'retriever4',
        actions = {
            move = { "selection", "player", "vehicle" },
            sit = { "base", "selection" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            ["break"] = { "base", "selection" },
            wander = { "base", "selection" },
            taunt = { "base", "selection" },
            beg = { "base", "selection" },
            paw = { "base", "selection" },
            dead = { "base", "selection" },
            attack = { "player", "ped" },
            getout = { "invehicle" },
            getin = { "vehicle" }
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@retriever@amb@world_dog_sitting@base",
                anim = "base"
            },
            sitInCar = {
                dict = "creatures@rottweiler@in_vehicle@std_car",
                anim = "sit"
            },
            ["break"] = {
                dict = "creatures@rottweiler@amb@sleep_in_kennel@",
                anim = "sleep_in_kennel"
            },
            taunt = {
                dict = "creatures@retriever@amb@world_dog_barking@base",
                anim = "base"
            },
            beg = {
                dict = "creatures@rottweiler@tricks@",
                anim = "beg_loop"
            },
            paw = {
                dict = "creatures@rottweiler@tricks@",
                anim = "paw_right_loop"
            },
            dead = {
                dict = "creatures@retriever@move",
                anim = "dead_left"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            { 0, 0, 3, 0 }
        }
    },
    shepherd1 = {
        model = "a_c_shepherd",
		name = 'shepherd1',
        actions = {
            move = { "selection", "player", "vehicle" },
            sit = { "base", "selection" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            ["break"] = { "base", "selection" },
            wander = { "base", "selection" },
            taunt = { "base", "selection" },
            beg = { "base", "selection" },
            paw = { "base", "selection" },
            dead = { "base", "selection" },
            attack = { "player", "ped" },
            getout = { "invehicle" },
            getin = { "vehicle" }
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@rottweiler@tricks@",
                anim = "sit_loop"
            },
            sitInCar = {
                dict = "creatures@rottweiler@in_vehicle@std_car",
                anim = "sit"
            },
            ["break"] = {
                dict = "creatures@rottweiler@amb@sleep_in_kennel@",
                anim = "sleep_in_kennel"
            },
            taunt = {
                dict = "creatures@rottweiler@melee@streamed_taunts@",
                anim = "taunt_01"
            },
            beg = {
                dict = "creatures@rottweiler@tricks@",
                anim = "beg_loop"
            },
            paw = {
                dict = "creatures@rottweiler@tricks@",
                anim = "paw_right_loop"
            },
            dead = {
                dict = "creatures@rottweiler@move",
                anim = "dead_left"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            -- {4, 0, 1, 0}
        }
    },
    westy1 = {
        model = "a_c_westy",
		name = 'westy1',
        actions = {
            move = { "selection", "player", "vehicle" },
            sit = { "base", "selection" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            wander = { "base", "selection" },
            taunt = { "base", "selection" },
            dead = { "base", "selection" },
            attack = { "player", "ped" },
            getout = { "invehicle" },
            getin = { "vehicle" }
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@pug@amb@world_dog_sitting@base",
                anim = "base"
            },
            ["break"] = {
                dict = "creatures@rottweiler@amb@sleep_in_kennel@",
                anim = "sleep_in_kennel"
            },
            taunt = {
                dict = "creatures@pug@amb@world_dog_barking@idle_a",
                anim = "idle_a"
            },
            dead = {
                dict = "creatures@pug@move",
                anim = "dead_left"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            -- {4, 0, 1, 0}
        }
    },
    westy2 = {
        model = "a_c_westy",
		name = 'westy2',
        actions = {
            move = { "selection", "player", "vehicle" },
            sit = { "base", "selection" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            wander = { "base", "selection" },
            taunt = { "base", "selection" },
            dead = { "base", "selection" },
            attack = { "player", "ped" },
            getout = { "invehicle" },
            getin = { "vehicle" }
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@pug@amb@world_dog_sitting@base",
                anim = "base"
            },
            ["break"] = {
                dict = "creatures@rottweiler@amb@sleep_in_kennel@",
                anim = "sleep_in_kennel"
            },
            taunt = {
                dict = "creatures@pug@amb@world_dog_barking@idle_a",
                anim = "idle_a"
            },
            dead = {
                dict = "creatures@pug@move",
                anim = "dead_left"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            { 3, 0, 1, 0 },
            { 4, 0, 1, 0 }
        }
    },
    westy3 = {
        model = "a_c_westy",
		name = 'westy3',
        actions = {
            move = { "selection", "player", "vehicle" },
            sit = { "base", "selection" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            wander = { "base", "selection" },
            taunt = { "base", "selection" },
            dead = { "base", "selection" },
            attack = { "player", "ped" },
            getout = { "invehicle" },
            getin = { "vehicle" }
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            sit = {
                dict = "creatures@pug@amb@world_dog_sitting@base",
                anim = "base"
            },
            ["break"] = {
                dict = "creatures@rottweiler@amb@sleep_in_kennel@",
                anim = "sleep_in_kennel"
            },
            taunt = {
                dict = "creatures@pug@amb@world_dog_barking@idle_a",
                anim = "idle_a"
            },
            dead = {
                dict = "creatures@pug@move",
                anim = "dead_left"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            { 3, 0, 5, 0 },
            { 4, 0, 2, 0 }
        }
    },
    rabbit = {
        model = "a_c_rabbit_01",
		name = 'rabbit',
        actions = {
            move = { "selection", "player", "vehicle" },
            follow = { "base", "selection", "player", "ped", "vehicle" },
            getout = { "invehicle" },
            getin = { "vehicle" },
            eat = { "base", "selection" },
            idle = { "base", "selection" },
            dead = { "base", "selection" },
        },
        followOnSpawn = true,
        animations = {
            calling = {
                dict = "taxi_hail",
                anim = "hail_taxi"
            },
            eat = {
                dict = "creatures@rabbit@amb@world_rabbit_eating@base",
                anim = "base"
            },
            idle = {
                dict = "creatures@rabbit@move",
                anim = "idle"
            },
            dead = {
                dict = "creatures@rabbit@move",
                anim = "dead_left"
            },
        },
        skin = {
            -- componentId, drawableId, textureId, paletteId
            -- {4, 0, 1, 0}
        }
    },
}
