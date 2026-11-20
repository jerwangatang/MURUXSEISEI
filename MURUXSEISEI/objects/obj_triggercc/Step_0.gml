// ==================================================
// COCO / CLOCKZONE ENTRANCE - STEP
// ==================================================

if (global.game_paused)
{
    exit;
}


if (global.dialogue_active)
{
    exit;
}


if (!instance_exists(obj_player))
{
    exit;
}


// ==================================================
// INTERACT
// ==================================================

if (
    place_meeting(
        x,
        y,
        obj_player
    )
    &&
    keyboard_check_pressed(vk_enter)
)
{
    // ==================================================
    // TOWN 1 -> COCO'S AMUSEMENT
    // ==================================================

    if (room == room_town1)
    {
        // ----------------------------------------------
        // DAY 1 BUILDING EXPLORATION
        // ----------------------------------------------

        scr_visit_house(
            "cocos"
        );


        // ----------------------------------------------
        // ARCADE RETURN ROOM
        // ----------------------------------------------

        global.arcade_return_room =
            room_town1;


        // ----------------------------------------------
        // ENTER ARCADE
        // ----------------------------------------------

        scr_enter_room(
            room_arcade1
        );


        exit;
    }


    // ==================================================
    // TOWN 2 -> CLOCKZONE
    // ==================================================

    if (room == room_town2)
    {
        global.arcade_return_room =
            room_town2;


        scr_enter_room(
            room_arcade1
        );


        exit;
    }
}