/// @description Insert description here
// You can write your code in this editor
grabbed_sticker_id = undefined;
randomize();

// Go to the sea room
call_later(1, time_source_units_frames, function() {
	room_goto(rm_sea);
})