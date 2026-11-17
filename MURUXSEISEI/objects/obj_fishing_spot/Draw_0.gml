// ==================================================
// FISHING SPOT - DRAW
// ==================================================

// Only show the interaction star when:
// 1. Player has a fishing rod
// 2. Fishing spot is idle

if (
    state == "idle"
    &&
    scr_hotbar_has_item("Fishing Rod")
)
{
    draw_interaction_star(
        20,
        0.06,
        12
    );
}