/// @description Insert description here
// You can write your code in this editor
if (room == rm_town) {
	// Populate beach with stickers
	for (var i = 0; i < array_length(freed_sticker_ids); i += 1) {
		var _sticker_id = freed_sticker_ids[i];
		var _sticker = sticker_deregister(_sticker_id);
		
		var xx = (room_width / 2) + irandom_range(-8, 8);
		var yy = (room_height / 2) + irandom_range(-8, 8);
		
		if (is_sticker_npc(_sticker_id))
		{
			_sticker.instantiate(xx, yy, "Instances", {
				object: obj_npc
			});
		}
		else
		{
			_sticker.instantiate(xx, yy, "Instances");
		}
	}
	// Reset array
	freed_sticker_ids = [];
} else if (room == rm_sea) {
	// Generate bubbles
	var rand_bubble_count = irandom_range(1, 5);
	for (var i = 0; i <= rand_bubble_count; i += 1) {
		// Create up to rand_bubble_count of bubbles with random spawn position
		var w = sprite_get_width(spr_bubble);
		var h = sprite_get_height(spr_bubble);
		var x_rand = irandom_range(w, room_width - w);
		var y_rand = irandom_range(h, room_height + h);
		instance_create_layer(x_rand, y_rand, "Instances", obj_bubble);
	}
	
}