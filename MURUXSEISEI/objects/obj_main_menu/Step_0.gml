// --------------------------------------------------
// MAIN MENU - STEP EVENT
// --------------------------------------------------

var old_selection = menu_selected;


// ==================================================
// MAIN PAGE
// ==================================================

if (menu_page == "main")
{
    // ------------------------------
    // DOWN
    // ------------------------------

    if (keyboard_check_pressed(vk_down)
    || keyboard_check_pressed(ord("S")))
    {
        if (menu_selected < array_length(main_items) - 1)
        {
            menu_selected++;

            // Skip Continue if disabled
            if (menu_selected == 1 && !has_save)
            {
                menu_selected++;
            }
        }
    }


    // ------------------------------
    // UP
    // ------------------------------

    if (keyboard_check_pressed(vk_up)
    || keyboard_check_pressed(ord("W")))
    {
        if (menu_selected > 0)
        {
            menu_selected--;

            // Skip Continue if disabled
            if (menu_selected == 1 && !has_save)
            {
                menu_selected--;
            }
        }
    }


    // ------------------------------
    // SELECT
    // ------------------------------

    if (keyboard_check_pressed(vk_enter)
    || keyboard_check_pressed(vk_space))
    {
        audio_play_sound(snd_menu_select, 1, false);

        switch (menu_selected)
        {
            // NEW GAME
            case 0:
            {
                // Leave unfinished for now
                show_debug_message("New Game");
                break;
            }


            // CONTINUE
            case 1:
            {
                if (has_save)
                {
                    show_debug_message("Continue");
                }

                break;
            }


            // SETTINGS
            case 2:
            {
                menu_page = "settings";
                menu_selected = 0;
                break;
            }


            // HELP
            case 3:
            {
                menu_page = "help";
                menu_selected = 0;
                break;
            }


            // CREDITS
            case 4:
            {
                menu_page = "credits";
                menu_selected = 0;
                break;
            }


            // QUIT
            case 5:
            {
                menu_page = "quit";
                quit_selected = 1;
                break;
            }
        }
    }
}


// ==================================================
// SETTINGS PAGE
// ==================================================

else if (menu_page == "settings")
{
    // DOWN

    if (keyboard_check_pressed(vk_down)
    || keyboard_check_pressed(ord("S")))
    {
        if (menu_selected < array_length(settings_items) - 1)
        {
            menu_selected++;
        }
    }


    // UP

    if (keyboard_check_pressed(vk_up)
    || keyboard_check_pressed(ord("W")))
    {
        if (menu_selected > 0)
        {
            menu_selected--;
        }
    }


    // --------------------------------------------------
    // MUSIC VOLUME
    // --------------------------------------------------

    if (menu_selected == 0)
    {
        if (keyboard_check_pressed(vk_left)
        || keyboard_check_pressed(ord("A")))
        {
            music_volume = max(0, music_volume - 10);
        }

        if (keyboard_check_pressed(vk_right)
        || keyboard_check_pressed(ord("D")))
        {
            music_volume = min(100, music_volume + 10);
        }
    }


    // --------------------------------------------------
    // SFX VOLUME
    // --------------------------------------------------

    if (menu_selected == 1)
    {
        if (keyboard_check_pressed(vk_left)
        || keyboard_check_pressed(ord("A")))
        {
            sfx_volume = max(0, sfx_volume - 10);
        }

        if (keyboard_check_pressed(vk_right)
        || keyboard_check_pressed(ord("D")))
        {
            sfx_volume = min(100, sfx_volume + 10);
        }
    }


    // --------------------------------------------------
    // FULLSCREEN
    // --------------------------------------------------

    if (menu_selected == 2)
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


    // --------------------------------------------------
    // BACK
    // --------------------------------------------------

    if (menu_selected == 3)
    {
        if (keyboard_check_pressed(vk_enter)
        || keyboard_check_pressed(vk_space))
        {
            audio_play_sound(
                snd_menu_select,
                1,
                false
            );

            menu_page = "main";
            menu_selected = 2;
        }
    }


    // ESC also goes back

    if (keyboard_check_pressed(vk_escape))
    {
        menu_page = "main";
        menu_selected = 2;

        audio_play_sound(
            snd_menu_select,
            1,
            false
        );
    }
}


// ==================================================
// HELP PAGE
// ==================================================

else if (menu_page == "help")
{
    if (keyboard_check_pressed(vk_escape)
    || keyboard_check_pressed(vk_enter)
    || keyboard_check_pressed(vk_space))
    {
        audio_play_sound(
            snd_menu_select,
            1,
            false
        );

        menu_page = "main";
        menu_selected = 3;
    }
}


// ==================================================
// CREDITS PAGE
// ==================================================

else if (menu_page == "credits")
{
    if (keyboard_check_pressed(vk_escape)
    || keyboard_check_pressed(vk_enter)
    || keyboard_check_pressed(vk_space))
    {
        audio_play_sound(
            snd_menu_select,
            1,
            false
        );

        menu_page = "main";
        menu_selected = 4;
    }
}


// ==================================================
// QUIT CONFIRMATION
// ==================================================

else if (menu_page == "quit")
{
    // LEFT / RIGHT

    if (keyboard_check_pressed(vk_left)
    || keyboard_check_pressed(ord("A"))
    || keyboard_check_pressed(vk_right)
    || keyboard_check_pressed(ord("D")))
    {
        quit_selected = 1 - quit_selected;

        audio_play_sound(
            snd_menu_move,
            1,
            false
        );
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

        if (quit_selected == 0)
        {
            game_end();
        }
        else
        {
            menu_page = "main";
            menu_selected = 5;
        }
    }


    // ESC = cancel

    if (keyboard_check_pressed(vk_escape))
    {
        menu_page = "main";
        menu_selected = 5;
    }
}


// ==================================================
// MOVEMENT SOUND
// ==================================================

if (menu_selected != old_selection)
{
    audio_play_sound(
        snd_menu_move,
        1,
        false
    );
}