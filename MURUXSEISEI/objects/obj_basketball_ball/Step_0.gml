// ==================================================
// BASKETBALL BALL - STEP
// ==================================================


// ==================================================
// STATE 1 - FLYING
// ==================================================

if (state == 1)
{
    shot_progress += shot_speed;


    if (shot_progress > 1)
    {
        shot_progress = 1;
    }


    // ==================================================
    // VERY CLEAR TWO-STAGE ARC
    //
    // 0.00 -> 0.60 = rise above hoop
    // 0.60 -> 1.00 = fall toward hoop
    // ==================================================

    var _apex_progress = 0.60;


    // --------------------------------------------------
    // APEX POSITION
    // --------------------------------------------------

    var _apex_x =
        lerp(
            start_x,
            target_x,
            0.65
        );


    // This must be ABOVE the hoop
    var _apex_y = 75;


    // ==================================================
    // FIRST PART - RISING
    // ==================================================

    if (shot_progress < _apex_progress)
    {
        var _t =
            shot_progress
            /
            _apex_progress;


        // Smoothstep
        _t =
            _t
            *
            _t
            *
            (3 - 2 * _t);


        x =
            lerp(
                start_x,
                _apex_x,
                _t
            );


        y =
            lerp(
                start_y,
                _apex_y,
                _t
            );


        // Shrink quickly as ball travels away
        var _scale =
            lerp(
                start_scale,
                apex_scale,
                _t
            );


        image_xscale = _scale;
        image_yscale = _scale;
    }


    // ==================================================
    // SECOND PART - DROPPING INTO HOOP
    // ==================================================

    else
    {
        var _t =
            (
                shot_progress
                -
                _apex_progress
            )
            /
            (
                1
                -
                _apex_progress
            );


        // Smoothstep
        _t =
            _t
            *
            _t
            *
            (3 - 2 * _t);


        x =
            lerp(
                _apex_x,
                target_x,
                _t
            );


        y =
            lerp(
                _apex_y,
                target_y,
                _t
            );


        var _scale =
            lerp(
                apex_scale,
                end_scale,
                _t
            );


        image_xscale = _scale;
        image_yscale = _scale;
    }


    // ==================================================
    // ROTATION
    // ==================================================

    image_angle += 10;


    // ==================================================
    // REACHED TARGET
    // ==================================================

    if (shot_progress >= 1)
    {
        // --------------------------------------------------
        // SUCCESS
        // --------------------------------------------------

        if (shot_success)
        {
            x = target_x;
            y = target_y;

            state = 2;

            result_timer = 20;
        }


        // --------------------------------------------------
        // MISS
        // --------------------------------------------------

        else
        {
            state = 3;

            result_timer = 20;


            miss_dx =
                sign(
                    target_x - start_x
                )
                *
                6;


            if (miss_dx == 0)
            {
                miss_dx = 6;
            }
        }
    }
}


// ==================================================
// STATE 2 - SUCCESS / DROP THROUGH HOOP
// ==================================================

else if (state == 2)
{
    // Keep ball visible IN FRONT of hoop
    depth = -100;


    // Drop downward through rim
    y += 4;


    image_angle += 7;


    // Fade only near end
    if (result_timer <= 10)
    {
        image_alpha -= 0.09;
    }


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
// STATE 3 - MISS
// ==================================================

else if (state == 3)
{
    depth = -100;


    x += miss_dx;

    y += 5;


    image_angle += 12;


    if (result_timer <= 12)
    {
        image_alpha -= 0.08;
    }


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