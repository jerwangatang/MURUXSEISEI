function scr_player_death() {
    scr_reset_day();
    
    global.sanity = global.max_sanity; // full heal for the new attempt
    
    room_goto(room_deathscreen);
}