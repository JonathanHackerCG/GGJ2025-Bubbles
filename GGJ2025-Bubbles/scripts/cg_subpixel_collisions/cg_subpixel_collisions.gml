#region ARC_move_and_collide(dx, dy);
function ARC_move_and_collide(_dx, _dy)
{
	
}
#endregion
#region move_and_collide_subpixel(dx, dy, object);
/// @func move_and_collide_subpixel
/// @desc Subpixel perfect replacement for GM's move_and_collide.
/// Works directly off of bounding boxes instead of pixel centers.
/// Only works for rectangular collision masks. Slower than native collisions.
/// @arg	{Real} dx
/// @arg	{Real} dy
/// @arg	{Asset.GMObject|Id.Instance} object
function move_and_collide_subpixel(_dx, _dy, _obj)
{
	var _xinit = x;
	var _yinit = y;
	#region Horizontal
	var _max_dx = bbox_right - bbox_left;
	var _num_dx = abs(_dx) / _max_dx;
	if (_num_dx > 1)
	{
		_dx /= _num_dx;
	}
	
	repeat (ceil(_num_dx))
	{
		if (_dx != 0)
		{
			if (_dx > 0)
			{
				var _inst = instance_place(ceil(x + _dx), y, _obj);
				if (instance_exists(_inst))
				{
					_dx = min(_dx, _inst.bbox_left - bbox_right);
				}
			}
			else
			{
				var _inst = instance_place(floor(x + _dx), y, _obj);
				if (instance_exists(_inst))
				{
					_dx = max(_dx, _inst.bbox_right - bbox_left);
				}
			}
			x += _dx;
		}
	}
	#endregion
	#region Vertical
	var _max_dy = bbox_bottom - bbox_top;
	var _num_dy = abs(_dy) / _max_dy;
	if (_num_dy > 1)
	{
		_dy /= _num_dy;
	}
	
	repeat (ceil(_num_dy))
	{
		if (_dy != 0)
		{
			if (_dy > 0)
			{
				var _inst = instance_place(x, ceil(y + _dy), _obj);
				if (instance_exists(_inst))
				{
					_dy = min(_dy, _inst.bbox_top - bbox_bottom);
				}
			}
			else
			{
				var _inst = instance_place(x, floor(y + _dy), _obj);
				if (instance_exists(_inst))
				{
					_dy = max(_dy, _inst.bbox_bottom - bbox_top);
				}
			}
			y += _dy;
		}
	}
	#endregion
	return (_xinit != x || _yinit != y);
}
#endregion

#region disable_collisions();
/// @func disable_collisions();
/// @desc A hack to disable all collisions.
function disable_collisions()
{
	mask_index = _spr_mask_none;
	solid = false;
}
#endregion