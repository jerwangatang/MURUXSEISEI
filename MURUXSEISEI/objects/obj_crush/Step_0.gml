// ==================================================
// CRUSH - STEP
// ==================================================


// ==================================================
// PAUSE CHECK
// ==================================================

if (global.game_paused)
{
    exit;
}


// ==================================================
// ENTER RELEASE CHECK
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
// DIALOGUE CHECK
// ==================================================

if (global.dialogue_active)
{
    exit;
}


// ==================================================
// REQUIRED OBJECTS
// ==================================================

if (!instance_exists(obj_player))
{
    exit;
}

if (!instance_exists(obj_quest_manager))
{
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
// INTERACTION RANGE
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
// NOT INTERACTING
// ==================================================

if (!_near)
{
    exit;
}


if (!keyboard_check_pressed(vk_enter))
{
    exit;
}


// ==================================================
// DAY 4 - TALK TO CRUSH
// ==================================================

if (_day == 3)
{
    // --------------------------------------------------
    // QUEST NOT DONE
    // --------------------------------------------------

    if (!scr_quest_done("talk_crush_day4"))
    {
        dialogue_start(
            [
                {
                    speaker: "Crush",
                    text: "Hey, Muru."
                },

                {
                    speaker: "Muru",
                    text: "Oh... hey."
                },

                {
                    speaker: "Crush",
                    text: "How was your day?"
                },

                {
                    speaker: "Muru",
                    text: "It was okay."
                },

                {
                    speaker: "Crush",
                    text: "I'll see you around."
                },

                {
                    speaker: "Muru",
                    text: "Yeah... see you."
                }
            ]
        );


        scr_complete_quest(
            "talk_crush_day4"
        );


        scr_request_autosave(
            "talked to crush"
        );
    }


    // --------------------------------------------------
    // ALREADY TALKED
    // --------------------------------------------------

    else
    {
        dialogue_start(
            [
                {
                    speaker: "Crush",
                    text: "Hey again."
                },

                {
                    speaker: "Muru",
                    text: "Hey."
                }
            ]
        );
    }


    global.interact_blocked = true;

    exit;
}


// ==================================================
// DAY 5 - ASK CRUSH OUT
// ==================================================

if (_day == 4)
{
    // ==================================================
    // COURAGE MINIGAME NOT FINISHED
    // ==================================================

    if (!scr_quest_done("courage_minigame"))
    {
        dialogue_start(
            [
                {
                    speaker: "Muru",
                    text: "I want to say something..."
                },

                {
                    speaker: "Muru",
                    text: "But I'm too nervous."
                },

                {
                    speaker: "Muru",
                    text: "Maybe I should calm myself down first."
                }
            ]
        );


        global.interact_blocked = true;

        exit;
    }


    // ==================================================
    // ALREADY ASKED
    // ==================================================

    if (scr_quest_done("ask_crush"))
    {
        dialogue_start(
            [
                {
                    speaker: "Crush",
                    text: "I'm glad you talked to me."
                },

                {
                    speaker: "Muru",
                    text: "Me too."
                }
            ]
        );


        global.interact_blocked = true;

        exit;
    }


    // ==================================================
    // ASK CRUSH OUT
    // ==================================================

    dialogue_start(
        [
            {
                speaker: "Muru",
                text: "Hey... can I ask you something?"
            },

            {
                speaker: "Crush",
                text: "Sure."
            },

            {
                speaker: "Muru",
                text: "Would you want to hang out sometime?"
            },

            {
                speaker: "Crush",
                text: "Yeah. I'd like that."
            },

            {
                speaker: "Muru",
                text: "Really?"
            },

            {
                speaker: "Crush",
                text: "Really."
            },

            {
                speaker: "Muru",
                text: "Okay... I'm glad I asked."
            }
        ]
    );


    scr_complete_quest(
        "ask_crush"
    );


    scr_request_autosave(
        "asked crush out"
    );


    global.interact_blocked = true;

    exit;
}


// ==================================================
// DAYS 1-3
// NORMAL DIALOGUE
// ==================================================

dialogue_start(
    [
        {
            speaker: "Crush",
            text: "Hey."
        },

        {
            speaker: "Muru",
            text: "Hey."
        }
    ]
);


global.interact_blocked = true;