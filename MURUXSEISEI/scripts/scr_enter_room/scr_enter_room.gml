// ==================================================
// ENTER ROOM AND REMEMBER PREVIOUS POSITION
// ==================================================

function scr_enter_room(_target_room)
{
    if (!instance_exists(obj_player))
    {
        return false;
    }

    var _player =
        instance_find(
            obj_player,
            0
        );


    // Remember where Muru came from
    global.previous_room =
        room;

    global.previous_x =
        _player.x;

    global.previous_y =
        _player.y;


    // Change room
    room_fade_to(
        _target_room
    );


    return true;
}