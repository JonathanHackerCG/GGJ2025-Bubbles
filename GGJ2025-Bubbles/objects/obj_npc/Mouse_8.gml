/// NPC: Right Click

if (room != rm_town) { exit; }

switch (sticker_id)
{
	case STICKER.MAYOR:
	{
		scene_mayor_wants();
	} break;
	case STICKER.PARROT:
	{
		
	} break;
	case STICKER.OTTER:
	{
		
	} break;
	case STICKER.FISH:
	{
		
	} break;
	default:
	{
		DIALOGUE.text("Woah! What's up?");
	}
}