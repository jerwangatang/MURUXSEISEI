// ==================================================
// DIALOGUE PORTRAIT - STEP
// ==================================================

// Make sure dialogue_active exists
if (!variable_global_exists("dialogue_active"))
{
    global.dialogue_active = false;
}


// When dialogue finishes,
// reset portrait so the next character shows it again.
if (!global.dialogue_active)
{
    global.hide_npc_portrait = false;
}