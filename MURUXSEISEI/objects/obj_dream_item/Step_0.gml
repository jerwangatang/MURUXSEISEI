var _day_index = obj_quest_manager.current_day_index;

if (collected_day != _day_index && place_meeting(x, y, obj_player)) {
    if (keyboard_check_pressed(vk_enter)) {
        var _item_name = obj_dreamscape_manager.dream_items[_day_index];
        
        collected_day = _day_index;
        
        scr_collect_dream_item(_item_name);
        
        // Return to the correct Real World town
        if (_day_index <= 1) {
            room_goto(room_town1);
        } else {
            room_goto(room_town2);
        }
    }
}