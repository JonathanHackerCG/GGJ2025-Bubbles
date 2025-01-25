function draw_sprite_gui(_sprite, _subimage, _x, _y)
{
	var s = GUI.S_PIX_GUI;
	draw_sprite_ext(_sprite, _subimage, _x * s, _y * s, s, s, 0, c_white, 1.0);
}

function draw_sprite_gui_ext(_sprite, _subimage, _x, _y, _xscale = 1, _yscale = 1, _angle = 0, _color = c_white, _alpha = 1.0)
{
	var s = GUI.S_PIX_GUI;
	draw_sprite_ext(_sprite, _subimage, _x * s, _y * s, _xscale * s, _yscale * s, _angle, _color, _alpha);
}

function draw_icon_meter(_sprite, _divisor, _x, _y, _sep, _value, _maximum, _alpha = 1.0, _wave = false)
{
	static S = 1;
	static __wave_func = function(_x, _y)
	{
		return _y + (animate_sin(15, _x * 8) / 2);
	}
	
	var _ystart = _y;
	
	var i = 0;
	_value = floor(_value);
	repeat (_value / _divisor)
	{
		if (_wave) { _y = __wave_func(i, _ystart); }
		draw_sprite_gui_ext(_sprite, _divisor, S * (_x + (i * _sep)), S * _y, S, S, 0, c_white, _alpha); i++;
	}
	if (_value % _divisor != 0)
	{
		if (_wave) { _y = __wave_func(i, _ystart); }
		draw_sprite_gui_ext(_sprite, _value % _divisor, S * (_x + (i * _sep)), S * _y, S, S, 0, c_white, _alpha); i++;
	}
	repeat ((_maximum - _value) / 4)
	{
		if (_wave) { _y = __wave_func(i, _ystart); }
		draw_sprite_gui_ext(_sprite, 0, S * (_x + (i * _sep)), S * _y, S, S, 0, c_white, _alpha); i++;
	}
}

function draw_icon_meter_ext(_sprite, _sprite_bkg, _sprite_heal, _x, _y, _alpha, _val, _val_prev, _val_max, _healing)
{
	draw_icon_meter(_sprite_bkg, 4, _x, _y, 8, 0, _val_max, _alpha);
	if (_val > _val_prev || _healing > 0)
	{
		draw_icon_meter(_sprite, 4, _x, _y, 8, _val, _val_max, _alpha / 2);
		draw_icon_meter(_sprite_heal, 4, _x, _y, 8, _val_prev, _val_max, _alpha);
	}
	else if (_val == _val_prev)
	{
		draw_icon_meter(_sprite, 4, _x, _y, 8, _val, _val_max, _alpha);
	}
	else if (_val < _val_prev)
	{
		draw_icon_meter(_sprite, 4, _x, _y, 8, _val_prev, _val_max, _alpha / 2);
		draw_icon_meter(_sprite, 4, _x, _y, 8, _val, _val_max, _alpha);
	}
}