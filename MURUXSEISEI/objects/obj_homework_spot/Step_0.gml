// ==================================================
// HOMEWORK SPOT - STEP
// ==================================================


// ==================================================
// SAFETY VARIABLES
// ==================================================

if (!variable_instance_exists(id, "was_dialogue_active"))
{
    was_dialogue_active = false;
}

if (!variable_instance_exists(id, "enter_release_block"))
{
    enter_release_block = false;
}


// ==================================================
// PAUSE CHECK
// ==================================================

if (global.game_paused)
{
    exit;
}


// ==================================================
// DETECT DIALOGUE CLOSING
// ==================================================

if (
    was_dialogue_active
    &&
    !global.dialogue_active
)
{
    // Dialogue just closed.
    // Don't let the same Enter press
    // immediately start it again.
    enter_release_block = true;
}


// Remember dialogue state
was_dialogue_active =
    global.dialogue_active;


// ==================================================
// DIALOGUE ACTIVE
// ==================================================

if (global.dialogue_active)
{
    exit;
}


// ==================================================
// WAIT FOR ENTER RELEASE
// ==================================================

if (enter_release_block)
{
    if (!keyboard_check(vk_enter))
    {
        enter_release_block = false;
    }

    exit;
}


// ==================================================
// PLAYER / QUEST MANAGER CHECK
// ==================================================

if (
    !instance_exists(obj_player)
    ||
    !instance_exists(obj_quest_manager)
)
{
    exit;
}


var _manager =
    instance_find(
        obj_quest_manager,
        0
    );

var _day =
    _manager.current_day_index;


// ==================================================
// PLAYER INTERACTION
// ==================================================

if (
    place_meeting(
        x,
        y,
        obj_player
    )
    &&
    keyboard_check_pressed(vk_enter)
)
{
    // ==================================================
    // NOT DAY 2
    // ==================================================

    if (_day != 1)
    {
        dialogue_start([
            {
                speaker: "Muru",
                text: "Not today."
            }
        ]);

        exit;
    }


    // ==================================================
    // DAY 2 - FINISH ALL HOMEWORK
    // ==================================================

    if (
        _manager.homework_progress
        <
        _manager.homework_total
    )
    {
        // Finish all homework
        _manager.homework_progress =
            _manager.homework_total;


        // Complete quest
        scr_complete_quest(
            "homework_half"
        );


        // Autosave
        scr_request_autosave(
            "finished homework"
        );


        // Dialogue
        dialogue_start([
            {
                speaker: "Muru",
                text: "Finally... I finished all my homework."
            }
        ]);

        exit;
    }


    // ==================================================
    // DAY 2 - ALREADY FINISHED
    // ==================================================

    dialogue_start([
        {
            speaker: "Muru",
            text: "I've already finished my homework."
        }
    ]);
}