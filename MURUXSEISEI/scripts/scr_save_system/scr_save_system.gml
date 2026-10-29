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
        instance_find(obj_save_manager, 0);

    var _player =
        instance_find(obj_player, 0);

    var _manager =
        instance_find(obj_quest_manager, 0);


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
    // BUILD SAVE DATA
    // ==================================================

    var _data =
    {
        version: 1,

        slot: _slot,

        room_name:
            room_get_name(room),

        location_name:
            scr_location_name(room),

        player_x:
            _player.x,

        player_y:
            _player.y,

        sanity:
            global.sanity,

        max_sanity:
            global.max_sanity,

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

        playtime_seconds:
            _save_manager.playtime_seconds
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


    global.current_save_slot = _slot;


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


    // --------------------------------------------------
    // READ FILE
    // --------------------------------------------------

    var _file =
        file_text_open_read(_path);

    var _json =
        file_text_read_string(_file);

    file_text_close(_file);


    var _data =
        json_parse(_json);


    // --------------------------------------------------
    // SAVE MANAGER
    // --------------------------------------------------

    var _save_manager =
        instance_find(
            obj_save_manager,
            0
        );


    global.current_save_slot =
        _slot;


    _save_manager.playtime_seconds =
        _data.playtime_seconds;


    // --------------------------------------------------
    // SANITY
    // --------------------------------------------------

    global.sanity =
        _data.sanity;

    global.max_sanity =
        _data.max_sanity;


    // --------------------------------------------------
    // TARGET ROOM
    // --------------------------------------------------

    var _target_room =
        asset_get_index(
            _data.room_name
        );


    if (_target_room == -1)
    {
        _target_room =
            room_muruhouse;
    }


    // Store data until room finishes loading
    _save_manager.pending_data =
        _data;

    _save_manager.pending_room =
        _target_room;

    _save_manager.load_pending =
        true;


    // --------------------------------------------------
    // GO TO ROOM
    // --------------------------------------------------

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


    // --------------------------------------------------
    // RESET SANITY
    // --------------------------------------------------

    global.max_sanity = 100;
    global.sanity = 100;


    // --------------------------------------------------
    // RESET OLD QUEST STATE
    // --------------------------------------------------

    if (instance_exists(obj_quest_manager))
    {
        with (obj_quest_manager)
        {
            instance_destroy();
        }
    }


    // --------------------------------------------------
    // RESET PLAYTIME
    // --------------------------------------------------

    var _save_manager =
        instance_find(
            obj_save_manager,
            0
        );

    _save_manager.playtime_seconds =
        0;

    _save_manager.load_pending =
        false;

    _save_manager.new_game_pending =
        true;


    // --------------------------------------------------
    // START GAME
    // --------------------------------------------------

    room_fade_to(
        room_muruhouse
    );
}