if (instance_exists(obj_quest_manager)) {
    show_debug_message("Quest manager FOUND");
    scr_complete_quest("Play one minigame in Coco's Amusement");
} else {
    show_debug_message("Quest manager NOT FOUND - it doesn't exist in this room");
}

alarm[0] = room_speed * 3;