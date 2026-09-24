function scr_day_complete() {
    var _day = obj_quest_manager.days[obj_quest_manager.current_day_index];
    for (var i = 0; i < array_length(_day.quests); i++) {
        if (!_day.quests[i].done) return false;
    }
    return true;
}