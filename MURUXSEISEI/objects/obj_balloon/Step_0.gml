if (popped) exit;

if (keyboard_check(vk_space)) {
    inflate_amount += 1.2;
} else {
    inflate_amount -= 0.6;
}

inflate_amount = clamp(inflate_amount, 0, 100);
image_index = floor((inflate_amount / 100) * 8);

if (inflate_amount >= 100) {
    popped = true;
    image_index = 9;
    alarm[1] = 6;
    alarm[0] = room_speed * 1;
}

if (inflate_amount >= target_min && inflate_amount <= target_max) {
    hold_timer++;
    if (hold_timer >= hold_required) {
        cycles_done++;
        hold_timer = 0;
        inflate_amount = 0;
        
        if (cycles_done >= cycles_needed) {
            room_fade_to(room_winminigame2);
        }
    }
} else {
    hold_timer = 0;
}