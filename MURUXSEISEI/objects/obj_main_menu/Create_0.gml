// ==================================================
// MAIN MENU - CREATE EVENT
// ==================================================


// --------------------------------------------------
// CURRENT PAGE / SELECTION
// --------------------------------------------------

menu_page = "main";
menu_selected = 0;


// ==================================================
// MAIN MENU ITEMS
// ==================================================

main_items = [
    "play",
    "settings",
    "controls",
    "credits",
    "quit"
];


// ==================================================
// SETTINGS ITEMS
// ==================================================

settings_items = [
    "music volume",
    "sfx volume",
    "fullscreen",
    "back"
];


// ==================================================
// SETTINGS VALUES
// ==================================================

if (!variable_global_exists("music_volume"))
{
    global.music_volume = 100;
}

sfx_volume = 100;

audio_sound_gain(
    snd_menu_move,
    sfx_volume / 100,
    0
);

audio_sound_gain(
    snd_menu_select,
    sfx_volume / 100,
    0
);


// ==================================================
// POSITION
// ==================================================

menu_x =
    display_get_gui_width() / 2;

menu_y = 500;

menu_spacing = 50;

menu_width = 300;
menu_height = 40;


// ==================================================
// QUIT CONFIRMATION
// ==================================================

quit_selected = 1;

// 0 = yes
// 1 = no


// ==================================================
// SAVE SLOT MENU
// ==================================================

save_selected = 0;


// --------------------------------------------------
// IMPORTANT:
// Stops the Enter press used on "Play"
// from immediately loading File 1.
// --------------------------------------------------

save_input_locked = false;


// ==================================================
// DELETE SAVE CONFIRMATION
// ==================================================

delete_confirm = false;

delete_slot = 0;

// 0 = yes
// 1 = no
delete_selected = 1;


// ==================================================
// LOAD SAVE SLOT INFORMATION
// ==================================================

save_info = [
    scr_get_save_info(1),
    scr_get_save_info(2),
    scr_get_save_info(3)
];


// ==================================================
// REFRESH SAVE SLOT INFORMATION
// ==================================================

refresh_save_slots = function()
{
    save_info[0] =
        scr_get_save_info(1);

    save_info[1] =
        scr_get_save_info(2);

    save_info[2] =
        scr_get_save_info(3);
};