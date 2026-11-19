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

if (!triggered && place_meeting(x, y, obj_player)) {
    scr_complete_quest("explore_town2");
    triggered = true;
}