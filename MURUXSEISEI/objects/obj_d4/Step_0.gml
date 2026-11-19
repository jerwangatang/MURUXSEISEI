if (obj_quest_manager.current_day_index == 3 && !collected && place_meeting(x, y, obj_player)) {
    if (keyboard_check_pressed(vk_enter)) {
        collected = true;
        scr_collect_dream_item("Hope Feather");
        room_goto(room_muruhouse);
        instance_destroy();
    }
}