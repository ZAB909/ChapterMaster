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

function NSystemSearchHelpers() {
	static default_allies = [
		eFACTION.Player,
		eFACTION.Imperium,
		eFACTION.Mechanicus,
		eFACTION.Inquisition,
		eFACTION.Ecclesiarchy
	]
}
NSystemSearchHelpers()

function scr_star_has_planet_with_feature(star, feature){
	return scr_get_planet_with_feature(star, feature) != -1;
}

function scr_is_planet_owned_by_allies(star, planet_idx) {
	if planet_idx < 1 //1 because weird indexing starting at 1 in this game
		return false;
	return array_contains(NSystemSearchHelpers.default_allies, star.p_owner[planet_idx])
}

function scr_is_star_owned_by_allies(star) {
	return array_contains(NSystemSearchHelpers.default_allies, star.owner)
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
        if (disclude_elder && from.owner=eFACTION.Eldar){
        	i--;
        	instance_deactivate_object(from.id);
        	continue;
        }
        if (disclude_deads){
        	if (is_dead_star(from)){
	        	i--;
	        	instance_deactivate_object(from.id);
	        	continue;        		
        	}
        }
        with(from){
        	instance_deactivate_object(id);
        };
    }
    from=instance_nearest(origional_x,origional_y,obj_star);
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
		for (i=1;i<planets;i++){
			if (p_type[i] !="dead"){
				dead_star=false;
				break;
			}
		}
	} else {
		with (star){
			is_dead_star();
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