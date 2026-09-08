function room_fade_to(_room)
{
    // Prevent multiple transitions at once
    if (!instance_exists(obj_fade_transition))
    {
        var _fade = instance_create_depth(
            0,
            0,
            -100000,
            obj_fade_transition
        );

        _fade.target_room = _room;
    }
}