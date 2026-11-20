draw_set_color(c_black);
draw_set_halign(fa_center);

draw_text(
    display_get_gui_width()/2,
    display_get_gui_height()/2,
    "You should've gotten all the Dreamscape objects."
);

draw_text(
    display_get_gui_width()/2,
    display_get_gui_height()/2 + 60,
    "Press Enter to return to the title screen"
);

draw_set_halign(fa_left);