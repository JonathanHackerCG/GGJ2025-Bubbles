/// @description Camera initialization and methods.
// Updated 10/24/2024: Fixed application_surface off by 1, and rounded follow target position.

default_wmin = 240;
default_wmax = 320;
default_hmin = 180;
default_hmax = 180;
default_spre = 4;

#region EDIT: Camera settings.
cam_speed_arrow = 0;		//Panning speed with WASD.
cam_speed_mouse = 0;		//Panning speed with mouse.
clamp_cursor = false;		//Clamp cursor within game window.
clamp_inbounds = true;
clamp_buffer = 0;

fullscreen = false;			//Fullscreen or windowed.

//Potential user zoom values.
zoom_options = [1];
zoom_index = 0; //Default zoom value (index).

//Pre-scaling options. Recommendation: DO NOT MODIFY.
pre_scale_options = [1, 2, 4];		//pre_scale options. Whole numbers only.
pre_scale_index = 1;							//Default pre_scale value (index).

//Post-scaling options.
//pre_scale_index is chosen automatically.
post_scale_options = [1, 2, 3, 4];						//Final canvas scaling to fit the screen.
array_push(post_scale_options, 1.5);					//Works if pre_scale_options includes 2.
array_push(post_scale_options, 1.25, 1.75);		//Works if pre_scale_options includes 4.
#endregion
#region Single-time initialization.
cam_id = camera_create_view(0, 0, 0, 0, 0, noone, -1, -1, -1, -1);

fade_color = c_black;
fade_alpha = 0.0;
fade_alpha_real = fade_alpha;
fade_time = second(2.0);

scale_override = 0;

__screenshake = 0;
__moving = false;

target_zoom = 2;
max_zoom = 4;
min_zoom = 1;
zoom = 1;

cam_panning_buffer = 0;
#endregion

#region init();
/// @description Create the camera data and initialize.
/// @function init_camera();
function init()
{
	//Width variables
	width  = 1;
	height = 1;
	wcenter = width / 2;
	hcenter = height / 2;
	pre_scale = 1;
	post_scale = 1;
	
	//GUI variables
	gui_w = 1;
	gui_h = 1;
	gui_s = 1;
	
	//Coordinate variables
	xpos = 0;
	ypos = 0;
	xoffset = 0;
	yoffset = 0;
	xpos_target = 0;
	ypos_target = 0;
	xpos1_view = 0;
	ypos1_view = 0;
	xcenter = xpos + wcenter;
	ycenter = ypos + hcenter;
	
	camera_set_view_pos(cam_id, xpos, ypos);
	camera_set_view_size(cam_id, width, height);

	view_camera[0] = cam_id;
	view_visible[0] = true;
	view_enabled[0] = true;
}
#endregion
#region update();
/// @description Updates camera variables.
function update()
{
	if (window_get_width() != window_w_prev || window_get_height() != window_h_prev)
	{
		init_screen_default();
	}
	
	//Caching values.
	var w = width / zoom;
	var h = height / zoom;
	
	//Camera move settings. (Does nothing currently).
	xmove = 0;
	ymove = 0;
	spd_move = 0;
	
	//Center camera position and clamp within room.
	var set_xpos = xpos - (w / 2);
	var set_ypos = ypos - (h / 2);
	if (__screenshake > 0)
	{
		set_xpos = xpos - (w / 2) + (random_range(-__screenshake / 2, __screenshake / 2) * 2);
		set_ypos = ypos - (h / 2) + (random_range(-__screenshake / 2, __screenshake / 2) * 2);
		__screenshake = lerp(__screenshake, 0, 0.5);
	}
	
	if (clamp_inbounds)
	{
		set_xpos = clamp(set_xpos, clamp_buffer, room_width		- w - clamp_buffer);
		set_ypos = clamp(set_ypos, clamp_buffer, room_height	- h - clamp_buffer);
	}
	
	xpos1_view = set_xpos;
	ypos1_view = set_ypos;
	xpos2_view = xpos1_view + w;
	ypos2_view = ypos1_view + h;
	
	camera_set_view_pos(cam_id, set_xpos, set_ypos);
	camera_set_view_size(cam_id, w, h);
}
#endregion
#region set_position(xpos, ypos);
function set_position(_xpos, _ypos)
{
	xpos = _xpos;
	ypos = _ypos;
}
#endregion
#region in_view(x, y);
/// @func in_view(x, y):
/// @desc Returns true if position is in view of the camera.
/// @arg x
/// @arg y
/// @arg {Real} [buffer]
function in_view(_x, _y, _buffer = 0)
{
	var x1 = xpos1_view + _buffer;
	var y1 = ypos1_view + _buffer;
	var x2 = xpos2_view - _buffer;
	var y2 = ypos2_view - _buffer;
	return (_x >= x1 && _y >= y1 && _x <= x2 && _y <= y2);
}
#endregion
#region init_screen(width_min, width_max, height_min, height_max, scale_base, fullscreen, [original]);
/// @description Initializes the screen display / scaling.
/// @param width_min
/// @param width_max
/// @param height_min
/// @param height_max
/// @param scale_base
/// @param fullscreen
/// @param {Bool} [original]
function init_screen(w_min, w_max, h_min, h_max, scale_base, fullscreen, original = false)
{
	static fullscreen_previous = undefined;
	if (os_type == os_operagx)
	{
		fullscreen = false;
		original = true;
		w_min = 320; //320
		w_max = w_min;
		h_min = 180; //180
		h_max = h_min;
	}
	#region Updating parameter values.
	w_min	*= scale_base;
	h_min	*= scale_base;
	w_max	*= scale_base;
	h_max	*= scale_base;
	var buffer_w = 64;
	var buffer_h = 128;
	#endregion
	#region Calculating target width and height.
	var target_w, target_h;
	var screen_w = display_get_width();	 //Screen width  (real).
	var screen_h = display_get_height(); //Screen height (real).
	if (fullscreen)
	{
		target_w = screen_w; //Target final width.
		target_h = screen_h; //Target final height.
	}
	else
	{
		target_w = screen_w - buffer_w; //Target final width.
		target_h = screen_h - buffer_h; //Target final height.
	}
	#endregion
	#region Calculate the largest possible scale factor based on target size.
	var scale_list;
	if (original) { scale_list = [1]; }
	else
	{
		scale_list = post_scale_options;
	}
	
	var _size = array_length(scale_list);
	var _scale_base = pre_scale_options[pre_scale_index];
	var s, w_min_scaled, w_max_scaled, h_min_scaled, h_max_scaled;
	var a, a_max = 0;
	for (var i = 0; i < _size; i++)
	{
		s = scale_list[i];
		
		w_min_scaled = w_min * s;
		h_min_scaled = h_min * s;
		w_max_scaled = min(w_max * s, target_w);
		h_max_scaled = min(h_max * s, target_h);
		if (w_max_scaled < w_min_scaled || h_max_scaled < h_min_scaled) { continue; }
		
		a = w_max_scaled * h_max_scaled;
		if (a > a_max)
		{
			a_max = a;
			scale_real = s;
			scale_w = floor_mult(w_max_scaled / s, scale_base);
			scale_h = floor_mult(h_max_scaled / s, scale_base);
		}
	}
	#endregion
	#region Set window size/fullscreen enabled.
	var _prevw = window_get_width();
	var _prevh = window_get_height();
	var _neww = scale_w * scale_real;
	var _newh = scale_h * scale_real;
	if (fullscreen != fullscreen_previous || _prevw != _neww || _prevh != _newh)
	{
		if (!fullscreen)
		{
			window_set_fullscreen(false);
			window_set_size(_neww, _newh);
			window_center();
			xoffset = 0;
			yoffset = 0;
		}
		else
		{
			window_set_fullscreen(true);
			xoffset = (screen_w - (scale_w * scale_real)) / 2;
			yoffset = (screen_h - (scale_h * scale_real)) / 2;
		}
		fullscreen_previous = fullscreen;
	}
	
	window_w_prev = window_get_width();
	window_h_prev = window_get_height();
	
	surface_resize(application_surface, scale_w, scale_h);
	pre_scale = scale_base;
	post_scale = scale_real;
	#endregion
	#region Resize the CAMERA.
	width  = floor(scale_w / scale_base);
	height = floor(scale_h / scale_base);
	wcenter = width  / 2;
	hcenter = height / 2;
	camera_set_view_size(cam_id, width, height);
	#endregion
	#region Resize the GUI.
	//display_set_gui_size(scale_w, scale_h);
	//display_set_gui_size(scale_w * scale_real, scale_h * scale_real);
	//display_set_gui_maximize(1, 1, 0, 0);
	gui_s = scale_real;
	while (gui_s >= 2) { gui_s --; }
	gui_w = ceil(width  * pre_scale * gui_s);
	gui_h = ceil(height * pre_scale * gui_s);
	display_set_gui_size(gui_w, gui_h);
	#endregion
	#region Set camera view values.
	view_camera[0] = cam_id;
	view_visible[0] = true;
	view_enabled[0] = true;
	#endregion

	alarm[0] = 10; //Update Window
}
#endregion
#region set_fade(alpha, [time], [color]);
function set_fade(_alpha, _time = second(2.0), _color = c_black)
{
	fade_alpha = _alpha;
	fade_time = _time;
	fade_color = _color;
	
	if (fade_time <= 0)
	{
		//Intantly set.
		fade_alpha_real = fade_alpha;
	}
}
#endregion
#region is_fading();
function is_fading()
{
	return (fade_alpha_real != fade_alpha);
}
#endregion

//Screenshake
#region set_screenshake(amount);
/// @func set_screenshake(amount):
/// @desc Sets the screenshake amount.
/// @arg	{Real} amount
function set_screenshake(_amount)
{
	__screenshake = min(_amount, SCREENSHAKE_MAX * SCREENSHAKE_MULTIPLIER);
}
#endregion
#region add_screenshake(amount);
/// @func add_screenshake(amount):
/// @desc Adds an amount of screenshake.
/// @arg	{Real} amount
function add_screenshake(_amount)
{
	set_screenshake(__screenshake + _amount);
}
#endregion

//Custom functions.
#region init_screen_default();
function init_screen_default()
{
	CAMERA.init_screen(default_wmin, default_wmax, default_hmin, default_hmax, default_spre, fullscreen);
}
#endregion
#region toggle_fullscreen();
function toggle_fullscreen()
{
	fullscreen = !fullscreen;
	init_screen_default();
}
#endregion

//Following
#region follow(inst, factor, [xoffset], [yoffset]);
/// @description The camemra follows an instance
/// @function follow(instance, factor, [xoffset], [yoffset]);
/// @param instance
/// @param {Real} factor
/// @param {Real} xbuffer
/// @param {Real} ybuffer
/// @param {Real} [xoffset]
/// @param {Real} [yoffset]
function follow(_inst, _factor, _xoff = 0, _yoff = 0)
{
	if (is_undefined(_inst) || !instance_exists(_inst)) { return false; }
	_factor = max(_factor, 1);

	//Find target location based on instance position.
	var targetx = _inst.x + _xoff;
	var targety = _inst.y + _yoff - _inst.z;
	targetx = round(targetx); //This means it ignores the target's subpixel.
	targety = round(targety);
	
	if (_factor > 1)
	{
		var dx = (targetx - xpos) / _factor;
		var dy = (targety - ypos) / _factor;
		dx += PLANCK_CONSTANT * sign(dx);
		dy += PLANCK_CONSTANT * sign(dy);
	
		if (abs(targetx - xpos) < abs(dx)) { dx = targetx - xpos; }
		if (abs(targety - ypos) < abs(dy)) { dy = targety - ypos; }

		set_position(xpos + dx, ypos + dy);
		
		if (dx == 0 && dy == 0)
		{
			__moving = false;
			return false;
		}
	}
	else
	{
		set_position(targetx, targety);
		__moving = false;
		return false;
	}

	__moving = true;
	return true;
}
#endregion
#region set_follow(instance);
/// @func set_follow(instance):
/// @arg	{Id.Instance} instance
/// @arg	{Bool} [center] Default: false
function set_follow(_instance, _center = false)
{
	instance_activate_object(_instance);
	follow_inst = _instance;
	if (_center)
	{
		follow(follow_inst, 1);
	}
	__moving = true;
}
#endregion
#region center();
function center()
{
	follow(follow_inst, 1);
}
#endregion
#region reset_follow();
/// @func reset_follow();
function reset_follow()
{
	set_follow(noone);
}
#endregion
#region is_moving();
function is_moving()
{
	return __moving;
}
#endregion
reset_follow();

init();