// Stop movement while paused or talking
if (global.game_paused || global.dialogue_active)
{
    exit;
}


// --------------------------------------------------
// INPUT - LEFT/RIGHT ONLY
// --------------------------------------------------

var _move_x =
    keyboard_check(ord("D"))
    - keyboard_check(ord("A"));


// --------------------------------------------------
// SPEED
// --------------------------------------------------

var _speed = move_spd;

var _moving = (_move_x != 0);

_move_x *= _speed;


// --------------------------------------------------
// HORIZONTAL COLLISION ONLY
// --------------------------------------------------

if (!place_meeting(x + _move_x, y, obj_solid))
{
    x += _move_x;
}


// --------------------------------------------------
// FACING DIRECTION
// --------------------------------------------------

if (_moving)
{
    facing_dir = (_move_x > 0) ? "east" : "west";
}


// --------------------------------------------------
// SPRITE SELECTION
// --------------------------------------------------

var _new_sprite = sprite_index;

switch (facing_dir)
{
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