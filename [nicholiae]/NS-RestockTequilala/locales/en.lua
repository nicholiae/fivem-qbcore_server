local Translations = {
    success = {
        you_have_been_clocked_in = "You Have Been Clocked In RT",
    },
    text = {
        point_enter_warehouse = "[E] Enter Warehouse RT",
        enter_warehouse= "Enter Warehouse RT",
        exit_warehouse= "Exit Warehouse RT",
        point_exit_warehouse = "[E] Exit Warehouse RT",
        clock_out = "[E] Clock Out RT",
        clock_in = "[E] Clock In RT",
        hand_in_package = "Hand In Package RT",
        point_hand_in_package = "[E] Hand In Package RT",
        get_package = "Get Package RT",
        point_get_package = "[E] Get Package RT",
        picking_up_the_package = "Picking up the package RT",
        unpacking_the_package = "Unpacking the package RT",
    },
    error = {
        you_have_clocked_out = "You Have Clocked Out RT"
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})