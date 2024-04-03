// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_unit_quick_find_pane() constructor{
	main_panel = new data_slate();
	tab_buttons = {
	    "fleets":new main_menu_button(spr_ui_but_3, spr_ui_hov_3),
	    "garrisons":new main_menu_button(spr_ui_but_3, spr_ui_hov_3),
	    "vehicles":new main_menu_button(spr_ui_but_3, spr_ui_hov_3),
	    "troops":new main_menu_button(spr_ui_but_3, spr_ui_hov_3),
	}

	view_area = "fleets";

	travel_target = [];
	travel_time = 0;
	travel_increments = [];
	is_entered = false;
	main_panel.inside_method = function(){
		var xx = main_panel.XX;
		var yy = main_panel.YY;		
		is_entered = scr_hit(xx, yy, xx+main_panel.width, yy+main_panel.height)
		if (view_area=="fleets"){
			var cur_fleet;
			draw_set_color(c_white);
			draw_set_halign(fa_center);
		    draw_text(xx+80, yy+50, "capitals");
		    draw_text(xx+160, yy+50, "Frigates");
		    draw_text(xx+240, yy+50, "Escorts");
		    draw_text(xx+310, yy+50, "Location");			
			for (var i = 0; i < instance_number(obj_p_fleet); ++i;)
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
			}			
		}
		if (array_length(travel_target)==2){
			if (obj_controller.x!=travel_target[0] || obj_controller.y!=travel_target[1]){
				obj_controller.x+=travel_increments[0];
				obj_controller.y+=travel_increments[1];
				travel_time++;
			} else {
				travel_target=[];		
			}
			if (travel_time==15){
				obj_controller.x=travel_target[0];
				obj_controller.y=travel_target[1];
				travel_target=[];			
			}
		}
	}
	static draw = function(){
		if (obj_controller.menu==0){
			if (!instance_exists(obj_fleet_select) && !instance_exists(obj_star_select)){
				var xx=__view_get( e__VW.XView, 0 )+0;
				var yy=__view_get( e__VW.YView, 0 )+0;
				main_panel.draw(xx, yy+110, 0.46, 0.8);
				if(tab_buttons.fleets.draw(xx,yy+79, "Fleets")){
				    view_area="fleets";
				}
				if (tab_buttons.garrisons.draw(xx+115,yy+79, "Planet Troops")){
				    view_area="garrisons";
				}
				/*if (tab_buttons.vehicles.draw(xx+230,yy+79, "Vehicles")){
				    view_area="vehicles";
				}
				if (tab_buttons.troops.draw(xx+345,yy+79, "Troops")){
				    view_area="troops";
				}*/							
			}
		}
	}
}