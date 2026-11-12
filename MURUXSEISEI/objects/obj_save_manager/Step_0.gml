// ==================================================
// SAVE MANAGER - STEP
// ==================================================


// ==================================================
// PLAYTIME
// ==================================================

if (room != room_titlescreen)
{
    playtime_seconds += delta_time / 1000000;
}


// ==================================================
// MAKE SURE QUEST MANAGER EXISTS
// ==================================================

if (room != room_titlescreen)
{
    if (!instance_exists(obj_quest_manager))
    {
        instance_create_depth(
            0,
            0,
            -10000,
            obj_quest_manager
        );

        show_debug_message(
            "Quest Manager created."
        );
    }
}


// ==================================================
// MAKE SURE PAUSE MENU EXISTS
// ==================================================

if (room != room_titlescreen)
{
    if (!instance_exists(obj_pause_menu))
    {
        instance_create_depth(
            0,
            0,
            -10000,
            obj_pause_menu
        );
    }
}


// ==================================================
// TEMP FIX FOR EMPTY INTERIOR ROOMS
//
// Tutor + Neighbour rooms currently contain
// no obj_player in the merged project.
// ==================================================

if (
    room == room_tutorhome
    ||
    room == room_neighbourhome
)
{
    if (!instance_exists(obj_player))
    {
        instance_create_layer(
            room_width / 2,
            room_height - 96,
            "Instances",
            obj_player
        );

        show_debug_message(
            "Player created in interior."
        );
    }
}


// ==================================================
// NEW GAME SETUP
// ==================================================

if (new_game_pending)
{
    if (room == room_muruhouse)
    {
        // Wait until required objects exist
        if (
            instance_exists(obj_player)
            &&
            instance_exists(obj_quest_manager)
        )
        {
            // ------------------------------------------
            // CREATE INITIAL SAVE FILE
            // ------------------------------------------

            if (global.current_save_slot > 0)
            {
                var _saved =
                    scr_save_game(
                        global.current_save_slot
                    );


                if (_saved)
                {
                    show_debug_message(
                        "Initial save created for slot "
                        + string(
                            global.current_save_slot
                        )
                    );

                    new_game_pending = false;
                }
            }
            else
            {
                new_game_pending = false;
            }
        }
    }
}


// ==================================================
// LOAD SAVED GAME
// ==================================================

if (load_pending)
{
    // Wait until target room has loaded
    if (room == pending_room)
    {
        // ----------------------------------------------
        // MAKE SURE QUEST MANAGER EXISTS
        // ----------------------------------------------

        if (!instance_exists(obj_quest_manager))
        {
            instance_create_depth(
                0,
                0,
                -10000,
                obj_quest_manager
            );
        }


        // ----------------------------------------------
        // CREATE PLAYER FOR EMPTY INTERIORS
        // ----------------------------------------------

        if (
            (
                room == room_tutorhome
                ||
                room == room_neighbourhome
            )
            &&
            !instance_exists(obj_player)
        )
        {
            instance_create_layer(
                room_width / 2,
                room_height - 96,
                "Instances",
                obj_player
            );
        }


        // ----------------------------------------------
        // WAIT UNTIL EVERYTHING EXISTS
        // ----------------------------------------------

        if (
            instance_exists(obj_player)
            &&
            instance_exists(obj_quest_manager)
        )
        {
            var _player =
                instance_find(
                    obj_player,
                    0
                );

            var _manager =
                instance_find(
                    obj_quest_manager,
                    0
                );


            // ==================================================
            // PLAYER POSITION
            // ==================================================

            _player.x =
                pending_data.player_x;

            _player.y =
                pending_data.player_y;


            // ==================================================
            // DAY
            // ==================================================

            _manager.current_day_index =
                pending_data.current_day_index;


            // ==================================================
            // QUEST STATES
            // ==================================================

            if (
                variable_struct_exists(
                    pending_data,
                    "quest_states"
                )
            )
            {
                var _saved_days =
                    pending_data.quest_states;


                for (
                    var d = 0;
                    d < array_length(_saved_days);
                    d++
                )
                {
                    if (
                        d
                        < array_length(
                            _manager.days
                        )
                    )
                    {
                        var _saved_quests =
                            _saved_days[d];

                        var _quests =
                            _manager.days[d].quests;


                        for (
                            var q = 0;
                            q < array_length(
                                _saved_quests
                            );
                            q++
                        )
                        {
                            if (
                                q
                                < array_length(
                                    _quests
                                )
                            )
                            {
                                _quests[q].done =
                                    _saved_quests[q];
                            }
                        }
                    }
                }
            }


            // ==================================================
            // HOMEWORK PROGRESS
            // ==================================================

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


            // ==================================================
            // HOUSE VISITS
            // ==================================================

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


            // ==================================================
            // SANITY
            // ==================================================

            if (
                variable_struct_exists(
                    pending_data,
                    "sanity"
                )
            )
            {
                global.sanity =
                    pending_data.sanity;
            }


            if (
                variable_struct_exists(
                    pending_data,
                    "max_sanity"
                )
            )
            {
                global.max_sanity =
                    pending_data.max_sanity;
            }


            // ==================================================
            // FINISH LOAD
            // ==================================================

            load_pending = false;

            pending_data =
                undefined;

            pending_room =
                -1;


            show_debug_message(
                "Save loaded successfully."
            );
        }
    }
}


// ==================================================
// TEMPORARY F5 SAVE
// ==================================================

if (
    room != room_titlescreen
    &&
    keyboard_check_pressed(vk_f5)
)
{
    var _has_player =
        instance_exists(obj_player);

    var _has_quest =
        instance_exists(
            obj_quest_manager
        );


    show_debug_message(
        "PLAYER EXISTS: "
        + string(_has_player)
    );

    show_debug_message(
        "QUEST MANAGER EXISTS: "
        + string(_has_quest)
    );


    // ==================================================
    // SAVE
    // ==================================================

    if (
        _has_player
        &&
        _has_quest
        &&
        global.current_save_slot > 0
    )
    {
        if (
            scr_save_game(
                global.current_save_slot
            )
        )
        {
            show_debug_message(
                "TEMP SAVE SUCCESS: slot "
                + string(
                    global.current_save_slot
                )
            );
        }
    }
    else
    {
        show_debug_message(
            "TEMP SAVE SKIPPED"
        );


        if (!_has_player)
        {
            show_debug_message(
                "MISSING: obj_player"
            );
        }


        if (!_has_quest)
        {
            show_debug_message(
                "MISSING: obj_quest_manager"
            );
        }


        if (
            global.current_save_slot <= 0
        )
        {
            show_debug_message(
                "MISSING: active save slot"
            );
        }
    }
}