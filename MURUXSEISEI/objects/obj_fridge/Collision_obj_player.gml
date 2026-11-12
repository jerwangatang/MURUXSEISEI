if (!opened) {
    opened = true;
    image_index = 1;
    
    var _roll = irandom_range(1, 100);
    var _item = "";
    
    if (_roll <= 60) {
        _item = "Milk";
    } else if (_roll <= 90) {
        _item = "Potion";
    } else if (_roll <= 99) {
        _item = "Key";
    } else {
        _item = "Golden Apple";
    }
    
    scr_hotbar_add(_item, 1);
    show_debug_message("You got: " + _item);
}