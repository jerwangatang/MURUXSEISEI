// ==================================================
// PAUSE MENU - CREATE
// ==================================================

// Prevent duplicates
if (instance_number(obj_pause_menu) > 1)
{
    instance_destroy();
    exit;
}

persistent = true;


// --------------------------------------------------
// GLOBAL STATE
// --------------------------------------------------

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


// --------------------------------------------------
// PAUSE MENU STATE
// --------------------------------------------------

pause_page = "main";
pause_selected = 0;

pause_items = [
    "resume",
    "settings",
    "controls",
    "return to title",
    "quit game"
];

pause_settings_items = [
    "music volume",
    "sfx volume",
    "fullscreen",
    "back"
];

// ==================================================
// GLOBAL GAME STATES
// ==================================================

global.game_paused = false;

if (!variable_global_exists("dialogue_active"))
{
    global.dialogue_active = false;
}

if (!variable_global_exists("interact_blocked"))
{
    global.interact_blocked = false;
}

// ==================================================
// PAUSE MENU - CREATE
// ==================================================

persistent = true;

// Game starts unpaused
global.game_paused = false;

// Current pause page
pause_page = "main";

// Selected option
pause_selected = 0;


// --------------------------------------------------
// MAIN PAUSE OPTIONS
// --------------------------------------------------

pause_items = [
    "resume",
    "settings",
    "controls",
    "return to title",
    "quit game"
];


// --------------------------------------------------
// SETTINGS OPTIONS
// --------------------------------------------------

pause_settings_items = [
    "music volume",
    "sfx volume",
    "fullscreen",
    "back"
];


// --------------------------------------------------
// SHARED SETTINGS
// --------------------------------------------------

// Only create these globals if they don't already exist

if (!variable_global_exists("music_volume"))
{
    global.music_volume = 100;
}

if (!variable_global_exists("sfx_volume"))
{
    global.sfx_volume = 100;
}

if (!variable_global_exists("dialogue_active"))
{
    global.dialogue_active = false;
}

// --------------------------------------------------
// LAYOUT
// --------------------------------------------------

var _gui_center_x = display_get_gui_width() / 2;
var _gui_center_y = display_get_gui_height() / 2;

pause_x = _gui_center_x;
pause_y = _gui_center_y - 70;

pause_spacing = 50;