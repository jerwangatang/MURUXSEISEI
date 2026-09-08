// ==================================================
// FADE TRANSITION - STEP
// ==================================================


// --------------------------------------------------
// FADE OUT
// --------------------------------------------------

if (fade_state == 0)
{
    fade_alpha += fade_speed;

    if (fade_alpha >= 1)
    {
        fade_alpha = 1;

        // Start fading back in after room changes
        fade_state = 1;

        // Change room
        if (target_room != noone)
        {
            room_goto(target_room);
        }
    }
}


// --------------------------------------------------
// FADE IN
// --------------------------------------------------

else if (fade_state == 1)
{
    fade_alpha -= fade_speed;

    if (fade_alpha <= 0)
    {
        fade_alpha = 0;

        // Transition finished
        instance_destroy();
    }
}