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

if (place_meeting(x, y, obj_player)) {
    if (keyboard_check_pressed(vk_enter)) {
        room_fade_to(room_dontpoptheballoon);
    }
}
