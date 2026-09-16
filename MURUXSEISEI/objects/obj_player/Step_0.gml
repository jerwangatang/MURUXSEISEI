// ==================================================
// PLAYER - STEP EVENT
// ==================================================

// Stop all player movement while paused
if (global.game_paused || global.dialogue_active)
{
    exit;
}


// --------------------------------------------------
// MOVEMENT INPUT
// --------------------------------------------------

var _move_x =
    keyboard_check(ord("D"))
    - keyboard_check(ord("A"));

var _move_y =
    keyboard_check(ord("S"))
    - keyboard_check(ord("W"));


// Also support arrow keys
_move_x +=
    keyboard_check(vk_right)
    - keyboard_check(vk_left);

_move_y +=
    keyboard_check(vk_down)
    - keyboard_check(vk_up);


// --------------------------------------------------
// MOVEMENT SPEED
// --------------------------------------------------

var _move_speed = 2;


// --------------------------------------------------
// PREVENT FASTER DIAGONAL MOVEMENT
// --------------------------------------------------

if (_move_x != 0 || _move_y != 0)
{
    var _length = point_distance(
        0,
        0,
        _move_x,
        _move_y
    );

    _move_x /= _length;
    _move_y /= _length;
}


// --------------------------------------------------
// MOVE PLAYER
// --------------------------------------------------

x += _move_x * _move_speed;
y += _move_y * _move_speed;