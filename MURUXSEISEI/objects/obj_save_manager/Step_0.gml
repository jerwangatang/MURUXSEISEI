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
// MAKE SURE HOTBAR EXISTS
// ==================================================

if (room != room_titlescreen)
{
    if (!instance_exists(obj_hotbar))
    {
        instance_create_depth(
            0,
            0,
            -9999,
            obj_hotbar
        );

        show_debug_message(
            "Hotbar created."
        );
    }
}


// ==================================================
// PLAYER FALLBACK FOR INTERIOR ROOMS
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
        // Wait until everything required for a complete
        // merged-system save exists.
        if (
            instance_exists(obj_player)
            &&
            instance_exists(obj_quest_manager)
            &&
            instance_exists(obj_hotbar)
        )
        {
            if (global.current_save_slot > 0)
            {
                var _initial_saved =
                    scr_save_game(
                        global.current_save_slot
                    );


                if (_initial_saved)
                {
                    show_debug_message(
                        "Initial save created for slot "
                        + string(
                            global.current_save_slot
                        )
                    );


                    new_game_pending = false;

                    autosave_pending = false;
                    autosave_reason = "";
                    autosave_elapsed = 0;

                    // Prevent another unnecessary
                    // room-change autosave immediately.
                    last_room = room;
                }
            }
            else
            {
                new_game_pending = false;
                last_room = room;
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
        // ==================================================
        // ENSURE QUEST MANAGER
        // ==================================================

        if (!instance_exists(obj_quest_manager))
        {
            instance_create_depth(
                0,
                0,
                -10000,
                obj_quest_manager
            );
        }


        // ==================================================
        // ENSURE HOTBAR
        // ==================================================

        if (!instance_exists(obj_hotbar))
        {
            instance_create_depth(
                0,
                0,
                -9999,
                obj_hotbar
            );
        }


        // ==================================================
        // PLAYER FALLBACK FOR INTERIORS
        // ==================================================

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


        // ==================================================
        // WAIT UNTIL EVERYTHING EXISTS
        // ==================================================

        if (
            instance_exists(obj_player)
            &&
            instance_exists(obj_quest_manager)
            &&
            instance_exists(obj_hotbar)
        )
        {
            var _load_player =
                instance_find(
                    obj_player,
                    0
                );

            var _load_manager =
                instance_find(
                    obj_quest_manager,
                    0
                );

            var _load_hotbar =
                instance_find(
                    obj_hotbar,
                    0
                );


            // ==================================================
            // PLAYER POSITION
            // ==================================================

            if (
                variable_struct_exists(
                    pending_data,
                    "player_x"
                )
            )
            {
                _load_player.x =
                    pending_data.player_x;
            }


            if (
                variable_struct_exists(
                    pending_data,
                    "player_y"
                )
            )
            {
                _load_player.y =
                    pending_data.player_y;
            }


            // ==================================================
            // DAY
            // ==================================================

            if (
                variable_struct_exists(
                    pending_data,
                    "current_day_index"
                )
            )
            {
                _load_manager.current_day_index =
                    pending_data.current_day_index;
            }


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
                        <
                        array_length(
                            _load_manager.days
                        )
                    )
                    {
                        var _saved_quests =
                            _saved_days[d];

                        var _quests =
                            _load_manager.days[d].quests;


                        for (
                            var q = 0;
                            q < array_length(_saved_quests);
                            q++
                        )
                        {
                            if (
                                q
                                <
                                array_length(_quests)
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
                _load_manager.homework_progress =
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
                _load_manager.house_visited =
                    pending_data.house_visited;
            }


            // ------------------------------------------
            // HOTBAR
            // ------------------------------------------

            if (
                variable_struct_exists(
                    pending_data,
                    "hotbar_items"
                )
            )
            {
                var _hotbar =
                    instance_find(
                        obj_hotbar,
                        0
                    );

                var _saved_items =
                    pending_data.hotbar_items;


                for (
                    var i = 0;
                    i < array_length(_saved_items);
                    i++
                )
                {
                    if (
                        i
                        <
                        array_length(
                            _hotbar.hotbar
                        )
                    )
                    {
                        _hotbar.hotbar[i].item_name =
                            _saved_items[i].item_name;

                        _hotbar.hotbar[i].amount =
                            _saved_items[i].amount;
                    }
                }
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
            // COINS
            // ==================================================

            if (
                variable_struct_exists(
                    pending_data,
                    "coins"
                )
            )
            {
                global.coins =
                    pending_data.coins;
            }


            // ==================================================
            // SHOP PURCHASES
            // ==================================================

            if (
                variable_struct_exists(
                    pending_data,
                    "shop_owned"
                )
            )
            {
                global.shop_owned =
                    pending_data.shop_owned;
            }


            // ==================================================
            // FRIDGE STATE
            // ==================================================

            if (
                variable_struct_exists(
                    pending_data,
                    "fridge_opened"
                )
            )
            {
                global.fridge_opened =
                    pending_data.fridge_opened;
            }


            // ==================================================
            // FISHING ROD
            // ==================================================

            if (
                variable_struct_exists(
                    pending_data,
                    "fishing_rod_collected"
                )
            )
            {
                global.fishing_rod_collected =
                    pending_data.fishing_rod_collected;
            }


            // ==================================================
            // CHESTS
            // ==================================================

            if (
                variable_struct_exists(
                    pending_data,
                    "opened_chests"
                )
            )
            {
                global.opened_chests =
                    pending_data.opened_chests;
            }


            // ==================================================
            // RESTORE HOTBAR / INVENTORY
            // ==================================================

            // Clear current hotbar first
            for (
                var h = 0;
                h < _load_hotbar.slot_count;
                h++
            )
            {
                _load_hotbar.hotbar[h].item_name =
                    "";

                _load_hotbar.hotbar[h].amount =
                    0;
            }


            // Restore saved hotbar if this save contains it
            if (
                variable_struct_exists(
                    pending_data,
                    "hotbar"
                )
            )
            {
                var _saved_hotbar =
                    pending_data.hotbar;


                var _hotbar_count =
                    min(
                        array_length(_saved_hotbar),
                        _load_hotbar.slot_count
                    );


                for (
                    var h = 0;
                    h < _hotbar_count;
                    h++
                )
                {
                    if (
                        variable_struct_exists(
                            _saved_hotbar[h],
                            "item_name"
                        )
                    )
                    {
                        _load_hotbar.hotbar[h].item_name =
                            _saved_hotbar[h].item_name;
                    }


                    if (
                        variable_struct_exists(
                            _saved_hotbar[h],
                            "amount"
                        )
                    )
                    {
                        _load_hotbar.hotbar[h].amount =
                            _saved_hotbar[h].amount;
                    }
                }
            }


            // ==================================================
            // SELECTED HOTBAR SLOT
            // ==================================================

            if (
                variable_struct_exists(
                    pending_data,
                    "hotbar_selected"
                )
            )
            {
                _load_hotbar.selected_slot =
                    clamp(
                        pending_data.hotbar_selected,
                        0,
                        _load_hotbar.slot_count - 1
                    );
            }
            else
            {
                _load_hotbar.selected_slot =
                    0;
            }


            // ==================================================
            // FINISH LOAD
            // ==================================================

            load_pending =
                false;


            pending_data =
                undefined;


            pending_room =
                -1;


            // Don't immediately autosave just because
            // loading changed rooms.
            last_room =
                room;


            autosave_pending =
                false;


            autosave_reason =
                "";


            autosave_elapsed =
                0;


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
        instance_exists(
            obj_player
        );

    var _has_quest =
        instance_exists(
            obj_quest_manager
        );

    var _has_hotbar =
        instance_exists(
            obj_hotbar
        );


    show_debug_message(
        "PLAYER EXISTS: "
        + string(_has_player)
    );


    show_debug_message(
        "QUEST MANAGER EXISTS: "
        + string(_has_quest)
    );


    show_debug_message(
        "HOTBAR EXISTS: "
        + string(_has_hotbar)
    );


    if (
        _has_player
        &&
        _has_quest
        &&
        _has_hotbar
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


            autosave_elapsed =
                0;
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


        if (!_has_hotbar)
        {
            show_debug_message(
                "MISSING: obj_hotbar"
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


// ==================================================
// PERIODIC AUTOSAVE TIMER
// ==================================================

if (
    room != room_titlescreen
    &&
    global.current_save_slot > 0
    &&
    !load_pending
    &&
    !new_game_pending
)
{
    autosave_elapsed +=
        delta_time / 1000000;


    if (
        autosave_elapsed
        >= autosave_interval
    )
    {
        autosave_pending =
            true;

        autosave_reason =
            "60 second timer";
    }
}


// ==================================================
// AUTOSAVE ON ROOM CHANGE
// ==================================================

if (room != last_room)
{
    last_room =
        room;


    if (
        room != room_titlescreen
        &&
        !load_pending
        &&
        !new_game_pending
    )
    {
        autosave_pending =
            true;

        autosave_reason =
            "room change";
    }
}


// ==================================================
// PROCESS AUTOSAVE
// ==================================================

if (autosave_pending)
{
    if (
        room != room_titlescreen
        &&
        !load_pending
        &&
        !new_game_pending
    )
    {
        // Do not save during fade transition
        if (
            !instance_exists(
                obj_fade_transition
            )
        )
        {
            // All three are required so we never accidentally
            // overwrite a valid save with an empty inventory.
            if (
                instance_exists(obj_player)
                &&
                instance_exists(obj_quest_manager)
                &&
                instance_exists(obj_hotbar)
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
                        "AUTOSAVE SUCCESS"
                        + " | slot = "
                        + string(
                            global.current_save_slot
                        )
                        + " | reason = "
                        + autosave_reason
                    );


                    autosave_pending =
                        false;


                    autosave_reason =
                        "";


                    autosave_elapsed =
                        0;
                }
            }
        }
    }
}