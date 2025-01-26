/// @description Game system
grabbed_sticker_id = undefined;
freed_sticker_ids = [];
randomize();

// List of NPCs
bubbled_npcs = [STICKER.OTTER, STICKER.PARROT, STICKER.FISH];
bubbled_npcs = array_shuffle(bubbled_npcs);
array_insert(bubbled_npcs, 0, STICKER.MAYOR);

// Go to the sea room
call_later(1, time_source_units_frames, function() {
	room_goto(rm_town);
})
