// ==================================================
// BIRDS - STEP
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


if (scr_quest_done("feed_birds"))
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
    scr_complete_quest(
        "feed_birds"
    );


    dialogue_start([
        {
            speaker: "Muru",
            text: "Here you go..."
        },

        {
            speaker: "Muru",
            text: "At least they seem happy."
        }
    ]);
}