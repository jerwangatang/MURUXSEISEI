function scr_complete_quest(_quest_name) {
    var _day = obj_quest_manager.days[obj_quest_manager.current_day_index];
    for (var i = 0; i < array_length(_day.quests); i++) {
        if (_day.quests[i].name == _quest_name) {
            _day.quests[i].done = true;
        }
    }
}