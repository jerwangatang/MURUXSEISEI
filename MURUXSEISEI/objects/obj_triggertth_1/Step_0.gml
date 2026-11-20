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
    scr_enter_room(
        room_tutorhome
    );
}