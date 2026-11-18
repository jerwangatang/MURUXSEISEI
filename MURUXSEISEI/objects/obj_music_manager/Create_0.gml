tracks = [snd_mc, snd_jn, snd_ac];
track_names = ["Minecraft", "Journey", "Animal Crossing"];
current_track_index = 0;

global.music_volume = 1;
global.sfx_volume = 1;

current_music = audio_play_sound(tracks[current_track_index], 1, true);
audio_sound_gain(current_music, global.music_volume, 0);

show_track_name = false;
track_name_timer = 0;