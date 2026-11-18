if (place_meeting(x, y, obj_player)) {
    if (keyboard_check_pressed(vk_enter)) {
        scr_complete_quest("make_dinner_day2");
        
        message_shown = true;
        message_timer = room_speed * 2; // show for 2 seconds
    }
}

if (message_timer > 0) {
    message_timer--;
} else {
    message_shown = false;
}