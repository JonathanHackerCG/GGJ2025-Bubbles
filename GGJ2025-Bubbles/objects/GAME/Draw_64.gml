/// GAME: Draw GUI

if (DIALOGUE.active()) { exit; }

var _text = "Left-Click Drag, Right-Click Delete/Speak";
if (room == rm_sea)
{
	_text = "Left-Click POP!";
}

var s = CAMERA.gui_s * CAMERA.default_spre;
draw_text_set((room_width / 2) * s, 8 * s, _text, fnt_label, fa_center, fa_middle, c_white);
draw_reset();