// ==================================================
// INTERACTABLE - STEP
// ==================================================

// Disable interaction while paused
if (global.game_paused)
{
    can_interact = false;
    exit;
}

// Disable interaction during dialogue
if (global.dialogue_active)
{
    can_interact = false;
    exit;
}