// Movement + facing direction
if (keyboard_check(ord("D"))) {
    x += move_spd;
    facing = 1;
    image_xscale = 1; 
}

if (keyboard_check(ord("A"))) {
    x -= move_spd;
    facing = -1;
    image_xscale = -1; 
}


x = clamp(x, 0 + sprite_width/2, room_width - sprite_width/2);