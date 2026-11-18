function scr_complete_quest(_quest_id)
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
            == _quest_id
        )
        {
            // ==================================================
            // COMPLETE ONLY ONCE
            // ==================================================

            if (!_day.quests[i].done)
            {
                _day.quests[i].done = true;

                audio_play_sound(snd_ding, 1, false);

                show_debug_message(
                    "Quest completed: "
                    + _day.quests[i].name
                );


                // ==================================================
                // AUTOSAVE
                // ==================================================

                scr_request_autosave(
                    "quest: "
                    + _quest_id
                );
            }


            return true;
        }
    }


    show_debug_message(
        "Quest not found: "
        + _quest_id
    );


    return false;
}