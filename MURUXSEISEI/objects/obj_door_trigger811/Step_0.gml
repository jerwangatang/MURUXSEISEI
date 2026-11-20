// ==================================================
// 8/11 / RELATIVEMART ENTRANCE - STEP
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


if (
    place_meeting(
        x,
        y,
        obj_player
    )
    &&
    keyboard_check_pressed(vk_enter)
)
{
    audio_play_sound(
        snd_menu_select,
        1,
        false
    );


    // Keep this for compatibility with your shop system
    global.shop_return_room =
        room;


    // ==================================================
    // DAY 5 RELATIVEMART QUEST
    // ==================================================

    if (
        room == room_town2
        &&
        instance_exists(obj_quest_manager)
    )
    {
        if (
            obj_quest_manager.current_day_index
            ==
            4
        )
        {
            if (
                !scr_quest_done(
                    "relativemart_day5"
                )
            )
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


    // Remember exact position and enter
    scr_enter_room(
        room_811
    );
}