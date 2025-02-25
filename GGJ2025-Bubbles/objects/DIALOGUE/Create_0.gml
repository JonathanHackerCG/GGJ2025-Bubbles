/// DIALOGUE: Create

//Properties
fqueue = new FunctionQueue(id, false, true);
__sprite = undefined;
__text_string = "";
__text_scribble = undefined;
__typewriter = scribble_typist();

index = 0; //Randomization Index (Used in scene_* functions).

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
		if (position_meeting(mouse_x, mouse_y, [obj_ux_sound, obj_ux_game_end])) { return false; }
		if (keyboard_check_released(vk_space) || mouse_check_button_released(mb_left))
		{
			keyboard_clear(vk_space);
			mouse_clear(mb_left);
			if (__typewriter.get_state() == 1)
			{
				return true;
			}
			else
			{
				__typewriter.skip();
			}
		}
		return false;
	});
}
#endregion
#region flier();
/// @func flier
/// @desc Shows a sprite in the dialogue.
/// @arg	{Asset.GMSprite} sprite
flier = function(_sprite)
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
	BUFFER = 32 * GUIS;
	
	if (__text_string != "")
	{
		__text_scribble = scribble(__text_string)
			.align(fa_center, fa_bottom)
			.wrap(GUIW * 0.6)
			.starting_format(get_font_scaled_name("text"));
		__typewriter.in(0.75, 10);
	}
	
	draw_text(16, 16, fqueue.print());
}
#endregion
#region STEP
step = function()
{
	if (keyboard_check_released(vk_escape))
	{
		keyboard_clear(vk_escape);
		clear();
	}
	
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
		var xx = room_width / 2;
		var yy = room_height / 2;
		draw_sprite(spr_flier, 0, xx, yy);
		draw_sprite(__sprite, 0, xx, yy);
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
		
		__text_scribble.draw(GUIW / 2, GUIH - BUFFER, __typewriter);
	}
}
#endregion

scene_intro();