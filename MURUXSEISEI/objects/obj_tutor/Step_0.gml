// ==================================================
// OBJ_TUTOR - STEP EVENT
// ==================================================


// ==================================================
// PAUSE
// ==================================================

if (global.game_paused)
{
    exit;
}


// ==================================================
// INTERACTION BLOCK
// ==================================================

if (!variable_global_exists("interact_blocked"))
{
    global.interact_blocked = false;
}


if (global.interact_blocked)
{
    if (!keyboard_check(vk_enter))
    {
        global.interact_blocked = false;
    }

    exit;
}


// ==================================================
// QUEST MANAGER CHECK
// ==================================================

if (!instance_exists(obj_quest_manager))
{
    exit;
}


var _manager =
    instance_find(obj_quest_manager, 0);

var _day_index =
    _manager.current_day_index;


// ==================================================
// QUIZ ACTIVE
// DAY 1 TUTORING QUIZ
// ==================================================

if (quiz_active)
{
    // --------------------------------------------------
    // QUIZ FINISHED
    // --------------------------------------------------

    if (quiz_finished)
    {
        if (keyboard_check_pressed(vk_enter))
        {
            quiz_active = false;
            quiz_finished = false;

            global.dialogue_active = false;


            // ==================================================
            // DAY 1 - FINISH TUTORING
            // ==================================================

            if (_day_index == 0)
            {
                if (!scr_quest_done("tutoring"))
                {
                    scr_complete_quest(
                        "tutoring"
                    );


                    scr_request_autosave(
                        "tutoring complete"
                    );
                }
            }


            // Stop same Enter press reopening Tutor
            global.interact_blocked = true;
        }

        exit;
    }


    // ==================================================
    // CURRENT QUESTION
    // ==================================================

    var _question =
        tutor_questions[
            question_index
        ];


    var _answer_count =
        array_length(
            _question.answers
        );


    // ==================================================
    // W = MOVE UP
    // ==================================================

    if (keyboard_check_pressed(ord("W")))
    {
        selected_answer--;


        if (selected_answer < 0)
        {
            selected_answer =
                _answer_count - 1;
        }


        feedback_text = "";
    }


    // ==================================================
    // S = MOVE DOWN
    // ==================================================

    if (keyboard_check_pressed(ord("S")))
    {
        selected_answer++;


        if (
            selected_answer
            >=
            _answer_count
        )
        {
            selected_answer = 0;
        }


        feedback_text = "";
    }


    // ==================================================
    // ENTER = CONFIRM ANSWER
    // ==================================================

    if (keyboard_check_pressed(vk_enter))
    {
        // --------------------------------------------------
        // CORRECT
        // --------------------------------------------------

        if (
            selected_answer
            ==
            _question.correct
        )
        {
            question_index++;

            selected_answer = 0;
            feedback_text = "";


            // All questions finished
            if (
                question_index
                >=
                array_length(tutor_questions)
            )
            {
                quiz_finished = true;
            }
        }


        // --------------------------------------------------
        // WRONG
        // --------------------------------------------------

        else
        {
            feedback_text =
                "Not quite. Try again.";
        }
    }


    exit;
}


// ==================================================
// NORMAL DIALOGUE ACTIVE
// ==================================================

if (global.dialogue_active)
{
    exit;
}


// ==================================================
// PLAYER CHECK
// ==================================================

if (!instance_exists(obj_player))
{
    exit;
}


var _player =
    instance_find(obj_player, 0);


// ==================================================
// PLAYER NEAR TUTOR
// ==================================================

var _near =
    _player.bbox_right
        >=
        bbox_left - interaction_margin

    &&

    _player.bbox_left
        <=
        bbox_right + interaction_margin

    &&

    _player.bbox_bottom
        >=
        bbox_top - interaction_margin

    &&

    _player.bbox_top
        <=
        bbox_bottom + interaction_margin;


// ==================================================
// INTERACTION
// ==================================================

if (
    _near
    &&
    keyboard_check_pressed(vk_enter)
)
{
    // ==================================================
    // DAY 1 - TUTORING
    // ==================================================

    if (_day_index == 0)
    {
        // Already completed
        if (scr_quest_done("tutoring"))
        {
            dialogue_start(
                [
                    {
                        speaker: "Tutor",
                        text: "That's all for today. Keep practising."
                    },

                    {
                        speaker: "Muru",
                        text: "Okay. Thanks."
                    }
                ]
            );
        }

        // Start quiz
        else
        {
            quiz_active = true;
            quiz_finished = false;

            question_index = 0;
            selected_answer = 0;

            feedback_text = "";

            global.dialogue_active = true;
        }
    }


    // ==================================================
    // DAY 2 - FINISH TUTORING HOMEWORK
    // ==================================================

    else if (_day_index == 1)
    {
        if (!scr_quest_done("finish_tutor_homework"))
        {
            dialogue_start(
                [
                    {
                        speaker: "Tutor",
                        text: "Did you finish the homework I gave you?"
                    },

                    {
                        speaker: "Muru",
                        text: "Yeah. I finished it."
                    },

                    {
                        speaker: "Tutor",
                        text: "Good. You're making progress."
                    },

                    {
                        speaker: "Muru",
                        text: "Thanks."
                    }
                ]
            );


            scr_complete_quest(
                "finish_tutor_homework"
            );


            scr_request_autosave(
                "tutor homework complete"
            );
        }
        else
        {
            dialogue_start(
                [
                    {
                        speaker: "Tutor",
                        text: "Good work on your homework."
                    },

                    {
                        speaker: "Muru",
                        text: "Thanks."
                    }
                ]
            );
        }
    }


    // ==================================================
    // DAY 3 - APOLOGISE TO TUTOR
    // ==================================================

    else if (_day_index == 2)
    {
        if (!scr_quest_done("apologise_tutor"))
        {
            dialogue_start(
                [
                    {
                        speaker: "Muru",
                        text: "I'm sorry about what happened."
                    },

                    {
                        speaker: "Tutor",
                        text: "It's alright, Muru."
                    },

                    {
                        speaker: "Tutor",
                        text: "Thank you for coming to talk to me."
                    },

                    {
                        speaker: "Muru",
                        text: "Okay..."
                    }
                ]
            );


            scr_complete_quest(
                "apologise_tutor"
            );


            scr_request_autosave(
                "apologised to tutor"
            );
        }
        else
        {
            dialogue_start(
                [
                    {
                        speaker: "Tutor",
                        text: "Don't worry about it anymore."
                    },

                    {
                        speaker: "Muru",
                        text: "Okay."
                    }
                ]
            );
        }
    }


    // ==================================================
    // DAY 4 / DAY 5
    // NO TUTOR QUEST
    // ==================================================

    else
    {
        dialogue_start(
            [
                {
                    speaker: "Tutor",
                    text: "Keep doing your best, Muru."
                },

                {
                    speaker: "Muru",
                    text: "I will."
                }
            ]
        );
    }
}