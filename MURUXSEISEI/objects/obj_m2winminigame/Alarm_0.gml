// ==================================================
// BALLOON GAME WIN - RETURN TO ARCADE
// ==================================================


// ==================================================
// FORCE NORMAL ARCADE SPAWN
// ==================================================

global.arcade_spawn_pending =
    true;


// Prevent stale Town 1 / Town 2 return positions
// from affecting Muru inside the arcade.
global.return_spawn_pending =
    false;


// ==================================================
// RETURN TO ARCADE
// ==================================================

room_fade_to(
    room_arcade1
);