if (room == room_dreamscapet1 || room == room_winminigame || room == room_winminigame2 || room == room_loseminigame) {
    exit;
}

var _day = scr_current_day();

var _x = 20;
var _line_height = 22;
var _box_height = 30 + (array_length(_day.quests) * _line_height);
var _y = display_get_gui_height() - 20;
var _box_y = _y - _box_height;

draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(_x - 10, _box_y, _x + 320, _y + 10, false);
draw_set_alpha(1);

draw_set_color(c_yellow);
draw_text(_x, _box_y + 5, _day.day_name + " — To Do:");

for (var i = 0; i < array_length(_day.quests); i++) {
    var _q = _day.quests[i];
    var _line_y = _box_y + 30 + (i * _line_height);
    
    if (_q.done) {
        draw_set_color(c_green);
        draw_text(_x, _line_y, "[X] " + _q.name);
    } else {
        draw_set_color(c_white);
        draw_text(_x, _line_y, "[ ] " + _q.name);
    }
}

var _day = scr_current_day();

var _x = 20;
var _line_height = 22;
var _box_height = 30 + (array_length(_day.quests) * _line_height);
var _y = display_get_gui_height() - 20;
var _box_y = _y - _box_height;

draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(_x - 10, _box_y, _x + 320, _y + 10, false);
draw_set_alpha(1);

draw_set_color(c_yellow);
draw_text(_x, _box_y + 5, _day.day_name + " — To Do:");

for (var i = 0; i < array_length(_day.quests); i++) {
    var _q = _day.quests[i];
    var _line_y = _box_y + 30 + (i * _line_height);
    
    if (_q.done) {
        draw_set_color(c_green);
        draw_text(_x, _line_y, "[X] " + _q.name);
    } else {
        draw_set_color(c_white);
        draw_text(_x, _line_y, "[ ] " + _q.name);
    }
}

