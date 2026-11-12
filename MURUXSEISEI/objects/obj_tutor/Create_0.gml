// ==================================================
// OBJ_TUTOR - CREATE EVENT
// ==================================================


// --------------------------------------------------
// INTERACTION SETTINGS
// --------------------------------------------------

interaction_margin = 20;


// --------------------------------------------------
// DIALOGUE
// --------------------------------------------------

dialogue_lines = [
    {
        speaker: "Tutor",
        text: "Let's go through today's work."
    },

    {
        speaker: "Muru",
        text: "Okay..."
    },

    {
        speaker: "Tutor",
        text: "That's enough for today."
    }
];


// ==================================================
// DEBUG
// ==================================================

show_debug_message(
    "TUTOR CREATED"
    + " | room = " + room_get_name(room)
    + " | x = " + string(x)
    + " | y = " + string(y)
);