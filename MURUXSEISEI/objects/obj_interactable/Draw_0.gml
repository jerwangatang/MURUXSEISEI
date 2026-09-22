draw_self();

// Default settings
var _margin = 20;
var _offset = 12;

// Check for custom interaction distance
if (variable_instance_exists(id, "interaction_margin"))
{
    _margin = interaction_margin;
}

// Check for custom star position
if (variable_instance_exists(id, "star_offset"))
{
    _offset = star_offset;
}

// Draw the star
draw_interaction_star(
    _margin,
    0.06,
    _offset
);