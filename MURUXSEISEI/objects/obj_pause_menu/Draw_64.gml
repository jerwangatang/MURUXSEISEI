// ==================================================
// PAUSE MENU - DRAW GUI
// ==================================================

if (!global.game_paused)
{
    exit;
}


// --------------------------------------------------
// DARKEN GAMEPLAY
// --------------------------------------------------

draw_set_alpha(0.65);
draw_set_colour(c_black);

draw_rectangle(
    0,
    0,
    display_get_gui_width(),
    display_get_gui_height(),
    false
);

draw_set_alpha(1);


// --------------------------------------------------
// DRAW SETTINGS
// --------------------------------------------------

draw_set_font(-1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_white);


var _center_y = display_get_gui_height() / 2;

var title_y = _center_y - 170;
var start_y = _center_y - 90;
var spacing = 50;


// ==================================================
// MAIN PAUSE MENU
// ==================================================

if (pause_page == "main")
{
    draw_text(
        pause_x,
        title_y,
        "paused"
    );


    for (var i = 0; i < array_length(pause_items); i++)
    {
        var yy = start_y + (i * spacing);

        if (i == pause_selected)
        {
            draw_text(
                pause_x,
                yy,
                ">  " + pause_items[i] + "  <"
            );
        }
        else
        {
            draw_text(
                pause_x,
                yy,
                pause_items[i]
            );
        }
    }
}


// ==================================================
// SETTINGS
// ==================================================

else if (pause_page == "settings")
{
    draw_text(
        pause_x,
        title_y,
        "settings"
    );


    for (
        var i = 0;
        i < array_length(pause_settings_items);
        i++
    )
    {
        var yy = start_y + (i * spacing);
        var text = "";


        if (i == 0)
        {
            text =
                "music volume   < "
                + string(global.music_volume)
                + "% >";
        }


        else if (i == 1)
        {
            text =
                "sfx volume   < "
                + string(global.sfx_volume)
                + "% >";
        }


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


        else
        {
            text = "back";
        }


        if (i == pause_selected)
        {
            draw_text(
                pause_x,
                yy,
                ">  " + text + "  <"
            );
        }
        else
        {
            draw_text(
                pause_x,
                yy,
                text
            );
        }
    }
}


// ==================================================
// CONTROLS
// ==================================================

else if (pause_page == "controls")
{
    draw_text(
        pause_x,
        title_y,
        "controls"
    );

    draw_text(
        pause_x,
        start_y,
        "WASD / arrow keys - move"
    );

    draw_text(
        pause_x,
        start_y + 40,
        "E - interact with objects / NPCs"
    );

    draw_text(
        pause_x,
        start_y + 80,
        "Enter / Space - select / confirm"
    );

    draw_text(
        pause_x,
        start_y + 120,
        "Escape - pause / back"
    );

    draw_text(
        pause_x,
        start_y + 220,
        "> back <"
    );
}


// ==================================================
// RETURN TO TITLE
// ==================================================

else if (pause_page == "title_confirm")
{
    draw_text(
        pause_x,
        _center_y - 50,
        "return to title?"
    );


    if (pause_selected == 0)
    {
        draw_text(
            pause_x - 80,
            _center_y + 30,
            "> yes <"
        );

        draw_text(
            pause_x + 80,
            _center_y + 30,
            "no"
        );
    }
    else
    {
        draw_text(
            pause_x - 80,
            _center_y + 30,
            "yes"
        );

        draw_text(
            pause_x + 80,
            _center_y + 30,
            "> no <"
        );
    }
}


// ==================================================
// QUIT GAME
// ==================================================

else if (pause_page == "quit_confirm")
{
    draw_text(
        pause_x,
        _center_y - 50,
        "quit the game?"
    );


    if (pause_selected == 0)
    {
        draw_text(
            pause_x - 80,
            _center_y + 30,
            "> yes <"
        );

        draw_text(
            pause_x + 80,
            _center_y + 30,
            "no"
        );
    }
    else
    {
        draw_text(
            pause_x - 80,
            _center_y + 30,
            "yes"
        );

        draw_text(
            pause_x + 80,
            _center_y + 30,
            "> no <"
        );
    }
}


// --------------------------------------------------
// RESET DRAW SETTINGS
// --------------------------------------------------

draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);