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
// MAKE SURE INTERACTION BLOCK EXISTS
// ==================================================

if (!variable_global_exists("interact_blocked"))
{
    global.interact_blocked = false;
}


// ==================================================
// PREVENT ENTER FROM REOPENING DIALOGUE
// ==================================================
//
// When a dialogue/quiz closes, Enter is still being
// pressed for that frame.
//
// Wait until Enter is RELEASED before allowing another
// interaction with the Tutor.
// ==================================================

if (global.interact_blocked)
{
    if (!keyboard_check(vk_enter))
    {
        global.interact_blocked = false;
    }

    exit;
}


// ==================================================
// QUIZ ACTIVE
// ==================================================

if (quiz_active)
{
    // ==================================================
    // QUIZ FINISHED
    // ==================================================

    if (quiz_finished)
    {
        if (keyboard_check_pressed(vk_enter))
        {
            quiz_active = false;
            quiz_finished = false;

            global.dialogue_active = false;


            // Complete Tutor quest
            if (!scr_quest_done("tutoring"))
            {
                scr_complete_quest(
                    "tutoring"
                );


                scr_request_autosave(
                    "tutoring complete"
                );
            }


            // IMPORTANT:
            // Stop this Enter press from immediately
            // starting another Tutor interaction.
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


            // --------------------------------------------------
            // ALL QUESTIONS COMPLETE
            // --------------------------------------------------

            if (
                question_index
                >=
                array_length(
                    tutor_questions
                )
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
    instance_find(
        obj_player,
        0
    );


// ==================================================
// PLAYER NEAR TUTOR
// ==================================================

var _near =
    _player.bbox_right
        >=
        bbox_left
        -
        interaction_margin

    &&

    _player.bbox_left
        <=
        bbox_right
        +
        interaction_margin

    &&

    _player.bbox_bottom
        >=
        bbox_top
        -
        interaction_margin

    &&

    _player.bbox_top
        <=
        bbox_bottom
        +
        interaction_margin;


// ==================================================
// INTERACT
// ==================================================

if (
    _near
    &&
    keyboard_check_pressed(vk_enter)
)
{
    // ==================================================
    // TUTOR QUEST ALREADY FINISHED
    // ==================================================

    if (scr_quest_done("tutoring"))
    {
        dialogue_start(
            [
                {
                    speaker:
                        "Tutor",

                    text:
                        "That's all for today. Keep practising."
                },

                {
                    speaker:
                        "Muru",

                    text:
                        "Okay. Thanks."
                }
            ]
        );
    }


    // ==================================================
    // START TUTOR QUIZ
    // ==================================================

    else
    {
        quiz_active = true;
        quiz_finished = false;

        question_index = 0;
        selected_answer = 0;

        feedback_text = "";


        // Prevent player movement
        global.dialogue_active = true;
    }
}