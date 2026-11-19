// ==================================================
// BREATHING GAME - CREATE
// ==================================================

phase = 0;
// 0 = inhale
// 1 = exhale

breath_progress = 0;

cycles_done = 0;
cycles_needed = 5;


// --------------------------------------------------
// BREATH SPEED
// --------------------------------------------------

inhale_duration = room_speed * 3;
exhale_duration = room_speed * 4;


// --------------------------------------------------
// CIRCLE SIZE
// --------------------------------------------------

circle_min = 70;
circle_max = 180;

circle_radius = circle_min;


// --------------------------------------------------
// GAME STATE
// --------------------------------------------------

finished = false;
finish_timer = 0;


// --------------------------------------------------
// SANITY SAFETY
// --------------------------------------------------

if (!variable_global_exists("max_sanity"))
{
    global.max_sanity = 100;
}

if (!variable_global_exists("sanity"))
{
    global.sanity = global.max_sanity;
}