function draw_interaction_star(
    _margin = 20,
    _scale = 0.06,
    _offset = 12
)
{
    // ==================================================
    // INITIALISE STAR OPACITY
    // ==================================================

    if (!variable_instance_exists(id, "star_alpha"))
    {
        star_alpha = 0;
    }


    // ==================================================
    // CHECK PLAYER DISTANCE
    // ==================================================

    var _near = false;

    if (instance_exists(obj_player))
    {
        var _player = instance_find(obj_player, 0);

        _near =
            _player.bbox_right >= bbox_left - _margin &&
            _player.bbox_left <= bbox_right + _margin &&
            _player.bbox_bottom >= bbox_top - _margin &&
            _player.bbox_top <= bbox_bottom + _margin;
    }


    // ==================================================
    // DETERMINE WHETHER STAR SHOULD APPEAR
    // ==================================================

    var _visible =
        _near &&
        !global.dialogue_active &&
        !global.game_paused;


    // ==================================================
    // FADE IN / FADE OUT
    // ==================================================

    // Approximately 0.2 seconds for a complete fade
    var _fade_step = min(1, delta_time / 200000);

    if (_visible)
    {
        // Fade in
        star_alpha = min(1, star_alpha + _fade_step);
    }
    else
    {
        // Fade out
        star_alpha = max(0, star_alpha - _fade_step);
    }


    // Don't draw if completely invisible
    if (star_alpha <= 0)
    {
        return;
    }


    // ==================================================
    // STAR ANIMATION
    // ==================================================

    var _frames = sprite_get_number(spr_interact_star);

    var _frame = floor(current_time * 0.008) mod _frames;

    var _bob = sin(current_time * 0.008) * 2;


    // ==================================================
    // STAR POSITION
    // ==================================================

    var _star_x = (bbox_left + bbox_right) / 2;

    var _star_y = bbox_top - _offset + _bob;


    // ==================================================
    // DRAW ANIMATED STAR
    // ==================================================

    draw_sprite_ext(
        spr_interact_star,
        _frame,
        _star_x,
        _star_y,
        _scale,
        _scale,
        0,
        c_white,
        star_alpha
    );
}