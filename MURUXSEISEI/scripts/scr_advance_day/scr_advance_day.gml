function scr_advance_day()
{
    // ==================================================
    // QUEST MANAGER CHECK
    // ==================================================

    if (!instance_exists(obj_quest_manager))
    {
        return false;
    }


    var _manager =
        instance_find(
            obj_quest_manager,
            0
        );


    // ==================================================
    // CURRENT DAY MUST BE COMPLETE
    // ==================================================

    if (!scr_day_complete())
    {
        return false;
    }


    // ==================================================
    // NOT FINAL DAY
    // ==================================================

    if (
        _manager.current_day_index
        <
        array_length(_manager.days) - 1
    )
    {
        // Save current hotbar state before changing day
        scr_hotbar_snapshot_Save();


        // Advance day
        _manager.current_day_index++;


        show_debug_message(
            "Advanced to "
            + _manager.days[
                _manager.current_day_index
            ].day_name
        );


        // ==================================================
        // AUTOSAVE
        // ==================================================

        if (
            variable_global_exists("current_save_slot")
            &&
            global.current_save_slot > 0
        )
        {
            scr_request_autosave(
                "day advanced"
            );
        }


        return true;
    }


    // ==================================================
    // FINAL DAY COMPLETE
    // ==================================================

    // Save hotbar one final time
    scr_hotbar_snapshot_Save();


    show_debug_message(
        "FINAL DAY COMPLETE"
    );


    // Final ending / crush sequence
    // will be connected here later.


    return true;
}