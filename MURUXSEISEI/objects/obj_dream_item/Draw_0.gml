draw_self();

if (collected_day != obj_quest_manager.current_day_index && place_meeting(x, y, obj_player)) {
    draw_set_color(c_white);
    draw_text(x, y - 20, "Press Enter to pick up");
}