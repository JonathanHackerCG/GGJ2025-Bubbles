/// @description Insert description here
// You can write your code in this editor

if (sound_on) {
	// sprite off	
	sprite_index = spr_sound_off;
	V_SOUND = 0.0;
	V_MUSIC = 0.0;
	if (AUDIO.music != undefined)
	{
		audio_sound_gain(AUDIO.music, V_MUSIC, 0);
	}
} else {
	// sprite on
	sprite_index = spr_sound_on;
	V_SOUND = 0.8;
	V_MUSIC = 0.2;
	if (AUDIO.music != undefined)
	{
		audio_sound_gain(AUDIO.music, V_MUSIC, 0);
	}
}
sound_on = !sound_on;