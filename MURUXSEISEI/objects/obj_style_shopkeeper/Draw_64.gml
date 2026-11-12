if (shop_open) {
    var _x = display_get_gui_width()/2 - 150;
    var _y = display_get_gui_height()/2 - 120;
    var _w = 300;
    var _h = 200;
    
    draw_set_color(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(_x, _y, _x + _w, _y + _h, false);
    draw_set_alpha(1);
    
    draw_set_color(c_white);
    draw_text(_x + 10, _y + 10, "STYLIST - Coins: " + string(global.coins));
    
    for (var i = 0; i < array_length(shop_items); i++) {
        var _item = shop_items[i];
        var _line_y = _y + 50 + (i * 30);
        var _label = _item.name + " - " + (_item.owned ? "OWNED" : string(_item.price) + " coins");
        
        if (i == selected_index) {
            draw_set_color(_item.owned ? c_gray : c_yellow);
            draw_text(_x + 10, _line_y, "> " + _label);
        } else {
            draw_set_color(_item.owned ? c_gray : c_white);
            draw_text(_x + 10, _line_y, "  " + _label);
        }
    }
    
    draw_set_color(c_gray);
    draw_text(_x + 10, _y + _h - 25, "Up/Down: select  Space: buy  Esc: close");
}