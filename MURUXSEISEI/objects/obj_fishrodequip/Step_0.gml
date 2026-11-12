if (place_meeting(x, y, obj_player)) {
    if (keyboard_check_pressed(vk_enter)) {
        scr_hotbar_add("Fishing Rod", 1);
    }
}