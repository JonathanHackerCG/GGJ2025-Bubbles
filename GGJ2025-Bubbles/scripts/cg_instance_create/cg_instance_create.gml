/// @desc 
function instance_create_layer_safe(_x, _y, _layer, _object, _struct = {})
{
	if (!layer_exists(_layer))
	{
		show_error($"Trying to create an instance on non-existent layer {_layer}.", true);
	}
	return instance_create_layer(_x, _y, _layer, _object, _struct);
}