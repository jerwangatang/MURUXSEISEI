if (show_incomplete_message) {
    var _gui_x = (x - camera_get_view_x(view_camera[0])) * (display_get_gui_width() / camera_get_view_width(view_camera[0]));
    var _gui_y = (y - camera_get_view_y(view_camera[0])) * (display_get_gui_height() / camera_get_view_height(view_camera[0]));
    
    draw_set_color(c_yellow);
    draw_text(_gui_x, _gui_y - 20, "I still have things to do...");
}