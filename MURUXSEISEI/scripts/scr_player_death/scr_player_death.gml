function scr_player_death() {
    scr_reset_day();
    scr_hotbar_snapshot_restore();
    
    global.sanity = global.max_sanity;
    
    room_goto(room_deathscreen);
}