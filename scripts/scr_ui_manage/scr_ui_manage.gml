function draw_unit_buttons(position, text,size_mod=[1.5,1.5],colour=c_gray,align=fa_left, font=fnt_40k_14b, alpha_mult=1){
	draw_set_alpha(1*alpha_mult);
	draw_set_font(font);
	draw_set_halign(align);
	var full_width;
	var full_height;
	if (array_length(position)>2){
		var full_width = position[2];
		var full_height= position[3];
	} else {
		var text_width = string_width(string_hash_to_newline(text))*size_mod[0];
		var text_height =string_height(string_hash_to_newline(text))*size_mod[1];
		var full_width = position[0]+text_width+8
		var full_height = position[1]+text_height+4;
	}
	// draw_set_color(c_black);
	// draw_rectangle(position[0],position[1], full_width,full_height,0)
	draw_set_color(colour);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed((position[0] + full_width)/2, (position[1] + full_height)/2,string_hash_to_newline(text),size_mod[0],size_mod[1],0);
	draw_rectangle(position[0],position[1], full_width,full_height,1)
	draw_set_alpha(0.5*alpha_mult);
	draw_rectangle(position[0]+1,position[1]+1, full_width-1,full_height-1,1)
	draw_set_alpha(0.25*alpha_mult);
	if (point_in_rectangle(mouse_x,mouse_y, position[0],position[1], full_width,full_height)){
		draw_rectangle(position[0],position[1], full_width,full_height,0);
	}
	draw_set_alpha(1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	return [position[0],position[1], full_width,full_height];
}

function text_bar_area(XX,YY,Max_width = 400) constructor{
	allow_input=false;
	xx=XX;
	yy=YY
	max_width = Max_width;
	cooloff=0
    // Draw BG
    static draw = function(string_area){
    	if (cooloff>0) then cooloff--;
    	if (allow_input){
    		string_area=keyboard_string;
    	}
	    draw_set_alpha(1);
	    //draw_sprite(spr_rock_bg,0,xx,yy);
	    draw_set_font(fnt_40k_30b);
	    draw_set_halign(fa_center);
	    draw_set_color(c_gray);// 38144	
		var bar_wid=max_width,click_check, string_h;
	    draw_set_alpha(0.25);
	    if (string_area!=""){
	    	bar_wid=max(max_width,string_width(string_hash_to_newline(string_area)));
	    }
		string_h = string_height("LOL");
		var rect = [xx-(bar_wid/2),yy,xx+(bar_wid/2),yy-8+string_h]
	    draw_rectangle(rect[0],rect[1],rect[2],rect[3],1);
	    click_check = point_and_click(rect);
	    obj_cursor.image_index=0;
	    if (cooloff==0){
		    if (allow_input && mouse_check_button(mb_left) && !click_check){
	    	    allow_input=false;
	    	    cooloff=5;
	    	}else if (!allow_input && click_check){
		        obj_cursor.image_index=2;
		        allow_input=true;
	        	keyboard_string = string_area;
	        	cooloff=5;
		    }
		}

	    draw_set_alpha(1);

    	draw_set_font(fnt_fancy);
        if (!allow_input) then draw_text(xx,yy+2,string_hash_to_newline("''"+string(string_area)+"'' "));
        if (allow_input){
        	obj_cursor.image_index=2;
        	draw_text(xx,yy+2,string_hash_to_newline("''"+string(string_area)+"|''"))
        };
		return string_area;
	}
}

function scr_ui_manage() {

	if (combat!=0) then exit;

	// This is the draw script for showing the main management screen or individual company screens

	if (menu==1) and (managing>0 || managing <0){
		var unit,i,x1,x2,y1,y2, var_text;
		var romanNumerals=scr_roman_numerals();	
		var tooltip_text="",bionic_tooltip="",tooltip_drawing=[];
		

	    var xx=__view_get( e__VW.XView, 0 )+0, yy=__view_get( e__VW.YView, 0 )+0, bb="", img=0;

	    // Draw BG
	    draw_set_alpha(1);
	    draw_sprite(spr_rock_bg,0,xx,yy);
	    draw_set_font(fnt_40k_30b);
	    draw_set_halign(fa_center);
	    draw_set_color(c_gray);// 38144
    
		// Var declarations
	    var c=0,fx="",skin=obj_ini.skin_color;
		
		if (managing>0){
		    if (managing>20){
		    	c=managing-10;
		    }else if (managing >= 1) and (managing <=10) {
				fx= romanNumerals[managing - 1] + " Company";
				c=managing;
			} else if (managing>10) {
				switch(managing){
					case 11:
						fx="Headquarters"
						break;
					case 12:
						fx="Apothecarion";
						break;
					case 13:
						fx="Librarium";
						break;
					case 14:
						fx="Reclusium";
						break;
					case 15:
						fx="Armamentarium";
						break;
				}
			}
		// Draw the company followed by chapters name
	    	draw_text(xx+800,yy+74,string_hash_to_newline(string(fx)+", "+string(global.chapter_name)));			
		} else if (managing<0){
			draw_text(xx+800,yy+74,selection_data.purpose);			
		}
		
	    if (managing<=10 && managing>0){
	        var bar_wid=0,click_check, string_h;
	        draw_set_alpha(0.25);
	        if (obj_ini.company_title[managing]!="") then bar_wid=max(400,string_width(string_hash_to_newline(obj_ini.company_title[managing])));
	        if (obj_ini.company_title[managing]="") then bar_wid=400;
        	string_h = string_height(string_hash_to_newline("LOL"));
	        draw_rectangle(xx+800-(bar_wid/2),yy+108,xx+800+(bar_wid/2),yy+100+string_h,1);
	        click_check = scr_hit(xx+800-(bar_wid/2),yy+108,xx+800+(bar_wid/2),yy+100+string_h);
	        obj_cursor.image_index=0;
	        if (!click_check) and (mouse_left==1) and (cooldown<=0){
	         text_bar=0;
	        }else if(click_check){
	            obj_cursor.image_index=2;
            
	            if (cooldown<=0) and (mouse_left==1) and (text_bar=0){
	                cooldown=8000;
	                text_bar=1;
	                keyboard_string=obj_ini.company_title[managing];
	            }
            
	        }
	        draw_set_alpha(1);
        
	        if (obj_ini.company_title[managing]!="") or (text_bar>0){
	        	draw_set_font(fnt_fancy);
	            if (text_bar=0) or (text_bar>31) then draw_text(xx+800,yy+110,string_hash_to_newline("''"+string(obj_ini.company_title[managing])+"'' "));
	            if (text_bar>0) and (text_bar<=31) then draw_text(xx+800,yy+110,string_hash_to_newline("''"+string(obj_ini.company_title[managing])+"|''"));
	        }
	    }
    
	    // var we;we=string_width(string(global.chapter_name)+" "+string(fx))/2;
    	
    	if (managing>0){
			// Draw arrows
		    draw_sprite_ext(spr_arrow,0,xx+25,yy+70,2,2,0,c_white,1);// Back
		    draw_sprite_ext(spr_arrow,0,xx+429,yy+70,2,2,0,c_white,1);// Left
		    draw_sprite_ext(spr_arrow,1,xx+1110,yy+70,2,2,0,c_white,1);// Right
	    } else {
			if (exit_button.draw_shutter(xx+400,yy+70, "Exit", 0.5, true)){
				exit_adhoc_manage();
			}
			if (selection_data.purpose_code!="manage"){
				if ((man_size==0 || man_size>selection_data.number)){
					proceed_button.draw_shutter(xx+1110,yy+70, "Proceed", 0.5, false);
				} else {
					if (proceed_button.draw_shutter(xx+1110,yy+70, "Proceed", 0.5, true)){
		                selections = [];
		                var forge = selection_data.feature.feature;
		                forge.techs_working = 0;
		                for (var i=0; i<500;i++){
		                	if (ma_name[i]== "") then continue;
		                	if (man_sel[i]>0){
		                		switch(selection_data.purpose_code){
		                			case "forge_assignment":
			                			forge.techs_working++;
			                			unit = display_unit[i];
			                			unit.unload(selection_data.planet, selection_data.system);
			                			unit.job = {type:"forge", planet:selection_data.planet, location:selection_data.system.name};
		                				break;
		                		}
		                	} else {
		                		unit = display_unit[i];
		                		var job = unit.job;
		                		if (job!="none"){
			                		if (job.type=="forge" && job.planet == selection_data.planet){
										unit.job = "none";
										forge.techs_working--;
			                		}
			                	}
		                	}
		                }
		                switch(selection_data.purpose_code){
		                	case "forge_assignment":
		                		calculate_research_points();
		                		break;
	
		                }
		                exit_adhoc_manage();				
					}
				}
			}
	    }
		var right_ui_block = {
			x1: xx + 1008,
			y1: yy + 141,
			w: 568,
			h: 681,
		};
		right_ui_block.x2 = right_ui_block.x1 + right_ui_block.w;
		right_ui_block.y2 = right_ui_block.y1 + right_ui_block.h;

		var actions_block = {
			x1: right_ui_block.x1,
			y1: yy + 520,
			w: 569,
			h: 302,
		};
		actions_block.x2 = actions_block.x1 + actions_block.w;
		actions_block.y2 = actions_block.y1 + actions_block.h;

		draw_sprite_stretched(spr_data_slate_back, 0, actions_block.x1, actions_block.y1, actions_block.w, actions_block.h);
		draw_rectangle_color_simple(actions_block.x1, actions_block.y1, actions_block.x2, actions_block.y2, 1, c_gray);
		draw_rectangle_color_simple(actions_block.x1 + 1, actions_block.y1 + 1, actions_block.x2 - 1, actions_block.y2 - 1, 1, c_black);
		draw_rectangle_color_simple(actions_block.x1 + 2, actions_block.y1 + 2, actions_block.x2 - 2, actions_block.y2 - 2, 1, c_gray);

		var unit_view_block = {
			x1: right_ui_block.x1,
			y1: yy + 140,
			w: 571,
			h: 380,
		};
		unit_view_block.x2 = unit_view_block.x1 + unit_view_block.w;
		unit_view_block.y2 = unit_view_block.y1 + unit_view_block.h;

		draw_set_color(c_white);
		draw_sprite_stretched(spr_data_slate_back, 0, xx+1007-1, yy+140, 572, 378);
		draw_sprite_stretched(spr_data_slate_border, 0, xx+1007-1, yy+140, 572, 378);
		// draw_rectangle_color_simple(xx+1007, yy+140, xx+1579, yy+519, 0, c_white, 0.05);
		draw_rectangle_color_simple(xx+1007, yy+140, xx+1579, yy+519, 0, 5998382, 0.05);
		// Swap between squad view and normal view
	    draw_set_color(c_gray);
	    // draw_line(xx+1005,yy+519,xx+1576,yy+519);
	    draw_set_font(fnt_40k_14b);
	    var cn=obj_controller;
	    if (instance_exists(cn)) and (is_struct(temp[120])){
	    	var selected_unit = temp[120];				//unit struct
	    	///tooltip_text stacks hover over type tooltips into an array and draws them last so as not to create drawing order issues
		    draw_set_color(c_red);
		    var stat_tool_tip_text;
		    if (!obj_controller.view_squad && !obj_controller.company_report){
			    stat_tool_tip_text = "Squad View";
			} else {
				stat_tool_tip_text = "Company View"; 
			}
		    var x5=right_ui_block.x1+15;//this should be relational with the unit area tab
			var y5=right_ui_block.y1+8;
			var x6=x5+string_width("Company View")+8;
			var y6=y5+string_height(stat_tool_tip_text)+4;
			draw_unit_buttons([x5, y5, x6, y6], stat_tool_tip_text,[1,1],#50a076);
			if (managing>0 && managing<11){
				array_push(tooltip_drawing, ["Click here or press S to toggle Squad View.", [x5,y5,x6,y6]]);
				if ((point_in_rectangle(mouse_x, mouse_y,x5,y5,x6,y6) && mouse_check_button_pressed(mb_left)) || (keyboard_check_pressed(ord("S")) && !text_bar)){
					obj_controller.view_squad = !obj_controller.view_squad;
					if (stat_tool_tip_text=="Squad View"){
						obj_controller.company_data = new scr_company_struct(obj_controller.managing);
						obj_controller.unit_profile = true;
					} else {
						obj_controller.unit_profile = false;
					}
				}	
			} else{
				draw_set_alpha(0.5);
				draw_set_color(c_black);
				draw_rectangle(x5, y5, x6, y6, 0);
				draw_set_alpha(1);
			}

		    if (!obj_controller.unit_profile || obj_controller.view_squad){
			    stat_tool_tip_text = "Show Profile";
			} else {
				stat_tool_tip_text = "Hide Profile"; 
			}
		    x5=x6+4;
			x6=x5+string_width("Show Profile")+8;
		    draw_unit_buttons([x5, y5, x6, y6], stat_tool_tip_text,[1,1],#50a076);
		    array_push(tooltip_drawing, ["Click here or press P to show unit profile.", [x5,y5,x6,y6]]);
			if (((keyboard_check_pressed(ord("P"))&& !text_bar)|| (point_in_rectangle(mouse_x, mouse_y,x5,y5,x6,y6) && mouse_check_button_pressed(mb_left))) && !instance_exists(obj_temp3) && !instance_exists(obj_popup)){
				if (view_squad){
					view_squad =false;
				}else {
					obj_controller.unit_profile = !obj_controller.unit_profile;
				}
			}
			x5=x6+4;
			if (managing<0 && selection_data.purpose_code!="manage") then unit_profile=true;
			//TODO Implement company report
			/*var x6=x5+string_width(stat_tool_tip_text)+4;
			var y6=y5+string_height(stat_tool_tip_text)+2;	    
		    draw_unit_buttons([x5,y5,x6,y6], stat_tool_tip_text,[1,1],c_red);
		    if (company_data!={}){
    		    array_push(tooltip_drawing, ["click or press R to show Company Report", [x5,y5,x6,y6]]);
    			if ((keyboard_check_pressed(ord("R"))|| (point_in_rectangle(mouse_x, mouse_y,x5,y5,x6,y6) && mouse_check_button_pressed(mb_left))) && !instance_exists(obj_temp3) && !instance_exists(obj_popup)){
    				view_squad =false;
    				unit_profile=false;
    				company_report = !company_report;
    			}
    		}else{
				draw_set_alpha(0.5);
				draw_set_color(c_black);
				draw_rectangle(x5,y5,x6,y6,0);
				draw_set_alpha(1);
			}
			*/			    

			// Draw unit image
			draw_set_color(c_white);	    	
			selected_unit.draw_unit_image(1208,210);

			// Animated scanline
			draw_set_color(5998382);
			var step_millisecond = current_time / 1000;
			var anim_length = 10; // anim cycle length in seconds
			var anim = (step_millisecond % anim_length) / anim_length * 20; // anim will cycle from 0 to 20 over the duration specified by anim_length
			if (anim <= 10) then draw_set_alpha(anim / 10);
			else draw_set_alpha(2 - (anim / 10));
			line_move = yy+140+4 + (368 * ((anim % 20) / 20));
			if (irandom(100) <= 5){line_move-=4};
			draw_line(xx+1007+18, line_move, xx+1576-23, line_move);
			draw_set_alpha(1);

			// Unit window entries start
			var line_color = #50a076;
			draw_set_color(line_color);

			// Draw unit name and role
			draw_set_halign(fa_center);
			draw_set_font(fnt_40k_30b);
			draw_text_transformed_outline(xx+1290,yy+177,string_hash_to_newline(selected_unit.name_role()),0.7,0.7,0);

			// Draw unit info
			draw_set_font(fnt_40k_14);
			// Left side of the screen
			draw_set_halign(fa_left);
			var x_left = xx+1030;

			// Equipment
        	var armour = selected_unit.armour();
	        if (armour!=""){
				var_text= string_hash_to_newline(armour);
	        	tooltip_text += cn.temp[103];
	        	x1 = x_left;
	        	y1 = yy+216;
	        	x2 = x1+string_width_ext(var_text, -1,187);
	        	y2 = y1+string_height_ext(var_text, -1,187);
				draw_set_alpha(1);
	        	draw_text_ext_outline(x1,y1,var_text,-1,187, 0, quality_color(selected_unit.armour_quality));
	        	array_push(tooltip_drawing, [tooltip_text, [x1,y1,x2,y2]]); 
	        } 

	        var gear = selected_unit.gear();
	        if (selected_unit.gear()!=""){
				var_text= string_hash_to_newline(gear);
	        	tooltip_text = cn.temp[105];
	        	x1 = x_left;
	        	y1 = yy+260;
	        	x2 = x1+string_width_ext(var_text, -1,187);
	        	y2 = y1+string_height_ext(var_text, -1,187);	 
	        	draw_text_ext_outline(x1,y1,var_text,-1,187, 0, quality_color(selected_unit.gear_quality));
	        	array_push(tooltip_drawing, [tooltip_text, [x1,y1,x2,y2]]);
	        }

	        var mobi = selected_unit.mobility_item();
	        if (mobi!=""){
				var_text= string_hash_to_newline(mobi);
	        	tooltip_text = cn.temp[107];
	        	x1 = x_left;
	        	y1 = yy+304;
	        	x2 = x1+string_width_ext(var_text, -1,187);
	        	y2 = y1+string_height_ext(var_text, -1,187);	  
	        	draw_text_ext_outline(x1,y1,var_text,-1,187, 0, quality_color(selected_unit.mobility_item_quality));
	        	array_push(tooltip_drawing, [tooltip_text, [x1,y1,x2,y2]]);
	        }

			// Stats
    		var_text = string_hash_to_newline(string("Bionics: {0}",selected_unit.bionics));
        	x1 = x_left;
        	y1 = yy+444;
        	x2 = x1+string_width(var_text);
        	y2 = y1+string_height(var_text);
	        draw_text_outline(x1,y1,var_text);
	        for (var part = 0; part<array_length(global.body_parts);part++){
				if (struct_exists(selected_unit.body[$ global.body_parts[part]], "bionic")){
					var part_display = global.body_parts_display[part];
					bionic_tooltip += $"Bionic {part_display}#";
					switch (part_display) {
						case "Left Leg":
						case "Right Leg":
							bionic_tooltip += $"CON: +2 STR: +1 DEX: -2#";
							break;
						case "Left Eye":
						case "Right Eye":
							bionic_tooltip += $"CON: +1 WIS: +1 DEX: +1#";
							break;
						case "Left Arm":
						case "Right Arm":
							bionic_tooltip += $"CON: +2 STR: +2 WS: -1#";
							break;
						case "Torso":
							bionic_tooltip += $"CON: +4 STR: +1 DEX: -1#";
							break;
						case "Throat":
							bionic_tooltip += $"CHA: -1#";
							break;
						case "Jaw":
						case "Head":
							bionic_tooltip += $"CON: +1#";
							break;
					}
				}				
			}
	        if (bionic_tooltip !=""){
	        	array_push(tooltip_drawing, [bionic_tooltip, [x1,y1,x2,y2]]);
	    	} else{
	    		array_push(tooltip_drawing, ["No Bionic Augmentations", [x1,y1,x2,y2]]);
	    	}

        var_text = string_hash_to_newline($"Armour Rating: {selected_unit.armour_calc()}")
          var tooltip_text = "";
          var equipment_types = ["armour", "weapon_one", "weapon_two", "mobility", "gear"];
          for (var i = 0; i < array_length(equipment_types); i++) {
            var equipment_type = equipment_types[i];
            var ac = 0;
            var name = "";
            switch(equipment_type) {
                case "armour":
                    ac = selected_unit.get_armour_data("armour_value");
                    name = selected_unit.get_armour_data("name");
                    break;
                case "weapon_one":
                    ac = selected_unit.get_weapon_one_data("armour_value");
                    name = selected_unit.get_weapon_one_data("name");
                    break;
                case "weapon_two":
                    ac = selected_unit.get_weapon_two_data("armour_value");
                    name = selected_unit.get_weapon_two_data("name");
                    break;
                case "mobility":
                    ac = selected_unit.get_mobility_data("armour_value");
                    name = selected_unit.get_mobility_data("name");
                    break;
                case "gear":
                    ac = selected_unit.get_gear_data("armour_value");
                    name = selected_unit.get_gear_data("name");
                    break;
            }
            if (ac != 0) {
                tooltip_text += string_hash_to_newline($"{name}: {ac}#");
            }
          }
			if (obj_controller.stc_bonus[1] == 5 || obj_controller.stc_bonus[2] == 3){
                tooltip_text += string_hash_to_newline($"STC Bonus: x1.05#");
			}
        	x1 = x_left;
        	y1 = yy+400;
        	x2 = x1+string_width(var_text);
        	y2 = y1+string_height(var_text);
	        draw_text_outline(x1,y1,var_text);
	        array_push(tooltip_drawing, [tooltip_text, [x1,y1,x2,y2]]); 

    		var_text = string_hash_to_newline($"Health: {round(selected_unit.hp())}/{round(selected_unit.max_health())}")
        	tooltip_text = string_hash_to_newline(string("CON: {0}#", round(100*(1+((selected_unit.constitution-40)*0.025)))));
            for (var i = 0; i < array_length(equipment_types); i++) {
                var equipment_type = equipment_types[i];
                var hp_mod = 0;
                var name = "";
                switch(equipment_type) {
                    case "armour":
                        hp_mod = selected_unit.get_armour_data("hp_mod");
                        name = selected_unit.get_armour_data("name");
                        break;
                    case "weapon_one":
                        hp_mod = selected_unit.get_weapon_one_data("hp_mod");
                        name = selected_unit.get_weapon_one_data("name");
                        break;
                    case "weapon_two":
                        hp_mod = selected_unit.get_weapon_two_data("hp_mod");
                        name = selected_unit.get_weapon_two_data("name");
                        break;
                    case "mobility":
                        hp_mod = selected_unit.get_mobility_data("hp_mod");
                        name = selected_unit.get_mobility_data("name");
                        break;
                    case "gear":
                        hp_mod = selected_unit.get_gear_data("hp_mod");
                        name = selected_unit.get_gear_data("name");
                        break;
                }
                if (hp_mod != 0) {
                    tooltip_text += string_hash_to_newline($"{name}: {format_number_with_sign(hp_mod)}%#");
                }
            }
        	x1 = x_left;
        	y1 = yy+422;
        	x2 = x1+string_width(var_text);
        	y2 = y1+string_height(var_text);
	        draw_text_outline(x1,y1,var_text);
	        array_push(tooltip_drawing, [tooltip_text, [x1,y1,x2,y2]]); 

	        if (cn.temp[113]!="") then draw_text_outline(x_left,yy+466,string_hash_to_newline("Experience: "+string(cn.temp[113])));

       
        		 
        	if (cn.temp[118]!=""){
						tooltip_text = "";
						for (var i = 0; i < array_length(equipment_types); i++){
							var equipment_type = equipment_types[i];
							var dr = 0;
							var name = "";
							switch(equipment_type) {
									case "armour":
											dr = selected_unit.get_armour_data("damage_resistance_mod");
											name = selected_unit.get_armour_data("name");
											break;
									case "weapon_one":
											dr = selected_unit.get_weapon_one_data("damage_resistance_mod");
											name = selected_unit.get_weapon_one_data("name");
											break;
									case "weapon_two":
											dr = selected_unit.get_weapon_two_data("damage_resistance_mod");
											name = selected_unit.get_weapon_two_data("name");
											break;
									case "mobility":
											dr = selected_unit.get_mobility_data("damage_resistance_mod");
											name = selected_unit.get_mobility_data("name");
											break;
									case "gear":
											dr = selected_unit.get_gear_data("damage_resistance_mod");
											name = selected_unit.get_gear_data("name");
											break;
							}
							if (dr != 0) {
									tooltip_text += string_hash_to_newline($"{name}: {dr}%#");
							}
						}
        		var_text = string_hash_to_newline(string("Damage Resistance: {0}",cn.temp[118]))
	        	tooltip_text += string_hash_to_newline(string("CON: {0}%#XP: {1}%", round(selected_unit.constitution/2), round(selected_unit.experience()/10)));
	        	x1 = x_left;
	        	y1 = yy+378;
	        	x2 = x1+string_width(var_text);
	        	y2 = y1+string_height(var_text);
		        draw_text_outline(x1,y1,var_text);
		        array_push(tooltip_drawing, [tooltip_text, [x1,y1,x2,y2]]);
	    	}

	        if (cn.temp[119]!="") then draw_text_outline(x_left,yy+488,cn.temp[119]);

		// Right side of the screen
		draw_set_halign(fa_right);
		var x_right = xx+1576-24;

		// Equipment
		var wep1= selected_unit.weapon_one();
		if (wep1!=""){
			var_text= string_hash_to_newline(wep1);
			tooltip_text = cn.temp[109];
			x1 = x_right;
			y1 = yy+216;
			x2 = x1-string_width_ext(var_text, -1,187);
			y2 = y1+string_height_ext(var_text, -1,187);	 	 
			draw_text_ext_outline(x1,y1,var_text,-1,187, 0, quality_color(selected_unit.weapon_one_quality));
			array_push(tooltip_drawing, [tooltip_text, [x2,y1,x1,y2]]);
		}
	
		var wep2 = selected_unit.weapon_two();
		if (wep2!=""){
			var_text= string_hash_to_newline(wep2);
			tooltip_text = cn.temp[111];
			x1 = x_right;
			y1 = yy+260;
			x2 = x1-string_width_ext(var_text, -1,187);
			y2 = y1+string_height_ext(var_text, -1,187);	 
			draw_text_ext_outline(x1,y1,var_text,-1,187, 0, quality_color(selected_unit.weapon_two_quality)); 
			array_push(tooltip_drawing, [tooltip_text, [x2,y1,x1,y2]]);
		}

		// Stats
		if (is_array(cn.temp[117])){
			var_text = string_hash_to_newline(string("Melee Attack: {0}",round(cn.temp[116][0])))
			tooltip_text = string_hash_to_newline(string(cn.temp[116][1]));
			x1 = x_right;
			y1 = yy+378;
			x2 = x1-string_width(var_text);
			y2 = y1+string_height(var_text);
			if (selected_unit.encumbered_melee){
				draw_set_color(c_red);
				//tooltip_text+="#encumbered"
			}
			draw_text_outline(x1,y1,var_text);
			draw_set_color(line_color);
			array_push(tooltip_drawing, [tooltip_text, [x2,y1,x1,y2]]);
		}

		if (is_array(cn.temp[117])){
			var_text = string_hash_to_newline(string("Ranged Attack: {0}",round(cn.temp[117][0])))
			tooltip_text = string_hash_to_newline(string(cn.temp[117][1]));
			x1 = x_right;
			y1 = yy+400;
			x2 = x1-string_width(var_text);
			y2 = y1+string_height(var_text);
			if (selected_unit.encumbered_ranged){
				draw_set_color(c_red);
			}
			draw_text_outline(x1,y1,var_text);
			array_push(tooltip_drawing, [tooltip_text, [x2,y1,x1,y2]]);
			draw_set_color(line_color);
		}

		if (cn.temp[116]!=""){
			carry_data = cn.temp[116][2];
			var carry_string = $"Melee Burden: {carry_data[0]}/{carry_data[1]}"
			x1 = x_right;
			y1 = yy+444;
			x2 = x1-string_width(carry_string);
			y2 = y1+string_height(carry_string);
			draw_text_outline(x1,y1,string_hash_to_newline(carry_string));
			tooltip_text = string_hash_to_newline(carry_data[2]);
			array_push(tooltip_drawing, [tooltip_text, [x2,y1,x1,y2]]);
		}

		if (cn.temp[117]!=""){
			carry_data = cn.temp[117][2];
			var carry_string = $"Ranged Burden: {carry_data[0]}/{carry_data[1]}"
			x1 = x_right;
			y1 = yy+466;
			x2 = x1-string_width(carry_string);
			y2 = y1+string_height(carry_string);
			draw_text_outline(x1,y1,string_hash_to_newline(carry_string));
			tooltip_text = string_hash_to_newline(carry_data[2]);
			array_push(tooltip_drawing, [tooltip_text, [x2,y1,x1,y2]]);
		}
	}	

	    draw_set_font(fnt_40k_14);draw_set_halign(fa_left);

	    // Back
	    var top=man_current,sel=top,temp1="",temp2="",temp3="",temp4="",temp5="";
    
		// Var creation
	    var ma_ar="",ma_we1="",ma_we2="",ma_ge="",ma_mb="",ttt=0;
	    var ar_ar=0,ar_we1=0,ar_we2=0,ar_ge=0,ar_mb=0,eventing=false;
	        
	    yy+=77;
		
	    var unit_specialism_option=false, spec_tip="";
		var potential_tooltip=[], health_tooltip=[], promotion_tooltip=[];
		var repetitions=min(man_max,man_see);

		//tooltip text to tell you if a unit is eligible for special roles
		var spec_tips = [string("{0} Potential",obj_ini.role[100][16]),		
						string("{0} Potential",obj_ini.role[100][15]),
						string("{0} Potential",obj_ini.role[100][14]),
						string("{0} Potential",obj_ini.role[100][17])];
		var assignment ="none"
	    
	    if (!obj_controller.view_squad){
		    for(var i=0; i<repetitions;i++){
		    	if (sel==500) then break;
		    	while (man[sel]=="hide") and (sel<499){sel+=1;}

				eventing=false;
	        
		        if (man[sel]=="man"){

					unit = display_unit[sel];
					if (unit.name()=="" || unit.base_group=="none"){continue;}
					var unit_location = unit.marine_location();
		            temp1=unit.name_role();
					var unit_specialist = is_specialist(unit.role());
		            unit_specialism_option=false;
		            // temp1=string(managing)+"."+string(ide[sel]);
		            temp2=string(ma_loc[sel]);
		            if (unit_location[0]==location_types.planet){
						temp2 = unit_location[2];
						//get roman numeral for system planet
						temp2 += romanNumerals[unit_location[1]-1];
		            } else if(unit_location[0]==location_types.ship){
						temp2 = obj_ini.ship[unit_location[1]]
					};
					assignment=unit.assignment();
					if (assignment!="none"){
						temp2+= $"({assignment})";
					}else if (fest_planet==0) and (fest_sid>0) and (fest_repeats>0) and (ma_lid[sel]==fest_sid){
						temp2="=Event=";
						eventing=true;
					}else if (fest_planet==1) and (fest_wid>0) and (fest_repeats>0) and (ma_wid[sel]==fest_wid) and (ma_loc[sel]==fest_star){
						temp2="=Event=";
						eventing=true;
					}
		            if (ma_god[sel]>=10) then temp2="=Penitorium=";
	                   
		            temp3=string(round((unit.hp()/unit.max_health())*100))+"% HP";
	            
		            temp4=string(ma_exp[sel])+" XP";
	            
		            ma_ar="";ma_we1="";ma_we2="";ma_ge="";ma_mb="";ttt=0;
		            ar_ar=0;ar_we1=0;ar_we2=0;ar_ge=0;ar_mb=0;
	            	//TODO handle recursively
		            if (ma_armour[sel]!=""){
						ma_ar=gear_weapon_data("armour",unit.armour(),"abbreviation");
						ma_ar=is_string(ma_ar) ? ma_ar : "";
		            }
		            if (ma_gear[sel]!=""){
						ma_ge=gear_weapon_data("gear",unit.gear(),"abbreviation");
						ma_ge=is_string(ma_ge) ? ma_ge : ""	;					
		            }
		            if (ma_mobi[sel]!=""){
						ma_mb=gear_weapon_data("mobility",unit.mobility_item(),"abbreviation");
						ma_mb=is_string(ma_mb) ? ma_mb : ""	;			            	
		            }
		            if (ma_wep1[sel]!=""){
						ma_we1=gear_weapon_data("weapon",unit.weapon_one(),"abbreviation");
						ma_we1=is_string(ma_we1) ? ma_we1 : "";			            	
		            }
		            if (ma_wep2[sel]!=""){
						ma_we2=gear_weapon_data("weapon",unit.weapon_two(),"abbreviation");
						ma_we2=is_string(ma_we1) ? ma_we2 : "";	
		            }
		        }else if (man[sel]=="vehicle"){
		            // temp1="v "+string(managing)+"."+string(ide[sel]);
		            temp1=string(ma_role[sel]);
		            temp2=string(ma_loc[sel]);
	            
		            if (ma_wid[sel]!=0){
		            	//numeral for vehicle planet
		            	temp2 += romanNumerals[ma_wid[sel]-1];
		            }
		            temp3=string(round(ma_health[sel]))+"% HP";temp4="";
		            // Need abbreviations here

		            ma_ar="";
		            ma_we1="";
		            ma_we2="";
		            ma_ge="";
		            ma_mb="";
		            ttt=0;
		            ar_ar=0;
		            ar_we1=0;
		            ar_we2=0;
		            ar_ge=0;
		            ar_mb=0;
		            //TODO handle recursively
					if (ma_armour[sel]!=""){
						ma_ar=gear_weapon_data("weapon",ma_armour[sel],"abbreviation");
						ma_ar=is_string(ma_ar) ? ma_ar : "";
					}
					if (ma_gear[sel]!=""){
						ma_ge=gear_weapon_data("armour",ma_gear[sel],"abbreviation");
						ma_ge=is_string(ma_ge) ? ma_ge : ""	;		
					}
					if (ma_mobi[sel]!=""){
						ma_mb=gear_weapon_data("gear",ma_mobi[sel],"abbreviation");
						ma_mb=is_string(ma_mb) ? ma_mb : ""	;			            	
		            }
					if (ma_wep1[sel]!=""){
						ma_we1=gear_weapon_data("weapon",ma_wep1[sel],"abbreviation");
						ma_we1=is_string(ma_we1) ? ma_we1 : "";			            	
					}
					if (ma_wep2[sel]!=""){
						ma_we2=gear_weapon_data("weapon",ma_wep2[sel],"abbreviation");
						ma_we2=is_string(ma_we1) ? ma_we2 : "";	
						// temp5=string(ma_wep1[sel])+", "+string(ma_wep2[sel])+" + "+string(ma_gear[sel]);
		      }
					}

		        if (man_sel[sel]==0) then draw_set_color(c_black);
		        if (man_sel[sel]!=0) then draw_set_color(6052956);// was gray
		        draw_rectangle(xx+25,yy+64,xx+974,yy+85,0);

		        unit_specialism_option=false;
		        spec_tip = "";
				draw_set_color(c_gray);
				draw_rectangle(xx+25,yy+64,xx+974,yy+85,1);
		        if (man[sel]="man"){
		        	if (!unit_specialist){
				        if (unit.technology>=35){
				        	 //if unit has techmarine potential
				        	unit_specialism_option=true;
				        	spec_tip = spec_tips[0];
				        //if unit has librarian potential
				    	} else if (unit.psionic>7){
				    		spec_tip = spec_tips[3];
				    		unit_specialism_option=true;
				    	}else if (unit.piety>=35) and (unit.charisma>=30){  //if unit has chaplain potential
				    		spec_tip = spec_tips[2];
				    		unit_specialism_option=true;
				    	}else if (unit.technology>=30) and (unit.intelligence>=45){ //if unit has apothecary potential
				    		spec_tip = spec_tips[1];
				    		unit_specialism_option=true;
				    	}
			    	}
		    	}
		    	if (unit_specialism_option) then array_push(potential_tooltip, [spec_tip, [xx+232,yy+64,xx+246,yy+85]]);

		        // Squads
		        var sqi="";
		        draw_set_color(c_black);
		        var squad_colours=[c_teal,c_red,c_green,c_orange,c_aqua,c_fuchsia,c_green,c_blue,c_fuchsia,c_maroon]
		        var squad_modulo = squad[sel]%10;
		        draw_set_color(squad_colours[squad_modulo])
	        
		        if (sel>0 && sel<500){
		            if (squad[sel]==squad[sel+1]) and (squad[sel]!=squad[sel-1]){sqi="top"}
		            else if (squad[sel]==squad[sel+1]) and (squad[sel]==squad[sel-1]){sqi="mid"}
		            else if (squad[sel]!=squad[sel+1]) and (squad[sel]==squad[sel-1]) then sqi="bot";
		        }
		        //TODO handle recursively with an array
		        if (sqi==""){
		            draw_rectangle(xx+25,yy+64,xx+25+8,yy+85,0);
		            draw_set_color(c_gray);
		            draw_rectangle(xx+25,yy+64,xx+25+8,yy+85,1);
		        }else if (sqi=="mid"){
		            draw_rectangle(xx+25,yy+64,xx+25+8,yy+85,0);
		            draw_set_color(c_gray);
		            draw_line(xx+25,yy+64,xx+25,yy+85);
		            draw_line(xx+25+8,yy+64,xx+25+8,yy+85);
		        }else if (sqi=="top"){
		            draw_rectangle(xx+25,yy+64,xx+25+8,yy+85,0);
		            draw_set_color(c_gray);
		            draw_line(xx+25,yy+64,xx+25+28,yy+64);
		            draw_line(xx+25,yy+64,xx+25,yy+85);
		            draw_line(xx+25+8,yy+64,xx+25+8,yy+85);
		        }else if (sqi=="bot"){
		            draw_rectangle(xx+25,yy+64,xx+25+8,yy+85,0);
		            draw_set_color(c_gray);
		            draw_line(xx+25,yy+85,xx+25+28,yy+85);
		            draw_line(xx+25,yy+64,xx+25,yy+85);
		            draw_line(xx+25+8,yy+64,xx+25+8,yy+85);
		        }
		        // was 885
		        // 974
				
		        if (man[sel]="man") and (ma_ar="") then draw_set_alpha(0.5);
		        var name_xr=1;
				
				for (var k = 0; k<10; k++){
					if ((string_width(string_hash_to_newline(temp1))*name_xr)>184-8) then name_xr-=0.05;
				}

				var hpText = [xx+240+8, yy+66, string_hash_to_newline(string(temp3))]; // HP
				var xpText = [xx+330+8, yy+66, string_hash_to_newline(string(temp4))]; // XP
				var hpColor = c_gray;
				var xpColor = c_gray;
				var specialismColors = [];
				// Draw XP value and set up health color
				if (man[sel] == "man"){
					if (ma_promote[sel] >= 10){
						hpColor = c_red;
						array_push(health_tooltip, ["Critical Health State! Bionic augmentation is required!", [xx+250, yy+64, xx+300, yy+85]]);
					}else if (ma_promote[sel] > 0 && !unit_specialist){
						xpColor = c_yellow;
						array_push(promotion_tooltip, ["Promotion Recommended", [xx+335, yy+64, xx+385, yy+85]]);
					}
					draw_text_color(xpText[0], xpText[1], xpText[2], xpColor, xpColor, xpColor, xpColor, 1);
				}
				// Draw the health value with the defined colors
				draw_text_color(hpText[0], hpText[1], hpText[2], hpColor, hpColor, hpColor, hpColor, 1);

				// Handle potential indication
				if (unit_specialism_option){
					if (unit.technology>=35){	//if unit has techmarine potential
						specialismColors = [c_dkgray, c_red];
					} else if (unit.psionic>7){	//if unit has librarian potential
						specialismColors = [c_white, c_aqua];
					}else if (unit.piety>=35 && unit.charisma>=30){	//if unit has chaplain potential
						specialismColors = [c_black, c_yellow];
					}else if (unit.technology>=30 && unit.intelligence>=45){	//if unit has apothecary potential
						specialismColors = [c_red, c_white];
					}
					draw_circle_colour(xx+238, yy+73, 6, specialismColors[0],specialismColors[1], 0);
				}

				// Draw the name
		        draw_set_color(c_gray);
				draw_text_transformed(xx+27+8,yy+66,string_hash_to_newline(string(temp1)),name_xr,1,0);
				draw_text_transformed(xx+27.5+8,yy+66.5,string_hash_to_newline(string(temp1)),name_xr,1,0);

				// Draw current location
				if (temp2=="Mechanicus Vessel") or (temp2=="Terra IV") or (temp2=="=Penitorium=") or (assignment!="none") then draw_set_alpha(0.5);
				var truncatedLocation = string_truncate(string(temp2), 130); // Truncate the location string to 100 pixels
				draw_text(xx+430+8,yy+66,truncatedLocation);// LOC
		        draw_set_alpha(1);
	        
		        // ma_lid[i]=0;ma_wid[i]=0;
	        
		        if (ma_loc[sel]=="Mechanicus Vessel"){
		        	draw_sprite(spr_loc_icon,2,xx+427+8,yy+66);
		        } else {
			        if (man[sel]=="man"){
			        		c = managing<=10 ? managing : 0;
							var unit = display_unit[sel];
		  
			                if (ma_lid[sel]>0) and (ma_wid[sel]==0){
			                    draw_sprite(
			                        spr_loc_icon,
			                        unit.is_boarder ? 2 : 1,
			                        xx+427+8,
			                        yy+66);
			                }  else if (ma_wid[sel]>0){
			                	draw_sprite(spr_loc_icon,0,xx+427+8,yy+66);
			                }
			        }else{
		                if (ma_lid[sel]==0) and (ma_wid[sel]>0) then draw_sprite(spr_loc_icon,0,xx+427+8,yy+66);
		                if (ma_lid[sel]>0) and (ma_wid[sel]==0) then draw_sprite(spr_loc_icon,1,xx+427+8,yy+66);
			        }
		        }
		         //TODO handle recursively
		        if (man[sel]=="man"){
					var xoffset=0;
		            draw_set_color(c_gray);
		            if (ar_ar==1) then draw_set_color(c_gray);
		            if (ar_ar==2) then draw_set_color(881503);
		            draw_text(xx+573,yy+66,string_hash_to_newline(string(ma_ar)));
					

		            xoffset+=string_width(string_hash_to_newline(ma_ar))+15;
		            draw_set_color(c_gray);
		            if (ar_mb==1) then draw_set_color(c_gray);
		            if (ar_mb==2) then draw_set_color(881503);
		            draw_text(xx+573+xoffset,yy+66,string_hash_to_newline(string(ma_mb)));

		            xoffset+=string_width(string_hash_to_newline(ma_mb))+15;
		            draw_set_color(c_gray);
		            if (ar_ge==1) then draw_set_color(c_gray);
		            if (ar_ge==2) then draw_set_color(881503);
		            draw_text(xx+573+xoffset,yy+66,string_hash_to_newline(string(ma_ge)));

		            xoffset+=string_width(string_hash_to_newline(ma_ge))+15;
		            draw_set_color(c_gray);
		            if (ar_we1==1) then draw_set_color(c_gray);
		            if (ar_we1==2) then draw_set_color(881503);
		            draw_text(xx+573+xoffset,yy+66,string_hash_to_newline(string(ma_we1)));

		            xoffset+=string_width(string_hash_to_newline(ma_we1))+15;
		            draw_set_color(c_gray);
		            if (ar_we2==1) then draw_set_color(c_gray);
		            if (ar_we2==2) then draw_set_color(881503);
		            draw_text(xx+573+xoffset,yy+66,string_hash_to_newline(string(ma_we2)));
		        }
		        if (man[sel]!="man"){
					var xoffset=0;
					//Vehicle Upgrade
					draw_set_color(c_gray);
					if (ar_ge==1) then draw_set_color(c_gray);
					if (ar_ge==2) then draw_set_color(881503);
					draw_text(xx+573,yy+66,string_hash_to_newline(string(ma_ge)));
				
					//Vehicle accessory
					xoffset+=string_width(string_hash_to_newline(ma_ge))+15;
					draw_set_color(c_gray);
					if (ar_mb==1) then draw_set_color(c_gray);
					if (ar_mb==2) then draw_set_color(881503);
					draw_text(xx+573+xoffset,yy+66,string_hash_to_newline(string(ma_mb)));
				
					//Vehicle wep 1
					xoffset+=string_width(string_hash_to_newline(ma_mb))+15;
					draw_set_color(c_gray);
					if (ar_we1==1) then draw_set_color(c_gray);
					if (ar_we1==2) then draw_set_color(881503);
					draw_text(xx+573+xoffset,yy+66,string_hash_to_newline(string(ma_we1)));
				
					//Vehicle wep 2
					xoffset+=string_width(string_hash_to_newline(ma_we1))+15;
					draw_set_color(c_gray);
					if (ar_we2==1) then draw_set_color(c_gray);
					if (ar_we2==2) then draw_set_color(881503);
					draw_text(xx+573+xoffset,yy+66,string_hash_to_newline(string(ma_we2)));
				
					//Vehicle wep 3
					xoffset+=string_width(string_hash_to_newline(ma_we2))+15;
					draw_set_color(c_gray);
					if (ar_ar==1) then draw_set_color(c_gray);
					if (ar_ar==2) then draw_set_color(881503);
					draw_text(xx+573+xoffset,yy+66,string_hash_to_newline(string(ma_ar)));
		        }
		        yy+=20;
		        sel+=1;
		        if (man[sel] == ""){break;}
		    }

		    draw_set_color(c_black);
		    xx=__view_get( e__VW.XView, 0 )+0;yy=__view_get( e__VW.YView, 0 )+0;
		    draw_rectangle(xx+974,yy+165,xx+1005,yy+822,0);
		    draw_set_color(c_gray);
		    draw_rectangle(xx+974,yy+165,xx+1005,yy+822,1);

			// Squad outline
		    draw_rectangle(xx+25,yy+142,xx+14+8,yy+822,1);
		    // draw_rectangle(xx+577,yy+64,xx+600,yy+85,1);
		    // draw_rectangle(xx+577,yy+379,xx+600,yy+400,1);

		    draw_set_color(0);
		    draw_rectangle(xx+974,yy+141,xx+1005,yy+172,0);
		    draw_rectangle(xx+974,yy+790,xx+1005,yy+822,0);
		    draw_set_color(c_gray);
		    draw_rectangle(xx+974,yy+141,xx+1005,yy+172,1);
		    draw_rectangle(xx+974,yy+790,xx+1005,yy+822,1);

		    draw_sprite_stretched(spr_arrow,2,xx+974,yy+141,31,30);
		    draw_sprite_stretched(spr_arrow,3,xx+974,yy+791,31,30);

		    /*
		    draw_set_color(c_black);draw_rectangle(xx+25,yy+400,xx+600,yy+417,0);
		    draw_set_color(38144);draw_rectangle(xx+25,yy+400,xx+600,yy+417,1);
		    draw_line(xx+160,yy+400,xx+160,yy+417);
		    draw_line(xx+304,yy+400,xx+304,yy+417);
		    draw_line(xx+448,yy+400,xx+448,yy+417);

		    draw_set_font(fnt_menu);
		    draw_set_halign(fa_center);
		    */
			
		    yy+=8;
		     //TODO handle recursively
		    if (!obj_controller.unit_profile){
			    //draws hover over tooltips
				function gen_tooltip(tooltip_array) {
					for (var i = 0; i < array_length(tooltip_array); i++) {
						var tooltip = tooltip_array[i];
						if (point_in_rectangle(mouse_x, mouse_y, tooltip[1][0], tooltip[1][1], tooltip[1][2], tooltip[1][3])) {
							tooltip_draw(tooltip[0]);
						}
					}
				}
				gen_tooltip(potential_tooltip);
				gen_tooltip(promotion_tooltip);
				gen_tooltip(health_tooltip);

				// Draw interaction and selection buttons
				yy-=8;
				draw_set_font(fnt_40k_14b);
				var button = {
					x1: right_ui_block.x1+26,
					y1: right_ui_block.y2-6-30,
					w: 100,
					h: 30,
					h_gap: 4,
					v_gap: 4,
					label: "",
					alpha: 1,
					color: #50a076,
				}
				button.x2 = button.x1 + button.w;
				button.y2 = button.y1 + button.h;
				
				// Load/Unload to ship button
				if (sel_loading=0){
					if point_and_click(draw_unit_buttons([x5,y6, x6, y5],"Load")){
		                if (man_size>0) and (selecting_location!="Terra") and (selecting_location!="Mechanicus Vessel"){
		                    scr_company_load(selecting_location);
		                    menu=30;
		                    top=1;
		                }						
					}
				} else if (sel_loading!=0){
					button.label = "Unload";
				}
				button.alpha = 1;
				draw_unit_buttons([button.x1, button.y1, button.x2, button.y2], button.label, [1,1],button.color,,,button.alpha);
				button.x1 += button.w + button.h_gap;
				button.x2 += button.w + button.h_gap;

				// // Re equip button
				button.label = "Re-equip";
				button.alpha = 1;
				draw_unit_buttons([button.x1, button.y1, button.x2, button.y2], button.label, [1,1],button.color,,,button.alpha);
				button.x1 += button.w + button.h_gap;
				button.x2 += button.w + button.h_gap;

				// // Promote button
				button.label = "Promote";
				button.alpha = sel_promoting > 0 ? 1 : 0.5;
				draw_unit_buttons([button.x1,button.y2, button.x2, button.y1],button.label,[1,1],button.color,,,button.alpha);
				button.x1 += button.w + button.h_gap;
				button.x2 += button.w + button.h_gap;

				// // Put in jail button
				button.label = "Jail";
				button.alpha = 1;
				draw_unit_buttons([button.x1,button.y2, button.x2, button.y1],button.label,[1,1],button.color,,,button.alpha);
				button.x1 += button.w + button.h_gap;
				button.x2 += button.w + button.h_gap;
				if point_and_click(draw_unit_buttons([x5,y6, x6, y5],"Jail")){
	                for(var f=0; f<=man_max; f++){
	                    if (man[f]=="man") and (man_sel[f]==1) and (ma_loc[f]!="Terra") and (ma_loc[f]!="Mechanicus Vessel"){
	                        if (is_struct(display_unit[f])){
	                            unit = display_unit[f];
	                            obj_ini.god[unit.company][unit.marine_number]+=10;
	                            ma_god[f]+=10;
	                        }
	                    }
	                }
	                if (managing>0){
	                    alll=0;
	                    if (managing<=10) then scr_company_view(managing);
	                    if (managing>20) then scr_company_view(managing);
	                    if (managing>10) and (managing<=20) then scr_special_view(managing);
	                }
                    sel_loading=0;
                    unload=0;
                    alarm[6]=7;	                					
				}

				// // Add bionics button
				button.label = "Add Bionics";
				button.alpha = 1;
				draw_unit_buttons([button.x1,button.y2, button.x2, button.y1],button.label,[1,1],button.color,,,button.alpha);
				button.y1 -= button.h + button.v_gap;
				button.y2 -= button.h + button.v_gap;
				button.x1 -= (button.w + button.h_gap) * 4;
				button.x2 -= (button.w + button.h_gap) * 4;
				if (point_and_click(draw_unit_buttons([x5,y6, x6, y5], "Add Bionics",[1,1],38144))&&  man_size>0){
	                bionics_before=scr_item_count("Bionics");
	                bionics_after=bionics_before;
	                if (bionics_before>0){
	                	for(var p=1; p<=500; p++){
	                		if (man_sel[p]==0 && is_struct(display_unit[p])){ 
	                			var unit = display_unit[p];
	                			var comp = unit.company;
	                			var mar_id = unit.marine_number;
	    	                    if (obj_ini.loc[comp][mar_id]!="Terra") and (obj_ini.loc[comp][mar_id]!="Mechanicus Vessel"){
	    	                        if (string_count("Dread",ma_armour[p])=0){
							        	unit.add_bionics();
		                              	bionics_after--;
	    	                            if (ma_promote[p]==10) then ma_promote[p]=0;
	    	                        }
	    	                    }
	    	                }
    	                }
    	            }
				}

				// // Designate as boarder unit
				button.label = "Set Boarder";
				button.alpha = 1;
				draw_unit_buttons([button.x1,button.y2, button.x2, button.y1],button.label,[1,1],button.color,,,button.alpha);
				button.x1 += (button.w + button.h_gap);
				button.x2 += (button.w + button.h_gap);
				if point_and_click(draw_unit_buttons([x5,y6, x6, y5], "Set Boarder",[1,1],c_red)){
					if ((man_size>0)){
		                for(var p=0; p<=500; p++){
		                    if (man_sel[p]==1) and (man[p]=="man"){
		                    	if (is_struct(display_unit[p])){
			                        var unit=display_unit[p];
			                        var mar_id = unit.marine_number;
			                        if (unit.ship_location>0) and (obj_ini.loc[unit.company][mar_id]!="Mechanicus Vessel"){
			                        	unit.is_boarder = !unit.is_boarder;
			                        }
			                    }
		                    }
		                }						
					}
				}

				// // Reset changes button
				button.label = "Reset";
				button.alpha = 1;
				draw_unit_buttons([button.x1,button.y2, button.x2, button.y1],button.label,[1,1],button.color,,,button.alpha);
				button.x1 += button.w + button.h_gap;
				button.x2 += button.w + button.h_gap;

				// // Transfer to another company button
				button.label = "Transfer";
				button.alpha = 1;
				draw_unit_buttons([button.x1,button.y2, button.x2, button.y1],button.label,[1,1],button.color,,,button.alpha);
				button.x1 += button.w + button.h_gap;
				button.x2 += button.w + button.h_gap;

				// // Select all units button
				// button.label = "Select All";
				// button.alpha = 1;
				// draw_unit_buttons([button.x1, button.y1, button.x2, button.y2], button.label, [1,1],,,,button.alpha);
			}
			draw_set_color(#3f7e5d);
			scr_scrollbar(974,172,1005,790,34,man_max,man_current);
		}		
		if instance_exists(cn)and (is_struct(cn.temp[120])){
			if (cn.temp[120].name()!="") and (cn.temp[120].race()!=0){
				draw_set_alpha(1);
				var xx=__view_get( e__VW.XView, 0 )+0, yy=__view_get( e__VW.YView, 0 )+0
		        if ((point_in_rectangle(mouse_x, mouse_y, xx+1208, yy+210, xx+1374, yy+210+272) || obj_controller.unit_profile) and (!instance_exists(obj_temp3)) and(!instance_exists(obj_popup))){
		        	selected_unit.stat_display(true);
		       		//tooltip_draw(stat_x, stat_y+string_height(stat_display),0,0,100,17);
		        } 
		        with (obj_controller){
    		        if (view_squad && !instance_exists(obj_temp3) && !instance_exists(obj_popup)){
    		        	if (managing>10){
    		        		view_squad=false;
    		        		unit_profile=false;
    		        	} else if (company_data!={}){
    		        		company_data.draw_squad_view();
    		        	}
    				}
    			}
			}
		}
	    var tip, coords;
		for (i=0;i < array_length(tooltip_drawing); i++){
			tip = tooltip_drawing[i];
			coords=tip[1];
			if (point_in_rectangle(mouse_x, mouse_y, coords[0],coords[1],coords[2],coords[3])){
		        	tooltip_draw(tip[0], 350);
			}
		}		
	}
	else if (menu=30) and (managing>0 || managing==-1){// Load to ships
	    var xx, yy, bb, img;
	    bb="";img=0;
	    xx=__view_get( e__VW.XView, 0 )+0;
	    yy=__view_get( e__VW.YView, 0 )+0;

	    // BG
	    draw_set_alpha(1);
	    draw_sprite(spr_rock_bg,0,xx,yy);
	    draw_set_font(fnt_40k_30b);
	    draw_set_halign(fa_center);
	    draw_set_color(c_gray);// 38144
		
	    // Draw Title
	    var c=0,fx="";
	    if (managing<=10) then c=managing;
	    if (managing>20) then c=managing-10;
    
		// Draw companies
	    if (managing >= 1) and (managing <=10) {
			fx= scr_roman_numerals()[managing - 1] + " Company";
		}
    
	    switch (managing) {
		    case 11:
		        fx = "Headquarters";
		        break;
		    case 12:
		        fx = "Apothecarion";
		        break;
		    case 13:
		        fx = "Librarium";
		        break;
		    case 14:
		        fx = "Reclusium";
		        break;
		    case 15:
		        fx = "Armamentarium";
		        break;
		}
    
	    draw_text(xx+800,yy+74,string_hash_to_newline(string(global.chapter_name)+" "+string(fx)));
	    if (managing>=0){
    	    if (obj_ini.company_title[managing]!=""){
    			draw_set_font(fnt_fancy);
    	        draw_text(xx+800,yy+110,string_hash_to_newline("''"+string(obj_ini.company_title[managing])+"''"));
    		}
    	}
	    // Back
	    draw_sprite_ext(spr_arrow,0,xx+25,yy+70,2,2,0,c_white,1);
	    if (point_and_click([xx+25, yy+70, xx+70, yy+140])){
            man_size=0;
            man_current=1;
            menu=1;
	    }
    
	    var top, sel, temp1="", temp2="", temp3="", temp4="", temp5="";
	    top=ship_current;
	    sel=top;
    
	    draw_set_font(fnt_40k_14);
	    draw_set_halign(fa_left);
	    yy+=77;
    	var main_rect;
		var repetitions=min(ship_max,ship_see)
	    for(var i=0; i<repetitions; i++){
	        if (sh_name[sel]!=""){
	            temp1=string(sh_name[sel])+" ("+string(sh_class[sel])+")";
	            temp2=string(sh_loc[sel]);
	            temp3=sh_hp[sel];
	            temp4=string(sh_cargo[sel])+" / "+string(sh_cargo_max[sel])+" Space Used";

		        main_rect = [xx+25,yy+64,xx+974,yy+85];
	        
		        draw_set_color(c_black);
				draw_rectangle(main_rect[0],main_rect[1],main_rect[2],main_rect[3],0);
		        draw_set_color(c_gray);
				draw_rectangle(xx+25,yy+64,xx+974,yy+85,1);
		        draw_text_transformed(xx+27,yy+66,string_hash_to_newline(string(temp1)),1,1,0);
				draw_text_transformed(xx+27.5,yy+66.5,string_hash_to_newline(string(temp1)),1,1,0);
		        draw_text_transformed(xx+364,yy+66,string_hash_to_newline(string(temp2)),1,1,0);
		        draw_text_transformed(xx+580,yy+66,string_hash_to_newline(string(temp3)),1,1,0);
		        draw_text_transformed(xx+730,yy+66,string_hash_to_newline(string(temp4)),1,1,0);
	        	if (point_and_click(main_rect)){
	        		if ((sh_cargo[sel]+man_size)<=sh_cargo_max[sel]){

	                    var load_from_star = star_by_name(selecting_location);
	                    var onceh=0;
	                    stop=0;
	                    for(var q=0; q<array_length(display_unit); q++){
	                        // Load man to ship
	                        if (man_sel[q]==1){
	                            if (is_struct(display_unit[q])){
	                                unit = display_unit[q];
	                                unit.load_marine(sh_ide[sel], load_from_star);
	                                ma_loc[q]=sh_name[sel];
	                                ma_lid[q]=sh_ide[sel];
	                                ma_wid[q]=0;                       
	                            }
	                            // Load vehicle to ship
	                            else if (is_array(display_unit[q]) ) and (ma_loc[q]==selecting_location) and (sh_loc[sel]==selecting_location){
	                                var vehicle =display_unit[q];
	                                vehic_size =scr_unit_size("",ma_role[q],true);
	                                if ((sh_cargo[sel]+vehic_size)<=sh_cargo_max[sel]) and (man_sel[q]!=0){
	                                    wombat=sel;
	                                    ma_loc[q]=sh_name[sel];
	                                    ma_lid[q]=sh_ide[sel];
	                                    ma_wid[q]=0;
	                                    veh_loc[vehicle[0]][vehicle[1]]=sh_name[sel];
	                                    obj_ini.veh_lid[vehicle[0]][vehicle[1]]=sh_ide[sel];
	                                    obj_ini.veh_wid[vehicle[0]][vehicle[1]]=0;
	                                    obj_ini.veh_uid[vehicle[0]][vehicle[1]]=sh_uid[sel];
	                                   obj_ini.ship_carrying[sh_ide[sel]]+=vehic_size;
	                                   load_from_star.p_player[selecting_planet]-=vehic_size;
	                                }
	                            }
	                        }
	                    }
	                    man_size=0;
	                    man_current=1;
	                    menu=1;
	                    cooldown=8;
	                    for(var k=0; k<=array_length(display_unit); k++){man_sel[k]=0;}        			
	        		}
		        	if (managing == -1){
  						update_garrison_manage();
		        	}
		        }
		        yy+=20;
		    }
		    sel+=1;
	    }
    
		// Load to selected
	    draw_set_font(fnt_40k_14b);
	    draw_text_transformed(xx+320,yy+402,string_hash_to_newline("Click a Ship to Load Selection (Req. "+string(man_size)+" Space)"),1,1,0);
    
	    xx=__view_get( e__VW.XView, 0 )+0;
	    yy=__view_get( e__VW.YView, 0 )+0;
    
	    // draw_text_transformed(xx+488,yy+426,"Selection Size: "+string(man_size),0.4,0.4,0);
	    scr_scrollbar(974,172,1005,790,34,ship_max,ship_current);
	}

}