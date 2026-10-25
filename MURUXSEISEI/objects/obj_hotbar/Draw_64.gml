if (!visible_hotbar) exit;

// Convert player world position to GUI position
var _gui_x = (obj_player.x - camera_get_view_x(view_camera[0])) * (display_get_gui_width() / camera_get_view_width(view_camera[0]));
var _gui_y = (obj_player.y - camera_get_view_y(view_camera[0])) * (display_get_gui_height() / camera_get_view_height(view_camera[0]));

var start_x = _gui_x - (slot_count * (slot_size + slot_padding)) / 2;
var start_y = _gui_y - slot_size - 60; // 60px above the player's head

for (var i = 0; i < slot_count; i++) {
    var _x = start_x + i * (slot_size + slot_padding);
    var _y = start_y;
    
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_rectangle(_x, _y, _x + slot_size, _y + slot_size, false);
    draw_set_alpha(1);
    
    if (i == selected_slot) {
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_white);
    }
    draw_rectangle(_x, _y, _x + slot_size, _y + slot_size, true);
    
    if (hotbar[i].item_name != "") {
        draw_set_color(c_white);
        draw_text(_x + 4, _y + 4, hotbar[i].item_name);
        
        if (hotbar[i].amount > 1) {
            draw_text(_x + slot_size - 16, _y + slot_size - 16, string(hotbar[i].amount));
        }
    }
}