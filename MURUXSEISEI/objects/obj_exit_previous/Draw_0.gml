// ==================================================
// EXIT PREVIOUS - DRAW
// ==================================================

if (
    can_interact
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