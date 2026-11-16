if (obj_dreamscape_manager.current_dreamday_index == 0 && !collected && place_meeting(x, y, obj_player)) {
    if (keyboard_check_pressed(vk_enter)) {
        collected = true;
        
        scr_collect_dream_item("Memory Charm");
        scr_complete_dreamquest("Find the Memory Charm");
        obj_dreamscape_manager.current_dreamday_index++;
        
        room_fade_to(room_muruhouse); // back to Real World
        
        instance_destroy();
    }
}