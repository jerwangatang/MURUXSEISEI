// ==================================================
// NEIGHBOUR HOUSE DOOR - STEP
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
// ENTER NEIGHBOUR HOUSE
// ==================================================

if (place_meeting(x, y, obj_player))
{
    if (keyboard_check_pressed(vk_enter))
    {
        // Count this house as explored on Miserday
        if (instance_exists(obj_quest_manager))
        {
            scr_visit_house("neighbour");
        }


        room_fade_to(
            room_neighbourhome
        );
    }
}