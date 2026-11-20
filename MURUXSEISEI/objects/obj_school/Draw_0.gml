// ==================================================
// SCHOOL - DRAW
// ==================================================


// ==================================================
// ONLY SHOW WHEN INTERACTABLE
// ==================================================

if (
    !can_interact
    ||
    global.game_paused
    ||
    global.dialogue_active
    ||
    global.interact_blocked
)
{
    exit;
}


// ==================================================
// STAR ANIMATION
// ==================================================

var _frames =
    sprite_get_number(
        spr_interact_star
    );


var _frame =
    floor(
        current_time * 0.008
    )
    mod
    _frames;


var _bob =
    sin(
        current_time * 0.008
    )
    *
    2;


// ==================================================
// DRAW STAR AT EXACT ROOM POSITION
//
// X = 1030
// Y = approximately 250
// ==================================================

draw_sprite_ext(
    spr_interact_star,
    _frame,
    1030,
    250 + _bob,
    0.06,
    0.06,
    0,
    c_white,
    1
);