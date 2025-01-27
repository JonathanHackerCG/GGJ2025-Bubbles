/// Get random sticker to fit inside bubble
rand_sticker_init_index = irandom(STICKER.__TOTAL - 1);
sticker_id = rand_sticker_init_index;
if (is_sticker_npc(sticker_id)) {
	if (array_length(GAME.bubbled_npcs) <= 0) {
		instance_destroy();	
		exit;
	}
	sticker_id = GAME.bubbled_npcs[0];
	// Remove from game npc list
	array_delete(GAME.bubbled_npcs, 0, 1);
	
}
var _sticker = sticker_deregister(sticker_id);
if (is_sticker_npc(sticker_id))
{
	sticker = _sticker.instantiate(x, y, "Instances", {
		object: obj_npc
	});
}
else
{
	sticker = _sticker.instantiate(x, y, "Instances");
}

sticker.sticker_id = sticker_id;

var wb = sprite_get_width(spr_bubble);
var ws = sticker.sprite_width;
var hb = sprite_get_height(spr_bubble);
var hs = sticker.sprite_height;

var xscale = 1;
var yscale = 1;
if (ws > wb || hs > hb)
{
	xscale = floor((wb / ws) * 4) * 0.25;
	yscale = floor((hb / hs) * 4) * 0.25;
}

// Scale sticker to fit inside bubble
sticker.image_xscale = min(xscale, yscale)
sticker.image_yscale = sticker.image_xscale


// Randomize bubble speed on instantiation
bubble_speed = random_range(0.25, 2);