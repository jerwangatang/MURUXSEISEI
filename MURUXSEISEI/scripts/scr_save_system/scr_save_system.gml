// ==================================================
// SAVE FILE PATH
// ==================================================

function scr_save_path(_slot)
{
    return "muru_save_" + string(_slot) + ".json";
}


// ==================================================
// DOES SAVE EXIST?
// ==================================================

function scr_save_exists(_slot)
{
    return file_exists(
        scr_save_path(_slot)
    );
}


// ==================================================
// LOCATION DISPLAY NAME
// ==================================================

function scr_location_name(_room)
{
    if (_room == room_muruhouse)
        return "MURU'S HOUSE";

    if (_room == room_town1)
        return "SHUU";

    if (_room == room_arcade1)
        return "COCO'S AMUSEMENT";

    if (_room == room_dreamscapet1)
        return "DREAMSCAPE";

    if (_room == room_catchthefallingthoughts)
        return "MURU'S ROOM";

    if (_room == room_tutorhome)
        return "TUTOR'S HOUSE";

    if (_room == room_neighbourhome)
        return "NEIGHBOUR'S HOUSE";

    if (_room == room_811)
        return "8/11";

    if (_room == room_stylist)
        return "STYLIST";


    // Fallback
    return room_get_name(_room);
}


// ==================================================
// FORMAT PLAYTIME
// ==================================================

function scr_format_playtime(_seconds)
{
    _seconds = floor(_seconds);

    var _hours =
        floor(_seconds / 3600);

    var _minutes =
        floor((_seconds mod 3600) / 60);

    var _secs =
        _seconds mod 60;


    var _h =
        string(_hours);

    var _m =
        string(_minutes);

    var _s =
        string(_secs);


    if (_minutes < 10)
        _m = "0" + _m;

    if (_secs < 10)
        _s = "0" + _s;


    return _h + ":" + _m + ":" + _s;
}


// ==================================================
// READ SAVE INFORMATION
// Used by title screen
// ==================================================

function scr_get_save_info(_slot)
{
    var _path =
        scr_save_path(_slot);


    if (!file_exists(_path))
    {
        return {
            exists: false
        };
    }


    var _file =
        file_text_open_read(_path);

    var _json =
        file_text_read_string(_file);

    file_text_close(_file);


    var _data =
        json_parse(_json);


    return {
        exists: true,

        day_name:
            _data.day_name,

        location_name:
            _data.location_name,

        playtime_seconds:
            _data.playtime_seconds,

        sanity:
            _data.sanity
    };
}


// ==================================================
// SAVE GAME
// ==================================================

function scr_save_game(_slot)
{
    if (!instance_exists(obj_save_manager))
    {
        show_debug_message(
            "ERROR: Save manager does not exist."
        );

        return false;
    }


    if (!instance_exists(obj_player))
    {
        show_debug_message(
            "ERROR: Player does not exist."
        );

        return false;
    }


    if (!instance_exists(obj_quest_manager))
    {
        show_debug_message(
            "ERROR: Quest manager does not exist."
        );

        return false;
    }


    var _save_manager =
        instance_find(
            obj_save_manager,
            0
        );

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
    // SAVE QUEST STATES
    // ==================================================

    var _quest_states = [];


    for (
        var d = 0;
        d < array_length(_manager.days);
        d++
    )
    {
        var _day_states = [];

        var _quests =
            _manager.days[d].quests;


        for (
            var q = 0;
            q < array_length(_quests);
            q++
        )
        {
            array_push(
                _day_states,
                _quests[q].done
            );
        }


        array_push(
            _quest_states,
            _day_states
        );
    }


    // ==================================================
    // CURRENT DAY
    // ==================================================

    var _day =
        _manager.days[
            _manager.current_day_index
        ];


    // ==================================================
    // SAVE HOTBAR / INVENTORY
    // ==================================================

    var _hotbar_data = [];
    var _hotbar_selected = 0;


    if (instance_exists(obj_hotbar))
    {
        var _hotbar =
            instance_find(
                obj_hotbar,
                0
            );

        _hotbar_selected =
            _hotbar.selected_slot;


        for (
            var h = 0;
            h < _hotbar.slot_count;
            h++
        )
        {
            array_push(
                _hotbar_data,
                {
                    item_name:
                        _hotbar.hotbar[h].item_name,

                    amount:
                        _hotbar.hotbar[h].amount
                }
            );
        }
    }


    // ==================================================
    // MAKE SURE MERGED SYSTEM GLOBALS EXIST
    // ==================================================

    if (!variable_global_exists("coins"))
    {
        global.coins = 50;
    }


    if (!variable_global_exists("shop_owned"))
    {
        global.shop_owned = [
            false,
            false
        ];
    }


    if (!variable_global_exists("fridge_opened"))
    {
        global.fridge_opened = false;
    }


    if (!variable_global_exists("fishing_rod_collected"))
    {
        global.fishing_rod_collected = false;
    }


    if (!variable_global_exists("opened_chests"))
    {
        global.opened_chests = {};
    }


    // ==================================================
    // BUILD SAVE DATA
    // ==================================================

    var _data =
    {
        // --------------------------------------------------
        // SAVE VERSION
        // --------------------------------------------------

        version:
            2,


        // --------------------------------------------------
        // BASIC SAVE INFORMATION
        // --------------------------------------------------

        slot:
            _slot,

        room_name:
            room_get_name(room),

        location_name:
            scr_location_name(room),


        // --------------------------------------------------
        // PLAYER
        // --------------------------------------------------

        player_x:
            _player.x,

        player_y:
            _player.y,


        // --------------------------------------------------
        // SANITY
        // --------------------------------------------------

        sanity:
            global.sanity,

        max_sanity:
            global.max_sanity,


        // --------------------------------------------------
        // DAY / QUESTS
        // --------------------------------------------------

        current_day_index:
            _manager.current_day_index,

        day_name:
            _day.day_name,

        quest_states:
            _quest_states,

        homework_progress:
            _manager.homework_progress,

        house_visited:
            _manager.house_visited,


        // --------------------------------------------------
        // PLAYTIME
        // --------------------------------------------------

        playtime_seconds:
            _save_manager.playtime_seconds,


        // ==================================================
        // MERGED SYSTEMS
        // ==================================================

        coins:
            global.coins,

        hotbar:
            _hotbar_data,

        hotbar_selected:
            _hotbar_selected,

        shop_owned:
            global.shop_owned,

        fridge_opened:
            global.fridge_opened,

        fishing_rod_collected:
            global.fishing_rod_collected,

        opened_chests:
            global.opened_chests
    };


    // ==================================================
    // WRITE FILE
    // ==================================================

    var _json =
        json_stringify(_data);


    var _file =
        file_text_open_write(
            scr_save_path(_slot)
        );


    file_text_write_string(
        _file,
        _json
    );


    file_text_close(_file);


    global.current_save_slot =
        _slot;


    show_debug_message(
        "Game saved to slot "
        + string(_slot)
    );


    return true;
}


// ==================================================
// LOAD GAME
// ==================================================

function scr_load_game(_slot)
{
    var _path =
        scr_save_path(_slot);


    if (!file_exists(_path))
    {
        return false;
    }


    if (!instance_exists(obj_save_manager))
    {
        show_debug_message(
            "ERROR: Save manager does not exist."
        );

        return false;
    }


    // ==================================================
    // READ FILE
    // ==================================================

    var _file =
        file_text_open_read(_path);


    var _json =
        file_text_read_string(_file);


    file_text_close(_file);


    var _data =
        json_parse(_json);


    // ==================================================
    // SAVE MANAGER
    // ==================================================

    var _save_manager =
        instance_find(
            obj_save_manager,
            0
        );


    global.current_save_slot =
        _slot;


    if (
        variable_struct_exists(
            _data,
            "playtime_seconds"
        )
    )
    {
        _save_manager.playtime_seconds =
            _data.playtime_seconds;
    }
    else
    {
        _save_manager.playtime_seconds =
            0;
    }


    // ==================================================
    // SANITY
    // ==================================================

    if (
        variable_struct_exists(
            _data,
            "sanity"
        )
    )
    {
        global.sanity =
            _data.sanity;
    }
    else
    {
        global.sanity =
            100;
    }


    if (
        variable_struct_exists(
            _data,
            "max_sanity"
        )
    )
    {
        global.max_sanity =
            _data.max_sanity;
    }
    else
    {
        global.max_sanity =
            100;
    }


    // ==================================================
    // LOAD COINS
    // ==================================================

    if (
        variable_struct_exists(
            _data,
            "coins"
        )
    )
    {
        global.coins =
            _data.coins;
    }
    else
    {
        global.coins =
            50;
    }


    // ==================================================
    // LOAD STYLIST PURCHASES
    // ==================================================

    if (
        variable_struct_exists(
            _data,
            "shop_owned"
        )
    )
    {
        global.shop_owned =
            _data.shop_owned;
    }
    else
    {
        global.shop_owned = [
            false,
            false
        ];
    }


    // ==================================================
    // LOAD FRIDGE STATE
    // ==================================================

    if (
        variable_struct_exists(
            _data,
            "fridge_opened"
        )
    )
    {
        global.fridge_opened =
            _data.fridge_opened;
    }
    else
    {
        global.fridge_opened =
            false;
    }


    // ==================================================
    // LOAD FISHING ROD STATE
    // ==================================================

    if (
        variable_struct_exists(
            _data,
            "fishing_rod_collected"
        )
    )
    {
        global.fishing_rod_collected =
            _data.fishing_rod_collected;
    }
    else
    {
        global.fishing_rod_collected =
            false;
    }


    // ==================================================
    // LOAD CHEST STATES
    // ==================================================

    if (
        variable_struct_exists(
            _data,
            "opened_chests"
        )
    )
    {
        global.opened_chests =
            _data.opened_chests;
    }
    else
    {
        global.opened_chests =
            {};
    }


    // ==================================================
    // TARGET ROOM
    // ==================================================

    var _target_room =
        asset_get_index(
            _data.room_name
        );


    if (_target_room == -1)
    {
        _target_room =
            room_muruhouse;
    }


    // ==================================================
    // STORE DATA UNTIL ROOM FINISHES LOADING
    // ==================================================

    _save_manager.pending_data =
        _data;


    _save_manager.pending_room =
        _target_room;


    _save_manager.load_pending =
        true;


    // ==================================================
    // GO TO ROOM
    // ==================================================

    room_fade_to(
        _target_room
    );


    return true;
}


// ==================================================
// START NEW GAME
// ==================================================

function scr_start_new_game(_slot)
{
    global.current_save_slot =
        _slot;


    // ==================================================
    // RESET SANITY
    // ==================================================

    global.max_sanity =
        100;

    global.sanity =
        100;


    // ==================================================
    // RESET MERGED SYSTEMS
    //
    // IMPORTANT:
    // This prevents Save Slot 2 from inheriting
    // items / coins / purchases from Save Slot 1.
    // ==================================================

    global.coins =
        50;


    global.shop_owned = [
        false,
        false
    ];


    global.fridge_opened =
        false;


    global.fishing_rod_collected =
        false;


    global.opened_chests =
        {};


    // ==================================================
    // RESET HOTBAR IF IT ALREADY EXISTS
    // ==================================================

    if (instance_exists(obj_hotbar))
    {
        var _hotbar =
            instance_find(
                obj_hotbar,
                0
            );


        for (
            var h = 0;
            h < _hotbar.slot_count;
            h++
        )
        {
            _hotbar.hotbar[h].item_name =
                "";

            _hotbar.hotbar[h].amount =
                0;
        }


        _hotbar.selected_slot =
            0;


        _hotbar.visible_hotbar =
            false;
    }


    // ==================================================
    // RESET OLD QUEST STATE
    // ==================================================

    if (instance_exists(obj_quest_manager))
    {
        with (obj_quest_manager)
        {
            instance_destroy();
        }
    }


    // ==================================================
    // RESET SAVE MANAGER
    // ==================================================

    var _save_manager =
        instance_find(
            obj_save_manager,
            0
        );


    _save_manager.playtime_seconds =
        0;


    _save_manager.load_pending =
        false;


    _save_manager.pending_data =
        undefined;


    _save_manager.pending_room =
        -1;


    _save_manager.new_game_pending =
        true;


    // ==================================================
    // RESET AUTOSAVE VARIABLES IF THEY EXIST
    // ==================================================

    if (
        variable_instance_exists(
            _save_manager,
            "autosave_pending"
        )
    )
    {
        _save_manager.autosave_pending =
            false;
    }


    if (
        variable_instance_exists(
            _save_manager,
            "autosave_reason"
        )
    )
    {
        _save_manager.autosave_reason =
            "";
    }


    if (
        variable_instance_exists(
            _save_manager,
            "autosave_elapsed"
        )
    )
    {
        _save_manager.autosave_elapsed =
            0;
    }


    // ==================================================
    // START GAME
    // ==================================================

    room_fade_to(
        room_muruhouse
    );
}


// ==================================================
// DELETE SAVE FILE
// ==================================================

function scr_delete_save(_slot)
{
    var _path =
        scr_save_path(_slot);


    if (file_exists(_path))
    {
        file_delete(_path);


        show_debug_message(
            "Deleted save slot "
            + string(_slot)
        );
    }


    // If this happened to be the current slot,
    // clear the active slot.
    if (
        global.current_save_slot
        ==
        _slot
    )
    {
        global.current_save_slot =
            0;
    }
}


// ==================================================
// REQUEST AUTOSAVE
// ==================================================

function scr_request_autosave(_reason = "gameplay")
{
    // --------------------------------------------------
    // SAVE MANAGER MUST EXIST
    // --------------------------------------------------

    if (!instance_exists(obj_save_manager))
    {
        return false;
    }


    // --------------------------------------------------
    // MUST HAVE ACTIVE SAVE SLOT
    // --------------------------------------------------

    if (
        !variable_global_exists(
            "current_save_slot"
        )
        ||
        global.current_save_slot <= 0
    )
    {
        return false;
    }


    var _save_manager =
        instance_find(
            obj_save_manager,
            0
        );


    // --------------------------------------------------
    // QUEUE AUTOSAVE
    //
    // obj_save_manager Step handles the actual save
    // once player + quest manager exist.
    // --------------------------------------------------

    _save_manager.autosave_pending =
        true;


    _save_manager.autosave_reason =
        _reason;


    return true;
}