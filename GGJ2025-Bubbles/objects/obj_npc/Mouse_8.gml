/// NPC: Right Click

if (room != rm_town) { exit; }

switch (sticker_id)
{
	case STICKER.MAYOR:
	{
		if (sticker_exists(STICKER.MAITAI))
		{
			scene_mayor_happy();
		}
		else
		{
			scene_mayor_wants();
		}
	} break;
	case STICKER.PARROT:
	{
		if (sticker_exists(STICKER.CHAIR))
		{
			scene_parrot_happy();
		}
		else
		{
			scene_parrot_wants();
		}
	} break;
	case STICKER.OTTER:
	{
		if (sticker_exists(STICKER.UMBRELLA))
		{
			scene_otter_happy();
		}
		else
		{
			scene_otter_wants();
		}
	} break;
	case STICKER.FISH:
	{
		if (sticker_exists(STICKER.OIIAI))
		{
			scene_fish_happy();
		}
		else
		{
			scene_fish_wants();
		}
	} break;
	default:
	{
		DIALOGUE.text("Woah! What's up?");
	}
}