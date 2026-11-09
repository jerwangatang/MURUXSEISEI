// ==================================================
// HOMEWORK SPOT - STEP
// ==================================================

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
    instance_find(obj_quest_manager, 0);


// Miserday only
if (_manager.current_day_index != 0)
{
    exit;
}


var _player =
    instance_find(obj_player, 0);


var _near =
    point_distance(
        x,
        y,
        _player.x,
        _player.y
    )
    <= interaction_distance;


if (
    _near
    &&
    keyboard_check_pressed(vk_enter)
)
{
    var _half =
        ceil(
            _manager.homework_total / 2
        );


    // Only allow homework until half is finished
    if (
        _manager.homework_progress
        < _half
    )
    {
        var _progress =
            scr_homework_progress(1);


        dialogue_start([
            {
                speaker: "Muru",
                text:
                    "I finished some homework. "
                    + string(_progress)
                    + "/"
                    + string(_half)
            }
        ]);
    }
}