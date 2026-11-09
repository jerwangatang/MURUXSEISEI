// ==================================================
// OBJ_MAIN_MENU - STEP EVENT
// ==================================================


// ==================================================
// DISABLE INPUT DURING FADE TRANSITION
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
    // ==================================================
    // INPUT LOCK
    //
    // Prevents the Enter/Space press used on "Play"
    // from immediately selecting File 1.
    // ==================================================

    if (save_input_locked)
    {
        if (
            !keyboard_check(vk_enter) &&
            !keyboard_check(vk_space)
        )
        {
            save_input_locked = false;
        }

        exit;
    }


    // ==================================================
    // DELETE CONFIRMATION
    // ==================================================

    if (delete_confirm)
    {
        // --------------------------------------------------
        // LEFT = YES
        // --------------------------------------------------

        if (
            keyboard_check_pressed(vk_left) ||
            keyboard_check_pressed(ord("A"))
        )
        {
            if (delete_selected != 0)
            {
                delete_selected = 0;

                audio_play_sound(
                    snd_menu_move,
                    1,
                    false
                );
            }
        }


        // --------------------------------------------------
        // RIGHT = NO
        // --------------------------------------------------

        if (
            keyboard_check_pressed(vk_right) ||
            keyboard_check_pressed(ord("D"))
        )
        {
            if (delete_selected != 1)
            {
                delete_selected = 1;

                audio_play_sound(
                    snd_menu_move,
                    1,
                    false
                );
            }
        }


        // --------------------------------------------------
        // CONFIRM YES / NO
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


            // YES - DELETE SAVE
            if (delete_selected == 0)
            {
                scr_delete_save(
                    delete_slot
                );

                refresh_save_slots();
            }


            // Close popup
            delete_confirm = false;
            delete_slot = 0;
            delete_selected = 1;

            exit;
        }


        // --------------------------------------------------
        // ESCAPE = CANCEL DELETE
        // --------------------------------------------------

        if (keyboard_check_pressed(vk_escape))
        {
            delete_confirm = false;
            delete_slot = 0;
            delete_selected = 1;

            audio_play_sound(
                snd_menu_select,
                1,
                false
            );

            exit;
        }


        // Do not process save-slot controls
        // while confirmation is open.
        exit;
    }


    // ==================================================
    // SAVE SLOT MOVEMENT
    // ==================================================


    // --------------------------------------------------
    // UP
    // --------------------------------------------------

    if (
        keyboard_check_pressed(vk_up) ||
        keyboard_check_pressed(ord("W"))
    )
    {
        var _old_save =
            save_selected;

        save_selected =
            max(
                0,
                save_selected - 1
            );


        if (save_selected != _old_save)
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
        var _old_save =
            save_selected;

        save_selected =
            min(
                2,
                save_selected + 1
            );


        if (save_selected != _old_save)
        {
            audio_play_sound(
                snd_menu_move,
                1,
                false
            );
        }
    }


    // ==================================================
    // DELETE SAVE FILE
    // ==================================================

    if (
        keyboard_check_pressed(vk_delete) ||
        keyboard_check_pressed(vk_backspace)
    )
    {
        // Only allow deletion if the slot contains a save
        if (save_info[save_selected].exists)
        {
            delete_confirm = true;

            delete_slot =
                save_selected + 1;

            // Default = NO
            delete_selected = 1;

            audio_play_sound(
                snd_menu_select,
                1,
                false
            );
        }

        exit;
    }


    // ==================================================
    // SELECT SAVE FILE
    // ==================================================

    if (
        keyboard_check_pressed(vk_enter) ||
        keyboard_check_pressed(vk_space)
    )
    {
        var _slot =
            save_selected + 1;


        audio_play_sound(
            snd_menu_select,
            1,
            false
        );


        // --------------------------------------------------
        // EXISTING SAVE
        // --------------------------------------------------

        if (save_info[save_selected].exists)
        {
            scr_load_game(
                _slot
            );
        }


        // --------------------------------------------------
        // EMPTY SAVE = START NEW GAME
        // --------------------------------------------------

        else
        {
            scr_start_new_game(
                _slot
            );
        }


        // VERY IMPORTANT:
        // Do not allow any more menu code to execute.
        exit;
    }


    // ==================================================
    // BACK TO TITLE MENU
    // ==================================================

    if (keyboard_check_pressed(vk_escape))
    {
        menu_page = "main";
        menu_selected = 0;

        audio_play_sound(
            snd_menu_select,
            1,
            false
        );

        exit;
    }


    // VERY IMPORTANT:
    // Prevent normal title-menu controls from
    // running while on the save screen.
    exit;
}


// ==================================================
// STORE OLD SELECTION
// ==================================================

var old_selection =
    menu_selected;


// ==================================================
// MAIN TITLE MENU
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
        if (
            menu_selected
            < array_length(main_items) - 1
        )
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
    // SELECT MENU OPTION
    // ==================================================

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

                refresh_save_slots();


                // Prevent the current Enter/Space press
                // from selecting File 1.
                save_input_locked = true;


                // IMPORTANT:
                // Stop the Step Event immediately.
                exit;
            }


            // ==================================================
            // SETTINGS
            // ==================================================

            case 1:
            {
                menu_page = "settings";

                menu_selected = 0;

                exit;
            }


            // ==================================================
            // HELP
            // ==================================================

            case 2:
            {
                menu_page = "controls";

                menu_selected = 0;

                exit;
            }


            // ==================================================
            // CREDITS
            // ==================================================

            case 3:
            {
                menu_page = "credits";

                menu_selected = 0;

                exit;
            }


            // ==================================================
            // QUIT
            // ==================================================

            case 4:
            {
                menu_page = "quit";

                // Default = NO
                quit_selected = 1;

                exit;
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
        if (
            menu_selected
            < array_length(settings_items) - 1
        )
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
        // Lower
        if (
            keyboard_check_pressed(vk_left) ||
            keyboard_check_pressed(ord("A"))
        )
        {
            global.music_volume =
                max(
                    0,
                    global.music_volume - 10
                );


            audio_sound_gain(
                snd_title_music,
                global.music_volume / 100,
                0
            );
        }


        // Raise
        if (
            keyboard_check_pressed(vk_right) ||
            keyboard_check_pressed(ord("D"))
        )
        {
            global.music_volume =
                min(
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
        // Lower
        if (
            keyboard_check_pressed(vk_left) ||
            keyboard_check_pressed(ord("A"))
        )
        {
            sfx_volume =
                max(
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


            audio_play_sound(
                snd_menu_move,
                1,
                false
            );
        }


        // Raise
        if (
            keyboard_check_pressed(vk_right) ||
            keyboard_check_pressed(ord("D"))
        )
        {
            sfx_volume =
                min(
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
    // BACK OPTION
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

            // Return selection to Settings
            menu_selected = 1;

            exit;
        }
    }


    // --------------------------------------------------
    // ESCAPE = BACK
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

        exit;
    }
}


// ==================================================
// Control PAGE
// ==================================================

else if (menu_page == "controls")
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

        // Return selection to Help
        menu_selected = 2;

        exit;
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

        // Return selection to Credits
        menu_selected = 3;

        exit;
    }
}


// ==================================================
// QUIT CONFIRMATION
// ==================================================

else if (menu_page == "quit")
{
    // --------------------------------------------------
    // LEFT = YES
    // --------------------------------------------------

    if (
        keyboard_check_pressed(vk_left) ||
        keyboard_check_pressed(ord("A"))
    )
    {
        if (quit_selected != 0)
        {
            quit_selected = 0;

            audio_play_sound(
                snd_menu_move,
                1,
                false
            );
        }
    }


    // --------------------------------------------------
    // RIGHT = NO
    // --------------------------------------------------

    if (
        keyboard_check_pressed(vk_right) ||
        keyboard_check_pressed(ord("D"))
    )
    {
        if (quit_selected != 1)
        {
            quit_selected = 1;

            audio_play_sound(
                snd_menu_move,
                1,
                false
            );
        }
    }


    // --------------------------------------------------
    // CONFIRM
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

            menu_selected = 4;
        }

        exit;
    }


    // --------------------------------------------------
    // ESCAPE = CANCEL
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

        exit;
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