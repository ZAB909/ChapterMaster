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

function star_by_name(search_name){
	with(obj_star){
		if (name = search_name){
			return self;
		}
	}
	return "none";
}


function get_largest_player_fleet(){

	var chosen_fleet = "none";
	if instance_exists(obj_p_fleet){
		with(obj_p_fleet){
			if (chosen_fleet=="none"){
				chosen_fleet=self;
				continue;
			}
			if (!(capital_number==0 && chosen_fleet.capital_number==0)){
				if (capital_number>chosen_fleet.capital_number){
					chosen_fleet = self;
				}
			} else if (!(frigate_number==0 && chosen_fleet.frigate_number==0)) {
				if (frigate_number>chosen_fleet.frigate_number){
					chosen_fleet = self;
				}
			}else if (!(escort_number==0 && chosen_fleet.escort_number==0)) {
				if (escort_number>chosen_fleet.escort_number){
					chosen_fleet = self;
				}
			}
		}
	}
	return chosen_fleet;
}

function load_unit_to_fleet(fleet, unit){
	var loaded = false;
	var all_ships = [];
	var i, ship_ident;
	with (fleet){
		for (i=1; i<=capital_number;i++){
			array_push(all_ships, capital_num[i]);
		}
		for (i=1; i<=frigate_number;i++){
			array_push(all_ships, frigate_num[i]);
		}
		for (i=1; i<=escort_number;i++){
			array_push(all_ships, escort_num[i]);
		}				
	}

	for (i=0;i<array_length(all_ships);i++){
		ship_ident = all_ships[i];
		  if (obj_ini.ship_capacity[ship_ident]>obj_ini.ship_carrying[ship_ident]){
		  	obj_ini.ship_carrying[ship_ident]+=unit.size;
		  	unit.planet_location=0;
		  	obj_ini.loc[unit.company][unit.marine_number]=obj_ini.ship_location[ship_ident];
		  	unit.ship_location=ship_ident;
		  	loaded=true;
		  	break
		  }
	}
	return loaded;
}	
//function scr_get_player_fleets() {
//	var player_fleets = [];
//	with(obj_p_fleet){
//		array_push(player_fleets,id);
//	}
//	return player_fleets;
//}