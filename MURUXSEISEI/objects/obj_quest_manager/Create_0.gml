// ==================================================
// QUEST MANAGER - CREATE
// ==================================================

current_day_index = 0;

days = [];


// ==================================================
// MISERDAY - TOWN 1
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
// TERRIBLEDAY - TOWN 1
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
// WEEPDAY - TOWN 2
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
// THROBDAY - TOWN 2
// ==================================================

array_push(days, {
    day_name: "Throbday",

    quests: [
        {
            id: "talk_two_neighbours",
            name: "Talk to two neighbours",
            done: false
        },

        {
            id: "school_day4",
            name: "Go to school",
            done: false
        },

        {
            id: "make_friend_day4",
            name: "Try make a friend",
            done: false
        },

        {
            id: "basketball_game",
            name: "Attend the basketball game",
            done: false
        },

        {
            id: "arcade_day4",
            name: "Go to Clockzone/Coco's Amusement",
            done: false
        },

        {
            id: "lebron_signature",
            name: "Try to get Lebron's signature",
            done: false
        }
    ]
});


// ==================================================
// FOLKDAY - TOWN 3
// ==================================================

array_push(days, {
    day_name: "Folkday",

    quests: [
        {
            id: "explore_folk_valley",
            name: "Explore Folk Valley",
            done: false
        },

        {
            id: "feed_pigeons",
            name: "Feed pigeons at the run down park",
            done: false
        },

        {
            id: "school_day5",
            name: "Go to school",
            done: false
        },

        {
            id: "grab_food_day5",
            name: "Grab some food",
            done: false
        },

        {
            id: "visit_barber",
            name: "Visit the barber",
            done: false
        },

        {
            id: "townheroes_pool",
            name: "Play pool in Townheroes",
            done: false
        },

        {
            id: "make_dinner_day5",
            name: "Make dinner for family",
            done: false
        }
    ]
});


// ==================================================
// SATIREDAY - TOWN 3
// ==================================================

array_push(days, {
    day_name: "Satireday",

    quests: [
        {
            id: "cemetery_respects",
            name: "Pay respects at cemetery",
            done: false
        },

        {
            id: "pond_fishing_day6",
            name: "Go to the pond to go fishing",
            done: false
        },

        {
            id: "make_friend_day6",
            name: "Try to make a friend",
            done: false
        },

        {
            id: "townheroes_day6",
            name: "Go to play at Town Heroes again",
            done: false
        },

        {
            id: "make_dinner_day6",
            name: "Make dinner for family",
            done: false
        }
    ]
});


// ==================================================
// SONDAY - TOWN 3
// ==================================================

array_push(days, {
    day_name: "Sonday",

    quests: [
        {
            id: "fish_day7",
            name: "Fish at the pond",
            done: false
        },

        {
            id: "go_home_day7",
            name: "Go home",
            done: false
        },

        {
            id: "watch_tv_day7",
            name: "Watch TV",
            done: false
        },

        {
            id: "prepare_tomorrow",
            name: "Prepare for tomorrow",
            done: false
        }
    ]
});


// ==================================================
// MOTIVEDAY
// ==================================================

array_push(days, {
    day_name: "Motiveday",

    quests: [
        {
            id: "ask_crush",
            name: "Ask out your crush",
            done: false
        }
    ]
});


// ==================================================
// MISERDAY - HOMEWORK PROGRESS
// ==================================================

homework_progress = 0;
homework_total = 4;


// ==================================================
// MISERDAY - HOUSE EXPLORATION
// ==================================================

// Muru begins in her own house, so that one starts visited.

house_ids = [
    "muru",
    "neighbour",
    "tutor"
];

house_visited = [
    true,
    false,
    false
];