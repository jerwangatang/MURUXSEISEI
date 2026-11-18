// ==================================================
// 8/11 / RELATIVEMART ENTRANCE
// ==================================================

if (place_meeting(x, y, obj_player))
{
    if (keyboard_check_pressed(vk_enter))
    {
        // Remember which town we entered from
        global.shop_return_room = room;

        // Both shops use the same interior
        room_fade_to(room_811);
    }
}