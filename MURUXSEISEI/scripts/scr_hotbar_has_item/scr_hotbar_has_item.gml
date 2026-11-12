function scr_hotbar_has_item(_item_name) {
    var _hb = obj_hotbar.hotbar;
    var _count = obj_hotbar.slot_count;
    
    for (var i = 0; i < _count; i++) {
        if (_hb[i].item_name == _item_name && _hb[i].amount > 0) {
            return true;
        }
    }
    return false;
}