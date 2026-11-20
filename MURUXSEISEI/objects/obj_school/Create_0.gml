// ==================================================
// SCHOOL - CREATE
// ==================================================

can_interact = false;

interaction_margin = 40;


// The object has its own Draw event,
// so making it visible will NOT draw the school sprite.
// It only allows the Draw event to run.
visible = true;


// ==================================================
// INTERACTION SAFETY
// ==================================================

if (!variable_global_exists("interact_blocked"))
{
    global.interact_blocked = false;
}