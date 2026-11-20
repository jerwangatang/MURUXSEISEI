// ==================================================
// SANITY BAR - STEP
// ==================================================


// ==================================================
// SANITY SAFETY
// ==================================================

if (!variable_global_exists("max_sanity"))
{
    global.max_sanity = 100;
}


if (!variable_global_exists("sanity"))
{
    global.sanity =
        global.max_sanity;
}


// ==================================================
// CHECK WHETHER SANITY SHOULD DRAIN
// ==================================================

var _drain_allowed = true;


// --------------------------------------------------
// PAUSED
// --------------------------------------------------

if (
    variable_global_exists("game_paused")
    &&
    global.game_paused
)
{
    _drain_allowed = false;
}


// --------------------------------------------------
// DIALOGUE
// Don't punish the player for reading dialogue.
// --------------------------------------------------

if (
    variable_global_exists("dialogue_active")
    &&
    global.dialogue_active
)
{
    _drain_allowed = false;
}


// --------------------------------------------------
// DO NOT DRAIN IN MENUS / MINIGAMES
// --------------------------------------------------

if (
    room == room_titlescreen
    ||
    room == room_arcade1
    ||
    room == room_breathinggame
    ||
    room == room_catchthefallingthoughts
    ||
    room == room_dontpoptheballoon
    ||
    room == room_basketball
    ||
    room == room_winminigame
    ||
    room == room_winminigame2
    ||
    room == room_loseminigame
    ||
    room == room_deathscreen
)
{
    _drain_allowed = false;
}


// ==================================================
// PASSIVE DRAIN
// ==================================================

if (_drain_allowed)
{
    // delta_time is measured in microseconds
    var _seconds =
        delta_time / 1000000;


    // Drain enough so a FULL bar lasts exactly 7 minutes
    var _drain_per_second =
        global.max_sanity
        /
        drain_duration_seconds;


    global.sanity =
        max(
            0,
            global.sanity
            -
            (_drain_per_second * _seconds)
        );
}


// ==================================================
// PLAYER DEATH
// ==================================================

if (global.sanity <= 0)
{
    scr_player_death();

    exit;
}


// ==================================================
// SMOOTH SANITY BAR ANIMATION
// ==================================================

display_sanity =
    lerp(
        display_sanity,
        global.sanity,
        0.12
    );