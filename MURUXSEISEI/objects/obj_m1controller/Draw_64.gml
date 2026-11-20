// ==================================================
// MINIGAME 1 - DRAW GUI
// ==================================================

if (!variable_global_exists("m1_score"))
{
    global.m1_score = 0;
}


draw_set_font(-1);
draw_set_color(c_white);

draw_text(
    20,
    20,
    "Score: " + string(global.m1_score)
);