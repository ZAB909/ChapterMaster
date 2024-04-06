// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_unit_quick_find_pane() constructor{
	main_panel = new data_slate();
	tab_buttons = {
	    "fleets":new main_menu_button(spr_ui_but_3, spr_ui_hov_3),
	    "garrisons":new main_menu_button(spr_ui_but_3, spr_ui_hov_3),
	    "hider":new main_menu_button(spr_ui_but_3, spr_ui_hov_3),
	    "troops":new main_menu_button(spr_ui_but_3, spr_ui_hov_3),
	}

	view_area = "fleets";
	update_garrison_log = function(){
		var u, unit, unit_location, group;
	    garrison_log = {};
	    for (var co=0;co<11;co++){
	    	for (var u=1;u<array_length(obj_ini.TTRPG[co]);u++){
	    		unit = fetch_unit([co, u]);
	    		if (unit.name() == "") then continue;
	    		unit_location = unit.marine_location();
	    		if (unit_location[0]==location_types.planet){
	    			if (!struct_exists(garrison_log, unit_location[2])){
	    				garrison_log[$ unit_location[2]] = {
	    					units:[unit],
	    					vehicles:0, 
	    					garrison:false, 
	    					healers:0, 
	    					techies:0
	    				}
	    			} else {
	    				array_push(garrison_log[$ unit_location[2]].units, unit);
	    			}
	    			group = garrison_log[$ unit_location[2]];
	    			if (unit.IsSpecialist("apoth")){
						group.healers++;
	    			} else if (unit.IsSpecialist("forge")){
						group.techies++;
	    			}
	    		}   	
	    	}
	    }		
	}
	hover_item="none";
	travel_target = [];
	travel_time = 0;
	travel_increments = [];
	is_entered = false;
	start_fleet = 0;
	start_system = 0;
	garrison_log = {};
	hide_sequence=0;
	current_hover=-1;
	hover_count=0;
	main_panel.inside_method = function(){
		var xx = main_panel.XX;
		var yy = main_panel.YY;
		is_entered = scr_hit(xx, yy, xx+main_panel.width, yy+main_panel.height);
		if (view_area=="fleets"){
			var cur_fleet;
			draw_set_color(c_white);
			draw_set_halign(fa_center);
		    draw_text(xx+80, yy+50, "capitals");
		    draw_text(xx+160, yy+50, "Frigates");
		    draw_text(xx+240, yy+50, "Escorts");
		    draw_text(xx+310, yy+50, "Location");
		    var i = start_fleet;
		    while(i<instance_number(obj_p_fleet) && (yy+90+(20*i)+12 +20)<main_panel.YY+yy+main_panel.height)		
			{
				if (scr_hit(xx+10, yy+90+(20*i),xx+main_panel.width,yy+90+(20*i)+18)){
					draw_set_color(c_gray);
					draw_rectangle(xx+10+20, yy+90+(20*i)-2,xx+main_panel.width-20,yy+90+(20*i)+18, 0)
					draw_set_color(c_white);
				}
			    cur_fleet = instance_find(obj_p_fleet,i);
			    draw_text(xx+80, yy+90+(20*i), cur_fleet.capital_number);
			    draw_text(xx+160, yy+90+(20*i), cur_fleet.frigate_number);
			    draw_text(xx+240, yy+90+(20*i), cur_fleet.escort_number);
			    if (cur_fleet.action=="move"){
			    	draw_text(xx+310, yy+90+(20*i), "Warp Travel");
			    } else {
			    	draw_text(xx+310, yy+90+(20*i), instance_nearest(cur_fleet.x, cur_fleet.y, obj_star).name);
			    }
			    if (point_and_click([xx+10, yy+90+(20*i)-2,xx+main_panel.width,yy+90+(20*i)+18])){
			    	travel_target = [cur_fleet.x, cur_fleet.y];
			    	travel_increments = [(travel_target[0]-obj_controller.x)/15,(travel_target[1]-obj_controller.y)/15];
			    	travel_time = 0;
			    }
			    i++;
			}			
		} else if (view_area=="garrisons"){
			var system_data;
			draw_set_color(c_white);
			draw_set_halign(fa_center);
		    draw_text(xx+80, yy+50, "System");
		    draw_text(xx+160, yy+50, "Troops");
		    draw_text(xx+240, yy+50, "Healers");
		    draw_text(xx+310, yy+50, "Techies");
		    var i = start_system;
		    var registered_hover=false;
		    var system_names = struct_get_names(garrison_log);
			var hover_entered=false;
			var any_hover = false;
			if (hover_item!="none"){
				var loc=hover_item.location;
				hover_entered = scr_hit(loc[0],loc[1],loc[2],loc[3]);
			}		    
		    while(i<array_length(system_names) && (yy+90+(20*i)+12 +20)<main_panel.YY+yy+main_panel.height){
		    	system_data = garrison_log[$system_names[i]];
		    	registered_hover=false;
				if (scr_hit(xx+10, yy+90+(20*i),xx+main_panel.width,yy+90+(20*i)+18)){
					if (!hover_entered){
						draw_set_color(c_gray);
						draw_rectangle(xx+10+20, yy+90+(20*i)-2,xx+main_panel.width-20,yy+90+(20*i)+18, 0);
						draw_set_color(c_white);
						if (current_hover>-1 && current_hover!=i){
							registered_hover=false;
						} else {
							current_hover=i;
							registered_hover=true;
							hover_count++;
						}
					} else {
						if (hover_item.root_item == i){
							draw_rectangle(xx+10+20, yy+90+(20*i)-2,xx+main_panel.width-20,yy+90+(20*i)+18, 0);
						}
					}
				}
			    draw_text(xx+80, yy+90+(20*i), system_names[i]);
			    draw_text(xx+160, yy+90+(20*i), array_length(system_data.units));
			    draw_text(xx+240, yy+90+(20*i), system_data.healers);
			    draw_text(xx+310, yy+90+(20*i), system_data.techies);

			    if (!hover_entered){
    			    if (point_and_click([xx+10, yy+90+(20*i)-2,xx+main_panel.width,yy+90+(20*i)+18])){
    			    	var star = star_by_name(system_names[i]);
    			    	if (star!="none")
    			    	travel_target = [star.x, star.y];
    			    	travel_increments = [(travel_target[0]-obj_controller.x)/15,(travel_target[1]-obj_controller.y)/15];
    			    	travel_time = 0;
    			    }
    			}
			    if (registered_hover){
			    	any_hover=true;
    			    if (hover_count==10){
    			    	hover_item = new hover_box();
    			    	hover_item.relative_x = (mouse_x-xx+(10-10));
    			    	hover_item.relative_y = (mouse_y-(yy+90+(20*i)));
    			    	hover_item.root_item=i;
    			    }
    			}
			    i++;
			}		
			if (!any_hover && !hover_entered){
				current_hover=-1;
				hover_count=0;
				hover_item="none";
			}else if (hover_item!="none"){
		    	if point_and_click(hover_item.draw(xx+10, yy+90+(20*hover_item.root_item), "Manage")){
					group_selection(garrison_log[$system_names[hover_item.root_item]].units,{
						purpose:$"{system_names[hover_item.root_item]} Management",
						purpose_code : "manage",
						number:0,
						system:star_by_name(system_names[hover_item.root_item]).id,
						feature:"none",
						planet : 0,
						selections : []
					});
		    	}
		    }			
		}
		if (array_length(travel_target)==2){
			if (obj_controller.x!=travel_target[0] || obj_controller.y!=travel_target[1]){
				obj_controller.x += travel_increments[0];
				obj_controller.y += travel_increments[1];
				travel_time++;
			} else {
				travel_target=[];		
			}
			if (travel_time==15){
				obj_controller.x = travel_target[0];
				obj_controller.y = travel_target[1];
				travel_target=[];			
			}
		}
	}
	static draw = function(){
		if (obj_controller.menu==0 && obj_controller.zoomed==0 ){
			if (!instance_exists(obj_fleet_select) && !instance_exists(obj_star_select)){
				var xx=__view_get( e__VW.XView, 0 )+0;
				var yy=__view_get( e__VW.YView, 0 )+0;
				var x_draw=xx;
				var lower_draw = yy+main_panel.height+110;
				if (hide_sequence=30) then hide_sequence=0;
				if ((hide_sequence>0 && hide_sequence<15) || (hide_sequence>15 && hide_sequence<30)){
					if (hide_sequence>15){
						x_draw=(xx-main_panel.width) +((main_panel.width/15)*(hide_sequence-15));
					} else {
						x_draw=xx-((main_panel.width/15)*hide_sequence);
					}
					hide_sequence++;
				}
				if (hide_sequence>15 || hide_sequence<15){
					main_panel.draw(x_draw, yy+110, 0.46, 0.75);
					if(tab_buttons.fleets.draw(x_draw,yy+79, "Fleets")){
					    view_area="fleets";
					}
					if (tab_buttons.garrisons.draw(x_draw+115,yy+79, "Planet Troops")){
					    view_area="garrisons";
					    update_garrison_log();
					}
					if (x_draw+280<xx){
						tab_buttons.hider.draw(xx,lower_draw, "Show")
					} else {
						if (tab_buttons.hider.draw(x_draw+280,lower_draw, "Hide")){
						    hide_sequence++;
						}					
					}					
				} else if (hide_sequence==15){
					if (tab_buttons.hider.draw(xx,lower_draw, "Show")){
					    hide_sequence++;
					}
				}
				/*if (tab_buttons.troops.draw(xx+345,yy+79, "Troops")){
				    view_area="troops";
				}*/							
			}
		}
	}
}

function  hover_box() constructor{
	root_item = "none";
	relative_x=0;
	relative_y=0;
	location = [0,0,0,0];
	static draw = function(xx, yy, button_text){
		location = draw_unit_buttons([xx+relative_x, yy+relative_y], button_text,[1,1], c_green,fa_left, fnt_40k_14b, 1);
		return location;
	}
}

function exit_adhoc_manage(){
	menu=0;
    onceh=1;
    cooldown=10;
    click=1;
    hide_banner=0;
    if (instance_exists(selection_data.system)){
   		selection_data.system.alarm[3]=4;
    }		
};
 function update_garrison_manage(){
	location_viewer.update_garrison_log();
	if (struct_exists(location_viewer.garrison_log, selection_data.system.name)){
		var sys_name = selection_data.system.name;
		group_selection(location_viewer.garrison_log[$sys_name].units,selection_data);
	} else {
		exit_adhoc_manage();		
	} 	
}