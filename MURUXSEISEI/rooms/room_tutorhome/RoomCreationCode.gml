// ==================================================
// ROOM_TUTORHOME - CREATION CODE
// ==================================================


// --------------------------------------------------
// ROOM NAME
// --------------------------------------------------

show_debug_message(
    "========================================"
);

show_debug_message(
    "ENTERED ROOM: "
    + room_get_name(room)
);


// --------------------------------------------------
// INSTANCE COUNTS
// --------------------------------------------------

show_debug_message(
    "PLAYER COUNT: "
    + string(
        instance_number(obj_player)
    )
);

show_debug_message(
    "TUTOR COUNT: "
    + string(
        instance_number(obj_tutor)
    )
);


// --------------------------------------------------
// PLAYER POSITION
// --------------------------------------------------

if (instance_exists(obj_player))
{
    var _player =
        instance_find(
            obj_player,
            0
        );


    show_debug_message(
        "PLAYER POSITION"
        + " | x = " + string(_player.x)
        + " | y = " + string(_player.y)
    );
}
else
{
    show_debug_message(
        "ERROR: NO PLAYER IN TUTOR ROOM"
    );
}


// --------------------------------------------------
// TUTOR POSITION
// --------------------------------------------------

if (instance_exists(obj_tutor))
{
    var _tutor =
        instance_find(
            obj_tutor,
            0
        );


    show_debug_message(
        "TUTOR POSITION"
        + " | x = " + string(_tutor.x)
        + " | y = " + string(_tutor.y)
    );
}
else
{
    show_debug_message(
        "ERROR: NO TUTOR IN TUTOR ROOM"
    );
}


show_debug_message(
    "========================================"
);