// ==================================================
// GLOBAL GAME STATE
// ==================================================

if (!variable_global_exists("game_paused"))
{
    global.game_paused = false;
}

if (!variable_global_exists("dialogue_active"))
{
    global.dialogue_active = false;
}

if (!variable_global_exists("interact_blocked"))
{
    global.interact_blocked = false;
}

// ==================================================
// SAVE MANAGER - CREATE
// ==================================================

// Prevent duplicate persistent save managers
if (instance_number(obj_save_manager) > 1)
{
    instance_destroy();
    exit;
}

persistent = true;


// Current slot:
// 0 = no slot chosen yet
// 1, 2, 3 = actual save files
if (!variable_global_exists("current_save_slot"))
{
    global.current_save_slot = 0;
}


// --------------------------------------------------
// PLAYTIME
// --------------------------------------------------

playtime_seconds = 0;


// --------------------------------------------------
// LOADING
// --------------------------------------------------

load_pending = false;
pending_data = undefined;
pending_room = -1;


// --------------------------------------------------
// NEW GAME
// --------------------------------------------------

new_game_pending = false;