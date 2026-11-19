// ==================================================
// PLAYER - STEP EVENT
// ==================================================


// ==================================================
// FOOTSTEP VARIABLES - SAFETY INITIALISATION
// ==================================================

if (!variable_instance_exists(id, "footstep_timer"))
{
    footstep_timer = 0;
}

if (!variable_instance_exists(id, "footstep_cut_timer"))
{
    footstep_cut_timer = 0;
}

if (!variable_instance_exists(id, "footstep_sound"))
{
    footstep_sound = noone;
}


// ==================================================
// PAUSE / DIALOGUE
// ==================================================

if (global.game_paused || global.dialogue_active)
{
    // Stop footsteps immediately
    if (
        footstep_sound != noone
        &&
        audio_is_playing(footstep_sound)
    )
    {
        audio_stop_sound(
            footstep_sound
        );
    }

    footstep_sound = noone;
    footstep_timer = 0;
    footstep_cut_timer = 0;

    exit;
}


// ==================================================
// SHOP MENU OPEN
// STOP PLAYER MOVEMENT
// ==================================================

if (
    variable_global_exists("shop_menu_open")
    &&
    global.shop_menu_open
)
{
    // Stop footsteps
    if (
        footstep_sound != noone
        &&
        audio_is_playing(footstep_sound)
    )
    {
        audio_stop_sound(
            footstep_sound
        );
    }

    footstep_sound = noone;
    footstep_timer = 0;
    footstep_cut_timer = 0;


    // Keep Muru on idle animation
    switch (facing_dir)
    {
        case "south":
            sprite_index = spr_muru_idle_south;
            break;

        case "north":
            sprite_index = spr_muru_idle_north;
            break;

        case "east":
            sprite_index = spr_muru_idle_east;
            break;

        case "west":
            sprite_index = spr_muru_idle_west;
            break;
    }

    image_speed = 0.08;

    exit;
}


// ==================================================
// INPUT
// ==================================================

var _move_x =
    keyboard_check(ord("D"))
    -
    keyboard_check(ord("A"));

var _move_y =
    keyboard_check(ord("S"))
    -
    keyboard_check(ord("W"));


// ==================================================
// MOVEMENT CHECK
// ==================================================

var _moving =
    (_move_x != 0 || _move_y != 0);


// ==================================================
// NORMALISE DIAGONAL MOVEMENT
// ==================================================

if (_moving)
{
    var _len =
        point_distance(
            0,
            0,
            _move_x,
            _move_y
        );

    if (_len > 0)
    {
        _move_x /= _len;
        _move_y /= _len;
    }
}


// ==================================================
// APPLY MOVEMENT SPEED
// ==================================================

_move_x *= move_spd;
_move_y *= move_spd;


// ==================================================
// FOOTSTEPS
// ==================================================

if (_moving)
{
    footstep_timer--;


    if (footstep_timer <= 0)
    {
        // Stop previous step if still playing
        if (
            footstep_sound != noone
            &&
            audio_is_playing(footstep_sound)
        )
        {
            audio_stop_sound(
                footstep_sound
            );
        }


        // Play footstep sound
        footstep_sound =
            audio_play_sound(
                snd_footstep,
                1,
                false
            );


        // Cut long audio short
        footstep_cut_timer =
            room_speed * 0.55;


        // Delay until next footstep
        footstep_timer =
            room_speed * 0.50;
    }
}
else
{
    footstep_timer = 0;
    footstep_cut_timer = 0;


    if (
        footstep_sound != noone
        &&
        audio_is_playing(footstep_sound)
    )
    {
        audio_stop_sound(
            footstep_sound
        );
    }


    footstep_sound = noone;
}


// ==================================================
// CUT FOOTSTEP AUDIO SHORT
// ==================================================

if (footstep_cut_timer > 0)
{
    footstep_cut_timer--;


    if (footstep_cut_timer <= 0)
    {
        if (
            footstep_sound != noone
            &&
            audio_is_playing(footstep_sound)
        )
        {
            audio_stop_sound(
                footstep_sound
            );
        }


        footstep_sound = noone;
    }
}


// ==================================================
// HORIZONTAL COLLISION
// ==================================================

if (
    !place_meeting(
        x + _move_x,
        y,
        obj_solid
    )
)
{
    x += _move_x;
}


// ==================================================
// VERTICAL COLLISION
// ==================================================

if (
    !place_meeting(
        x,
        y + _move_y,
        obj_solid
    )
)
{
    y += _move_y;
}


// ==================================================
// FACING DIRECTION
// ==================================================

if (_moving)
{
    if (abs(_move_x) > abs(_move_y))
    {
        if (_move_x > 0)
        {
            facing_dir = "east";
        }
        else
        {
            facing_dir = "west";
        }
    }
    else
    {
        if (_move_y > 0)
        {
            facing_dir = "south";
        }
        else
        {
            facing_dir = "north";
        }
    }
}


// ==================================================
// SPRITE SELECTION
// ==================================================

var _new_sprite =
    sprite_index;


switch (facing_dir)
{
    case "south":
    {
        if (_moving)
        {
            _new_sprite =
                spr_muru_walk_south;
        }
        else
        {
            _new_sprite =
                spr_muru_idle_south;
        }

        break;
    }


    case "north":
    {
        if (_moving)
        {
            _new_sprite =
                spr_muru_walk_north;
        }
        else
        {
            _new_sprite =
                spr_muru_idle_north;
        }

        break;
    }


    case "east":
    {
        if (_moving)
        {
            _new_sprite =
                spr_muru_walk_east;
        }
        else
        {
            _new_sprite =
                spr_muru_idle_east;
        }

        break;
    }


    case "west":
    {
        if (_moving)
        {
            _new_sprite =
                spr_muru_walk_west;
        }
        else
        {
            _new_sprite =
                spr_muru_idle_west;
        }

        break;
    }
}


// ==================================================
// CHANGE SPRITE
// ==================================================

if (_new_sprite != sprite_index)
{
    sprite_index =
        _new_sprite;

    image_index = 0;
}


// ==================================================
// ANIMATION SPEED
// ==================================================

if (_moving)
{
    image_speed = 0.2;
}
else
{
    image_speed = 0.08;
}


// ==================================================
// INVENTORY / HOTBAR TOGGLE
// E = OPEN / CLOSE
// ==================================================

if (keyboard_check_pressed(ord("E")))
{
    if (instance_exists(obj_hotbar))
    {
        obj_hotbar.visible_hotbar =
            !obj_hotbar.visible_hotbar;

        audio_play_sound(
            snd_menu_select,
            1,
            false
        );
    }
}


// ==================================================
// USE ITEM
// ==================================================

if (keyboard_check_pressed(ord("P")))
{
    if (instance_exists(obj_hotbar))
    {
        var _slot =
            obj_hotbar.hotbar[
                obj_hotbar.selected_slot
            ];


        if (_slot.item_name != "")
        {
            scr_use_item(
                _slot.item_name
            );
        }
    }
}


// ==================================================
// SPEED BOOST TIMER
// ==================================================

if (speed_boost_timer > 0)
{
    speed_boost_timer--;


    if (speed_boost_timer <= 0)
    {
        move_spd =
            base_move_spd;
    }
}


// ==================================================
// DEBUG SANITY KEYS
// ==================================================

if (keyboard_check_pressed(ord("K")))
{
    sanity_change(-20);
}


if (keyboard_check_pressed(ord("L")))
{
    sanity_change(20);
}