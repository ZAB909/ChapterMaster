// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function point_and_click(rect){
	return (point_in_rectangle(mouse_x, mouse_y, rect[0], rect[1],rect[2], rect[3]) && mouse_check_button_pressed(mb_left))
}


function feature_selected(Feature) constructor{
	feature = Feature;

	if (feature.f_type == P_features.Forge){
		techs = collect_role_group("forge", obj_star_select.target.name);
	}

	draw_planet_features = function(xx,yy){
	    draw_set_halign(fa_center);
	    draw_set_font(fnt_40k_14);
	    draw_sprite(spr_planet_screen,0,xx,yy); 
	    xx+=312
	    var area_width = 390;
	    var area_height = 294;
	    draw_glow_dot(xx+150, yy+150);
	    rack_and_pinion(xx+230, yy+170);
	    var rectangle = [];
		switch (feature.f_type){
			case P_features.Forge:
				draw_text_transformed(xx+(390/2), yy +5, "Chapter Forge", 2, 2, 0);
				draw_set_halign(fa_left);
				draw_set_color(c_gray);
				var worker_capacity=0;
				if (feature.size==1){
					worker_capacity = 2;
				}
				draw_text(xx+10, yy+50, $"Working Techs:{techs_working}/{worker_capacity}");
				if (feature.techs_working<worker_capacity){
					if (point_and_click(draw_unit_buttons([xx+10, yy+60], "Assign To Forge",[1,1],c_red))){

					}
				}
				break
			case P_features.Artifact:
				draw_text_transformed(xx+(390/2), yy +5, "Unknown Artifact", 2, 2, 0);
				draw_set_halign(fa_left);
				draw_set_color(c_gray);
				draw_text_ext(xx+10, yy+40, "Unload Marines onto the planet to search for the artifact",-1,area_width-20);
				break;
		}
	}
}

function rack_and_pinion() constructor{
	reverse =false;
	rack_y=0;
	rotation = 360;
	draw = function(x, y, freeze=false, Reverse=""){
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
			draw_sprite_ext(spr_rack, 0, x, y-rack_y, 1, 1, 0, c_white, 1)
		} else {
			draw_sprite_ext(spr_cog_pinion, 0, x, y, 1, 1, rotation, c_white, 1)
			draw_sprite_ext(spr_rack, 0, x, y-rack_y, 1, 1, 0, c_white, 1)
		}		
	}
}

function draw_glow_dot(x, y){
	static flash = 0
	static flash_size = 5;
	for (var i=0; i<=flash_size;i++){
		draw_set_alpha(1 - ((1/40)*i))
		draw_circle(x, y, (i/2), 1);
	}
	if (flash==0){
		if (flash_size<40){
			flash_size++;
		} else {
			flash = 1;
			flash_size--;
		}
	} else {
		if (flash_size > 10){
			flash_size--;
		}else {
			flash_size++;
			flash = 0;
		}
	}
}

function shutter_button() constructor{
	time_open = 0;
	click_timer = 0;
	Width = 330;
	Height = 90;
	right_rack = new rack_and_pinion();
	draw_shutter = function(xx,yy,text, scale=1){
		var width = Width *scale;
		var height = Height *scale;
		var entered = point_in_rectangle(mouse_x, mouse_y, xx, yy, xx+width, yy+height);
		var shutter_backdrop = 5;
		if (entered || click_timer>0){
			if (time_open<20){
				time_open++;
				right_rack.draw(xx+width, yy, false, false);
			} else {
				right_rack.draw(xx+width, yy, true);
			}
			if (mouse_check_button_pressed(mb_left)||click_timer>0){
				shutter_backdrop = 6;
				click_timer++;
			}
		} else if (time_open>0){
			time_open--;
			right_rack.draw(xx+width, yy, false, true);
		} else {
			right_rack.draw(xx+width, yy, true);
		}
		var text_draw = xx+(width/2)-(string_width(text)*3/2);
		if (time_open<2){
			draw_sprite(spr_shutter_button, 0, xx, yy);
		} else if (time_open<8 && time_open>=2){
			draw_sprite_ext(spr_shutter_button, shutter_backdrop, xx, yy, scale, scale, 0, c_white, 1)
			draw_set_color(c_red);
			draw_text_transformed(text_draw, yy+20, text, 3, 3, 0);
			draw_sprite_ext(spr_shutter_button, 1, xx, yy, scale, scale, 0, c_white, 1)
		}else if  (time_open<13 && time_open>=8){
			draw_sprite_ext(spr_shutter_button, shutter_backdrop, xx, yy, scale, scale, 0, c_white, 1)
			draw_set_color(c_red);
			draw_text_transformed(text_draw, yy+20, text, 3, 3, 0);
			draw_sprite_ext(spr_shutter_button, 2, xx, yy, scale, scale, 0, c_white, 1)
		}else if  (time_open<18 && time_open>=13){
			draw_sprite_ext(spr_shutter_button, shutter_backdrop, xx, yy, scale, scale, 0, c_white, 1)
			draw_set_color(c_red);
			draw_text_transformed(text_draw, yy+20, text, 3, 3, 0);
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


