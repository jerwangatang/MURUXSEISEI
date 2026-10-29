// ==================================================
// SAVE FILE SCREEN
// ==================================================

if (menu_page == "saves")
{
    var _gui_w =
        display_get_gui_width();

    var _gui_h =
        display_get_gui_height();


    // --------------------------------------------------
    // DIM TITLE BACKGROUND
    // --------------------------------------------------

    draw_set_color(c_black);
    draw_set_alpha(0.75);

    draw_rectangle(
        0,
        0,
        _gui_w,
        _gui_h,
        false
    );

    draw_set_alpha(1);


    // --------------------------------------------------
    // LAYOUT
    // --------------------------------------------------

    var _box_w =
        min(760, _gui_w - 80);

    var _box_h = 120;

    var _gap = 16;

    var _x =
        (_gui_w - _box_w) / 2;

    var _start_y = 120;


    // --------------------------------------------------
    // TITLE
    // --------------------------------------------------

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_color(c_white);

    draw_text(
        _gui_w / 2,
        70,
        "SELECT FILE"
    );


    // ==================================================
    // DRAW THREE SAVE FILES
    // ==================================================

    for (var i = 0; i < 3; i++)
    {
        var _y =
            _start_y
            + i * (_box_h + _gap);


        var _selected =
            (i == save_selected);


        // ----------------------------------------------
        // BOX BACKGROUND
        // ----------------------------------------------

        draw_set_color(c_black);

        draw_rectangle(
            _x,
            _y,
            _x + _box_w,
            _y + _box_h,
            false
        );


        // ----------------------------------------------
        // BORDER
        // ----------------------------------------------

        if (_selected)
        {
            draw_set_color(c_white);
        }
        else
        {
            draw_set_color(
                make_color_rgb(
                    120,
                    120,
                    120
                )
            );
        }


        draw_rectangle(
            _x,
            _y,
            _x + _box_w,
            _y + _box_h,
            true
        );


        // Second border when selected
        if (_selected)
        {
            draw_rectangle(
                _x + 3,
                _y + 3,
                _x + _box_w - 3,
                _y + _box_h - 3,
                true
            );
        }


        // ----------------------------------------------
        // FILE NUMBER
        // ----------------------------------------------

        draw_set_halign(fa_left);
        draw_set_color(c_white);

        draw_text(
            _x + 20,
            _y + 15,
            "FILE "
            + string(i + 1)
        );


        var _info =
            save_info[i];


        // ==================================================
        // EXISTING SAVE
        // ==================================================

        if (_info.exists)
        {
            // Day
            draw_set_halign(fa_right);

            draw_text(
                _x + _box_w - 20,
                _y + 15,
                string_upper(
                    _info.day_name
                )
            );


            // Playtime
            draw_set_halign(fa_left);

            draw_text(
                _x + 20,
                _y + 48,
                "PLAYTIME: "
                + scr_format_playtime(
                    _info.playtime_seconds
                )
            );


            // Location
            draw_text(
                _x + 20,
                _y + 72,
                "LOCATION: "
                + _info.location_name
            );


            // Sanity
            draw_set_halign(fa_right);

            draw_text(
                _x + _box_w - 20,
                _y + 72,
                "SANITY: "
                + string(
                    round(_info.sanity)
                )
            );
        }

        // ==================================================
        // EMPTY SAVE
        // ==================================================

        else
        {
            draw_set_halign(fa_center);

            draw_set_color(
                make_color_rgb(
                    150,
                    150,
                    150
                )
            );

            draw_text(
                _x + (_box_w / 2),
                _y + 65,
                "EMPTY"
            );
        }


        // ----------------------------------------------
        // SELECTION ARROW
        // ----------------------------------------------

        if (_selected)
        {
            draw_set_halign(fa_right);
            draw_set_color(c_white);

            draw_text(
                _x - 12,
                _y + (_box_h / 2),
                ">"
            );
        }
    }


    // --------------------------------------------------
    // HELP TEXT
    // --------------------------------------------------

    draw_set_halign(fa_center);
    draw_set_color(c_white);

    draw_text(
        _gui_w / 2,
        _start_y
        + 3 * (_box_h + _gap)
        + 10,
        "ENTER: SELECT     ESC: BACK"
    );


    // --------------------------------------------------
    // RESET
    // --------------------------------------------------

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    draw_set_alpha(1);


    exit;
}

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

var _gui_center_x = display_get_gui_width() / 2;
var _gui_center_y = display_get_gui_height() / 2;

menu_x = _gui_center_x;

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
                + string(global.music_volume)
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
        "E - open inventory"
    );

    draw_text(
        menu_x,
        submenu_start_y + submenu_spacing * 2,
        "Enter / Space - select / confirm / interact"
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