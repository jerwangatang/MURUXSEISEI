// ==================================================
// HOMEWORK SPOT - DRAW
// ==================================================

draw_self();


if (!instance_exists(obj_quest_manager))
{
    exit;
}


var _manager =
    instance_find(
        obj_quest_manager,
        0
    );

var _day =
    _manager.current_day_index;


// ==================================================
// DAY 1
// ==================================================

if (_day == 0)
{
    if (!scr_quest_done("homework_half"))
    {
        draw_interaction_star();
    }
}


// ==================================================
// DAY 3
// ==================================================

else if (_day == 2)
{
    if (!scr_quest_done("finish_homework_day3"))
    {
        draw_interaction_star();
    }
}