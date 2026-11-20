// ==================================================
// GENERIC NPC - STEP
// ==================================================


// ==================================================
// PAUSE
// ==================================================

if (global.game_paused)
{
    exit;
}


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

if (global.interact_blocked)
{
    if (!keyboard_check(vk_enter))
    {
        global.interact_blocked = false;
    }

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
// INTERACTION DISTANCE
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
    // FIND CURRENT DAY
    // ==================================================

    var _day_index = 0;

    var _manager = noone;


    if (instance_exists(obj_quest_manager))
    {
        _manager =
            instance_find(
                obj_quest_manager,
                0
            );


        _day_index =
            _manager.current_day_index;
    }


    // Keep day index safe
    _day_index =
        clamp(
            _day_index,
            0,
            array_length(dialogue_sets) - 1
        );


    // ==================================================
    // CHOOSE DIALOGUE
    // ==================================================

    var _dialogue =
        dialogue_sets[
            _day_index
        ];


    // No special dialogue = use default
    if (
        array_length(_dialogue)
        <= 0
    )
    {
        _dialogue =
            default_dialogue;
    }


    // ==================================================
    // NPC PORTRAIT
    // ==================================================

    global.dialogue_portrait =
        portrait_sprite;


    // ==================================================
    // START DIALOGUE
    // ==================================================

    dialogue_start(
        _dialogue
    );


    // ==================================================
    // DAY 3 - TALK TO SOMEONE
    //
    // ANY generic NPC counts.
    // ==================================================

    if (_day_index == 2)
    {
        if (
            !scr_quest_done(
                "talk_someone_day3"
            )
        )
        {
            scr_complete_quest(
                "talk_someone_day3"
            );


            scr_request_autosave(
                "talked to someone on Day 3"
            );
        }
    }


    // ==================================================
    // OPTIONAL NPC-SPECIFIC QUEST COMPLETION
    //
    // Day 3 is handled above for every NPC.
    // ==================================================

    if (_day_index != 2)
    {
        var _quest_id =
            quest_ids[
                _day_index
            ];


        if (_quest_id != "")
        {
            scr_complete_quest(
                _quest_id
            );
        }
    }


    // ==================================================
    // DAY 4 - TALK TO TWO PEOPLE
    // ==================================================

    if (
        _day_index == 3
        &&
        _manager != noone
    )
    {
        var _already_talked =
            false;


        // Check whether this NPC already counted
        for (
            var i = 0;
            i < array_length(
                _manager.talked_npcs
            );
            i++
        )
        {
            if (
                _manager.talked_npcs[i]
                ==
                npc_name
            )
            {
                _already_talked =
                    true;

                break;
            }
        }


        // First time talking to this NPC
        if (!_already_talked)
        {
            array_push(
                _manager.talked_npcs,
                npc_name
            );


            _manager.day4_people_talked++;


            show_debug_message(
                "DAY 4 NPC TALKED: "
                + npc_name
                + " | TOTAL: "
                + string(
                    _manager.day4_people_talked
                )
            );


            // Two unique NPCs talked to
            if (
                _manager.day4_people_talked
                >= 2
            )
            {
                scr_complete_quest(
                    "talk_two_people_day4"
                );
            }
        }
    }
}