// Complete Coco's quest
if (instance_exists(obj_quest_manager))
{
    scr_complete_quest(
        "Play one minigame in Coco's Amusement"
    );
}

// Stay on win screen for 3 seconds
alarm[0] = room_speed * 3;