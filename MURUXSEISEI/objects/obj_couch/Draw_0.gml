draw_self();

if (place_meeting(x, y, obj_player)) {
    draw_set_color(c_white);
    draw_text(x, y - 20, "Press Enter to sleep");
}