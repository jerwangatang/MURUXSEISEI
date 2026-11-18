if (place_meeting(x, y, obj_player)) {
    if (state == "idle") {
        if (keyboard_check_pressed(vk_enter)) {
            if (scr_hotbar_has_item("Fishing Rod")) {
				state = "waiting";
				second_timer = room_speed;
				dot_count = 0;
			} else {
				audio_play_sound(snd_fail, 1, false);
				state = "no_rod";
				no_rod_timer = room_speed * 2;
			}
        }
    }
}

if (state == "no_rod") {
    no_rod_timer--;
    if (no_rod_timer <= 0) {
        state = "idle";
    }
}

if (state == "waiting") {
    second_timer--;
    
    if (second_timer <= 0) {
        second_timer = room_speed; // reset for next second
        dot_count = (dot_count + 1) mod 4; // cycles 0,1,2,3 for "", ".", "..", "..."
        
        // 10% chance each second to get a bite
        var _roll = irandom_range(1, 100);
        if (_roll <= 10) {
            state = "biting";
            bite_window = room_speed * 1; // 1 second to react
        }
    }
}

if (state == "biting") {
    bite_window--;
    
	if (keyboard_check_pressed(vk_space)) {
		var _catch_roll = irandom_range(1, 100);
		if (_catch_roll <= 50) {
			caught_item = "Old Boot";
		} else if (_catch_roll <= 80) {
			caught_item = "Fish";
		} else {
			caught_item = "Golden Apple";
		}
    
		scr_hotbar_add(caught_item, 1);
		scr_complete_quest("fishing_pond_day3");
    
		state = "result";
		result_timer = room_speed * 2;
	}
}

if (state == "result") {
    result_timer--;
    if (result_timer <= 0) {
        state = "idle";
    }
}

