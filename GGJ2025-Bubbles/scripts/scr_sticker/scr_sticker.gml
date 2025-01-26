#region StickerProperties();
/// @func StickerProperties
/// @desc Default properties for Sticker.
/// Serves as a reference for overriding those properties.
function StickerProperties() constructor
{
	sprite_index = noone;	//Default sprite_index.
	image_index = 0;			//Default initial image_index.
	image_speed = 0.2;		//Default image_speed (FPS).
	
	
	object = obj_sticker;	//The object to instantiate.
	sticker_id = undefined;
}
#endregion
#region Sticker(properties);
/// @func Sticker
/// @desc Sticker "template" struct. Properties are passed to instance.
/// @arg	{Struct.StickerProperties} [properties]
function Sticker(_properties = undefined) constructor
{
	static __DEFAULT = new StickerProperties();
	properties = struct_join(__DEFAULT, _properties);
	
	#region instantiate(x, y, layer, [properties]);
	/// @func instantiate
	/// @arg	x
	/// @arg	y
	/// @arg	layer
	/// @arg	{Struct.StickerProperties} [properties]
	static instantiate = function(_x, _y, _layer, _properties = undefined)
	{
		var _properties_final = struct_join(properties, _properties);
		var _inst = instance_create_layer(_x, _y, _layer, _properties_final.object, _properties_final);
		_inst.sticker_id = properties.sticker_id;
		return _inst;
	}
	#endregion
}
#endregion

#region sticker_exists(sticker_id);
function sticker_exists(_sticker_id)
{
	with (obj_sticker)
	{
		if (sticker_id == _sticker_id) { return true; }
	}
	return false;
}
#endregion