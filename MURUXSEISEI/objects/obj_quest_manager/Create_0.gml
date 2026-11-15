// ==================================================
// QUEST MANAGER - CREATE
// 5-DAY VERSION
// ==================================================

current_day_index = 0;


// ==================================================
// COINS
// Don't overwrite loaded coins
// ==================================================

if (!variable_global_exists("coins"))
{
    global.coins = 50;
}


// ==================================================
// DAYS
// ==================================================

days = [];


// ==================================================
// DAY 1 - MISERDAY - TOWN 1
// Partner
// ==================================================

array_push(days, {
    day_name: "Miserday",

    quests: [
        {
            id: "cocos_minigame",
            name: "Play at Coco's Amusement",
            done: false
        },

        {
            id: "tutoring",
            name: "Finish tutoring",
            done: false
        },

        {
            id: "homework_half",
            name: "Do half of the homework",
            done: false
        },

        {
            id: "explore_houses",
            name: "Explore the town buildings",
            done: false
        },

        {
            id: "feed_birds",
            name: "Feed the birds",
            done: false
        }
    ]
});


// ==================================================
// DAY 2 - TERRIBLEDAY - TOWN 1
// Partner
// ==================================================

array_push(days, {
    day_name: "Terribleday",

    quests: [
        {
            id: "talk_neighbour",
            name: "Talk to neighbour",
            done: false
        },

        {
            id: "cocos_minigame_day2",
            name: "Play at Coco's Amusement",
            done: false
        },

        {
            id: "finish_tutor_homework",
            name: "Finish the tutoring homework",
            done: false
        },

        {
            id: "make_dinner_day2",
            name: "Make dinner for your family",
            done: false
        }
    ]
});


// ==================================================
// DAY 3 - WEEPDAY - TOWN 2
// Partner
// ==================================================

array_push(days, {
    day_name: "Weepday",

    quests: [
        {
            id: "apologise_tutor",
            name: "Say sorry about news to tutor",
            done: false
        },

        {
            id: "school_day3",
            name: "Go to school",
            done: false
        },

        {
            id: "talk_someone_day3",
            name: "Talk to someone",
            done: false
        },

        {
            id: "clockzone_games",
            name: "Play games in Clockzone",
            done: false
        },

        {
            id: "explore_town2",
            name: "Explore the new town",
            done: false
        },

        {
            id: "fishing_pond_day3",
            name: "Go fishing in the pond",
            done: false
        },

        {
            id: "finish_homework_day3",
            name: "Finish homework",
            done: false
        }
    ]
});


// ==================================================
// DAY 4 - THROBDAY - TOWN 2
// YOUR DAY
//
// Emotional purpose:
// anxiety reaches its highest point
// ==================================================

array_push(days, {
    day_name: "Throbday",

    quests: [
        {
            id: "school_day4",
            name: "Go to school",
            done: false
        },

        {
            id: "talk_two_people_day4",
            name: "Talk to two people",
            done: false
        },

        {
            id: "make_friend_day4",
            name: "Try to make a friend",
            done: false
        },

        {
            id: "basketball_game",
            name: "Play basketball",
            done: false
        },

        {
            id: "clockzone_day4",
            name: "Visit Clockzone",
            done: false
        },

        {
            id: "talk_crush_day4",
            name: "Talk to your crush",
            done: false
        }
    ]
});


// ==================================================
// DAY 5 - MOTIVEDAY - TOWN 2
// YOUR FINAL DAY
//
// Emotional purpose:
// Muru is still anxious,
// but decides to act anyway.
// ==================================================

array_push(days, {
    day_name: "Motiveday",

    quests: [
        {
            id: "school_day5",
            name: "Go to school",
            done: false
        },

        {
            id: "talk_friend_day5",
            name: "Talk to your friend",
            done: false
        },

        {
            id: "help_someone_day5",
            name: "Help someone in town",
            done: false
        },

        {
            id: "relativemart_day5",
            name: "Visit RelativeMart",
            done: false
        },

        {
            id: "courage_minigame",
            name: "Build up your courage",
            done: false
        },

        {
            id: "ask_crush",
            name: "Ask out your crush",
            done: false
        }
    ]
});


// ==================================================
// DAY 1 - HOMEWORK PROGRESS
// ==================================================

homework_progress = 0;
homework_total = 4;


// ==================================================
// DAY 1 - HOUSE EXPLORATION
// ==================================================

house_ids = [
    "muru",
    "neighbour",
    "tutor"
];


// Muru starts in her own house
house_visited = [
    true,
    false,
    false
];


// ==================================================
// DAY 4 - NPC TALK PROGRESS
// ==================================================

day4_people_talked = 0;


// ==================================================
// GENERAL NPC TRACKING
// ==================================================

talked_npcs = [];