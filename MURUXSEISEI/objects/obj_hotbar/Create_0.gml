// ==================================================
// HOTBAR - CREATE
// ==================================================


// ==================================================
// HOTBAR SETTINGS
// ==================================================

slot_count = 5;

selected_slot = 0;

visible_hotbar = false;


// ==================================================
// CREATE EMPTY HOTBAR
// ==================================================

hotbar = [];

for (var i = 0; i < slot_count; i++)
{
    array_push(
        hotbar,
        {
            item_name: "",
            amount: 0
        }
    );
}


// ==================================================
// DAY START SNAPSHOT
//
// Day 1 starts with an empty hotbar.
// This prevents death from trying to restore
// a snapshot that does not exist.
// ==================================================

day_start_snapshot = [];

for (var i = 0; i < slot_count; i++)
{
    array_push(
        day_start_snapshot,
        {
            item_name: hotbar[i].item_name,
            amount: hotbar[i].amount
        }
    );
}


// ==================================================
// GUI SETTINGS
// ==================================================

slot_width = 90;

slot_height = 60;

slot_gap = 8;