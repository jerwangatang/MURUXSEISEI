// ==================================================
// OBJ_TUTOR - DRAW GUI
// ==================================================

if (!quiz_active)
{
    exit;
}


// ==================================================
// GUI SIZE
// ==================================================

var _gui_w =
    display_get_gui_width();

var _gui_h =
    display_get_gui_height();


// ==================================================
// DIALOGUE BOX
// ==================================================

var _box_x = 80;

var _box_y =
    _gui_h - 300;

var _box_w =
    _gui_w - 160;

var _box_h =
    240;


// ==================================================
// BACKGROUND
// ==================================================

draw_set_colour(c_black);
draw_set_alpha(0.88);


draw_rectangle(
    _box_x,
    _box_y,
    _box_x + _box_w,
    _box_y + _box_h,
    false
);


draw_set_alpha(1);


// ==================================================
// TUTOR PORTRAIT
// ==================================================

var _portrait =
    spr_npc_portrait;


var _sprite_w =
    sprite_get_width(
        _portrait
    );

var _sprite_h =
    sprite_get_height(
        _portrait
    );


var _max_w = 125;
var _max_h = 125;


var _scale =
    min(
        _max_w / _sprite_w,
        _max_h / _sprite_h
    );


var _portrait_w =
    _sprite_w
    *
    _scale;

var _portrait_h =
    _sprite_h
    *
    _scale;


var _portrait_x =
    _box_x + 15;

var _portrait_y =
    _box_y + 25;


draw_set_colour(c_white);


draw_sprite_stretched(
    _portrait,
    0,
    _portrait_x,
    _portrait_y,
    _portrait_w,
    _portrait_h
);


// ==================================================
// TEXT AREA
// ==================================================

var _text_x =
    _box_x + 165;


draw_set_halign(fa_left);
draw_set_valign(fa_top);


// ==================================================
// FINAL MESSAGE
// ==================================================

if (quiz_finished)
{
    draw_set_colour(c_white);


    draw_text(
        _text_x,
        _box_y + 20,
        "Tutor"
    );


    draw_text(
        _text_x,
        _box_y + 60,
        "That's enough for today. You did well."
    );


    draw_set_colour(c_yellow);


    draw_text(
        _text_x,
        _box_y + 130,
        "Press Enter"
    );
}


// ==================================================
// QUESTION
// ==================================================

else
{
    var _question =
        tutor_questions[
            question_index
        ];


    // --------------------------------------------------
    // SPEAKER
    // --------------------------------------------------

    draw_set_colour(c_white);


    draw_text(
        _text_x,
        _box_y + 15,
        "Tutor"
    );


    // --------------------------------------------------
    // QUESTION NUMBER
    // --------------------------------------------------

    draw_set_colour(c_ltgray);


    draw_text(
        _text_x,
        _box_y + 45,
        "Question "
        +
        string(
            question_index + 1
        )
        +
        " / "
        +
        string(
            array_length(
                tutor_questions
            )
        )
    );


    // --------------------------------------------------
    // QUESTION TEXT
    // --------------------------------------------------

    draw_set_colour(c_white);


    draw_text(
        _text_x,
        _box_y + 75,
        _question.question
    );


    // ==================================================
    // ANSWERS
    // ==================================================

    var _answer_y =
        _box_y + 110;


    for (
        var i = 0;
        i < array_length(
            _question.answers
        );
        i++
    )
    {
        // Selected answer
        if (i == selected_answer)
        {
            draw_set_colour(
                c_yellow
            );


            draw_text(
                _text_x,
                _answer_y,
                "> "
                +
                _question.answers[i]
            );
        }


        // Normal answer
        else
        {
            draw_set_colour(
                c_white
            );


            draw_text(
                _text_x,
                _answer_y,
                "  "
                +
                _question.answers[i]
            );
        }


        _answer_y += 27;
    }


    // ==================================================
    // FEEDBACK
    // ==================================================

    if (feedback_text != "")
    {
        draw_set_colour(c_red);


        draw_text(
            _text_x + 300,
            _box_y + 165,
            feedback_text
        );
    }


    // ==================================================
    // CONTROLS
    // ==================================================

    draw_set_colour(c_ltgray);


    draw_text(
        _text_x + 300,
        _box_y + 195,
        "W / S: Select    Enter: Confirm"
    );
}


// ==================================================
// RESET DRAW SETTINGS
// ==================================================

draw_set_colour(c_white);
draw_set_alpha(1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);