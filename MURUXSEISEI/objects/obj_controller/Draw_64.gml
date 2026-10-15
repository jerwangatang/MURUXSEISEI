if (room == room_titlescreen)
{
    exit;
}

draw_set_font(-1);
draw_set_color(c_white);
draw_text(20, 20, "Score: " + string(score));