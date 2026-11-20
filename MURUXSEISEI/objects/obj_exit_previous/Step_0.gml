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
// CHECK IF MURU IS NEAR EXIT
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
// PRESS ENTER
// --------------------------------------------------

if (
    can_interact
    &&
    keyboard_check_pressed(vk_enter)
)
{
    // ==================================================
    // NORMAL RETURN
    // Muru entered this room from somewhere else
    // ==================================================

    if (
        variable_global_exists("previous_room")
        &&
        global.previous_room != -1
    )
    {
        global.return_spawn_pending =
            true;

        global.return_spawn_x =
            global.previous_x;

        global.return_spawn_y =
            global.previous_y;


        room_fade_to(
            global.previous_room
        );

        exit;
    }


    // ==================================================
    // FIRST GAME START
    // Muru begins inside her house, so there is no
    // previous room yet.
    // ==================================================

    if (room == room_muruhouse)
    {
        global.return_spawn_pending =
            true;

        global.return_spawn_x =
            792;

        global.return_spawn_y =
            400;


        room_fade_to(
            room_town1
        );

        exit;
    }


    // ==================================================
    // DEBUG
    // ==================================================

    show_debug_message(
        "EXIT ERROR: No previous room has been saved."
    );
}