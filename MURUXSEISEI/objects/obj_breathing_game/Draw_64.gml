// ==================================================
// BREATHING GAME - DRAW GUI
// ==================================================

var _w =
    display_get_gui_width();

var _h =
    display_get_gui_height();

var _cx =
    _w / 2;

var _cy =
    _h / 2;


// ==================================================
// BACKGROUND
// ==================================================

draw_set_color(c_black);

draw_rectangle(
    0,
    0,
    _w,
    _h,
    false
);


// ==================================================
// TEXT ALIGNMENT
// ==================================================

draw_set_halign(fa_center);
draw_set_valign(fa_middle);


// ==================================================
// TITLE
// ==================================================

draw_set_color(c_white);

draw_text(
    _cx,
    60,
    "BREATHE WITH THE LIGHT"
);


// ==================================================
// INSTRUCTION
// ==================================================

if (!finished)
{
    if (phase == 0)
    {
        draw_text(
            _cx,
            110,
            "HOLD ENTER - BREATHE IN"
        );
    }
    else
    {
        draw_text(
            _cx,
            110,
            "RELEASE ENTER - BREATHE OUT"
        );
    }
}


// ==================================================
// BREATHING CIRCLE
// ==================================================

draw_set_color(
    make_color_rgb(
        230,
        230,
        240
    )
);

draw_circle(
    _cx,
    _cy,
    circle_radius,
    false
);


// ==================================================
// TEXT INSIDE CIRCLE
// ==================================================

draw_set_color(c_black);


if (!finished)
{
    if (phase == 0)
    {
        draw_text(
            _cx,
            _cy,
            "INHALE"
        );
    }
    else
    {
        draw_text(
            _cx,
            _cy,
            "EXHALE"
        );
    }
}
else
{
    draw_text(
        _cx,
        _cy,
        "YOU FEEL CALMER"
    );
}


// ==================================================
// BREATH COUNTER
// ==================================================

draw_set_color(c_white);

draw_text(
    _cx,
    _h - 110,
    "Breaths: "
    + string(cycles_done)
    + " / "
    + string(cycles_needed)
);


// ==================================================
// EXTRA HELP
// ==================================================

if (!finished)
{
    if (phase == 0)
    {
        draw_text(
            _cx,
            _h - 70,
            "Keep holding ENTER until the circle is full."
        );
    }
    else
    {
        draw_text(
            _cx,
            _h - 70,
            "Let go of ENTER and watch the circle shrink."
        );
    }


    draw_text(
        _cx,
        _h - 35,
        "ESC to leave"
    );
}


// ==================================================
// RESET DRAW SETTINGS
// ==================================================

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_color(c_white);
draw_set_alpha(1);