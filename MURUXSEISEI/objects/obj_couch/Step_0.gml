if (place_meeting(x, y, obj_player)) {
    if (keyboard_check_pressed(vk_enter)) {
        if (scr_day_complete()) {
            scr_advance_day();
            room_goto(room_catchthefallingthoughts);
        } else {
            show_incomplete_message = true;
            message_timer = room_speed * 2;
        }
    }
}

if (message_timer > 0) {
    message_timer--;
} else {
    show_incomplete_message = false;
}