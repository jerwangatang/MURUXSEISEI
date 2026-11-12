// ==================================================
// TUTOR - STEP
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


var _player =
    instance_find(obj_player, 0);


var _near =
    _player.bbox_right
        >= bbox_left - interaction_margin
    &&
    _player.bbox_left
        <= bbox_right + interaction_margin
    &&
    _player.bbox_bottom
        >= bbox_top - interaction_margin
    &&
    _player.bbox_top
        <= bbox_bottom + interaction_margin;


if (
    _near
    &&
    keyboard_check_pressed(vk_enter)
)
{
    if (!scr_quest_done("tutoring"))
    {
        scr_complete_quest(
            "tutoring"
        );
    }


    dialogue_start(
        dialogue_lines
    );
}