draw_set_color(c_white);
draw_text(20, 20, "Breaths completed: " + string(cycles_done) + " / " + string(cycles_needed));

var bar_x = 20;
var bar_y = 60;
var bar_w = 200;
var bar_h = 20;

draw_set_color(c_gray);
draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);

var tz_x1 = bar_x + (target_min/100)*bar_w;
var tz_x2 = bar_x + (target_max/100)*bar_w;
draw_set_color(c_green);
draw_rectangle(tz_x1, bar_y, tz_x2, bar_y + bar_h, false);

var fill_x = bar_x + (inflate_amount/100)*bar_w;
draw_set_color(c_yellow);
draw_rectangle(bar_x, bar_y, fill_x, bar_y + bar_h, true);