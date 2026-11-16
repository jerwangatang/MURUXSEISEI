function scr_hotbar_snapshot_restore() {
    var _hb = instance_find(obj_hotbar, 0);
    
    for (var i = 0; i < array_length(_hb.day_start_snapshot); i++) {
        _hb.hotbar[i].item_name = _hb.day_start_snapshot[i].item_name;
        _hb.hotbar[i].amount = _hb.day_start_snapshot[i].amount;
    }
}