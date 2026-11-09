// Smoothly move the visible bar toward the real sanity value
display_sanity = lerp(
    display_sanity,
    global.sanity,
    0.12
);