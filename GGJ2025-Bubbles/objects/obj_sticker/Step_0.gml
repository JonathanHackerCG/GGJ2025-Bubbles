/// @description Insert description here
// You can write your code in this editor


/// @description Insert description here
// You can write your code in this editor

if (
	GAME.grabbed_sticker_id == undefined 
	&& !grabbed 
	&& mouse_check_button(mb_left)
	&& position_meeting(mouse_x, mouse_y, id))
{
    grabbed = true;
	GAME.grabbed_sticker_id = id;
	x_offset = mouse_x - x;
	y_offset = mouse_y - y;
	AUDIO.play("sticker_pickup");
} else if (grabbed && mouse_check_button_released(mb_left)) {
	grabbed = false;
	GAME.grabbed_sticker_id = undefined;
	AUDIO.play("sticker_place");
}

if (grabbed) {
	x = mouse_x - x_offset;
	y = mouse_y - y_offset; 
}

if (room == rm_town)
{
	x = clamp(x, 0, room_width);
	y = clamp(y, 0, room_height);
}

depth = -bbox_bottom + 100;