// ==================================================
// PAUSE MENU - STEP
// ==================================================


// --------------------------------------------------
// OPEN / CLOSE PAUSE MENU
// --------------------------------------------------

if (keyboard_check_pressed(vk_escape))
{
    // If not paused, open pause menu
    if (!global.game_paused)
    {
        global.game_paused = true;

        pause_page = "main";
        pause_selected = 0;

        audio_play_sound(
            snd_menu_select,
            1,
            false
        );
    }

    // If already paused
    else
    {
        // On main page = resume game
        if (pause_page == "main")
        {
            global.game_paused = false;

            audio_play_sound(
                snd_menu_select,
                1,
                false
            );
        }

        // Inside a submenu = go back
        else
        {
            pause_page = "main";
            pause_selected = 0;

            audio_play_sound(
                snd_menu_select,
                1,
                false
            );
        }
    }

    exit;
}


// --------------------------------------------------
// DO NOTHING ELSE WHEN GAME IS NOT PAUSED
// --------------------------------------------------

if (!global.game_paused)
{
    exit;
}


var old_selection = pause_selected;


// ==================================================
// MAIN PAUSE PAGE
// ==================================================

if (pause_page == "main")
{
    // DOWN
    if (keyboard_check_pressed(vk_down)
    || keyboard_check_pressed(ord("S")))
    {
        if (pause_selected < array_length(pause_items) - 1)
        {
            pause_selected++;
        }
    }


    // UP
    if (keyboard_check_pressed(vk_up)
    || keyboard_check_pressed(ord("W")))
    {
        if (pause_selected > 0)
        {
            pause_selected--;
        }
    }


    // SELECT
    if (keyboard_check_pressed(vk_enter)
    || keyboard_check_pressed(vk_space))
    {
        audio_play_sound(
            snd_menu_select,
            1,
            false
        );

        switch (pause_selected)
        {
            // RESUME
            case 0:
            {
                global.game_paused = false;
                break;
            }


            // SETTINGS
            case 1:
            {
                pause_page = "settings";
                pause_selected = 0;
                break;
            }


            // CONTROLS
            case 2:
            {
                pause_page = "controls";
                pause_selected = 0;
                break;
            }


            // RETURN TO TITLE
            case 3:
            {
                pause_page = "title_confirm";
                pause_selected = 1;
                break;
            }


            // QUIT GAME
            case 4:
            {
                pause_page = "quit_confirm";
                pause_selected = 1;
                break;
            }
        }
    }
}


// ==================================================
// SETTINGS PAGE
// ==================================================

else if (pause_page == "settings")
{
    // DOWN
    if (keyboard_check_pressed(vk_down)
    || keyboard_check_pressed(ord("S")))
    {
        if (pause_selected < array_length(pause_settings_items) - 1)
        {
            pause_selected++;
        }
    }


    // UP
    if (keyboard_check_pressed(vk_up)
    || keyboard_check_pressed(ord("W")))
    {
        if (pause_selected > 0)
        {
            pause_selected--;
        }
    }


    // MUSIC VOLUME
    if (pause_selected == 0)
    {
        if (keyboard_check_pressed(vk_left)
        || keyboard_check_pressed(ord("A")))
        {
            global.music_volume =
                max(0, global.music_volume - 10);
        }

        if (keyboard_check_pressed(vk_right)
        || keyboard_check_pressed(ord("D")))
        {
            global.music_volume =
                min(100, global.music_volume + 10);
        }
    }


    // SFX VOLUME
    if (pause_selected == 1)
    {
        if (keyboard_check_pressed(vk_left)
        || keyboard_check_pressed(ord("A")))
        {
            global.sfx_volume =
                max(0, global.sfx_volume - 10);

            audio_sound_gain(
                snd_menu_move,
                global.sfx_volume / 100,
                0
            );

            audio_sound_gain(
                snd_menu_select,
                global.sfx_volume / 100,
                0
            );

            audio_play_sound(
                snd_menu_move,
                1,
                false
            );
        }


        if (keyboard_check_pressed(vk_right)
        || keyboard_check_pressed(ord("D")))
        {
            global.sfx_volume =
                min(100, global.sfx_volume + 10);

            audio_sound_gain(
                snd_menu_move,
                global.sfx_volume / 100,
                0
            );

            audio_sound_gain(
                snd_menu_select,
                global.sfx_volume / 100,
                0
            );

            audio_play_sound(
                snd_menu_move,
                1,
                false
            );
        }
    }


    // FULLSCREEN
    if (pause_selected == 2)
    {
        if (keyboard_check_pressed(vk_enter)
        || keyboard_check_pressed(vk_space)
        || keyboard_check_pressed(vk_left)
        || keyboard_check_pressed(vk_right))
        {
            window_set_fullscreen(
                !window_get_fullscreen()
            );

            audio_play_sound(
                snd_menu_select,
                1,
                false
            );
        }
    }


    // BACK
    if (pause_selected == 3)
    {
        if (keyboard_check_pressed(vk_enter)
        || keyboard_check_pressed(vk_space))
        {
            pause_page = "main";
            pause_selected = 1;

            audio_play_sound(
                snd_menu_select,
                1,
                false
            );
        }
    }
}


// ==================================================
// CONTROLS PAGE
// ==================================================

else if (pause_page == "controls")
{
    if (keyboard_check_pressed(vk_enter)
    || keyboard_check_pressed(vk_space))
    {
        pause_page = "main";
        pause_selected = 2;

        audio_play_sound(
            snd_menu_select,
            1,
            false
        );
    }
}


// ==================================================
// RETURN TO TITLE CONFIRMATION
// ==================================================

else if (pause_page == "title_confirm")
{
    // LEFT / RIGHT
    if (keyboard_check_pressed(vk_left)
    || keyboard_check_pressed(ord("A"))
    || keyboard_check_pressed(vk_right)
    || keyboard_check_pressed(ord("D")))
    {
        pause_selected = 1 - pause_selected;
    }


    // SELECT
    if (keyboard_check_pressed(vk_enter)
    || keyboard_check_pressed(vk_space))
    {
        audio_play_sound(
            snd_menu_select,
            1,
            false
        );


        // YES
        if (pause_selected == 0)
        {
            global.game_paused = false;

            // Don't carry pause controller back to title screen
            persistent = false;

            room_fade_to(room_titlescreen);
        }

        // NO
        else
        {
            pause_page = "main";
            pause_selected = 3;
        }
    }
}


// ==================================================
// QUIT CONFIRMATION
// ==================================================

else if (pause_page == "quit_confirm")
{
    if (keyboard_check_pressed(vk_left)
    || keyboard_check_pressed(ord("A"))
    || keyboard_check_pressed(vk_right)
    || keyboard_check_pressed(ord("D")))
    {
        pause_selected = 1 - pause_selected;
    }


    if (keyboard_check_pressed(vk_enter)
    || keyboard_check_pressed(vk_space))
    {
        audio_play_sound(
            snd_menu_select,
            1,
            false
        );

        if (pause_selected == 0)
        {
            game_end();
        }
        else
        {
            pause_page = "main";
            pause_selected = 4;
        }
    }
}


// ==================================================
// MOVEMENT SOUND
// ==================================================

if (pause_selected != old_selection)
{
    audio_play_sound(
        snd_menu_move,
        1,
        false
    );
}