#region get_font_scaled(name, [scale]);
/// @func get_font_scaled(name, [scale]):
/// @desc Returns the appropriate font for current camera scale.
/// @arg	{String} name
/// @arg	{Real} [scale]
/// @returns {Real}
function get_font_scaled(_name, _scale = CAMERA.gui_s)
{
	if (!is_string(_name) && font_exists(_name))
	{
		return _name;
	}
	
	var _test = get_font_scaled_name(_name, _scale);
	var _font = asset_get_index(_test);
	if (_font == -1 || !font_exists(_font))
	{
		show_error($"Unable to find font {_test}, value is {_font}.", true);
	}
	return _font;
}
#endregion
#region get_font_scaled_name(name, [scale]);
/// @func get_font_scaled_name(name, [scale]):
/// @arg	{String} name
/// @arg	{Real} [scale]
/// @arg	{String} [alt]
/// @returns {String}
function get_font_scaled_name(_name, _scale = CAMERA.gui_s, _alt = "")
{
	if (!is_string(_name) && font_exists(_name))
	{
		return font_get_name(_name);
	}
	
	if (_alt != "")
	{
		return "fnt_" + _name + "_" + _alt + "_" + string(100 * _scale);
	}
	return "fnt_" + _name + "_" + string(100 * _scale);
}
#endregion