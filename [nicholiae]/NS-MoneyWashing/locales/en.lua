local Translations = {
    error = {
        negative = 'Trying to sell a negative amount?',
        no_melt = 'You didn\'t give me anything to wash...',
        no_items = 'Not enough items',
        inventory_full = 'Inventory too full to receive all possible items. Try making sure inventory isn\'t full next time. Items Lost: %{value}'
    },
    success = {
        sold = 'You have sold %{value} x %{value2} for $%{value3}',
        items_received = 'You received $%{value} for %{value2} stacks worth $%{value3}. Taxes Paid: $%{value4}',
    },
    info = {
        title = 'Wash Shop',
        subject = 'Washing Items',
        message = 'We finished washing your money. You can come pick them up at any time.',
        open_pawn = 'Open the Wash Shop',
        sell = 'Sell Items',
        sell_pawn = 'Sell Items To The Wash Shop',
        melt = 'Wash Items',
        melt_pawn = 'Open the Wash Shop',
        melt_pickup = 'Pickup Washed Items',
        pawn_closed = 'Washshop is closed. Come back between %{value}:00 AM - %{value2}:00 PM',
        sell_items = 'Selling Price $%{value}',
        back = '⬅ Go Back',
        melt_item = 'Wash %{value}',
        max = 'Max Amount %{value}',
        submit = 'Wash',
        melt_wait = 'Give me %{value} minutes and I\'ll have your money washed',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
