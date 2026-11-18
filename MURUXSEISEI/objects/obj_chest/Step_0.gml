if (place_meeting(x, y, obj_player)) {
    if (keyboard_check_pressed(vk_enter)) {
        if (!opened) {
            if (scr_hotbar_has_item("Key")) {
				opened = true;
				image_index = 1;
				scr_hotbar_remove_one("Key");
				scr_hotbar_add(loot_item, 1);
			} else {
				audio_play_sound(snd_fail, 1, false);
				show_debug_message("Locked! You need a key.");
			}
        }
    }
}

