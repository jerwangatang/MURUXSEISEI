// ==================================================
// BASKETBALL TRIGGER - STEP
// ==================================================

can_interact = false;


if (global.game_paused)
{
    exit;
}


if (global.dialogue_active)
{
    exit;
}


if (!instance_exists(obj_player))
{
    exit;
}


if (!instance_exists(obj_quest_manager))
{
    exit;
}


var _manager =
    instance_find(
        obj_quest_manager,
        0
    );


// Basketball quest is Day 4 only
if (_manager.current_day_index != 3)
{
    exit;
}


var _player =
    instance_find(
        obj_player,
        0
    );


var _distance =
    point_distance(
        x,
        y,
        _player.x,
        _player.y
    );


can_interact =
    (_distance <= interaction_distance);


if (
    can_interact
    &&
    keyboard_check_pressed(vk_enter)
)
{
    room_fade_to(
        room_basketball
    );

    exit;
}