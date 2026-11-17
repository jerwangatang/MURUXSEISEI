// ==================================================
// OBJ_TUTOR - CREATE
// ==================================================


// ==================================================
// APPEARANCE
// ==================================================

sprite_index = spr_tutor;

image_index = 0;
image_speed = 0;

image_alpha = 1;
image_blend = c_white;

visible = true;


// ==================================================
// INTERACTION
// ==================================================

interaction_margin = 20;


// ==================================================
// QUIZ STATE
// ==================================================

quiz_active = false;
quiz_finished = false;
quiz_completed = false;

question_index = 0;
selected_answer = 0;

feedback_text = "";


// If this quest was already completed in a save,
// don't allow the quiz to restart.
if (instance_exists(obj_quest_manager))
{
    if (scr_quest_done("tutoring"))
    {
        quiz_completed = true;
    }
}


// ==================================================
// QUESTIONS
// ==================================================

tutor_questions = [

    {
        question:
            "What is the derivative of x?",

        answers:
        [
            "0",
            "1",
            "x"
        ],

        correct:
            1
    },


    {
        question:
            "What is the derivative of x^2?",

        answers:
        [
            "2x",
            "x",
            "2"
        ],

        correct:
            0
    },


    {
        question:
            "If 2x = 6, what is x?",

        answers:
        [
            "2",
            "3",
            "4"
        ],

        correct:
            1
    }
];