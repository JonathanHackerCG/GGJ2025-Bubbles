#region scene_intro();
function scene_intro()
{	with (DIALOGUE)	{
	flier(spr_flier_mayor);
	text("Well I do say, what do we have ourselves here? A visitor?");
	text("Well we haven't had a visitor in more time than it takes to bake a biscuit, I say.");
	text("I say now, where are my manners?");
	text("My name is [c_lime]Mayor Gus[/c], and I have the absolute darndest pleasure of being the [c_lime]Mayor[/c] of this here town, PortBay Townsville [wave]mmhmm[/wave].");
	text("I say, you could walk from Eden to Kentucky and you wouldn't find a finer sleepy city on the coast than ol' PortBay Townsville.");
	text("...");
	text("Alright, I say, I must admit that this town's been so [c_ltgray]quiet[/c] you could hear a caterpillar [wave]tip-toeing[/wave] on the beach.");
	text("You see here, we used to have a thrivin' little community.");
	text("But that all changed with the [c_aqua]Great Flood[/c] of 19...");
	text("Uh... when was it again?");
	text("Oh yes, the [c_aqua]Great Flood[/c] of 19 days ago. That darn thing wiped out nearly all we had into the darn sea!");
	text("Lookee here now, I got an idea. I say, why don't you go on and try bobbin' your head underneath that shoreline.");
	text("[c_yellow]See if you can pick somethin' or someone up from the town that got washed away.[/c]");
} }
#endregion
#region scene_mayor_wants();
function scene_mayor_wants()
{
	static LINES = array_shuffle([
		"I say, it sure is nice to have some fresh blood in PortsBay. Nothin' better to help invigorate the town.",
		"You know I would be divin' down there myself, but I say, I may be combin' a bit too many grey hairs for that kinda swimmin'.",
		"Lookee here, being a mayor can be hard work sometimes. In order to keep my friendly disposition, I like to enjoy a [c_yellow]MAI TAI[/c] on the beach.",
		"Isaiah's a nice boy, but he's about as quick as a turtle walkin' to church."
	]);
	var _index = DIALOGUE.index % array_length(LINES);
	
	with (DIALOGUE) {
	flier(spr_flier_mayor);
	text(LINES[_index]);
} }
#endregion
#region scene_mayor_happy();
function scene_mayor_happy()
{
	static LINES = array_shuffle([
		"I say, I say, you have done a mighty fine job at cleaning up this Town.",
		"I say, there ain't nothin' wrong with a grown man enjoying a mai tai. Thank you for that.",
		"I been livin' in PortsBay Townsville all my life. You ask how long? I say, never ask a gentleman his age. It's impolite.",
		"I say, have you met Adah yet? That girl's always got her head in a book."
	]);
	var _index = DIALOGUE.index % array_length(LINES);
	
	with (DIALOGUE) {
	flier(spr_flier_mayor);
	text(LINES[_index]);
} }
#endregion
#region scene_parrot_wants();
function scene_parrot_wants()
{
	static LINES = array_shuffle([
		"The worst part about being in that bubble was that I lost my tan SQUAWK. Tell me if you find my old (BEACH CHAIR) SQUAWK.",
		"I NEED to go dancing SQUAWK.",
		"I like to party SQUAWK but sometimes i just like a quiet night in."
	]);
	var _index = DIALOGUE.index % array_length(LINES);
	
	with (DIALOGUE) {
	flier(spr_flier_parrot);
	text(LINES[_index]);
} }
#endregion
#region scene_parrot_happy();
function scene_parrot_happy()
{ with (DIALOGUE) {
	flier(spr_flier_parrot);
	text("I finally caught some SQUAWK rays. Don't I look good? SQUAWK.");
} }
#endregion
#region scene_fish_wants();
function scene_fish_wants()
{ with (DIALOGUE) {
	flier(spr_flier_fish);
	text("Have you seen my (CAT)? Her name is BrainRot, I hope she's okay...");
} }
#endregion
#region scene_fish_happy();
function scene_fish_happy()
{ with (DIALOGUE) {
	flier(spr_flier_fish);
	text("My girl BrainRot is so sweet. Thank you so much for finding her.");
} }
#endregion
#region scene_otter_wants();
function scene_otter_wants()
{
	static LINES = array_shuffle([
		"Thank you so much for saving me from the bubble. I didn't think I'd make it.",
		"I want to stay on the beach, but the sun's too bright to read my book. The beach or reading... hmmm... if only I had an (UMBRELLA)"
	]);
	var _index = DIALOGUE.index % array_length(LINES);
	
	with (DIALOGUE) {
	flier(spr_flier_otter);
	text(LINES[_index]);
} }
#endregion
#region scene_otter_happy();
function scene_otter_happy()
{ with (DIALOGUE) {
	flier(spr_flier_otter);
	text("Now that there's shade I can finally finish my book.");
} }
#endregion

//Templates
#region scene_template_wants();
function scene_template_wants()
{ with (DIALOGUE) {
	
} }
#endregion
#region scene_template_happy();
function scene_template_happy()
{ with (DIALOGUE) {
	
} }
#endregion