// ==================================================
// DIALOGUE PORTRAIT - DRAW GUI
// ==================================================

// Only draw during dialogue
if (!variable_global_exists("dialogue_active"))
{
    exit;
}


if (!global.dialogue_active)
{
    exit;
}


// Crush can hide the generic portrait
if (
    variable_global_exists("hide_npc_portrait")
    &&
    global.hide_npc_portrait
)
{
    exit;
}


// Make sure sprite exists
if (!sprite_exists(spr_npc_portrait))
{
    exit;
}


// ==================================================
// GUI SIZE
// ==================================================

var _gui_w =
    display_get_gui_width();

var _gui_h =
    display_get_gui_height();


// ==================================================
// PORTRAIT SIZE
// ==================================================

var _max_w = 170;
var _max_h = 170;


var _sprite_w =
    sprite_get_width(
        spr_npc_portrait
    );

var _sprite_h =
    sprite_get_height(
        spr_npc_portrait
    );


// Keep original proportions
var _scale =
    min(
        _max_w / _sprite_w,
        _max_h / _sprite_h
    );


var _draw_w =
    _sprite_w
    *
    _scale;

var _draw_h =
    _sprite_h
    *
    _scale;


// ==================================================
// PORTRAIT POSITION
// ==================================================

// Left side of dialogue box
var _portrait_x = 35;

var _portrait_y =
    _gui_h
    -
    _draw_h
    -
    35;


// ==================================================
// DRAW PORTRAIT
// ==================================================

draw_set_alpha(1);

draw_sprite_stretched(
    spr_npc_portrait,
    0,
    _portrait_x,
    _portrait_y,
    _draw_w,
    _draw_h
);

draw_set_alpha(1);