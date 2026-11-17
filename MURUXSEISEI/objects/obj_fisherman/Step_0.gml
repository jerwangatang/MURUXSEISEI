// ==================================================
// FISHERMAN - STEP
// ==================================================


// ==================================================
// PAUSE / DIALOGUE
// ==================================================

if (global.game_paused)
{
    exit;
}

if (global.dialogue_active)
{
    exit;
}


// ==================================================
// WAIT FOR ENTER TO BE RELEASED AFTER OLD DIALOGUE
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
// CHECK DISTANCE
// ==================================================

var _near =
    _player.bbox_right >= bbox_left - interaction_margin
    &&
    _player.bbox_left <= bbox_right + interaction_margin
    &&
    _player.bbox_bottom >= bbox_top - interaction_margin
    &&
    _player.bbox_top <= bbox_bottom + interaction_margin;


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
    // HOTBAR CHECK
    // ==================================================

    if (!instance_exists(obj_hotbar))
    {
        // Fisherman uses generic X portrait
        global.dialogue_portrait =
            spr_npc_portrait;


        dialogue_start([
            {
                speaker: "Fisherman",
                text: "Hmm... I can't see your bag."
            }
        ]);


        exit;
    }


    var _hotbar =
        instance_find(
            obj_hotbar,
            0
        );


    // ==================================================
    // COUNT ALL FISH
    // ==================================================

    var _fish_count = 0;


    for (
        var i = 0;
        i < _hotbar.slot_count;
        i++
    )
    {
        if (
            _hotbar.hotbar[i].item_name == "Fish"
            &&
            _hotbar.hotbar[i].amount > 0
        )
        {
            _fish_count +=
                _hotbar.hotbar[i].amount;
        }
    }


    // ==================================================
    // NO FISH
    // ==================================================

    if (_fish_count <= 0)
    {
        // Fisherman uses generic X portrait
        global.dialogue_portrait =
            spr_npc_portrait;


        dialogue_start([
            {
                speaker: "Fisherman",
                text: "Got any fish for me?"
            },

            {
                speaker: "Muru",
                text: "Not right now."
            },

            {
                speaker: "Fisherman",
                text: "Come back if you catch anything."
            }
        ]);


        exit;
    }


    // ==================================================
    // CALCULATE SALE
    // ==================================================

    var _money =
        _fish_count
        *
        fish_price;


    // ==================================================
    // CREATE SALE DIALOGUE
    // ==================================================

    var _sale_dialogue = [
        {
            speaker: "Fisherman",

            text:
                "Oh, nice! You caught "
                + string(_fish_count)
                + " fish."
        },

        {
            speaker: "Fisherman",

            text:
                "I'll give you "
                + string(_money)
                + " coins for them."
        },

        {
            speaker: "Muru",
            text: "Sure."
        },

        {
            speaker: "Fisherman",
            text: "Pleasure doing business with you!"
        }
    ];


    // ==================================================
    // PORTRAIT
    // ==================================================

    global.dialogue_portrait =
        spr_npc_portrait;


    // ==================================================
    // START DIALOGUE
    // ==================================================

    dialogue_start(
        _sale_dialogue
    );


    // ==================================================
    // ADD COINS
    // ==================================================

    global.coins +=
        _money;


    // ==================================================
    // REMOVE ALL FISH
    // ==================================================

    for (
        var i = 0;
        i < _hotbar.slot_count;
        i++
    )
    {
        if (
            _hotbar.hotbar[i].item_name == "Fish"
        )
        {
            _hotbar.hotbar[i].item_name =
                "";

            _hotbar.hotbar[i].amount =
                0;
        }
    }


    // ==================================================
    // AUTOSAVE
    // ==================================================

    scr_request_autosave(
        "fish sold"
    );


    // ==================================================
    // DEBUG
    // ==================================================

    show_debug_message(
        "FISH SOLD: "
        + string(_fish_count)
        + " | COINS EARNED: "
        + string(_money)
    );
}