// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_unit_stat_data(manage=false){
	var xx=__view_get( e__VW.XView, 0 )+0;
	var yy=__view_get( e__VW.YView, 0 )+0;
	var stat_tool_tips = [];
	var stat_tool_tip_text = "";
	draw_set_color(0);
	draw_rectangle(xx+1004,yy+519,xx+1576,yy+957,0);
	var left_edge = xx+1004;
	var stat_x = xx+1004;
	var stat_y = yy+519;
	draw_set_color(0);

	stat_display_list = [
		[string(dexterity),
		"Measure of how quick and nimble unit is as well as their base ability to manipulate and do tasks with their hands (improves ranged attack).",
		#306535,
		spr_dexterity_icon,
		"Dexterity"],	

		[string(strength),
		"How strong a unit is (can wield heavier equipment without detriment and is more deadly in close combat).",
		#1A3B3B,
		spr_strength_icon,
		"Strength"],

		[string(constitution),
		"Unit's general toughness and resistance to damage (increases health and damage resistance).",
		#9B403E,
		spr_constitution_icon,
		"Constitution"],

		[string(intelligence),
		"Measure of learnt knowledge and specialist skill aptitude.",
		#2F3B6B,
		spr_intelligence_icon,
		"Intelligence"],

		[string(wisdom),
		"Unit's perception and street smarts including certain types of battlefield knowledge.",
		#54540B,
		spr_wisdom_icon,
		"Wisdom"],

		[string(piety),
		"Unit's faith in their given religion (or general aptitude towards faith).",
		#6A411C,
		spr_faith_icon,
		"Piety"],

		[string(weapon_skill),
		"General skill with close combat weaponry.",
		#87753C,
		spr_weapon_skill_icon,
		"Weapon Skill"],

		[string(ballistic_skill),
		"General skill with ballistic and ranged weaponry.",
		#743D57,
		spr_ballistic_skill_icon,
		"Ballistic Skill"],

		[string(luck),
		"...Luck...",
		#05451E,
		spr_luck_icon,
		"Luck"],

		[string(technology),
		"Skill and understanding of technology and various technical thingies.",
		#4F0105,
		spr_technology_icon,
		"Technology"],

		[string(charisma),
		"General likeability and ability to interact with people.",
		#3A0339,
		spr_charisma_icon,
		"Charisma"],			    					    					    					    			
	]
	draw_set_color(c_gray);
	draw_rectangle(stat_x,stat_y, stat_x + (36*array_length(stat_display_list)), stat_y+48+8, 0)
	draw_set_color(c_black);
	draw_rectangle(stat_x,stat_y, stat_x + (4*array_length(stat_display_list)), stat_y+48+4, 1)
	stat_y+=4;
	stat_x+=4;
	var viewing_stat,icon_colour;
	for (i=0; i<array_length(stat_display_list);i++){
		icon_colour = c_gray;
		viewing_stat=false;
		if (point_in_rectangle(mouse_x, mouse_y, stat_x,stat_y,stat_x+32,stat_y+48)){
			viewing_stat=true;
			icon_colour = c_white;
		}
		if (viewing_stat){
			draw_set_color(stat_display_list[i][2]);
		}else {
			draw_set_color(c_black);
		}
		//draw_set_color(c_black);
		draw_rectangle(stat_x,stat_y,stat_x+32,stat_y+48, 0);
		draw_set_color(c_black);
		draw_rectangle(stat_x,stat_y,stat_x+32,stat_y+48, 1);
		//draw_rectangle(stat_x-1,stat_y-1,stat_x+33,stat_y+49, 1);
		draw_sprite_ext(stat_display_list[i][3],0, stat_x,stat_y, 0.5, 0.5, 0, icon_colour, 1);
		draw_set_color(c_white);
		draw_text(stat_x+12, stat_y+33,stat_display_list[i][0])
		if (manage){
			if point_and_click([stat_x, stat_y, stat_x+32, stat_y+45]){
				filter_and_sort_company("stat", stat_display_list[i][4]);
				unit_text = false;
			}
		}
		array_push(stat_tool_tips,[stat_x, stat_y, stat_x+32, stat_y+50,stat_display_list[i][1], stat_display_list[i][4]]);
		stat_x+=36;
	}

	var stat_middle = left_edge+((stat_x -left_edge)/2);
	var stats_base = stat_y+48+4;

	draw_set_color(c_gray);
	draw_rectangle(stat_middle-70,stats_base, stat_middle+67, stats_base+70, 0);
	draw_set_color(c_black);
	draw_rectangle(stat_middle-66,stats_base+1, stat_middle-1, stats_base+65, 1);
	draw_rectangle(stat_middle-66,stats_base,stat_middle-1,stats_base+64, 0);
	draw_sprite_ext(spr_warp_level_icon,2, stat_middle-66,stats_base, 1, 1, 0, c_white, 1);
	draw_set_color(c_white);
	draw_text(stat_middle-34-(string_width($"{psionic}")/2),stats_base+35-(string_height("0")/2), $"{psionic}")
	array_push(stat_tool_tips,[stat_middle-70,stats_base+1, stat_middle-1, stats_base+70, "Imperial psionic rating", "Psy"]);

	//draw_rectangle(stat_middle+1,stats_base+2,stat_middle+1,stats_base+34, 0);
	var is_forge = IsSpecialist("forge");
	draw_sprite_ext(
		spr_forge_points_icon,
		0, 
		stat_middle+2,
		stats_base, 
		1, 
		1, 
		0,
		is_forge? c_white: c_gray,
		1); 

	if (is_forge){
		draw_text(stat_middle+34-(string_width($"{Forge_point_generation()[0]}")/2),stats_base+35-(string_height("0")/2), $"{Forge_point_generation()[0]}")
		array_push(stat_tool_tips,[stat_middle+2,stats_base, stat_middle+66, stats_base+70, "Forge point production", "Forge Points"]);
	} else {
		array_push(stat_tool_tips,[stat_middle+2,stats_base, stat_middle+66, stats_base+70,"Unit does not produce forge points", "Forge Points"]);
	}	


	//var warp_box_size = tooltip_draw(stat_x,stat_y+56,$"Warp Level:{psionic}");
	//draw_set_color(c_red);
	//if (IsSpecialist("forge")){
	//	tooltip_draw(stat_x,stat_y+45+warp_box_size[1],$"Forge Points:{forge_point_generation()}");
	//}		    		
	draw_line(stat_x, yy+519, stat_x, yy+957);

	draw_set_alpha(0)
	draw_set_color(c_gray);

		tooltip_text = "Traits##";
		for (i=0;i<array_length(traits);i++){
			tooltip_text += global.trait_list[$ traits[i]].display_name;
			tooltip_text +="#";
		}
		tooltip_text = string_hash_to_newline(tooltip_text);
		tooltip_draw(tooltip_text, undefined, stat_x+2,stat_y);
		if (!obj_controller.view_squad && obj_controller.managing >0 && obj_controller.unit_text){
			var unit_data_string = unit_profile_text();
			tooltip_draw(unit_data_string, 970, xx+25,yy+144);
		}
		draw_text(stat_middle-66, stats_base+75, $"Loyalty : {loyalty}")
		draw_text(stat_middle-66, stats_base+110, $"Corruption : {corruption}")		
		for (i=0;i<array_length(stat_tool_tips);i++){
			if (point_in_rectangle(mouse_x, mouse_y, stat_tool_tips[i][0], stat_tool_tips[i][1], stat_tool_tips[i][2], stat_tool_tips[i][3])){
				tooltip_draw(stat_tool_tips[i][4], 200, stat_tool_tips[i][0], stat_tool_tips[i][3],,,stat_tool_tips[i][5]);
			}
		}
		draw_set_alpha(1)
}