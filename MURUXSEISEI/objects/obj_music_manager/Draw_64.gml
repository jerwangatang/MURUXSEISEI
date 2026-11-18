if (show_track_name) {
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(display_get_gui_width()/2, 50, "Now Playing: " + track_names[current_track_index]);
    draw_set_halign(fa_left);
}

if (track_name_timer > 0) {
    track_name_timer--;
} else {
    show_track_name = false;
}