// ==================================================
// PLAYER - CREATE
// ==================================================

show_coords = true;


// ==================================================
// MOVEMENT
// ==================================================

base_move_spd = 5;
move_spd = 3;

speed_boost_timer = 0;


// ==================================================
// FACING / SPRITE
// ==================================================

facing_dir = "south";

sprite_index =
    spr_muru_idle_south;

image_speed = 0.08;


// ==================================================
// FOOTSTEPS
// ==================================================

footstep_sound = noone;
footstep_timer = 0;
footstep_cut_timer = 0;


// ==================================================
// SANITY VARIABLES
// ==================================================

if (!variable_global_exists("max_sanity"))
{
    global.max_sanity = 100;
}

if (!variable_global_exists("sanity"))
{
    global.sanity =
        global.max_sanity;
}


// ==================================================
// MAKE SURE SANITY BAR EXISTS
// ==================================================

if (!instance_exists(obj_sanity_bar))
{
    instance_create_depth(
        0,
        0,
        -10000,
        obj_sanity_bar
    );
}