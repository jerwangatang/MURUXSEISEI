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
// TRAIN STATION TRIGGER - STEP
// ==================================================


// ==================================================
// BLOCK DURING PAUSE / DIALOGUE
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
// PLAYER INTERACTION
// ==================================================

if (place_meeting(x, y, obj_player))
{
    if (keyboard_check_pressed(vk_enter))
    {
        // Train station unlocks from Day 3 onward
        if (obj_quest_manager.current_day_index >= 2)
        {
            audio_play_sound(
                snd_menu_select,
                1,
                false
            );

            room_fade_to(
                room_town2
            );
        }
        else
        {
            audio_play_sound(
                snd_fail,
                1,
                false
            );

            obj_quest_manager.show_locked_message =
                true;

            obj_quest_manager.locked_message_timer =
                room_speed * 2;
        }
    }
}