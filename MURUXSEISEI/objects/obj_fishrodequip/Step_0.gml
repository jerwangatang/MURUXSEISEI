// ==================================================
// FISHING ROD PICKUP - STEP
// ==================================================


// ==================================================
// INITIALISE FLAG
// ==================================================

if (!variable_global_exists("fishing_rod_collected"))
{
    global.fishing_rod_collected = false;
}


// ==================================================
// CHECK WHETHER HOTBAR ALREADY HAS A FISHING ROD
//
// This also fixes old saves where the hotbar contains
// a rod but fishing_rod_collected is still false.
//
// It also forces the amount back to exactly 1.
// ==================================================

if (instance_exists(obj_hotbar))
{
    var _found_rod = false;

    for (var i = 0; i < obj_hotbar.slot_count; i++)
    {
        if (
            obj_hotbar.hotbar[i].item_name == "Fishing Rod"
            &&
            obj_hotbar.hotbar[i].amount > 0
        )
        {
            if (!_found_rod)
            {
                // Keep ONE fishing rod only
                obj_hotbar.hotbar[i].amount = 1;

                _found_rod = true;
            }
            else
            {
                // Remove any accidental duplicate slot
                obj_hotbar.hotbar[i].item_name = "";
                obj_hotbar.hotbar[i].amount = 0;
            }
        }
    }


    if (_found_rod)
    {
        global.fishing_rod_collected = true;

        instance_destroy();

        exit;
    }
}


// ==================================================
// ALREADY COLLECTED
// ==================================================

if (global.fishing_rod_collected)
{
    instance_destroy();

    exit;
}


// ==================================================
// BLOCK INPUT
// ==================================================

if (global.game_paused)
{
    exit;
}

if (global.dialogue_active)
{
    exit;
}


// ==================================================
// PLAYER CHECK
// ==================================================

if (!instance_exists(obj_player))
{
    exit;
}


// ==================================================
// PICK UP ROD
// ==================================================

if (place_meeting(x, y, obj_player))
{
    if (keyboard_check_pressed(vk_enter))
    {
        var _added =
            scr_hotbar_add(
                "Fishing Rod",
                1
            );


        if (_added)
        {
            // Make absolutely sure amount = 1
            for (var i = 0; i < obj_hotbar.slot_count; i++)
            {
                if (
                    obj_hotbar.hotbar[i].item_name
                    ==
                    "Fishing Rod"
                )
                {
                    obj_hotbar.hotbar[i].amount = 1;
                }
            }


            global.fishing_rod_collected = true;


            scr_request_autosave(
                "fishing rod collected"
            );


            instance_destroy();
        }
    }
}