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


// ==================================================
// INTERACT
// ==================================================

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


    // ==================================================
    // REMEMBER SHOP RETURN ROOM
    // ==================================================

    global.shop_return_room =
        room;


    // ==================================================
    // DAY 1 - EXPLORE TOWN BUILDINGS
    // ==================================================

    if (room == room_town1)
    {
        scr_visit_house(
            "811"
        );
    }


    // ==================================================
    // DAY 5 - RELATIVEMART
    // ==================================================

    if (
        room == room_town2
        &&
        instance_exists(
            obj_quest_manager
        )
    )
    {
        var _manager =
            instance_find(
                obj_quest_manager,
                0
            );


        if (
            _manager.current_day_index
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


    // ==================================================
    // ENTER 8/11
    // ==================================================

    scr_enter_room(
        room_811
    );
}