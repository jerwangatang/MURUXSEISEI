// ==================================================
// RESTORE HOTBAR TO DAY-START SNAPSHOT
// ==================================================

function scr_hotbar_snapshot_restore()
{
    if (!instance_exists(obj_hotbar))
    {
        return false;
    }


    var _hb =
        instance_find(
            obj_hotbar,
            0
        );


    // ==================================================
    // SAFETY - SNAPSHOT DOES NOT EXIST
    // ==================================================

    if (
        !variable_instance_exists(
            _hb,
            "day_start_snapshot"
        )
    )
    {
        // Create a snapshot from the current hotbar
        // instead of crashing.
        scr_hotbar_snapshot_save();

        return true;
    }


    // ==================================================
    // SAFETY - EMPTY SNAPSHOT
    // ==================================================

    if (
        array_length(
            _hb.day_start_snapshot
        )
        <= 0
    )
    {
        return true;
    }


    // ==================================================
    // RESTORE ITEMS
    // ==================================================

    var _count =
        min(
            array_length(
                _hb.day_start_snapshot
            ),
            array_length(
                _hb.hotbar
            )
        );


    for (
        var i = 0;
        i < _count;
        i++
    )
    {
        _hb.hotbar[i].item_name =
            _hb.day_start_snapshot[i].item_name;


        _hb.hotbar[i].amount =
            _hb.day_start_snapshot[i].amount;
    }


    return true;
}