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


// --------------------------------------------------
// LAYOUT
// --------------------------------------------------

var _gui_center_x = display_get_gui_width() / 2;
var _gui_center_y = display_get_gui_height() / 2;

pause_x = _gui_center_x;
pause_y = _gui_center_y - 70;

pause_spacing = 50;