function scr_advance_dreamday() {
    if (scr_dreamday_complete()) {
        obj_dreamscape_manager.current_dreamday_index++;
        
        if (obj_dreamscape_manager.current_dreamday_index >= array_length(obj_dreamscape_manager.dream_days)) {
            room_goto(room_town1);
        }
    }
}