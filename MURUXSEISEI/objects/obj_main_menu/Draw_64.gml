// ==================================================
// MAIN MENU - DRAW GUI
// ==================================================


// --------------------------------------------------
// DRAW SETTINGS
// --------------------------------------------------

draw_set_font(-1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_black);


// --------------------------------------------------
// SUBMENU LAYOUT
// Edit these values to move things around easily
// --------------------------------------------------

var submenu_title_y   = 460;
var submenu_start_y   = 500;
var submenu_spacing   = 40;
var submenu_back_y    = 690;

var quit_question_y   = 500;
var quit_options_y    = 570;


// ==================================================
// MAIN MENU
// ==================================================

if (menu_page == "main")
{
    for (var i = 0; i < array_length(main_items); i++)
    {
        var yy = menu_y + (i * menu_spacing);


        // ------------------------------
        // CONTINUE DISABLED
        // ------------------------------

        if (i == 1 && !has_save)
        {
            draw_set_colour(c_gray);

            draw_text(
                menu_x,
                yy,
                main_items[i]
            );

            draw_set_colour(c_black);
        }


        // ------------------------------
        // SELECTED
        // ------------------------------

        else if (i == menu_selected)
        {
            draw_text(
                menu_x,
                yy,
                ">  " + main_items[i] + "  <"
            );
        }


        // ------------------------------
        // NORMAL
        // ------------------------------

        else
        {
            draw_text(
                menu_x,
                yy,
                main_items[i]
            );
        }
    }
}


// ==================================================
// SETTINGS
// ==================================================

else if (menu_page == "settings")
{
    // Title
    draw_text(
        menu_x,
        submenu_title_y,
        "settings"
    );


    // Settings options
    for (var i = 0; i < array_length(settings_items); i++)
    {
        var yy = submenu_start_y + (i * menu_spacing);

        var text = "";


        // ------------------------------
        // MUSIC VOLUME
        // ------------------------------

        if (i == 0)
        {
            text =
                "music volume   < "
                + string(music_volume)
                + "% >";
        }


        // ------------------------------
        // SFX VOLUME
        // ------------------------------

        else if (i == 1)
        {
            text =
                "sfx volume   < "
                + string(sfx_volume)
                + "% >";
        }


        // ------------------------------
        // FULLSCREEN
        // ------------------------------

        else if (i == 2)
        {
            var fullscreen_text;

            if (window_get_fullscreen())
            {
                fullscreen_text = "on";
            }
            else
            {
                fullscreen_text = "off";
            }


            text =
                "fullscreen   < "
                + fullscreen_text
                + " >";
        }


        // ------------------------------
        // BACK
        // ------------------------------

        else
        {
            text = "back";
        }


        // ------------------------------
        // DRAW OPTION
        // ------------------------------

        if (i == menu_selected)
        {
            draw_text(
                menu_x,
                yy,
                ">  " + text + "  <"
            );
        }
        else
        {
            draw_text(
                menu_x,
                yy,
                text
            );
        }
    }
}


// ==================================================
// HELP
// ==================================================

else if (menu_page == "help")
{
    // Title
    draw_text(
        menu_x,
        submenu_title_y,
        "help"
    );


    // Controls
    draw_text(
        menu_x,
        submenu_start_y,
        "WASD / arrow keys - move"
    );

    draw_text(
        menu_x,
        submenu_start_y + submenu_spacing,
        "E - interact with objects / NPCs"
    );

    draw_text(
        menu_x,
        submenu_start_y + submenu_spacing * 2,
        "Enter / Space - select / confirm"
    );

    draw_text(
        menu_x,
        submenu_start_y + submenu_spacing * 3,
        "Escape - back / pause"
    );


    // Back
    draw_text(
        menu_x,
        submenu_back_y,
        "> back <"
    );
}


// ==================================================
// CREDITS
// ==================================================

else if (menu_page == "credits")
{
    // Title
    draw_text(
        menu_x,
        submenu_title_y,
        "credits"
    );


    // Game title
    draw_text(
        menu_x,
        submenu_start_y,
        "muru x seisei"
    );


    // Creators
    draw_text(
        menu_x,
        submenu_start_y + submenu_spacing,
        "created by Sean & Jerry"
    );


    // Back
    draw_text(
        menu_x,
        submenu_back_y,
        "> back <"
    );
}


// ==================================================
// QUIT
// ==================================================

else if (menu_page == "quit")
{
    // Question
    draw_text(
        menu_x,
        quit_question_y,
        "quit the game?"
    );


    // ------------------------------
    // YES SELECTED
    // ------------------------------

    if (quit_selected == 0)
    {
        draw_text(
            menu_x - 80,
            quit_options_y,
            "> yes <"
        );

        draw_text(
            menu_x + 80,
            quit_options_y,
            "no"
        );
    }


    // ------------------------------
    // NO SELECTED
    // ------------------------------

    else
    {
        draw_text(
            menu_x - 80,
            quit_options_y,
            "yes"
        );

        draw_text(
            menu_x + 80,
            quit_options_y,
            "> no <"
        );
    }
}


// ==================================================
// RESET DRAW SETTINGS
// ==================================================

draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);