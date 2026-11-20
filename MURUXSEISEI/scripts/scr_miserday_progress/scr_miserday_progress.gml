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
        instance_find(
            obj_quest_manager,
            0
        );


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
        if (
            _day.quests[i].id
            ==
            _quest_id
        )
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
        instance_find(
            obj_quest_manager,
            0
        );


    if (_manager.current_day_index != 0)
    {
        return _manager.homework_progress;
    }


    _manager.homework_progress =
        clamp(
            _manager.homework_progress
            +
            _amount,
            0,
            _manager.homework_total
        );


    var _half =
        ceil(
            _manager.homework_total
            /
            2
        );


    if (
        _manager.homework_progress
        >=
        _half
    )
    {
        scr_complete_quest(
            "homework_half"
        );
    }


    return _manager.homework_progress;
}


// ==================================================
// DAY 1 - TOWN BUILDING EXPLORATION
// ==================================================

function scr_visit_house(_house_id)
{
    if (!instance_exists(obj_quest_manager))
    {
        return false;
    }


    var _manager =
        instance_find(
            obj_quest_manager,
            0
        );


    // ==================================================
    // ONLY DAY 1
    // ==================================================

    if (_manager.current_day_index != 0)
    {
        return false;
    }


    // ==================================================
    // OLD SAVE COMPATIBILITY
    //
    // Old saves had:
    // [muru, neighbour, tutor]
    //
    // New version uses:
    // [muru, tutor, 811, cocos]
    // ==================================================

    if (
        array_length(
            _manager.house_visited
        )
        !=
        array_length(
            _manager.house_ids
        )
    )
    {
        _manager.house_visited =
        [
            true,
            false,
            false,
            false
        ];
    }


    // ==================================================
    // QUEST ALREADY COMPLETE
    // ==================================================

    if (
        scr_quest_done(
            "explore_houses"
        )
    )
    {
        return true;
    }


    // ==================================================
    // FIND BUILDING
    // ==================================================

    var _found =
        false;


    for (
        var i = 0;
        i < array_length(_manager.house_ids);
        i++
    )
    {
        if (
            _manager.house_ids[i]
            ==
            _house_id
        )
        {
            _found =
                true;


            // Only mark first visit
            if (
                !_manager.house_visited[i]
            )
            {
                _manager.house_visited[i] =
                    true;


                show_debug_message(
                    "BUILDING VISITED: "
                    +
                    _house_id
                );
            }


            break;
        }
    }


    // ==================================================
    // INVALID BUILDING
    // ==================================================

    if (!_found)
    {
        show_debug_message(
            "UNKNOWN BUILDING ID: "
            +
            _house_id
        );


        return false;
    }


    // ==================================================
    // CHECK ALL BUILDINGS
    // ==================================================

    var _all_visited =
        true;


    for (
        var j = 0;
        j < array_length(_manager.house_visited);
        j++
    )
    {
        if (
            !_manager.house_visited[j]
        )
        {
            _all_visited =
                false;

            break;
        }
    }


    // ==================================================
    // COMPLETE QUEST
    // ==================================================

    if (_all_visited)
    {
        scr_complete_quest(
            "explore_houses"
        );


        scr_request_autosave(
            "explored all Town 1 buildings"
        );


        show_debug_message(
            "QUEST COMPLETE: Explore the town buildings"
        );
    }


    return true;
}