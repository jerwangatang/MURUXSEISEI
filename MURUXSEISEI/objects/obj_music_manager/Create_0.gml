// ==================================================
// MUSIC MANAGER - CREATE
// ==================================================

tracks = [
    snd_mc,
    snd_jn,
    snd_ac
];

track_names = [
    "Minecraft",
    "Journey",
    "Animal Crossing"
];

current_track_index = 0;


// --------------------------------------------------
// MUSIC VOLUME
// Uses same 0-100 system as title screen
// --------------------------------------------------

if (!variable_global_exists("music_volume"))
{
    global.music_volume = 100;
}

global.music_volume =
    clamp(
        global.music_volume,
        0,
        100
    );


// --------------------------------------------------
// SFX VOLUME
// --------------------------------------------------

if (!variable_global_exists("sfx_volume"))
{
    global.sfx_volume = 100;
}


// --------------------------------------------------
// DO NOT START GAME MUSIC YET
// --------------------------------------------------

current_music = -1;


// --------------------------------------------------
// TRACK NAME DISPLAY
// --------------------------------------------------

show_track_name = false;
track_name_timer = 0;