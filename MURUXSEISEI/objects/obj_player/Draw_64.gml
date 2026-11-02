if (room == room_town1 && show_coords) {
    var _center_x = x - (room_width / 2);
    var _center_y = (room_height / 2) - y;
    
    var _text = "X: " + string(floor(_center_x)) + "   Y: " + string(floor(_center_y));
    var _text_w = string_width(_text);
    
    draw_set_color(c_white);
    draw_text(display_get_gui_width() - _text_w - 10, 10, _text);
}