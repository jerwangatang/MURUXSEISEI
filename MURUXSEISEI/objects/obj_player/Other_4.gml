// ==================================================
// PLAYER - ROOM START
// ==================================================


// ==================================================
// INITIALISE RETURN SYSTEM
// ==================================================

if (!variable_global_exists("previous_room"))
{
    global.previous_room = -1;
}

if (!variable_global_exists("previous_x"))
{
    global.previous_x = 0;
}

if (!variable_global_exists("previous_y"))
{
    global.previous_y = 0;
}

if (!variable_global_exists("return_spawn_pending"))
{
    global.return_spawn_pending = false;
}

if (!variable_global_exists("return_spawn_x"))
{
    global.return_spawn_x = 0;
}

if (!variable_global_exists("return_spawn_y"))
{
    global.return_spawn_y = 0;
}


// ==================================================
// ARCADE RETURN SPAWN
// ==================================================

if (!variable_global_exists("arcade_spawn_pending"))
{
    global.arcade_spawn_pending = false;
}


// ==================================================
// MAKE SURE MURU IS VISIBLE
// ==================================================

visible = true;

image_alpha = 1;


// ==================================================
// RETURNING FROM AN ARCADE MINIGAME
// ==================================================

if (
    room == room_arcade1
    &&
    global.arcade_spawn_pending
)
{
    // Known-good arcade player position
    x = 256;
    y = 128;


    // Prevent old room-return coordinates
    // from moving Muru somewhere else.
    global.return_spawn_pending = false;

    global.arcade_spawn_pending = false;


    show_debug_message(
        "ARCADE RETURN: Muru spawned at 256, 128"
    );

    exit;
}


// ==================================================
// NORMAL RETURN TO PREVIOUS POSITION
// ==================================================

if (global.return_spawn_pending)
{
    x =
        global.return_spawn_x;

    y =
        global.return_spawn_y;


    global.return_spawn_pending =
        false;
}