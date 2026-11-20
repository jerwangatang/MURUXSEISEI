// ==================================================
// TUTOR HOUSE ENTRANCE - STEP
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
    // ==================================================
    // DAY 1 BUILDING EXPLORATION
    // ==================================================

    if (room == room_town1)
    {
        scr_visit_house(
            "tutor"
        );
    }


    // ==================================================
    // ENTER TUTOR HOUSE
    // ==================================================

    scr_enter_room(
        room_tutorhome
    );
}