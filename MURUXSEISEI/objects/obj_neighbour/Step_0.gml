// ==================================================
// NEIGHBOUR - STEP EVENT
// ==================================================


// --------------------------------------------------
// PAUSE
// --------------------------------------------------

if (global.game_paused)
{
    exit;
}


// --------------------------------------------------
// WAIT FOR ENTER TO BE RELEASED
// --------------------------------------------------

if (global.interact_blocked)
{
    if (!keyboard_check(vk_enter))
    {
        global.interact_blocked = false;
    }

    exit;
}


// --------------------------------------------------
// ALREADY IN DIALOGUE
// --------------------------------------------------

if (global.dialogue_active)
{
    exit;
}


// --------------------------------------------------
// NPC INTERACTION
// --------------------------------------------------

if (instance_exists(obj_player))
{
    var _player = instance_find(obj_player, 0);

    var _near =
        _player.bbox_right  >= bbox_left  - 1 &&
        _player.bbox_left   <= bbox_right + 1 &&
        _player.bbox_bottom >= bbox_top   - 1 &&
        _player.bbox_top    <= bbox_bottom + 1;

    if (_near)
    {
        if (keyboard_check_pressed(vk_enter))
        {
            dialogue_start(dialogue_lines);
        }
    }
}