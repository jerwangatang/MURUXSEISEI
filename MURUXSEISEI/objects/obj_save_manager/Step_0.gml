// ==================================================
// TEMP SAVE TEST
// ==================================================

if (
    room != room_titlescreen &&
    keyboard_check_pressed(0)
)
{
    if (global.current_save_slot > 0)
    {
        scr_save_game(
            global.current_save_slot
        );
    }
}

// ==================================================
// SAVE MANAGER - STEP
// ==================================================


// --------------------------------------------------
// PLAYTIME
// --------------------------------------------------

// Don't count time spent sitting on the title screen
if (room != room_titlescreen)
{
    playtime_seconds += delta_time / 1000000;
}


// ==================================================
// NEW GAME SETUP
// ==================================================

if (new_game_pending)
{
    if (room == room_muruhouse)
    {
        // Ensure quest manager exists
        if (!instance_exists(obj_quest_manager))
        {
            instance_create_depth(
                0,
                0,
                -10000,
                obj_quest_manager
            );
        }

        new_game_pending = false;
    }
}


// ==================================================
// LOAD SAVED GAME
// ==================================================

if (load_pending)
{
    // Wait until the saved room has actually loaded
    if (room == pending_room)
    {
        // Make sure quest manager exists
        if (!instance_exists(obj_quest_manager))
        {
            instance_create_depth(
                0,
                0,
                -10000,
                obj_quest_manager
            );
        }


        // Wait until player + quest manager exist
        if (
            instance_exists(obj_player) &&
            instance_exists(obj_quest_manager)
        )
        {
            var _player =
                instance_find(obj_player, 0);

            var _manager =
                instance_find(obj_quest_manager, 0);


            // ------------------------------------------
            // PLAYER POSITION
            // ------------------------------------------

            _player.x = pending_data.player_x;
            _player.y = pending_data.player_y;


            // ------------------------------------------
            // DAY
            // ------------------------------------------

            _manager.current_day_index =
                pending_data.current_day_index;


            // ------------------------------------------
            // QUEST STATES
            // ------------------------------------------

            var _saved_days =
                pending_data.quest_states;

            for (
                var d = 0;
                d < array_length(_saved_days);
                d++
            )
            {
                if (d < array_length(_manager.days))
                {
                    var _saved_quests =
                        _saved_days[d];

                    var _quests =
                        _manager.days[d].quests;


                    for (
                        var q = 0;
                        q < array_length(_saved_quests);
                        q++
                    )
                    {
                        if (q < array_length(_quests))
                        {
                            _quests[q].done =
                                _saved_quests[q];
                        }
                    }
                }
            }


            // ------------------------------------------
            // HOMEWORK
            // ------------------------------------------

            if (
                variable_struct_exists(
                    pending_data,
                    "homework_progress"
                )
            )
            {
                _manager.homework_progress =
                    pending_data.homework_progress;
            }


            // ------------------------------------------
            // HOUSE EXPLORATION
            // ------------------------------------------

            if (
                variable_struct_exists(
                    pending_data,
                    "house_visited"
                )
            )
            {
                _manager.house_visited =
                    pending_data.house_visited;
            }


            // ------------------------------------------
            // FINISH LOAD
            // ------------------------------------------

            load_pending = false;
            pending_data = undefined;
            pending_room = -1;

            show_debug_message(
                "Save loaded successfully."
            );
        }
    }
}