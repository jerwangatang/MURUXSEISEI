function scr_collect_dream_item(_name) {
    if (!variable_global_exists("dreamscape_items")) {
        global.dreamscape_items = [];
    }
    
    if (!array_contains(global.dreamscape_items, _name)) {
        array_push(global.dreamscape_items, _name);
    }
    
    show_debug_message("Collected: " + _name);
}