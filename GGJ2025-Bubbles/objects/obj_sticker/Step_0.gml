/// @description Insert description here
// You can write your code in this editor


/// @description Insert description here
// You can write your code in this editor
if (!grabbed && mouse_check_button(mb_left)) && position_meeting(mouse_x, mouse_y, id)
{
    grabbed = true;
	x_offset = mouse_x - x;
	y_offset = mouse_y - y;
} else if (mouse_check_button_released(mb_left)) {
	grabbed = false;
}

if (grabbed) {
	x = mouse_x - x_offset;
	y = mouse_y - y_offset;
}