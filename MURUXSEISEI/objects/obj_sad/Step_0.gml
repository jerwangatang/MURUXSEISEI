y += fall_spd;

// destroy if it falls off screen without being caught
if (y > room_height) {
    instance_destroy();
}