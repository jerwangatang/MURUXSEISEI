function scr_reset_day()
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
        scr_current_day();


    // ==================================================
    // RESET CURRENT DAY QUESTS
    // ==================================================

    for (
        var i = 0;
        i < array_length(_day.quests);
        i++
    )
    {
        _day.quests[i].done =
            false;
    }


    // ==================================================
    // RESET HOMEWORK
    // ==================================================

    _manager.homework_progress =
        0;


    // ==================================================
    // RESET DAY 1 BUILDING EXPLORATION
    //
    // Muru's house remains visited.
    // ==================================================

    _manager.house_visited =
    [
        true,
        false,
        false,
        false
    ];


    // ==================================================
    // RESET DAY 4 NPC TALKING PROGRESS
    // ==================================================

    _manager.day4_people_talked =
        0;

    _manager.talked_npcs =
        [];


    return true;
}