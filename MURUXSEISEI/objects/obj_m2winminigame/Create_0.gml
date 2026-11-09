// ==================================================
// COCO'S AMUSEMENT QUEST
// ==================================================

if (instance_exists(obj_quest_manager))
{
    scr_complete_quest("cocos_minigame");
}


// Stay on win screen for 3 seconds
alarm[0] = room_speed * 3;