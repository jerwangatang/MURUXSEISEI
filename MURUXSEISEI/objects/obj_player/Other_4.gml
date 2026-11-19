// ==================================================
// PLAYER - ROOM START
// ==================================================


// ==================================================
// SPAWN POSITION FROM PREVIOUS ROOM
// ==================================================

if (
    variable_global_exists("next_x")
    &&
    variable_global_exists("next_y")
)
{
    if (
        global.next_x != undefined
        &&
        global.next_y != undefined
    )
    {
        x = global.next_x;
        y = global.next_y;


        // Only use the return position once
        global.next_x = undefined;
        global.next_y = undefined;
    }
}


// ==================================================
// TOWN DEPTH
// PLAYER BEHIND BUILDINGS
// ==================================================

if (
    room == room_town1
    ||
    room == room_town2
)
{
    depth = 0;
}