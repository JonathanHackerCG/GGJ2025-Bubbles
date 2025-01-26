global.__sticker_index = array_create(STICKER.__TOTAL, undefined);
enum STICKER
{
	PARROT,
	LIGHTHOUSE,
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
#region sticker_define(id, sprite_index);
/// @func sticker_define
/// @desc Defines a new sticker, providing some common default parameters.
/// Returns the created sticker, for further modification.
/// @arg	{Enum.STICKER} id
/// @arg	{Asset.GMSprite} sprite_index
function sticker_define(_id, _sprite_index)
{
	var _sticker = new Sticker({
		sprite_index: _sprite_index
	});
	sticker_register(_id, _sticker);
	return _sticker;
}
#endregion

sticker_define(STICKER.PARROT, spr_parrot_icon);