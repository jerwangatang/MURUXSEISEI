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
// STATE 0 - AIM
// ==================================================

if (state == 0)
{
    // --------------------------------------------------
    // MOVE AIM MARKER
    // --------------------------------------------------

    aim_value +=
        aim_speed
        *
        aim_direction;


    // Right edge
    if (aim_value >= 1)
    {
        aim_value = 1;

        aim_direction = -1;
    }


    // Left edge
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
        // CHECK ACCURACY
        // --------------------------------------------------

        var _success =
            abs(aim_value)
            <=
            aim_success_range;


        // --------------------------------------------------
        // SUCCESS
        // --------------------------------------------------

        if (_success)
        {
            score++;

            message = "SWISH!";


            ball_id.target_x =
                hoop_target_x;

            ball_id.target_y =
                hoop_target_y;
        }


        // --------------------------------------------------
        // MISS
        // --------------------------------------------------

        else
        {
            message = "MISS!";


            // Aim value controls left/right miss
            ball_id.target_x =
                hoop_target_x
                +
                aim_value
                * 220;


            ball_id.target_y =
                hoop_target_y;
        }


        // ==================================================
        // START BALL ANIMATION
        // ==================================================

        ball_id.visible = true;

        ball_id.image_alpha = 1;

        ball_id.image_angle = 0;


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
// STATE 1 - BALL IS FLYING
// ==================================================

else if (state == 1)
{
    if (shot_finished)
    {
        // ==================================================
        // ALL SHOTS FINISHED
        // ==================================================

        if (shots_taken >= max_shots)
        {
            state = 3;

            finish_timer =
                room_speed * 2;


            message =
                "Final Score: "
                +
                string(score)
                +
                " / "
                +
                string(max_shots);


            // --------------------------------------------------
            // COMPLETE QUEST
            // --------------------------------------------------

            if (!quest_completed)
            {
                quest_completed = true;


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
                room_speed * 0.75;
        }
    }
}


// ==================================================
// STATE 2 - WAIT BEFORE NEXT SHOT
// ==================================================

else if (state == 2)
{
    wait_timer--;


    if (wait_timer <= 0)
    {
        // Reset ball

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


        ball_id.state =
            0;


        shot_finished =
            false;


        // Reset aim
        aim_value = 0;

        aim_direction = 1;


        message =
            "Press ENTER when the marker is in the centre";


        state =
            0;
    }
}


// ==================================================
// STATE 3 - FINISHED
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