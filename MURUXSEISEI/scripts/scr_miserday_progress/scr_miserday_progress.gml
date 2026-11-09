// ==================================================
// CHECK IF CURRENT QUEST IS COMPLETE
// ==================================================

function scr_quest_done(_quest_id)
{
    if (!instance_exists(obj_quest_manager))
    {
        return false;
    }

    var _manager =
        instance_find(obj_quest_manager, 0);

    var _day =
        _manager.days[
            _manager.current_day_index
        ];


    for (
        var i = 0;
        i < array_length(_day.quests);
        i++
    )
    {
        if (_day.quests[i].id == _quest_id)
        {
            return _day.quests[i].done;
        }
    }


    return false;
}


// ==================================================
// MISERDAY HOMEWORK PROGRESS
// ==================================================

function scr_homework_progress(_amount)
{
    if (!instance_exists(obj_quest_manager))
    {
        return 0;
    }

    var _manager =
        instance_find(obj_quest_manager, 0);


    // Only Miserday
    if (_manager.current_day_index != 0)
    {
        return _manager.homework_progress;
    }


    _manager.homework_progress =
        clamp(
            _manager.homework_progress + _amount,
            0,
            _manager.homework_total
        );


    var _half =
        ceil(
            _manager.homework_total / 2
        );


    // Half finished
    if (
        _manager.homework_progress
        >= _half
    )
    {
        scr_complete_quest(
            "homework_half"
        );
    }


    return _manager.homework_progress;
}


// ==================================================
// MISERDAY HOUSE EXPLORATION
// ==================================================

function scr_visit_house(_house_id)
{
    if (!instance_exists(obj_quest_manager))
    {
        return false;
    }


    var _manager =
        instance_find(obj_quest_manager, 0);


    // Only Miserday
    if (_manager.current_day_index != 0)
    {
        return false;
    }


    // --------------------------------------------------
    // MARK HOUSE VISITED
    // --------------------------------------------------

    for (
        var i = 0;
        i < array_length(_manager.house_ids);
        i++
    )
    {
        if (
            _manager.house_ids[i]
            == _house_id
        )
        {
            _manager.house_visited[i] = true;
            break;
        }
    }


    // --------------------------------------------------
    // CHECK ALL HOUSES
    // --------------------------------------------------

    var _all_visited = true;


    for (
        var j = 0;
        j < array_length(_manager.house_visited);
        j++
    )
    {
        if (!_manager.house_visited[j])
        {
            _all_visited = false;
            break;
        }
    }


    // --------------------------------------------------
    // COMPLETE QUEST
    // --------------------------------------------------

    if (_all_visited)
    {
        scr_complete_quest(
            "explore_houses"
        );
    }


    return true;
}