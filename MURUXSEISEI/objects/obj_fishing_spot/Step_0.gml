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


// ==================================================
// NO FISHING ROD
// ==================================================

if (state == "no_rod") {
    no_rod_timer--;

    if (no_rod_timer <= 0) {
        state = "idle";
    }
}


// ==================================================
// WAITING
// ==================================================

if (state == "waiting") {
    second_timer--;

    if (second_timer <= 0) {
        second_timer = room_speed;

        dot_count =
            (dot_count + 1) mod 4;

        // 10% chance each second to get a bite
        var _roll =
            irandom_range(1, 100);

        if (_roll <= 10) {
            state = "biting";

            // 1 second to press Enter
            bite_window =
                room_speed * 1;
        }
    }
}


// ==================================================
// FISH BITING
// ==================================================

if (state == "biting") {
    bite_window--;


    // --------------------------------------------------
    // PRESS ENTER TO CATCH
    // --------------------------------------------------

    if (keyboard_check_pressed(vk_enter)) {
        caught_item = "Fish";


        // Add Fish to hotbar
        scr_hotbar_add(
            caught_item,
            1
        );


        // Complete partner's Day 3 fishing quest
        scr_complete_quest(
            "fishing_pond_day3"
        );


        state = "result";

        result_timer =
            room_speed * 2;
    }


    // --------------------------------------------------
    // PLAYER WAS TOO SLOW
    // --------------------------------------------------

    if (bite_window <= 0) {
        caught_item = "";

        state = "result";

        result_timer =
            room_speed * 2;
    }
}


// ==================================================
// RESULT
// ==================================================

if (state == "result") {
    result_timer--;

    if (result_timer <= 0) {
        state = "idle";
    }
}