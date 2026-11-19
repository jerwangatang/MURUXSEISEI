// ==================================================
// SHOPKEEPER - STEP
// ==================================================


// ==================================================
// SAFETY INITIALISATION
// ==================================================

if (!variable_global_exists("shop_menu_open"))
{
    global.shop_menu_open = false;
}

if (!variable_global_exists("pause_block_timer"))
{
    global.pause_block_timer = 0;
}


// ==================================================
// PAUSE CHECK
// ==================================================

if (global.game_paused)
{
    can_interact = false;
    exit;
}


// ==================================================
// DIALOGUE CHECK
// ==================================================

if (global.dialogue_active)
{
    can_interact = false;
    exit;
}


// ==================================================
// PLAYER CHECK
// ==================================================

if (!instance_exists(obj_player))
{
    can_interact = false;
    exit;
}


// ==================================================
// SHOP IS OPEN
// ==================================================

if (shop_open)
{
    can_interact = false;


    // --------------------------------------------------
    // S = MOVE DOWN
    // --------------------------------------------------

    if (keyboard_check_pressed(ord("S")))
    {
        selected_index =
            (selected_index + 1)
            mod
            array_length(shop_items);

        audio_play_sound(
            snd_menu_select,
            1,
            false
        );
    }


    // --------------------------------------------------
    // W = MOVE UP
    // --------------------------------------------------

    if (keyboard_check_pressed(ord("W")))
    {
        selected_index =
            (
                selected_index
                - 1
                + array_length(shop_items)
            )
            mod
            array_length(shop_items);

        audio_play_sound(
            snd_menu_select,
            1,
            false
        );
    }


    // --------------------------------------------------
    // ENTER = BUY ITEM
    // --------------------------------------------------

    if (keyboard_check_pressed(vk_enter))
    {
        var _item =
            shop_items[selected_index];


        if (global.coins >= _item.price)
        {
            global.coins -=
                _item.price;


            scr_hotbar_add(
                _item.name,
                1
            );


            audio_play_sound(
                snd_menu_select,
                1,
                false
            );


            show_debug_message(
                "Bought "
                + _item.name
            );
        }
        else
        {
            audio_play_sound(
                snd_fail,
                1,
                false
            );


            show_debug_message(
                "Not enough coins!"
            );
        }
    }


    // --------------------------------------------------
    // ESC = CLOSE SHOP
    // --------------------------------------------------

    if (keyboard_check_pressed(vk_escape))
    {
        shop_open = false;

        global.shop_menu_open = false;


        // Prevent same ESC press
        // from opening pause menu
        global.pause_block_timer = 2;


        audio_play_sound(
            snd_menu_select,
            1,
            false
        );


        exit;
    }


    exit;
}


// ==================================================
// CHECK IF PLAYER CAN INTERACT
// ==================================================

can_interact =
    place_meeting(
        x,
        y,
        obj_player
    );


// ==================================================
// ENTER = OPEN SHOP
// ==================================================

if (
    can_interact
    &&
    keyboard_check_pressed(vk_enter)
)
{
    shop_open = true;

    global.shop_menu_open = true;


    audio_play_sound(
        snd_menu_select,
        1,
        false
    );
}