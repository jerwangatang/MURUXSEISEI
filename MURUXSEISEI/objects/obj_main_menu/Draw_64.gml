// ==================================================
// MAIN MENU - DRAW GUI
// ==================================================

var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

var _gui_center_x = _gui_w / 2;
var _gui_center_y = _gui_h / 2;


// ==================================================
// SAVE FILE SCREEN
// ==================================================

if (menu_page == "saves")
{
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
    // SAVE FILE LAYOUT
    // --------------------------------------------------

    var _box_w = min(760, _gui_w - 80);
    var _box_h = 120;
    var _gap = 16;

    var _x =
        (_gui_w - _box_w) / 2;

    var _start_y = 120;


    // --------------------------------------------------
    // TITLE
    // --------------------------------------------------

    draw_set_font(-1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);

    draw_text(
        _gui_center_x,
        70,
        "select file"
    );


    // ==================================================
    // DRAW SAVE FILES
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


        // Extra selected border
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
            "file " + string(i + 1)
        );


        var _info =
            save_info[i];


        // ==================================================
        // EXISTING SAVE FILE
        // ==================================================

        if (_info.exists)
        {
            // Day
            draw_set_halign(fa_right);

            draw_text(
                _x + _box_w - 20,
                _y + 15,
                string_lower(
                    _info.day_name
                )
            );


            // Playtime
            draw_set_halign(fa_left);

            draw_text(
                _x + 20,
                _y + 48,
                "playtime: "
                + scr_format_playtime(
                    _info.playtime_seconds
                )
            );


            // Location
            draw_text(
                _x + 20,
                _y + 76,
                "location: "
                + string_lower(
                    _info.location_name
                )
            );


            // Sanity
            draw_set_halign(fa_right);

            draw_text(
                _x + _box_w - 20,
                _y + 76,
                "sanity: "
                + string(
                    round(_info.sanity)
                )
            );
        }


        // ==================================================
        // EMPTY SAVE FILE
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
                "empty"
            );
        }


        // ----------------------------------------------
        // SELECTOR
        // ----------------------------------------------

        if (_selected)
        {
            draw_set_halign(fa_right);
            draw_set_color(c_white);

            draw_text(
                _x - 15,
                _y + (_box_h / 2),
                ">"
            );
        }
    }


    // --------------------------------------------------
    // CONTROLS
    // --------------------------------------------------

    draw_set_halign(fa_center);
    draw_set_color(c_white);

    draw_text(
        _gui_center_x,
        _start_y
        + 3 * (_box_h + _gap)
        + 10,
        "Enter / Space - select     Delete - delete     Escape - back"
    );


    // ==================================================
    // DELETE CONFIRMATION POPUP
    // ==================================================

    if (delete_confirm)
    {
        // ----------------------------------------------
        // DARK OVERLAY
        // ----------------------------------------------

        draw_set_alpha(0.65);
        draw_set_color(c_black);

        draw_rectangle(
            0,
            0,
            _gui_w,
            _gui_h,
            false
        );

        draw_set_alpha(1);


        // ----------------------------------------------
        // POPUP SIZE
        // ----------------------------------------------

        var _confirm_w = 430;
        var _confirm_h = 170;

        var _confirm_x =
            (_gui_w - _confirm_w) / 2;

        var _confirm_y =
            (_gui_h - _confirm_h) / 2;


        // ----------------------------------------------
        // POPUP BACKGROUND
        // ----------------------------------------------

        draw_set_color(c_black);

        draw_rectangle(
            _confirm_x,
            _confirm_y,
            _confirm_x + _confirm_w,
            _confirm_y + _confirm_h,
            false
        );


        // ----------------------------------------------
        // POPUP BORDER
        // ----------------------------------------------

        draw_set_color(c_white);

        draw_rectangle(
            _confirm_x,
            _confirm_y,
            _confirm_x + _confirm_w,
            _confirm_y + _confirm_h,
            true
        );


        // ----------------------------------------------
        // MESSAGE
        // ----------------------------------------------

        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(c_white);

        draw_text(
            _gui_center_x,
            _confirm_y + 45,
            "delete file "
            + string(delete_slot)
            + "?"
        );

        draw_text(
            _gui_center_x,
            _confirm_y + 75,
            "this cannot be undone."
        );


        // ----------------------------------------------
        // YES / NO
        // ----------------------------------------------

        if (delete_selected == 0)
        {
            draw_text(
                _gui_center_x - 70,
                _confirm_y + 125,
                "> yes <"
            );

            draw_text(
                _gui_center_x + 70,
                _confirm_y + 125,
                "no"
            );
        }
        else
        {
            draw_text(
                _gui_center_x - 70,
                _confirm_y + 125,
                "yes"
            );

            draw_text(
                _gui_center_x + 70,
                _confirm_y + 125,
                "> no <"
            );
        }
    }


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
// NORMAL TITLE MENU DRAW SETTINGS
// ==================================================

draw_set_font(-1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_black);

menu_x = _gui_center_x;


// --------------------------------------------------
// SUBMENU LAYOUT
// --------------------------------------------------

var submenu_title_y = 460;
var submenu_start_y = 500;
var submenu_spacing = 40;
var submenu_back_y = 720;

var quit_question_y = 500;
var quit_options_y = 570;


// ==================================================
// MAIN MENU
// ==================================================

if (menu_page == "main")
{
    for (
        var i = 0;
        i < array_length(main_items);
        i++
    )
    {
        var yy =
            menu_y
            + (i * menu_spacing);


        // ------------------------------
        // SELECTED
        // ------------------------------

        if (i == menu_selected)
        {
            draw_text(
                menu_x,
                yy,
                ">  "
                + main_items[i]
                + "  <"
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
    // --------------------------------------------------
    // TITLE
    // --------------------------------------------------

    draw_text(
        menu_x,
        submenu_title_y,
        "settings"
    );


    // --------------------------------------------------
    // OPTIONS
    // --------------------------------------------------

    for (
        var i = 0;
        i < array_length(settings_items);
        i++
    )
    {
        var yy =
            submenu_start_y
            + (i * menu_spacing);

        var text = "";


        // ------------------------------
        // MUSIC VOLUME
        // ------------------------------

        if (i == 0)
        {
            text =
                "music volume   < "
                + string(
                    global.music_volume
                )
                + "% >";
        }


        // ------------------------------
        // SFX VOLUME
        // ------------------------------

        else if (i == 1)
        {
            text =
                "sfx volume   < "
                + string(
                    sfx_volume
                )
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
        // SELECTED
        // ------------------------------

        if (i == menu_selected)
        {
            draw_text(
                menu_x,
                yy,
                ">  "
                + text
                + "  <"
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
                text
            );
        }
    }
}


// ==================================================
// controls
// ==================================================

else if (menu_page == "controls")
{
    // --------------------------------------------------
    // TITLE
    // --------------------------------------------------

    draw_text(
        menu_x,
        submenu_title_y,
        "controls"
    );


    // --------------------------------------------------
    // CONTROLS
    // --------------------------------------------------

    draw_text(
        menu_x,
        submenu_start_y,
        "WASD - move"
    );

    draw_text(
        menu_x,
        submenu_start_y
        + submenu_spacing,
        "E - open inventory"
    );

    draw_text(
        menu_x,
        submenu_start_y
        + submenu_spacing * 2,
        "P - consume items"
    );

    draw_text(
        menu_x,
        submenu_start_y
        + submenu_spacing * 3,
        "Enter / Space - select / confirm / interact"
    );

    draw_text(
        menu_x,
        submenu_start_y
        + submenu_spacing * 4,
        "Escape - back / pause"
    );


    // --------------------------------------------------
    // BACK
    // --------------------------------------------------

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
    // --------------------------------------------------
    // TITLE
    // --------------------------------------------------

    draw_text(
        menu_x,
        submenu_title_y,
        "credits"
    );


    // --------------------------------------------------
    // GAME TITLE
    // --------------------------------------------------

    draw_text(
        menu_x,
        submenu_start_y,
        "muru x seisei"
    );


    // --------------------------------------------------
    // CREATORS
    // --------------------------------------------------

    draw_text(
        menu_x,
        submenu_start_y
        + submenu_spacing,
        "created by Sean & Jerry"
    );


    // --------------------------------------------------
    // BACK
    // --------------------------------------------------

    draw_text(
        menu_x,
        submenu_back_y,
        "> back <"
    );
}


// ==================================================
// QUIT CONFIRMATION
// ==================================================

else if (menu_page == "quit")
{
    // --------------------------------------------------
    // QUESTION
    // --------------------------------------------------

    draw_text(
        menu_x,
        quit_question_y,
        "quit the game?"
    );


    // --------------------------------------------------
    // YES SELECTED
    // --------------------------------------------------

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


    // --------------------------------------------------
    // NO SELECTED
    // --------------------------------------------------

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
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);