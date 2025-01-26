/// AUDIO: Room Start
if (music != undefined)
{
	audio_stop_sound(music);
}

if (room == rm_sea)
{
	music = play(msc_sea, V_MUSIC, 0, 0, true);
}
else if (room == rm_town)
{
	music = play(msc_town, V_MUSIC, 0, 0, true);
}