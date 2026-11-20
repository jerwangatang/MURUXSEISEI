// ==================================================
// PLAYER - ROOM START
// ==================================================


// --------------------------------------------------
// INITIALISE RETURN SYSTEM
// --------------------------------------------------

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


// --------------------------------------------------
// RETURN TO PREVIOUS POSITION
// --------------------------------------------------

if (global.return_spawn_pending)
{
    x =
        global.return_spawn_x;

    y =
        global.return_spawn_y;


    global.return_spawn_pending =
        false;
}