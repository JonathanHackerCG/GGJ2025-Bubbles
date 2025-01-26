/// DIALOGUE: Create

//Properties
fqueue = new FunctionQueue(id, false, true);
__sprite = undefined;
__text_string = "";
__text_scribble = undefined;

//Methods
#region active();
__active = false;
/// @func active
active = function()
{
	return __active;
}
#endregion
#region clear();
clear = function()
{
	__text_string = "";
	__text_scribble = undefined;
	__sprite = undefined;
	fqueue.clear();
}
#endregion
#region text();
/// @func text
/// @desc Shows text in the dialogue.
/// @arg	{String} string
text = function(_string)
{
	fqueue.push(function(_string)
	{
		__text_string = _string;
		refresh();
	}, [_string]);
	fqueue.push(function()
	{
		if (keyboard_check_pressed(vk_space))
		{
			keyboard_clear(vk_space);
			return true;
		}
		return false;
	});
}
#endregion
#region sprite();
/// @func sprite
/// @desc Shows a sprite in the dialogue.
/// @arg	{Asset.GMSprite} sprite
sprite = function(_sprite)
{
	fqueue.push(function(_sprite)
	{
		__sprite = _sprite;
	}, [_sprite]);
}
#endregion

//Events
#region REFRESH
refresh = function()
{
	GUIW = display_get_gui_width();
	GUIH = display_get_gui_height();
	GUIS = CAMERA.gui_s;
	BUFFER = 16 * GUIS;
	
	if (__text_string != "")
	{
		__text_scribble = scribble(__text_string)
			.align(fa_center, fa_bottom)
			.starting_format(get_font_scaled_name("text"));
	}
	
	draw_text(16, 16, fqueue.print());
}
#endregion
#region STEP
step = function()
{
	var _active_prev = __active;
	__active = fqueue.update();
	if (!__active && __active != _active_prev)
	{
		clear();
	}
}
#endregion
#region DRAW
draw = function()
{
	if (__sprite != undefined)
	{
		draw_sprite(__sprite, 0, 0, 0);
	}
}
#endregion
#region DRAW_GUI
draw_gui = function()
{
	if (__text_scribble != undefined)
	{
		var H = __text_scribble.get_height() + (BUFFER * 2);
		draw_rectangle_set(0, GUIH - H, GUIW, GUIH, false, c_black, 0.50);
		draw_reset();
		
		__text_scribble.draw(GUIW / 2, GUIH - BUFFER);
	}
}
#endregion