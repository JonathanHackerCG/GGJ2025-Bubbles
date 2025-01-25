/// April 19th, 2024

#region struct_join(base, add);
/// @func struct_join(base, add);
/// @desc Returns two structs combined, treating undefined values of 'add' as a preference for the value of the base.
/// @arg	{Struct} base
/// @arg	{Struct|undefined} add
/// @returns {Struct}
function struct_join(_base, _add)
{
	if (_base == undefined) { return _add; }
	
	var _new = variable_clone(_base);
	if (_add != undefined)
	{
		var _vars = struct_get_names(_add);
		var _size = array_length(_vars);
		for (var i = 0; i < _size; i++)
		{
			var _var = _vars[i];
			_new[$ _var] = _add[$ _var] ?? _base[$ _var];
		}
	}
	return _new;
}
#endregion