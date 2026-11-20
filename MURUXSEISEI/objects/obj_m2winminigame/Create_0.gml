// ==================================================
// ARCADE BALLOON GAME - WIN
// ==================================================

if (instance_exists(obj_quest_manager))
{
    var _manager =
        instance_find(
            obj_quest_manager,
            0
        );


    var _day =
        _manager.current_day_index;


    // ==================================================
    // COCO'S - TOWN 1
    // ==================================================

    if (
        variable_global_exists(
            "arcade_return_room"
        )
        &&
        global.arcade_return_room
        ==
        room_town1
    )
    {
        // ==================================================
        // DAY 1
        // ==================================================

        if (_day == 0)
        {
            if (!scr_quest_done("cocos_minigame"))
            {
                scr_complete_quest(
                    "cocos_minigame"
                );
            }
        }


        // ==================================================
        // DAY 2
        // ==================================================

        else if (_day == 1)
        {
            if (!scr_quest_done("cocos_minigame_day2"))
            {
                scr_complete_quest(
                    "cocos_minigame_day2"
                );
            }
        }
    }


    // ==================================================
    // CLOCKZONE - TOWN 2
    // ==================================================

    else if (
        variable_global_exists(
            "arcade_return_room"
        )
        &&
        global.arcade_return_room
        ==
        room_town2
    )
    {
        // ==================================================
        // DAY 3
        // ==================================================

        if (_day == 2)
        {
            if (!scr_quest_done("clockzone_games"))
            {
                scr_complete_quest(
                    "clockzone_games"
                );
            }
        }


        // ==================================================
        // DAY 4
        // ==================================================

        else if (_day == 3)
        {
            if (!scr_quest_done("clockzone_day4"))
            {
                scr_complete_quest(
                    "clockzone_day4"
                );
            }
        }


        // ==================================================
        // DAY 5 - BUILD UP COURAGE
        // ==================================================

        else if (_day == 4)
        {
            if (!scr_quest_done("courage_minigame"))
            {
                scr_complete_quest(
                    "courage_minigame"
                );
            }
        }
    }
}


// ==================================================
// RETURN TO ARCADE AFTER 3 SECONDS
// ==================================================

alarm[0] =
    room_speed * 3;