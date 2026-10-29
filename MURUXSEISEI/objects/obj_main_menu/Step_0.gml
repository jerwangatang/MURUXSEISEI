// ==================================================
// MAIN MENU - STEP EVENT
// ==================================================


// ==================================================
// DISABLE CONTROLS DURING ROOM TRANSITION
// ==================================================

if (instance_exists(obj_fade_transition))
{
    exit;
}


// ==================================================
// SAVE SLOT PAGE
// ==================================================

if (menu_page == "saves")
{
    // --------------------------------------------------
    // UP
    // --------------------------------------------------

    if (
        keyboard_check_pressed(vk_up) ||
        keyboard_check_pressed(ord("W"))
    )
    {
        var _old_save_selection = save_selected;

        save_selected = max(
            0,
            save_selected - 1
        );

        if (save_selected != _old_save_selection)
        {
            audio_play_sound(
                snd_menu_move,
                1,
                false
            );
        }
    }


    // --------------------------------------------------
    // DOWN
    // --------------------------------------------------

    if (
        keyboard_check_pressed(vk_down) ||
        keyboard_check_pressed(ord("S"))
    )
    {
        var _old_save_selection = save_selected;

        save_selected = min(
            2,
            save_selected + 1
        );

        if (save_selected != _old_save_selection)
        {
            audio_play_sound(
                snd_menu_move,
                1,
                false
            );
        }
    }


    // --------------------------------------------------
    // SELECT FILE
    // --------------------------------------------------

    if (
        keyboard_check_pressed(vk_enter) ||
        keyboard_check_pressed(vk_space)
    )
    {
        var _slot = save_selected + 1;


        audio_play_sound(
            snd_menu_select,
            1,
            false
        );


        // Existing save
        if (save_info[save_selected].exists)
        {
            scr_load_game(_slot);
        }

        // Empty slot = start new game
        else
        {
            scr_start_new_game(_slot);
        }
    }


    // --------------------------------------------------
    // BACK
    // --------------------------------------------------

    if (keyboard_check_pressed(vk_escape))
    {
        menu_page = "main";
        menu_selected = 0;

        audio_play_sound(
            snd_menu_select,
            1,
            false
        );
    }


    // Stop the rest of the main menu code from running
    exit;
}


// ==================================================
// STORE OLD MENU SELECTION
// ==================================================

var old_selection = menu_selected;


// ==================================================
// MAIN PAGE
// ==================================================

if (menu_page == "main")
{
    // --------------------------------------------------
    // DOWN
    // --------------------------------------------------

    if (
        keyboard_check_pressed(vk_down) ||
        keyboard_check_pressed(ord("S"))
    )
    {
        if (menu_selected < array_length(main_items) - 1)
        {
            menu_selected++;
        }
    }


    // --------------------------------------------------
    // UP
    // --------------------------------------------------

    if (
        keyboard_check_pressed(vk_up) ||
        keyboard_check_pressed(ord("W"))
    )
    {
        if (menu_selected > 0)
        {
            menu_selected--;
        }
    }


    // --------------------------------------------------
    // SELECT
    // --------------------------------------------------

    if (
        keyboard_check_pressed(vk_enter) ||
        keyboard_check_pressed(vk_space)
    )
    {
        audio_play_sound(
            snd_menu_select,
            1,
            false
        );


        switch (menu_selected)
        {
            // ==================================================
            // PLAY
            // ==================================================

            case 0:
            {
                menu_page = "saves";
                save_selected = 0;

                // Refresh the three files every time
                // the player opens the save screen
                refresh_save_slots();

                break;
            }


            // ==================================================
            // SETTINGS
            // ==================================================

            case 1:
            {
                menu_page = "settings";
                menu_selected = 0;

                break;
            }


            // ==================================================
            // HELP
            // ==================================================

            case 2:
            {
                menu_page = "help";
                menu_selected = 0;

                break;
            }


            // ==================================================
            // CREDITS
            // ==================================================

            case 3:
            {
                menu_page = "credits";
                menu_selected = 0;

                break;
            }


            // ==================================================
            // QUIT
            // ==================================================

            case 4:
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
    // --------------------------------------------------
    // DOWN
    // --------------------------------------------------

    if (
        keyboard_check_pressed(vk_down) ||
        keyboard_check_pressed(ord("S"))
    )
    {
        if (menu_selected < array_length(settings_items) - 1)
        {
            menu_selected++;
        }
    }


    // --------------------------------------------------
    // UP
    // --------------------------------------------------

    if (
        keyboard_check_pressed(vk_up) ||
        keyboard_check_pressed(ord("W"))
    )
    {
        if (menu_selected > 0)
        {
            menu_selected--;
        }
    }


    // ==================================================
    // MUSIC VOLUME
    // ==================================================

    if (menu_selected == 0)
    {
        // --------------------------------------------------
        // LOWER
        // --------------------------------------------------

        if (
            keyboard_check_pressed(vk_left) ||
            keyboard_check_pressed(ord("A"))
        )
        {
            global.music_volume = max(
                0,
                global.music_volume - 10
            );


            audio_sound_gain(
                snd_title_music,
                global.music_volume / 100,
                0
            );
        }


        // --------------------------------------------------
        // RAISE
        // --------------------------------------------------

        if (
            keyboard_check_pressed(vk_right) ||
            keyboard_check_pressed(ord("D"))
        )
        {
            global.music_volume = min(
                100,
                global.music_volume + 10
            );


            audio_sound_gain(
                snd_title_music,
                global.music_volume / 100,
                0
            );
        }
    }


    // ==================================================
    // SFX VOLUME
    // ==================================================

    if (menu_selected == 1)
    {
        // --------------------------------------------------
        // LOWER
        // --------------------------------------------------

        if (
            keyboard_check_pressed(vk_left) ||
            keyboard_check_pressed(ord("A"))
        )
        {
            sfx_volume = max(
                0,
                sfx_volume - 10
            );


            audio_sound_gain(
                snd_menu_move,
                sfx_volume / 100,
                0
            );


            audio_sound_gain(
                snd_menu_select,
                sfx_volume / 100,
                0
            );


            // Preview new volume
            audio_play_sound(
                snd_menu_move,
                1,
                false
            );
        }


        // --------------------------------------------------
        // RAISE
        // --------------------------------------------------

        if (
            keyboard_check_pressed(vk_right) ||
            keyboard_check_pressed(ord("D"))
        )
        {
            sfx_volume = min(
                100,
                sfx_volume + 10
            );


            audio_sound_gain(
                snd_menu_move,
                sfx_volume / 100,
                0
            );


            audio_sound_gain(
                snd_menu_select,
                sfx_volume / 100,
                0
            );


            // Preview new volume
            audio_play_sound(
                snd_menu_move,
                1,
                false
            );
        }
    }


    // ==================================================
    // FULLSCREEN
    // ==================================================

    if (menu_selected == 2)
    {
        if (
            keyboard_check_pressed(vk_enter) ||
            keyboard_check_pressed(vk_space) ||
            keyboard_check_pressed(vk_left) ||
            keyboard_check_pressed(vk_right)
        )
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


    // ==================================================
    // BACK
    // ==================================================

    if (menu_selected == 3)
    {
        if (
            keyboard_check_pressed(vk_enter) ||
            keyboard_check_pressed(vk_space)
        )
        {
            audio_play_sound(
                snd_menu_select,
                1,
                false
            );


            menu_page = "main";

            // Settings is item 1 on the new main menu
            menu_selected = 1;
        }
    }


    // --------------------------------------------------
    // ESC = BACK
    // --------------------------------------------------

    if (keyboard_check_pressed(vk_escape))
    {
        menu_page = "main";
        menu_selected = 1;


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
    if (
        keyboard_check_pressed(vk_escape) ||
        keyboard_check_pressed(vk_enter) ||
        keyboard_check_pressed(vk_space)
    )
    {
        audio_play_sound(
            snd_menu_select,
            1,
            false
        );


        menu_page = "main";

        // Help is item 2
        menu_selected = 2;
    }
}


// ==================================================
// CREDITS PAGE
// ==================================================

else if (menu_page == "credits")
{
    if (
        keyboard_check_pressed(vk_escape) ||
        keyboard_check_pressed(vk_enter) ||
        keyboard_check_pressed(vk_space)
    )
    {
        audio_play_sound(
            snd_menu_select,
            1,
            false
        );


        menu_page = "main";

        // Credits is item 3
        menu_selected = 3;
    }
}


// ==================================================
// QUIT CONFIRMATION
// ==================================================

else if (menu_page == "quit")
{
    // --------------------------------------------------
    // LEFT / RIGHT
    // --------------------------------------------------

    if (
        keyboard_check_pressed(vk_left) ||
        keyboard_check_pressed(ord("A")) ||
        keyboard_check_pressed(vk_right) ||
        keyboard_check_pressed(ord("D"))
    )
    {
        quit_selected =
            1 - quit_selected;


        audio_play_sound(
            snd_menu_move,
            1,
            false
        );
    }


    // --------------------------------------------------
    // SELECT
    // --------------------------------------------------

    if (
        keyboard_check_pressed(vk_enter) ||
        keyboard_check_pressed(vk_space)
    )
    {
        audio_play_sound(
            snd_menu_select,
            1,
            false
        );


        // YES
        if (quit_selected == 0)
        {
            game_end();
        }

        // NO
        else
        {
            menu_page = "main";

            // Quit is item 4
            menu_selected = 4;
        }
    }


    // --------------------------------------------------
    // ESC = CANCEL
    // --------------------------------------------------

    if (keyboard_check_pressed(vk_escape))
    {
        menu_page = "main";
        menu_selected = 4;


        audio_play_sound(
            snd_menu_select,
            1,
            false
        );
    }
}


// ==================================================
// MENU MOVEMENT SOUND
// ==================================================

if (menu_selected != old_selection)
{
    audio_play_sound(
        snd_menu_move,
        1,
        false
    );
}