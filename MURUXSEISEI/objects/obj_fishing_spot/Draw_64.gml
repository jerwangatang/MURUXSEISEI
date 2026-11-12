if (place_meeting(x, y, obj_player)) {
    var _gui_x = (x - camera_get_view_x(view_camera[0])) * (display_get_gui_width() / camera_get_view_width(view_camera[0]));
    var _gui_y = (y - camera_get_view_y(view_camera[0])) * (display_get_gui_height() / camera_get_view_height(view_camera[0]));
    
    switch (state) {
        case "idle":
            draw_set_color(c_white);
            draw_text(_gui_x, _gui_y - 20, "Press Enter to fish");
            break;
        
        case "no_rod":
            draw_set_color(c_red);
            draw_text(_gui_x, _gui_y - 20, "Error: No fishing rod");
            break;
        
        case "waiting":
            draw_set_color(c_white);
            var _dots = "";
            for (var i = 0; i < dot_count; i++) {
                _dots += ".";
            }
            draw_text(_gui_x, _gui_y - 20, "Waiting" + _dots);
            break;
        
        case "biting":
            draw_set_color(c_yellow);
            draw_text(_gui_x, _gui_y - 20, "NOW! Press Space!");
            break;
        
        case "result":
            if (caught_item != "") {
                draw_set_color(c_green);
                draw_text(_gui_x, _gui_y - 20, "Caught: " + caught_item + "!");
            } else {
                draw_set_color(c_red);
                draw_text(_gui_x, _gui_y - 20, "It got away...");
            }
            break;
    }
}