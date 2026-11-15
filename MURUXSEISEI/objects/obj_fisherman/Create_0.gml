// ==================================================
// FISHERMAN - CREATE
// ==================================================

// Run generic NPC setup
event_inherited();


// ==================================================
// FISHERMAN SETTINGS
// ==================================================

npc_name = "Fisherman";

interaction_margin = 24;

// Coins earned per fish
fish_price = 5;


// ==================================================
// DIALOGUE
// ==================================================

dialogue_no_fish = [
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
];