function sanity_change(_amount)
{
    global.sanity = clamp(
        global.sanity + _amount,
        0,
        global.max_sanity
    );
}