#region percent(chance);
/// @func percent
/// @desc Returns true a given percent chance of the time.
/// @arg	{Real} chance
function percent(_chance)
{
	return (_chance >= 100 || random(100) < _chance);
}
#endregion