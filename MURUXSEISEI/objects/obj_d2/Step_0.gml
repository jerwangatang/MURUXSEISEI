if (obj_quest_manager.current_day_index == 1 && !collected && place_meeting(x, y, obj_player)) {
    if (keyboard_check_pressed(vk_enter)) {
        collected = true;
        scr_collect_dream_item("Sunlight Vial");
        room_goto(room_town1);
        instance_destroy();
    }
}