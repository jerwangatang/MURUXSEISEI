

if (!opened_today) {
    opened_today = true;
    last_opened_day = obj_quest_manager.current_day_index;
    image_index = 1;
    
    var _roll = irandom_range(1, 100);
    var _item = "";
    
    if (_roll <= 60) {
        _item = "Milk";
    } else if (_roll <= 90) {
        _item = "Potion";
    } else if (_roll <= 99) {
        _item = "Key";
    } else {
        _item = "Golden Apple";
    }
    
    scr_hotbar_add(_item, 1);
    show_debug_message("You got: " + _item);
} else if (fail_cooldown <= 0) {
    audio_play_sound(snd_fail, 1, false);
    fail_cooldown = room_speed * 4; // 4 second cooldown
    show_debug_message("Already got something from the fridge today!");
}