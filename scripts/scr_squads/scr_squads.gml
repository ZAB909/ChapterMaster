
/* okay so basically this function loops through a given company and attempts to sort the units in the company not in a squad already into 
the requested squad type , if the squad is not possible it will  not be made*/
// squad_type: the type of squad to be created as a string to access the correct key in obj_ini.squad_types
// company : the company you wish to create the squad in (int)
//squad_loadout: true if you want to use the squad loadout sorting algorithem to re-equip the squad in accordance with the squad type loadout


function create_squad(squad_type, company, squad_loadout = true, squad_index=false){
	var squad_unit_types, fulfilled,unit, squad;
	var squad_count = array_length(obj_ini.squads);
	var fill_squad =  obj_ini.squad_types[$ squad_type];			//grab all the squad struct info from the squad_types struct
	var squad_fulfilment = {};		
	squad_unit_types = struct_get_names(fill_squad);		//find out what type of units squad consists of
	var unit_type_count = array_length(squad_unit_types);		
	for (var i = 0;i < unit_type_count;i++){
		if (squad_unit_types[i] == "display_name"){
			array_delete(squad_unit_types, i, 1);
			unit_type_count--;
			i--;
			continue;
		}	
		squad_fulfilment[$ squad_unit_types[i]] =0;	//create a fulfilment structure to log members of squad
	}
	squad = new unit_squad(squad_type, company);
	squad.base_company = company;
	var sergeant_found = false;
	var sgt_types = [obj_ini.role[100][18], obj_ini.role[100][19]]

	//if squad has sergeants in find out if there are any available sergeants
	for (var s = 0; s< 2;s++){
		if (struct_exists(squad_fulfilment ,sgt_types[s])){
			sergeant_found = false;
			for (i = 0; i < array_length(obj_ini.TTRPG[company]);i++){
				if(!is_struct(obj_ini.TTRPG[company][i])){obj_ini.TTRPG[company][i]= new TTRPG_stats("chapter", company,i,"blank");}
				unit = obj_ini.TTRPG[company][i];
				if ((obj_ini.name[company][i] =="") or (unit.base_group=="none"))then continue;
				if (unit.squad== "none"){
					if (unit.role() == sgt_types[s]){
						squad_fulfilment[$ sgt_types[s]] += 1;
						squad.add_member(unit.company, unit.marine_number);
						sergeant_found = true;// free sergeant is found mark it so a marine dose not get promoted
						break;
					}
				}
			}
		}
	}
	for (i = 0; i < array_length( obj_ini.TTRPG[company]);i++){							//fill squad roles
		if(!is_struct(obj_ini.TTRPG[company][i])){obj_ini.TTRPG[company][i]= new TTRPG_stats("chapter", company,i,"blank");}
		unit = obj_ini.TTRPG[company][i];
		if ((obj_ini.name[company][i] =="") or (unit.base_group=="none")) then continue;
		if (unit.squad== "none") and (array_contains(squad_unit_types, unit.role())){
			//if no sergeant found add one marine to standard marine selection so that a marine can be promoted
			if ((struct_exists(squad_fulfilment ,obj_ini.role[100][18])) or (struct_exists(squad_fulfilment ,obj_ini.role[100][19]))) and (sergeant_found == false){
				if (squad_fulfilment[$ unit.role()]< (fill_squad[$ unit.role()][$ "max"] + 1)){
					squad_fulfilment[$ unit.role()]++;
					squad.add_member(unit.company, unit.marine_number);
				}
			}//if sergeants not required
			else if (squad_fulfilment[$ unit.role()]< fill_squad[$ unit.role()][$ "max"]){
				squad_fulfilment[$ unit.role()]++;
				squad.add_member(unit.company, unit.marine_number);
			}
		}
	}
	//if a new sergeant is needed find the marine with the highest experience in the squad 
	//(which if everything works right should be a marine with the old_guard, seasoned, or ancient trait)
	/*and ((squad_fulfilment[$ obj_ini.role[100][8]] > 4)or (squad_fulfilment[$ obj_ini.role[100][10]] > 4) or (squad_fulfilment[$ obj_ini.role[100][9]] > 4)or (squad_fulfilment[$ obj_ini.role[100][3]] > 4) )*/
	for (var s = 0; s< 2;s++){
		if (struct_exists(squad_fulfilment ,sgt_types[s])) and (!sergeant_found){
			var highest_exp = 0;
			var exp_unit;
			for (i = 0; i < array_length(squad.members);i++){
				if (i==0){
					exp_unit = obj_ini.TTRPG[squad.members[0][0], squad.members[0][1]];
					highest_exp = obj_ini.TTRPG[squad.members[0][0], squad.members[0][1]].experience();
					continue;
				}
				unit = obj_ini.TTRPG[squad.members[i][0], squad.members[i][1]];
				if (unit.experience() > highest_exp){
					highest_exp = unit.experience();
					exp_unit = unit;
				};
			}
			squad_fulfilment[$ sgt_types[s]]++;
		}
	}
	//evaluate if the minimum unit type requirements have been met to create a new squad
	fulfilled = true;
	for (i = 0;i < array_length(squad_unit_types);i++){
		if (squad_fulfilment[$ squad_unit_types[i]] < fill_squad[$ squad_unit_types[i]][$ "min"]){
			fulfilled = false;
			break
		}
	}
	if (fulfilled){
		for (var s = 0; s< 2;s++){
			if (struct_exists(squad_fulfilment ,sgt_types[s])) and (sergeant_found == false){
				exp_unit.update_role(sgt_types[s]); //if squad is viable promote marine to sergeant
				if (irandom(1) == 0){
					exp_unit.add_trait("lead_example");
				}
			}
		}			
		//update units squad marker
		squad.squad_fulfilment = squad_fulfilment;
		for (i = 0; i < array_length(squad.members);i++){
			unit = obj_ini.TTRPG[squad.members[i][0], squad.members[i][1]];
			if (!squad_index){
				unit.squad = squad_count;
			} else {
				unit.squad = squad_index;
			}
		}
		if (!squad_index){
			array_push(obj_ini.squads, squad); //push squad to squads array thus creating squad
		} else{
			obj_ini.squads[squad_index] = squad;
		}

		// heres where the whole thing gets annoying
		/*basically each equipment slot is looped through and inside each loop each marine is looped through in a random order to ensure 
			that each squad looks different and that each marine has a range of optional and required equipment
			required equipmetn is things like boltguns and combat knives in a tactical squad
			optional equipment is stuff like lascannons and specialist equipment in a tactical squad or plasma pistols in an assualt squad
			in future i'd like to tailer these to marine skill sets e.g the marines with the best ranged stats get given the best ranged equipment	
		*/
		if (squad_loadout){
			var required_load, unit_type, load_out_name, load_out_areas, load_out_slot,load_item, optional_load, item_to_add;
			for (i = 0;i < array_length(squad_unit_types);i++){
				unit_type = squad_unit_types[i];
				required_load = "none";
				optional_load = "none";
				 if (struct_exists(fill_squad[$ unit_type],"loadout")){						//find out if the unit type for the squad has optional equipment thresholds
					if (struct_exists(fill_squad[$ unit_type][$ "loadout"],"option")){
						if (optional_load == "none"){
						  	optional_load = DeepCloneStruct(fill_squad[$ unit_type][$ "loadout"][$ "option"]);			//create a fulfillment object for optional loadouts

						  	load_out_areas = struct_get_names(fill_squad[$ unit_type][$ "loadout"][$ "option"]);

						  	for (load_out_name = 0; load_out_name < array_length(load_out_areas);load_out_name++){
								load_out_slot = load_out_areas[load_out_name];
								for (load_item = 0; load_item < array_length(optional_load[$ load_out_slot]);load_item++){									
						  			array_push(optional_load[$ load_out_slot][load_item],0);
						  		}
						  	}
						}
					}					 	
					 
					//if there are required loadout items
					if (struct_exists(fill_squad[$ unit_type][$ "loadout"],"required")){	//find out if the unit type for the squad has required  equipment thresholds
						if (required_load == "none"){
						  	required_load = DeepCloneStruct(fill_squad[$ unit_type][$ "loadout"][$ "required"]);
						  	load_out_areas = struct_get_names(fill_squad[$ unit_type][$ "loadout"][$ "required"]);
							for (load_out_name = 0; load_out_name < array_length(load_out_areas);load_out_name++){
								load_out_slot = load_out_areas[load_out_name];
								if (is_string(required_load[$ load_out_slot][1])){
									if (required_load[$ load_out_slot][1] == "max"){
										required_load[$ load_out_slot][1] = squad_fulfilment[$ unit_type];
									}
								}
								array_push(required_load[$ load_out_slot],0);
							}
						}
					}											
					var copy_squad;
					var new_copy_unit;
					for (load_out_name = 0; load_out_name < array_length(load_out_areas);load_out_name++){
						copy_squad = [];
						load_out_slot = load_out_areas[load_out_name];
						array_copy(copy_squad,0,squad.members,0, array_length(squad.members)); //create a copy of the squad members
						while (array_length(copy_squad) > 0){
							new_copy_unit = irandom(array_length(copy_squad)-1);  //loop through the squad members randomly so that each squad has different marine loadouts
							unit = obj_ini.TTRPG[copy_squad[new_copy_unit][0], copy_squad[new_copy_unit][1]];
							if (unit.role() == unit_type){
								if (struct_exists(fill_squad[$ unit_type],"loadout")){		
									if (required_load != "none"){
										if (required_load[$ load_out_slot][2] <required_load[$ load_out_slot][1]){		//if the required amount of equipment is not in the squad already equip this marine with equipment
											item_to_add = required_load[$ load_out_slot][0]
											var required_load_set = {};
											required_load_set[$ load_out_slot] = item_to_add;
											unit.alter_equipment(required_load_set,false,false);
											required_load[$ load_out_slot][2]++;
											array_delete(copy_squad, new_copy_unit,1);
											continue;
									  	} //if all required equipment is included in the squad start adding optional equipment
									}
									if (struct_exists(fill_squad[$ unit_type][$ "loadout"],"option")){
										if (optional_load != "none"){
							  				if (struct_exists(optional_load, load_out_slot)){
							  					//this basically ensures the optional squad items are randomly selected and allocated in order to make squads more variable
												
							  					for (load_item = 0; load_item < array_length(optional_load[$ load_out_slot]);load_item++){
								  					if (optional_load[$ load_out_slot][load_item][2] <optional_load[$ load_out_slot][load_item][1]){

								  						if (is_array(optional_load[$ load_out_slot][load_item][0])){ //if the array items are varibale e.g a struct
								  							item_to_add = optional_load[$ load_out_slot][load_item][0][irandom(array_length(optional_load[$ load_out_slot][load_item][0])-1)]
								  						} else {
								  							item_to_add = optional_load[$ load_out_slot][load_item][0];
								  						}

								  						// this ensures a marine never gets overloaded with an overly bulky weapon loadout
								  						if (load_out_slot == "wep1") {
								  							obj_controller.marine_armour[0] = unit.armour();
								  							scr_weapon(item_to_add,unit.weapon_two(),true,0,false,"","description");
								  							if (obj_controller.ui_melee_penalty>0) or (obj_controller.ui_ranged_penalty>0){
								  								continue;
								  							}
															scr_weapon(unit.weapon_two(),item_to_add,true,0,false,"","description");
								  							if (obj_controller.ui_melee_penalty>0) or (obj_controller.ui_ranged_penalty>0){
								  								continue;								  								
								  							}
								  						} else if (load_out_slot == "wep2"){
								  							obj_controller.marine_armour[0] = unit.armour();
								  							scr_weapon(unit.weapon_one(),item_to_add,true,0,false,"","description");
								  							if (obj_controller.ui_melee_penalty>0) or (obj_controller.ui_ranged_penalty>0){
								  								continue;
								  							}								  							
								  							scr_weapon(item_to_add,unit.weapon_one(),true,0,false,"","description");
								  							if (obj_controller.ui_melee_penalty>0) or (obj_controller.ui_ranged_penalty>0){
								  								continue;
								  							}
								  						}
														var opt_load_out = {};
														opt_load_out[$load_out_slot] = item_to_add;
														unit.alter_equipment(opt_load_out,false,false);
												  		optional_load[$ load_out_slot][load_item][2]++;
												  		break;
											  		}
										  		}
							  				}
										}
									}			  												  															
								}
							}
							array_delete(copy_squad, new_copy_unit,1);
						}
					}
					 
				}
			}
		}
	}
}


// constructor for new squad
function unit_squad(squad_type = undefined, company = undefined) constructor{
	type = squad_type;
	members = [];
	squad_fulfilment ={};
	base_company = company;
	life_members=0;
	nickname="";
	assignment="none";
	//nickname = scr_squad_names();

	// for creating a new sergeant from existing squad members
	static new_sergeant = function(veteran=false){
		var exp_unit;
		var unit;
		var highest_exp = 0;
		var member_length = array_length(members);
		for (i = 0; i < member_length;i++){
			unit = obj_ini.TTRPG[members[i][0]][members[i][1]];
			if (unit.name() == ""){
				array_delete(members, i, 1);
				member_length--;
				i--;
				continue;
			}			
			if (unit.experience() > highest_exp){
				highest_exp = unit.experience();
				exp_unit = unit;
			};
		}
		if (array_length(members) > 0) and (is_struct(exp_unit)){
			if (exp_unit.name() != ""){
				var new_role;
				if (veteran == true){
					new_role = obj_ini.role[100][19];
				} else{
					new_role= obj_ini.role[100][18];
				}
				exp_unit.update_role(new_role);
				if (irandom(1) == 0){
					exp_unit.add_trait("lead_example");
				}
			}
		}
	}
	static kill_members = function(){
		for (var i=0;i<array_length(members);i++){
			scr_kill_unit(members[i][0],members[i][1]);
		}
		members = [];
	}

	/*checks the status of squad so it can be either restocked or 
		deleted if there are no longer enough members ot make a squad*/
	static update_fulfilment = function(){
		var unit;
		squad_fulfilment ={};
		var fill_squad =  obj_ini.squad_types[$ type];			//grab all the squad struct info from the squad_types struct
		var squad_fulfilment = {};
		var squad_unit_types = struct_get_names(fill_squad);		//find out what type of units squad consists of
		var unit_type_count = array_length(squad_unit_types);		
		for (var i = 0;i < unit_type_count;i++){
			if (squad_unit_types[i] == "display_name"){
				array_delete(squad_unit_types, i, 1);
				unit_type_count--;
				i--;
				continue;				
			}
			squad_fulfilment[$ squad_unit_types[i]] =0;	//create a fulfilment structure to log members of squad
		}
		var member_length = array_length(members);
		for (var i=0;i<member_length;i++){
			//checks squad member is still valid
			unit = obj_ini.TTRPG[members[i][0]][members[i][1]];
			if (unit.name() == ""){
				array_delete(members, i, 1);
				member_length--;
				i--;
				continue;
			}
			if (struct_exists(squad_fulfilment, unit.role())){
				squad_fulfilment[$ unit.role()]++;
			} else {
				squad_fulfilment[$ unit.role()] = 1;
			}
		}
		fulfilled = true;
		required = {};
		space = {};
		has_space = false;
		for (i = 0;i < array_length(squad_unit_types);i++){
			if (squad_fulfilment[$ squad_unit_types[i]] < fill_squad[$ squad_unit_types[i]][$ "max"]){
				space[$ squad_unit_types[i]] = fill_squad[$ squad_unit_types[i]][$ "max"] - squad_fulfilment[$ squad_unit_types[i]];
			}
			has_space = true
			if (squad_fulfilment[$ squad_unit_types[i]] < fill_squad[$ squad_unit_types[i]][$ "min"]){
				fulfilled = false;
				required[$ squad_unit_types[i]] = fill_squad[$ squad_unit_types[i]][$ "min"] - squad_fulfilment[$ squad_unit_types[i]];
			}
		}		
	}
	static add_member = function(comp, unit_number){
		array_push(members, [comp, unit_number]);
		life_members++;
	}
	// for saving squads
	static jsonify = function(){
		var copy_struct = self; //grab marine structure
		var new_struct = {};
		var copy_part;
		var names = variable_struct_get_names(copy_struct); // get all keys within structure
		for (var name = 0; name < array_length(names); name++) { //loop through keys to find which ones are methods as they can't be saved as a json string
			if (!is_method(copy_struct[$ names[name]])){
				copy_part = DeepCloneStruct(copy_struct[$ names[name]])
				variable_struct_set(new_struct, names[name],copy_part); //if key value is not a method add to copy structure
			}
		}
		return json_stringify(new_struct);
	}

	//function for loading in squad save data
	static load_json_data = function(data){	
		 var names = variable_struct_get_names(data);
		 for (var i = 0; i < array_length(names); i++) {
            variable_struct_set(self, names[i], variable_struct_get(data, names[i]))
        }
	}

	static squad_loci = function(){
		var member_length = array_length(members);
		var locations = [];
		var system = ""
		var unit_loc;
		var same_system = true;
		var same_loc_type = true;
		var loc_type = false;
		var same_loc_id = false;
		var loc_id;
		var in_orbit=false;
		var planet_side=false;
		var exact_loc = false;
		for (i = 0; i < member_length;i++){
			unit = obj_ini.TTRPG[members[i][0]][members[i][1]];
			if (unit.name() == ""){
				array_delete(members, i, 1);
				member_length--;
				i--;
				continue;
			}
			unit_loc = unit.marine_location();		
			if (system==""){
				system = unit_loc[2];
				loc_type=unit_loc[0];
				loc_id = unit_loc[1];
			}
			if (system != unit_loc[2]){
				same_system = false;
			}
			if (same_system){
				if (loc_type!=unit_loc[0]){
					same_loc_type=false
				}
			}
			if (same_loc_type && same_system){
				if (loc_id == unit_loc[1]){
					exact_loc=true;
				} else{
					exact_loc=false;
					if (loc_type==location_types.ship){
						in_orbit=true;
					} else if (loc_type==location_types.planet){
						planet_side=true;
					}
				}
			}
		}
		var final_loc_status=""
		if (!same_system){
			final_loc_status="Scattered"
		} else if (same_loc_type){
			if (loc_type==location_types.ship){
				if (exact_loc){
					final_loc_status=$"aboard {obj_ini.ship[loc_id]}"
				} else if (in_orbit){
					final_loc_status=$"various ships orbiting {system}"
				}
			} else if (loc_type==location_types.planet){
				if (exact_loc){
					final_loc_status=$"{system} {scr_roman_numerals()[loc_id-1]}"
				}else if (planet_side){
					final_loc_status=$"various planets in {system}"
				}
			}
		} else {
			final_loc_status=$"system {system}"
		}
		return {text:final_loc_status, system:system, same_system:same_system, exact_loc:exact_loc, planet_side:planet_side, in_orbit:in_orbit};

	}
	static determine_leader = function(){
		var member_length = array_length(members);
		var hierarchy = role_hierarchy();
		var leader_hier_pos=array_length(hierarchy);
		var leader="none", unit;
		var highest_exp = 0;
		for (var i=0;i<member_length;i++){
			unit = obj_ini.TTRPG[members[i][0]][members[i][1]]
			if (unit.name() == ""){
				array_delete(members, i, 1);
				member_length--;
				i--;
				continue;
			} else {
				if (leader=="none"){
					leader = [unit.company, unit.marine_number];
					for (var r=0;r<array_length(hierarchy);r++){
						if (hierarchy[r]==unit.role()){
							leader_hier_pos=r;
							break;
						}
					}
				}else if (hierarchy[leader_hier_pos]==unit.role()){
					if (obj_ini.TTRPG[leader[0]][leader[1]].experience()<unit.experience()){
						leader=[unit.company, unit.marine_number];
					}
				}else{
					for (var r=0;r<leader_hier_pos;r++){
						if (hierarchy[r]==unit.role()){
							leader_hier_pos=r;
							leader=[unit.company, unit.marine_number];
							break;
						}
					}
				}
			}			
		}
		squad_leader=leader;
		return leader;
	}

	static set_location = function(loc, lid, wid){
		var member_length = array_length(members);
		var member_location;
		var system = "none";
		with (obj_star){
			if (name==loc){
				system=self;
				break;
			}
		}
		if 	(system == "none") then return "invalid system";
		for (var i=0;i<member_length;i++){
			unit = obj_ini.TTRPG[members[i][0]][members[i][1]]
			if (unit.name() == ""){
				array_delete(members, i, 1);
				member_length--;
				i--;
				continue;
			} else {
				member_location=unit.marine_location();
				if (wid>0 && loc==member_location[2]){
					if (member_location[0]==location_types.ship){
						unit.unload(wid, system)
					} else if(member_location[0]==location_types.planet && member_location[1] != wid && member_location[2]==loc){
						unit.get_unit_size();
						system.p_player[member_location[1]]-=unit.size;
						system.p_player[wid]+=unit.size;
						unit.set_planet(wid);
					}
				} else {
					if (wid == 0 && lid>0){
						unit.load_marine(lid);
					}
				}
			}
		}	
	}

	static pdf_support_outcome = function(enemy_force, enemy_type){

	}
}


// creates the origional distribution of squads accross the chapter
// lots of room for customisation of different chapters here
function game_start_squads(){
	obj_ini.squads = [];
	var last_squad_count
	for (company=2;company < 10;company++){
		create_squad("command_squad", company);
		last_squad_count = array_length(obj_ini.squads);
		while (last_squad_count == array_length(obj_ini.squads)){ ///keep making tact squads for as long as there are enough tact marines
			if (global.chapter_name == "White Scars"){
				last_squad_count = (array_length(obj_ini.squads) + 1);
				if(last_squad_count%2 == 0){		
					create_squad("tactical_squad", company);
				}else{
					create_squad("bikers", company);
				}
			}else{
				last_squad_count = (array_length(obj_ini.squads) + 1);
				create_squad("tactical_squad", company);
			}
		}
		last_squad_count = array_length(obj_ini.squads);
		while (last_squad_count == array_length(obj_ini.squads)){ ///keep making tact squads for as long as there are enough tact marines
			last_squad_count = (array_length(obj_ini.squads) + 1);
			create_squad("devestator_squad", company);
		}		
		last_squad_count = array_length(obj_ini.squads);
		while (last_squad_count == array_length(obj_ini.squads)){
			last_squad_count = (array_length(obj_ini.squads) + 1);
			create_squad("assault_squad", company);
		}
	}
	company = 1;
	create_squad("command_squad", company);
	last_squad_count = array_length(obj_ini.squads);
	while (last_squad_count == array_length(obj_ini.squads)){
		last_squad_count = (array_length(obj_ini.squads) + 1);
		create_squad("terminator_squad", company);
	}	
	last_squad_count = array_length(obj_ini.squads);	
	while (last_squad_count == array_length(obj_ini.squads)){
		last_squad_count = (array_length(obj_ini.squads) + 1);
		create_squad("veteran_squad", company);
	}
	company = 10;
	create_squad("command_squad", company);
	last_squad_count = array_length(obj_ini.squads);
	while (last_squad_count == array_length(obj_ini.squads)){ ///keep making tact squads for as long as there are enough tact marines
		last_squad_count = (array_length(obj_ini.squads) + 1);
		if(last_squad_count%2 == 0){		
			create_squad("scout_squad", company);
		}else{
			create_squad("scout_sniper_squad", company);
		}
	}

	with (obj_ini){
		for (i=0;i<11;i++){
			scr_company_order(i)
		}
	}
}


function find_company_squads(company){
	var c_squads = [];
	for (var i=0;i<array_length(obj_ini.squads);i++){
		if (array_length(obj_ini.squads[i].members)>0 && obj_ini.squads[i].base_company == company){
			array_push(c_squads,i);
		}
	}
	return c_squads;
}

