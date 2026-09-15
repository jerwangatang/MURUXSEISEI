if (!opened) {
    opened = true;
    image_index = 1; // open frame (make sure sprite has a 2nd frame for "open")
    
    var _roll = irandom_range(1, 100);
    var _item = "";
    
    if (_roll <= 60) {
        _item = "milk";        // common: 1-60 (60%)
    } else if (_roll <= 90) {
        _item = "potion";      // rare: 61-90 (30%)
    } else if (_roll <= 99) {
        _item = "key";         // epic: 91-99 (9%)
    } else {
        _item = "golden_apple"; // legendary: 100 (1%)
    }
    
    scr_hotbar_add(_item, 1);
    show_debug_message("You got: " + _item);
}