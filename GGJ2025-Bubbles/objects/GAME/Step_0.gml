/// @description Insert description here
// You can write your code in this editor

// hotkey
//if (keyboard_check_pressed(vk_enter)) {
//	screen_save("My Beach");
//}
if (!DIALOGUE.active() && keyboard_check_pressed(vk_escape)) {
	game_end();
}

//if (array_length(freed_sticker_ids) > 0) {
//	show_debug_message(freed_sticker_ids)
//}

if (!DIALOGUE.active() && room == rm_sea && instance_number(obj_bubble) <= 0) {
	room_goto(rm_town);
}


if (grabbed_sticker_id != undefined && room == rm_town) {
	// Ensure UI elements are not seen on beach while dragging sticker
	with(obj_ux_buttons) {
		visible = false;
	}
} else {
	with(obj_ux_buttons) {
		visible = true;
	}
}