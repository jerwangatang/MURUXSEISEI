// ==================================================
// CLASSMATE NPC - CREATION CODE
// ==================================================


// ==================================================
// APPEARANCE
// ==================================================

sprite_index = spr_npc;

image_index = 0;
image_speed = 0;

image_xscale = 0.045;
image_yscale = 0.045;

image_alpha = 1;
image_blend = c_white;


// ==================================================
// NPC IDENTITY
// ==================================================

npc_name = "Classmate";

interaction_margin = 24;


// ==================================================
// DEFAULT DIALOGUE
// ==================================================

default_dialogue = [
    {
        speaker: "Classmate",
        text: "Hey, Muru."
    },

    {
        speaker: "Muru",
        text: "Hey."
    }
];


// ==================================================
// DAY 3
// Talk to someone
// ==================================================

dialogue_sets[2] = [
    {
        speaker: "Classmate",
        text: "Hey, Muru. You seem quieter than usual today."
    },

    {
        speaker: "Muru",
        text: "I'm just tired."
    },

    {
        speaker: "Classmate",
        text: "Oh... okay. See you around."
    },

    {
        speaker: "Muru",
        text: "Yeah. See you."
    }
];


// ==================================================
// DAY 4
// Try to make a friend
// ==================================================

dialogue_sets[3] = [
    {
        speaker: "Classmate",
        text: "Hey... are you okay?"
    },

    {
        speaker: "Muru",
        text: "I don't really know."
    },

    {
        speaker: "Classmate",
        text: "That's okay. You don't have to know."
    },

    {
        speaker: "Muru",
        text: "..."
    },

    {
        speaker: "Classmate",
        text: "Do you want to hang out for a bit?"
    },

    {
        speaker: "Muru",
        text: "Yeah... I'd like that."
    }
];


// ==================================================
// DAY 5
// Talk to your friend
// ==================================================

dialogue_sets[4] = [
    {
        speaker: "Classmate",
        text: "Morning, Muru."
    },

    {
        speaker: "Muru",
        text: "Morning."
    },

    {
        speaker: "Classmate",
        text: "You look a little better today."
    },

    {
        speaker: "Muru",
        text: "I think I feel a little better."
    },

    {
        speaker: "Classmate",
        text: "That's good."
    },

    {
        speaker: "Muru",
        text: "Thanks for talking to me yesterday."
    },

    {
        speaker: "Classmate",
        text: "Anytime."
    }
];


// ==================================================
// QUEST COMPLETION
// ==================================================

// Day 3 - Talk to someone
quest_ids[2] = "talk_someone_day3";

// Day 4 - Try to make a friend
quest_ids[3] = "make_friend_day4";

// Day 5 - Talk to your friend
quest_ids[4] = "talk_friend_day5";