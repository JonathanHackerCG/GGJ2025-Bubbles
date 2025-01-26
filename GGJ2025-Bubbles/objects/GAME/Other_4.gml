/// @description Insert description here
// You can write your code in this editor
if (room == rm_town) {
	// Populate beach with stickers
	for (var i = 0; i < array_length(freed_sticker_ids); i += 1) {
		show_debug_message(freed_sticker_ids[i])
		var _sticker = sticker_deregister(freed_sticker_ids[i]);
		_sticker.instantiate(x, y, "Instances");	
	}
	// Reset array
	freed_sticker_ids = [];
}