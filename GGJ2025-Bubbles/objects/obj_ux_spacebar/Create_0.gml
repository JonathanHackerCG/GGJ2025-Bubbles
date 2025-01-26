/// @description Insert description here
// You can write your code in this editor
current_room = rm_town;

change_room = function () {
	AUDIO.play("wave");
	if (current_room == rm_town) {
		// change to sea
		current_room = rm_sea;
		sprite_index = spr_spacebar_up;
	} else {
		// change to beach	
		current_room = rm_town;
		sprite_index = spr_spacebar_down;
	}
	room_goto(current_room);
}