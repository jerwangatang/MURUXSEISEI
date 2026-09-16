// ==================================================
// DIALOGUE - DRAW GUI
// ==================================================

if (array_length(lines) == 0)
{
    exit;
}


var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

var _line = lines[line_index];


// --------------------------------------------------
// DIALOGUE BOX POSITION
// --------------------------------------------------

var _box_x = 80;
var _box_y = _gui_h - 210;

var _box_w = _gui_w - 160;
var _box_h = 150;


// --------------------------------------------------
// BACKGROUND
// --------------------------------------------------

draw_set_colour(c_black);
draw_set_alpha(0.85);

draw_rectangle(
    _box_x,
    _box_y,
    _box_x + _box_w,
    _box_y + _box_h,
    false
);

draw_set_alpha(1);


// --------------------------------------------------
// TEXT SETTINGS
// --------------------------------------------------

draw_set_colour(c_white);

draw_set_halign(fa_left);
draw_set_valign(fa_top);


// --------------------------------------------------
// SPEAKER NAME
// --------------------------------------------------

draw_text(
    _box_x + 25,
    _box_y + 18,
    _line.speaker
);


// --------------------------------------------------
// DIALOGUE TEXT
// --------------------------------------------------

var _visible_text = string_copy(
    _line.text,
    1,
    floor(char_index)
);

draw_text_ext(
    _box_x + 25,
    _box_y + 55,
    _visible_text,
    28,
    _box_w - 50
);


// --------------------------------------------------
// RESET
// --------------------------------------------------

draw_set_colour(c_white);
draw_set_alpha(1);