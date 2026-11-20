// ==================================================
// LAUGHING - COLLISION WITH MURU
// ==================================================

if (!variable_global_exists("m1_score"))
{
    global.m1_score = 0;
}


global.m1_score += 1;


audio_play_sound(
    snd_ding,
    1,
    false
);


instance_destroy();