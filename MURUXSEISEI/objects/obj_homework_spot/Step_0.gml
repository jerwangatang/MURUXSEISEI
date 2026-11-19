// ==================================================
// HOMEWORK SPOT - STEP
// DAY 1 + DAY 3
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

var _day =
    _manager.current_day_index;

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


if (!_near)
{
    exit;
}


if (!keyboard_check_pressed(vk_enter))
{
    exit;
}


// ==================================================
// DAY 1
// DO HALF OF HOMEWORK
// ==================================================

if (_day == 0)
{
    var _half =
        ceil(
            _manager.homework_total / 2
        );


    if (_manager.homework_progress < _half)
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


// ==================================================
// DAY 3
// FINISH REMAINING HOMEWORK
// ==================================================

else if (_day == 2)
{
    if (!scr_quest_done("finish_homework_day3"))
    {
        // Safety:
        // Day 1 should already have completed half.
        var _half =
            ceil(
                _manager.homework_total / 2
            );


        _manager.homework_progress =
            max(
                _manager.homework_progress,
                _half
            );


        _manager.homework_progress =
            min(
                _manager.homework_progress + 1,
                _manager.homework_total
            );


        // Finished everything
        if (
            _manager.homework_progress
            >=
            _manager.homework_total
        )
        {
            scr_complete_quest(
                "finish_homework_day3"
            );


            dialogue_start([
                {
                    speaker: "Muru",
                    text:
                        "Finally... I finished all my homework."
                }
            ]);
        }
        else
        {
            dialogue_start([
                {
                    speaker: "Muru",
                    text:
                        "Almost done... "
                        + string(
                            _manager.homework_progress
                        )
                        + "/"
                        + string(
                            _manager.homework_total
                        )
                }
            ]);
        }
    }
}