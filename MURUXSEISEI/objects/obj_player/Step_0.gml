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

_move_x +=
    keyboard_check(vk_right)
    - keyboard_check(vk_left);

_move_y +=
    keyboard_check(vk_down)
    - keyboard_check(vk_up);


// --------------------------------------------------
// SPEED
// --------------------------------------------------

var _speed = 2;


// --------------------------------------------------
// NORMALISE DIAGONAL MOVEMENT
// --------------------------------------------------

if (_move_x != 0 || _move_y != 0)
{
    var _len = point_distance(
        0,
        0,
        _move_x,
        _move_y
    );

    _move_x /= _len;
    _move_y /= _len;
}

_move_x *= _speed;
_move_y *= _speed;


// --------------------------------------------------
// HORIZONTAL COLLISION
// --------------------------------------------------

if (!place_meeting(
    x + _move_x,
    y,
    obj_solid
))
{
    x += _move_x;
}


// --------------------------------------------------
// VERTICAL COLLISION
// --------------------------------------------------

if (!place_meeting(
    x,
    y + _move_y,
    obj_solid
))
{
    y += _move_y;
}