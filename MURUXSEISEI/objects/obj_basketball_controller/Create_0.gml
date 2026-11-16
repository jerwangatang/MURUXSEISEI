// ==================================================
// BASKETBALL CONTROLLER - CREATE
// ==================================================


// ==================================================
// RANDOM
// ==================================================

randomize();


// ==================================================
// DRAW DEPTH
// ==================================================

depth = 1000;


// ==================================================
// BACKGROUND / COURT
// ==================================================

background_height = 390;

court_y = 330;


// ==================================================
// HOOP POSITION
// ==================================================

hoop_x = room_width / 2;
hoop_y = 20;

hoop_target_x = room_width / 2;
hoop_target_y = 225;


// ==================================================
// BALL START
// ==================================================

ball_start_x = room_width / 2;
ball_start_y = 610;


// ==================================================
// GAME SETTINGS
// ==================================================

shots_taken = 0;
max_shots = 5;

score = 0;


// ==================================================
// AIM SETTINGS
// ==================================================

// Random starting position
aim_value = random_range(
    -0.85,
    0.85
);


// Random starting direction
if (irandom(1) == 0)
{
    aim_direction = -1;
}
else
{
    aim_direction = 1;
}


// Random speed range
aim_speed_min = 0.015;
aim_speed_max = 0.040;


// First shot random speed
aim_speed = random_range(
    aim_speed_min,
    aim_speed_max
);


// Green success zone
aim_success_range = 0.18;


// ==================================================
// GAME STATE
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
// INPUT LOCK
//
// Prevents the Enter used to enter the room
// from immediately shooting.
// ==================================================

input_locked = true;


// ==================================================
// CREATE HOOP
// ==================================================

hoop_id = instance_create_layer(
    hoop_x,
    hoop_y,
    "Instances",
    obj_basketball_hoop
);


with (hoop_id)
{
    sprite_index = spr_basketball_hoop;

    visible = true;

    image_xscale = 0.55;
    image_yscale = 0.55;

    image_alpha = 1;

    depth = -50;
}


// ==================================================
// CREATE BALL
// ==================================================

ball_id = instance_create_layer(
    ball_start_x,
    ball_start_y,
    "Instances",
    obj_basketball_ball
);


ball_id.controller_id = id;


// ==================================================
// INITIAL BALL SETTINGS
// ==================================================

ball_id.x = ball_start_x;
ball_id.y = ball_start_y;

ball_id.visible = true;

ball_id.image_alpha = 1;

ball_id.image_angle = 0;

ball_id.depth = -100;