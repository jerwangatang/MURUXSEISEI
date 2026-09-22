// ==================================================
// NEIGHBOUR - STEP EVENT
// ==================================================

// Reset interaction indicator
can_interact = false;


// --------------------------------------------------
// PAUSE CHECK
// --------------------------------------------------

if (global.game_paused)
{
    exit;
}


// --------------------------------------------------
// ENTER RELEASE CHECK
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
// DIALOGUE CHECK
// --------------------------------------------------

if (global.dialogue_active)
{
    exit;
}


// --------------------------------------------------
// PLAYER CHECK
// --------------------------------------------------

if (!instance_exists(obj_player))
{
    exit;
}

var _player = instance_find(obj_player, 0);


// --------------------------------------------------
// SURROUNDING INTERACTION AREA
// --------------------------------------------------

var _near =
    _player.bbox_right >= bbox_left - interaction_margin &&
    _player.bbox_left <= bbox_right + interaction_margin &&
    _player.bbox_bottom >= bbox_top - interaction_margin &&
    _player.bbox_top <= bbox_bottom + interaction_margin;


// --------------------------------------------------
// INTERACTION
// --------------------------------------------------

if (_near)
{
    // Show interaction star
    can_interact = true;

    // Enter to interact
    if (keyboard_check_pressed(vk_enter))
    {
        dialogue_start(dialogue_lines);
    }
}