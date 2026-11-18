if (!triggered && place_meeting(x, y, obj_player)) {
    scr_complete_quest("explore_town2");
    triggered = true;
}