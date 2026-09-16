function dialogue_start(_lines)
{
    // Don't start another dialogue
    if (global.dialogue_active)
    {
        return;
    }


    var _dialogue = instance_create_depth(
        0,
        0,
        -9000,
        obj_dialogue
    );

    _dialogue.lines = _lines;

    _dialogue.line_index = 0;
    _dialogue.char_index = 0;

    global.dialogue_active = true;
}