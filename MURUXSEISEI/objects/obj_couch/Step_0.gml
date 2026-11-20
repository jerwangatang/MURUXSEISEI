// ==================================================
// COUCH - STEP
// ==================================================


// ==================================================
// PAUSE CHECK
// ==================================================

if (global.game_paused)
{
    can_interact = false;
    exit;
}


// ==================================================
// PLAYER CHECK
// ==================================================

if (!instance_exists(obj_player))
{
    can_interact = false;
    exit;
}


// ==================================================
// DETECT DIALOGUE CLOSING
// ==================================================

if (
    was_dialogue_active
    &&
    !global.dialogue_active
)
{
    // Prevent the Enter used to close dialogue
    // from immediately interacting again
    enter_release_block = true;
}


// Remember dialogue state
was_dialogue_active =
    global.dialogue_active;


// ==================================================
// DIALOGUE ACTIVE
// ==================================================

if (global.dialogue_active)
{
    can_interact = false;
    exit;
}


// ==================================================
// WAIT FOR ENTER RELEASE
// ==================================================

if (enter_release_block)
{
    if (!keyboard_check(vk_enter))
    {
        enter_release_block = false;
    }

    can_interact = false;
    exit;
}


// ==================================================
// CHECK IF PLAYER IS NEAR COUCH
// ==================================================

var _player_near =
    collision_rectangle(
        bbox_left - interaction_margin,
        bbox_top - interaction_margin,
        bbox_right + interaction_margin,
        bbox_bottom + interaction_margin,
        obj_player,
        false,
        true
    );

can_interact =
    (_player_near != noone);


// ==================================================
// INTERACT
// ==================================================

if (
    can_interact
    &&
    keyboard_check_pressed(vk_enter)
)
{
    // ==================================================
    // ALL QUESTS COMPLETE
    // ==================================================

    if (scr_day_complete())
    {
        scr_advance_day();

        room_goto(
            room_catchthefallingthoughts
        );

        exit;
    }


    // ==================================================
    // QUESTS NOT COMPLETE
    // ==================================================

    dialogue_start([
        {
            speaker: "Muru",
            text: "Not now."
        }
    ]);

    exit;
}