if (place_meeting(x, y, obj_player)) {
    if (keyboard_check_pressed(vk_enter)) {
        shop_open = !shop_open;
    }
}

if (shop_open) {
    if (keyboard_check_pressed(vk_down)) {
        selected_index = (selected_index + 1) mod array_length(shop_items);
    }
    if (keyboard_check_pressed(vk_up)) {
        selected_index = (selected_index - 1 + array_length(shop_items)) mod array_length(shop_items);
    }
    
    if (keyboard_check_pressed(vk_space)) {
        var _item = shop_items[selected_index];
        
        if (_item.owned) {
            show_debug_message("Already own this!");
        } else if (global.coins >= _item.price) {
            global.coins -= _item.price;
            _item.owned = true;
            
            // Permanent sanity boost
            global.max_sanity += 10;
            global.sanity += 10; // also top up current sanity by the same amount
            
            show_debug_message("Bought " + _item.name + "! Max sanity increased.");
        } else {
            show_debug_message("Not enough coins!");
        }
    }
    
    if (keyboard_check_pressed(vk_escape)) {
        shop_open = false;
    }
}