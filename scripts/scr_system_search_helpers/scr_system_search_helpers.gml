// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_get_planet_with_feature(star, feature){
	for(var i = 1; i <= star.planets; i++){
		if(planet_feature_bool(star.p_feature[i], feature) == 1)
			{
				return i;
			}
		}
	return -1;
}

//TODO make an adaptive allies system
function NSystemSearchHelpers() constructor{
	static default_allies = [
		eFACTION.Player,
		eFACTION.Imperium,
		eFACTION.Mechanicus,
		eFACTION.Inquisition,
		eFACTION.Ecclesiarchy
	]
}
global.SystemHelps = new NSystemSearchHelpers();

function scr_star_has_planet_with_feature(star, feature){
	return scr_get_planet_with_feature(star, feature) != -1;
}

function scr_is_planet_owned_by_allies(star, planet_idx) {
	if planet_idx < 1 //1 because weird indexing starting at 1 in this game
		return false;
	return array_contains(global.SystemHelps.default_allies, star.p_owner[planet_idx])
}

function scr_is_star_owned_by_allies(star) {
	return array_contains(global.SystemHelps.default_allies, star.owner)
}

function scr_get_planet_with_type(star, type){
	for(var i = 1; i <= star.planets; i++){
		if(star.p_type[i] == type)
			{
				return i;
			}
		}
	return -1;
}
function planets_without_type(type,star="none"){
	var return_planets = [];
	if (star=="none"){
		for(var i = 1; i <= planets; i++){
			if(p_type[i] != type){
				array_push(return_planets, i);
			}
		}
	} else {
		with (star){
			return_planets = planets_without_type(type);
		}
	}
	return return_planets;
}

function scr_star_has_planet_with_type(star, type){
	return scr_get_planet_with_type(star,type) != -1;
}

function scr_get_planet_with_owner(star, owner){
	for(var i = 1; i <= star.planets; i++){
		if(star.p_owner[i] == owner)
			{
				return i;
			}
		}
	return -1;
}

function scr_star_has_planet_with_owner(star, owner){
	return scr_get_planet_with_owner(star,owner) != -1;
}

function scr_get_stars() {
	var stars = [];
	with(obj_star){
		array_push(stars,id);
	}
	return stars;
}

function planet_imperium_ground_total(planet_check){
    return p_guardsmen[planet_check]+p_pdf[planet_check]+p_sisters[planet_check]+p_player[planet_check];
}

function star_by_name(search_name){
	with(obj_star){
		if (name = search_name){
			return self;
		}
	}
	return "none";
}

function distance_removed_star(origional_x,origional_y, star_offset = choose(2,3), disclude_hulk=true, disclude_elder=true, disclude_deads=true){
	var from = instance_nearest(origional_x,origional_y,obj_star);
    for(var i=0; i<star_offset; i++){
        from=instance_nearest(origional_x,origional_y,obj_star);
        with(from){
        	instance_deactivate_object(id);
        };
        from=instance_nearest(origional_x,origional_y,obj_star);
        if (instance_exists(from)){
	        if (disclude_elder && from.owner==eFACTION.Eldar){
	        	i--;
	        	instance_deactivate_object(from);
	        	continue;
	        }
	        if (disclude_deads){
	        	if (is_dead_star(from)){
		        	i--;
		        	instance_deactivate_object(from);
		        	continue;        		
	        	}
	        }
	    }        
    }
    //from=instance_nearest(origional_x,origional_y,obj_star);
    instance_activate_object(obj_star);
    return from;     
}
function nearest_star_with_ownership(xx,yy, ownership){
	var nearest = "none"
	var total_stars =  instance_number(obj_star);
	var i=0;
	if (!is_array(ownership)){
		ownership = [ownership];
	}
	while (nearest=="none" && i<total_stars){
		i++;
		var cur_star =  instance_nearest(xx,yy, obj_star);
		if (array_contains(ownership, cur_star.owner)){
			nearest=cur_star.id;
		} else {
			instance_deactivate_object(cur_star.id);
		}
	}
	instance_activate_object(obj_star);
	return nearest;
}

function adjust_influence(faction, value, planet){
	p_influence[planet][faction]+=value;
	var total_influence =  array_reduce(p_influence[planet], array_sum,1);
	if (total_influence>100){
		var difference = total_influence-100;
		while (difference>0){
			for (i=0;i<15;i++){
				if (p_influence[planet][i]>0){
					p_influence[planet][i]--;
					difference--;
				}
			}
		}
	} else if (total_influence<0){
		while (total_influence<0){
			for (i=0;i<15;i++){
				if (p_influence[planet][i]>0){
					p_influence[planet][i]++;
					total_influence++;
				}
			}
		}
	}
}

function planet_numeral_name(planet, star="none"){
	if (star=="none"){
		return $"{name} {scr_roman(planet)}";
	} else {
		with (star){
			return $"{name} {scr_roman(planet)}";
		}		
	}
}
function has_problem_star(problem, star="none"){
	var has_problem = false;
	if (star=="none"){
		for (var i=1;i<planets;i++){
			has_problem = has_problem_planet(i, problem);
			if (has_problem){
				has_problem=i;
				break
			}
		}
	} else {
		with (star){
			has_problem = has_problem_star(problem);
		}
	}
	return has_problem;
}

function has_problem_planet(planet, problem, star="none"){
	if (star=="none"){
		return array_contains(p_problem[planet], problem);
	} else {
		return array_contains(star.p_problem[planet], problem);
	}
}
function has_problem_planet_and_time(planet, problem, time,star="none"){
	var had_problem = false;
	if (star=="none"){
		for (var i =1;i<array_length(p_problem[planet]);i++){
			if (p_problem[planet][i] == problem){
				if (p_timer[planet][i] == time){
					had_problem=true;
				}
			}
		}
	} else {
		with (star){
			had_problem=remove_planet_problem(planet, problem)
		}
	}
	return had_problem;	
}
 function has_problem_planet_with_time(planet, problem,star="none"){
	var had_problem = false;
	if (star=="none"){
		for (var i =1;i<array_length(p_problem[planet]);i++){
			if (p_problem[planet][i] == problem){
				if (p_timer[planet][i] >0){
					had_problem=i;
				}
			}
		}
	} else {
		with (star){
			had_problem=remove_planet_problem(planet, problem)
		}
	}
	return had_problem;	
}

function find_problem_planet(planet, problem, star="none"){
	if (star=="none"){
		for (var i =1;i<array_length(p_problem[planet]);i++){
			if (p_problem[planet][i] == problem){
				return i;
			}
		}
	} else {
		with (star){
			return find_problem_planet(planet, problem);
		}
	}
	return -1;
}

function remove_planet_problem(planet, problem, star="none"){
	var had_problem = false;
	if (star=="none"){
		for (var i =1;i<array_length(p_problem[planet]);i++){
			if (p_problem[planet][i] == problem){
				p_problem[planet][i]="";
				p_timer[planet][i]=-1;
				p_problem_other_data[planet][i]={};
				had_problem=true;
			}
		}
	} else {
		with (star){
			had_problem=remove_planet_problem(planet, problem);
		}
	}
	return had_problem;	
}

function open_problem_slot(planet, star="none"){
	if (star=="none"){
		for (i=1;i<array_length(p_problem[planet]);i++){
			if (p_problem[planet][i] ==""){
				return i;
			}
		}
	} else {
		with (star){
			return open_problem_slot(planet)
		}
	}
	return -1;
}

function remove_star_problem(problem){
	for (var i=1;i<=planets;i++){
		remove_planet_problem(i, problem);
	}
}

function problem_count_down(planet, count_change=1){
	for (var i=1;i<array_length(p_problem[planet]);i++){
		if (p_problem[planet][i]!=""){
			p_timer[planet][i]-=count_change;
			if (p_timer[planet][i]==-5){
				p_problem[planet][i]="";
				p_timer[planet][i]=-1;
			}
		}
	}
}

function add_new_problem(planet, problem, timer,star="none", other_data={}){
	var problem_added=false;
	if (star=="none"){
		for (i=1;i<array_length(p_problem[planet]);i++){
			if (p_problem[planet][i] ==""){
				p_problem[planet][i]= problem;
				p_problem_other_data[planet][i]=other_data;
				p_timer[planet][i] = timer;
				problem_added=i;
				break;
			}
		}
	} else {
		with (star){
			problem_added =  add_new_problem(planet, problem, timer,"none",other_data);
		}
	}
	return 	problem_added;
}

function new_star_event_marker(colour){
    var bob=instance_create(x+16,y-24,obj_star_event);
    bob.image_alpha=1;
    bob.image_speed=1;
    bob.color=colour;
}

function is_dead_star(star="none"){
	var dead_star=true;
	if (star=="none"){
		for (i=1;i<=planets;i++){
			if (p_type[i] !="dead"){
				dead_star=false;
				break;
			}
		}
	} else {
		with (star){
			dead_star = is_dead_star();
		}
	}
	return dead_star;
}

//function scr_get_player_fleets() {
//	var player_fleets = [];
//	with(obj_p_fleet){
//		array_push(player_fleets,id);
//	}
//	return player_fleets;
//}

function controller_standard_draw(){
 // if (instance_exists(obj_turn_end)) then exit;

    try{
        script_execute(scr_ui_manage,0,0,0,0,0);
    } catch(_exception){
        show_debug_message(_exception.message);
        manage = 0;
        menu = 0;

    }
    try{
        script_execute(scr_ui_advisors,0,0,0,0,0);
    } catch(_exception){
        show_debug_message(_exception.message);
        manage = 0;
        menu = 0;   
    }
    try{
        script_execute(scr_ui_diplomacy,0,0,0,0,0);
    } catch(_exception){
        show_debug_message(_exception.message);
        manage = 0;
        menu = 0;   
    }
    try{
        script_execute(scr_ui_settings,0,0,0,0,0);
    } catch(_exception){
        show_debug_message(_exception.message);
        manage = 0;
        menu = 0;   
    }
    var xx =__view_get( e__VW.XView, 0 );
    var yy =__view_get( e__VW.YView, 0 );
    // Main UI
    if (zoomed==0) and (zui==0){
        draw_sprite(spr_new_ui,0,xx+0,yy+0);
        draw_set_color(c_white);
        // Buttons here
        draw_sprite(spr_ui_but_4,0,xx+1374,yy+8);
        draw_sprite(spr_ui_but_4,0,xx+1484,yy+8);

        menu_buttons.chapter_manage.draw(xx+34,yy+838+y_slide, "Chapter Management",1,1,145)
        menu_buttons.chapter_settings.draw(xx+179,yy+838+y_slide, "Chapter Settings",1,1,145)
        menu_buttons.apoth.draw(xx+357,yy+838+y_slide, "Apothecarium")
        menu_buttons.reclu.draw(xx+473,yy+838+y_slide, "Reclusium")
        menu_buttons.lib.draw(xx+590,yy+838+y_slide, "Librarium")
        menu_buttons.arm.draw(xx+706,yy+838+y_slide, "Armamentarium")
        menu_buttons.recruit.draw(xx+822,yy+838+y_slide, "Recruitment")
        menu_buttons.fleet.draw(xx+938,yy+838+y_slide, "Fleet")
        menu_buttons .diplo.draw(xx+1130,yy+838+y_slide, "Diplomacy",1,1,145)
        menu_buttons .event.draw(xx+1275,yy+838+y_slide, "Event Log",1,1,145)
        menu_buttons .end_turn.draw(xx+1420,yy+838+y_slide, "End Turn",1,1,145);
        
        // Highlight here
        draw_set_blend_mode(bm_add);
        draw_set_alpha(h_options*2);
        if (h_options>0) then draw_sprite(spr_ui_hov_4,0,xx+1374,yy+8+y_slide);
        draw_set_alpha(h_menu*2);
        if (h_menu>0) then draw_sprite(spr_ui_hov_4,0,xx+1484,yy+8+y_slide);
        draw_set_blend_mode(bm_normal);
        draw_set_alpha(1);
        
        // Text here
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_set_font(fnt_cul_18);
        
        draw_text(xx+1427,yy+14,string_hash_to_newline("Help"));
        draw_text(xx+1537,yy+14,string_hash_to_newline("Menu"));
        
        if (y_slide>0) then draw_set_alpha((100-(y_slide*2))/100);
        
        draw_set_alpha(1);
        draw_sprite(spr_new_banner,0,xx+1439+new_banner_x,yy+62);
        draw_sprite(spr_new_ui_cover,0,xx+0,yy+(900-17));
        // Handles custom chapters
        if (string_count("custom",obj_ini.icon_name)>0){
            var cusl=string_replace(obj_ini.icon_name,"custom","");
            cusl=real(cusl);
            if (obj_cuicons.spr_custom[cusl]>0) and (obj_cuicons.spr_custom_icon[cusl]!=-1){
                draw_sprite_stretched(obj_cuicons.spr_custom_icon[cusl],0,xx+1451+new_banner_x,yy+73,141,141);
            }
        }
        // Handles icon for normal chapters
        if (string_count("custom",obj_ini.icon_name)==0){
            var icon_sprite=spr_icon,icc=obj_ini.icon;
            if (icc<=20) then scr_image("creation",icc,xx+1451+new_banner_x,yy+73,141,141);
            if (icc>20){
                icon_sprite=spr_icon_chapters;
                icc-=19;
                draw_sprite(icon_sprite,icc,xx+1451+new_banner_x,yy+73);
            }
        }
        
        draw_set_color(38144);
        draw_set_font(fnt_menu);
        draw_set_halign(fa_center);
        // Draws the sector name
        draw_text(xx+775,yy+17,string_hash_to_newline("Sector "+string(obj_ini.sector_name)));
        draw_text(xx+775.5,yy+17.5,string_hash_to_newline("Sector "+string(obj_ini.sector_name)));
        
        // Checks if you are penitent
        if (obj_controller.faction_status[eFACTION.Imperium]!="War"){
            if (penitent_max==0){
                draw_text(xx+998,yy+17,string_hash_to_newline("Loyal"));
                draw_text(xx+998,yy+17.5,string_hash_to_newline("Loyal"));
            }
            if (penitent_max>0){
                var endb=0,endb2="";
                endb=min(0,(((penitent_turn+1)*(penitent_turn+1))-120)*-1);
                if (endb<0) then endb2=" "+string(endb);
                draw_set_color(c_red);
                draw_text(xx+998,yy+17,string_hash_to_newline(string(min(100,floor((penitent_current/penitent_max)*100)))+"% Penitent"));
                draw_text(xx+998,yy+17.5,string_hash_to_newline(string(min(100,floor((penitent_current/penitent_max)*100)))+"% Penitent"));
                draw_set_color(38144);
                // TODO Need a tooltip for here to display the actual amounts
            }
        }
        // Sets you to renegade
        if (obj_controller.faction_status[eFACTION.Imperium]=="War"){
            draw_set_color(255);
            draw_text(xx+998,yy+17,string_hash_to_newline("Renegade"));
            draw_text(xx+998,yy+17.5,string_hash_to_newline("Renegade"));
            draw_set_color(38144);
        }
        // Checks if the chapter name is less than 140 chars, adjusts chapter_master_name_width accordingly
        var chapter_master_name_width=1;
        for(var i=0; i<10; i++){
            if ((string_width(string_hash_to_newline(string(global.chapter_name)))*chapter_master_name_width)>140) then chapter_master_name_width-=0.1;
        }

        draw_text_transformed(xx+1520+new_banner_x,yy+208,string_hash_to_newline(string(global.chapter_name)),chapter_master_name_width,1,0);
        draw_text_transformed(xx+1520.5+new_banner_x,yy+208.5,string_hash_to_newline(string(global.chapter_name)),chapter_master_name_width,1,0);
        // Shows the date to be displayed
        var yf="";
        if (year_fraction<10) then yf="00"+string(year_fraction);
        if (year_fraction>=10) and (year_fraction<100) then yf="0"+string(year_fraction);
        if (year_fraction>=100) then yf=string(year_fraction);
        draw_text(xx+1520+new_banner_x,yy+228,string_hash_to_newline(string(check_number)+" "+string(yf)+" "+string(year)+".M"+string(millenium)));
        // Shows the income on the menu
        var inc="";
        if (income_last>0) then inc="+"+string(round(income_last));
        if (income_last<0) then inc=string(round(income_last));
        draw_set_font(fnt_40k_14);
        draw_set_halign(fa_left);
        // Draws the requisition amount
        draw_sprite(spr_new_resource,0,xx+14,yy+16);
        draw_set_color(16291875);
        draw_text(xx+36,yy+16,string_hash_to_newline(string(floor(requisition))+string(inc)));
        draw_text(xx+36.5,yy+16.5,string_hash_to_newline(string(floor(requisition))+string(inc)));
        // Draws forge points
        draw_sprite_ext(spr_forge_points_icon, 0, xx+160, yy+15, 0.3, 0.3, 0, c_white, 1)
        draw_set_color(#af5a00)
        draw_text(xx+180,yy+16, string(forge_points));
        draw_text(xx+180.5,yy+16.5, string(forge_points));
        // Draws the current loyalty
        draw_sprite(spr_new_resource,1,xx+267,yy+17);
        draw_set_color(1164001);
        draw_text(xx+290,yy+16,string_hash_to_newline(string(loyalty)));
        draw_text(xx+290.5,yy+16.5,string_hash_to_newline(string(loyalty)));
        // Draws the current gene seed
        draw_sprite(spr_new_resource,2,xx+355,yy+17);
        draw_set_color(c_red);
        draw_text(xx+370,yy+16,string_hash_to_newline(string(gene_seed)));
        draw_text(xx+370.5,yy+16.5,string_hash_to_newline(string(gene_seed)));
        // Draws the current marines in your command
        draw_sprite(spr_new_resource,3,xx+475-10,yy+17);
        draw_set_color(16291875);
        draw_text(xx+495-10,yy+16,string_hash_to_newline(string(marines)+"/"+string(command)));
        draw_text(xx+495.5-10,yy+16.5,string_hash_to_newline(string(marines)+"/"+string(command)));

        if (menu==0){
            location_viewer.draw();
        }
    }

    draw_set_font(fnt_40k_14b);
    draw_set_color(c_red);
    draw_set_halign(fa_left);
    draw_set_alpha(1);
    // Sets up debut mode
    if (global.cheat_debug == true){
        draw_text((__view_get((0 << 0), 0) + 1124), (__view_get((1 << 0), 0) + 7), string_hash_to_newline("DEBUG MODE"));
    }

    script_execute(scr_ui_popup,0,0,0,0,0);
    
}