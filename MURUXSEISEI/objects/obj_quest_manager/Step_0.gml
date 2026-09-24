if (keyboard_check_pressed(ord("7"))) {
    var _day = scr_current_day();
    for (var i = 0; i < array_length(_day.quests); i++) {
        _day.quests[i].done = true;
    }
    show_debug_message("DEBUG: All quests completed for " + _day.day_name);
}

if (place_meeting(x, y, obj_player)) {
    if (keyboard_check_pressed(vk_enter)) {
        if (scr_day_complete()) {
            scr_advance_day();
            room_goto(room_muru_house); // wherever the next day should start
        } else {
            show_debug_message("I still have things to do today...");
        }
    }
}