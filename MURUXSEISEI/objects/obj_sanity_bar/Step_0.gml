// Smoothly move the visible bar toward the real sanity value
display_sanity = lerp(
    display_sanity,
    global.sanity,
    0.12
);

// TEMPORARY TESTING

if (keyboard_check_pressed(ord("K")))
{
    sanity_change(-10);
}

if (keyboard_check_pressed(ord("L")))
{
    sanity_change(10);
}