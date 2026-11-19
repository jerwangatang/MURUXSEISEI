draw_self();


if (place_meeting(x, y, obj_player))
{
    draw_set_color(c_white);

    draw_text(
        x,
        y - 32,
        "Press Enter to play"
    );

    draw_text(
        x,
        y - 16,
        "Breathe With The Light"
    );
}