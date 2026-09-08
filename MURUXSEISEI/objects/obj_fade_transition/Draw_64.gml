// ==================================================
// FADE TRANSITION - DRAW GUI
// ==================================================

draw_set_colour(c_black);
draw_set_alpha(fade_alpha);

draw_rectangle(
    0,
    0,
    display_get_gui_width(),
    display_get_gui_height(),
    false
);


// Reset draw settings
draw_set_alpha(1);
draw_set_colour(c_white);