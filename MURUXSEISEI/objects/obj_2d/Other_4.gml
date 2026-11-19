// ==================================================
// PLAYER - ROOM START
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


        // Only use the spawn once
        global.next_x = undefined;
        global.next_y = undefined;
    }
}