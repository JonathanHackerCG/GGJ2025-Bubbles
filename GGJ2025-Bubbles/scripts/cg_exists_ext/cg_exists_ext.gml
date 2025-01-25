#region instance_exists_ext(instance);
/// @func instance_exists_ext
/// @desc Returns true if instance is defined and exists.
/// @arg	instance
/// @returns	{Bool}
function instance_exists_ext(_instance)
{
	return _instance != undefined && instance_exists(_instance);	
}
#endregion
#region sprite_exists_ext(sprite);
/// @func sprite_exists_ext
/// @desc Returns true if sprite is defined and exists.
/// @arg	sprite
/// @returns	{Bool}
function sprite_exists_ext(_sprite)
{
	return _sprite != undefined && sprite_exists(_sprite);	
}
#endregion
#region object_exists_ext(object);
/// @func object_exists_ext
/// @desc Returns true if object is defined and exists.
/// @arg	object
/// @returns	{Bool}
function object_exists_ext(_object)
{
	return _object != undefined && object_exists(_object);	
}
#endregion
#region audio_exists_ext(audio);
/// @func audio_exists_ext
/// @desc Returns true if audio is defined and exists.
/// @arg	audio
/// @returns	{Bool}
function audio_exists_ext(_audio)
{
	return _audio != undefined && audio_exists(_audio);	
}
#endregion
#region audio_emitter_exists_ext(audio_emitter);
/// @func audio_emitter_exists_ext
/// @desc Returns true if audio_emitter is defined and exists.
/// @arg	audio_emitter
/// @returns	{Bool}
function audio_emitter_exists_ext(_audio_emitter)
{
	return _audio_emitter != undefined && audio_emitter_exists(_audio_emitter);	
}
#endregion
#region animcurve_exists_ext(animcurve);
/// @func animcurve_exists_ext
/// @desc Returns true if animcurve is defined and exists.
/// @arg	animcurve
/// @returns	{Bool}
function animcurve_exists_ext(_animcurve)
{
	return _animcurve != undefined && animcurve_exists(_animcurve);	
}
#endregion
#region buffer_exists_ext(buffer);
/// @func buffer_exists_ext
/// @desc Returns true if buffer is defined and exists.
/// @arg	buffer
/// @returns	{Bool}
function buffer_exists_ext(_buffer)
{
	return _buffer != undefined && buffer_exists(_buffer);	
}
#endregion
#region font_exists_ext(font);
/// @func font_exists_ext
/// @desc Returns true if font is defined and exists.
/// @arg	font
/// @returns	{Bool}
function font_exists_ext(_font)
{
	return _font != undefined && font_exists(_font);	
}
#endregion