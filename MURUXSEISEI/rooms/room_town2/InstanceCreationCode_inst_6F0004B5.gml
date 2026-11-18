// ==================================================
// TEACHER APPEARANCE
// ==================================================

sprite_index = spr_teacher;

image_index = 0;
image_speed = 0;

image_xscale = 0.045;
image_yscale = 0.045;

image_alpha = 1;
image_blend = c_white;


// ==================================================
// NPC IDENTITY
// ==================================================

npc_name = "Teacher";

default_dialogue = [
    {
        speaker: "Teacher",
        text: "Don't forget your schoolwork."
    }
];


// ==================================================
// DAY 3
// ==================================================

dialogue_sets[2] = [
    {
        speaker: "Teacher",
        text: "Muru, make sure you're keeping up with your work."
    },

    {
        speaker: "Muru",
        text: "I will."
    }
];


// ==================================================
// DAY 4
// ==================================================

dialogue_sets[3] = [
    {
        speaker: "Teacher",
        text: "You seem distracted today."
    },

    {
        speaker: "Muru",
        text: "Sorry."
    },

    {
        speaker: "Teacher",
        text: "Just do what you can."
    }
];


// ==================================================
// DAY 5
// ==================================================

dialogue_sets[4] = [
    {
        speaker: "Teacher",
        text: "Good work today, Muru."
    },

    {
        speaker: "Muru",
        text: "Thank you."
    }
];