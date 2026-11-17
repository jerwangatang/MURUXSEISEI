// ==================================================
// DIALOGUE - DRAW GUI
// ==================================================

if (array_length(lines) == 0)
{
    exit;
}


// ==================================================
// GUI SIZE
// ==================================================

var _gui_w =
    display_get_gui_width();

var _gui_h =
    display_get_gui_height();


// ==================================================
// CURRENT LINE
// ==================================================

var _line =
    lines[line_index];


// ==================================================
// DIALOGUE BOX
// ==================================================

var _box_x = 80;

var _box_y =
    _gui_h - 210;

var _box_w =
    _gui_w - 160;

var _box_h =
    150;


// ==================================================
// DRAW BACKGROUND
// ==================================================

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


// ==================================================
// CHOOSE PORTRAIT
// ==================================================

var _portrait = -1;


// --------------------------------------------------
// MURU
// --------------------------------------------------

if (_line.speaker == "Muru")
{
    _portrait =
        spr_muru_portrait;
}


// --------------------------------------------------
// SEISEI
// --------------------------------------------------

else if (_line.speaker == "Seisei")
{
    _portrait =
        spr_seisei_portrait;
}


// --------------------------------------------------
// CRUSH
//
// No portrait for now.
// Later we can use spr_crush_portrait.
// --------------------------------------------------

else if (_line.speaker == "Crush")
{
    _portrait =
        -1;
}


// --------------------------------------------------
// EVERYONE ELSE
// --------------------------------------------------

else
{
    _portrait =
        spr_npc_portrait;
}


// ==================================================
// DEFAULT TEXT POSITION
// ==================================================

var _text_x =
    _box_x + 25;


// ==================================================
// DRAW PORTRAIT
// ==================================================

if (_portrait != -1)
{
    // Original sprite dimensions
    var _sprite_w =
        sprite_get_width(
            _portrait
        );

    var _sprite_h =
        sprite_get_height(
            _portrait
        );


    // Maximum portrait dimensions
    var _max_w = 125;
    var _max_h = 125;


    // Maintain aspect ratio
    var _scale =
        min(
            _max_w / _sprite_w,
            _max_h / _sprite_h
        );


    var _portrait_w =
        _sprite_w
        *
        _scale;

    var _portrait_h =
        _sprite_h
        *
        _scale;


    // ==================================================
    // PORTRAIT POSITION
    // ==================================================

    var _portrait_x =
        _box_x + 15;

    var _portrait_y =
        _box_y
        +
        ((_box_h - _portrait_h) / 2);


    // ==================================================
    // DRAW
    // ==================================================

    draw_set_colour(c_white);
    draw_set_alpha(1);


    draw_sprite_stretched(
        _portrait,
        0,
        _portrait_x,
        _portrait_y,
        _portrait_w,
        _portrait_h
    );


    // Move dialogue text to the right
    _text_x =
        _box_x + 165;
}


// ==================================================
// TEXT SETTINGS
// ==================================================

draw_set_colour(c_white);

draw_set_halign(fa_left);
draw_set_valign(fa_top);


// ==================================================
// SPEAKER NAME
// ==================================================

draw_text(
    _text_x,
    _box_y + 18,
    _line.speaker
);


// ==================================================
// DIALOGUE TEXT
// ==================================================

var _visible_text =
    string_copy(
        _line.text,
        1,
        floor(char_index)
    );


draw_text_ext(
    _text_x,
    _box_y + 55,
    _visible_text,
    28,
    (_box_x + _box_w)
    -
    _text_x
    -
    25
);


// ==================================================
// RESET DRAW SETTINGS
// ==================================================

draw_set_colour(c_white);
draw_set_alpha(1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);