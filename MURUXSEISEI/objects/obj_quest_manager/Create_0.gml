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
// DAY 1 - MISERDAY
// TOWN 1
// ==================================================

array_push(days,
{
    day_name: "Miserday",

    quests:
    [
        {
            id: "cocos_minigame",
            name: "Play a game at Coco's Amusement",
            done: false
        },

        {
            id: "tutoring",
            name: "Finish tutoring",
            done: false
        },

        {
            id: "homework_half",
            name: "Do half of your homework",
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
// DAY 2 - TERRIBLEDAY
// TOWN 1
// ==================================================

array_push(days,
{
    day_name: "Terribleday",

    quests:
    [
        {
            id: "talk_neighbour",
            name: "Talk to your neighbour",
            done: false
        },

        {
            id: "cocos_minigame_day2",
            name: "Play another game at Coco's",
            done: false
        },

        {
            id: "finish_tutor_homework",
            name: "Finish your tutoring homework",
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
// DAY 3 - WEEPDAY
// TOWN 2
// ==================================================

array_push(days,
{
    day_name: "Weepday",

    quests:
    [
        {
            id: "apologise_tutor",
            name: "Apologise to your tutor",
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
            name: "Play a game at Clockzone",
            done: false
        },

        {
            id: "explore_town2",
            name: "Explore the new town",
            done: false
        },

        {
            id: "fishing_pond_day3",
            name: "Go fishing at the pond",
            done: false
        },

        {
            id: "finish_homework_day3",
            name: "Finish your homework",
            done: false
        }
    ]
});


// ==================================================
// DAY 4 - THROBDAY
// TOWN 2
// ==================================================

array_push(days,
{
    day_name: "Throbday",

    quests:
    [
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
            name: "Play a game at Clockzone",
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
// DAY 5 - MOTIVEDAY
// TOWN 2
// ==================================================

array_push(days,
{
    day_name: "Motiveday",

    quests:
    [
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
// DAY 1 / DAY 3 - HOMEWORK PROGRESS
// ==================================================

homework_progress = 0;
homework_total = 4;


// ==================================================
// DAY 1 - HOUSE EXPLORATION
// ==================================================

house_ids =
[
    "muru",
    "neighbour",
    "tutor"
];


// Muru starts inside her own house
house_visited =
[
    true,
    false,
    false
];


// ==================================================
// DAY 4 - TALK TO TWO PEOPLE
// ==================================================

day4_people_talked = 0;


// ==================================================
// GENERAL NPC TRACKING
//
// Prevents the same NPC from counting twice
// for the Day 4 talk quest.
// ==================================================

talked_npcs = [];


// ==================================================
// SHARED ARCADE RETURN ROOM
//
// Town 1 = Coco's
// Town 2 = Clockzone
// ==================================================

if (!variable_global_exists("arcade_return_room"))
{
    global.arcade_return_room =
        room_town1;
}


// ==================================================
// SHARED SHOP RETURN ROOM
//
// Town 1 = 8/11
// Town 2 = RelativeMart
// ==================================================

if (!variable_global_exists("shop_return_room"))
{
    global.shop_return_room =
        room_town1;
}


// ==================================================
// INTERACTION BLOCK SAFETY
// ==================================================

if (!variable_global_exists("interact_blocked"))
{
    global.interact_blocked = false;
}