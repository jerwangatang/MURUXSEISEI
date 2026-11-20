// ==================================================
// EXIT PREVIOUS - STEP
// ==================================================


// --------------------------------------------------
// PAUSE
// --------------------------------------------------

if (global.game_paused)
{
    can_interact = false;
    exit;
}


// --------------------------------------------------
// DIALOGUE
// --------------------------------------------------

if (global.dialogue_active)
{
    can_interact = false;
    exit;
}


// --------------------------------------------------
// PLAYER CHECK
// --------------------------------------------------

if (!instance_exists(obj_player))
{
    can_interact = false;
    exit;
}


// --------------------------------------------------
// CHECK IF PLAYER IS NEAR EXIT
// --------------------------------------------------

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


// --------------------------------------------------
// PRESS ENTER TO EXIT
// --------------------------------------------------

if (
    can_interact
    &&
    keyboard_check_pressed(vk_enter)
)
{
    // Make sure previous room exists
    if (
        !variable_global_exists("previous_room")
        ||
        global.previous_room == -1
    )
    {
        show_debug_message(
            "EXIT ERROR: previous_room has not been saved."
        );

        exit;
    }


    // Make sure previous position exists
    if (
        !variable_global_exists("previous_x")
        ||
        !variable_global_exists("previous_y")
    )
    {
        show_debug_message(
            "EXIT ERROR: previous position has not been saved."
        );

        exit;
    }


    // Save return position
    global.return_spawn_pending =
        true;

    global.return_spawn_x =
        global.previous_x;

    global.return_spawn_y =
        global.previous_y;


    // Return to previous room
    room_fade_to(
        global.previous_room
    );
}