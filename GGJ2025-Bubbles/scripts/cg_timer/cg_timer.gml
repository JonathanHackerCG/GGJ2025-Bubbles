/// @desc Timer
/// Updated February 8th, 2024
/// Updated May 9th, 2024
/// Updated October 10th, 2024 - Fixed TimerDelta.update returing {Bool}
/// Updated October 28th, 2024 - Added add and __check_finish methods.

function Timer() constructor
{
	#region __check_finish();
	static __check_finish = function()
	{
		if (__current <= -1)
		{
			__current = -1;
			if (__callback != undefined)
			{
				__callback();
			}
			return false;
		}
		return true;
	}
	#endregion
	
	#region set(duration, [callback]);
	/// @func set(duration, [callback]):
	/// @desc Sets the Timer duration, callback, and resets. Duration is frames for Timer, and seconds for TimerDelta.
	/// @arg	{Real} duration
	/// @arg	{Function} [callback]
	static set = function(_duration, _callback = undefined)
	{
		__duration = _duration;
		__callback = _callback;
		reset();
	}
	#endregion
	#region add(amount);
	/// @func add(amount):
	/// @desc Adds an amount (or subtracts) to the timer's duration. If it runs out will trigger callback.
	/// @arg	{Real} amount
	/// @returns {Bool}
	static add = function(_amount)
	{
		if (!active()) { exit; }
		__current += _amount;
		return __check_finish();
	}
	#endregion
	#region reset();
	/// @func reset():
	/// @desc Resets the Timer to its duration value.
	static reset = function()
	{
		__current = __duration;
	}
	#endregion
	#region active();
	/// @func active();
	/// @desc Returns true if the time is active.
	/// @returns {Bool}
	static active = function()
	{
		return (__current != -1);
	}
	#endregion
	#region paused();
	/// @func paused():
	/// @desc Returns true if the Timer is paused.
	/// @returns {Bool}
	static paused = function()
	{
		return __paused;
	}
	#endregion
	#region pause();
	/// @func pause():
	/// @desc Pauses the Timer.
	static pause = function()
	{
		__paused = true;
	}
	#endregion
	#region resume();
	/// @func resume():
	/// @desc Resumes the Timer.
	static resume = function()
	{
		__paused = false;
	}
	#endregion
	#region update();
	/// @func update():
	/// @desc Call once per frame to update the value of the timer.
	/// @returns {Bool}
	static update = function()
	{
		if (!active()) { return false; }
		if (paused()) { return true; }
	
		__current --;
		return __check_finish();
	}
	#endregion
	#region clear();
	/// @func clear():
	/// @desc Clears the timer.
	static clear = function()
	{
		__duration = -1;
		__current = -1;
		__callback = undefined;
	}
	#endregion
	
	#region get_current();
	/// @func get_current():
	/// @desc Returns the current value of the Timer.
	/// @returns {Real}
	static get_current = function()
	{
		return __current;
	}
	#endregion
	#region get_duration();
	/// @func get_duration():
	/// @desc Returns the duration value of the Timer.
	/// @returns {Real}
	static get_duration = function()
	{
		return __duration;
	}
	#endregion
	#region get_ratio();
	/// @func get_ratio():
	/// @desc Returns the ratio of the current value to the duration. (Between 0 and 1).
	/// @returns {Real}
	static get_ratio = function()
	{
		return (__current / __duration);
	}
	#endregion
	
	#region PRIVATE
	__current = -1;
	__duration = -1;
	__callback = undefined;
	__paused = false;
	#endregion
}

function TimerDelta() : Timer() constructor
{
	#region update(); OVERRIDE
	/// @func update():
	/// @desc Call once per frame to update the value of the timer.
	update = function()
	{
		if (!active()) { return false; }
		if (paused()) { return true; }
	
		__current -= delta_time / 1000000;
		if (__current < 0)
		{
			__current = -1;
			if (__callback != undefined)
			{
				__callback();
				return false;
			}
		}
		return true;
	}
	#endregion
}