
function scr_use_item(_item_name) {
    switch (_item_name) {
        case "Potion":
            sanity_change(25);
            scr_hotbar_remove_one("Potion");
            break;
        
        case "Milk":
            sanity_change(10);
            scr_hotbar_remove_one("Milk");
            break;
        
        case "Golden Apple":
            global.sanity = global.max_sanity; // full heal
            scr_hotbar_remove_one("Golden Apple");
            
            // Speed boost
            obj_player.move_spd = obj_player.base_move_spd * 1.5; // adjust multiplier as you like
            obj_player.speed_boost_timer = room_speed * 60; // 1 minute
            break;
    }
}