// DEBUG ONLY:
// Press 0 to complete every quest for the current day

if (keyboard_check_pressed(ord("0")))
{
    var _day = scr_current_day();

    for (var i = 0; i < array_length(_day.quests); i++)
    {
        _day.quests[i].done = true;
    }

    show_debug_message(
        "DEBUG: All quests completed for " + _day.day_name
    );
}