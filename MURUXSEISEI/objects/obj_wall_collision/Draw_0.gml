// Invisible collision object
// Do not draw the sprite

// ==================================================
// WALL COLLISION - DRAW EVENT
// ==================================================

if (keyboard_check(vk_f3))
{
    draw_set_alpha(0.4);
    draw_set_color(c_red);

    draw_rectangle(
        bbox_left,
        bbox_top,
        bbox_right,
        bbox_bottom,
        false
    );

    draw_set_alpha(1);
    draw_set_color(c_white);
}