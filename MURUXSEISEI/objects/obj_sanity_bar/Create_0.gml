// ==================================================
// SANITY BAR - CREATE
// ==================================================

// Make sure sanity variables exist
if (!variable_global_exists("max_sanity"))
{
    global.max_sanity = 100;
}

if (!variable_global_exists("sanity"))
{
    global.sanity = global.max_sanity;
}

// Value displayed by the animated bar
display_sanity = global.sanity;