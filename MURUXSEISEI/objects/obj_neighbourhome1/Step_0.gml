// ==================================================
// NEIGHBOUR HOUSE - EXPLORATION
// ==================================================

if (!instance_exists(obj_player))
{
    exit;
}

if (!instance_exists(obj_quest_manager))
{
    exit;
}


var _manager =
    instance_find(obj_quest_manager, 0);


// Miserday only
if (_manager.current_day_index != 0)
{
    exit;
}


var _player =
    instance_find(obj_player, 0);

var _margin = 35;


var _near =
    _player.bbox_right
        >= bbox_left - _margin
    &&
    _player.bbox_left
        <= bbox_right + _margin
    &&
    _player.bbox_bottom
        >= bbox_top - _margin
    &&
    _player.bbox_top
        <= bbox_bottom + _margin;


if (_near)
{
    scr_visit_house(
        "neighbour"
    );
}