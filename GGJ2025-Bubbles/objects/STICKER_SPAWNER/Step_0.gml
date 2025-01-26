/// Test: Step

if (mouse_check_button_pressed(mb_right))
{
	var _sticker = sticker_deregister(STICKER.PARROT);
	_sticker.instantiate(mouse_x, mouse_y, "Instances");
}