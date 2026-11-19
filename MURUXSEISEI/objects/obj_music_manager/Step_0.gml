// ==================================================
// MUSIC MANAGER - STEP
// ==================================================


// ==================================================
// TITLE SCREEN
// DO NOT PLAY IN-GAME MUSIC
// ==================================================

if (room == room_titlescreen)
{
    if (
        current_music != -1
        &&
        audio_is_playing(current_music)
    )
    {
        audio_stop_sound(
            current_music
        );
    }

    current_music = -1;

    exit;
}


// ==================================================
// START IN-GAME MUSIC
// ==================================================

if (
    current_music == -1
    ||
    !audio_is_playing(current_music)
)
{
    current_music =
        audio_play_sound(
            tracks[current_track_index],
            1,
            true
        );


    audio_sound_gain(
        current_music,
        global.music_volume / 100,
        0
    );
}


// ==================================================
// UPDATE VOLUME
// ==================================================

if (
    current_music != -1
    &&
    audio_is_playing(current_music)
)
{
    audio_sound_gain(
        current_music,
        global.music_volume / 100,
        0
    );
}


// ==================================================
// T = CHANGE MUSIC TRACK
// ONLY WHILE IN GAME
// ==================================================

if (keyboard_check_pressed(ord("T")))
{
    if (
        current_music != -1
        &&
        audio_is_playing(current_music)
    )
    {
        audio_stop_sound(
            current_music
        );
    }


    current_track_index =
        (current_track_index + 1)
        mod
        array_length(tracks);


    current_music =
        audio_play_sound(
            tracks[current_track_index],
            1,
            true
        );


    audio_sound_gain(
        current_music,
        global.music_volume / 100,
        0
    );


    show_track_name = true;

    track_name_timer =
        room_speed * 2;
}


// ==================================================
// TRACK NAME TIMER
// ==================================================

if (show_track_name)
{
    track_name_timer--;


    if (track_name_timer <= 0)
    {
        show_track_name = false;
    }
}