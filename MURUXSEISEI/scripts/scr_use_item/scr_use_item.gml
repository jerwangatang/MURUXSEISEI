function scr_use_item(_item_name) {
    switch (_item_name) {
        case "Potion":
            sanity_change(25);
            audio_play_sound(snd_ding, 1, false);
            scr_hotbar_remove_one("Potion");
            break;
        
        case "Milk":
            sanity_change(10);
            audio_play_sound(snd_ding, 1, false);
            scr_hotbar_remove_one("Milk");
            break;
        
        case "Golden Apple":
            global.sanity = global.max_sanity;
            audio_play_sound(snd_ding, 1, false);
            scr_hotbar_remove_one("Golden Apple");
            
            obj_player.move_spd = obj_player.base_move_spd * 1.5;
            obj_player.speed_boost_timer = room_speed * 60;
            break;
    }
}