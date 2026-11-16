// ==================================================
// BASKETBALL CONTROLLER - DRAW BEGIN
// ==================================================


// ==================================================
// FIND SPRITES BY NAME
// ==================================================

var _bg =
    asset_get_index(
        "spr_basketball_bg"
    );

var _court =
    asset_get_index(
        "spr_basketball_court"
    );


// ==================================================
// UPPER BACKGROUND
// ==================================================

if (_bg != -1)
{
    draw_sprite_stretched(
        _bg,
        0,

        0,
        0,

        room_width,
        background_height
    );
}
else
{
    // Temporary fallback if sprite is missing
    draw_set_color(c_gray);

    draw_rectangle(
        0,
        0,
        room_width,
        background_height,
        false
    );
}


// ==================================================
// COURT
// ==================================================

if (_court != -1)
{
    draw_sprite_stretched(
        _court,
        0,

        0,
        court_y,

        room_width,
        room_height - court_y
    );
}
else
{
    // Temporary fallback if sprite is missing
    draw_set_color(c_dkgray);

    draw_rectangle(
        0,
        court_y,
        room_width,
        room_height,
        false
    );
}


// ==================================================
// RESET
// ==================================================

draw_set_color(c_white);
draw_set_alpha(1);