function scr_company_order(company) {

	// company : company number
	// This sorts and crunches the marine variables for the company
	var co=company;

	var i=-1,v=0;
	var temp_vrace, temp_vloc, temp_vrole, temp_vwep1, temp_vwep2, temp_vup, temp_vhp, temp_vchaos, temp_vpilots, temp_vlid, temp_vwid, unit;
	for (var i=0;i<500;i++){
	    temp_race[co][i]=0;
	    temp_loc[co][i]="";
	    temp_name[co][i]="";
	    temp_role[co][i]="";
	    temp_lid[co][i]=0;
	    temp_bio[co][i]=0;
	    temp_wid[co][i]=0;
	    temp_wep1[co][i]="";
	    temp_wep2[co][i]="";
	    temp_armour[co][i]="";
	    temp_gear[co][i]="";
	    temp_mobi[co][i]="";
	    temp_hp[co][i]=100;
	    temp_chaos[co][i]=0;
	    temp_experience[co][i]=0;
	    temp_age[co][i]=0;
	    temp_spe[co][i]="";
	    temp_god[co][i]=0;
		temp_struct[co][i]={};
	}


	/*takes a template of a role, required role number and if there are enough 
	of those units not in a squad creates a new squad of a given type*/
	function create_squad_from_squadless(squadless_and_squads,build_data,company){
		var squadless = squadless_and_squads[0];
		var empty_squads = squadless_and_squads[1];
		var role = build_data[1];
		var required_unit_count = build_data[2];
		var new_squad_type = build_data[0];
		var new_squad_index, role_number;
		if (struct_exists(squadless,role)){
			role_number = array_length(squadless[$ role]);
			while (role_number >= required_unit_count){
				new_squad_index=false;
				if (array_length(empty_squads)>0){
					new_squad_index = empty_squads[0];
					array_delete(empty_squads,0,1);
					create_squad(new_squad_type, company, false, new_squad_index);
				} else{
					create_squad(new_squad_type, company, false);
				}
				for (i=0;i<role_number;i++){
					unit = TTRPG[company,squadless[$ role][i]];
					if (unit.squad != "none"){
						array_delete(squadless[$ role], i ,1);
						i--;
						role_number--;
					}
				}
			}

		}
		return [squadless,empty_squads];
	}

	//stashes varibles for marine reordering
	function temp_marine_variables(co, unit_num ,v){
			var unit = TTRPG[co][unit_num];
			if (unit.squad != "none"){
				var squad_member;
				var found = false;
				for (var r=0;r<array_length(squads[unit.squad].members);r++){
					squad_member = squads[unit.squad].members[r];
					try{
						if (squad_member[0] == unit.company) and (squad_member[1] == unit.marine_number){
							squads[unit.squad].members[r] = [co,v];
							found = true;
							break;
						}
					} catch( _exception) {
						show_debug_message("{0}",_exception)
						show_debug_message("{0},{1}",squad_member,squads[unit.squad].members)
					}
				}
				if (!found){unit.squad = "none"}
			}
	        temp_race[co][v]=race[co][unit_num];
	        temp_loc[co][v]=loc[co][unit_num];
	        temp_name[co][v]=name[co][unit_num];
	        temp_role[co][v]=role[co][unit_num];
	        temp_lid[co][v]=lid[co][unit_num];
	        temp_wid[co][v]=wid[co][unit_num];
	        temp_wep1[co][v]=wep1[co][unit_num];
	        temp_wep2[co][v]=wep2[co][unit_num];
	        temp_armour[co][v]=armour[co][unit_num];
	        temp_gear[co][v]=gear[co][unit_num];
	        temp_hp[co][v]=hp[co][unit_num];
	        temp_chaos[co][v]=chaos[co][unit_num];
	        temp_experience[co][v]=experience[co][unit_num];
	        temp_age[co][v]=age[co][unit_num];
	        temp_mobi[co][v]=mobi[co][unit_num];
	        temp_spe[co][v]=spe[co][unit_num];
	        temp_god[co][v]=god[co][unit_num];
	        temp_bio[co][v]=bio[co][unit_num];
	        temp_struct[co][v]=jsonify_marine_struct(co,unit_num);
	}

	// the order that marines are displayed in the company view screen(this order is augmented by squads)
	var role_orders = role_hierarchy();

	var empty_squads=[]
	var role_shuffle_length = array_length(role_orders);
	var company_length = array_length(name[co]);
	var squadless={};
	// find units not in a squad
	for (i=0;i<company_length;i++){
		if (!is_struct(TTRPG[co][i])) then TTRPG[co][i] = new TTRPG_stats("chapter", co, i, "blank");
		unit = TTRPG[co][i];
		if (unit.squad=="none") and (unit.name()!=""){
			if (!struct_exists(squadless, unit.role())){
				squadless[$ unit.role()] = [i];
			} else {
				array_push(squadless[$ unit.role()],i);
			}
		}
	}

	//at this point check that all squads have the right types and numbers of units in them
	var squad, wanted_roles;
	for (i=0;i<array_length(squads);i++){
		if (squads[i].base_company != co){
			if (array_length(squads[i].members)==0){
				array_push(empty_squads,i);
			}
			continue;
		}
		squad = squads[i];
		squad.update_fulfilment();

		//squad has role spaces to fill
		if (squad.has_space){
			wanted_roles=struct_get_names(squad.space);

			/* this finds sqauds that are in need of members and checks ot see if there 
				are any squadless units in the chapter with
				the right role to fill the gap*/ 
			for (var r = 0;r < array_length(wanted_roles);r++){

				if (struct_exists(squadless,wanted_roles[r])){
					if (!squad.fulfilled){
						if (struct_exists(squad.required,wanted_roles[r])){
							while (array_length(squadless[$ wanted_roles[r]])>0) and (squad.required[$ wanted_roles[r]] > 0){
								array_push(squad.members,[company,squadless[$ wanted_roles[r]][0]]);
								TTRPG[co,squadless[$ wanted_roles[r]][0]].squad=i;
								array_delete(squadless[$ wanted_roles[r]],0,1);
								squad.required[$ wanted_roles[r]]--;
								squad.space[$ wanted_roles[r]]--;
							}
						}
					}
					if (struct_exists(squad.space,wanted_roles[r])){
						while (array_length(squadless[$ wanted_roles[r]])> 0) and (squad.space[$ wanted_roles[r]] > 0){
							array_push(squad.members,[company,squadless[$ wanted_roles[r]][0]]);
							TTRPG[co,squadless[$ wanted_roles[r]][0]].squad=i;
							array_delete(squadless[$ wanted_roles[r]],0,1);
							squad.space[$ wanted_roles[r]]--;					
						}
					}
				}
			}
			//if no new sergeants are found for squad someone gets promoted
			//find a new_sergeant 
			if (struct_exists(squad.required, role[100][18])){
				if (squad.required[$ role[100][18]] > 0){
					squad.new_sergeant();
					squad.required[$ role[100][18]]--;
				}
			}
			//find a new veteran sergeant 
			if (struct_exists(squad.required, role[100][19])){
				if (squad.required[$ role[100][19]] > 0){
					squad.new_sergeant(true);
					squad.required[$ role[100][19]]--;
				}
			}		
		}
	}

	var squadless_and_squad_spaces = [squadless,empty_squads];

	var squad_builder = [
		["tactical_squad",role[100][8],5],
		["devestator_squad",role[100][9],5],
		["veteran_squad",role[100][3],5],
		["terminator_squad",role[100][4],4],
		["assault_squad",role[100][10],5],
	]
	
	for (i=0;i<array_length(squad_builder);i++){
		squadless_and_squad_spaces=create_squad_from_squadless(
			squadless_and_squad_spaces,
			squad_builder[i],
			co
		);
	}

	//comand squads only get built to a max of one and are specialist so sit outside of general squad creation
	if (struct_exists(squadless,role[100,5])) && (struct_exists(squadless,role[100,7])) && (struct_exists(squadless,role[100,15])) && (struct_exists(squadless,"Standard Bearer")){
		if (array_length(squadless[$role[100,5]])>0) && (array_length(squadless[$role[100,7]])>0) && (array_length(squadless[$role[100,15]])>0) && (array_length(squadless[$"Standard Bearer"])>0){
			new_squad_index=false;
			if (array_length(empty_squads)>0){
				new_squad_index = empty_squads[0];
				array_delete(empty_squads,0,1);
				create_squad("command_squad", co, false, new_squad_index);
			} else{
				create_squad("command_squad", co, false);
			}
		}
	}
	var sorted_numbers = [];

	//this stops over strenuous repeats should greatly speed up company reshuffle
	for (i=0;i<company_length;i++){
		sorted_numbers[i]=i;
	}
	for (var role_name=0;role_name<role_shuffle_length;role_name++){
		var wanted_role = role_orders[role_name];
		var sort_length = array_length(sorted_numbers)-1
		i=-1;
		while (i < sort_length){
			i++;
			if (role_name == 0){
				if (name[co, sorted_numbers[i]] == ""){
					array_delete(sorted_numbers, i ,1);
					i--;
					sort_length--;
					continue;
				};
			}
			unit = TTRPG[co,sorted_numbers[i]];
			if (unit.role() == wanted_role){
				v++;
				temp_marine_variables(co, sorted_numbers[i] ,v);
				array_delete(sorted_numbers, i ,1);
				i--;
				sort_length--;
				//if unit is part of a squad make sure rest of squad is grouped next to unit			
				if (unit.squad !="none"){
					var cur_squad = unit.squad;
					var r = -1;
					while (r < sort_length){
						r++;
						var squad_unit = TTRPG[co,sorted_numbers[r]];
						if (squad_unit.squad == cur_squad){
							v++;
							temp_marine_variables(co, sorted_numbers[r],v);
							array_delete(sorted_numbers, r, 1);
							r--;
							sort_length--;
						}
					}
				}
			}
		}
	}
	//position 2 in role order
	/*if (global.chapter_name!="Space Wolves") and (global.chapter_name!="Iron Hands"){
	i=0;repeat(300){i+=1;
	    if (role[co][i]=role[100][14]){v+=1;
	        temp_marine_variables(co, i ,v);
	    }
	}*/

	// Return here
	for (i=0;i<array_length(temp_name[co]);i++){
	        race[co][i]=temp_race[co][i];
	        loc[co][i]=temp_loc[co][i];
	        name[co][i]=temp_name[co][i];
	        role[co][i]=temp_role[co][i];
	        lid[co][i]=temp_lid[co][i];
	        wid[co][i]=temp_wid[co][i];
	        wep1[co][i]=temp_wep1[co][i];
	        wep2[co][i]=temp_wep2[co][i];
	        armour[co][i]=temp_armour[co][i];
	        gear[co][i]=temp_gear[co][i];
	        mobi[co][i]=temp_mobi[co][i];
	        hp[co][i]=temp_hp[co][i];
	        chaos[co][i]=temp_chaos[co][i];
	        experience[co][i]=temp_experience[co][i];
	        age[co][i]=temp_age[co][i];
	        spe[co][i]=temp_spe[co][i];
	        god[co][i]=temp_god[co][i];
	        bio[co][i]=temp_bio[co][i];
			TTRPG[co][i] = new TTRPG_stats("chapter", co, i, "blank");
			// if stashed marine struct data load it into new structure
			if (is_string(temp_struct[co][i])){
				TTRPG[co][i].load_json_data(json_parse(temp_struct[co][i]));
				TTRPG[co][i].company = co;
				TTRPG[co][i].marine_number = i;
			}
	}
/*	i=0;repeat(300){i+=1;
	    if (role[co][i]="Death Company"){
	        if (string_count("Dreadnought",armour[co][i])>0){v+=1;
	            temp_marine_variables(co, i ,v);
	        }
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co][i]="Death Company"){
	        if (string_count("Dreadnought",armour[co][i])=0) and (string_count("Terminator",armour[co][i])=0) and (armour[co][i]!="Tartaros"){v+=1;
	            temp_marine_variables(co, i ,v);
	        }
	    }
	}*/

}

function role_hierarchy(){

	var hierarchy = [
			"Chapter Master",
			"Forge Master",
			"Master of Sanctity",
			"Master of the Apothecarion",
			string("Chief {0}",obj_ini.role[100,17]),
			obj_ini.role[100][2],
			obj_ini.role[100][5],
			obj_ini.role[100][14],
			string("{0} Aspirant",obj_ini.role[100][14]),
			"Death Company",
			obj_ini.role[100][16],
			string("{0} Aspirant",obj_ini.role[100][16]),
			"Techpriest",
			obj_ini.role[100][15],
			string("{0} Aspirant",obj_ini.role[100][15]),
			"Sister Hospitaler",
			obj_ini.role[100,17],
			"Codiciery",
			"Lexicanum",
			string("{0} Aspirant",obj_ini.role[100,17]),
			"Standard Bearer",
			obj_ini.role[100][7],
			"Death Company",
			obj_ini.role[100][19],
			obj_ini.role[100][18],		
			obj_ini.role[100][4],
			obj_ini.role[100][3],
			obj_ini.role[100][8],
			obj_ini.role[100][10],
			obj_ini.role[100][9],
			obj_ini.role[100][12],
			"Venerable "+string(obj_ini.role[100][6]),
			obj_ini.role[100][6],
			"Skitarii",
			"Crusader",
			"Ranger",
			"Sister of Battle",
			"Flash Git",
			"Ork Sniper"
		];

	return hierarchy
}