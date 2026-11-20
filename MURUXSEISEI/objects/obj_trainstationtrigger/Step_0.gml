// ==================================================
// TRAIN STATION TRIGGER - STEP
// ==================================================

if (global.game_paused)
{
    can_interact = false;
    exit;
}

if (global.dialogue_active)
{
    can_interact = false;
    exit;
}

if (!instance_exists(obj_player))
{
    can_interact = false;
    exit;
}


// ==================================================
// CHECK IF MURU IS NEAR TRAIN STATION
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
// PRESS ENTER
// ==================================================

if (
    can_interact
    &&
    keyboard_check_pressed(vk_enter)
)
{
    // ==================================================
    // TOWN 1 -> TOWN 2
    // ==================================================

    if (room == room_town1)
    {
        // Save exact Town 1 position
        scr_enter_room(
            room_town2
        );

        exit;
    }


    // ==================================================
    // TOWN 2 -> TOWN 1
    // ==================================================

    if (room == room_town2)
    {
        // Return to exact Town 1 position
        if (
            variable_global_exists("previous_room")
            &&
            global.previous_room == room_town1
        )
        {
            global.return_spawn_pending =
                true;

            global.return_spawn_x =
                global.previous_x;

            global.return_spawn_y =
                global.previous_y;


            room_fade_to(
                room_town1
            );

            exit;
        }


        // --------------------------------------------------
        // FALLBACK
        // Used if Town 1 position was not saved
        // --------------------------------------------------

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
}