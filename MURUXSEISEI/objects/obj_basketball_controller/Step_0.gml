// ==================================================
// BASKETBALL CONTROLLER - STEP
// ==================================================


// ==================================================
// ENTER RELEASE LOCK
// ==================================================

if (input_locked)
{
    if (!keyboard_check(vk_enter))
    {
        input_locked = false;
    }

    exit;
}


// ==================================================
// STATE 0 - AIMING
// ==================================================

if (state == 0)
{
    // ==================================================
    // MOVE AIM MARKER
    // ==================================================

    aim_value +=
        aim_speed
        *
        aim_direction;


    // Bounce at right edge
    if (aim_value >= 1)
    {
        aim_value = 1;
        aim_direction = -1;
    }


    // Bounce at left edge
    if (aim_value <= -1)
    {
        aim_value = -1;
        aim_direction = 1;
    }


    // ==================================================
    // SHOOT
    // ==================================================

    if (keyboard_check_pressed(vk_enter))
    {
        shots_taken++;


        // --------------------------------------------------
        // CHECK IF SHOT IS SUCCESSFUL
        // --------------------------------------------------

        var _success =
            abs(aim_value)
            <=
            aim_success_range;


        // ==================================================
        // SUCCESS TARGET
        // ==================================================

        if (_success)
        {
            score++;


            ball_id.target_x =
                hoop_target_x;


            ball_id.target_y =
                hoop_target_y;
        }


        // ==================================================
        // MISS TARGET
        // ==================================================

        else
        {
            ball_id.target_x =
                hoop_target_x
                +
                (
                    aim_value
                    *
                    180
                );


            ball_id.target_y =
                hoop_target_y
                +
                10;
        }


        // ==================================================
        // RESET BALL FOR SHOT
        // ==================================================

        ball_id.visible = true;

        ball_id.image_alpha = 1;

        ball_id.image_angle = 0;

        ball_id.depth = -100;


        ball_id.start_x =
            ball_start_x;

        ball_id.start_y =
            ball_start_y;


        ball_id.x =
            ball_start_x;

        ball_id.y =
            ball_start_y;


        ball_id.start_scale =
            0.12;

        ball_id.apex_scale =
            0.055;

        ball_id.end_scale =
            0.045;


        ball_id.image_xscale =
            ball_id.start_scale;

        ball_id.image_yscale =
            ball_id.start_scale;


        ball_id.shot_progress =
            0;


        ball_id.shot_success =
            _success;


        ball_id.state =
            1;


        shot_finished =
            false;


        state =
            1;
    }
}


// ==================================================
// STATE 1 - SHOT OCCURRING
// ==================================================

else if (state == 1)
{
    if (shot_finished)
    {
        // ==================================================
        // FINAL SHOT COMPLETE
        // ==================================================

        if (shots_taken >= max_shots)
        {
            state = 3;


            finish_timer =
                room_speed
                *
                2;


            // ==================================================
            // COMPLETE QUEST ONCE
            // ==================================================

            if (!quest_completed)
            {
                quest_completed =
                    true;


                if (instance_exists(obj_quest_manager))
                {
                    scr_complete_quest(
                        "basketball_game"
                    );
                }


                scr_request_autosave(
                    "basketball complete"
                );
            }
        }


        // ==================================================
        // NEXT SHOT
        // ==================================================

        else
        {
            state = 2;


            wait_timer =
                room_speed
                *
                0.7;
        }
    }
}


// ==================================================
// STATE 2 - PREPARE NEXT BALL
// ==================================================

else if (state == 2)
{
    wait_timer--;


    if (wait_timer <= 0)
    {
        // ==================================================
        // RESET BALL
        // ==================================================

        ball_id.x =
            ball_start_x;

        ball_id.y =
            ball_start_y;


        ball_id.visible =
            true;


        ball_id.image_alpha =
            1;


        ball_id.image_angle =
            0;


        ball_id.image_xscale =
            0.12;

        ball_id.image_yscale =
            0.12;


        ball_id.depth =
            -100;


        ball_id.state =
            0;


        shot_finished =
            false;


        // ==================================================
        // RANDOMISE AIM FOR NEXT SHOT
        // ==================================================

        // Random starting position
        aim_value =
            random_range(
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


        // Random speed
        aim_speed =
            random_range(
                aim_speed_min,
                aim_speed_max
            );


        state =
            0;
    }
}


// ==================================================
// STATE 3 - GAME FINISHED
// ==================================================

else if (state == 3)
{
    finish_timer--;


    if (finish_timer <= 0)
    {
        room_fade_to(
            room_town2
        );
    }
}