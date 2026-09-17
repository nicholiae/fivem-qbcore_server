local Translations = {
    success = {
        you_have_been_clocked_in = "You Have Been Clocked In RB",
    },
    text = {
        point_enter_warehouse = "[E] Enter Warehouse RB",
        enter_warehouse= "Enter Warehouse RB",
        exit_warehouse= "Exit Warehouse RB",
        point_exit_warehouse = "[E] Exit Warehouse RB",
        clock_out = "[E] Clock Out RB",
        clock_in = "[E] Clock In RB",
        hand_in_package = "Hand In Package RB",
        point_hand_in_package = "[E] Hand In Package RB",
        get_package = "Get Package RB",
        point_get_package = "[E] Get Package RB",
        picking_up_the_package = "Picking up the package RB",
        unpacking_the_package = "Unpacking the package RB",
    },
    error = {
        you_have_clocked_out = "You Have Clocked Out RB"
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})