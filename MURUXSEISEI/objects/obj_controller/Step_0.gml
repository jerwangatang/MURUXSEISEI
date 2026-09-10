spawn_timer++;

if (spawn_timer >= spawn_interval) {
    spawn_timer = 0;
    
    var _rand_x = irandom_range(50, room_width - 50);
    var _type = irandom(3); // 0, 1, 2, or 3
    
    if (_type == 0) {
        instance_create_layer(_rand_x, 0, "Instances", obj_happy);
    } else if (_type == 1) {
        instance_create_layer(_rand_x, 0, "Instances", obj_sad);
    } else if (_type == 2) {
        instance_create_layer(_rand_x, 0, "Instances", obj_angry);
    } else {
        instance_create_layer(_rand_x, 0, "Instances", obj_laughing);
    }
}