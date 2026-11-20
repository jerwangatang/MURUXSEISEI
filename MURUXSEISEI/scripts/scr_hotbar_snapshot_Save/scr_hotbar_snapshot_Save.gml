// ==================================================
// SAVE HOTBAR DAY-START SNAPSHOT
// ==================================================

function scr_hotbar_snapshot_save()
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


    _hb.day_start_snapshot = [];


    for (
        var i = 0;
        i < array_length(_hb.hotbar);
        i++
    )
    {
        array_push(
            _hb.day_start_snapshot,
            {
                item_name:
                    _hb.hotbar[i].item_name,

                amount:
                    _hb.hotbar[i].amount
            }
        );
    }


    return true;
}