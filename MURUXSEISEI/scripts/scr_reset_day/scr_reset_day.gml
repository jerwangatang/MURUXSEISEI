function scr_reset_day() {
    var _day = scr_current_day();
    
    for (var i = 0; i < array_length(_day.quests); i++) {
        _day.quests[i].done = false;
    }
    
    // Reset Miserday-specific progress trackers too (harmless on other days)
    obj_quest_manager.homework_progress = 0;
    
    obj_quest_manager.house_visited = [true, false, false]; // Muru's own house stays visited
}