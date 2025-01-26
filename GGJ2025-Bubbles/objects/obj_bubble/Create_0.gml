/// @description Insert description here
// You can write your code in this editor
rand_sticker_init_index = irandom(STICKER.__TOTAL - 1);
sticker_id = rand_sticker_init_index;
var _sticker = sticker_deregister(sticker_id);
sticker = _sticker.instantiate(x, y, "Instances");
var xscale = floor((sprite_get_width(spr_bubble) / sticker.sprite_width) * 4) * 0.25;
var yscale = floor((sprite_get_height(spr_bubble) / sticker.sprite_height) * 4) * 0.25;

sticker.image_xscale = min(xscale, yscale)
sticker.image_yscale = sticker.image_xscale