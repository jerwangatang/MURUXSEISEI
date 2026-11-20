// ==================================================
// HOTBAR - STEP
// ==================================================


// ==================================================
// SAFETY CHECKS
// ==================================================

if (!variable_instance_exists(id, "slot_count"))
{
    slot_count = array_length(hotbar);
}

if (!variable_instance_exists(id, "selected_slot"))
{
    selected_slot = 0;
}

if (!variable_instance_exists(id, "visible_hotbar"))
{
    visible_hotbar = false;
}


// ==================================================
// KEEP SELECTED SLOT VALID
// ==================================================

selected_slot =
    clamp(
        selected_slot,
        0,
        slot_count - 1
    );


// ==================================================
// DON'T CONTROL HOTBAR WHEN CLOSED
// ==================================================

if (!visible_hotbar)
{
    exit;
}


// ==================================================
// BLOCK HOTBAR CONTROLS DURING PAUSE
// ==================================================

if (global.game_paused)
{
    exit;
}


// ==================================================
// BLOCK DURING SHOP
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
// NUMBER KEYS SELECT SLOTS
// ==================================================

if (keyboard_check_pressed(ord("1")))
{
    selected_slot = 0;
}

if (
    slot_count >= 2
    &&
    keyboard_check_pressed(ord("2"))
)
{
    selected_slot = 1;
}

if (
    slot_count >= 3
    &&
    keyboard_check_pressed(ord("3"))
)
{
    selected_slot = 2;
}

if (
    slot_count >= 4
    &&
    keyboard_check_pressed(ord("4"))
)
{
    selected_slot = 3;
}

if (
    slot_count >= 5
    &&
    keyboard_check_pressed(ord("5"))
)
{
    selected_slot = 4;
}


// ==================================================
// MOUSE WHEEL
// ==================================================

if (mouse_wheel_down())
{
    selected_slot =
        (selected_slot + 1)
        mod
        slot_count;
}


if (mouse_wheel_up())
{
    selected_slot =
        (
            selected_slot
            - 1
            + slot_count
        )
        mod
        slot_count;
}