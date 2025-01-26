/// @description Insert description here
// You can write your code in this editor

// hotkey
if (keyboard_check_pressed(vk_space)) {
	// toggle between rooms
	room_goto((room == rm_sea) ? rm_town : rm_sea);
} else if (keyboard_check_pressed(vk_enter)) {
	screen_save("My Beach");
}

//if (array_length(freed_sticker_ids) > 0) {
//	show_debug_message(freed_sticker_ids)
//}

if (room == rm_sea && instance_number(obj_bubble) <= 0) {
	room_goto(rm_town);
}