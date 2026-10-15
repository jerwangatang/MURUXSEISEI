score = 0;
win_score = 10;
spawn_timer = 0;
spawn_interval = 60;

// ==================================================
// SANITY SYSTEM
// ==================================================

if (!variable_global_exists("max_sanity"))
{
    global.max_sanity = 100;
}

if (!variable_global_exists("sanity"))
{
    global.sanity = global.max_sanity;
}