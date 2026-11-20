draw_set_color(c_white);
draw_set_halign(fa_center);

var _line_height = 40;

for (var i = 0; i < array_length(credits_text); i++) {
    var _y = scroll_y + (i * _line_height);
    
    // Only draw if roughly on screen (optimization, optional)
    if (_y > -50 && _y < display_get_gui_height() + 50) {
        draw_text(display_get_gui_width()/2, _y, credits_text[i]);
    }
}

draw_set_halign(fa_left);