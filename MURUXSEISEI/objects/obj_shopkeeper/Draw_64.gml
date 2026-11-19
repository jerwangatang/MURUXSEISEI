// ==================================================
// SHOPKEEPER - DRAW GUI
// ==================================================

if (!shop_open)
{
    exit;
}


// ==================================================
// SHOP WINDOW
// ==================================================

var _x =
    display_get_gui_width() / 2
    - 150;

var _y =
    display_get_gui_height() / 2
    - 120;

var _w = 300;
var _h = 240;


// --------------------------------------------------
// BACKGROUND
// --------------------------------------------------

draw_set_color(c_black);

draw_set_alpha(0.8);

draw_rectangle(
    _x,
    _y,
    _x + _w,
    _y + _h,
    false
);

draw_set_alpha(1);


// --------------------------------------------------
// TITLE / COINS
// --------------------------------------------------

draw_set_color(c_white);

draw_text(
    _x + 10,
    _y + 10,
    "SHOP - Coins: "
    + string(global.coins)
);


// ==================================================
// ITEMS
// ==================================================

for (
    var i = 0;
    i < array_length(shop_items);
    i++
)
{
    var _item =
        shop_items[i];

    var _line_y =
        _y + 50
        + (i * 30);


    if (i == selected_index)
    {
        draw_set_color(
            c_yellow
        );

        draw_text(
            _x + 10,
            _line_y,
            "> "
            + _item.name
            + " - "
            + string(_item.price)
            + " coins"
        );
    }
    else
    {
        draw_set_color(
            c_white
        );

        draw_text(
            _x + 10,
            _line_y,
            "  "
            + _item.name
            + " - "
            + string(_item.price)
            + " coins"
        );
    }
}


// ==================================================
// CONTROLS
// ==================================================

draw_set_color(c_gray);

draw_text(
    _x + 10,
    _y + _h - 25,
    "W/S: select  Enter: buy  Esc: close"
);


// ==================================================
// RESET DRAW SETTINGS
// ==================================================

draw_set_color(c_white);
draw_set_alpha(1);