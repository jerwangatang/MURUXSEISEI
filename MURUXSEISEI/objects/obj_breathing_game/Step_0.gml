// ==================================================
// BREATHING GAME - STEP
// ==================================================


// ==================================================
// FINISHED
// ==================================================

if (finished)
{
    finish_timer--;


    if (finish_timer <= 0)
    {
        room_fade_to(room_arcade1);
    }


    exit;
}


// ==================================================
// ESC = LEAVE MINIGAME
// ==================================================

if (keyboard_check_pressed(vk_escape))
{
    room_fade_to(room_arcade1);

    exit;
}


// ==================================================
// PHASE 0 - INHALE
// HOLD ENTER
// ==================================================

if (phase == 0)
{
    if (keyboard_check(vk_enter))
    {
        breath_progress +=
            1 / inhale_duration;


        breath_progress =
            clamp(
                breath_progress,
                0,
                1
            );
    }


    circle_radius =
        lerp(
            circle_min,
            circle_max,
            breath_progress
        );


    // --------------------------------------------------
    // CIRCLE FULLY EXPANDED
    // SWITCH TO EXHALE
    // --------------------------------------------------

    if (breath_progress >= 1)
    {
        phase = 1;
    }
}


// ==================================================
// PHASE 1 - EXHALE
// RELEASE ENTER
// ==================================================

else if (phase == 1)
{
    if (!keyboard_check(vk_enter))
    {
        breath_progress -=
            1 / exhale_duration;


        breath_progress =
            clamp(
                breath_progress,
                0,
                1
            );
    }


    circle_radius =
        lerp(
            circle_min,
            circle_max,
            breath_progress
        );


    // ==================================================
    // ONE FULL BREATH COMPLETE
    // ==================================================

    if (breath_progress <= 0)
    {
        cycles_done++;


        // ==================================================
        // ALL 5 BREATHS COMPLETE
        // ==================================================

        if (cycles_done >= cycles_needed)
        {
            finished = true;

            finish_timer =
                room_speed * 3;


            // ==================================================
            // SANITY REWARD
            // ==================================================

            sanity_change(5);


            // ==================================================
            // QUEST COMPLETION
            // ==================================================

            if (instance_exists(obj_quest_manager))
            {
                var _manager =
                    instance_find(
                        obj_quest_manager,
                        0
                    );


                var _day =
                    _manager.current_day_index;


                // ==================================================
                // COCO'S - TOWN 1
                // ==================================================

                if (
                    !variable_global_exists(
                        "arcade_return_room"
                    )
                    ||
                    global.arcade_return_room
                    ==
                    room_town1
                )
                {
                    // ==============================================
                    // DAY 1
                    // Play a game at Coco's
                    // ==============================================

                    if (_day == 0)
                    {
                        if (
                            !scr_quest_done(
                                "cocos_minigame"
                            )
                        )
                        {
                            scr_complete_quest(
                                "cocos_minigame"
                            );


                            scr_request_autosave(
                                "completed Coco breathing game"
                            );
                        }
                    }


                    // ==============================================
                    // DAY 2
                    // Play another game at Coco's
                    // ==============================================

                    else if (_day == 1)
                    {
                        if (
                            !scr_quest_done(
                                "cocos_minigame_day2"
                            )
                        )
                        {
                            scr_complete_quest(
                                "cocos_minigame_day2"
                            );


                            scr_request_autosave(
                                "completed Coco breathing game day 2"
                            );
                        }
                    }
                }


                // ==================================================
                // CLOCKZONE - TOWN 2
                // ==================================================

                else if (
                    global.arcade_return_room
                    ==
                    room_town2
                )
                {
                    // ==============================================
                    // DAY 3
                    // Play games at Clockzone
                    // ==============================================

                    if (_day == 2)
                    {
                        if (
                            !scr_quest_done(
                                "clockzone_games"
                            )
                        )
                        {
                            scr_complete_quest(
                                "clockzone_games"
                            );


                            scr_request_autosave(
                                "completed Clockzone breathing game"
                            );
                        }
                    }


                    // ==============================================
                    // DAY 4
                    // Play a game at Clockzone
                    // ==============================================

                    else if (_day == 3)
                    {
                        if (
                            !scr_quest_done(
                                "clockzone_day4"
                            )
                        )
                        {
                            scr_complete_quest(
                                "clockzone_day4"
                            );


                            scr_request_autosave(
                                "completed Clockzone breathing game day 4"
                            );
                        }
                    }


                    // ==============================================
                    // DAY 5
                    // BUILD UP COURAGE
                    // ==============================================

                    else if (_day == 4)
                    {
                        if (
                            !scr_quest_done(
                                "courage_minigame"
                            )
                        )
                        {
                            scr_complete_quest(
                                "courage_minigame"
                            );


                            scr_request_autosave(
                                "built up courage"
                            );
                        }
                    }
                }
            }
        }


        // ==================================================
        // START NEXT BREATH
        // ==================================================

        else
        {
            phase = 0;

            breath_progress = 0;

            circle_radius =
                circle_min;
        }
    }
}