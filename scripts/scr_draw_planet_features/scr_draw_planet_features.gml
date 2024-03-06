// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function point_and_click(rect){
	return (point_in_rectangle(mouse_x, mouse_y, rect[0], rect[1],rect[2], rect[3]) && mouse_check_button_pressed(mb_left))
}


function feature_selected(Feature) constructor{
	feature = Feature;

	if (feature.f_type == P_features.Forge){
		var worker_caps= [2,4,8];
		worker_capacity = worker_caps[feature.size-1];	
		techs = collect_role_group("forge", obj_star_select.target.name);
		feature.techs_working = 0;
		for (var i=0;i<array_length(techs);i++){
			if (techs[i].assignment()=="forge" && techs[i].job.planet == obj_controller.selecting_planet){
				feature.techs_working++;
				if (feature.techs_working==worker_capacity) then break;
			}
		}
	}

	draw_planet_features = function(xx,yy){
	    draw_set_halign(fa_center);
	    draw_set_font(fnt_40k_14);
	    draw_sprite(spr_planet_screen,0,xx,yy); 
	    xx+=312
	    var area_width = 390;
	    var area_height = 294;
	    var generic = false;
	    var title="", body="";
	    //draw_glow_dot(xx+150, yy+150);
	    //rack_and_pinion(xx+230, yy+170);
	    var rectangle = [];
		switch (feature.f_type){
			case P_features.Forge:
				draw_text_transformed(xx+(390/2), yy +5, "Chapter Forge", 2, 2, 0);
				draw_set_halign(fa_left);
				draw_set_color(c_gray);

				draw_text(xx+10, yy+50, $"Working Techs : {feature.techs_working}/{worker_capacity}");
				if (point_and_click(draw_unit_buttons([xx+10, yy+70], "Assign To Forge",[1,1],c_red))){
					obj_controller.unit_profile = false;
					obj_controller.view_squad = false;
					group_selection(techs,{
						purpose:"Forge Assignment",
						purpose_code : "forge_assignment",
						number:worker_capacity-feature.techs_working,
						system:obj_controller.selected.id,
						feature:obj_star_select.feature,
						planet : obj_controller.selecting_planet,
						selections : []
					});
				}
				if (feature.size<3){
					var upgrade_cost = 2000 * feature.size;
					if (point_and_click(draw_unit_buttons([xx+10, yy+95], $"Upgrade Forge ({upgrade_cost} req)",[1,1],c_red)) && obj_controller.requisition>=upgrade_cost){
						obj_controller.requisition -=  upgrade_cost;
						feature.size++;
						worker_capacity*=2;
					}
				}
				break;
			case P_features.Necron_Tomb:

				generic=true;
				if (feature.awake==0 && feature.sealed==0){
					title = "Dormant Necron Tomb";
					body = "Scans indicate a Necron TOmb lies hidden under the surface of the planet, all signs indicate the tombis dormant as we must hope it remains";
				} else if (feature.sealed==1){
					title = "Sealed Necron Tomb";
					body = "Exterminatus and standard imperial armenants are no proof against the Necron Scourge with any luck those sealed within this tomb will remain there";
				} else if (feature.awake==1){
					title = "Awake Tomb";
					body = "The Cursed ranks of living metal spew forth from the Necron tomb below"
				}
				break;
			case P_features.Artifact:
				generic=true;
				title = "Unknown Artifact";
				body = "Unload Marines onto the planet to search for the artifact";
				break;	
			case P_features.Ancient_Ruins:
				generic=true;
				title = "Ancinet Ruins";
				body = "Unload Marines onto the planet to explore the ruins";
				break;
			case P_features.STC_Fragment:
				generic=true;
				title = "STC Fragment";
				body = $"Unload a {obj_ini.role[100][16]} and whatever entourage you deem necessary to recover the STC Fragment";
				break;	
			case P_features.Victory_Shrine:
				draw_text_transformed(xx+(390/2), yy +5, "Victory Shrine", 2, 2, 0);
				draw_set_halign(fa_left);
				draw_set_color(c_gray);				
				/*if (!feature.parade){
					if (point_and_click(draw_unit_buttons([xx+10, yy+70], "Parade (500 req)",[1,1],c_red))){
						obj_controller.requisition-=500;
						feature.forge=1;
						feature.forge_data = new player_forge();
					}
				}*/
				break;																	
			case P_features.Monastery:
				draw_text_transformed(xx+(390/2), yy +5, feature.name, 2, 2, 0);
				if (feature.forge==0){
					if (obj_controller.requisition>=500){
						if (point_and_click(draw_unit_buttons([xx+10, yy+70], "Build Forge (500 req)",[1,1],c_red))){
							obj_controller.requisition-=500;
							feature.forge=1;
							feature.forge_data = new player_forge();
						}
					} else {
						draw_unit_buttons([xx+10, yy+70], "Build Forge (500 req)",[1,1],c_gray);
					}
				}
				break;
		}
		if (generic){
			draw_text_transformed(xx+(390/2), yy +5, title, 2, 2, 0);
			draw_set_halign(fa_left);
			draw_set_color(c_gray);
			draw_text_ext(xx+10, yy+40,body,-1,area_width-20);
		}
	}
}

function rack_and_pinion(Type="forward") constructor{
	reverse =false;
	rack_y=0;
	rotation = 360;
	type=Type
	if (type="forward"){
		draw = function(x, y, freeze=false, Reverse=""){
			x+=19;
			if (!freeze){
				if (Reverse != ""){
					if (Reverse){
						reverse=true;
					} else {
						reverse=false;
					}
				}
				draw_sprite_ext(spr_cog_pinion, 0, x, y, 1, 1, rotation, c_white, 1)
				if (!reverse){
					rotation-=4;
				} else {
					rotation+=4;
				}
				rack_y = (75.3982236862/360)*(360-rotation)
				if (rack_y > 70){
					reverse = true;
				} else if (rack_y < 2){
					reverse = false;
				}
				draw_sprite_ext(spr_rack, 0, x-13, y-rack_y, 1, 1, 0, c_white, 1)
			} else {
				draw_sprite_ext(spr_cog_pinion, 0, x, y, 1, 1, rotation, c_white, 1)
				draw_sprite_ext(spr_rack, 0, x-13, y-rack_y, 1, 1, 0, c_white, 1)
			}		
		}
	} else if (type="backward"){
		draw = function(x, y, freeze=false, Reverse=""){
			x-=19;
			if (!freeze){
				if (Reverse != ""){
					if (Reverse){
						reverse=true;
					} else {
						reverse=false;
					}
				}
				draw_sprite_ext(spr_cog_pinion, 0, x, y, 1, 1, rotation, c_white, 1)
				if (!reverse){
					rotation+=4;
				} else {
					rotation-=4;
				}
				rack_y = (75.3982236862/360)*(360-rotation)
				if (rack_y > 70){
					reverse = true;
				} else if (rack_y < 2){
					reverse = false;
				}
				draw_sprite_ext(spr_rack, 0, x+13, y+rack_y, -1, 1, 0, c_white, 1)
			} else {
				draw_sprite_ext(spr_cog_pinion, 0, x, y, 1, 1, rotation, c_white, 1)
				draw_sprite_ext(spr_rack, 0, x+13, y+rack_y, -1, 1, 0, c_white, 1)
			}		
		}		
	}
}
function speeding_dot(XX,YY, limit) constructor{
	bottom_limit = limit;
	stack = 0;
	yyy=YY;
	xxx=XX;
	draw = function(xx,yy){
		if (bottom_limit+(48*0.7)<stack){
			stack=0;
		}
		var top_cut = 36-stack>0 ? 36-stack :0;
		var bottom_cut = bottom_limit<stack? 46-stack-bottom_limit:46;
		draw_sprite_part_ext(spr_research_bar, 2, 0, top_cut, 200, bottom_cut, xx-105, yy+stack, 1, 0.7, c_white, 1);
		stack+=3;
	}
	current_y = function(){
		return yy+stack;
	}
}
function glow_dot() constructor{
	flash = 0
	flash_size = 5;
	one_flash_finished = true;
	draw = function(xx, yy){
		draw_set_color(c_green);
		for (var i=0; i<=flash_size;i++){
			draw_set_alpha(1 - ((1/40)*i))
			draw_circle(xx, yy, (i/3), 1);
		}
		if (flash==0){
			if (flash_size<40){
				flash_size++;
			} else {
				flash = 1;
				flash_size--;
			}
		} else {
			if (flash_size > 1){
				flash_size--;
			}else {
				flash_size++;
				flash = 0;
			}
		}		
	}
	draw_one_flash = function(xx, yy){
		if (one_flash_finished) then exit;
		draw_set_color(c_green);
		for (var i=0; i<=flash_size;i++){
			draw_set_alpha(1 - ((1/40)*i))
			draw_circle(xx, yy, (i/3), 1);
		}
		if (flash==0){
			if (flash_size<40){
				flash_size++;
			} else {
				flash = 1;
				flash_size--;
			}
		} else {
			if (flash_size > 1){
				flash_size--;
			}else {
				flash_size++;
				flash = 0;
				one_flash_finished = true;
			}
		}		
	}
}

function shutter_button() constructor{
	time_open = 0;
	click_timer = 0;
	Width = 315;
	Height = 90;
	right_rack = new rack_and_pinion();
	left_rack = new rack_and_pinion("backward");
	draw_shutter = function(xx,yy,text, scale=1, entered = ""){
        draw_set_alpha(1);

        draw_set_font(fnt_40k_12);
        draw_set_halign(fa_left);
        draw_set_color(c_gray);		
		var width = Width *scale;
		var height = Height *scale;
		if (entered==""){
			entered = point_in_rectangle(mouse_x, mouse_y, xx, yy, xx+width, yy+height);
		} else {
			entered=entered;
		}
		var shutter_backdrop = 5;
		if (entered || click_timer>0){
			if (time_open<20){
				time_open++;
				right_rack.draw(xx+width, yy, false, false);
				left_rack.draw(xx, yy, false, false);
			} else {
				right_rack.draw(xx+width, yy, true);
				left_rack.draw(xx, yy, true);
			}
			if ((mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x, mouse_y, xx, yy, xx+width, yy+height))||click_timer>0 ){
				shutter_backdrop = 6;
				click_timer++;
			}
		} else if (time_open>0){
			time_open--;
			right_rack.draw(xx+width, yy, false, true);
			left_rack.draw(xx, yy, false, true);
		} else {
			right_rack.draw(xx+width, yy, true);
			left_rack.draw(xx, yy, true);
		}
		var text_draw = xx+(width/2)-(string_width(text)*(3*scale)/2);
		if (time_open<2){
			draw_sprite_ext(spr_shutter_button, 0, xx, yy, scale, scale, 0, c_white, 1)
		} else if (time_open<8 && time_open>=2){
			draw_sprite_ext(spr_shutter_button, shutter_backdrop, xx, yy, scale, scale, 0, c_white, 1)
			draw_set_color(c_red);
			draw_text_transformed(text_draw, yy+(20*scale), text, 3*scale, 3*scale, 0);
			draw_sprite_ext(spr_shutter_button, 1, xx, yy, scale, scale, 0, c_white, 1)
		}else if  (time_open<13 && time_open>=8){
			draw_sprite_ext(spr_shutter_button, shutter_backdrop, xx, yy, scale, scale, 0, c_white, 1)
			draw_set_color(c_red);
			draw_text_transformed(text_draw, yy+(20*scale), text, 3*scale, 3*scale, 0);
			draw_sprite_ext(spr_shutter_button, 2, xx, yy, scale, scale, 0, c_white, 1)
		}else if  (time_open<18 && time_open>=13){
			draw_sprite_ext(spr_shutter_button, shutter_backdrop, xx, yy, scale, scale, 0, c_white, 1)
			draw_set_color(c_red);
			draw_text_transformed(text_draw, yy+(20*scale), text, 3*scale, 3*scale, 0);
			draw_sprite_ext(spr_shutter_button, 3, xx, yy, scale, scale, 0, c_white, 1)
		} else if (time_open>=18){
			draw_sprite_ext(spr_shutter_button, shutter_backdrop, xx, yy, scale, scale, 0, c_white, 1)
			draw_set_color(c_red);
			draw_text_transformed(text_draw, yy+(20*scale), text, 3*scale, 3*scale, 0);
			draw_sprite_ext(spr_shutter_button, 4, xx, yy, scale, scale, 0, c_white, 1)
		}
		draw_set_color(c_grey);
		if (click_timer>7){
			click_timer = 0;
			return true;
		} else {
			return false;
		}
	}
}

function data_slate() constructor{
	static_line=1;
	title="";
	sub_title="";
	body_text = "";
	inside_method = "";
	XX=0
	YY=0
	static draw = function(xx,yy, scale_x=1, scale_y=1){
		XX=xx;
		YY=yy;
		width = 860*scale_x;
		height = 850*scale_y;
		draw_sprite_ext(spr_data_slate,1, xx,yy, scale_x, scale_y, 0, c_white, 1);
		if (is_method(inside_method)){
			inside_method();
		}
	    if (static_line<=10) then draw_set_alpha(static_line/10);
	    if (static_line>10) then draw_set_alpha(1-((static_line-10)/10));		
		draw_set_color(5998382);
		var line_move = yy+(70*scale_y)+((36*scale_y)*static_line);
		draw_line(xx+(30*scale_x),line_move,xx+(820*scale_x),line_move);
		draw_set_alpha(1);
		if (irandom(75)=0 && static_line>1){static_line--;}
		else{
			static_line+=0.1;
		}
		if (static_line>20) then static_line=1;
		draw_set_color(c_gray);
		draw_set_halign(fa_center);
		var draw_height = 	5;
		if (title!=""){
			draw_text_transformed(xx+(0.5*width), yy+(50*scale_y), title, 3*scale_x, 3*scale_y, 0);
			draw_height += (string_height(title)*3)*scale_y;
		}
		if (sub_title!=""){
			draw_text_transformed(xx+(0.5*width), yy+(50*scale_y)+draw_height, sub_title, 2*scale_x, 2*scale_y, 0);
			draw_height+=(25*scale_y) +(string_height(sub_title)*2)*scale_y;
		}
		if (body_text!=""){
			draw_text_ext(xx+(0.5*width), yy+(50*scale_y)+draw_height, string_hash_to_newline(body_text), -1, width-60);
		}
	}
}