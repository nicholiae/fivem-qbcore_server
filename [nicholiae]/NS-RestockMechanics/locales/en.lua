local Translations = {
    success = {
        you_have_been_clocked_in = "You Have Been Clocked In RM",
    },
    text = {
        point_enter_warehouse = "[E] Enter RM Warehouse",
        enter_warehouse= "Enter RM Warehouse",
        exit_warehouse= "Exit RM Warehouse",
        point_exit_warehouse = "[E] Exit RM Warehouse",
        clock_out = "[E] Clock RM Out",
        clock_in = "[E] Clock RM In",
        hand_in_package = "Hand In RM Package",
        point_hand_in_package = "[E] Hand In RM Package",
        get_package = "Get RM Package",
        point_get_package = "[E] Get RM Package",
        picking_up_the_package = "Picking up the RM package",
        unpacking_the_package = "Unpacking the RM package",
    },
    error = {
        you_have_clocked_out = "You Have Clocked Out RM"
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})