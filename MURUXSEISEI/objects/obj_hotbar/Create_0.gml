

slot_count = 8;
hotbar = array_create(slot_count);

for (var i = 0; i < slot_count; i++) {
    hotbar[i] = { item_name: "", amount: 0 };
}

selected_slot = 0;
slot_size = 48;
slot_padding = 4;

visible_hotbar = false; // starts hidden