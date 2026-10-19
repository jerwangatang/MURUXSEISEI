for (var i = 0; i < slot_count; i++) {
    if (keyboard_check_pressed(ord(string(i + 1)))) {
        selected_slot = i;
    }
}

if (keyboard_check_pressed(ord("E"))) {
    visible_hotbar = !visible_hotbar;
}

// Slot selection (only works while hotbar is open, optional)
if (visible_hotbar) {
    for (var i = 0; i < slot_count; i++) {
        if (keyboard_check_pressed(ord(string(i + 1)))) {
            selected_slot = i;
        }
    }
}