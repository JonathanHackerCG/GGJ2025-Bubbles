/// @description Game system
grabbed_sticker_id = undefined;
freed_sticker_ids = [];
randomize();

// Go to the sea room
call_later(1, time_source_units_frames, function() {
	room_goto(rm_sea);
})
