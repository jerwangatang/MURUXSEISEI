// ==================================================
// TUTOR HOUSE DOOR - STEP
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
// ENTER TUTOR HOUSE
// ==================================================

if (place_meeting(x, y, obj_player))
{
    if (keyboard_check_pressed(vk_enter))
    {
        // Count Tutor house as explored
        if (instance_exists(obj_quest_manager))
        {
            scr_visit_house("tutor");
        }


        // Player spawn position inside Tutor house
        global.next_x = 736;
        global.next_y = 700;


        room_fade_to(
            room_tutorhome
        );
    }
}