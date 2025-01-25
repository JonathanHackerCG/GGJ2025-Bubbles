/// Version: 2/21/2024

#region call_function_ext(function, params);
/// @func call_function_ext(function, params):
/// @desc Runs a function/method with an Array of parameters.
/// @arg	{Function} function
/// @arg	{Array} parameters
/// @returns {Any}
/// @context FunctionQueue
function call_function_ext(_function, _args)
{
	if (is_undefined(_args))
	{
		return _function();
	}
	
	var _size = array_length(_args);
	switch(_size)
	{
		case 0:  return _function();
		case 1:  return _function(_args[0]);
		case 2:  return _function(_args[0], _args[1]);
		case 3:  return _function(_args[0], _args[1], _args[2]);
		case 4:  return _function(_args[0], _args[1], _args[2], _args[3]);
		case 5:  return _function(_args[0], _args[1], _args[2], _args[3], _args[4]);
		case 6:  return _function(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5]);
		case 7:  return _function(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6]);
		case 8:  return _function(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7]);
		case 9:  return _function(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8]);
		case 10: return _function(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9]);
		case 11: return _function(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9], _args[10]);
		case 12: return _function(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9], _args[10], _args[11]);
		default: show_error("Too many parameters for call_function_ext.", false); return false;
	}
}
#endregion