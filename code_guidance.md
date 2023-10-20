Coders guidance
add to as you see fit, but try to keep doc easy to use

Useful functions:
TTRPG_stats(faction, comp, mar, class = "marine")
		creates a new unit struct see scr_marine_struct.gml for more info


		unit_Struct.name_role()
			provides a string representation of the unit name combined with the unit role 
			taking into account the unit role display name as provided by the units squad type

scr_random_marine(argument0, argument1)
		selects a random player unit within the parameters given
		if no marine is available with give parameters returns "none"


keys and data:
faction key:
	imperium:2
	mechanics:3
	inquisition:4
	sororities:5


Visual and draw functions

tool_tip_draw(x,y,tool_tip_text)
	creates a hover over tool tip at the given coordinate where:
		x is the left most point of the tooltip box
		y is the topmost point of the tooltip box,
		tool_tip_text is the text to display (text should be preformatted e.g string_hash_to_newline() to create lines)

scr_convert_company_to_string(marine company)
	returns a sting representation of a marines compant

