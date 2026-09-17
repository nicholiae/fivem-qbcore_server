Config = {
    -- Command that opens the leaderboard
    command_open = "leader",

    -- Upon killing, the player gains that amount of score.
    kill_score = 100,
    -- Upon dying, the player loses that amount of score.
    death_score = 50,
}

translate = {
    TR_TITLE = "StarValley RP Killas",

    TR_PLAYER = "PLAYER",
    TR_KILLS = "KILLS",
    TR_DEATHS = "DEATHS",
    TR_SCORE = "SCORE",

    TR_YOUR_RANK = "Your Rank",
    TR_POSITION = "POSITION",
}

-- Definition of Ranks.
-- name         -> Name of rank
-- img          -> Icon of Rank, in html/img folder
-- score        -> The score needed to reach this rank
-- max_score    -> The score needed to reach the next rank from this one.
ranks = {
    {
        name = "Silver I",
        img = "img/1.png",
        score = 0,
        max_score = 200,
    },

    {
        name = "Silver II",
        img = "img/2.png",
        score = 200,
        max_score = 400,
    },

    {
        name = "Silver III",
        img = "img/3.png",
        score = 400,
        max_score = 700,
    },

    {
        name = "Silver IV",
        img = "img/4.png",
        score = 700,
        max_score = 1000,
    },

    {
        name = "Silver Elite",
        img = "img/5.png",
        score = 1000,
        max_score = 1500,
    },

    {
        name = "Silver Elite Master",
        img = "img/6.png",
        score = 1500,
        max_score = 2000,
    },

    {
        name = "Gold Nova I",
        img = "img/7.png",
        score = 2000,
        max_score = 3000,
    },

    {
        name = "Gold Nova II",
        img = "img/8.png",
        score = 3000,
        max_score = 4000,
    },

    {
        name = "Gold Nova III",
        img = "img/9.png",
        score = 4000,
        max_score = 5500,
    },

    {
        name = "Gold Nova Master",
        img = "img/10.png",
        score = 5500,
        max_score = 6500,
    },

    {
        name = "Gold Guardian I",
        img = "img/11.png",
        score = 6500,
        max_score = 7500,
    },

    {
        name = "Gold Guardian II",
        img = "img/12.png",
        score = 7500,
        max_score = 9000,
    },

    {
        name = "Gold Guardian Elite",
        img = "img/13.png",
        score = 9000,
        max_score = 10000,
    },

    {
        name = "Distinguished Master Guardian",
        img = "img/14.png",
        score = 10000,
        max_score = 11500,
    },

    {
        name = "Legendary Eagle",
        img = "img/15.png",
        score = 11500,
        max_score = 13000,
    },

    {
        name = "Legendary Eagle Master",
        img = "img/16.png",
        score = 13000,
        max_score = 15000,
    },

    {
        name = "Supreme Master First Class",
        img = "img/17.png",
        score = 15000,
        max_score = 17000,
    },

    {
        name = "Global Elite",
        img = "img/18.png",
        score = 17000,
        max_score = 20000,
    },
}