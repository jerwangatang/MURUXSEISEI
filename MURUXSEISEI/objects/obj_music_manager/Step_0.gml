if (keyboard_check_pressed(ord("T"))) {
    audio_stop_sound(current_music);
    
    current_track_index = (current_track_index + 1) mod array_length(tracks);
    current_music = audio_play_sound(tracks[current_track_index], 1, true);
    audio_sound_gain(current_music, global.music_volume, 0);
    
    show_track_name = true;
    track_name_timer = room_speed * 2;
}