// ==================================================
// SHOPKEEPER - DRAW
// ==================================================

// Do NOT draw_self()
// This makes the shopkeeper sprite invisible.


// ==================================================
// INTERACTION STAR
// ==================================================

if (
    can_interact
    &&
    !shop_open
    &&
    !global.game_paused
    &&
    !global.dialogue_active
)
{
    draw_interaction_star(
        0,
        0.06,
        12
    );
}