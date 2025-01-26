global.__sticker_index = array_create(STICKER.__TOTAL, undefined);
enum STICKER
{
	PARROT,
	OTTER,
	FISH,
	MAYOR,
	PINE_TREE,
	FLUFF_TREE,
	PALM_TREE,
	WILSON,
	BUSH,
	BIG_CHEESE_HAT,
	SPONGE_AND_STAR,
	CHAIR,
	CONE_SHELL,
	CRAB,
	MAITAI,
	MESSAGE_IN_A_BOTTLE,
	OIIAI,
	SAND_DOLLAR,
	SANDCASTLE,
	TOWEL,
	UMBRELLA,
	COCONUT_DRINK,
	__TOTAL
}

#region sticker_register(id, sticker);
/// @func sticker_register
/// @desc Registers a new Sticker in global scope.
/// @arg	{Enum.STICKER} id
/// @arg	{Struct.Sticker} sticker
function sticker_register(_id, _sticker)
{
	global.__sticker_index[_id] = _sticker;
}
#endregion
#region sticker_deregister(id);
/// @func sticker_deregister
/// @arg	{Enum.STICKER} id
function sticker_deregister(_id)
{
	return global.__sticker_index[_id];
}
#endregion

#region
/// @func get_random_npc(id);
/// @desc gets random npc from global sticker list
function get_random_npc()
{
	var rand_sticker_init_index = irandom_range(STICKER.PARROT, STICKER.MAYOR);
	var sticker_id = rand_sticker_init_index;
	var _sticker = sticker_deregister(sticker_id);
	return _sticker;
}
#endregion

#region
/// @func get_random_item
/// @desc gets random item from global sticker list
function get_random_item()
{
	var rand_sticker_init_index = irandom_range(STICKER.MAYOR, STICKER.__TOTAL-1);
	var sticker_id = rand_sticker_init_index;
	var _sticker = sticker_deregister(sticker_id);
	return _sticker;
}

#region sticker_define(id, sprite_index);
/// @func sticker_define
/// @desc Defines a new sticker, providing some common default parameters.
/// Returns the created sticker, for further modification.
/// @arg	{Enum.STICKER} id
/// @arg	{Asset.GMSprite} sprite_index
function sticker_define(_id, _sprite_index)
{
	var _sticker = new Sticker({
		sticker_id: _id,
		sprite_index: _sprite_index
	});
	sticker_register(_id, _sticker);
	return _sticker;
}
#endregion

// NPCs
sticker_define(STICKER.PARROT, spr_parrot_icon);
sticker_define(STICKER.OTTER, spr_otter_icon);
sticker_define(STICKER.FISH, spr_fish_icon);
sticker_define(STICKER.MAYOR, spr_mayor_icon);

// Items
sticker_define(STICKER.WILSON, spr_willy);
sticker_define(STICKER.BIG_CHEESE_HAT, spr_big_cheese);
sticker_define(STICKER.BUSH, spr_bush); 
sticker_define(STICKER.FLUFF_TREE, spr_tree_fluff);
sticker_define(STICKER.PALM_TREE, spr_tree_palm);
sticker_define(STICKER.PINE_TREE, spr_tree_pine);
sticker_define(STICKER.SPONGE_AND_STAR, spr_spongeboy);
sticker_define(STICKER.CHAIR, spr_chair);
sticker_define(STICKER.CONE_SHELL, spr_cone_shell);
sticker_define(STICKER.CRAB, spr_crab);
sticker_define(STICKER.MAITAI, spr_maitai);
sticker_define(STICKER.MESSAGE_IN_A_BOTTLE, spr_message_in_a_bottle);
sticker_define(STICKER.OIIAI, spr_oiiai);
sticker_define(STICKER.SAND_DOLLAR, spr_sand_dollar);
sticker_define(STICKER.SANDCASTLE, spr_sandcastle);
sticker_define(STICKER.TOWEL, spr_towel);
sticker_define(STICKER.UMBRELLA, spr_umbrella);
sticker_define(STICKER.COCONUT_DRINK, spr_coconut_drink);
