/// @description Insert description here
// You can write your code in this editor
if (mouse_check_button(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
	sticker.image_xscale = 1;
	sticker.image_yscale = 1;
	// Insert item sticker into GAME's list of freed stickers
	array_push(GAME.freed_sticker_ids, sticker.sticker_id)
	instance_destroy();
}

if (y + sprite_height > 0) {
	y -= 1;
} else {
	y = room_height + sprite_height;
}

sticker.y = y;
sticker.x = x;