// ==================================================
// SHOPKEEPER - CREATE
// ==================================================

shop_open = false;


// --------------------------------------------------
// ITEMS FOR SALE
// --------------------------------------------------

shop_items = [
    { name: "Milk",   price: 5  },
    { name: "Potion", price: 15 },
    { name: "Key",    price: 40 },
];

selected_index = 0;


// --------------------------------------------------
// INTERACTION
// --------------------------------------------------

can_interact = false;

if (!variable_global_exists("shop_menu_open"))
{
    global.shop_menu_open = false;
}

if (!variable_global_exists("pause_block_timer"))
{
    global.pause_block_timer = 0;
}