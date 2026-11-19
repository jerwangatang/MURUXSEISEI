// ==================================================
// BLOCK INTERACTION WHILE PAUSED
// ==================================================

if (global.game_paused)
{
    exit;
}

if (global.dialogue_active)
{
    exit;
}

// ==================================================
// COCO'S / CLOCKZONE TRIGGER - STEP
// ==================================================

if (global.game_paused)
{
    exit;
}

if (global.dialogue_active)
{
    exit;
}


// ==================================================
// PLAYER INTERACTION
// ==================================================

if (place_meeting(x, y, obj_player))
{
    if (keyboard_check_pressed(vk_enter))
    {
        // ==================================================
        // TOWN 1 → COCO'S
        // ==================================================

        if (room == room_town1)
        {
            global.arcade_return_room = room_town1;

            room_fade_to(
                room_arcade1
            );
        }


        // ==================================================
        // TOWN 2 → CLOCKZONE
        // ==================================================

        else if (room == room_town2)
        {
            global.arcade_return_room = room_town2;


            // ----------------------------------------------
            // CLOCKZONE QUESTS
            // ----------------------------------------------

            if (instance_exists(obj_quest_manager))
            {
                var _day_index =
                    obj_quest_manager.current_day_index;


                // Day 3
                if (_day_index == 2)
                {
                    if (!scr_quest_done("clockzone_games"))
                    {
                        scr_complete_quest(
                            "clockzone_games"
                        );

                        scr_request_autosave(
                            "visited Clockzone day 3"
                        );
                    }
                }


                // Day 4
                else if (_day_index == 3)
                {
                    if (!scr_quest_done("clockzone_day4"))
                    {
                        scr_complete_quest(
                            "clockzone_day4"
                        );

                        scr_request_autosave(
                            "visited Clockzone day 4"
                        );
                    }
                }
            }


            room_fade_to(
                room_arcade1
            );
        }


        // ==================================================
        // INSIDE ARCADE → RETURN TO CORRECT TOWN
        // ==================================================

        else if (room == room_arcade1)
        {
            // Safety fallback
            if (!variable_global_exists("arcade_return_room"))
            {
                global.arcade_return_room =
                    room_town1;
            }


            room_fade_to(
                global.arcade_return_room
            );
        }
    }
}