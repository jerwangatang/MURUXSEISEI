function scr_hotbar_Add(){

}
function scr_hotbar_add(_item_name, _amount = 1) {
    var _hb = obj_hotbar.hotbar;
    var _count = obj_hotbar.slot_count;
    
    // First check if item already exists (to stack)
    for (var i = 0; i < _count; i++) {
        if (_hb[i].item_name == _item_name) {
            _hb[i].amount += _amount;
            return true;
        }
    }
    
    // Otherwise find first empty slot
    for (var i = 0; i < _count; i++) {
        if (_hb[i].item_name == "") {
            _hb[i].item_name = _item_name;
            _hb[i].amount = _amount;
            return true;
        }
    }
    
    show_debug_message("Hotbar full!");
    return false;
}