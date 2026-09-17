local Translations = {
    success = {
        you_have_been_clocked_in = "You Have Been Clocked In OTF",
    },
    text = {
        point_enter_warehouse = "[E] Enter Warehouse OTF",
        enter_warehouse= "Enter Warehouse OTF",
        exit_warehouse= "Exit Warehouse OTF",
        point_exit_warehouse = "[E] Exit Warehouse OTF",
        clock_out = "[E] Clock Out OTF",
        clock_in = "[E] Clock In OTF",
        hand_in_package = "Hand In Package OTF",
        point_hand_in_package = "[E] Hand In Package OTF",
        get_package = "Get Package OTF",
        point_get_package = "[E] Get Package OTF",
        picking_up_the_package = "Picking up the package OTF",
        unpacking_the_package = "Unpacking the package OTF",
    },
    error = {
        you_have_clocked_out = "You Have Clocked Out OTF"
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})