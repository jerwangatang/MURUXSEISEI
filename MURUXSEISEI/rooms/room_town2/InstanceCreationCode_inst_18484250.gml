// ==================================================
// STUDENT NPC - CREATION CODE
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

npc_name = "Student";

interaction_margin = 24;


// ==================================================
// DEFAULT DIALOGUE
// ==================================================

default_dialogue = [
    {
        speaker: "Student",
        text: "Hey."
    },

    {
        speaker: "Muru",
        text: "Hi."
    }
];


// ==================================================
// DAY 3
// ==================================================

dialogue_sets[2] = [
    {
        speaker: "Student",
        text: "It's pretty busy around here today."
    },

    {
        speaker: "Muru",
        text: "Yeah."
    },

    {
        speaker: "Student",
        text: "I guess everyone had somewhere to be."
    }
];


// ==================================================
// DAY 4
// ==================================================

dialogue_sets[3] = [
    {
        speaker: "Student",
        text: "Hey, you alright?"
    },

    {
        speaker: "Muru",
        text: "I'm fine."
    },

    {
        speaker: "Student",
        text: "...Okay."
    }
];


// ==================================================
// DAY 5
// HELP SOMEONE
// ==================================================

dialogue_sets[4] = [
    {
        speaker: "Student",
        text: "Oh no..."
    },

    {
        speaker: "Muru",
        text: "What's wrong?"
    },

    {
        speaker: "Student",
        text: "I dropped all my notes."
    },

    {
        speaker: "Muru",
        text: "I'll help you pick them up."
    },

    {
        speaker: "Student",
        text: "Really? Thanks."
    },

    {
        speaker: "Muru",
        text: "It's okay."
    },

    {
        speaker: "Student",
        text: "Thanks, Muru. I really appreciate it."
    }
];


// ==================================================
// QUEST COMPLETION
// ==================================================

quest_ids[4] = "help_someone_day5";