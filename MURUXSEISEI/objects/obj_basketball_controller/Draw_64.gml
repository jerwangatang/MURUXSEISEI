// ==================================================
// BASKETBALL CONTROLLER - DRAW GUI
// ==================================================

var _gui_w =
    display_get_gui_width();

var _gui_h =
    display_get_gui_height();


// ==================================================
// SCORE - TOP LEFT
// ==================================================

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_color(c_white);

draw_text(
    30,
    30,
    "Score: "
    + string(score)
);


// ==================================================
// SHOTS REMAINING
// ==================================================

var _shots_remaining =
    max_shots - shots_taken;

draw_text(
    30,
    60,
    "Shots Remaining: "
    + string(_shots_remaining)
);


// ==================================================
// TIMING BAR
// Only show while aiming
// ==================================================

if (state == 0)
{
    var _bar_width =
        500;

    var _bar_height =
        24;

    var _bar_x =
        (_gui_w / 2)
        -
        (_bar_width / 2);

    var _bar_y =
        _gui_h - 70;


    // --------------------------------------------------
    // BAR BACKGROUND
    // --------------------------------------------------

    draw_set_color(c_dkgray);

    draw_rectangle(
        _bar_x,
        _bar_y,
        _bar_x + _bar_width,
        _bar_y + _bar_height,
        false
    );


    // --------------------------------------------------
    // GREEN SUCCESS ZONE
    // --------------------------------------------------

    var _centre =
        _bar_x
        +
        (_bar_width / 2);

    var _success_width =
        (_bar_width / 2)
        *
        aim_success_range;


    draw_set_color(c_green);

    draw_rectangle(
        _centre - _success_width,
        _bar_y,
        _centre + _success_width,
        _bar_y + _bar_height,
        false
    );


    // --------------------------------------------------
    // MOVING AIM MARKER
    // --------------------------------------------------

    var _marker_x =
        _centre
        +
        aim_value
        *
        (_bar_width / 2);


    draw_set_color(c_white);

    draw_rectangle(
        _marker_x - 4,
        _bar_y - 8,
        _marker_x + 4,
        _bar_y + _bar_height + 8,
        false
    );
}


// ==================================================
// RESET DRAW SETTINGS
// ==================================================

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_color(c_white);
draw_set_alpha(1);