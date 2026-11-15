// ==================================================
// BASKETBALL BALL - STEP
// ==================================================


// ==================================================
// FLYING
// ==================================================

if (state == 1)
{
    shot_progress += shot_speed;


    if (shot_progress > 1)
    {
        shot_progress = 1;
    }


    // --------------------------------------------------
    // MOVE TOWARD HOOP
    // --------------------------------------------------

    x = lerp(
        start_x,
        target_x,
        shot_progress
    );


    y =
        lerp(
            start_y,
            target_y,
            shot_progress
        )
        -
        sin(
            shot_progress * pi
        )
        * 90;


    // --------------------------------------------------
    // SHRINK INTO DISTANCE
    // --------------------------------------------------

    var _scale =
        lerp(
            start_scale,
            end_scale,
            shot_progress
        );


    image_xscale = _scale;
    image_yscale = _scale;


    // Rotate basketball
    image_angle += 14;


    // ==================================================
    // REACHED HOOP
    // ==================================================

    if (shot_progress >= 1)
    {
        // SUCCESS
        if (shot_success)
        {
            state = 2;

            result_timer = 15;
        }

        // MISS
        else
        {
            state = 3;

            result_timer = 18;


            miss_dx =
                sign(
                    target_x - start_x
                )
                * 6;


            if (miss_dx == 0)
            {
                miss_dx = 6;
            }
        }
    }
}


// ==================================================
// SWISH
// ==================================================

else if (state == 2)
{
    // Ball drops through hoop

    y += 5;

    image_xscale *= 0.98;
    image_yscale *= 0.98;

    image_alpha -= 0.055;

    result_timer--;


    if (result_timer <= 0)
    {
        visible = false;

        state = 0;


        if (instance_exists(controller_id))
        {
            with (controller_id)
            {
                shot_finished = true;
            }
        }
    }
}


// ==================================================
// MISS
// ==================================================

else if (state == 3)
{
    x += miss_dx;

    y += 3;

    image_angle += 16;

    image_alpha -= 0.05;

    result_timer--;


    if (result_timer <= 0)
    {
        visible = false;

        state = 0;


        if (instance_exists(controller_id))
        {
            with (controller_id)
            {
                shot_finished = true;
            }
        }
    }
}