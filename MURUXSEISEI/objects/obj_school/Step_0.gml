// ==================================================
// SCHOOL - STEP
// ==================================================


// ==================================================
// PAUSE
// ==================================================

if (global.game_paused)
{
    can_interact = false;
    exit;
}


// ==================================================
// DIALOGUE
// ==================================================

if (global.dialogue_active)
{
    can_interact = false;
    exit;
}


// ==================================================
// WAIT FOR ENTER RELEASE
// ==================================================

if (global.interact_blocked)
{
    if (!keyboard_check(vk_enter))
    {
        global.interact_blocked = false;
    }

    can_interact = false;

    exit;
}


// ==================================================
// REQUIRED OBJECTS
// ==================================================

if (
    !instance_exists(obj_player)
    ||
    !instance_exists(obj_quest_manager)
)
{
    can_interact = false;
    exit;
}


var _player =
    instance_find(
        obj_player,
        0
    );


var _manager =
    instance_find(
        obj_quest_manager,
        0
    );


var _day =
    _manager.current_day_index;


// ==================================================
// PLAYER NEAR SCHOOL
// ==================================================

var _near =
    _player.bbox_right
        >= bbox_left - interaction_margin
    &&
    _player.bbox_left
        <= bbox_right + interaction_margin
    &&
    _player.bbox_bottom
        >= bbox_top - interaction_margin
    &&
    _player.bbox_top
        <= bbox_bottom + interaction_margin;


can_interact =
    _near;


// ==================================================
// INTERACTION
// ==================================================

if (
    can_interact
    &&
    keyboard_check_pressed(vk_enter)
)
{
    // ==================================================
    // DAY 3
    // ==================================================

    if (_day == 2)
    {
        if (!scr_quest_done("school_day3"))
        {
            scr_complete_quest(
                "school_day3"
            );

            dialogue_start([
                {
                    speaker: "Muru",
                    text: "I made it through school today."
                }
            ]);
        }
        else
        {
            dialogue_start([
                {
                    speaker: "Muru",
                    text: "I've already been to school today."
                }
            ]);
        }

        exit;
    }


    // ==================================================
    // DAY 4
    // ==================================================

    if (_day == 3)
    {
        if (!scr_quest_done("school_day4"))
        {
            scr_complete_quest(
                "school_day4"
            );

            dialogue_start([
                {
                    speaker: "Muru",
                    text: "Another school day finished."
                }
            ]);
        }
        else
        {
            dialogue_start([
                {
                    speaker: "Muru",
                    text: "I've already been to school today."
                }
            ]);
        }

        exit;
    }


    // ==================================================
    // DAY 5
    // ==================================================

    if (_day == 4)
    {
        if (!scr_quest_done("school_day5"))
        {
            scr_complete_quest(
                "school_day5"
            );

            dialogue_start([
                {
                    speaker: "Muru",
                    text: "That's school finished for today."
                }
            ]);
        }
        else
        {
            dialogue_start([
                {
                    speaker: "Muru",
                    text: "I've already been to school today."
                }
            ]);
        }

        exit;
    }


    // ==================================================
    // OTHER DAYS
    // ==================================================

    dialogue_start([
        {
            speaker: "Muru",
            text: "Not today."
        }
    ]);
}