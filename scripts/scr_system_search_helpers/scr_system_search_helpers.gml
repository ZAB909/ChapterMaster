// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_get_planet_with_feature(star, feature){
	for(var i = 1; i <= star.planets; i++){
		if(string_count(feature,star.p_feature[i]) >= 1)
			{
				return i;
			}
		}
	return -1;
}

function scr_star_has_planet_with_feature(star, feature){
	return scr_get_planet_with_feature(star, feature) != -1;
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


//function scr_get_player_fleets() {
//	var player_fleets = [];
//	with(obj_p_fleet){
//		array_push(player_fleets,id);
//	}
//	return player_fleets;
//}