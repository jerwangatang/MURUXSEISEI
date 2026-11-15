// ==================================================
// BASKETBALL CONTROLLER - DRAW BEGIN
// ==================================================


// ==================================================
// UPPER BACKGROUND
// ==================================================

draw_sprite_stretched(
    spr_basketball_court,
    0,

    0,
    0,

    room_width,
    background_height
);


// ==================================================
// COURT
//
// Slight overlap with background hides seams.
// ==================================================

draw_sprite_stretched(
    spr_basketball_court,
    0,

    0,
    court_y,

    room_width,
    room_height - court_y
);