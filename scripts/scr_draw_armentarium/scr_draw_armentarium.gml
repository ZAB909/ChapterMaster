// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drop_down_sandwich(selection, draw_x, draw_y, options, open_marker,left_text,right_text){
	draw_text_transformed(draw_x, draw_y, left_text,1,1,0);
	draw_x += string_width(left_text)+5;
	var results = drop_down(selection, draw_x, draw_y, options,open_marker);
    draw_set_color(c_gray);
	draw_text_transformed(draw_x+9+ string_width(selection), draw_y, right_text,1,1,0);
    return results;
}


function drop_down(selection, draw_x, draw_y, options,open_marker){
	if (selection!=""){
		draw_unit_buttons([draw_x, draw_y],selection,[1,1],c_green);
		draw_set_color(c_red);
		if (array_length(options)>1){
			if (point_in_rectangle(
				mouse_x,
				mouse_y,
				draw_x, 
				draw_y, 
				draw_x + 5 + string_width(selection), 
				draw_y + 4 + string_height(selection)
			)){
				open_marker = true;
			}
			if (open_marker){
				var roll_down_offset=4+string_height(selection);
				for (var col = 0;col<array_length(options);col++){
					if (options[col]==selection) then continue;
					draw_unit_buttons([draw_x , draw_y+roll_down_offset],options[col],[1,1],c_red);
					if (mouse_check_button_pressed(mb_left) && 
						point_in_rectangle(
								mouse_x,
								mouse_y,
								draw_x, 
								draw_y+roll_down_offset, 
								draw_x +5 +string_width(options[col]), 
								draw_y+roll_down_offset+string_height(options[col])+4									
							)){
						selection = options[col];
						open_marker = false;
					}
					roll_down_offset += string_height(options[col])+4;

				}
				if (!point_in_rectangle(
						mouse_x,
						mouse_y,
						draw_x,
						draw_y,
						draw_x + 5 +string_width(selection),
						draw_y+roll_down_offset,
					)
				){
					open_marker = false;
				}
			}
		}
	}
    return [selection,open_marker];
}

function calculate_research_points(){
    var research_points = 0;
    var techs = scr_role_count(obj_ini.role[100][16], "", "units");
    for (var i=0; i<array_length(techs); i++){
        research_points += techs[i].technology-40;
    }
    return research_points;
}
function research_end(){
    var research_points = calculate_research_points();
    stc_research[$ stc_research.research_focus] += research_points;
    var research_area_limit;
    if (stc_research.research_focus=="vehicles"){
        research_area_limit = stc_vehicles;
    } else if (stc_research.research_focus=="wargear"){
        research_area_limit = stc_wargear;
    }else if (stc_research.research_focus=="ships"){
        research_area_limit = stc_ships;
    }    
    if (stc_research[$ stc_research.research_focus]>10000*(research_area_limit+1)){
       identify_stc(stc_research.research_focus);  
    }
}

function identify_stc(area){
    switch(area){
        case "wargear":
            stc_wargear++;
            if (stc_wargear==2) then stc_bonus[1]=choose(1,2,3,4,5);
            if (stc_wargear==4) then stc_bonus[2]=choose(1,2,3);
            stc_research.wargear=0;
            break;
        case "vehicles":
            stc_vehicles++;
            if (stc_vehicles==2) then stc_bonus[3]=choose(1,2,3,4,5);
            if (stc_vehicles==4) then stc_bonus[4]=choose(1,2,3);
            stc_research.vehicles=0;
            break;
         case "ships":
            stc_ships++;
            if (stc_ships==2) then stc_bonus[5]=choose(1,2,3,4,5);
            if (stc_ships==4) then stc_bonus[6]=choose(1,2,3);
            stc_research.ships=0;
            break;                      
    }
}
function scr_draw_armentarium(){
	    var recruitment_pace = [
        " is currently halted.",
        " is advancing sluggishly.",
        " is advancing slowly.",
        " is advancing moderately fast.",
        " is advancing fast.",
        " is advancing frenetically.",
        " is advancing as fast as possible."
    ];
	    var xx = __view_get(e__VW.XView, 0) + 0;
    	var yy = __view_get(e__VW.YView, 0) + 0;
		draw_sprite(spr_rock_bg, 0, xx, yy);

        draw_set_alpha(0.75);
        draw_set_color(0);
        draw_rectangle(xx + 326 + 16, yy + 66, xx + 887 + 16, yy + 818, 0);
        draw_set_alpha(1);
        draw_set_color(c_gray);
        draw_rectangle(xx + 326 + 16, yy + 66, xx + 887 + 16, yy + 818, 1);
        draw_line(xx + 326 + 16, yy + 426, xx + 887 + 16, yy + 426);

        draw_set_alpha(0.75);
        draw_set_color(0);
        draw_rectangle(xx + 945, yy + 66, xx + 1580, yy + 818, 0);
        draw_set_alpha(1);
        draw_set_color(c_gray);
        draw_rectangle(xx + 945, yy + 66, xx + 1580, yy + 818, 1);

        if (menu_adept = 0) {
            // draw_sprite(spr_advisors,4,xx+16,yy+43);
            scr_image("advisor", 4, xx + 16, yy + 43, 310, 828);
            draw_set_halign(fa_left);
            draw_set_color(c_gray);
            draw_set_font(fnt_40k_30b);
            draw_text_transformed(xx + 336 + 16, yy + 66, string_hash_to_newline("Armamentarium"), 1, 1, 0);
            draw_set_font(fnt_40k_30b);
            draw_text_transformed(xx + 336 + 16, yy + 100, string_hash_to_newline("Forge Master " + string(obj_ini.name[0, 2])), 0.6, 0.6, 0);
        }
        if (menu_adept = 1) {
            // draw_sprite(spr_advisors,0,xx+16,yy+43);
            scr_image("advisor", 0, xx + 16, yy + 43, 310, 828);
            draw_set_halign(fa_left);
            draw_set_color(c_gray);
            draw_set_font(fnt_40k_30b);
            draw_text_transformed(xx + 336 + 16, yy + 66, string_hash_to_newline("Armamentarium"), 1, 1, 0);
            draw_set_font(fnt_40k_30b);
            draw_text_transformed(xx + 336 + 16, yy + 100, string_hash_to_newline("Adept " + string(obj_controller.adept_name)), 0.6, 0.6, 0);
        }

        draw_set_font(fnt_40k_30b);
        draw_set_color(c_gray);

        draw_rectangle(xx + 957, yy + 76, xx + 1062, yy + 104, 0);
        draw_rectangle(xx + 1068, yy + 76, xx + 1150, yy + 104, 0);
        draw_rectangle(xx + 1167, yy + 76, xx + 1255, yy + 104, 0);
        draw_rectangle(xx + 1487, yy + 76, xx + 1545, yy + 104, 0);

        draw_set_color(c_black);
        draw_text_transformed(xx + 960, yy + 76, string_hash_to_newline("Equipment"), 0.6, 0.6, 0);
        draw_text_transformed(xx + 1070, yy + 76, string_hash_to_newline("Armour"), 0.6, 0.6, 0);
        draw_text_transformed(xx + 1170, yy + 76, string_hash_to_newline("Vehicles"), 0.6, 0.6, 0);
        draw_text_transformed(xx + 1490, yy + 76, string_hash_to_newline("Ships"), 0.6, 0.6, 0);

        draw_set_alpha(0.2);
        if (mouse_y >= yy + 76) and(mouse_y < yy + 104) {
            if (mouse_x >= xx + 957) and(mouse_x < xx + 1062) then draw_rectangle(xx + 957, yy + 76, xx + 1062, yy + 104, 0);
            if (mouse_x >= xx + 1068) and(mouse_x < xx + 1136) then draw_rectangle(xx + 1068, yy + 76, xx + 1136, yy + 104, 0);
            if (mouse_x >= xx + 1167) and(mouse_x < xx + 1255) then draw_rectangle(xx + 1167, yy + 76, xx + 1255, yy + 104, 0);
            if (mouse_x >= xx + 1487) and(mouse_x < xx + 1545) then draw_rectangle(xx + 1487, yy + 76, xx + 1545, yy + 104, 0);
        }
        draw_set_alpha(1);
        draw_set_color(c_gray);

        draw_set_font(fnt_40k_30b);
        draw_set_halign(fa_center);
        draw_text_transformed(xx + 605, yy + 432, string_hash_to_newline("STC Fragments"), 0.75, 0.75, 0);
        draw_set_font(fnt_40k_14);
        draw_set_halign(fa_left);
        draw_text(xx + 384, yy + 468, string_hash_to_newline(string(stc_wargear_un + stc_vehicles_un + stc_ships_un) + " Unidentified Fragments"));

        draw_set_halign(fa_center);

        if (stc_wargear_un + stc_vehicles_un + stc_ships_un = 0) then draw_set_alpha(0.5);
        draw_set_color(c_gray);
        draw_rectangle(xx + 621, yy + 466, xx + 720, yy + 486, 0);
        draw_set_color(0);
        draw_text(xx + 670, yy + 467, string_hash_to_newline("Identify"));
        if (mouse_x > xx + 621) and(mouse_y > yy + 466) and(mouse_x < xx + 720) and(mouse_y < yy + 486) {
            draw_set_color(0);
            draw_set_alpha(0.2);
            draw_rectangle(xx + 621, yy + 466, xx + 720, yy + 486, 0);
        }
        draw_set_alpha(1);

        if (stc_wargear_un + stc_vehicles_un + stc_ships_un = 0) then draw_set_alpha(0.5);
        draw_set_color(c_gray);
        draw_rectangle(xx + 733, yy + 466, xx + 790, yy + 486, 0);
        draw_set_color(0);
        draw_text(xx + 761, yy + 467, string_hash_to_newline("Gift"));
        if (mouse_x > xx + 733) and(mouse_y > yy + 466) and(mouse_x < xx + 790) and(mouse_y < yy + 486) {
            draw_set_color(0);
            draw_set_alpha(0.2);
            draw_rectangle(xx + 733, yy + 466, xx + 790, yy + 486, 0);
        }
        draw_set_alpha(1);

        draw_set_font(fnt_40k_12);
        draw_set_halign(fa_left);
        draw_set_color(c_gray);

        var max_techs;
        blurp = "";
        max_techs = round((disposition[3] / 2)) + 5;

        var yyy1, yyy;
        yyy1 = max_techs - temp[37];
        if (yyy1 < 0) then yyy1 = yyy1 * -1;
        yyy = (yyy1 * 2);
        if (disposition[3] mod 2 == 0) then yyy += 2;
        else {
            yyy += 1;
        }

        blurp = "Subject ID confirmed.  Rank Identified: Chapter Master.  Salutations Chapter Master.  We have assembled the following Data: ##" + string(obj_ini.role[100, 16]) + "s: " + string(temp[36]) + ".##Summation: ";
        if (max_techs > temp[37]) then blurp += "Our Mechanicus Requisitionary powers are sufficient to train " + string(max_techs - temp[37]) + " additional " + string(obj_ini.role[100, 16]) + ".";
        if (max_techs <= temp[37]) then blurp += "We require " + string(yyy) + " additional Mechanicus Disposition to train one additional " + string(obj_ini.role[100, 16]) + ".";
        blurp += "  The training of new " + string(obj_ini.role[100, 16]) + "s";

        if (menu_adept = 1) {
            blurp = "Your Chapter contains " + string(temp[36]) + " " + string(obj_ini.role[100, 16]) + ".##";
            blurp += "The training of a new " + string(obj_ini.role[100, 16]);
        }
        if (training_techmarine = 0) {
            blurp += recruitment_pace[training_techmarine];
        }
        if (training_techmarine = 1) {
            blurp += recruitment_pace[training_techmarine];
            eta = floor((359 - tech_points) / 1) + 1;
        }
        if (training_techmarine = 2) {
            blurp += recruitment_pace[training_techmarine];
            eta = floor((359 - tech_points) / 2) + 1;
        }
        if (training_techmarine = 3) {
            blurp += recruitment_pace[training_techmarine];
            eta = floor((359 - tech_points) / 4) + 1;
        }
        if (training_techmarine = 4) {
            blurp += recruitment_pace[training_techmarine];
            eta = floor((359 - tech_points) / 6) + 1;
        }
        if (training_techmarine = 5) {
            blurp += recruitment_pace[training_techmarine];
            eta = floor((359 - tech_points) / 8) + 1;
        }
        if (training_techmarine = 6) {
            blurp += recruitment_pace[training_techmarine];
            eta = floor((359 - tech_points) / 16) + 1;
        }

        if (tech_aspirant > 0) and(training_techmarine > 0) and(menu_adept = 1) {
            if (eta = 1) then blurp += "  Your current " + string(obj_ini.role[100, 16]) + " Aspirant will finish training in " + string(eta) + " month.";
            if (eta != 1) then blurp += "  Your current " + string(obj_ini.role[100, 16]) + " Aspirant will finish training in " + string(eta) + " months.";
        }
        if (tech_aspirant > 0) and(training_techmarine > 0) and(menu_adept = 0) {
            if (eta = 1) then blurp += "  The current " + string(obj_ini.role[100, 16]) + " Aspirant will finish training in " + string(eta) + " month.";
            if (eta != 1) then blurp += "  The current " + string(obj_ini.role[100, 16]) + " Aspirant will finish training in " + string(eta) + " months.";
        }
        if (menu_adept = 0) then blurp += "##Data compilation complete.  We currently possess the technology to produce the following:";

        if (menu_adept = 1) {
            if (max_techs > temp[37]) then blurp += "##Mechanicus Requisitionary powers are sufficient to train " + string(max_techs - temp[37]) + " additional " + string(obj_ini.role[100, 16]) + ".";
            if (max_techs <= temp[37]) then blurp += "You require " + string(yyy) + " additional Mechanicus Disposition to train one additional " + string(obj_ini.role[100, 16]) + ".";

            blurp += "##Data compilation complete.  You currently possess the technology to produce the following:";
        }

        draw_text_ext(xx + 336 + 16, yy + 130, string_hash_to_newline(string(blurp)), -1, 536);

		var y_offset = yy + 130 + string_height_ext(string_hash_to_newline(string(blurp)), -1, 536)+10;
        var research_area_limit;
        if (stc_research.research_focus=="vehicles"){
            research_area_limit = stc_vehicles;
        } else if (stc_research.research_focus=="wargear"){
            research_area_limit = stc_wargear;
        }else if (stc_research.research_focus=="ships"){
            research_area_limit = stc_ships;
        }
        var research_progress = ceil(((10000*(research_area_limit+1))-stc_research[$ stc_research.research_focus])/research_points);
		static research_drop_down = false;
		var drop_down_results = drop_down_sandwich(
            stc_research.research_focus,
            xx + 336 + 16,
            y_offset,
            ["vehicles","wargear", "ships"],
            research_drop_down,
            "research is currently focussed on", 
            ".");
        research_drop_down = drop_down_results[1];
        stc_research.research_focus = drop_down_results[0];
        var research_eta_message = $"Based on current progress it will be {research_progress} months until next significant research step is complete";
        draw_text_ext(xx + 336 + 16, y_offset+20, string_hash_to_newline(research_eta_message), -1, 536);

        var hi;
        draw_set_color(38144);
        hi = 0;
        if (stc_wargear > 0) then hi = (stc_wargear / 6) * 210;
        draw_rectangle(xx + 351, yy + 539, xx + 368, yy + 539 + hi, 0);
        hi = 0;
        if (stc_vehicles > 0) then hi = (stc_vehicles / 6) * 210;
        draw_rectangle(xx + 531, yy + 539, xx + 548, yy + 539 + hi, 0);
        hi = 0;
        if (stc_ships > 0) then hi = (stc_ships / 6) * 210;
        draw_rectangle(xx + 711, yy + 539, xx + 728, yy + 539 + hi, 0);

        draw_set_color(c_gray);
        draw_rectangle(xx + 351, yy + 539, xx + 368, yy + 749, 1);
        draw_rectangle(xx + 531, yy + 539, xx + 548, yy + 749, 1);
        draw_rectangle(xx + 711, yy + 539, xx + 728, yy + 749, 1);

        draw_set_font(fnt_40k_14);
        draw_text(xx + 386, yy + 517, string_hash_to_newline("Wargear"));
        draw_text(xx + 566, yy + 517, string_hash_to_newline("Vehicles"));
        draw_text(xx + 746, yy + 517, string_hash_to_newline("Ships"));

        draw_set_font(fnt_40k_12);
        draw_set_alpha(1);
        if (stc_wargear < 1) then draw_set_alpha(0.5);
        draw_text(xx + 372, yy + 549, string_hash_to_newline("1) 8% discount"));
        var ta = "Random";
        if (stc_bonus[1] = 1) then ta = "Enhanced Bolts";
        if (stc_bonus[1] = 2) then ta = "Enhanced Chain Weapons";
        if (stc_bonus[1] = 3) then ta = "Enhanced Flame Weapons";
        if (stc_bonus[1] = 4) then ta = "Enhanced Missiles";
        if (stc_bonus[1] = 5) then ta = "Enhanced Armour";
        draw_set_alpha(1);

        if (stc_wargear < 2) then draw_set_alpha(0.5);
        draw_text(xx + 372, yy + 549 + 35, string_hash_to_newline("2) " + string(ta)));
        draw_set_alpha(1);

        if (stc_wargear < 3) then draw_set_alpha(0.5);
        draw_text(xx + 372, yy + 549 + 70, string_hash_to_newline("3) 16% discount"));

        ta = "Random";
        if (stc_bonus[2] = 1) then ta = "Enhanced Fist Weapons";
        if (stc_bonus[2] = 2) then ta = "Enhanced Plasma";
        if (stc_bonus[2] = 3) then ta = "Enhanced Armour";
        draw_set_alpha(1);

        if (stc_wargear < 4) then draw_set_alpha(0.5);
        draw_text(xx + 372, yy + 549 + 105, string_hash_to_newline("4) " + string(ta)));
        draw_set_alpha(1);

        if (stc_wargear < 5) then draw_set_alpha(0.5);
        draw_text(xx + 372, yy + 549 + 140, string_hash_to_newline("5) 25% discount"));
        draw_set_alpha(1);

        if (stc_wargear < 6) then draw_set_alpha(0.5);
        draw_text_ext(xx + 372, yy + 549 + 175, string_hash_to_newline("6) Can produce Terminator Armour and Dreadnoughts."), -1, 140);
        draw_set_alpha(1);

        // 21 right of the gray bar
        draw_set_font(fnt_40k_12);
        draw_set_alpha(1);
        if (stc_vehicles < 1) then draw_set_alpha(0.5);
        draw_text(xx + 552, yy + 549, string_hash_to_newline("1) 8% discount"));

        ta = "Random";
        if (stc_bonus[3] = 1) then ta = "Enhanced Hull";
        if (stc_bonus[3] = 2) then ta = "Enhanced Accuracy";
        if (stc_bonus[3] = 3) then ta = "New Weapons";
        if (stc_bonus[3] = 4) then ta = "Survivability";
        if (stc_bonus[3] = 5) then ta = "Enhanced Armour";
        draw_set_alpha(1);

        if (stc_vehicles < 2) then draw_set_alpha(0.5);
        draw_text(xx + 552, yy + 549 + 35, string_hash_to_newline("2) " + string(ta)));
        draw_set_alpha(1);

        if (stc_vehicles < 3) then draw_set_alpha(0.5);
        draw_text(xx + 552, yy + 549 + 70, string_hash_to_newline("3) 16% discount"));

        ta = "Random";
        if (stc_bonus[4] = 1) then ta = "Enhanced Hull";
        if (stc_bonus[4] = 2) then ta = "Enhanced Armour";
        if (stc_bonus[4] = 3) then ta = "New Weapons";
        draw_set_alpha(1);

        if (stc_vehicles < 4) then draw_set_alpha(0.5);
        draw_text(xx + 552, yy + 549 + 105, string_hash_to_newline("4) " + string(ta)));
        draw_set_alpha(1);

        if (stc_vehicles < 5) then draw_set_alpha(0.5);
        draw_text(xx + 552, yy + 549 + 140, string_hash_to_newline("5) 25% discount"));
        draw_set_alpha(1);

        if (stc_vehicles < 6) then draw_set_alpha(0.5);
        draw_text_ext(xx + 552, yy + 549 + 175, string_hash_to_newline("6) Can produce Land Speeders and Land Raiders."), -1, 140);
        draw_set_alpha(1);

        // 21 right of the gray bar
        draw_set_font(fnt_40k_12);
        draw_set_alpha(1);
        if (stc_ships < 1) then draw_set_alpha(0.5);
        draw_text(xx + 732, yy + 549, string_hash_to_newline("1) 8% discount"));
        ta = "Random";
        if (stc_bonus[5] = 1) then ta = "Enhanced Hull";
        if (stc_bonus[5] = 2) then ta = "Enhanced Accuracy";
        if (stc_bonus[5] = 3) then ta = "Enhanced Turning";
        if (stc_bonus[5] = 4) then ta = "Enhanced Boarding";
        if (stc_bonus[5] = 5) then ta = "Enhanced Armour";
        draw_set_alpha(1);

        if (stc_ships < 2) then draw_set_alpha(0.5);
        draw_text(xx + 732, yy + 549 + 35, string_hash_to_newline("2) " + string(ta)));
        draw_set_alpha(1);

        if (stc_ships < 3) then draw_set_alpha(0.5);
        draw_text(xx + 732, yy + 549 + 70, string_hash_to_newline("3) 16% discount"));

        ta = "Random";
        if (stc_bonus[6] = 1) then ta = "Enhanced Hull";
        if (stc_bonus[6] = 2) then ta = "Enhanced Armour";
        if (stc_bonus[6] = 3) then ta = "Enhanced Speed";
        draw_set_alpha(1);

        if (stc_ships < 4) then draw_set_alpha(0.5);
        draw_text(xx + 732, yy + 549 + 105, string_hash_to_newline("4) " + string(ta)));
        draw_set_alpha(1);

        if (stc_ships < 5) then draw_set_alpha(0.5);
        draw_text(xx + 732, yy + 549 + 140, string_hash_to_newline("5) 25% discount"));
        draw_set_alpha(1);

        if (stc_ships < 6) then draw_set_alpha(0.5);
        draw_text_ext(xx + 732, yy + 549 + 175, string_hash_to_newline("6) Warp Speed is increased and ships self-repair."), -1, 140);
        draw_set_alpha(1);
}