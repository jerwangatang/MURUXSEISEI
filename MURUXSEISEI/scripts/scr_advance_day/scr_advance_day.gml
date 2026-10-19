function scr_advance_day() {
    if (scr_day_complete()) {
        obj_quest_manager.current_day_index++;
        if (obj_quest_manager.current_day_index >= array_length(obj_quest_manager.days)) {
            room_goto(room_ending_sequence);
        }
    }
}