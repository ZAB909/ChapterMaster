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
	draw_set_color(c_black);
	draw_rectangle(position[0],position[1], full_width,full_height,0)
	draw_set_color(colour);
	draw_text_transformed(position[0]+4,position[1]+2,string_hash_to_newline(text),size_mod[0],size_mod[1],0);
	draw_rectangle(position[0],position[1], full_width,full_height,1)
	draw_set_alpha(0.5*alpha_mult);
	draw_rectangle(position[0]+1,position[1]+1, full_width-1,full_height-1,1)
	draw_set_alpha(0.25*alpha_mult);
	if (point_in_rectangle(mouse_x,mouse_y, position[0],position[1], full_width,full_height)){
		draw_rectangle(position[0],position[1], full_width,full_height,0);
	}
	draw_set_alpha(1);
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
		var unit,i, tooltip_text,x1,x2,y1,y2, var_text;
		var romanNumerals=scr_roman_numerals();	
		var bionic_tooltip="",tooltip_drawing=[];
		

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
				menu=0;
                onceh=1;
                cooldown=8000;
                click=1;
                hide_banner=0;
               	selection_data.system.alarm[3]=4;
			}
			if ((man_size==0 || man_size>selection_data.number) && selection_data.start_count==0){
				proceed_button.draw_shutter(xx+1110,yy+70, "Proceed", 0.5, false);
			} else {
				if (proceed_button.draw_shutter(xx+1110,yy+70, "Proceed", 0.5, true)){
					menu=0;
	                onceh=1;
	                cooldown=8000;
	                click=1;
	                hide_banner=0;
	                selections = [];
	                var forge = selection_data.feature.feature;
	                for (var i=1; i<500;i++){
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
		                		if (job.type=="forge" && job.planet== selection_data.planet){
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
	                selection_data.system.alarm[3]=4;
					exit;				
				}
			}
	    }
	    draw_set_color(0);
	    draw_rectangle(xx+1005,yy+142,xx+1576,yy+957,0);
				// swap between squad view and normal view
	    draw_set_color(c_gray);
	    draw_line(xx+1005,yy+519,xx+1576,yy+519);
    
	    draw_set_font(fnt_40k_14b);
    
	    var cn=obj_controller;
		
	    if (instance_exists(cn)) and (is_struct(temp[120])){
	    	var selected_unit = temp[120];				//unit struct
	    	///tooltip_text stacks hover over type tooltips into an array and draws them last so as not to create drawing order issues
		    draw_set_color(c_red);
		    var stat_tool_tip_text;
		    if (!obj_controller.view_squad && !obj_controller.company_report){
			    stat_tool_tip_text = "Toggle Squad View";
			} else {
				stat_tool_tip_text = "Standard View"; 
			}
		    var x5=xx+1005;//this should be relational with the unit area tab
			var y5=yy+142;
			var x6=x5+string_width("Toggle Squad View")+4;
			var y6=y5+string_height("Toggle Squad View")+2;
			draw_unit_buttons([x5,y5, x6, y6], stat_tool_tip_text,[1,1],c_red);
			if (managing>0 && managing<11){
				array_push(tooltip_drawing, ["click or press S to toggle, squad view", [x5,y5,x6,y6]]);
				if ((point_in_rectangle(mouse_x, mouse_y,x5,y5,x6,y6) && mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(ord("S"))){
					obj_controller.view_squad = !obj_controller.view_squad;
					if (stat_tool_tip_text=="Toggle Squad View"){
						obj_controller.company_data = new scr_company_struct(obj_controller.managing);
						obj_controller.unit_profile = true;
					} else {
						obj_controller.unit_profile = false;
					}
				}	
			} else{
				draw_set_alpha(0.5);
				draw_set_color(c_black);
				draw_rectangle(x5,y5,x6,y6,0);
				draw_set_alpha(1);
			}

		    stat_tool_tip_text="Unit Profile"
		    x5=x6;
			var x6=x5+string_width(stat_tool_tip_text)+4;
			var y6=y5+string_height(stat_tool_tip_text)+2;	    
		    draw_unit_buttons([x5,y5,x6,y6], stat_tool_tip_text,[1,1],c_red);
		    array_push(tooltip_drawing, ["click or press P to show unit data", [x5,y5,x6,y6]]);
			if ((keyboard_check_pressed(ord("P"))|| (point_in_rectangle(mouse_x, mouse_y,x5,y5,x6,y6) && mouse_check_button_pressed(mb_left))) && !instance_exists(obj_temp3) && !instance_exists(obj_popup)){
				if (view_squad){
					view_squad =false;
				}else {
					obj_controller.unit_profile = !obj_controller.unit_profile;
				}
			}
			x5=x6;

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
	    
		    draw_set_color(c_gray);	    	
	    	selected_unit.draw_unit_image(1190,210);
	        // Crop anything sticking out of the display
	        draw_set_color(0);
	        draw_rectangle(xx+1178,yy+168,xx+1190,yy+450,0);// Left
	        draw_rectangle(xx+1356,yy+168,xx+1404,yy+450,0);// Right
	        //draw_rectangle(xx+1198,yy+168,xx+1384,yy+158,0);// Top
        
	        draw_set_color(c_gray);
	        draw_set_halign(fa_center);
	        //draw_rectangle(xx+1218,yy+210,xx+1374,yy+491,1);
	        draw_text_transformed(xx+1290,yy+177,string_hash_to_newline(selected_unit.name_role()),1.5,1.5,0);
        
	        draw_set_font(fnt_40k_14);
	        draw_set_halign(fa_left);
        	
        	var armour = selected_unit.armour();
	        if (armour!=""){
	        	var_text= string_hash_to_newline(selected_unit.equipments_qual_string("armour") + "#AC" + string(selected_unit.get_armour_data("armour_value")));
	        	tooltip_text = cn.temp[103];
	        	x1 = xx+1015;
	        	y1 = yy+215;
	        	x2 = x1+string_width_ext(var_text, -1,187);
	        	y2 = y1+string_height_ext(var_text, -1,187);	 
	        	draw_text_ext(x1,y1,var_text,-1,187);
	        	array_push(tooltip_drawing, [tooltip_text, [x1,y1,x2,y2]]);      	
	        } 

	        var gear = selected_unit.gear();
	        if (selected_unit.gear()!=""){
	        	var_text= string_hash_to_newline(selected_unit.equipments_qual_string("gear"));
	        	tooltip_text = cn.temp[105];
	        	x1 = xx+1015;
	        	y1 = yy+280;
	        	x2 = x1+string_width_ext(var_text, -1,187);
	        	y2 = y1+string_height_ext(var_text, -1,187);	 
	        	draw_text_ext(x1,y1,var_text,-1,187);
	        	array_push(tooltip_drawing, [tooltip_text, [x1,y1,x2,y2]]);  	        	        	
	        }

	        var mobi = selected_unit.mobility_item();
	        if (mobi!=""){
	        	var_text= string_hash_to_newline(selected_unit.equipments_qual_string("mobi"));
	        	tooltip_text = cn.temp[107];
	        	x1 = xx+1015;
	        	y1 = yy+345;
	        	x2 = x1+string_width_ext(var_text, -1,187);
	        	y2 = y1+string_height_ext(var_text, -1,187);	  
	        	draw_text_ext(x1,y1,var_text,-1,187);
	        	array_push(tooltip_drawing, [tooltip_text, [x1,y1,x2,y2]]); 	        	        	
	        }
        	var wep1= selected_unit.weapon_one();
        	if (wep1!=""){
	        	var_text= string_hash_to_newline(selected_unit.equipments_qual_string("wep1")+ "#DAM" + string(selected_unit.get_weapon_one_data("attack")));
	        	tooltip_text = cn.temp[109];
	        	x1 = xx+1387;
	        	y1 = yy+215;
	        	x2 = x1+string_width_ext(var_text, -1,187);
	        	y2 = y1+string_height_ext(var_text, -1,187);	 	 
	        	draw_text_ext(x1,y1,var_text,-1,187);
	        	array_push(tooltip_drawing, [tooltip_text, [x1,y1,x2,y2]]); 	         		       		
        	}
        	
        	var wep2 = selected_unit.weapon_two();
        	if (wep2!=""){
	        	var_text= string_hash_to_newline(selected_unit.equipments_qual_string("wep2")+ "#DAM" + string(selected_unit.get_weapon_two_data("attack")));
	        	tooltip_text = cn.temp[111];
	        	x1 = xx+1387;
	        	y1 = yy+315;
	        	x2 = x1+string_width_ext(var_text, -1,187);
	        	y2 = y1+string_height_ext(var_text, -1,187);	 
	        	draw_text_ext(x1,y1,var_text,-1,187); 
	        	array_push(tooltip_drawing, [tooltip_text, [x1,y1,x2,y2]]); 	         		      		
        	}

        	if (is_array(cn.temp[117])){
        		var_text = string_hash_to_newline(string("Melee Attack: {0}",cn.temp[116][0]))
	        	tooltip_text = string_hash_to_newline(string("WS : {0}#STR : {1}#{2}", selected_unit.weapon_skill, selected_unit.strength,cn.temp[116][1]));
	        	x1 = xx+1387;
	        	y1 = yy+405;
	        	x2 = x1+string_width(var_text);
	        	y2 = y1+string_height(var_text);
		        draw_set_color(c_gray);
		        if (selected_unit.encumbered_melee){
		        	draw_set_color(c_red);
		        	//tooltip_text+="#encumbered"
		        }
		        draw_text(x1,y1,var_text);
		        array_push(tooltip_drawing, [tooltip_text, [x1,y1,x2,y2]]);
	    	}

        	if (is_array(cn.temp[117])){
        		var_text = string_hash_to_newline(string("Ranged Attack: {0}",cn.temp[117][0]))
	        	tooltip_text = string_hash_to_newline(string("BS : {0}#DEX : {1}#{2}", selected_unit.ballistic_skill, selected_unit.dexterity,cn.temp[117][1]));
	        	x1 = xx+1387;
	        	y1 = yy+435;
	        	x2 = x1+string_width(var_text);
	        	y2 = y1+string_height(var_text);
		        draw_set_color(c_gray);
		        if (selected_unit.encumbered_ranged){
		        	draw_set_color(c_red);
		        }
		        draw_text(x1,y1,var_text);
		        array_push(tooltip_drawing, [tooltip_text, [x1,y1,x2,y2]]);
	    	}

			// Display information on the marine

    		var_text = string_hash_to_newline(string("Bionics: {0}",selected_unit.bionics));
        	x1 = xx+1387;
        	y1 = yy+460;
        	x2 = x1+string_width(var_text);
        	y2 = y1+string_height(var_text);
	        draw_set_color(c_gray);
	        draw_text(x1,y1,var_text);
	        for (var part = 0; part<array_length(global.body_parts);part++){
				if (struct_exists(selected_unit.body[$ global.body_parts[part]], "bionic")){
					bionic_tooltip += $"bionic {global.body_parts_display[part]}#";
				}
			}
	        if (bionic_tooltip !=""){
	        	array_push(tooltip_drawing, [bionic_tooltip, [x1,y1,x2,y2]]);
	    	} else{
	    		array_push(tooltip_drawing, ["No bionic Augmentations", [x1,y1,x2,y2]]);
	    	}


    		var_text = string_hash_to_newline($"Health: {selected_unit.hp()}/{selected_unit.max_health()}")
        	tooltip_text = string_hash_to_newline(string("CON : {0}", selected_unit.constitution));
        	x1 = xx+1015;
        	y1 = yy+420;
        	x2 = x1+string_width(var_text);
        	y2 = y1+string_height(var_text);
	        draw_set_color(c_gray);
	        draw_text(x1,y1,var_text);
	        array_push(tooltip_drawing, [tooltip_text, [x1,y1,x2,y2]]); 

	        if (cn.temp[113]!="") then draw_text(xx+1015,yy+442,string_hash_to_newline("Experience: "+string(cn.temp[113])));

	        if (cn.temp[116]!=""){
	        	carry_data = cn.temp[116][2];
	        	var carry_string = $"melee carry: {carry_data[0]}/{carry_data[1]}"
	        	x1 = xx+1015;
	        	y1 = yy+464;
	        	x2 = x1+string_width(carry_string);
	        	y2 = y1+string_height(carry_string);
	        	draw_text(x1,y1,string_hash_to_newline(carry_string));
	        	tooltip_text = string_hash_to_newline(carry_data[2]);
	        	array_push(tooltip_drawing, [tooltip_text, [x1,y1,x2,y2]]);
	        }
	        if (cn.temp[117]!=""){
	        	carry_data = cn.temp[117][2];
	        	var carry_string = $"ranged carry: {carry_data[0]}/{carry_data[1]}"
	        	x1 = xx+1015;
	        	y1 = yy+486;
	        	x2 = x1+string_width(carry_string);
	        	y2 = y1+string_height(carry_string);
	        	draw_text(x1,y1,string_hash_to_newline(carry_string));
	        	tooltip_text = string_hash_to_newline(carry_data[2]);
	        	array_push(tooltip_drawing, [tooltip_text, [x1,y1,x2,y2]]);
	        }	        
        		 
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
	        	tooltip_text += string_hash_to_newline(string("CON: {0}x0.5#EXP: {1}x0.1", selected_unit.constitution, cn.temp[113]));
	        	x1 = xx+1387;
	        	y1 = yy+492;
	        	x2 = x1+string_width(var_text);
	        	y2 = y1+string_height(var_text);
		        draw_set_color(c_gray);
		        draw_text(x1,y1,var_text);
		        array_push(tooltip_drawing, [tooltip_text, [x1,y1,x2,y2]]);
	    	}
        
	        draw_set_font(fnt_40k_14i);
	        if (cn.temp[119]!="") then draw_text(xx+1020,yy+468,string_hash_to_newline(string(cn.temp[119])));
	    }
    
	    draw_set_font(fnt_40k_14);draw_set_halign(fa_left);
		
	    // Back
	    var top=man_current,sel=top,temp1="",temp2="",temp3="",temp4="",temp5="";
    
		// Var creation
	    var ma_ar="",ma_we1="",ma_we2="",ma_ge="",ma_mb="",ttt=0;
	    var ar_ar=0,ar_we1=0,ar_we2=0,ar_ge=0,ar_mb=0,eventing=false;
	        
	    yy+=77;
		
	    var unit_specialism_option=false, spec_tip="", tooltip_set=[];
		var repetitions=min(man_max,man_see);

		//tooltip text to tell you if a unit is eligible for special roles
		var spec_tips = [string("{0} Potential",obj_ini.role[100][16]),		
						string("{0} potential",obj_ini.role[100][15]),
						string("{0} potential",obj_ini.role[100][14]),
						"Librarium potential"];
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
	                   
		            temp3=string((unit.hp()/unit.max_health())*100)+"% HP";
	            
		            temp4=string(ma_exp[sel])+" exp";
	            
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
						ma_ar=scr_wep_abbreviate(ma_armour[sel]);// vehicle weapon 3
						if (string_count("^",ma_armour[sel])>0){
							ar_ar=1;
							ma_ar=string_replace(ma_ar,"^","");
						}
						if (string_count("&",ma_armour[sel])>0){
							ar_ar=2;
							ma_ar="Artifact";
						}
					}
					if (ma_gear[sel]!=""){
						ma_ge=scr_wep_abbreviate(ma_gear[sel]);// vehicle upgrade
						if (string_count("^",ma_gear[sel])>0){
							ar_ge=1;
							ma_ge=string_replace(ma_ge,"^","");
						}
						if (string_count("&",ma_gear[sel])>0){
							ar_ge=2;
							ma_ge="Artifact";
						}
					}
					if (ma_mobi[sel]!=""){
						ma_mb=scr_wep_abbreviate(ma_mobi[sel]);// vehicle accessory
						if (string_count("^",ma_mobi[sel])>0){
							ar_mb=1;
							ma_mb=string_replace(ma_mb,"^","");
						}
						if (string_count("&",ma_mobi[sel])>0){
							ar_mb=2;
							ma_mb="Artifact";
						}
					}
					if (ma_wep1[sel]!=""){
						ma_we1=scr_wep_abbreviate(ma_wep1[sel]);//vehicle weapon 1
						if (string_count("^",ma_wep1[sel])>0){
							ar_we1=1;
							ma_we1=string_replace(ma_we1,"^","");
						}
						if (string_count("&",ma_wep1[sel])>0){
							ar_we1=2;
							ma_we1="Artifact";
						}
					}
					if (ma_wep2[sel]!=""){
						ma_we2=scr_wep_abbreviate(ma_wep2[sel]);//vehicle weapon 2
						if (string_count("^",ma_wep2[sel])>0){
							ar_we2=1;
							ma_we2=string_replace(ma_we2,"^","");
						}
						if (string_count("&",ma_wep2[sel])>0){
							ar_we2=2;
							ma_we2="Artifact";
						}
					}
		            // temp5=string(ma_wep1[sel])+", "+string(ma_wep2[sel])+" + "+string(ma_gear[sel]);
		        }

		        if (man_sel[sel]==0) then draw_set_color(c_black);
		        if (man_sel[sel]!=0) then draw_set_color(6052956);// was gray
		        draw_rectangle(xx+25,yy+64,xx+974,yy+85,0);

		        unit_specialism_option=false;
		        spec_tip = "";
		        if (man[sel]="man"){
		        	draw_set_color(c_gray);
		        	if (!is_specialist(unit.role())){
				        if (unit.technology>=35){
				        	 //if unit has techmarine potential
				        	draw_set_color(c_orange);
				        	unit_specialism_option=true;
				        	spec_tip = spec_tips[0];
				        //if unit has librarian potential
				    	} else if (unit.psionic>7){
				    		spec_tip = spec_tips[3];
				    		unit_specialism_option=true;
				    		draw_set_color(c_aqua);
				    	}else if (unit.piety>=35) and (unit.charisma>=30){  //if unit has chaplain potential
				    		spec_tip = spec_tips[2];
				    		unit_specialism_option=true;
				    		draw_set_color(c_olive);
				    	}else if (unit.technology>=30) and (unit.intelligence>=45){ //if unit has apothecary potential
				    		spec_tip = spec_tips[1];
				    		unit_specialism_option=true;
				    		draw_set_color(c_fuchsia);
				    	}
			    	} else{
			    		if (array_contains(["Lexicanum", "Codiciery",obj_ini.role[100,17], string("Chief {0}",obj_ini.role[100,17])], unit.role())){
			    			draw_set_color(c_blue);
			    		} else if(array_contains(["Forge Master",obj_ini.role[100][16]],unit.role())){
			    			draw_set_color(c_maroon);
			    		} else if(array_contains([obj_ini.role[100][15],"Master of the Apothecarion"],unit.role())){
			    			draw_set_color(c_red);
			    		} else if(array_contains([obj_ini.role[100][14],"Master of Sanctity"],unit.role())){
			    			draw_set_color(c_teal);
			    		}
			    	}
		    	} else {
		    		draw_set_color(c_gray);
		    	}
		    	if (unit_specialism_option){
		    		array_push(tooltip_set, [spec_tip, [xx+25,yy+64,xx+974,yy+85]]);
		    		draw_rectangle(xx+25+2,yy+64+2,xx+974-2,yy+85-2,1);
		    	} else{
					draw_rectangle(xx+25,yy+64,xx+974,yy+85,1);
		    	}

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
	        
		        if (temp1!="Chapter Master "+string(obj_ini.master_name)){
		            if (man[sel]=="man") and (ma_promote[sel]>0) then draw_set_color(c_yellow);
		            if (man[sel]=="man") and (ma_promote[sel]>=10) then draw_set_color(c_red);
		            draw_text_transformed(xx+27+8,yy+66,string_hash_to_newline(string(temp1)),name_xr,1,0);
		            draw_text_transformed(xx+28+8,yy+67,string_hash_to_newline(string(temp1)),name_xr,1,0);
		            draw_set_color(c_gray);
		        }else if (temp1=="Chapter Master "+string(obj_ini.master_name)){
		            draw_text_transformed(xx+27+16+8,yy+66,string_hash_to_newline(string(temp1)),name_xr,1,0);
		            draw_text_transformed(xx+28+16+8,yy+67,string_hash_to_newline(string(temp1)),name_xr,1,0);
		            draw_sprite(spr_inspect_small,0,xx+27+8,yy+68);
		        }
		        draw_set_alpha(1);
	        
		        draw_set_color(c_gray);
		        draw_text_transformed(xx+240+8,yy+66,string_hash_to_newline(string(temp3)),1,1,0);// HP
		        draw_text_transformed(xx+330+8,yy+66,string_hash_to_newline(string(temp4)),1,1,0);// EXP
		        if (temp2=="Mechanicus Vessel") or (temp2=="Terra IV") or (temp2=="=Penitorium=") or (assignment!="none") then draw_set_alpha(0.5);
		        draw_text_transformed(xx+430+8,yy+66,string_hash_to_newline(string(temp2)),1,1,0);// LOC
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
			
			// How much space the selected unit takes
		    draw_set_color(c_gray);
		    draw_set_font(fnt_40k_14b);
			draw_text_transformed(xx+1010,yy+528,string_hash_to_newline("Selection: "+string(man_size)+" space"),1.5,1.5,0);
		    draw_set_font(fnt_40k_14);
			draw_text_ext(xx+1010,yy+552,string_hash_to_newline(selecting_dudes),-1,560);

			// Options for the selected unit
		    draw_set_font(fnt_40k_14b);
			draw_text_transformed(xx+1010,yy+610,string_hash_to_newline("Options:"),1.5,1.5,0);
		    draw_set_font(fnt_40k_14);

		    yy+=8;
		     //TODO handle recursively
		    if (!obj_controller.unit_profile){

			    if (sel_uni[1] != "") {
				    draw_text(xx + 1010, yy + 636, string_hash_to_newline("All Infantry"));
				    draw_rectangle(xx + 1010, yy + 634, xx + 1010 + string_width(string_hash_to_newline("All Infantry")), yy + 634 + string_height(string_hash_to_newline("All Infantry")), 1);
				    if (mouse_check_button_pressed(mb_left) && cooldown <= 0) {
				        if (mouse_x >= xx + 1010 && mouse_y >= yy + 634 && mouse_x < xx + 1010 + string_width(string_hash_to_newline("All Infantry")) && mouse_y < yy + 634 + string_height(string_hash_to_newline("All Infantry"))) {
				            cooldown = 8;
				            sel_all = "man";
				        }
				    }
				    var y_offset,x_offset;
				    var x1,x2,y1,y2;
				    for (var i = 1; i <= 8; i++) {
				        if (sel_uni[i] != "") {
				        	if (i<=4){
					            y_offset = 26 * (i - 1);
					        	x_offset=0;
				        	}
				            if (i>4){
				            	y_offset = 26 * (i - 5);
				            	x_offset=144;
				            }
				            x1=xx + 1016 +x_offset;
				            x2=x1+ string_width(string_hash_to_newline(sel_uni[i]));
				            y1=yy + 662 + y_offset;
				            y2=y1+string_height(string_hash_to_newline(sel_uni[i]))
				            draw_text(x1, y1, string_hash_to_newline(sel_uni[i]));
				            draw_rectangle(x1, y1, x2, y2, 1);

				            if (mouse_check_button_pressed(mb_left) && cooldown <= 0) {
				            	if (point_in_rectangle(mouse_x, mouse_y,x1, y1, x2, y2)){
				                    cooldown = 8;
				                    sel_all = sel_uni[i];
				                }
				            }
				        }
				    }
				}
			    if (sel_veh[1]!=""){
			        draw_text(xx+1010+288,yy+636,string_hash_to_newline("All Vehicles"));
			        draw_rectangle(xx+1010+288,yy+634,xx+1010+288+string_width(string_hash_to_newline("All Vehicles")),yy+634+string_height(string_hash_to_newline("All Vehicles")),1);
			        if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
			            if (mouse_x>=xx+1010+288) and (mouse_y>=yy+634) and (mouse_x<xx+1010+288+string_width(string_hash_to_newline("All Vehicles"))) and (mouse_y<yy+634+string_height(string_hash_to_newline("All Vehicles"))){
							cooldown=8;
							sel_all="vehicle";
						}
			        }
			        if (sel_veh[1]!=""){
			            draw_text(xx+1016+288,yy+662,string_hash_to_newline(sel_veh[1]));
						draw_rectangle(xx+1015+288,yy+661,xx+1016+288+string_width(string_hash_to_newline(sel_veh[1])),yy+661+string_height(string_hash_to_newline(sel_veh[1])),1);
			            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
			                if (mouse_x>=xx+1015+288) and (mouse_y>=yy+661) and (mouse_x<xx+1016+288+string_width(string_hash_to_newline(sel_veh[1]))) and (mouse_y<yy+661+string_height(string_hash_to_newline(sel_veh[1]))){
								cooldown=8;
								sel_all=sel_veh[1];
							}
			            }
			        }
			        if (sel_veh[2]!=""){
			            draw_text(xx+1016+288,yy+684,string_hash_to_newline(sel_veh[2]));
						draw_rectangle(xx+1015+288,yy+683,xx+1016+288+string_width(string_hash_to_newline(sel_veh[2])),yy+683+string_height(string_hash_to_newline(sel_veh[2])),1);
			            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
			                if (mouse_x>=xx+1015+288) and (mouse_y>=yy+683) and (mouse_x<xx+1016+288+string_width(string_hash_to_newline(sel_veh[2]))) and (mouse_y<yy+683+string_height(string_hash_to_newline(sel_veh[2]))){
								cooldown=8;
								sel_all=sel_veh[2];
							}
			            }
			        }
			        if (sel_veh[3]!=""){
			            draw_text(xx+1016+288,yy+706,string_hash_to_newline(sel_veh[3]));
						draw_rectangle(xx+1015+288,yy+705,xx+1016+288+string_width(string_hash_to_newline(sel_veh[3])),yy+705+string_height(string_hash_to_newline(sel_veh[3])),1);
			            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
			                if (mouse_x>=xx+1015+288) and (mouse_y>=yy+705) and (mouse_x<xx+1016+288+string_width(string_hash_to_newline(sel_veh[3]))) and (mouse_y<yy+705+string_height(string_hash_to_newline(sel_veh[3]))){
								cooldown=8;
								sel_all=sel_veh[3];
							}
			            }
			        }
			        if (sel_veh[4]!=""){
			            draw_text(xx+1016+288,yy+728,string_hash_to_newline(sel_veh[4]));
						draw_rectangle(xx+1015+288,yy+727,xx+1016+288+string_width(string_hash_to_newline(sel_veh[4])),yy+727+string_height(string_hash_to_newline(sel_veh[4])),1);
			            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
			                if (mouse_x>=xx+1015+288) and (mouse_y>=yy+728) and (mouse_x<xx+1016+288+string_width(string_hash_to_newline(sel_veh[4]))) and (mouse_y<yy+727+string_height(string_hash_to_newline(sel_veh[4]))){
								cooldown=8;
								sel_all=sel_veh[4];
							}
			            }
			        }
			        if (sel_veh[5]!=""){
			            draw_text(xx+1160+432,yy+662,string_hash_to_newline(sel_veh[5]));
						draw_rectangle(xx+1015+432,yy+661,xx+1160+432+string_width(string_hash_to_newline(sel_veh[5])),yy+661+string_height(string_hash_to_newline(sel_veh[5])),1);
			            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
			                if (mouse_x>=xx+1160+432) and (mouse_y>=yy+661) and (mouse_x<xx+1160+432+string_width(string_hash_to_newline(sel_veh[5]))) and (mouse_y<yy+661+string_height(string_hash_to_newline(sel_veh[5]))){
								cooldown=8;
								sel_all=sel_veh[5];
							}
			            }
			        }
			        if (sel_veh[6]!=""){
			            draw_text(xx+1160+432,yy+684,string_hash_to_newline(sel_veh[6]));
						draw_rectangle(xx+1015+432,yy+683,xx+1160+432+string_width(string_hash_to_newline(sel_veh[6])),yy+683+string_height(string_hash_to_newline(sel_veh[6])),1);
			            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
			                if (mouse_x>=xx+1160+432) and (mouse_y>=yy+683) and (mouse_x<xx+1160+432+string_width(string_hash_to_newline(sel_veh[6]))) and (mouse_y<yy+683+string_height(string_hash_to_newline(sel_veh[6]))){
								cooldown=8;
								sel_all=sel_veh[6];
							}
			            }
			        }
			        if (sel_veh[7]!=""){
			            draw_text(xx+1160+432,yy+706,string_hash_to_newline(sel_veh[7]));
						draw_rectangle(xx+1015+432,yy+705,xx+1160+432+string_width(string_hash_to_newline(sel_veh[7])),yy+705+string_height(string_hash_to_newline(sel_veh[7])),1);
			            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
			                if (mouse_x>=xx+1160+432) and (mouse_y>=yy+706) and (mouse_x<xx+1160+432+string_width(string_hash_to_newline(sel_veh[7]))) and (mouse_y<yy+705+string_height(string_hash_to_newline(sel_veh[7]))){
								cooldown=8;
								sel_all=sel_veh[7];
							}
			            }
			        }
			        if (sel_veh[8]!=""){
			            draw_text(xx+1160+432,yy+728,string_hash_to_newline(sel_veh[8]));
						draw_rectangle(xx+1015+432,yy+727,xx+1160+432+string_width(string_hash_to_newline(sel_veh[8])),yy+727+string_height(string_hash_to_newline(sel_veh[8])),1);
			            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
			                if (mouse_x>=xx+1160+432) and (mouse_y>=yy+728) and (mouse_x<xx+1160+432+string_width(string_hash_to_newline(sel_veh[8]))) and (mouse_y<yy+727+string_height(string_hash_to_newline(sel_veh[8]))){
								cooldown=8;
								sel_all=sel_veh[8];
							}
			            }
			        }
			    }
			    //draws hover overs for specialist potential
			    for (var i=0;i<array_length(tooltip_set);i++){
			    	if (point_in_rectangle(mouse_x, mouse_y, tooltip_set[i][1][0],tooltip_set[i][1][1],tooltip_set[i][1][2],tooltip_set[i][1][3])){
			    		tooltip_draw(tooltip_set[i][0])
			    	}
			    }
		    
			    yy-=8;

		    	draw_unit_buttons([xx+1281,yy+608],"Select All");
				
				// Update screen coordinates
			    var x5=xx+1018, y5=yy+831, x6=xx+1018+141, y6=yy+805;
				
				// Load/Unload to ship button
				if (sel_loading=0){
					draw_unit_buttons([x5,y6, x6, y5],"Load");
				} else if (sel_loading!=0){
					draw_unit_buttons([x5,y6, x6,y5],"Unload");
				}

				// Re equip button
			    x5=xx+1018+141;
				y5=yy+831;
				x6=xx+1297;
				y6=yy+805;
				draw_unit_buttons([x5,y6, x6, y5],"Re-equip");
		    
				// Promote button
			    x5=xx+1297;
				y5=yy+831;
				x6=xx+1436;
				y6=yy+805;
				if (sel_promoting>0){
					draw_unit_buttons([x5,y6, x6, y5],"Promote");
				}else {
					draw_unit_buttons([x5,y6, x6, y5],"Promote",[1.5,1.5],c_gray,fa_left, fnt_40k_14b, 0.5);
				}


				// Transfer to another company button
				y5=yy+831-26;
				x6=xx+1436;
				y6=yy+805-26;
			    draw_unit_buttons([x5,y6, x6, y5],"Transfer");				
				
				// Put in jail button
			    x5=xx+1297+141;
				y5=yy+831;
				x6=xx+1436+141;
				y6=yy+805;
				draw_unit_buttons([x5,y6, x6, y5],"Jail");
				
				// Reset changes button
			    x5=xx+1018+141;
				y5=yy+831-26;
				x6=xx+1297;
				y6=yy+805-26;
			    draw_unit_buttons([x5,y6, x6, y5],"Reset");
		    
				// Add bionics button
			    draw_set_color(38144);
			    x5=xx+1300+141;
				y5=yy+827-26;
				x6=xx+1436+141;
				y6=yy+805-26;
				draw_unit_buttons([x5,y6, x6, y5], "Add Bionics",[1,1],38144)
				
				// Designate as boarder unit
			    x5=xx+1018;
				y5=yy+827-26;
				x6=xx+1018+141;
				y6=yy+805-26;
				draw_unit_buttons([x5,y6, x6, y5], "Set Boarder",[1,1],c_red)
		    
			    scr_scrollbar(974,172,1005,790,34,man_max,man_current);
			}
		}		
		if instance_exists(cn)and (is_struct(cn.temp[120])){
			if (cn.temp[120].name()!="") and (cn.temp[120].race()!=0){
				draw_set_alpha(1);
				var xx=__view_get( e__VW.XView, 0 )+0, yy=__view_get( e__VW.YView, 0 )+0
		        if ((point_in_rectangle(mouse_x, mouse_y, xx+1208, yy+168, xx+1374, yy+409) || obj_controller.unit_profile || managing<0) and (!instance_exists(obj_temp3)) and(!instance_exists(obj_popup))){
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
		        	tooltip_draw(tip[0], undefined, coords[0],coords[3]+4);
			}
		}		
	}
	

	if (menu=30) and (managing>0){// Load to ships
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
	    if (obj_ini.company_title[managing]!=""){
			draw_set_font(fnt_fancy);
	        draw_text(xx+800,yy+110,string_hash_to_newline("''"+string(obj_ini.company_title[managing])+"''"));
		}
	    // Back
	    draw_sprite_ext(spr_arrow,0,xx+25,yy+70,2,2,0,c_white,1);
    
	    var top, sel, temp1="", temp2="", temp3="", temp4="", temp5="";
	    top=ship_current;
	    sel=top;
    
	    draw_set_font(fnt_40k_14);
	    draw_set_halign(fa_left);
	    yy+=77;
    
		var repetitions=min(ship_max,ship_see)
	    for(var i=0; i<repetitions; i++){
	        if (sh_name[sel]!=""){
	            temp1=string(sh_name[sel])+" ("+string(sh_class[sel])+")";
	            temp2=string(sh_loc[sel]);
	            temp3=sh_hp[sel];
	            temp4=string(sh_cargo[sel])+" / "+string(sh_cargo_max[sel])+" Space Used";
	        }
        
	        draw_set_color(c_black);
			draw_rectangle(xx+25,yy+64,xx+974,yy+85,0);
	        draw_set_color(c_gray);
			draw_rectangle(xx+25,yy+64,xx+974,yy+85,1);
	        draw_text_transformed(xx+27,yy+66,string_hash_to_newline(string(temp1)),1,1,0);
			draw_text_transformed(xx+27.5,yy+66.5,string_hash_to_newline(string(temp1)),1,1,0);
	        draw_text_transformed(xx+364,yy+66,string_hash_to_newline(string(temp2)),1,1,0);
	        draw_text_transformed(xx+580,yy+66,string_hash_to_newline(string(temp3)),1,1,0);
	        draw_text_transformed(xx+730,yy+66,string_hash_to_newline(string(temp4)),1,1,0);
        
	        yy+=20;sel+=1;
	    }
    
		// Load to selected
	    draw_set_font(fnt_40k_14b);
	    draw_text_transformed(xx+320,yy+402,string_hash_to_newline("Click a Ship to Load Selection (Req. "+string(man_size)+" Space)"),1,1,0);
    
	    xx=__view_get( e__VW.XView, 0 )+0;yy=__view_get( e__VW.YView, 0 )+0;
    
	    // draw_text_transformed(xx+488,yy+426,"Selection Size: "+string(man_size),0.4,0.4,0);
	    scr_scrollbar(974,172,1005,790,34,ship_max,ship_current);
	}

}