// ==================================================
// PLAYER - STEP EVENT
// ==================================================

// Stop movement while paused or talking
if (global.game_paused || global.dialogue_active)
{
    exit;
}


// --------------------------------------------------
// INPUT
// --------------------------------------------------

var _move_x =
    keyboard_check(ord("D"))
    - keyboard_check(ord("A"));

var _move_y =
    keyboard_check(ord("S"))
    - keyboard_check(ord("W"));


// --------------------------------------------------
// SPEED
// --------------------------------------------------

var _speed = move_spd;


// --------------------------------------------------
// NORMALISE DIAGONAL MOVEMENT
// --------------------------------------------------

var _moving = (_move_x != 0 || _move_y != 0);

if (_moving)
{
    var _len = point_distance(0, 0, _move_x, _move_y);

    _move_x /= _len;
    _move_y /= _len;
}

_move_x *= _speed;
_move_y *= _speed;


// --------------------------------------------------
// HORIZONTAL COLLISION
// --------------------------------------------------

if (!place_meeting(x + _move_x, y, obj_solid))
{
    x += _move_x;
}


// --------------------------------------------------
// VERTICAL COLLISION
// --------------------------------------------------

if (!place_meeting(x, y + _move_y, obj_solid))
{
    y += _move_y;
}


// --------------------------------------------------
// FACING DIRECTION (for sprite selection)
// --------------------------------------------------

if (_moving)
{
    // Pick whichever axis has the stronger input, so diagonals
    // still resolve to one of the 4 sprite directions
    if (abs(_move_x) > abs(_move_y))
    {
        facing_dir = (_move_x > 0) ? "east" : "west";
    }
    else
    {
        facing_dir = (_move_y > 0) ? "south" : "north";
    }
}


// --------------------------------------------------
// SPRITE SELECTION
// --------------------------------------------------

var _new_sprite = sprite_index;

switch (facing_dir)
{
    case "south":
        _new_sprite = _moving ? spr_muru_walk_south : spr_muru_idle_south;
        break;
    case "north":
        _new_sprite = _moving ? spr_muru_walk_north : spr_muru_idle_north;
        break;
    case "east":
        _new_sprite = _moving ? spr_muru_walk_east : spr_muru_idle_east;
        break;
    case "west":
        _new_sprite = _moving ? spr_muru_walk_west : spr_muru_idle_west;
        break;
}

if (_new_sprite != sprite_index)
{
    sprite_index = _new_sprite;
    image_index = 0;
}

image_speed = 0.2;


// --------------------------------------------------
// USE ITEM
// --------------------------------------------------

if (keyboard_check_pressed(ord("P"))) {
    var _slot = obj_hotbar.hotbar[obj_hotbar.selected_slot];
    
    if (_slot.item_name != "") {
        scr_use_item(_slot.item_name);
    }
}


// --------------------------------------------------
// SPEED BOOST TIMER
// --------------------------------------------------

if (speed_boost_timer > 0) {
    speed_boost_timer--;
    if (speed_boost_timer <= 0) {
        move_spd = base_move_spd;
    }
}


// --------------------------------------------------
// DEBUG SANITY KEYS
// --------------------------------------------------

if (keyboard_check_pressed(ord("K"))) {
    sanity_change(-20);
}

if (keyboard_check_pressed(ord("L"))) {
    sanity_change(20);
}