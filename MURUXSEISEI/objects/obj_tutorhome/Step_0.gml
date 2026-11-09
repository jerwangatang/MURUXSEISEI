// ==================================================
// TUTOR HOUSE - STEP
// ==================================================

if (global.game_paused)
{
    exit;
}

if (global.dialogue_active)
{
    exit;
}

if (!instance_exists(obj_player))
{
    exit;
}

if (!instance_exists(obj_quest_manager))
{
    exit;
}


var _manager =
    instance_find(obj_quest_manager, 0);


// Miserday only
if (_manager.current_day_index != 0)
{
    exit;
}


var _player =
    instance_find(obj_player, 0);


// ==================================================
// PLAYER NEAR BUILDING
// ==================================================

var _margin = 35;

var _near =
    _player.bbox_right
        >= bbox_left - _margin
    &&
    _player.bbox_left
        <= bbox_right + _margin
    &&
    _player.bbox_bottom
        >= bbox_top - _margin
    &&
    _player.bbox_top
        <= bbox_bottom + _margin;


// ==================================================
// INTERACTION
// ==================================================

if (_near)
{
    // Counts toward exploring buildings
    scr_visit_house("tutor");


    // Tutoring quest
    if (
        keyboard_check_pressed(vk_enter)
        &&
        !scr_quest_done("tutoring")
    )
    {
        scr_complete_quest(
            "tutoring"
        );


        dialogue_start([
            {
                speaker: "Tutor",
                text: "That will do for today."
            },

            {
                speaker: "Muru",
                text: "Okay. Thank you."
            }
        ]);
    }
}