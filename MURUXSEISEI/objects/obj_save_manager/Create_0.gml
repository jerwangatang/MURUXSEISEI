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

// ==================================================
// AUTOSAVE
// ==================================================

// Autosave requested but not written yet
autosave_pending = false;

// Used only for debug messages
autosave_reason = "";

// Periodic autosave timer
autosave_elapsed = 0;

// Autosave every 60 seconds
autosave_interval = 60;

// ==================================================
// ROOM AUTOSAVE TRACKING
// ==================================================

last_room = room;

// ==================================================
// MERGED SYSTEM SAVE STATE
// ==================================================

if (!variable_global_exists("coins"))
{
    global.coins = 50;
}

if (!variable_global_exists("shop_owned"))
{
    global.shop_owned = [
        false,
        false
    ];
}

if (!variable_global_exists("fridge_opened"))
{
    global.fridge_opened = false;
}

if (!variable_global_exists("fishing_rod_collected"))
{
    global.fishing_rod_collected = false;
}

if (!variable_global_exists("opened_chests"))
{
    global.opened_chests = {};
}