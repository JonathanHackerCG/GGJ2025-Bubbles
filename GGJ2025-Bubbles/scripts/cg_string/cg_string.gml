/// Miscellaneous extra string utilities.
/// 7/13/2024

/// @function string_contains
/// @arg	{String} string
/// @arg	{String} substring
/// @returns {Bool}
function string_contains(_string, _substring)
{
	return (string_pos(_substring, _string) != 0);
}