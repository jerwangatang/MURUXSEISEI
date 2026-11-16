function scr_current_dreamday() {
    return obj_dreamscape_manager.dream_days[obj_dreamscape_manager.current_dreamday_index];
}

function scr_complete_dreamquest(_quest_name) {
    var _day = scr_current_dreamday();
    for (var i = 0; i < array_length(_day.quests); i++) {
        if (_day.quests[i].name == _quest_name) {
            _day.quests[i].done = true;
        }
    }
}