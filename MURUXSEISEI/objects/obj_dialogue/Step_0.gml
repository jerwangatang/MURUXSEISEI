// ==================================================
// DIALOGUE - STEP
// ==================================================

// Freeze dialogue while pause menu is open
if (global.game_paused)
{
    exit;
}


// Nothing to display
if (array_length(lines) == 0)
{
    exit;
}


// Current dialogue line
var _line = lines[line_index];

var _full_text = _line.text;
var _text_length = string_length(_full_text);


// --------------------------------------------------
// TYPEWRITER EFFECT
// --------------------------------------------------

if (char_index < _text_length)
{
    char_index = min(
        char_index + text_speed,
        _text_length
    );


    // Press Enter / Space to instantly finish line
    if (keyboard_check_pressed(vk_enter)
    || keyboard_check_pressed(vk_space))
    {
        char_index = _text_length;
    }
}


// --------------------------------------------------
// ADVANCE DIALOGUE
// --------------------------------------------------

else
{
    if (keyboard_check_pressed(vk_enter)
    || keyboard_check_pressed(vk_space))
    {
        line_index++;

        // Dialogue finished
        if (line_index >= array_length(lines))
        {
            global.dialogue_active = false;
			// Stop the same Enter press from reopening dialogue
			global.interact_blocked = true;
            instance_destroy();
        }
        else
        {
            // Start typing next line
            char_index = 0;
        }
    }
}