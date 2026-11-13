// Smoothly move the visible bar toward the real sanity value
if (global.sanity <= 0) {
    scr_player_death();
    exit; // stop the rest of this step (like the lerp) from running this frame
}

// existing lerp code below
display_sanity = lerp(display_sanity, global.sanity, 0.12);

display_sanity = lerp(
    display_sanity,
    global.sanity,
    0.12
);