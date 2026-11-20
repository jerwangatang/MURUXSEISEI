// ==================================================
// SAD - COLLISION WITH MURU
// ==================================================

if (!variable_global_exists("m1_score"))
{
    global.m1_score = 0;
}

global.m1_score =
    max(
        0,
        global.m1_score - 1
    );;


instance_destroy();