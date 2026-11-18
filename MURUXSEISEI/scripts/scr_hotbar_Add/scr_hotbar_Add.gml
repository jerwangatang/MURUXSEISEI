function scr_hotbar_add(_item_name, _amount = 1) {
    var _hb = obj_hotbar.hotbar;
    var _count = obj_hotbar.slot_count;
    
    for (var i = 0; i < _count; i++) {
        if (_hb[i].item_name == _item_name) {
            _hb[i].amount += _amount;
            audio_play_sound(snd_ding, 1, false);
            return true;
        }
    }
    
    for (var i = 0; i < _count; i++) {
        if (_hb[i].item_name == "") {
            _hb[i].item_name = _item_name;
            _hb[i].amount = _amount;
            audio_play_sound(snd_ding, 1, false);
            return true;
        }
    }
    
    show_debug_message("Hotbar full!");
    return false;
}