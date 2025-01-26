/// @description Insert description here
// You can write your code in this editor
if (mouse_check_button(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
	instance_destroy();
}

if (y + sprite_height > 0) {
	y -= 1;
} else {
	y = room_height + sprite_height;
}

sticker.y = y;
sticker.x = x;