/// @description Audio Methods
//event_inherited();

#macro MAX_SOUNDS 4
#macro V_SOUND AUDIO.volume_sound
#macro V_MUSIC AUDIO.volume_music

V_SOUND = 0.8;
V_MUSIC = 0.2;

sound_count = 0;
#region audio.play(...);
/// @function play
/// @arg	sound
/// @arg	{Real} [volume]
/// @arg	{Real} [pitch_0.05]
/// @arg	{Real} [pitch_off]
/// @arg	{Bool} [loop]
function play(_sound, _volume = V_SOUND, _pitch = 0.05, _pitch_off = 0, _loop = false)
{
	static sound_list = [];
	
	if (is_string(_sound))
	{
		sound_list = [];
		var i = 1;
		while (true)
		{
			var _sound_new = asset_get_index("snd_" + _sound + "_0" + string(i));
			if (!audio_exists(_sound_new)) { break; }
			array_push(sound_list, _sound_new);
			i++;
		}
		if (i == 1)
		{
			_sound = asset_get_index("snd_" + _sound);
			if (!audio_exists(_sound)) { return noone; }
		}
		else
		{
			_sound = sound_list[irandom(i - 2)];
		}
	}
	if (!audio_exists(_sound)) { return noone; }
	
	sound_count ++; //Keep track of how many sounds have played this frame.
	if (sound_count > MAX_SOUNDS) { return noone; }
	
	var snd = audio_play_sound(_sound, 1, _loop);
	audio_sound_gain(snd, _volume * audio_sound_get_gain(_sound), 0);
	audio_sound_pitch(snd, 1 + (random(2) - 1) * _pitch + _pitch_off);
	return snd;
}
#endregion
#region audio.play_as(...);
/// @function play_as
/// @arg	inst
/// @arg	sound
/// @arg	{Real} [volume]
/// @arg	{Real} [pitch_0.05]
/// @arg	{Real} [pitch_off]
/// @arg	{Bool} [loop]
function play_as(_inst, _sound, _volume = V_SOUND, _pitch = 0.05, _pitch_off = 0, _loop = false)
{
	with (_inst)
	{
		_pitch_off -= min((get_stat(STAT.SIZE) - 1) * 0.25, 0.5);
	}
	AUDIO.play(_sound, _volume, _pitch, _pitch_off, _loop);
}
#endregion

music = undefined;