// ==================================================
// BASKETBALL CONTROLLER - CREATE
// ==================================================

depth = 1000;

// ==================================================
// POSITIONS
// ==================================================

hoop_x = room_width / 2;
hoop_y = 35;


// Actual target is the rim,
// NOT the object's origin.
hoop_target_x = room_width / 2;
hoop_target_y = 215;


ball_start_x = room_width / 2;
ball_start_y = 600;


// ==================================================
// DRAWING POSITIONS
// ==================================================

background_height = 390;

court_y = 330;


// ==================================================
// GAME
// ==================================================

shots_taken = 0;
max_shots = 5;

score = 0;


// ==================================================
// AIM
//
// -1 = far left
//  0 = centre
//  1 = far right
// ==================================================

aim_value = 0;

aim_direction = 1;

aim_speed = 0.025;


// Success zone
aim_success_range = 0.18;


// ==================================================
// STATE
//
// 0 = aiming
// 1 = ball flying
// 2 = waiting
// 3 = finished
// ==================================================

state = 0;


shot_finished = false;

wait_timer = 0;

finish_timer = 0;

quest_completed = false;


// ==================================================
// MESSAGE
// ==================================================

message =
    "Press ENTER when the marker is in the centre";


// ==================================================
// CREATE HOOP
// ==================================================

hoop_x = room_width / 2;
hoop_y = 20;

hoop_id = instance_create_layer(
    hoop_x,
    hoop_y,
    "Instances",
    obj_basketball_hoop
);


// Force all visual settings
with (hoop_id)
{
    sprite_index = spr_basketball_hoop;

    visible = true;

    x = other.hoop_x;
    y = other.hoop_y;

    image_xscale = 0.55;
    image_yscale = 0.55;

    image_alpha = 1;

    depth = -50;
}

// ==================================================
// CREATE BALL
// ==================================================

ball_id =
    instance_create_layer(
        ball_start_x,
        ball_start_y,
        "Instances",
        obj_basketball_ball
    );


ball_id.controller_id = id;


// ==================================================
// PREVENT ENTER CARRY-OVER
// ==================================================

input_locked = true;