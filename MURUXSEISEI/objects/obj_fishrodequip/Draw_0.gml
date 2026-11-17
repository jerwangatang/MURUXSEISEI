// ==================================================
// FISHING ROD PICKUP - DRAW
// ==================================================

if (!variable_global_exists("fishing_rod_collected"))
{
    global.fishing_rod_collected = false;
}


if (!global.fishing_rod_collected)
{
    draw_interaction_star(
        24,
        0.06,
        12
    );
}