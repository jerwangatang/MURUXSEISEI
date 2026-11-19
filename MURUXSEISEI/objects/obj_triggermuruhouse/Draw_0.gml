// ==================================================
// BLOCK INTERACTION WHILE PAUSED
// ==================================================

if (global.game_paused)
{
    exit;
}

if (global.dialogue_active)
{
    exit;
}

// ==================================================
// DOOR TRIGGER - DRAW
// ==================================================

// Do NOT draw the trigger sprite.
// Only draw the interaction star.

draw_interaction_star(
    0,
    0.06,
    12
);