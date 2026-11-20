// ==================================================
// BASKETBALL TRIGGER - DRAW
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
        24,
        0.06,
        12
    );
}