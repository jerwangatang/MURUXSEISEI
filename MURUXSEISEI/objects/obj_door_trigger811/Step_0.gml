// ==================================================
// BLOCK INTERACTION WHILE PAUSED
// ==================================================

if (global.game_paused)
{
    exit;
}

if (global.dialogue_active)
{
    exit;
}

// ==================================================
// 8/11 / RELATIVEMART ENTRANCE - STEP
// ==================================================


// --------------------------------------------------
// PAUSE CHECK
// --------------------------------------------------

if (global.game_paused)
{
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
// PLAYER INTERACTION
// --------------------------------------------------

if (place_meeting(x, y, obj_player))
{
    if (keyboard_check_pressed(vk_enter))
    {
        audio_play_sound(
            snd_menu_select,
            1,
            false
        );


        // ==================================================
        // REMEMBER WHICH TOWN WE ENTERED FROM
        // ==================================================

        global.shop_return_room =
            room;


        // ==================================================
        // TOWN 2 = RELATIVEMART
        // ==================================================

        if (
            room == room_town2
            &&
            instance_exists(obj_quest_manager)
        )
        {
            // --------------------------------------------------
            // DAY 5
            // --------------------------------------------------

            if (
                obj_quest_manager.current_day_index == 4
            )
            {
                if (!scr_quest_done("relativemart_day5"))
                {
                    scr_complete_quest(
                        "relativemart_day5"
                    );


                    scr_request_autosave(
                        "visited RelativeMart"
                    );
                }
            }
        }


        // ==================================================
        // BOTH SHOPS USE THE SAME INTERIOR
        // ==================================================

        room_fade_to(
            room_811
        );
    }
}