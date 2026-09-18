// ==================================================
// TITLE MUSIC - CREATE
// ==================================================

if (!variable_global_exists("music_volume"))
{
    global.music_volume = 100;
}

// Safety check in case it somehow became invalid
global.music_volume = clamp(
    global.music_volume,
    0,
    100
);

title_music = audio_play_sound(
    snd_title_music,
    1,
    true
);

audio_sound_gain(
    title_music,
    global.music_volume / 100,
    0
);