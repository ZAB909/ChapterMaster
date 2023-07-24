enum P_features {
			Sororitas_Cathedral,
			Necron_Tomb,
			Artifact, 
			STC_Fragment,
			Ancient_Ruins,
			Cave_Network,
			Recruiting_World, 
			Monastery,
			Warlord6,
			Warlord7,
			Warlord10,
			Special_Force,
			World_Eaters,
			Webway,
			Secret_Base,
			Starship,
			Succession_War,
			Mechanicus_Forge,
			Reclamation_pools,
			Capillary_Towers,
			Daemonic_Incursion
	};
	
enum base_type{
	Lair,
	Arsenal,
	Gene_Vault
}
	
	// function creates a new struct planet feature of a  specified type
function new_planet_feature(feature_type) constructor{
	f_type = feature_type;
	reveal_to_player = function(){
		if (player_hidden == 1){
			player_hidden = 0;
		}
	}
	switch(f_type){
		case P_features.Necron_Tomb:
		awake = 0;
		sealed = 0;
		player_hidden = 1
		planet_display = "Dormant Necron Tomb";
		break;
	case P_features.Secret_Base:
		base_type = 0;
		inquis_hidden =1;
		planet_display = "Hidden Secret Base";
		player_hidden = 0
		break;
	case P_features.Ancient_Ruins:
		recoverables=[];
		failed_exploration = 0;
		unrecovered_items = false;
		f_type =  P_features.Ancient_Ruins;
		exploration_complete= false;
		planet_display = "Unexplored Ancient Ruins";
		completion_level = 0;
		player_hidden = 1;	
		find_starship = function(){
			f_type = P_features.Starship;
			planet_display = "Ancient Starship";
			completion_level = 0;
			player_hidden = 0;
		}
		forces_defeated = function(){
			planet_display = "Failed Ruins Expidition"
			completion_level = 1;
			failed_exploration = 1;
			player_hidden = 0;
			exploration_complete= false;
		}
		recover_from_dead = function(){
			if (array_length(recoverables)>0){
					for (var item =0;item<array_length(recoverables);item++){
						var i_set = recoverables[item]
						scr_add_item(i_set[0],i_set[1])
					}
			}
			unrecovered_items=false;
			var _recoverables =[]
			recoverables =_recoverables 
		}
		determine_race = function(){
		        var dice=floor(random(100))+1;
		        if (dice<=9) then ruins_race=1;
		        if (dice>9) and (dice<=74) then ruins_race=2;
		        if (dice>74) and (dice<=83) then ruins_race=5;
		        if (dice>83) and (dice<=91) then ruins_race=6;
		        if (dice>91) then ruins_race=10;
		}
		ruins_explored = function(){
			planet_display = "Unexplored Ancient Ruins";
			exploration_complete= true;
		}
		break;
	case P_features.STC_Fragment:
		player_hidden = 1;
		Fragment_type =0;
		planet_display = "STC Fragment";
		break;
	case P_features.Cave_Network:
		player_hidden = 1;
		cave_depth =irandom(3);//allow_multiple levels of caves, option to go deeper
		planet_display = "Unexplored Cave Network";
		break;
	case P_features.Sororitas_Cathedral:
		player_hidden = 1;
		planet_display = "Sororitas Cathedral";
		break;
	case P_features.Artifact:
		player_hidden = 1;
		planet_display = "Artifact";
		break;
	case P_features.Warlord7:
		player_hidden = 1;
		planet_display= "Ork Warboss";
		break;
	case P_features.Monastery:
		planet_display="Fortress Monastary";
		player_hidden = 0
		break;
	case P_features.Recruiting_World:
		planet_display="Recruitment";
		player_hidden = 0
		break;
	default:
		player_hidden = 1;
		planet_display = 0
	}
}

// returns an array of all the positions that a certain planet feature occurs on th p_feature array of a planet
function search_planet_features(planet, search_feature){
	var feature_count = array_length(planet);
	var feature_positions = [];
	if (feature_count > 0){
	for (var fc = 0; fc < feature_count; fc++;){
		if (planet[fc].f_type == search_feature){
			array_push(feature_positions, fc);
		}
	}}
	return feature_positions;
}


// returns 1 if dearch feature is on at least one planet in system returns 0 is search feature is not found in system
function system_feature_bool(system, search_feature){
	var sys_bool = 0;
	for (var sys =1; sys<5; sys++;){
		sys_bool = planet_feature_bool(system[sys], search_feature)
		if (sys_bool==1){
		break;}
	}
	return sys_bool;
}


//returns 1 if feature found on given planet returns 0 if feature not found on planet
function planet_feature_bool(planet, search_feature){
	var feature_count = array_length(planet);
	var feature_exists = 0;
	if (feature_count > 0){
	for (var fc = 0; fc < feature_count; fc++;){
		if (planet[fc].f_type == search_feature){
			feature_exists = 1;
		}
		if (feature_exists == 1){break;}
	}}
	return feature_exists;	
}


//deletes all occurances of del_feature on planet
function delete_features(planet, del_feature){
	var delete_Array = search_planet_features(planet, del_feature)
	if (array_length(delete_Array) >0){
		for (var d=0;d<array_length(delete_Array);d++){
			array_delete(planet, delete_Array[d],delete_Array[d]+1)
		}
	}
}


// returns 1 if an awake necron tomb iin system
function awake_necron_Star(star){
		for(var i = 1; i <= star.planets; i++){
		if(awake_tomb_world(star.p_feature[i]) == 1)
			{
				return i;
			}
		}
		return 0
}


//returns 1 if awake tomb world on planet 0 if tombs on planet but not awake and 2 if no tombs on planet
function awake_tomb_world(planet){
	var awake_tomb = 0;
	 var tombs = search_planet_features(planet, P_features.Necron_Tomb);
	 if (array_length(tombs)>0){
		 for (var tomb =0;tomb<array_length(tombs);tomb++;){
			 if (planet[tombs[tomb]].awake = 1){
				awake_tomb = 1;
			 }
			 if (awake_tomb = 1){break;}
		 }
		 return awake_tomb;
	 }
	 return 2;
}


//selas a tomb world and switche off awake so will no longer spawn necrons or necron fleets
function seal_tomb_world(planet){
	var awake_tomb = 0;
	 var tombs = search_planet_features(planet, search_feature);
	 if (array_length(tombs)>0){
		 for (var tomb =0;tomb<array_length(tombs);tomb++;){
			 if (planet[tombs[tomb]].awake == 1){
				awake_tomb = 1;
				planet[tombs[tomb]].awake = 0;
				planet[tombs[tomb]].sealed = 1;
			 }
			 if (awake_tomb = 1){break;}
		 }
	 }
}


//awakens a tomb world so necrons and necron fleets will spawn
function awaken_tomb_world(planet){
	var awake_tomb = 0;
	 var tombs = search_planet_features(planet, search_feature);
	 if (array_length(tombs)>0){
		 for (var tomb =0;tomb<array_length(tombs);tomb++;){
			 if (planet[tombs[tomb]].awake == 0){
				awake_tomb = 1;
				planet[tombs[tomb]].awake = 1;
			 }
			 if (awake_tomb = 1){break;}
		 }
		 
	 }
}


// creates alerts for discovering features on a planet
function scr_planetary_feature(planet_num) {
	var plan_feat_count = array_length(p_feature[planet_num]);
	//need to iterate over features instead of just looking at first
	for (var f= 0; f < plan_feat_count;f++;){
		var feat = p_feature[planet_num][f];
		if (feat.player_hidden ==1){
			feat.player_hidden =0;
			switch (feat.f_type){
				case P_features.Sororitas_Cathedral:
					if (obj_controller.known[5]=0) then obj_controller.known[5]=1;
				    var lop="Sororitas Cathedral discovered on "+string(name)+" "+scr_roman(planet_num)+".";debugl(lop);
				    scr_alert("green","feature",lop,x,y);scr_event_log("",lop);
				    if (p_heresy[planet_num]>10) then p_heresy[planet_num]-=10;
				    p_sisters[planet_num]=choose(2,2,3);goo=1;
					break;
				case P_features.Necron_Tomb:
				    var lop="Necron Tomb discovered on "+string(name)+" "+scr_roman(planet_num)+"."debugl(lop);
				    scr_alert("red","feature",lop,x,y);scr_event_log("red",lop);
					break;
				case P_features.Artifact:
					var lop="Artifact discovered on "+string(name)+" "+scr_roman(planet_num)+"."debugl(lop);
					scr_alert("green","feature",lop,x,y);scr_event_log("",lop);
					break;
				case P_features.STC_Fragment:
					var lop="STC Fragment located on "+string(name)+" "+scr_roman(planet_num)+"."debugl(lop);
					 scr_alert("green","feature",lop,x,y);scr_event_log("",lop);
					 break;
				case P_features.Ancient_Ruins:
					var lop="Ancient Ruins discovered on "+string(name)+" "+scr_roman(planet_num)+"."debugl(lop);
					scr_alert("green","feature",lop,x,y);scr_event_log("",lop);
					break;
				case P_features.Cave_Network:
					var lop="Extensive Cave Network discovered on "+string(name)+" "+scr_roman(planet_num)+"."debugl(lop);
			        scr_alert("green","feature",lop,x,y);scr_event_log("",lop);
					break;
				case P_features.Warlord7:
				    var lop="Ork Warboss discovered on "+string(name)+" "+scr_roman(planet_num)+"."debugl(lop);
				    scr_alert("red","feature",lop,x,y);scr_event_log("red",lop);
					break;
		
			
			}
		}
	}
}
		