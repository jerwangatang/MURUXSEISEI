// ==================================================
// COUCH - DRAW
// ==================================================

// Draw couch normally
draw_self();


// ==================================================
// INTERACTION STAR
// ==================================================

if (
    can_interact
    &&
    !global.game_paused
    &&
    !global.dialogue_active
    &&
    !enter_release_block
)
{
    draw_interaction_star(
        0,
        0.06,
        12
    );
}