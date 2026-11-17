// ==================================================
// DIALOGUE - STEP
// ==================================================


// ==================================================
// PAUSE
// ==================================================

if (global.game_paused)
{
    exit;
}


// ==================================================
// NOTHING TO DISPLAY
// ==================================================

if (array_length(lines) == 0)
{
    exit;
}


// ==================================================
// CURRENT LINE
// ==================================================

var _line =
    lines[line_index];


var _full_text =
    _line.text;


var _text_length =
    string_length(
        _full_text
    );


// ==================================================
// TYPEWRITER EFFECT
// ==================================================

if (char_index < _text_length)
{
    char_index =
        min(
            char_index + text_speed,
            _text_length
        );


    // Enter / Space instantly finishes line
    if (
        keyboard_check_pressed(vk_enter)
        ||
        keyboard_check_pressed(vk_space)
    )
    {
        char_index =
            _text_length;
    }
}


// ==================================================
// ADVANCE DIALOGUE
// ==================================================

else
{
    if (
        keyboard_check_pressed(vk_enter)
        ||
        keyboard_check_pressed(vk_space)
    )
    {
        line_index++;


        // ==================================================
        // DIALOGUE FINISHED
        // ==================================================

        if (
            line_index
            >=
            array_length(lines)
        )
        {
            global.dialogue_active =
                false;


            // Stop same Enter press from
            // reopening dialogue
            global.interact_blocked =
                true;


            // Reset portrait hiding so the next
            // normal character shows the X portrait
            global.hide_npc_portrait =
                false;


            instance_destroy();
        }


        // ==================================================
        // NEXT LINE
        // ==================================================

        else
        {
            char_index =
                0;
        }
    }
}