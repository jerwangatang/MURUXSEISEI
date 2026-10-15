// ==================================================
// SANITY BAR - DRAW GUI
// ==================================================

var _x = 24;
var _y = 24;

var _width = 160;
var _height = 12;

var _percent =
    display_sanity / global.max_sanity;

_percent = clamp(_percent, 0, 1);


// --------------------------------------------------
// LABEL
// --------------------------------------------------

draw_set_color(c_white);
draw_text(
    _x,
    _y - 18,
    "SANITY"
);


// --------------------------------------------------
// BACKGROUND
// --------------------------------------------------

draw_set_color(c_black);

draw_rectangle(
    _x,
    _y,
    _x + _width,
    _y + _height,
    false
);


// --------------------------------------------------
// BAR
// --------------------------------------------------

draw_set_color(c_white);

draw_rectangle(
    _x + 2,
    _y + 2,
    _x + 2 + ((_width - 4) * _percent),
    _y + _height - 2,
    false
);


// --------------------------------------------------
// OUTLINE
// --------------------------------------------------

draw_set_color(c_white);

draw_rectangle(
    _x,
    _y,
    _x + _width,
    _y + _height,
    true
);


// Reset colour
draw_set_color(c_white);