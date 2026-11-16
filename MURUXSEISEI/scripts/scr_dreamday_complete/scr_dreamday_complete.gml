function scr_dreamday_complete() {
    var _day = scr_current_dreamday();
    for (var i = 0; i < array_length(_day.quests); i++) {
        if (!_day.quests[i].done) return false;
    }
    return true;
}