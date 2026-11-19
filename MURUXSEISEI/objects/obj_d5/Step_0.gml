if (obj_quest_manager.current_day_index == 4 && !collected && place_meeting(x, y, obj_player)) {
    if (keyboard_check_pressed(vk_enter)) {
        collected = true;
        scr_collect_dream_item("Mirror Shard");
        room_goto(room_muruhouse);
        instance_destroy();
    }
}