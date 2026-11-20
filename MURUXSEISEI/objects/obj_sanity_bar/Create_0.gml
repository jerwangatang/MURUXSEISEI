// ==================================================
// SANITY BAR - CREATE
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
// DISPLAYED SANITY
// ==================================================

display_sanity =
    global.sanity;


// ==================================================
// PASSIVE SANITY DRAIN
//
// Full bar -> empty in 7 minutes
// ==================================================

drain_duration_seconds =
    7 * 60;