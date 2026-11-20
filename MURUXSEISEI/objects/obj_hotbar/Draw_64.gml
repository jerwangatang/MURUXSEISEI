// ==================================================
// HOTBAR - DRAW GUI
// ==================================================


// ==================================================
// ONLY DRAW WHEN OPEN
// ==================================================

if (!visible_hotbar)
{
    exit;
}


// ==================================================
// HIDE DURING SHOP
// ==================================================

if (
    variable_global_exists("shop_menu_open")
    &&
    global.shop_menu_open
)
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
// TOTAL HOTBAR WIDTH
// ==================================================

var _total_width =
    (slot_count * slot_width)
    +
    ((slot_count - 1) * slot_gap);


// ==================================================
// START POSITION
// ==================================================

var _start_x =
    (_gui_w - _total_width) / 2;

var _start_y =
    _gui_h - slot_height - 30;


// ==================================================
// DRAW SLOTS
// ==================================================

for (
    var i = 0;
    i < slot_count;
    i++
)
{
    var _x =
        _start_x
        +
        i * (slot_width + slot_gap);

    var _y =
        _start_y;


    // --------------------------------------------------
    // SLOT BACKGROUND
    // --------------------------------------------------

    draw_set_alpha(0.85);

    draw_set_color(c_black);

    draw_rectangle(
        _x,
        _y,
        _x + slot_width,
        _y + slot_height,
        false
    );


    draw_set_alpha(1);


    // --------------------------------------------------
    // SELECTED SLOT BORDER
    // --------------------------------------------------

    if (i == selected_slot)
    {
        draw_set_color(c_yellow);
    }
    else
    {
        draw_set_color(c_white);
    }


    draw_rectangle(
        _x,
        _y,
        _x + slot_width,
        _y + slot_height,
        true
    );


    // --------------------------------------------------
    // SLOT NUMBER
    // --------------------------------------------------

    draw_set_color(c_gray);

    draw_text(
        _x + 5,
        _y + 4,
        string(i + 1)
    );


    // --------------------------------------------------
    // ITEM
    // --------------------------------------------------

    var _item =
        hotbar[i];


    if (_item.item_name != "")
    {
        draw_set_color(c_white);

        draw_text(
            _x + 10,
            _y + 22,
            _item.item_name
        );


        // ----------------------------------------------
        // AMOUNT
        // ----------------------------------------------

        if (_item.amount > 1)
        {
            draw_set_color(c_yellow);

            draw_text(
                _x + slot_width - 25,
                _y + slot_height - 20,
                "x" + string(_item.amount)
            );
        }
    }
    else
    {
        draw_set_color(c_gray);

        draw_text(
            _x + 20,
            _y + 25,
            "Empty"
        );
    }
}


// ==================================================
// HELP TEXT
// ==================================================

draw_set_color(c_white);

draw_set_halign(fa_center);

draw_text(
    _gui_w / 2,
    _start_y - 25,
    "1-5 / Mouse Wheel: Select    P: Use    E: Close"
);

draw_set_halign(fa_left);


// ==================================================
// RESET DRAW SETTINGS
// ==================================================

draw_set_color(c_white);

draw_set_alpha(1);